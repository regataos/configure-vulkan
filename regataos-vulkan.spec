%define service_name regataos-vulkan

Name: regataos-vulkan
Version: 4.0
Release: 0
Url: https://regataos.com.br/
Summary: Vulkan for Regata OS
Group: System/GUI/KDE
License: MIT
Source0: regataos-vulkan.sh
Source1: regataos-vulkan.service
Source2: gaming-mode
Source3: gaming-mode.desktop
BuildRequires: xz
BuildRequires: desktop-file-utils
BuildRequires: update-desktop-files
BuildRequires: hicolor-icon-theme
BuildRequires: -post-build-checks
%{?systemd_requires}
BuildRequires:  systemd
BuildRequires:  grep
Requires: vulkan-headers
Requires: vulkan-tools
Requires: vulkan-validationlayers
Requires: libvulkan1
Requires: libvulkan1-32bit
Requires: libvulkan_intel
Requires: libvulkan_intel-32bit
Requires: libvulkan_radeon
Requires: libvulkan_radeon-32bit
Requires: spirv-tools
Requires: spirv-headers
Requires: spirv-cross
Requires: libspirv-cross-c-shared0
Requires: libSPIRV-Tools-suse20
Requires: libSPIRV-Tools-suse20-32bit
Requires: gamemoded
Requires: libgamemode0
Requires: libgamemodeauto0
Requires: libgamemode0-32bit
Requires: libgamemodeauto0-32bit
BuildRoot: %{_tmppath}/%{name}-%{version}-build

%description
This package allows the Regata OS to manage the Vulkan drivers.

%build

%install
install -Dm 755 %{SOURCE0} %{buildroot}%{_bindir}/%{name}.sh
install -Dm 755 %{SOURCE2} %{buildroot}%{_bindir}/gaming-mode
mkdir -p %{buildroot}%{_unitdir}
cp -f %{SOURCE1} %{buildroot}%{_unitdir}/%{service_name}.service

mkdir -p %{buildroot}/opt/regataos-vulkan/icd.d/
mkdir -p %{buildroot}/etc/xdg/autostart/
cp -f %{SOURCE3} %{buildroot}/etc/xdg/autostart/gaming-mode.desktop

%post
%service_add_post %{service_name}.service
systemctl enable  %{service_name}.service || true
systemctl stop    %{service_name}.service || true
systemctl start   %{service_name}.service || true
systemctl restart %{service_name}.service || true

# Fix directory "/tmp/apps-scripts"
if test ! -e /tmp/apps-scripts ; then
  mkdir -p /tmp/apps-scripts
  chmod 777 /tmp/apps-scripts
else
  chmod 777 /tmp/apps-scripts
fi

%clean

%files
%defattr(-,root,root)
%{_bindir}/%{name}.sh
%{_bindir}/gaming-mode
%{_unitdir}/%{service_name}.service
/opt/regataos-vulkan/icd.d/
/etc/xdg/autostart/
/etc/xdg/autostart/gaming-mode.desktop

%changelog
