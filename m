Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC418101B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 06:34:31 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cgd04St5zDqNt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 16:34:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.193; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
X-Greylist: delayed 321 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Mar 2020 16:12:08 AEDT
Received: from smtprelay.hostedemail.com (smtprelay0193.hostedemail.com
 [216.40.44.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cg7D1X1RzDqHV;
 Wed, 11 Mar 2020 16:12:05 +1100 (AEDT)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 02FF11805956A;
 Wed, 11 Mar 2020 05:06:51 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 34C948418;
 Wed, 11 Mar 2020 05:06:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 10, 1, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:230:355:379:541:857:960:966:967:973:982:988:989:1042:1260:1311:1314:1345:1437:1515:1605:1730:1747:1777:1792:1801:2194:2196:2197:2198:2199:2200:2201:2202:2393:2525:2561:2564:2682:2685:2734:2859:2894:2896:2901:2902:2904:2914:2915:2924:2925:2926:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3165:3302:3865:3866:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4225:4250:4321:4384:4385:4395:4559:4605:5007:6261:6299:6630:6737:6738:6742:6743:7688:7875:7903:7974:8549:8568:8784:8957:9025:9038:9149:10004:10394:11026:11657:11914:12043:12048:12295:12296:12297:12438:12555:12679:12688:12690:12697:12702:12712:12713:12723:12726:12731:12737:12740:12895:12903:12986:13160:13161:13184:13229:13894:14096:14394:14877:21060:21080:21221:21324:21325:21433:21451:21611:21627:21740:21771:21772:21773:21774:21789:21795:21796:21811:21939:21965:21990:30009:30010:30012:30036:30054:30055:30065:3007
X-HE-Tag: oven06_19d681dffdc56
X-Filterd-Recvd-Size: 138927
Received: from joe-laptop.perches.com (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed, 11 Mar 2020 05:06:17 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-tegra@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, oprofile-list@lists.sf.net, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-acpi@vger.kernel.org, devel@acpica.org, linux-ide@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bluetooth@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@axis.com, dmaengine@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-gpio@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, nouveau@lists.freedesktop.org,
 greybus-dev@lists.linaro.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-iio@vger.kernel.org,
 linux-rdma@vger.kernel.org, target-devel@vger.kernel.org,
 patches@opensource.cirrus.com, iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-bcache@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-can@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-acenic@sunsite.dk,
 bcm-kernel-feedback-list@broadcom.com, linux-parisc@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-hams@vger.kernel.org,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, wcn36xx@lists.infradead.org,
 b43-dev@lists.infradead.org, linux-nfc@lists.01.org,
 linux-ntb@googlegroups.com, linux-nvme@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 linux-remoteproc@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-s390@vger.kernel.org, esc.storagedev@microsemi.com,
 open-iscsi@googlegroups.com, megaraidlinux.pdl@broadcom.com,
 linux-spi@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-unisoc@lists.infradead.org,
 sparclinux@vger.kernel.org, accessrunner-general@lists.sourceforge.net,
 usb-storage@lists.one-eyed-alien.net, linux-fbdev@vger.kernel.org,
 linux-watchdog@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-nvdimm@lists.01.org, cluster-devel@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, io-uring@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-mm@kvack.org, linux-audit@redhat.com,
 linux-security-module@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, cgroups@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 dccp@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
 mptcp@lists.01.org, lvs-devel@vger.kernel.org, dev@openvswitch.org,
 rds-devel@oss.oracle.com, cake@lists.bufferbloat.net,
 linux-sctp@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-x25@vger.kernel.org, linux-integrity@vger.kernel.org,
 keyrings@vger.kernel.org, selinux@vger.kernel.org,
 alsa-devel@alsa-project.org, clang-built-linux@googlegroups.com
Subject: [PATCH -next 000/491] treewide: use fallthrough;
Date: Tue, 10 Mar 2020 21:51:14 -0700
Message-Id: <cover.1583896344.git.joe@perches.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Mar 2020 16:33:21 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 brcm80211-dev-list.pdl@broadcom.com, devel@driverdev.osuosl.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, oss-drivers@netronome.com,
 linux-hexagon@vger.kernel.org, bridge@lists.linux-foundation.org,
 linux-um@lists.infradead.org, qat-linux@intel.com,
 brcm80211-dev-list@cypress.com, linux-wpan@vger.kernel.org,
 openrisc@lists.librecores.org, linux-alpha@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 ocfs2-devel@oss.oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a new fallthrough pseudo-keyword macro that can be used
to replace the various /* fallthrough */ style comments that are
used to indicate a case label code block is intended to fallthrough
to the next case label block.

See commit 294f69e662d1 ("compiler_attributes.h: Add 'fallthrough'
pseudo keyword for switch/case use")

These patches are intended to allow clang to detect missing
switch/case fallthrough uses.

Do a depth-first pass on the MAINTAINERS file and find the various
F: pattern files and convert the fallthrough comments to fallthrough;
for all files matched by all  F: patterns in in each section.

Done via the perl script below and the previously posted
cvt_fallthrough.pl script.

Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/

These patches are based on next-20200310 and are available in

git://repo.or.cz/linux-2.6/trivial-mods.git in branch 20200310_fallthrough_2

$ cat commit_fallthrough.pl
#!/usr/bin/env perl

use sort 'stable';

#
# Reorder a sorted array so file entries are before directory entries
# depends on a trailing / for directories
# so:
#   foo/
#   foo/bar.c
# becomes
#   foo/bar.c
#   foo/
#
sub file_before_directory {
    my ($array_ref) = (@_);

    my $count = scalar(@$array_ref);

    for (my $i = 1; $i < $count; $i++) {
	if (substr(@$array_ref[$i - 1], -1) eq '/' &&
	    substr(@$array_ref[$i], 0, length(@$array_ref[$i - 1])) eq @$array_ref[$i - 1]) {
		my $string = @$array_ref[$i - 1];
		@$array_ref[$i - 1] = @$array_ref[$i];
		@$array_ref[$i] = $string;
	    }
	}
}

sub uniq {
    my (@parms) = @_;

    my %saw;
    @parms = grep(!$saw{$_}++, @parms);

    return @parms;
}

# Get all the F: file patterns in MAINTAINERS that could be a .[ch] file
my $maintainer_patterns = `grep -P '^F:\\s+' MAINTAINERS`;
my @patterns = split('\n', $maintainer_patterns);
s/^F:\s*// for @patterns;
@patterns = grep(!/^(?:Documentation|tools|scripts)\//, @patterns);
@patterns = grep(!/\.(?:dtsi?|rst|config)$/, @patterns);
@patterns = sort @patterns;
@patterns = sort { $b =~ tr/\//\// cmp $a =~ tr/\//\// } @patterns;
file_before_directory(\@patterns);

my %sections_done;

foreach my $pattern (@patterns) {

# Find the files the pattern matches
    my $pattern_files = `git ls-files -- $pattern`;
    my @new_patterns = split('\n', $pattern_files);
    $pattern_files = join(' ', @new_patterns);
    next if ($pattern_files =~ /^\s*$/);

# Find the section the first file matches
    my $pattern_file = @new_patterns[0];
    my $section_output = `./scripts/get_maintainer.pl --nogit --nogit-fallback --sections --pattern-depth=1 $pattern_file`;
    my @section = split('\n', $section_output);
    my $section_header = @section[0];

    print("Section: <$section_header>\n");

# Skip the section if it's already done
    print("Already done '$section_header'\n") if ($sections_done{$section_header});
    next if ($sections_done{$section_header}++);

# Find all the .[ch] files in all F: lines in that section
    my @new_section;
    foreach my $line (@section) {
	last if ($line =~ /^\s*$/);
	push(@new_section, $line);
    }
    @section = grep(/^F:/, @new_section);
    s/^F:\s*// for @section;

    @section = grep(!/^(?:Documentation|tools|scripts)\//, @section);
    @section = grep(!/\.(?:dtsi?|rst|config)$/, @section);
    @section = sort @section;
    @section = uniq(@section);

    my $section_files = join(' ', @section);

    print("section_files: <$section_files>\n");

    next if ($section_files =~ /^\s*$/);

    my $cvt_files = `git ls-files -- $section_files`;
    my @files = split('\n', $cvt_files);

    @files = grep(!/^(?:Documentation|tools|scripts)\//, @files);
    @files = grep(!/\.(?:dtsi?|rst|config)$/, @files);
    @files = grep(/\.[ch]$/, @files);
    @files = sort @files;
    @files = uniq(@files);

    $cvt_files = join(' ', @files);
    print("files: <$cvt_files>\n");

    next if (scalar(@files) < 1);

# Convert fallthroughs for all [.ch] files in the section
    print("doing cvt_fallthrough.pl -- $cvt_files\n");

    `cvt_fallthrough.pl -- $cvt_files`;

# If nothing changed, nothing to commit
    `git diff-index --quiet HEAD --`;
    next if (!$?);

# Commit the changes
    my $fh;

    open($fh, "+>", "cvt_fallthrough.commit_msg") or die "$0: can't create temporary file: $!\n";
    print $fh <<EOF
$section_header: Use fallthrough;

Convert the various uses of fallthrough comments to fallthrough;

Done via script
Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/
EOF
;
    close $fh;

    `git commit -s -a -F cvt_fallthrough.commit_msg`;
}

Joe Perches (491):
  MELLANOX ETHERNET INNOVA DRIVERS: Use fallthrough;
  MARVELL OCTEONTX2 RVU ADMIN FUNCTION DRIVER: Use fallthrough;
  MELLANOX MLX5 core VPI driver: Use fallthrough;
  PERFORMANCE EVENTS SUBSYSTEM: Use fallthrough;
  ARM/UNIPHIER ARCHITECTURE: Use fallthrough;
  ARM/RISCPC ARCHITECTURE: Use fallthrough;
  KERNEL VIRTUAL MACHINE FOR ARM/ARM64 (KVM/arm, KVM/arm64): Use
    fallthrough;
  ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE: Use fallthrough;
  ARM/Amlogic Meson SoC support: Use fallthrough;
  ARM/SAMSUNG EXYNOS ARM ARCHITECTURES: Use fallthrough;
  ARM/QUALCOMM SUPPORT: Use fallthrough;
  ARM/ZTE ARCHITECTURE: Use fallthrough;
  INGENIC JZ47xx SoCs: Use fallthrough;
  DECSTATION PLATFORM SUPPORT: Use fallthrough;
  KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips): Use fallthrough;
  KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc): Use fallthrough;
  CELL BROADBAND ENGINE ARCHITECTURE: Use fallthrough;
  KERNEL VIRTUAL MACHINE for s390 (KVM/s390): Use fallthrough;
  Hyper-V CORE AND DRIVERS: Use fallthrough;
  XEN HYPERVISOR INTERFACE: Use fallthrough;
  KERNEL VIRTUAL MACHINE FOR X86 (KVM/x86): Use fallthrough;
  X86 MCE INFRASTRUCTURE: Use fallthrough;
  AMD KFD: Use fallthrough;
  AMD DISPLAY CORE: Use fallthrough;
  AMD POWERPLAY: Use fallthrough;
  INTEL GVT-g DRIVERS (Intel GPU Virtualization): Use fallthrough;
  AMD XGBE DRIVER: Use fallthrough;
  BROADCOM BNX2X 10 GIGABIT ETHERNET DRIVER: Use fallthrough;
  BROADCOM BNXT_EN 50 GIGABIT ETHERNET DRIVER: Use fallthrough;
  BROADCOM GENET ETHERNET DRIVER: Use fallthrough;
  BROCADE BNA 10 GIGABIT ETHERNET DRIVER: Use fallthrough;
  CAVIUM LIQUIDIO NETWORK DRIVER: Use fallthrough;
  ARM/CAVIUM THUNDER NETWORK DRIVER: Use fallthrough;
  CXGB3 ETHERNET DRIVER (CXGB3): Use fallthrough;
  CXGB4 ETHERNET DRIVER (CXGB4): Use fallthrough;
  CXGB4VF ETHERNET DRIVER (CXGB4VF): Use fallthrough;
  CISCO VIC ETHERNET NIC DRIVER: Use fallthrough;
  TULIP NETWORK DRIVERS: Use fallthrough;
  Emulex 10Gbps NIC BE2, BE3-R, Lancer, Skyhawk-R DRIVER (be2net): Use
    fallthrough;
  DPAA2 ETHERNET DRIVER: Use fallthrough;
  HISILICON NETWORK SUBSYSTEM 3 DRIVER (HNS3): Use fallthrough;
  EHEA (IBM pSeries eHEA 10Gb ethernet adapter) DRIVER: Use fallthrough;
  INTEL ETHERNET DRIVERS: Use fallthrough;
  MELLANOX ETHERNET DRIVER (mlx4_en): Use fallthrough;
  MELLANOX MLX4 core VPI driver: Use fallthrough;
  MELLANOX FIRMWARE FLASH LIBRARY (mlxfw): Use fallthrough;
  MELLANOX ETHERNET SWITCH DRIVERS: Use fallthrough;
  NETXEN (1/10) GbE SUPPORT: Use fallthrough;
  QLOGIC QL4xxx ETHERNET DRIVER: Use fallthrough;
  QLOGIC QLCNIC (1/10)Gb ETHERNET DRIVER: Use fallthrough;
  SAMSUNG SXGBE DRIVERS: Use fallthrough;
  STMMAC ETHERNET DRIVER: Use fallthrough;
  QUALCOMM ATHEROS ATH10K WIRELESS DRIVER: Use fallthrough;
  QUALCOMM ATHEROS ATH11K WIRELESS DRIVER: Use fallthrough;
  ATHEROS ATH5K WIRELESS DRIVER: Use fallthrough;
  ATHEROS ATH6KL WIRELESS DRIVER: Use fallthrough;
  QUALCOMM ATHEROS ATH9K WIRELESS DRIVER: Use fallthrough;
  CARL9170 LINUX COMMUNITY WIRELESS DRIVER: Use fallthrough;
  QUALCOMM WCN36XX WIRELESS DRIVER: Use fallthrough;
  B43 WIRELESS DRIVER: Use fallthrough;
  B43LEGACY WIRELESS DRIVER: Use fallthrough;
  BROADCOM BRCM80211 IEEE802.11n WIRELESS DRIVER: Use fallthrough;
  INTEL WIRELESS 3945ABG/BG, 4965AGN (iwlegacy): Use fallthrough;
  INTEL WIRELESS WIFI LINK (iwlwifi): Use fallthrough;
  ORINOCO DRIVER: Use fallthrough;
  PRISM54 WIRELESS DRIVER: Use fallthrough;
  MARVELL MWIFIEX WIRELESS DRIVER: Use fallthrough;
  MEDIATEK MT76 WIRELESS LAN DRIVER: Use fallthrough;
  MEDIATEK MT7601U WIRELESS LAN DRIVER: Use fallthrough;
  RALINK RT2X00 WIRELESS LAN DRIVER: Use fallthrough;
  RTL8XXXU WIRELESS DRIVER (rtl8xxxu): Use fallthrough;
  REALTEK WIRELESS DRIVER (rtlwifi family): Use fallthrough;
  REALTEK WIRELESS DRIVER (rtw88): Use fallthrough;
  TRACING: Use fallthrough;
  OPROFILE: Use fallthrough;
  PTRACE SUPPORT: Use fallthrough;
  HIBERNATION (aka Software Suspend, aka swsusp): Use fallthrough;
  ARM PMU PROFILING AND DEBUGGING: Use fallthrough;
  ARM/ARTPEC MACHINE SUPPORT: Use fallthrough;
  ARM/Marvell Dove/MV78xx0/Orion SOC support: Use fallthrough;
  MMP SUPPORT: Use fallthrough;
  PXA2xx/PXA3xx SUPPORT: Use fallthrough;
  ARM/RDA MICRO ARCHITECTURE: Use fallthrough;
  ARM/Rockchip SoC support: Use fallthrough;
  ARM/NOMADIK/U300/Ux500 ARCHITECTURES: Use fallthrough;
  PS3 PLATFORM SUPPORT: Use fallthrough;
  LINUX FOR POWER MACINTOSH: Use fallthrough;
  SCx200 CPU SUPPORT: Use fallthrough;
  CAVIUM OCTEON-TX CRYPTO DRIVER: Use fallthrough;
  ARM MALI-DP DRM DRIVER: Use fallthrough;
  DRM DRIVER FOR AST SERVER GRAPHICS CHIPS: Use fallthrough;
  DRM DRIVERS FOR BRIDGE CHIPS: Use fallthrough;
  DRM DRIVERS FOR EXYNOS: Use fallthrough;
  DRM DRIVERS FOR FREESCALE DCU: Use fallthrough;
  INTEL DRM DRIVERS (excluding Poulsbo, Moorestown and derivative
    chipsets): Use fallthrough;
  DRM DRIVERS FOR FREESCALE IMX: Use fallthrough;
  DRM DRIVERS FOR AMLOGIC SOCS: Use fallthrough;
  DRM DRIVER FOR MSM ADRENO GPU: Use fallthrough;
  DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS: Use fallthrough;
  DRM DRIVERS FOR TI OMAP: Use fallthrough;
  RADEON and AMDGPU DRM DRIVERS: Use fallthrough;
  DRM DRIVER FOR SAVAGE VIDEO CARDS: Use fallthrough;
  DRM DRIVERS FOR ALLWINNER A10: Use fallthrough;
  DRM DRIVERS FOR NVIDIA TEGRA: Use fallthrough;
  DRM DRIVERS FOR TI LCDC: Use fallthrough;
  DRM TTM SUBSYSTEM: Use fallthrough;
  DRM DRIVERS FOR XEN: Use fallthrough;
  BROADCOM NETXTREME-E ROCE DRIVER: Use fallthrough;
  CXGB4 IWARP RNIC DRIVER (IW_CXGB4): Use fallthrough;
  INTEL RDMA RNIC DRIVER: Use fallthrough;
  MELLANOX MLX4 IB driver: Use fallthrough;
  MELLANOX MLX5 IB driver: Use fallthrough;
  EMULEX ONECONNECT ROCE DRIVER: Use fallthrough;
  QLOGIC QL4xxx RDMA DRIVER: Use fallthrough;
  QIB DRIVER: Use fallthrough;
  VMWARE PVRDMA DRIVER: Use fallthrough;
  SOFT-ROCE DRIVER (rxe): Use fallthrough;
  SOFT-IWARP DRIVER (siw): Use fallthrough;
  ISCSI EXTENSIONS FOR RDMA (ISER) INITIATOR: Use fallthrough;
  SIANO DVB DRIVER: Use fallthrough;
  VIDEOBUF2 FRAMEWORK: Use fallthrough;
  SAMSUNG S5C73M3 CAMERA DRIVER: Use fallthrough;
  SMIA AND SMIA++ IMAGE SENSOR DRIVER: Use fallthrough;
  BTTV VIDEO4LINUX DRIVER: Use fallthrough;
  CX88 VIDEO4LINUX DRIVER: Use fallthrough;
  MEDIA DRIVERS FOR DIGITAL DEVICES PCIE DEVICES: Use fallthrough;
  MOTION EYE VAIO PICTUREBOOK CAMERA DRIVER: Use fallthrough;
  SAA7134 VIDEO4LINUX DRIVER: Use fallthrough;
  SOFTLOGIC 6x10 MPEG CODEC: Use fallthrough;
  CODA V4L2 MEM2MEM DRIVER: Use fallthrough;
  SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS: Use
    fallthrough;
  CAFE CMOS INTEGRATED CAMERA CONTROLLER DRIVER: Use fallthrough;
  OMAP IMAGING SUBSYSTEM (OMAP3 ISP and OMAP4 ISS): Use fallthrough;
  VICODEC VIRTUAL CODEC DRIVER: Use fallthrough;
  VIVID VIRTUAL VIDEO DRIVER: Use fallthrough;
  SI4713 FM RADIO TRANSMITTER I2C DRIVER: Use fallthrough;
  CEC FRAMEWORK: Use fallthrough;
  DVB_USB_AF9015 MEDIA DRIVER: Use fallthrough;
  DVB_USB_GL861 MEDIA DRIVER: Use fallthrough;
  LME2510 MEDIA DRIVER: Use fallthrough;
  DVB_USB_MXL111SF MEDIA DRIVER: Use fallthrough;
  EM28XX VIDEO4LINUX DRIVER: Use fallthrough;
  GO7007 MPEG CODEC: Use fallthrough;
  GSPCA SN9C20X SUBDRIVER: Use fallthrough;
  GSPCA USB WEBCAM DRIVER: Use fallthrough;
  PULSE8-CEC DRIVER: Use fallthrough;
  PWC WEBCAM DRIVER: Use fallthrough;
  TM6000 VIDEO4LINUX DRIVER: Use fallthrough;
  USB VIDEO CLASS: Use fallthrough;
  ONENAND FLASH DRIVER: Use fallthrough;
  BROADCOM B53 ETHERNET SWITCH DRIVER: Use fallthrough;
  MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER: Use fallthrough;
  MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER: Use fallthrough;
  8390 NETWORK DRIVERS [WD80x3/SMC-ELITE, SMC-ULTRA, NE2000, 3C503,
    etc.]: Use fallthrough;
  ALACRITECH GIGABIT ETHERNET DRIVER: Use fallthrough;
  ACENIC DRIVER: Use fallthrough;
  BROADCOM BNX2 GIGABIT ETHERNET DRIVER: Use fallthrough;
  BROADCOM TG3 GIGABIT ETHERNET DRIVER: Use fallthrough;
  ATMEL MACB ETHERNET DRIVER: Use fallthrough;
  FREESCALE QORIQ DPAA ETHERNET DRIVER: Use fallthrough;
  FREESCALE QORIQ DPAA FMAN DRIVER: Use fallthrough;
  FREESCALE QUICC ENGINE UCC ETHERNET DRIVER: Use fallthrough;
  HISILICON NETWORK SUBSYSTEM DRIVER: Use fallthrough;
  LINUX FOR POWERPC (32-BIT AND 64-BIT): Use fallthrough;
  MARVELL MVNETA ETHERNET DRIVER: Use fallthrough;
  MARVELL GIGABIT ETHERNET DRIVERS (skge/sky2): Use fallthrough;
  MEDIATEK ETHERNET DRIVER: Use fallthrough;
  MICROCHIP LAN743X ETHERNET DRIVER: Use fallthrough;
  MICROSEMI ETHERNET SWITCH DRIVER: Use fallthrough;
  NATSEMI ETHERNET DRIVER (DP8381x): Use fallthrough;
  NETERION 10GbE DRIVERS (s2io/vxge): Use fallthrough;
  NETRONOME ETHERNET DRIVERS: Use fallthrough;
  QLOGIC QLA3XXX NETWORK DRIVER: Use fallthrough;
  8169 10/100/1000 GIGABIT ETHERNET DRIVER: Use fallthrough;
  ROCKER DRIVER: Use fallthrough;
  SFC NETWORK DRIVER: Use fallthrough;
  SIS 900/7016 FAST ETHERNET DRIVER: Use fallthrough;
  SOCIONEXT (SNI) NETSEC NETWORK DRIVER: Use fallthrough;
  TI ETHERNET SWITCH DRIVER (CPSW): Use fallthrough;
  TLAN NETWORK DRIVER: Use fallthrough;
  SPIDERNET NETWORK DRIVER for CELL: Use fallthrough;
  INTEL WIRELESS WIMAX CONNECTION 2400: Use fallthrough;
  ATMEL WIRELESS DRIVER: Use fallthrough;
  TI WILINK WIRELESS DRIVERS: Use fallthrough;
  USB ZD1201 DRIVER: Use fallthrough;
  PCI DRIVER FOR IMX6: Use fallthrough;
  ANALOG DEVICES INC IIO DRIVERS: Use fallthrough;
  HANTRO VPU CODEC DRIVER: Use fallthrough;
  MEDIA DRIVERS FOR FREESCALE IMX: Use fallthrough;
  SOC-CAMERA V4L2 SUBSYSTEM: Use fallthrough;
  USB VISION DRIVER: Use fallthrough;
  PARISC ARCHITECTURE: Use fallthrough;
  MICROCHIP USBA UDC DRIVER: Use fallthrough;
  FREESCALE USB PERIPHERAL DRIVERS: Use fallthrough;
  USB TYPEC PORT CONTROLLER DRIVERS: Use fallthrough;
  RADEON FRAMEBUFFER DISPLAY DRIVER: Use fallthrough;
  ARC FRAMEBUFFER DRIVER: Use fallthrough;
  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER: Use fallthrough;
  OMAP FRAMEBUFFER SUPPORT: Use fallthrough;
  OMAP DISPLAY SUBSYSTEM and FRAMEBUFFER SUPPORT (DSS2): Use
    fallthrough;
  S3 SAVAGE FRAMEBUFFER DRIVER: Use fallthrough;
  SIS FRAMEBUFFER DRIVER: Use fallthrough;
  VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER: Use fallthrough;
  CAN NETWORK DRIVERS: Use fallthrough;
  WOLFSON MICROELECTRONICS DRIVERS: Use fallthrough;
  DIALOG SEMICONDUCTOR DRIVERS: Use fallthrough;
  MEDIA INPUT INFRASTRUCTURE (V4L/DVB): Use fallthrough;
  CAN NETWORK LAYER: Use fallthrough;
  HSI SUBSYSTEM: Use fallthrough;
  MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND SDIO SUBSYSTEM: Use
    fallthrough;
  KERNEL NFSD, SUNRPC, AND LOCKD SERVERS: Use fallthrough;
  SOFTWARE RAID (Multiple Disks) SUPPORT: Use fallthrough;
  SPI SUBSYSTEM: Use fallthrough;
  NFS, SUNRPC, AND LOCKD CLIENTS: Use fallthrough;
  TC subsystem: Use fallthrough;
  FCOE SUBSYSTEM (libfc, libfcoe, fcoe): Use fallthrough;
  CRYPTO API: Use fallthrough;
  BPF (Safe dynamic programs and tools): Use fallthrough;
  OMAP USB SUPPORT: Use fallthrough;
  OMAP1 SUPPORT: Use fallthrough;
  OMAP2+ SUPPORT: Use fallthrough;
  ARM SUB-ARCHITECTURES: Use fallthrough;
  M68K ON APPLE MACINTOSH: Use fallthrough;
  PCI SUBSYSTEM: Use fallthrough;
  FPU EMULATOR: Use fallthrough;
  X86 MM: Use fallthrough;
  NETWORKING [IPv4/IPv6]: Use fallthrough;
  USER-MODE LINUX (UML): Use fallthrough;
  ACPI COMPONENT ARCHITECTURE (ACPICA): Use fallthrough;
  FIRMWARE LOADER (request_firmware): Use fallthrough;
  ATA OVER ETHERNET (AOE) DRIVER: Use fallthrough;
  DRBD DRIVER: Use fallthrough;
  PARIDE DRIVERS FOR PARALLEL PORT IDE DEVICES: Use fallthrough;
  FLASH ADAPTER DRIVER (IBM Flash Adapter 900GB Full Height PCI Flash
    Card): Use fallthrough;
  XEN BLOCK SUBSYSTEM: Use fallthrough;
  AGPGART DRIVER: Use fallthrough;
  IPMI SUBSYSTEM: Use fallthrough;
  TI DAVINCI SERIES CLOCK DRIVER: Use fallthrough;
  H8/300 ARCHITECTURE: Use fallthrough;
  VIRTIO CORE AND NET DRIVERS: Use fallthrough;
  DRM DRIVERS AND MISC GPU PATCHES: Use fallthrough;
  USB HID/HIDBP DRIVERS (USB KEYBOARDS, MICE, REMOTE CONTROLS, ...): Use
    fallthrough;
  ARM/CORESIGHT FRAMEWORK AND DRIVERS: Use fallthrough;
  INTEL(R) TRACE HUB: Use fallthrough;
  I2C SUBSYSTEM HOST DRIVERS: Use fallthrough;
  ARM/ZYNQ ARCHITECTURE: Use fallthrough;
  I3C DRIVER FOR SYNOPSYS DESIGNWARE: Use fallthrough;
  SENSIRION SPS30 AIR POLLUTION SENSOR DRIVER: Use fallthrough;
  IIO DIGITAL POTENTIOMETER DAC: Use fallthrough;
  ASAHI KASEI AK8974 DRIVER: Use fallthrough;
  HFI1 DRIVER: Use fallthrough;
  RDMAVT - RDMA verbs software: Use fallthrough;
  ISCSI EXTENSIONS FOR RDMA (ISER) TARGET: Use fallthrough;
  OPA-VNIC DRIVER: Use fallthrough;
  FLYSKY FSIA6B RC RECEIVER: Use fallthrough;
  WACOM PROTOCOL 4 SERIAL TABLETS: Use fallthrough;
  ATMEL MAXTOUCH DRIVER: Use fallthrough;
  ISDN/mISDN SUBSYSTEM: Use fallthrough;
  BCACHE (BLOCK LAYER CACHE): Use fallthrough;
  DEVICE-MAPPER (LVM): Use fallthrough;
  TI FLASH MEDIA MEMORYSTICK/MMC DRIVERS: Use fallthrough;
  LSILOGIC MPT FUSION DRIVERS (FC/SAS/SPI): Use fallthrough;
  INTEL MIC DRIVERS (mic): Use fallthrough;
  SGI GRU DRIVER: Use fallthrough;
  SGI XP/XPC/XPNET DRIVER: Use fallthrough;
  BLOCK2MTD DRIVER: Use fallthrough;
  PHRAM MTD DRIVER: Use fallthrough;
  NAND FLASH SUBSYSTEM: Use fallthrough;
  SPI NOR SUBSYSTEM: Use fallthrough;
  UNSORTED BLOCK IMAGES (UBI): Use fallthrough;
  APPLETALK NETWORK LAYER: Use fallthrough;
  ARCNET NETWORK LAYER: Use fallthrough;
  BONDING DRIVER: Use fallthrough;
  MEDIATEK SWITCH DRIVER: Use fallthrough;
  NETWORKING [DSA]: Use fallthrough;
  BAYCOM/HDLCDRV DRIVERS FOR AX.25: Use fallthrough;
  IEEE 802.15.4 SUBSYSTEM: Use fallthrough;
  NETDEVSIM: Use fallthrough;
  ANALOG DEVICES INC ADIN DRIVER: Use fallthrough;
  PTP HARDWARE CLOCK SUPPORT: Use fallthrough;
  SFF/SFP/SFP+ MODULE SUPPORT: Use fallthrough;
  ETHERNET PHY LIBRARY: Use fallthrough;
  USB LAN78XX ETHERNET DRIVER: Use fallthrough;
  USB PEGASUS DRIVER: Use fallthrough;
  USB RTL8150 DRIVER: Use fallthrough;
  USB "USBNET" DRIVER FRAMEWORK: Use fallthrough;
  USB NETWORKING DRIVERS: Use fallthrough;
  FRAME RELAY DLCI/FRAD (Sangoma drivers too): Use fallthrough;
  MAC80211: Use fallthrough;
  RAYLINK/WEBGEAR 802.11 WIRELESS LAN DRIVER: Use fallthrough;
  NETWORKING DRIVERS (WIRELESS): Use fallthrough;
  XEN NETWORK BACKEND DRIVER: Use fallthrough;
  NVM EXPRESS FC TRANSPORT DRIVERS: Use fallthrough;
  NVM EXPRESS DRIVER: Use fallthrough;
  NVM EXPRESS TARGET DRIVER: Use fallthrough;
  ACPI: Use fallthrough;
  BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE: Use fallthrough;
  PIN CONTROLLER - INTEL: Use fallthrough;
  MIPS: Use fallthrough;
  X86 PLATFORM DRIVERS: Use fallthrough;
  CHROMEOS EC SUBDRIVERS: Use fallthrough;
  POWER SUPPLY CLASS/SUBSYSTEM and DRIVERS: Use fallthrough;
  S390 COMMON I/O LAYER: Use fallthrough;
  S390 VFIO AP DRIVER: Use fallthrough;
  S390 ZCRYPT DRIVER: Use fallthrough;
  S390 IUCV NETWORK LAYER: Use fallthrough;
  S390 NETWORK DRIVERS: Use fallthrough;
  S390 ZFCP DRIVER: Use fallthrough;
  AACRAID SCSI RAID DRIVER: Use fallthrough;
  AIC7XXX / AIC79XX SCSI DRIVER: Use fallthrough;
  NCR 5380 SCSI DRIVERS: Use fallthrough;
  Emulex 10Gbps iSCSI - OneConnect DRIVER: Use fallthrough;
  BROCADE BFA FC SCSI DRIVER: Use fallthrough;
  BROADCOM BNX2FC 10 GIGABIT FCOE DRIVER: Use fallthrough;
  CXGB3 ISCSI DRIVER (CXGB3I): Use fallthrough;
  CXGB4 ISCSI DRIVER (CXGB4I): Use fallthrough;
  CXLFLASH (IBM Coherent Accelerator Processor Interface CAPI Flash)
    SCSI DRIVER: Use fallthrough;
  HISILICON SAS Controller: Use fallthrough;
  IBM Power Virtual SCSI Device Target Driver: Use fallthrough;
  INTEL C600 SERIES SAS CONTROLLER DRIVER: Use fallthrough;
  EMULEX/BROADCOM LPFC FC/FCOE SCSI DRIVER: Use fallthrough;
  MEGARAID SCSI/SAS DRIVERS: Use fallthrough;
  NINJA SCSI-3 / NINJA SCSI-32Bi (16bit/CardBus) PCMCIA SCSI HOST
    ADAPTER DRIVER: Use fallthrough;
  QLOGIC QLA2XXX FC-SCSI DRIVER: Use fallthrough;
  QLOGIC QLA4XXX iSCSI DRIVER: Use fallthrough;
  MICROSEMI SMART ARRAY SMARTPQI DRIVER (smartpqi): Use fallthrough;
  LSILOGIC/SYMBIOS/NCR 53C8XX and 53C1010 PCI-SCSI drivers: Use
    fallthrough;
  UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER: Use fallthrough;
  STAGING - COMEDI: Use fallthrough;
  DPAA2 ETHERNET SWITCH DRIVER: Use fallthrough;
  QLOGIC QLGE 10Gb ETHERNET DRIVER: Use fallthrough;
  STAGING - REALTEK RTL8188EU DRIVERS: Use fallthrough;
  STAGING - REALTEK RTL8712U DRIVERS: Use fallthrough;
  STAGING - VIA VT665X DRIVERS: Use fallthrough;
  HYPERVISOR VIRTUAL CONSOLE DRIVER: Use fallthrough;
  SYNOPSYS ARC ARCHITECTURE: Use fallthrough;
  MICROCHIP AT91 SERIAL DRIVER: Use fallthrough;
  KGDB / KDB /debug_core: Use fallthrough;
  TEGRA SERIAL DRIVER: Use fallthrough;
  TTY LAYER: Use fallthrough;
  CONEXANT ACCESSRUNNER USB DRIVER: Use fallthrough;
  USB CYPRESS C67X00 DRIVER: Use fallthrough;
  DESIGNWARE USB3 DRD IP DRIVER: Use fallthrough;
  USB GADGET/PERIPHERAL SUBSYSTEM: Use fallthrough;
  USB EHCI DRIVER: Use fallthrough;
  USB ISP116X DRIVER: Use fallthrough;
  USB OHCI DRIVER: Use fallthrough;
  USB XHCI DRIVER: Use fallthrough;
  MEDIATEK USB3 DRD IP DRIVER: Use fallthrough;
  MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER: Use fallthrough;
  USB PHY LAYER: Use fallthrough;
  USB SERIAL SUBSYSTEM: Use fallthrough;
  USB ATTACHED SCSI: Use fallthrough;
  USB MASS STORAGE DRIVER: Use fallthrough;
  USB OVER IP DRIVER: Use fallthrough;
  ADP8860 BACKLIGHT DRIVER (ADP8860/ADP8861/ADP8863): Use fallthrough;
  MICROCHIP LCDFB DRIVER: Use fallthrough;
  FREESCALE DIU FRAMEBUFFER DRIVER: Use fallthrough;
  SAMSUNG FRAMEBUFFER DRIVER: Use fallthrough;
  VIRTUAL BOX GUEST DEVICE DRIVER: Use fallthrough;
  FANOTIFY: Use fallthrough;
  MULTIFUNCTION DEVICES (MFD): Use fallthrough;
  MULTIPLEXER SUBSYSTEM: Use fallthrough;
  VOLTAGE AND CURRENT REGULATOR FRAMEWORK: Use fallthrough;
  RESET CONTROLLER FRAMEWORK: Use fallthrough;
  SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC): Use
    fallthrough;
  CEPH COMMON CODE (LIBCEPH): Use fallthrough;
  GPIO SUBSYSTEM: Use fallthrough;
  GREYBUS SUBSYSTEM: Use fallthrough;
  INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN) DRIVERS: Use
    fallthrough;
  MEMORY TECHNOLOGY DEVICES (MTD): Use fallthrough;
  ETHERNET BRIDGE: Use fallthrough;
  PIN CONTROL SUBSYSTEM: Use fallthrough;
  NFC SUBSYSTEM: Use fallthrough;
  REAL TIME CLOCK (RTC) SUBSYSTEM: Use fallthrough;
  CPU FREQUENCY SCALING FRAMEWORK: Use fallthrough;
  NOHZ, DYNTICKS SUPPORT: Use fallthrough;
  SONICS SILICON BACKPLANE DRIVER (SSB): Use fallthrough;
  USB SUBSYSTEM: Use fallthrough;
  9P FILE SYSTEM: Use fallthrough;
  BLUETOOTH SUBSYSTEM: Use fallthrough;
  NETFILTER: Use fallthrough;
  PHONET PROTOCOL: Use fallthrough;
  SCTP PROTOCOL: Use fallthrough;
  AFS FILESYSTEM: Use fallthrough;
  EROFS FILE SYSTEM: Use fallthrough;
  F2FS FILE SYSTEM: Use fallthrough;
  FILESYSTEM DIRECT ACCESS (DAX): Use fallthrough;
  HARDWARE MONITORING: Use fallthrough;
  INFINIBAND SUBSYSTEM: Use fallthrough;
  NILFS2 FILESYSTEM: Use fallthrough;
  RXRPC SOCKETS (AF_RXRPC): Use fallthrough;
  ATM: Use fallthrough;
  AUDIT SUBSYSTEM: Use fallthrough;
  BTRFS FILE SYSTEM: Use fallthrough;
  CAPABILITIES: Use fallthrough;
  HEWLETT-PACKARD SMART ARRAY RAID DRIVER (hpsa): Use fallthrough;
  DCCP PROTOCOL: Use fallthrough;
  DEVLINK: Use fallthrough;
  XFS FILESYSTEM: Use fallthrough;
  FRAMEBUFFER LAYER: Use fallthrough;
  FILE LOCKING (flock() and fcntl()/lockf()): Use fallthrough;
  FIREWIRE SUBSYSTEM: Use fallthrough;
  FILESYSTEMS (VFS and infrastructure): Use fallthrough;
  FUTEX SUBSYSTEM: Use fallthrough;
  HID CORE LAYER: Use fallthrough;
  I2C SUBSYSTEM: Use fallthrough;
  NETWORKING DRIVERS: Use fallthrough;
  NETWORKING [GENERAL]: Use fallthrough;
  KEYS/KEYRINGS: Use fallthrough;
  LIGHTNVM PLATFORM SUPPORT: Use fallthrough;
  PARALLEL PORT SUBSYSTEM: Use fallthrough;
  SCHEDULER: Use fallthrough;
  SELINUX SECURITY MODULE: Use fallthrough;
  THERMAL: Use fallthrough;
  TIMEKEEPING, CLOCKSOURCE CORE, NTP, ALARMTIMER: Use fallthrough;
  VFIO DRIVER: Use fallthrough;
  VIRTIO BLOCK AND SCSI DRIVERS: Use fallthrough;
  WATCHDOG DEVICE DRIVERS: Use fallthrough;
  SOUND: Use fallthrough;
  INTEGRITY MEASUREMENT ARCHITECTURE (IMA): Use fallthrough;
  ALPHA PORT: Use fallthrough;
  ARM PORT: Use fallthrough;
  ARM64 PORT (AARCH64 ARCHITECTURE): Use fallthrough;
  C6X ARCHITECTURE: Use fallthrough;
  C-SKY ARCHITECTURE: Use fallthrough;
  QUALCOMM HEXAGON ARCHITECTURE: Use fallthrough;
  IA64 (Itanium) PLATFORM: Use fallthrough;
  MICROBLAZE ARCHITECTURE: Use fallthrough;
  ANDES ARCHITECTURE: Use fallthrough;
  OPENRISC ARCHITECTURE: Use fallthrough;
  RISC-V ARCHITECTURE: Use fallthrough;
  S390: Use fallthrough;
  SUPERH: Use fallthrough;
  SPARC + UltraSPARC (sparc/sparc64): Use fallthrough;
  UNICORE32 ARCHITECTURE: Use fallthrough;
  X86 ARCHITECTURE (32-BIT AND 64-BIT): Use fallthrough;
  TENSILICA XTENSA PORT (xtensa): Use fallthrough;
  ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API: Use fallthrough;
  LIBATA SATA AHCI PLATFORM devices support: Use fallthrough;
  LIBATA PATA DRIVERS: Use fallthrough;
  LIBATA SATA PROMISE TX2/TX4 CONTROLLER DRIVER: Use fallthrough;
  LIBATA SUBSYSTEM (Serial and Parallel ATA drivers): Use fallthrough;
  PARALLEL LCD/KEYPAD PANEL DRIVER: Use fallthrough;
  FLOPPY DRIVER: Use fallthrough;
  RADOS BLOCK DEVICE (RBD): Use fallthrough;
  STEC S1220 SKD DRIVER: Use fallthrough;
  BLOCK LAYER: Use fallthrough;
  BLUETOOTH DRIVERS: Use fallthrough;
  CHAR and MISC DRIVERS: Use fallthrough;
  COMMON CLK FRAMEWORK: Use fallthrough;
  EDAC-AMD64: Use fallthrough;
  EDAC-PND2: Use fallthrough;
  IDE/ATAPI DRIVERS: Use fallthrough;
  IDE SUBSYSTEM: Use fallthrough;
  IIO SUBSYSTEM AND DRIVERS: Use fallthrough;
  AMD IOMMU (AMD-VI): Use fallthrough;
  ARM SMMU DRIVERS: Use fallthrough;
  INTEL IOMMU (VT-d): Use fallthrough;
  VIRTIO IOMMU DRIVER: Use fallthrough;
  IRQCHIP DRIVERS: Use fallthrough;
  OMAP GENERAL PURPOSE MEMORY CONTROLLER SUPPORT: Use fallthrough;
  SONY MEMORYSTICK SUBSYSTEM: Use fallthrough;
  NTB DRIVER CORE: Use fallthrough;
  PCMCIA SUBSYSTEM: Use fallthrough;
  RAPIDIO SUBSYSTEM: Use fallthrough;
  53C700 AND 53C700-66 SCSI DRIVER: Use fallthrough;
  BUSLOGIC SCSI DRIVER: Use fallthrough;
  ATTO EXPRESSSAS SAS/SATA RAID SCSI DRIVER: Use fallthrough;
  MYLEX DAC960 PCI RAID Controller: Use fallthrough;
  SCSI CDROM DRIVER: Use fallthrough;
  SCSI TAPE DRIVER: Use fallthrough;
  VMware PVSCSI driver: Use fallthrough;
  SCSI SUBSYSTEM: Use fallthrough;
  STAGING SUBSYSTEM: Use fallthrough;
  SCSI TARGET SUBSYSTEM: Use fallthrough;
  THUNDERBOLT DRIVER: Use fallthrough;
  M68K ARCHITECTURE: Use fallthrough;
  EXTRA BOOT CONFIG: Use fallthrough;
  HIGH-RESOLUTION TIMERS, CLOCKEVENTS: Use fallthrough;
  DYNAMIC INTERRUPT MODERATION: Use fallthrough;
  MEMORY MANAGEMENT: Use fallthrough;
  SIPHASH PRF ROUTINES: Use fallthrough;
  POSIX CLOCKS and TIMERS: Use fallthrough;
  GCOV BASED KERNEL PROFILING: Use fallthrough;
  IRQ SUBSYSTEM: Use fallthrough;
  APPARMOR SECURITY MODULE: Use fallthrough;
  SMACK SECURITY MODULE: Use fallthrough;
  TOMOYO SECURITY MODULE: Use fallthrough;
  VSPRINTF: Use fallthrough;
  THE REST: Use fallthrough;

 arch/alpha/kernel/module.c                    |   2 +-
 arch/alpha/kernel/signal.c                    |   2 +-
 arch/alpha/kernel/traps.c                     |   6 +-
 arch/arc/kernel/disasm.c                      |   3 +-
 arch/arc/kernel/signal.c                      |   3 +-
 arch/arc/kernel/unwind.c                      |   6 +-
 arch/arm/kernel/hw_breakpoint.c               |  10 +-
 arch/arm/kernel/signal.c                      |   2 +-
 arch/arm/mach-ep93xx/crunch.c                 |   3 +-
 arch/arm/mach-mmp/pm-mmp2.c                   |   8 +-
 arch/arm/mach-mmp/pm-pxa910.c                 |  10 +-
 arch/arm/mach-omap2/id.c                      |   8 --
 arch/arm/mach-omap2/omap_device.c             |   2 +-
 arch/arm/mach-orion5x/dns323-setup.c          |   2 +-
 arch/arm/mach-rpc/riscpc.c                    |   2 +-
 arch/arm/mach-tegra/reset.c                   |   2 +-
 arch/arm/mm/alignment.c                       |   6 +-
 arch/arm/plat-omap/dma.c                      |   6 +-
 arch/arm/probes/decode.c                      |   2 +-
 arch/arm/probes/kprobes/core.c                |   2 +-
 arch/arm64/kernel/cpufeature.c                |   2 +-
 arch/arm64/kernel/cpuinfo.c                   |   2 +-
 arch/arm64/kernel/hw_breakpoint.c             |   8 +-
 arch/arm64/kernel/module.c                    |   8 +-
 arch/arm64/kernel/smp.c                       |   2 +-
 arch/arm64/kvm/handle_exit.c                  |   2 +-
 arch/arm64/kvm/hyp/debug-sr.c                 |  60 ++++-----
 arch/arm64/mm/context.c                       |   2 +-
 arch/c6x/kernel/signal.c                      |   5 +-
 arch/csky/kernel/signal.c                     |   2 +-
 arch/h8300/kernel/signal.c                    |   2 +-
 arch/hexagon/kernel/module.c                  |   2 +-
 arch/hexagon/kernel/signal.c                  |   2 +-
 arch/ia64/kernel/crash.c                      |   2 +-
 arch/ia64/kernel/module.c                     |   2 +-
 arch/ia64/kernel/perfmon.c                    |   2 +-
 arch/ia64/kernel/signal.c                     |   2 +-
 arch/ia64/kernel/unaligned.c                  |   6 +-
 arch/ia64/kernel/unwind.c                     |   2 +-
 arch/m68k/amiga/config.c                      |   4 +-
 arch/m68k/atari/atakeyb.c                     |   3 +-
 arch/m68k/kernel/signal.c                     |   2 +-
 arch/m68k/mac/config.c                        |   2 +-
 arch/m68k/mac/via.c                           |   2 +-
 arch/m68k/mm/fault.c                          |   2 +-
 arch/microblaze/kernel/signal.c               |   2 +-
 arch/mips/alchemy/devboards/db1550.c          |   2 +-
 arch/mips/ar7/setup.c                         |   2 +-
 arch/mips/ath79/setup.c                       |   3 +-
 arch/mips/bcm63xx/cpu.c                       |   2 +-
 arch/mips/bcm63xx/dev-flash.c                 |   2 +-
 arch/mips/cavium-octeon/executive/cvmx-pko.c  |   2 +-
 arch/mips/cavium-octeon/octeon-platform.c     |   4 +-
 arch/mips/cavium-octeon/octeon-usb.c          |   2 +-
 arch/mips/dec/tc.c                            |   2 +-
 arch/mips/include/asm/fpu.h                   |   2 +-
 arch/mips/include/asm/octeon/cvmx-sli-defs.h  |   2 +-
 arch/mips/include/asm/page.h                  |   2 +-
 arch/mips/include/asm/unroll.h                |  64 +++++-----
 arch/mips/kernel/branch.c                     |  26 ++--
 arch/mips/kernel/cpu-probe.c                  |  22 ++--
 arch/mips/kernel/idle.c                       |   2 +-
 arch/mips/kernel/mips-r2-to-r6-emul.c         |   2 +-
 arch/mips/kernel/perf_event_mipsxx.c          |   6 +-
 arch/mips/kernel/signal.c                     |   2 +-
 arch/mips/kernel/traps.c                      |   3 +-
 arch/mips/kernel/watch.c                      |  26 ++--
 arch/mips/kvm/emulate.c                       |   8 +-
 arch/mips/math-emu/cp1emu.c                   |  28 ++---
 arch/mips/math-emu/dp_add.c                   |   3 +-
 arch/mips/math-emu/dp_div.c                   |   3 +-
 arch/mips/math-emu/dp_fmax.c                  |   6 +-
 arch/mips/math-emu/dp_fmin.c                  |   6 +-
 arch/mips/math-emu/dp_maddf.c                 |   3 +-
 arch/mips/math-emu/dp_mul.c                   |   3 +-
 arch/mips/math-emu/dp_sqrt.c                  |   5 +-
 arch/mips/math-emu/dp_sub.c                   |   3 +-
 arch/mips/math-emu/sp_add.c                   |   3 +-
 arch/mips/math-emu/sp_div.c                   |   3 +-
 arch/mips/math-emu/sp_fdp.c                   |   3 +-
 arch/mips/math-emu/sp_fmax.c                  |   6 +-
 arch/mips/math-emu/sp_fmin.c                  |   6 +-
 arch/mips/math-emu/sp_maddf.c                 |   3 +-
 arch/mips/math-emu/sp_mul.c                   |   3 +-
 arch/mips/math-emu/sp_sub.c                   |   3 +-
 arch/mips/mm/c-r4k.c                          |   6 +-
 arch/mips/mm/tlbex.c                          |   2 +-
 arch/mips/oprofile/op_model_mipsxx.c          |  26 ++--
 arch/mips/pci/fixup-sni.c                     |   3 +-
 arch/mips/pci/ops-bcm63xx.c                   |   2 +-
 arch/nds32/kernel/fpu.c                       |  12 +-
 arch/nds32/kernel/signal.c                    |   4 +-
 arch/openrisc/kernel/signal.c                 |   2 +-
 arch/parisc/kernel/signal.c                   |   2 +-
 arch/parisc/kernel/traps.c                    |  10 +-
 arch/parisc/mm/fault.c                        |   5 +-
 arch/powerpc/kernel/align.c                   |   8 +-
 arch/powerpc/kvm/book3s_32_mmu.c              |   2 +-
 arch/powerpc/kvm/book3s_64_mmu.c              |   2 +-
 arch/powerpc/kvm/book3s_pr.c                  |   2 +-
 arch/powerpc/kvm/booke.c                      |   6 +-
 arch/powerpc/kvm/powerpc.c                    |   1 -
 arch/powerpc/platforms/cell/spufs/switch.c    |   2 +-
 arch/powerpc/platforms/powermac/feature.c     |   2 +-
 arch/powerpc/platforms/powernv/opal-async.c   |   2 +-
 arch/powerpc/platforms/pseries/hvcserver.c    |   2 +-
 arch/powerpc/xmon/xmon.c                      |   2 +-
 arch/riscv/kernel/signal.c                    |   2 +-
 arch/riscv/net/bpf_jit_comp32.c               |   5 +-
 arch/s390/kernel/signal.c                     |   4 +-
 arch/s390/kernel/topology.c                   |   2 +-
 arch/s390/kvm/gaccess.c                       |  23 ++--
 arch/s390/kvm/interrupt.c                     |   2 +-
 arch/s390/kvm/kvm-s390.c                      |   4 +-
 arch/s390/mm/fault.c                          |  13 +-
 arch/s390/mm/gmap.c                           |   6 +-
 arch/s390/mm/pgalloc.c                        |   2 +-
 arch/sh/drivers/platform_early.c              |   2 +-
 arch/sh/kernel/disassemble.c                  |   4 +-
 arch/sh/kernel/kgdb.c                         |   2 +-
 arch/sh/kernel/signal_32.c                    |   2 +-
 arch/sh/kernel/signal_64.c                    |   2 +-
 arch/sparc/kernel/auxio_64.c                  |   1 -
 arch/sparc/kernel/central.c                   |   2 +-
 arch/sparc/kernel/kgdb_32.c                   |   3 +-
 arch/sparc/kernel/kgdb_64.c                   |   3 +-
 arch/sparc/kernel/pcr.c                       |   2 +-
 arch/sparc/kernel/prom_32.c                   |   3 +-
 arch/sparc/kernel/signal32.c                  |   4 +-
 arch/sparc/kernel/signal_32.c                 |   4 +-
 arch/sparc/kernel/signal_64.c                 |   4 +-
 arch/sparc/math-emu/math_32.c                 |   8 +-
 arch/sparc/net/bpf_jit_comp_32.c              |   2 +-
 arch/um/kernel/signal.c                       |   2 +-
 arch/unicore32/kernel/signal.c                |   2 +-
 arch/x86/boot/cmdline.c                       |   6 +-
 arch/x86/boot/compressed/kaslr.c              |   2 +-
 arch/x86/events/intel/core.c                  |   7 +-
 arch/x86/events/intel/lbr.c                   |   2 +-
 arch/x86/kernel/alternative.c                 |   4 +-
 arch/x86/kernel/apic/io_apic.c                |   4 +-
 arch/x86/kernel/apic/probe_32.c               |   2 +-
 arch/x86/kernel/cpu/cacheinfo.c               |   2 +-
 arch/x86/kernel/cpu/mce/inject.c              |   2 +-
 arch/x86/kernel/cpu/mce/intel.c               |   4 +-
 arch/x86/kernel/cpu/mtrr/cyrix.c              |   2 +-
 arch/x86/kernel/hw_breakpoint.c               |   2 +-
 arch/x86/kernel/kgdb.c                        |   4 +-
 arch/x86/kernel/mpparse.c                     |   4 +-
 arch/x86/kernel/ptrace.c                      |   3 +-
 arch/x86/kernel/reboot.c                      |   3 +-
 arch/x86/kernel/signal.c                      |   2 +-
 arch/x86/kernel/uprobes.c                     |   4 +-
 arch/x86/kvm/emulate.c                        |   2 +-
 arch/x86/kvm/hyperv.c                         |   2 +-
 arch/x86/kvm/irq_comm.c                       |   2 +-
 arch/x86/kvm/lapic.c                          |   6 +-
 arch/x86/kvm/mmu/mmu.c                        |   2 +-
 arch/x86/kvm/svm.c                            |   2 +-
 arch/x86/kvm/vmx/vmx.c                        |  15 ++-
 arch/x86/kvm/x86.c                            |  12 +-
 arch/x86/lib/cmdline.c                        |  12 +-
 arch/x86/lib/insn-eval.c                      |   8 +-
 arch/x86/math-emu/errors.c                    |   2 +-
 arch/x86/math-emu/fpu_trig.c                  |   2 +-
 arch/x86/mm/ioremap.c                         |   3 +-
 arch/xtensa/kernel/signal.c                   |   2 +-
 block/badblocks.c                             |   2 +-
 block/bfq-iosched.c                           |   4 +-
 block/blk-wbt.c                               |   2 +-
 crypto/drbg.c                                 |   3 +-
 crypto/tcrypt.c                               | 114 +++++++++---------
 .../accessibility/braille/braille_console.c   |   2 +-
 drivers/acpi/ac.c                             |   2 +-
 drivers/acpi/acpi_processor.c                 |   3 +-
 drivers/acpi/acpica/dscontrol.c               |   4 +-
 drivers/acpi/acpica/dswexec.c                 |   3 +-
 drivers/acpi/acpica/dswload.c                 |   4 +-
 drivers/acpi/acpica/dswload2.c                |   4 +-
 drivers/acpi/acpica/exfldio.c                 |   4 +-
 drivers/acpi/acpica/exresop.c                 |   7 +-
 drivers/acpi/acpica/exstore.c                 |   8 +-
 drivers/acpi/acpica/hwgpe.c                   |   4 +-
 drivers/acpi/acpica/utdelete.c                |   4 +-
 drivers/acpi/acpica/utprint.c                 |   3 +-
 drivers/acpi/button.c                         |   2 +-
 drivers/acpi/dock.c                           |   2 +-
 drivers/acpi/processor_idle.c                 |   3 +-
 drivers/acpi/resource.c                       |   2 +-
 drivers/acpi/spcr.c                           |   4 +-
 drivers/ata/ahci_brcm.c                       |   2 +-
 drivers/ata/libahci_platform.c                |   2 +-
 drivers/ata/libata-core.c                     |  16 +--
 drivers/ata/libata-eh.c                       |   6 +-
 drivers/ata/libata-scsi.c                     |   2 +-
 drivers/ata/pata_atp867x.c                    |   4 +-
 drivers/ata/pata_serverworks.c                |   2 +-
 drivers/ata/sata_mv.c                         |  12 +-
 drivers/ata/sata_promise.c                    |   8 +-
 drivers/ata/sata_sx4.c                        |   2 +-
 drivers/atm/firestream.c                      |   2 +-
 drivers/atm/fore200e.c                        |  24 ++--
 drivers/atm/he.c                              |   4 +-
 drivers/atm/idt77105.c                        |   2 +-
 drivers/atm/lanai.c                           |   2 +-
 drivers/atm/zatm.c                            |   2 +-
 drivers/auxdisplay/panel.c                    |   6 +-
 drivers/base/firmware_loader/fallback.c       |   4 +-
 drivers/block/aoe/aoecmd.c                    |   2 +-
 drivers/block/ataflop.c                       |   2 +-
 drivers/block/drbd/drbd_int.h                 |   2 +-
 drivers/block/drbd/drbd_main.c                |   2 +-
 drivers/block/drbd/drbd_nl.c                  |   2 +-
 drivers/block/drbd/drbd_receiver.c            |  13 +-
 drivers/block/drbd/drbd_req.c                 |   5 +-
 drivers/block/floppy.c                        |   4 +-
 drivers/block/loop.c                          |   4 +-
 drivers/block/paride/pd.c                     |   4 +-
 drivers/block/rbd.c                           |   8 +-
 drivers/block/rsxx/core.c                     |   2 +-
 drivers/block/skd_main.c                      |   3 +-
 drivers/block/xen-blkback/blkback.c           |   2 +-
 drivers/block/xen-blkfront.c                  |   5 +-
 drivers/bluetooth/bcm203x.c                   |   2 +-
 drivers/bluetooth/bluecard_cs.c               |   2 -
 drivers/bluetooth/hci_ll.c                    |   2 +-
 drivers/bluetooth/hci_qca.c                   |   8 +-
 drivers/bus/ti-sysc.c                         |   2 +-
 drivers/char/agp/ali-agp.c                    |   2 +-
 drivers/char/ipmi/kcs_bmc.c                   |   3 +-
 drivers/char/lp.c                             |   4 +-
 drivers/char/mem.c                            |   2 +-
 drivers/char/nvram.c                          |   2 +-
 drivers/clk/davinci/pll.c                     |   2 +-
 drivers/clk/imx/clk-pllv3.c                   |   4 +-
 drivers/clk/samsung/clk-s3c2443.c             |   2 +-
 drivers/clocksource/timer-cadence-ttc.c       |   5 +-
 drivers/cpufreq/p4-clockmod.c                 |   2 +-
 drivers/cpufreq/speedstep-lib.c               |   2 +-
 drivers/cpufreq/ti-cpufreq.c                  |   4 +-
 drivers/crypto/axis/artpec6_crypto.c          |   3 +-
 drivers/crypto/cavium/cpt/cptvf_reqmanager.c  |   4 +-
 drivers/crypto/chelsio/chcr_ktls.c            |   4 +-
 drivers/crypto/qat/qat_common/adf_pf2vf_msg.c |   2 +-
 drivers/crypto/qat/qat_common/qat_uclo.c      |   6 +-
 drivers/crypto/ux500/cryp/cryp.c              |  18 +--
 drivers/dma/amba-pl08x.c                      |  10 +-
 drivers/dma/fsldma.c                          |   2 +-
 drivers/dma/imx-dma.c                         |   2 +-
 drivers/dma/iop-adma.h                        |  12 +-
 drivers/dma/nbpfaxi.c                         |   2 +-
 drivers/dma/pl330.c                           |  13 +-
 drivers/dma/sh/shdma-base.c                   |   2 +-
 drivers/edac/amd64_edac.c                     |   2 +-
 drivers/edac/pnd2_edac.c                      |   2 +-
 drivers/firewire/core-device.c                |   2 +-
 drivers/firewire/core-iso.c                   |   3 +-
 drivers/firewire/core-topology.c              |   2 +-
 drivers/firewire/core-transaction.c           |   6 +-
 drivers/firewire/ohci.c                       |   5 +-
 drivers/gpio/gpio-aspeed-sgpio.c              |   6 +-
 drivers/gpio/gpio-aspeed.c                    |   6 +-
 drivers/gpio/gpio-ath79.c                     |   2 +-
 drivers/gpio/gpio-eic-sprd.c                  |   4 +-
 drivers/gpio/gpio-stmpe.c                     |   4 +-
 drivers/gpio/gpiolib-acpi.c                   |   2 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c         |   3 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |   2 +-
 drivers/gpu/drm/amd/amdgpu/si_dpm.c           |   4 +-
 .../drm/amd/display/dc/bios/bios_parser2.c    |   4 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_aux.c  |   2 +-
 .../drm/amd/display/dc/dce/dce_mem_input.c    |   2 +-
 .../gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c  |   6 +-
 drivers/gpu/drm/arm/malidp_hw.c               |   6 +-
 drivers/gpu/drm/ast/ast_main.c                |   2 +-
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   |   4 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   6 +-
 drivers/gpu/drm/drm_bufs.c                    |   2 +-
 drivers/gpu/drm/drm_dp_helper.c               |   2 +-
 drivers/gpu/drm/drm_modes.c                   |   2 +-
 drivers/gpu/drm/drm_vm.c                      |   4 +-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  10 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |   6 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |   6 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |   6 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  10 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  20 +--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   8 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  12 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  22 ++--
 drivers/gpu/drm/i915/display/intel_tc.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pages.c     |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   6 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |   2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   2 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |   2 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |   2 +-
 drivers/gpu/drm/i915/i915_pmu.c               |   2 +-
 drivers/gpu/drm/i915/intel_device_info.c      |   4 +-
 drivers/gpu/drm/imx/ipuv3-plane.c             |   3 +-
 drivers/gpu/drm/ingenic/ingenic-drm.c         |   2 +-
 drivers/gpu/drm/meson/meson_crtc.c            |   4 +-
 drivers/gpu/drm/meson/meson_osd_afbcd.c       |   2 +-
 drivers/gpu/drm/meson/meson_overlay.c         |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/hdmi.c   |  34 +++---
 .../drm/nouveau/nvkm/engine/dma/usernv04.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv40.c   |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/dcb.c    |   3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/dp.c |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/perf.c   |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/pll.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/timing.c |  10 +-
 .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/clk/mcp77.c   |   2 +-
 .../drm/nouveau/nvkm/subdev/devinit/nv04.c    |  18 ++-
 .../gpu/drm/nouveau/nvkm/subdev/fb/ramnv40.c  |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c    |   2 +-
 drivers/gpu/drm/omapdrm/dss/venc.c            |   2 +-
 drivers/gpu/drm/radeon/ci_dpm.c               |   4 +-
 drivers/gpu/drm/radeon/r300.c                 |   4 +-
 drivers/gpu/drm/radeon/r420.c                 |   2 +-
 drivers/gpu/drm/radeon/r600_cs.c              |   4 +-
 drivers/gpu/drm/radeon/radeon_uvd.c           |   3 +-
 drivers/gpu/drm/radeon/si_dpm.c               |   4 +-
 drivers/gpu/drm/radeon/uvd_v1_0.c             |   3 +-
 drivers/gpu/drm/savage/savage_state.c         |  10 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |   6 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |   4 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c        |   3 +-
 drivers/gpu/drm/tegra/dc.c                    |   2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |   2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c               |   2 +-
 drivers/gpu/drm/via/via_dmablit.c             |   8 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |   3 -
 drivers/gpu/ipu-v3/ipu-dc.c                   |   2 +-
 drivers/greybus/es2.c                         |   2 +-
 drivers/greybus/interface.c                   |   2 +-
 drivers/hid/hid-lg-g15.c                      |   2 +-
 drivers/hid/hid-logitech-dj.c                 |   2 +-
 drivers/hid/hid-microsoft.c                   |   3 -
 drivers/hid/hid-rmi.c                         |   1 -
 drivers/hid/hid-roccat-kone.c                 |   2 +-
 drivers/hid/hid-uclogic-params.c              |   2 +-
 drivers/hid/hid-wiimote-core.c                |   2 -
 drivers/hid/usbhid/hiddev.c                   |   1 -
 drivers/hid/wacom_wac.c                       |  47 +++-----
 drivers/hsi/clients/ssi_protocol.c            |   4 +-
 drivers/hsi/controllers/omap_ssi_core.c       |   2 +-
 drivers/hv/hv_kvp.c                           |   4 +-
 drivers/hv/vmbus_drv.c                        |   2 +-
 drivers/hwmon/adt7462.c                       |   8 +-
 drivers/hwmon/emc1403.c                       |   4 +-
 drivers/hwmon/f71882fg.c                      |   4 +-
 drivers/hwmon/hwmon-vid.c                     |   4 +-
 drivers/hwmon/ina3221.c                       |   3 +-
 drivers/hwmon/nct6775.c                       |   2 +-
 drivers/hwmon/occ/common.c                    |   6 +-
 drivers/hwmon/w83627hf.c                      |   2 +-
 drivers/hwmon/w83781d.c                       |   2 +-
 drivers/hwmon/w83795.c                        |   2 +-
 .../hwtracing/coresight/coresight-cpu-debug.c |   4 +-
 drivers/hwtracing/coresight/coresight-etm4x.c |   1 -
 .../hwtracing/coresight/coresight-platform.c  |   3 +-
 drivers/hwtracing/coresight/coresight-tmc.c   |   2 -
 drivers/hwtracing/intel_th/sth.c              |   6 +-
 drivers/i2c/busses/i2c-amd8111.c              |   2 +-
 drivers/i2c/busses/i2c-aspeed.c               |   4 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c    |   2 +-
 drivers/i2c/busses/i2c-digicolor.c            |   2 +-
 drivers/i2c/busses/i2c-i801.c                 |   8 +-
 drivers/i2c/busses/i2c-mv64xxx.c              |   9 +-
 drivers/i2c/busses/i2c-omap.c                 |   1 -
 drivers/i2c/busses/i2c-opal.c                 |   2 +-
 drivers/i2c/busses/i2c-s3c2410.c              |   3 +-
 drivers/i2c/busses/i2c-synquacer.c            |   4 +-
 drivers/i2c/busses/i2c-viapro.c               |   2 +-
 drivers/i2c/busses/scx200_acb.c               |   3 +-
 drivers/i2c/i2c-slave-eeprom.c                |   2 +-
 drivers/i3c/master/dw-i3c-master.c            |   2 +-
 drivers/ide/hpt366.c                          |   6 +-
 drivers/ide/ide-cd.c                          |   4 +-
 drivers/ide/ide-floppy.c                      |   2 +-
 drivers/ide/ide-probe.c                       |   2 +-
 drivers/ide/ide-taskfile.c                    |  12 +-
 drivers/ide/sis5513.c                         |   2 +-
 drivers/iio/accel/mma8452.c                   |   2 +-
 drivers/iio/adc/ab8500-gpadc.c                |   2 +-
 drivers/iio/adc/cpcap-adc.c                   |   2 +-
 drivers/iio/chemical/sps30.c                  |   2 +-
 drivers/iio/dac/ad5592r-base.c                |   2 -
 drivers/iio/dac/dpot-dac.c                    |   2 +-
 drivers/iio/health/max30102.c                 |   4 +-
 drivers/iio/imu/adis.c                        |   6 +-
 drivers/iio/industrialio-core.c               |   2 +-
 drivers/iio/light/si1145.c                    |   2 +-
 drivers/iio/magnetometer/ak8974.c             |   2 +-
 drivers/infiniband/core/cm.c                  |  14 +--
 drivers/infiniband/core/cma.c                 |   3 +-
 drivers/infiniband/core/ucma.c                |   4 +-
 drivers/infiniband/core/uverbs_ioctl.c        |   5 +-
 drivers/infiniband/hw/bnxt_re/ib_verbs.c      |   2 +-
 drivers/infiniband/hw/bnxt_re/qplib_fp.c      |   2 +-
 drivers/infiniband/hw/cxgb4/cm.c              |   4 +-
 drivers/infiniband/hw/cxgb4/qp.c              |   2 +-
 drivers/infiniband/hw/hfi1/chip.c             |   8 +-
 drivers/infiniband/hw/hfi1/firmware.c         |  16 ---
 drivers/infiniband/hw/hfi1/mad.c              |   9 +-
 drivers/infiniband/hw/hfi1/pio.c              |   2 +-
 drivers/infiniband/hw/hfi1/pio_copy.c         |  12 +-
 drivers/infiniband/hw/hfi1/platform.c         |  12 +-
 drivers/infiniband/hw/hfi1/qp.c               |   2 +-
 drivers/infiniband/hw/hfi1/qsfp.c             |   4 +-
 drivers/infiniband/hw/hfi1/rc.c               |  25 ++--
 drivers/infiniband/hw/hfi1/sdma.c             |   9 +-
 drivers/infiniband/hw/hfi1/tid_rdma.c         |   5 +-
 drivers/infiniband/hw/hfi1/uc.c               |   8 +-
 drivers/infiniband/hw/i40iw/i40iw_cm.c        |   2 +-
 drivers/infiniband/hw/i40iw/i40iw_ctrl.c      |   5 +-
 drivers/infiniband/hw/i40iw/i40iw_hw.c        |   3 +-
 drivers/infiniband/hw/i40iw/i40iw_main.c      |  21 ++--
 drivers/infiniband/hw/i40iw/i40iw_puda.c      |   4 +-
 drivers/infiniband/hw/i40iw/i40iw_utils.c     |   8 +-
 drivers/infiniband/hw/i40iw/i40iw_verbs.c     |   5 +-
 drivers/infiniband/hw/mlx4/cq.c               |   4 +-
 drivers/infiniband/hw/mlx4/mcg.c              |   2 +-
 drivers/infiniband/hw/mlx4/qp.c               |   6 +-
 drivers/infiniband/hw/mlx5/cq.c               |   4 +-
 drivers/infiniband/hw/mlx5/mad.c              |   3 +-
 drivers/infiniband/hw/mlx5/main.c             |   6 +-
 drivers/infiniband/hw/mlx5/qp.c               |  11 +-
 drivers/infiniband/hw/mthca/mthca_av.c        |   2 +-
 drivers/infiniband/hw/ocrdma/ocrdma_verbs.c   |   4 +-
 drivers/infiniband/hw/qedr/verbs.c            |   3 +-
 drivers/infiniband/hw/qib/qib_iba6120.c       |   4 +-
 drivers/infiniband/hw/qib/qib_iba7220.c       |   4 +-
 drivers/infiniband/hw/qib/qib_iba7322.c       |   6 +-
 drivers/infiniband/hw/qib/qib_mad.c           |  14 +--
 drivers/infiniband/hw/qib/qib_rc.c            |  18 +--
 drivers/infiniband/hw/qib/qib_sdma.c          |   2 +-
 drivers/infiniband/hw/qib/qib_uc.c            |   8 +-
 drivers/infiniband/hw/qib/qib_verbs.c         |   2 +-
 drivers/infiniband/hw/vmw_pvrdma/pvrdma_qp.c  |   2 +-
 drivers/infiniband/sw/rdmavt/qp.c             |   2 +-
 drivers/infiniband/sw/rxe/rxe_task.c          |   2 +-
 drivers/infiniband/sw/rxe/rxe_verbs.c         |   2 +-
 drivers/infiniband/sw/siw/siw_cm.c            |   2 -
 drivers/infiniband/sw/siw/siw_qp_rx.c         |   6 +-
 drivers/infiniband/sw/siw/siw_qp_tx.c         |   6 +-
 drivers/infiniband/ulp/ipoib/ipoib_cm.c       |   4 +-
 drivers/infiniband/ulp/ipoib/ipoib_main.c     |   2 +-
 drivers/infiniband/ulp/iser/iser_verbs.c      |   2 +-
 drivers/infiniband/ulp/isert/ib_isert.c       |  10 +-
 .../infiniband/ulp/opa_vnic/opa_vnic_vema.c   |   1 -
 drivers/input/joystick/db9.c                  |  11 +-
 drivers/input/joystick/fsia6b.c               |   4 +-
 drivers/input/joystick/gamecon.c              |  10 +-
 drivers/input/joystick/sidewinder.c           |  15 ++-
 drivers/input/joystick/spaceball.c            |   8 +-
 drivers/input/keyboard/adp5589-keys.c         |   2 +-
 drivers/input/keyboard/atkbd.c                |   3 +-
 drivers/input/keyboard/gpio_keys.c            |   1 -
 drivers/input/misc/pwm-vibra.c                |   3 +-
 drivers/input/misc/xen-kbdfront.c             |   5 +-
 drivers/input/mouse/appletouch.c              |   2 +-
 drivers/input/mouse/cyapa_gen3.c              |   6 +-
 drivers/input/mouse/cyapa_gen5.c              |   3 +-
 drivers/input/mouse/cyapa_gen6.c              |   3 +-
 drivers/input/mouse/elantech.c                |   6 +-
 drivers/input/mouse/hgpk.c                    |   8 +-
 drivers/input/mouse/navpoint.c                |   2 +-
 drivers/input/mouse/sentelic.c                |   3 +-
 drivers/input/mouse/sermouse.c                |   6 +-
 drivers/input/serio/i8042.c                   |   2 +-
 drivers/input/serio/libps2.c                  |   2 +-
 drivers/input/sparse-keymap.c                 |   3 +-
 drivers/input/tablet/gtco.c                   |   9 +-
 drivers/input/tablet/pegasus_notetaker.c      |   3 +-
 drivers/input/tablet/wacom_serial4.c          |   2 +-
 drivers/input/touchscreen/atmel_mxt_ts.c      |   2 +-
 drivers/input/touchscreen/edt-ft5x06.c        |   5 +-
 drivers/input/touchscreen/elants_i2c.c        |   3 +-
 drivers/input/touchscreen/elo.c               |   3 +-
 drivers/input/touchscreen/iqs5xx.c            |   2 +-
 drivers/input/touchscreen/max11801_ts.c       |   1 -
 drivers/input/touchscreen/stmfts.c            |   3 +-
 drivers/input/touchscreen/wm831x-ts.c         |   2 +-
 drivers/iommu/amd_iommu_init.c                |   2 +-
 drivers/iommu/arm-smmu-v3.c                   |  11 +-
 drivers/iommu/intel-iommu.c                   |   1 -
 drivers/iommu/virtio-iommu.c                  |   2 +-
 drivers/irqchip/irq-gic-v3-its.c              |   4 +-
 drivers/irqchip/irq-gic-v3.c                  |   8 +-
 drivers/irqchip/irq-imx-gpcv2.c               |   2 +-
 drivers/irqchip/irq-mips-gic.c                |   2 +-
 drivers/irqchip/irq-vic.c                     |   2 +-
 drivers/isdn/hardware/mISDN/avmfritz.c        |   2 +-
 drivers/isdn/hardware/mISDN/hfcpci.c          |   2 +-
 drivers/isdn/hardware/mISDN/hfcsusb.c         |   2 +-
 drivers/isdn/hardware/mISDN/isdnhdlc.c        |   2 +-
 drivers/isdn/hardware/mISDN/mISDNinfineon.c   |   2 +-
 drivers/isdn/hardware/mISDN/mISDNisar.c       |   8 +-
 drivers/isdn/mISDN/stack.c                    |   2 +-
 drivers/lightnvm/pblk-core.c                  |   2 +-
 drivers/macintosh/adbhid.c                    |   3 +-
 drivers/macintosh/smu.c                       |   2 +-
 drivers/md/bcache/journal.c                   |   3 +-
 drivers/md/bcache/util.c                      |  14 +--
 drivers/md/dm-mpath.c                         |   2 +-
 drivers/md/dm.c                               |   2 +-
 drivers/md/md-bitmap.c                        |   2 +-
 drivers/md/raid5.c                            |   4 +-
 drivers/media/cec/cec-adap.c                  |   2 +-
 drivers/media/cec/cec-pin.c                   |   6 +-
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c |  36 +++---
 .../media/common/videobuf2/videobuf2-v4l2.c   |   2 +-
 drivers/media/dvb-core/dvb_net.c              |   2 +-
 drivers/media/dvb-frontends/af9013.c          |   2 +-
 drivers/media/dvb-frontends/bcm3510.c         |   2 +-
 drivers/media/dvb-frontends/dib0090.c         |   3 +-
 drivers/media/dvb-frontends/dib3000mb.c       |   2 +-
 drivers/media/dvb-frontends/dib7000p.c        |   2 +-
 drivers/media/dvb-frontends/drx39xyj/drxj.c   |  99 ++++++++-------
 drivers/media/dvb-frontends/drxd_hard.c       |  12 +-
 drivers/media/dvb-frontends/drxk_hard.c       |  24 ++--
 drivers/media/dvb-frontends/lg2160.c          |   2 +-
 drivers/media/dvb-frontends/lgdt3306a.c       |   2 +-
 drivers/media/dvb-frontends/mt352.c           |   2 +-
 drivers/media/dvb-frontends/mxl5xx.c          |   2 +-
 drivers/media/dvb-frontends/or51132.c         |   2 +-
 drivers/media/dvb-frontends/s5h1411.c         |   2 +-
 drivers/media/dvb-frontends/zl10353.c         |   4 +-
 drivers/media/i2c/adv7180.c                   |   2 +-
 drivers/media/i2c/adv7511-v4l2.c              |   4 +-
 drivers/media/i2c/msp3400-kthreads.c          |   2 +-
 drivers/media/i2c/ov5640.c                    |   2 +-
 drivers/media/i2c/ov6650.c                    |   4 +-
 drivers/media/i2c/ov9640.c                    |   2 +-
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c     |   2 +-
 drivers/media/i2c/smiapp/smiapp-core.c        |   6 +-
 drivers/media/i2c/tda1997x.c                  |  10 +-
 drivers/media/i2c/tvp5150.c                   |   2 +-
 drivers/media/pci/bt8xx/bttv-driver.c         |   2 +-
 drivers/media/pci/cx23885/cx23885-cards.c     |   4 +-
 drivers/media/pci/cx88/cx88-cards.c           |   2 +-
 drivers/media/pci/cx88/cx88-video.c           |   2 +-
 drivers/media/pci/ddbridge/ddbridge-core.c    |  23 ++--
 drivers/media/pci/meye/meye.c                 |   2 +-
 drivers/media/pci/saa7134/saa7134-cards.c     |   4 +-
 drivers/media/pci/solo6x10/solo6x10-core.c    |   2 +-
 drivers/media/pci/solo6x10/solo6x10-i2c.c     |   2 +-
 drivers/media/pci/ttpci/av7110.c              |   6 +-
 drivers/media/pci/ttpci/av7110_hw.c           |   2 +-
 drivers/media/pci/ttpci/av7110_ipack.c        |   2 +-
 drivers/media/pci/ttpci/budget-av.c           |   2 +-
 drivers/media/pci/ttpci/budget.c              |   5 +-
 drivers/media/platform/coda/coda-bit.c        |   4 +-
 drivers/media/platform/coda/coda-common.c     |  10 +-
 .../media/platform/exynos4-is/fimc-capture.c  |   6 +-
 drivers/media/platform/exynos4-is/fimc-reg.c  |   2 +-
 drivers/media/platform/exynos4-is/media-dev.c |   2 +-
 .../media/platform/marvell-ccic/mcam-core.c   |   2 +-
 drivers/media/platform/omap3isp/ispvideo.c    |   2 +-
 drivers/media/platform/pxa_camera.c           |   6 +-
 drivers/media/platform/qcom/venus/vdec.c      |   2 +-
 drivers/media/platform/renesas-ceu.c          |   4 +-
 drivers/media/platform/sh_vou.c               |   4 +-
 drivers/media/platform/vicodec/vicodec-core.c |   2 +-
 drivers/media/platform/vivid/vivid-vbi-gen.c  |   2 +-
 drivers/media/radio/radio-si476x.c            |   3 +-
 drivers/media/radio/si4713/si4713.c           |   2 +-
 drivers/media/radio/tea575x.c                 |   2 +-
 drivers/media/rc/bpf-lirc.c                   |   2 +-
 drivers/media/rc/iguanair.c                   |   2 +-
 drivers/media/rc/ir-rc6-decoder.c             |   2 +-
 drivers/media/rc/ir-sony-decoder.c            |   3 +-
 drivers/media/tuners/fc0011.c                 |   2 +-
 drivers/media/tuners/tda18271-fe.c            |   2 +-
 drivers/media/tuners/xc5000.c                 |   2 +-
 drivers/media/usb/b2c2/flexcop-usb.c          |   2 +-
 drivers/media/usb/cpia2/cpia2_core.c          |  36 +++---
 drivers/media/usb/cx231xx/cx231xx-video.c     |   2 +-
 drivers/media/usb/dvb-usb-v2/af9015.c         |   2 +-
 drivers/media/usb/dvb-usb-v2/gl861.c          |   2 +-
 drivers/media/usb/dvb-usb-v2/lmedm04.c        |   8 +-
 drivers/media/usb/dvb-usb-v2/mxl111sf-gpio.c  |   4 +-
 drivers/media/usb/dvb-usb/dib0700_devices.c   |   2 +-
 drivers/media/usb/dvb-usb/dw2102.c            |   6 +-
 drivers/media/usb/em28xx/em28xx-audio.c       |   8 +-
 drivers/media/usb/go7007/go7007-driver.c      |   2 +-
 drivers/media/usb/gspca/mr97310a.c            |  10 +-
 drivers/media/usb/gspca/nw80x.c               |   2 +-
 drivers/media/usb/gspca/ov519.c               |   6 +-
 drivers/media/usb/gspca/sn9c20x.c             |   2 +-
 drivers/media/usb/gspca/sunplus.c             |   4 +-
 drivers/media/usb/gspca/xirlink_cit.c         |   4 +-
 drivers/media/usb/gspca/zc3xx.c               |   4 +-
 drivers/media/usb/pulse8-cec/pulse8-cec.c     |   2 +-
 drivers/media/usb/pwc/pwc-v4l.c               |   2 +-
 drivers/media/usb/siano/smsusb.c              |   2 +-
 drivers/media/usb/tm6000/tm6000-alsa.c        |   8 +-
 drivers/media/usb/uvc/uvc_video.c             |   4 +-
 drivers/media/v4l2-core/v4l2-ctrls.c          |   2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 -
 drivers/media/v4l2-core/videobuf-core.c       |   2 +-
 drivers/memory/omap-gpmc.c                    |   1 -
 drivers/memstick/core/ms_block.c              |  18 +--
 drivers/memstick/host/jmb38x_ms.c             |   4 +-
 drivers/memstick/host/tifm_ms.c               |   4 +-
 drivers/message/fusion/mptbase.c              |   7 +-
 drivers/message/fusion/mptsas.c               |   3 +-
 drivers/message/fusion/mptscsih.c             |   5 +-
 drivers/mfd/db8500-prcmu.c                    |   4 +-
 drivers/mfd/iqs62x.c                          |  12 +-
 drivers/mfd/mxs-lradc.c                       |   2 +-
 drivers/mfd/omap-usb-host.c                   |   6 +-
 drivers/mfd/rave-sp.c                         |   6 +-
 drivers/mfd/syscon.c                          |   2 +-
 drivers/misc/eeprom/at25.c                    |  10 +-
 drivers/misc/mic/scif/scif_api.c              |   4 +-
 drivers/misc/mic/scif/scif_rma.c              |   2 +-
 drivers/misc/sgi-gru/grukservices.c           |   4 +-
 drivers/misc/sgi-xp/xpc_main.c                |   6 +-
 drivers/misc/sgi-xp/xpc_partition.c           |   4 +-
 drivers/misc/sgi-xp/xpc_uv.c                  |   2 +-
 drivers/mmc/core/host.c                       |   2 +-
 drivers/mmc/host/atmel-mci.c                  |   8 +-
 drivers/mmc/host/davinci_mmc.c                |   2 +-
 drivers/mmc/host/dw_mmc-k3.c                  |   2 +-
 drivers/mmc/host/dw_mmc.c                     |  11 +-
 drivers/mmc/host/jz4740_mmc.c                 |   6 +-
 drivers/mmc/host/meson-mx-sdio.c              |   2 +-
 drivers/mmc/host/renesas_sdhi_core.c          |   2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c            |   3 +-
 drivers/mmc/host/sdhci-s3c.c                  |   2 +-
 drivers/mmc/host/sdhci-sprd.c                 |   2 +-
 drivers/mmc/host/sdhci-xenon-phy.c            |   2 +-
 drivers/mmc/host/sdhci.c                      |   3 +-
 drivers/mmc/host/tifm_sd.c                    |   2 +-
 drivers/mmc/host/usdhi6rol0.c                 |   6 +-
 drivers/mtd/chips/cfi_cmdset_0001.c           |   4 +-
 drivers/mtd/chips/cfi_cmdset_0002.c           |   5 +-
 drivers/mtd/chips/cfi_cmdset_0020.c           |  17 +--
 drivers/mtd/chips/cfi_util.c                  |  12 +-
 drivers/mtd/devices/block2mtd.c               |   4 +-
 drivers/mtd/devices/phram.c                   |   4 +-
 drivers/mtd/lpddr/lpddr_cmds.c                |   3 +-
 drivers/mtd/maps/sa1100-flash.c               |   3 +-
 drivers/mtd/nand/onenand/onenand_base.c       |   2 +-
 drivers/mtd/nand/raw/diskonchip.c             |   2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c          |   3 +-
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |   2 +-
 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c    |   4 +-
 drivers/mtd/nand/raw/ingenic/jz4780_bch.c     |   4 +-
 drivers/mtd/nand/raw/nand_base.c              |   9 +-
 drivers/mtd/nand/raw/nand_legacy.c            |   6 +-
 drivers/mtd/nand/raw/nandsim.c                |   4 +-
 drivers/mtd/nand/raw/omap_elm.c               |   8 +-
 drivers/mtd/spi-nor/aspeed-smc.c              |   2 +-
 drivers/mtd/spi-nor/spi-nor.c                 |   1 -
 drivers/mtd/ubi/attach.c                      |   2 +-
 drivers/mtd/ubi/build.c                       |   4 +-
 drivers/mux/adgs1408.c                        |   2 +-
 drivers/net/appletalk/cops.c                  |   2 +-
 drivers/net/arcnet/arc-rimi.c                 |   6 +-
 drivers/net/arcnet/com20020-isa.c             |  12 +-
 drivers/net/arcnet/com90io.c                  |   4 +-
 drivers/net/arcnet/com90xx.c                  |   6 +-
 drivers/net/bonding/bond_3ad.c                |   6 +-
 drivers/net/bonding/bond_main.c               |   8 +-
 drivers/net/can/at91_can.c                    |   4 +-
 drivers/net/can/peak_canfd/peak_pciefd_main.c |   3 +-
 drivers/net/can/sja1000/sja1000_platform.c    |   2 +-
 drivers/net/can/slcan.c                       |   4 +-
 drivers/net/can/spi/mcp251x.c                 |   2 +-
 drivers/net/can/usb/peak_usb/pcan_usb.c       |   3 +-
 drivers/net/can/usb/peak_usb/pcan_usb_core.c  |   2 +-
 drivers/net/can/usb/peak_usb/pcan_usb_pro.c   |   4 +-
 drivers/net/dsa/b53/b53_common.c              |   2 +-
 drivers/net/dsa/b53/b53_serdes.c              |   2 +-
 drivers/net/dsa/bcm_sf2.c                     |   2 +-
 drivers/net/dsa/microchip/ksz9477.c           |   2 +-
 drivers/net/dsa/mt7530.c                      |   2 +-
 drivers/net/dsa/mv88e6xxx/chip.c              |   2 +-
 drivers/net/ethernet/3com/3c509.c             |   4 +-
 drivers/net/ethernet/3com/3c574_cs.c          |   2 +-
 drivers/net/ethernet/8390/axnet_cs.c          |   2 +-
 drivers/net/ethernet/8390/pcnet_cs.c          |   2 +-
 drivers/net/ethernet/alacritech/slicoss.c     |   8 +-
 drivers/net/ethernet/alteon/acenic.c          |   2 +-
 drivers/net/ethernet/amd/amd8111e.c           |   3 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      |   6 +-
 drivers/net/ethernet/broadcom/bgmac-bcma.c    |   2 +-
 .../net/ethernet/broadcom/bgmac-platform.c    |   2 +-
 drivers/net/ethernet/broadcom/bnx2.c          |  15 ++-
 .../net/ethernet/broadcom/bnx2x/bnx2x_link.c  |  14 +--
 .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  |   6 +-
 .../net/ethernet/broadcom/bnx2x/bnx2x_sriov.c |   4 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  17 ++-
 .../net/ethernet/broadcom/bnxt/bnxt_ethtool.c |   4 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt_xdp.c |   4 +-
 drivers/net/ethernet/broadcom/cnic.c          |   4 +-
 .../net/ethernet/broadcom/genet/bcmgenet.c    |   4 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c  |   2 +-
 drivers/net/ethernet/broadcom/tg3.c           |  58 +++++----
 drivers/net/ethernet/brocade/bna/bfa_ioc.c    |   8 +-
 drivers/net/ethernet/brocade/bna/bna_enet.c   |   2 +-
 drivers/net/ethernet/brocade/bna/bna_tx_rx.c  |   3 +-
 drivers/net/ethernet/cadence/macb_ptp.c       |   2 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   |  42 +++----
 .../ethernet/cavium/liquidio/lio_vf_main.c    |  37 ++----
 .../ethernet/cavium/thunder/nicvf_ethtool.c   |   2 +-
 .../net/ethernet/cavium/thunder/nicvf_main.c  |   4 +-
 .../net/ethernet/chelsio/cxgb3/cxgb3_main.c   |   2 +-
 drivers/net/ethernet/chelsio/cxgb3/l2t.c      |   2 +-
 drivers/net/ethernet/chelsio/cxgb4/l2t.c      |   2 +-
 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c    |   6 +-
 .../ethernet/chelsio/cxgb4vf/cxgb4vf_main.c   |   3 +-
 drivers/net/ethernet/cisco/enic/enic_main.c   |   4 +-
 drivers/net/ethernet/davicom/dm9000.c         |   2 +-
 drivers/net/ethernet/dec/tulip/de4x5.c        |   9 +-
 drivers/net/ethernet/dec/tulip/tulip_core.c   |   3 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c  |   3 +-
 .../net/ethernet/emulex/benet/be_ethtool.c    |   2 +-
 .../net/ethernet/freescale/dpaa/dpaa_eth.c    |   2 +-
 .../ethernet/freescale/dpaa/dpaa_ethtool.c    |   2 +-
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.c  |   4 +-
 .../net/ethernet/freescale/fman/fman_memac.c  |   2 +-
 .../net/ethernet/freescale/fman/fman_port.c   |   4 +-
 drivers/net/ethernet/freescale/ucc_geth.c     |   2 +-
 .../net/ethernet/hisilicon/hns/hns_ethtool.c  |   2 +-
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   |   2 +-
 .../hisilicon/hns3/hns3pf/hclge_main.c        |   4 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c     |   3 +-
 drivers/net/ethernet/ibm/emac/core.c          |   2 +-
 drivers/net/ethernet/intel/e1000/e1000_hw.c   |   4 +-
 drivers/net/ethernet/intel/e1000/e1000_main.c |   2 +-
 .../net/ethernet/intel/e1000/e1000_param.c    |   2 +-
 drivers/net/ethernet/intel/e1000e/82571.c     |   4 +-
 drivers/net/ethernet/intel/e1000e/ethtool.c   |  11 +-
 drivers/net/ethernet/intel/e1000e/ich8lan.c   |  16 ++-
 drivers/net/ethernet/intel/e1000e/netdev.c    |  13 +-
 drivers/net/ethernet/intel/e1000e/param.c     |   2 +-
 drivers/net/ethernet/intel/e1000e/phy.c       |   2 +-
 drivers/net/ethernet/intel/e1000e/ptp.c       |   3 +-
 .../net/ethernet/intel/fm10k/fm10k_ethtool.c  |   4 +-
 drivers/net/ethernet/intel/fm10k/fm10k_main.c |   2 +-
 drivers/net/ethernet/intel/fm10k/fm10k_mbx.c  |   8 +-
 .../net/ethernet/intel/fm10k/fm10k_netdev.c   |   2 +-
 drivers/net/ethernet/intel/fm10k/fm10k_pf.c   |   8 +-
 drivers/net/ethernet/intel/i40e/i40e_adminq.c |   2 +-
 .../net/ethernet/intel/i40e/i40e_ethtool.c    |   2 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c   |   5 +-
 drivers/net/ethernet/intel/i40e/i40e_ptp.c    |   2 +-
 drivers/net/ethernet/intel/i40e/i40e_txrx.c   |   4 +-
 drivers/net/ethernet/intel/i40e/i40e_xsk.c    |   4 +-
 drivers/net/ethernet/intel/igb/e1000_82575.c  |   4 +-
 drivers/net/ethernet/intel/igb/e1000_nvm.c    |   2 +-
 drivers/net/ethernet/intel/igb/e1000_phy.c    |   4 +-
 drivers/net/ethernet/intel/igb/igb_ethtool.c  |   8 +-
 drivers/net/ethernet/intel/igb/igb_main.c     |  25 ++--
 drivers/net/ethernet/intel/igb/igb_ptp.c      |   2 +-
 drivers/net/ethernet/intel/igbvf/netdev.c     |   4 +-
 drivers/net/ethernet/intel/igc/igc_ethtool.c  |  16 +--
 drivers/net/ethernet/intel/igc/igc_main.c     |   5 +-
 drivers/net/ethernet/intel/igc/igc_ptp.c      |   2 +-
 .../net/ethernet/intel/ixgbe/ixgbe_82598.c    |   2 +-
 .../net/ethernet/intel/ixgbe/ixgbe_82599.c    |   6 +-
 .../net/ethernet/intel/ixgbe/ixgbe_common.c   |   5 +-
 .../net/ethernet/intel/ixgbe/ixgbe_ethtool.c  |  10 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c |  30 ++---
 drivers/net/ethernet/intel/ixgbe/ixgbe_ptp.c  |   4 +-
 .../net/ethernet/intel/ixgbe/ixgbe_sriov.c    |   4 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_x550.c |  10 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.c  |   4 +-
 .../net/ethernet/intel/ixgbevf/ixgbevf_main.c |   8 +-
 drivers/net/ethernet/intel/ixgbevf/vf.c       |   6 +-
 drivers/net/ethernet/marvell/mvneta.c         |   4 +-
 .../net/ethernet/marvell/mvpp2/mvpp2_cls.c    |   2 +-
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |   4 +-
 .../ethernet/marvell/octeontx2/af/rvu_nix.c   |   2 +-
 drivers/net/ethernet/marvell/skge.c           |   3 +-
 drivers/net/ethernet/marvell/sky2.c           |   5 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |   6 +-
 drivers/net/ethernet/mellanox/mlx4/en_rx.c    |   4 +-
 drivers/net/ethernet/mellanox/mlx4/eq.c       |   2 +-
 drivers/net/ethernet/mellanox/mlx4/mcg.c      |   6 +-
 .../net/ethernet/mellanox/mlx5/core/en/txrx.h |   2 +-
 .../net/ethernet/mellanox/mlx5/core/en/xdp.c  |   4 +-
 .../mellanox/mlx5/core/en_accel/ktls_tx.c     |   2 +-
 .../ethernet/mellanox/mlx5/core/en_ethtool.c  |   2 +-
 .../mellanox/mlx5/core/eswitch_offloads.c     |   2 +-
 .../ethernet/mellanox/mlx5/core/fpga/conn.c   |   4 +-
 .../net/ethernet/mellanox/mlx5/core/lag_mp.c  |   8 +-
 .../net/ethernet/mellanox/mlx5/core/vport.c   |   2 +-
 .../net/ethernet/mellanox/mlxfw/mlxfw_fsm.c   |   4 +-
 drivers/net/ethernet/mellanox/mlxsw/core.c    |  18 +--
 .../net/ethernet/mellanox/mlxsw/core_env.c    |   8 +-
 .../net/ethernet/mellanox/mlxsw/core_hwmon.c  |   4 +-
 .../net/ethernet/mellanox/mlxsw/spectrum.c    |   4 +-
 .../net/ethernet/mellanox/mlxsw/spectrum.h    |  10 +-
 .../ethernet/mellanox/mlxsw/spectrum_router.c |  32 ++---
 .../mellanox/mlxsw/spectrum_switchdev.c       |  12 +-
 .../net/ethernet/microchip/lan743x_ethtool.c  |   2 +-
 drivers/net/ethernet/mscc/ocelot.c            |   2 +-
 drivers/net/ethernet/mscc/ocelot_tc.c         |   2 +-
 drivers/net/ethernet/natsemi/natsemi.c        |   3 +-
 .../net/ethernet/neterion/vxge/vxge-config.c  |   6 +-
 .../net/ethernet/netronome/nfp/crypto/tls.c   |   2 +-
 .../ethernet/netronome/nfp/flower/action.c    |   2 +-
 .../net/ethernet/netronome/nfp/flower/cmsg.c  |   2 +-
 .../ethernet/netronome/nfp/flower/offload.c   |   2 +-
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |   2 +-
 .../ethernet/netronome/nfp/nfp_net_common.c   |   4 +-
 .../netronome/nfp/nfpcore/nfp6000_pcie.c      |   4 +-
 .../netronome/nfp/nfpcore/nfp_rtsym.c         |   2 +-
 .../ethernet/oki-semi/pch_gbe/pch_gbe_param.c |   2 +-
 .../net/ethernet/packetengines/yellowfin.c    |   3 +-
 .../qlogic/netxen/netxen_nic_ethtool.c        |   4 +-
 drivers/net/ethernet/qlogic/qed/qed_cxt.c     |   2 +-
 drivers/net/ethernet/qlogic/qed/qed_dev.c     |   5 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c    |   6 +-
 drivers/net/ethernet/qlogic/qed/qed_mcp.c     |  10 +-
 drivers/net/ethernet/qlogic/qede/qede_fp.c    |   4 +-
 drivers/net/ethernet/qlogic/qla3xxx.c         |   3 +-
 .../ethernet/qlogic/qlcnic/qlcnic_ethtool.c   |   4 +-
 drivers/net/ethernet/realtek/r8169_main.c     |   4 +-
 drivers/net/ethernet/rocker/rocker_main.c     |   8 +-
 .../ethernet/samsung/sxgbe/sxgbe_ethtool.c    |   4 +-
 drivers/net/ethernet/sfc/falcon/ethtool.c     |   2 +-
 drivers/net/ethernet/sfc/falcon/farch.c       |  14 +--
 drivers/net/ethernet/sfc/farch.c              |  14 +--
 drivers/net/ethernet/sfc/mcdi_filters.c       |   2 +-
 drivers/net/ethernet/sfc/mcdi_port_common.c   |   2 +-
 drivers/net/ethernet/sfc/rx.c                 |   2 +-
 drivers/net/ethernet/sis/sis900.c             |   3 +-
 drivers/net/ethernet/smsc/smc911x.c           |   2 +-
 drivers/net/ethernet/socionext/netsec.c       |   4 +-
 .../ethernet/stmicro/stmmac/dwmac-anarion.c   |   5 +-
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   |   3 +-
 .../stmicro/stmmac/stmmac_selftests.c         |   4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   2 +-
 drivers/net/ethernet/sun/cassini.c            |   3 +-
 drivers/net/ethernet/sun/niu.c                |   6 +-
 drivers/net/ethernet/sun/sungem.c             |   3 +-
 drivers/net/ethernet/ti/cpsw-phy-sel.c        |   4 +-
 drivers/net/ethernet/ti/cpsw_priv.c           |   4 +-
 drivers/net/ethernet/ti/cpts.c                |   2 +-
 drivers/net/ethernet/ti/tlan.c                |   4 +-
 .../net/ethernet/toshiba/ps3_gelic_wireless.c |   2 +-
 drivers/net/ethernet/toshiba/spider_net.c     |  29 +++--
 drivers/net/ethernet/xircom/xirc2ps_cs.c      |   2 +-
 drivers/net/fddi/skfp/pcmplc.c                |   4 +-
 drivers/net/fjes/fjes_main.c                  |   2 +-
 drivers/net/hamradio/baycom_epp.c             |   3 +-
 drivers/net/hamradio/mkiss.c                  |   5 +-
 drivers/net/macvlan.c                         |   2 +-
 drivers/net/mii.c                             |   3 +-
 drivers/net/netdevsim/bus.c                   |   2 +-
 drivers/net/netdevsim/fib.c                   |   6 +-
 drivers/net/phy/adin.c                        |   4 +-
 drivers/net/phy/dp83640.c                     |   8 +-
 drivers/net/phy/fixed_phy.c                   |   4 +-
 drivers/net/phy/phy.c                         |   6 +-
 drivers/net/phy/phylink.c                     |   6 +-
 drivers/net/phy/sfp-bus.c                     |   4 +-
 drivers/net/phy/sfp.c                         |  12 +-
 drivers/net/plip/plip.c                       |  38 ++----
 drivers/net/tun.c                             |   6 +-
 drivers/net/usb/aqc111.c                      |   6 +-
 drivers/net/usb/catc.c                        |   2 +-
 drivers/net/usb/cdc-phonet.c                  |   2 +-
 drivers/net/usb/lan78xx.c                     |   7 +-
 drivers/net/usb/pegasus.c                     |   4 +-
 drivers/net/usb/r8152.c                       |   7 +-
 drivers/net/usb/rtl8150.c                     |   2 +-
 drivers/net/usb/usbnet.c                      |   7 +-
 drivers/net/veth.c                            |   8 +-
 drivers/net/virtio_net.c                      |   6 +-
 drivers/net/wan/lapbether.c                   |   2 +-
 drivers/net/wan/sdla.c                        |   3 +-
 drivers/net/wan/x25_asy.c                     |   2 +-
 drivers/net/wimax/i2400m/control.c            |   2 +-
 drivers/net/wimax/i2400m/usb-fw.c             |   2 +-
 drivers/net/wimax/i2400m/usb-tx.c             |   2 +-
 drivers/net/wimax/i2400m/usb.c                |   2 +-
 drivers/net/wireless/ath/ath10k/core.c        |   2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c      |   2 +-
 drivers/net/wireless/ath/ath10k/htt_tx.c      |   6 +-
 drivers/net/wireless/ath/ath10k/mac.c         |  18 +--
 drivers/net/wireless/ath/ath10k/wow.c         |   2 +-
 drivers/net/wireless/ath/ath11k/core.c        |   2 +-
 drivers/net/wireless/ath/ath11k/dp.c          |   2 +-
 drivers/net/wireless/ath/ath11k/mac.c         |  23 ++--
 drivers/net/wireless/ath/ath5k/eeprom.c       |   4 +-
 drivers/net/wireless/ath/ath5k/pcu.c          |   4 +-
 drivers/net/wireless/ath/ath5k/phy.c          |   7 +-
 drivers/net/wireless/ath/ath5k/reset.c        |   2 +-
 drivers/net/wireless/ath/ath6kl/cfg80211.c    |   6 +-
 drivers/net/wireless/ath/ath6kl/main.c        |   2 +-
 drivers/net/wireless/ath/ath9k/ar5008_phy.c   |   4 +-
 drivers/net/wireless/ath/ath9k/ar9002_mac.c   |   2 +-
 drivers/net/wireless/ath/ath9k/ar9002_phy.c   |   2 +-
 drivers/net/wireless/ath/ath9k/ar9003_mac.c   |   2 +-
 drivers/net/wireless/ath/ath9k/channel.c      |   4 +-
 drivers/net/wireless/ath/ath9k/eeprom_def.c   |   2 +-
 drivers/net/wireless/ath/ath9k/hw.c           |   6 +-
 drivers/net/wireless/ath/ath9k/main.c         |   2 +-
 drivers/net/wireless/ath/carl9170/rx.c        |   3 +-
 drivers/net/wireless/ath/carl9170/tx.c        |   9 +-
 drivers/net/wireless/ath/wcn36xx/smd.c        |   2 +-
 drivers/net/wireless/atmel/at76c50x-usb.c     |   2 +-
 drivers/net/wireless/atmel/atmel.c            |   2 +-
 drivers/net/wireless/broadcom/b43/dma.c       |   2 +-
 drivers/net/wireless/broadcom/b43/main.c      |   8 +-
 drivers/net/wireless/broadcom/b43/phy_n.c     |   2 +-
 drivers/net/wireless/broadcom/b43/pio.c       |   2 +-
 .../net/wireless/broadcom/b43/tables_nphy.c   |   2 +-
 drivers/net/wireless/broadcom/b43legacy/dma.c |   2 +-
 .../net/wireless/broadcom/b43legacy/main.c    |   4 +-
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   8 +-
 .../broadcom/brcm80211/brcmfmac/chip.c        |   2 +-
 .../broadcom/brcm80211/brcmsmac/rate.c        |   1 -
 .../net/wireless/intel/iwlegacy/3945-mac.c    |   2 +-
 .../net/wireless/intel/iwlegacy/4965-mac.c    |   4 +-
 drivers/net/wireless/intel/iwlegacy/common.c  |   5 +-
 .../net/wireless/intel/iwlwifi/dvm/mac80211.c |   2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/rx.c   |   6 +-
 drivers/net/wireless/intel/iwlwifi/dvm/scan.c |   2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/sta.c  |   2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/tx.c   |   2 +-
 drivers/net/wireless/intel/iwlwifi/iwl-drv.c  |   2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/led.c  |   2 +-
 .../net/wireless/intel/iwlwifi/mvm/mac-ctxt.c |   2 +-
 .../net/wireless/intel/iwlwifi/mvm/mac80211.c |   2 +-
 .../net/wireless/intel/iwlwifi/mvm/phy-ctxt.c |   2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rx.c   |   3 +-
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c |   8 +-
 drivers/net/wireless/intel/iwlwifi/mvm/scan.c |   2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/sta.c  |  10 +-
 drivers/net/wireless/intel/iwlwifi/mvm/tx.c   |   4 +-
 drivers/net/wireless/intersil/orinoco/main.c  |   4 +-
 .../wireless/intersil/orinoco/orinoco_usb.c   |   9 +-
 .../net/wireless/intersil/prism54/isl_38xx.c  |   3 +-
 .../net/wireless/intersil/prism54/isl_ioctl.c |   2 +-
 .../wireless/intersil/prism54/islpci_dev.c    |   2 +-
 drivers/net/wireless/mac80211_hwsim.c         |   2 +-
 .../net/wireless/marvell/mwifiex/cfg80211.c   |   8 +-
 drivers/net/wireless/marvell/mwifiex/ie.c     |   2 +-
 drivers/net/wireless/marvell/mwifiex/scan.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7603/dma.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7603/mac.c   |   4 +-
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |   4 +-
 .../net/wireless/mediatek/mt76/mt76x0/phy.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt76x02_mac.c  |   6 +-
 drivers/net/wireless/mediatek/mt76/usb.c      |   2 +-
 drivers/net/wireless/mediatek/mt7601u/dma.c   |   4 +-
 drivers/net/wireless/mediatek/mt7601u/mac.c   |   4 +-
 drivers/net/wireless/mediatek/mt7601u/phy.c   |   2 +-
 .../net/wireless/ralink/rt2x00/rt2400pci.c    |   2 +-
 .../net/wireless/ralink/rt2x00/rt2500pci.c    |   2 +-
 .../net/wireless/ralink/rt2x00/rt2800lib.c    |  42 +++----
 .../net/wireless/ralink/rt2x00/rt2800mmio.c   |   1 -
 .../net/wireless/ralink/rt2x00/rt2800usb.c    |   1 -
 drivers/net/wireless/ralink/rt2x00/rt61pci.c  |   3 +-
 drivers/net/wireless/ralink/rt2x00/rt73usb.c  |   1 -
 drivers/net/wireless/ray_cs.c                 |   6 +-
 .../wireless/realtek/rtl8xxxu/rtl8xxxu_core.c |   8 +-
 drivers/net/wireless/realtek/rtlwifi/base.c   |   2 +-
 drivers/net/wireless/realtek/rtlwifi/core.c   |   4 +-
 .../wireless/realtek/rtlwifi/rtl8821ae/phy.c  |   2 +-
 drivers/net/wireless/realtek/rtw88/main.c     |   4 +-
 drivers/net/wireless/realtek/rtw88/phy.c      |   6 +-
 drivers/net/wireless/ti/wlcore/main.c         |   4 +-
 drivers/net/wireless/zydas/zd1201.c           |   2 +-
 drivers/net/xen-netback/hash.c                |   2 +-
 drivers/net/xen-netback/xenbus.c              |   2 +-
 drivers/net/xen-netfront.c                    |   2 +-
 drivers/nfc/pn533/pn533.c                     |   4 +-
 drivers/nfc/st21nfca/dep.c                    |   2 +-
 drivers/nfc/trf7970a.c                        |   4 +-
 drivers/ntb/ntb_transport.c                   |   4 +-
 drivers/nvme/host/core.c                      |  10 +-
 drivers/nvme/host/pci.c                       |   2 +-
 drivers/nvme/host/rdma.c                      |   2 +-
 drivers/nvme/target/core.c                    |   2 +-
 drivers/nvme/target/fcloop.c                  |   3 +-
 drivers/nvme/target/io-cmd-bdev.c             |   1 -
 drivers/nvme/target/rdma.c                    |   2 +-
 drivers/parport/ieee1284.c                    |   8 +-
 drivers/parport/parport_pc.c                  |   2 +-
 drivers/pci/controller/dwc/pci-imx6.c         |   6 +-
 drivers/pci/controller/pci-rcar-gen2.c        |   2 +-
 drivers/pci/hotplug/ibmphp_res.c              |   2 +-
 drivers/pci/hotplug/pciehp_ctrl.c             |   4 +-
 drivers/pci/hotplug/shpchp_ctrl.c             |   4 +-
 drivers/pci/pci-acpi.c                        |   6 +-
 drivers/pci/pci.c                             |   4 +-
 drivers/pci/proc.c                            |   2 +-
 drivers/pci/quirks.c                          |   4 +-
 drivers/pci/setup-bus.c                       |   2 +-
 drivers/pci/xen-pcifront.c                    |   2 +-
 drivers/pcmcia/db1xxx_ss.c                    |   8 +-
 drivers/perf/arm-ccn.c                        |   2 +-
 drivers/perf/arm_spe_pmu.c                    |   4 +-
 drivers/phy/qualcomm/phy-qcom-usb-hs.c        |   2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c |   8 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c      |   4 +-
 drivers/pinctrl/pinctrl-lpc18xx.c             |  12 +-
 drivers/pinctrl/pinctrl-single.c              |   2 +-
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   4 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c      |   2 +-
 drivers/platform/olpc/olpc-xo175-ec.c         |   2 +-
 drivers/platform/x86/acer-wmi.c               |   8 +-
 drivers/platform/x86/dell-laptop.c            |   4 +-
 drivers/platform/x86/surfacepro3_button.c     |   8 +-
 drivers/platform/x86/thinkpad_acpi.c          |   8 +-
 drivers/platform/x86/toshiba_acpi.c           |   2 +-
 drivers/power/supply/ab8500_charger.c         |   4 +-
 drivers/power/supply/ab8500_fg.c              |   7 +-
 drivers/power/supply/abx500_chargalg.c        |  39 ++----
 drivers/power/supply/axp20x_usb_power.c       |   2 +-
 drivers/power/supply/cros_usbpd-charger.c     |   2 +-
 drivers/power/supply/max8925_power.c          |   2 +-
 drivers/power/supply/wm831x_power.c           |   2 +-
 drivers/power/supply/wm8350_power.c           |   2 +-
 drivers/ps3/ps3av.c                           |   2 +-
 drivers/ps3/ps3av_cmd.c                       |   4 +-
 drivers/rapidio/devices/rio_mport_cdev.c      |   2 +-
 drivers/regulator/axp20x-regulator.c          |   9 +-
 drivers/regulator/core.c                      |   3 +-
 drivers/regulator/slg51000-regulator.c        |   3 +-
 drivers/regulator/twl6030-regulator.c         |   2 +-
 drivers/reset/reset-imx7.c                    |  10 +-
 drivers/rpmsg/qcom_glink_native.c             |   4 +-
 drivers/rtc/rtc-ds1374.c                      |   2 +-
 drivers/rtc/rtc-m41t80.c                      |   2 +-
 drivers/rtc/rtc-pcf85063.c                    |   2 +-
 drivers/rtc/rtc-pcf8523.c                     |   2 +-
 drivers/rtc/rtc-stmp3xxx.c                    |   2 +-
 drivers/s390/char/con3215.c                   |   2 +-
 drivers/s390/char/hmcdrv_ftp.c                |   2 +-
 drivers/s390/char/sclp_sdias.c                |   2 +-
 drivers/s390/char/tape_core.c                 |   6 +-
 drivers/s390/cio/device.c                     |   4 +-
 drivers/s390/crypto/ap_bus.c                  |   2 +-
 drivers/s390/crypto/ap_queue.c                |   8 +-
 drivers/s390/crypto/vfio_ap_ops.c             |   2 +-
 drivers/s390/crypto/zcrypt_msgtype6.c         |   8 +-
 drivers/s390/net/ctcm_fsms.c                  |   2 +-
 drivers/s390/net/ctcm_mpc.c                   |   6 +-
 drivers/s390/net/qeth_core_main.c             |   4 +-
 drivers/s390/net/qeth_ethtool.c               |   6 +-
 drivers/s390/net/qeth_l2_main.c               |   2 +-
 drivers/s390/net/qeth_l3_main.c               |   2 +-
 drivers/s390/scsi/zfcp_erp.c                  |  10 +-
 drivers/s390/scsi/zfcp_fsf.c                  |  23 ++--
 drivers/scsi/53c700.c                         |   2 +-
 drivers/scsi/BusLogic.c                       |   2 +-
 drivers/scsi/FlashPoint.c                     |   9 +-
 drivers/scsi/NCR5380.c                        |   2 +-
 drivers/scsi/aacraid/aachba.c                 |   9 +-
 drivers/scsi/aacraid/commsup.c                |   2 +-
 drivers/scsi/aacraid/linit.c                  |   2 +-
 drivers/scsi/aic7xxx/aic79xx_core.c           |  40 +++---
 drivers/scsi/aic7xxx/aic79xx_osm.c            |   2 +-
 drivers/scsi/aic7xxx/aic7xxx_core.c           |  28 ++---
 drivers/scsi/aic94xx/aic94xx_scb.c            |  11 +-
 drivers/scsi/aic94xx/aic94xx_tmf.c            |   2 +-
 drivers/scsi/arcmsr/arcmsr_hba.c              |   2 +-
 drivers/scsi/arm/fas216.c                     |  17 +--
 drivers/scsi/be2iscsi/be_iscsi.c              |   2 +-
 drivers/scsi/be2iscsi/be_main.c               |   2 +-
 drivers/scsi/bfa/bfa_fcpim.c                  |   6 +-
 drivers/scsi/bfa/bfa_fcs_lport.c              |   6 +-
 drivers/scsi/bfa/bfa_fcs_rport.c              |  16 ++-
 drivers/scsi/bfa/bfa_ioc.c                    |   8 +-
 drivers/scsi/bfa/bfa_svc.c                    |   3 +-
 drivers/scsi/bnx2fc/bnx2fc_hwi.c              |   1 -
 drivers/scsi/csiostor/csio_hw.c               |   3 +-
 drivers/scsi/csiostor/csio_lnode.c            |   1 -
 drivers/scsi/csiostor/csio_wr.c               |   2 +-
 drivers/scsi/cxgbi/cxgb3i/cxgb3i.c            |   2 +-
 drivers/scsi/cxgbi/cxgb4i/cxgb4i.c            |   2 +-
 drivers/scsi/cxlflash/main.c                  |  29 +++--
 drivers/scsi/cxlflash/superpipe.c             |  13 +-
 drivers/scsi/device_handler/scsi_dh_hp_sw.c   |   4 +-
 drivers/scsi/esas2r/esas2r_flash.c            |   4 +-
 drivers/scsi/esas2r/esas2r_init.c             |   6 +-
 drivers/scsi/esp_scsi.c                       |   6 +-
 drivers/scsi/fcoe/fcoe_ctlr.c                 |   8 +-
 drivers/scsi/g_NCR5380.c                      |   2 +-
 drivers/scsi/hisi_sas/hisi_sas_main.c         |   2 +-
 drivers/scsi/hpsa.c                           |  10 +-
 drivers/scsi/ibmvscsi/ibmvfc.c                |   6 +-
 drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c      |   6 +-
 drivers/scsi/imm.c                            |  21 ++--
 drivers/scsi/isci/phy.c                       |   2 +-
 drivers/scsi/isci/remote_device.c             |   5 +-
 drivers/scsi/isci/remote_node_context.c       |   6 +-
 drivers/scsi/isci/request.c                   |   2 +-
 drivers/scsi/libfc/fc_exch.c                  |   4 +-
 drivers/scsi/libfc/fc_fcp.c                   |   9 +-
 drivers/scsi/libfc/fc_lport.c                 |   2 +-
 drivers/scsi/libfc/fc_rport.c                 |   2 +-
 drivers/scsi/libiscsi.c                       |   6 +-
 drivers/scsi/libiscsi_tcp.c                   |   2 +-
 drivers/scsi/libsas/sas_ata.c                 |   2 +-
 drivers/scsi/libsas/sas_discover.c            |   4 +-
 drivers/scsi/libsas/sas_expander.c            |   2 +-
 drivers/scsi/libsas/sas_scsi_host.c           |   2 +-
 drivers/scsi/lpfc/lpfc_ct.c                   |   4 +-
 drivers/scsi/lpfc/lpfc_els.c                  |   2 +-
 drivers/scsi/lpfc/lpfc_hbadisc.c              |   6 +-
 drivers/scsi/lpfc/lpfc_nportdisc.c            |   2 +-
 drivers/scsi/lpfc/lpfc_nvme.c                 |   2 +-
 drivers/scsi/lpfc/lpfc_scsi.c                 |   9 +-
 drivers/scsi/lpfc/lpfc_sli.c                  |  30 +++--
 drivers/scsi/megaraid.c                       |  12 +-
 drivers/scsi/megaraid/megaraid_mbox.c         |   4 +-
 drivers/scsi/megaraid/megaraid_sas_base.c     |   3 +-
 drivers/scsi/megaraid/megaraid_sas_fusion.c   |   2 +-
 drivers/scsi/mesh.c                           |   3 +-
 drivers/scsi/mpt3sas/mpt3sas_base.c           |   2 +-
 drivers/scsi/mpt3sas/mpt3sas_ctl.c            |   2 +-
 drivers/scsi/mpt3sas/mpt3sas_scsih.c          |  10 +-
 drivers/scsi/myrb.c                           |   8 +-
 drivers/scsi/ncr53c8xx.c                      |  16 ++-
 drivers/scsi/pcmcia/nsp_cs.c                  |   2 +-
 drivers/scsi/ppa.c                            |  15 +--
 drivers/scsi/qla2xxx/qla_gs.c                 |   2 +-
 drivers/scsi/qla2xxx/qla_init.c               |   2 +-
 drivers/scsi/qla2xxx/qla_iocb.c               |   2 +-
 drivers/scsi/qla2xxx/qla_isr.c                |  10 +-
 drivers/scsi/qla2xxx/qla_sup.c                |   8 +-
 drivers/scsi/qla2xxx/qla_target.c             |   6 +-
 drivers/scsi/qla4xxx/ql4_os.c                 |   2 +-
 drivers/scsi/qlogicpti.c                      |  20 +--
 drivers/scsi/scsi_error.c                     |  29 +++--
 drivers/scsi/scsi_ioctl.c                     |   4 +-
 drivers/scsi/scsi_lib.c                       |   2 +-
 drivers/scsi/smartpqi/smartpqi_init.c         |  17 ++-
 drivers/scsi/sr.c                             |   4 +-
 drivers/scsi/st.c                             |   8 +-
 drivers/scsi/sun3_scsi.c                      |   6 +-
 drivers/scsi/sym53c8xx_2/sym_fw.c             |   2 +-
 drivers/scsi/sym53c8xx_2/sym_hipd.c           |   4 +-
 drivers/scsi/sym53c8xx_2/sym_nvram.c          |   2 +-
 drivers/scsi/ufs/ufs_bsg.c                    |   3 +-
 drivers/scsi/ufs/ufshcd.c                     |   8 +-
 drivers/scsi/virtio_scsi.c                    |   2 +-
 drivers/scsi/vmw_pvscsi.c                     |   3 +-
 drivers/scsi/wd33c93.c                        |   2 +-
 drivers/scsi/xen-scsifront.c                  |   2 +-
 drivers/soc/qcom/socinfo.c                    |  16 +--
 drivers/soc/tegra/pmc.c                       |   3 +-
 drivers/spi/spi-bcm2835aux.c                  |   4 +-
 drivers/spi/spi-fsl-cpm.c                     |   4 +-
 drivers/spi/spi-sprd-adi.c                    |   2 +-
 drivers/ssb/driver_chipcommon.c               |   2 +-
 drivers/ssb/driver_mipscore.c                 |   2 +-
 drivers/ssb/scan.c                            |   2 +-
 drivers/staging/comedi/drivers/s526.c         |   2 +-
 drivers/staging/fsl-dpaa2/ethsw/ethsw.c       |   2 +-
 drivers/staging/gdm724x/gdm_lte.c             |   2 +-
 drivers/staging/ks7010/ks_wlan_net.c          |  18 +--
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   2 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |   2 +-
 drivers/staging/media/imx/imx-media-csi.c     |   2 +-
 .../staging/media/soc_camera/soc_mediabus.c   |   2 +-
 .../staging/media/usbvision/usbvision-i2c.c   |   6 +-
 drivers/staging/qlge/qlge_mpi.c               |   4 +-
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c |   2 +-
 drivers/staging/rtl8188eu/hal/usb_halinit.c   |   2 +-
 .../staging/rtl8188eu/os_dep/usb_ops_linux.c  |   2 +-
 drivers/staging/rtl8192e/rtllib_wx.c          |   2 +-
 drivers/staging/rtl8712/usb_ops_linux.c       |   2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |   2 +-
 .../interface/vchiq_arm/vchiq_core.c          |   2 +-
 drivers/staging/vt6655/channel.c              |   2 +-
 drivers/staging/vt6655/key.c                  |   6 +-
 drivers/staging/vt6656/card.c                 |   4 +-
 drivers/staging/vt6656/channel.c              |   2 +-
 drivers/staging/vt6656/key.c                  |   6 +-
 drivers/target/iscsi/cxgbit/cxgbit_main.c     |   2 +-
 drivers/target/iscsi/iscsi_target.c           |   2 +-
 drivers/target/target_core_pr.c               |   4 +-
 drivers/target/target_core_sbc.c              |   2 +-
 drivers/target/target_core_transport.c        |   4 +-
 drivers/target/tcm_fc/tfc_cmd.c               |   2 +-
 drivers/thermal/clock_cooling.c               |   2 +-
 drivers/thermal/qcom/tsens-v0_1.c             |   8 +-
 drivers/thermal/qcom/tsens-v1.c               |   4 +-
 drivers/thunderbolt/ctl.c                     |   2 +-
 drivers/thunderbolt/switch.c                  |   3 +-
 drivers/thunderbolt/tunnel.c                  |   4 +-
 drivers/tty/hvc/hvc_xen.c                     |   2 +-
 drivers/tty/mips_ejtag_fdc.c                  |   2 +-
 drivers/tty/n_gsm.c                           |   4 +-
 drivers/tty/n_hdlc.c                          |   3 +-
 drivers/tty/n_r3964.c                         |   1 -
 drivers/tty/serial/8250/8250_em.c             |   2 +-
 drivers/tty/serial/8250/8250_fintek.c         |   2 +-
 drivers/tty/serial/8250/8250_pci.c            |   2 +-
 drivers/tty/serial/8250/8250_port.c           |   2 +-
 drivers/tty/serial/8250/8250_uniphier.c       |   6 +-
 drivers/tty/serial/atmel_serial.c             |   2 +-
 drivers/tty/serial/omap-serial.c              |   2 -
 drivers/tty/serial/rda-uart.c                 |   2 +-
 drivers/tty/serial/serial-tegra.c             |   2 +-
 drivers/tty/serial/serial_core.c              |   2 +-
 drivers/tty/serial/sunsu.c                    |   2 +-
 drivers/tty/serial/sunzilog.c                 |   2 +-
 drivers/tty/serial/xilinx_uartps.c            |   2 +-
 drivers/tty/tty_ioctl.c                       |   2 +-
 drivers/tty/vt/vt.c                           |   6 +-
 drivers/usb/atm/cxacru.c                      |   4 +-
 drivers/usb/c67x00/c67x00-sched.c             |   3 +-
 drivers/usb/cdns3/gadget.c                    |   4 +-
 drivers/usb/class/usbtmc.c                    |   2 +-
 drivers/usb/core/config.c                     |   2 +-
 drivers/usb/core/hcd.c                        |   8 +-
 drivers/usb/core/hub.c                        |   2 +-
 drivers/usb/core/urb.c                        |   4 +-
 drivers/usb/dwc3/core.c                       |   5 +-
 drivers/usb/gadget/composite.c                |  16 +--
 drivers/usb/gadget/function/f_fs.c            |   2 +-
 drivers/usb/gadget/function/f_hid.c           |   2 +-
 drivers/usb/gadget/function/f_mass_storage.c  |   2 -
 drivers/usb/gadget/function/f_phonet.c        |   4 +-
 drivers/usb/gadget/function/f_printer.c       |   7 +-
 drivers/usb/gadget/function/f_rndis.c         |   2 +-
 drivers/usb/gadget/function/f_tcm.c           |   2 +-
 drivers/usb/gadget/function/u_ether.c         |   5 +-
 drivers/usb/gadget/function/u_serial.c        |   6 +-
 drivers/usb/gadget/legacy/inode.c             |   7 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c       |   2 +-
 drivers/usb/gadget/udc/dummy_hcd.c            |  13 +-
 drivers/usb/gadget/udc/fsl_udc_core.c         |   2 +-
 drivers/usb/gadget/udc/goku_udc.c             |   9 +-
 drivers/usb/gadget/udc/omap_udc.c             |   4 +-
 drivers/usb/gadget/udc/pxa25x_udc.c           |   4 +-
 drivers/usb/gadget/udc/s3c2410_udc.c          |   4 +-
 drivers/usb/gadget/udc/tegra-xudc.c           |   2 +-
 drivers/usb/host/ehci-dbg.c                   |   2 +-
 drivers/usb/host/ehci-fsl.c                   |   4 +-
 drivers/usb/host/ehci-hcd.c                   |   4 +-
 drivers/usb/host/ehci-q.c                     |   3 +-
 drivers/usb/host/ehci-sched.c                 |   2 +-
 drivers/usb/host/fotg210-hcd.c                |   9 +-
 drivers/usb/host/isp116x-hcd.c                |   6 +-
 drivers/usb/host/isp1362-hcd.c                |   2 +-
 drivers/usb/host/max3421-hcd.c                |   6 +-
 drivers/usb/host/ohci-hcd.c                   |   4 +-
 drivers/usb/host/ohci-hub.c                   |   2 +-
 drivers/usb/host/ohci-q.c                     |   6 +-
 drivers/usb/host/ohci-tmio.c                  |   6 +-
 drivers/usb/host/oxu210hp-hcd.c               |   9 +-
 drivers/usb/host/pci-quirks.c                 |   3 +-
 drivers/usb/host/xhci-dbgcap.c                |   2 +-
 drivers/usb/host/xhci-hub.c                   |   2 +-
 drivers/usb/host/xhci-mem.c                   |   6 +-
 drivers/usb/host/xhci-ring.c                  |   2 +-
 drivers/usb/host/xhci.c                       |   2 +-
 drivers/usb/image/mdc800.c                    |   3 +-
 drivers/usb/isp1760/isp1760-hcd.c             |   4 +-
 drivers/usb/misc/appledisplay.c               |   2 +-
 drivers/usb/misc/usbtest.c                    |   8 +-
 drivers/usb/misc/yurex.c                      |   2 +-
 drivers/usb/mtu3/mtu3_core.c                  |   2 +-
 drivers/usb/musb/cppi_dma.c                   |   2 +-
 drivers/usb/musb/musb_core.c                  |  13 +-
 drivers/usb/musb/musb_dsps.c                  |   8 +-
 drivers/usb/musb/musb_gadget_ep0.c            |   6 +-
 drivers/usb/musb/musb_host.c                  |   7 +-
 drivers/usb/musb/musb_virthub.c               |   2 +-
 drivers/usb/musb/omap2430.c                   |   2 +-
 drivers/usb/musb/tusb6010.c                   |   2 +-
 drivers/usb/phy/phy-ab8500-usb.c              |  12 +-
 drivers/usb/phy/phy-fsl-usb.c                 |   4 +-
 drivers/usb/phy/phy-isp1301-omap.c            |  15 ++-
 drivers/usb/phy/phy-mv-usb.c                  |   2 +-
 drivers/usb/renesas_usbhs/mod_gadget.c        |   2 +-
 drivers/usb/renesas_usbhs/pipe.c              |   2 +-
 drivers/usb/serial/cypress_m8.c               |   4 +-
 drivers/usb/serial/io_edgeport.c              |   4 +-
 drivers/usb/serial/kobil_sct.c                |   2 +-
 drivers/usb/serial/upd78f0730.c               |   2 +-
 drivers/usb/storage/sddr55.c                  |   2 +-
 drivers/usb/storage/uas.c                     |   2 +-
 drivers/usb/typec/tcpm/tcpci.c                |   2 +-
 drivers/usb/usbip/stub_rx.c                   |   2 +-
 drivers/usb/usbip/vhci_hcd.c                  |   7 +-
 drivers/usb/usbip/vhci_rx.c                   |   2 +-
 drivers/usb/usbip/vudc_transfer.c             |   4 +-
 drivers/vfio/pci/vfio_pci.c                   |   2 +-
 drivers/vfio/vfio_iommu_type1.c               |   2 +-
 drivers/video/backlight/adp8860_bl.c          |   2 +-
 drivers/video/fbdev/acornfb.c                 |   2 +-
 drivers/video/fbdev/arcfb.c                   |   3 +-
 drivers/video/fbdev/atmel_lcdfb.c             |   4 +-
 drivers/video/fbdev/aty/radeon_pm.c           |   6 +-
 drivers/video/fbdev/cirrusfb.c                |   4 +-
 drivers/video/fbdev/controlfb.c               |   2 +-
 drivers/video/fbdev/core/fbmem.c              |   2 +-
 drivers/video/fbdev/fsl-diu-fb.c              |   4 +-
 drivers/video/fbdev/gxt4500.c                 |   2 +-
 drivers/video/fbdev/hyperv_fb.c               |   4 +-
 drivers/video/fbdev/i740fb.c                  |   2 +-
 drivers/video/fbdev/nvidia/nv_hw.c            |   2 +-
 drivers/video/fbdev/offb.c                    |   4 +-
 drivers/video/fbdev/omap/lcdc.c               |   4 +-
 drivers/video/fbdev/omap/omapfb_main.c        |  20 +--
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c  |   4 +-
 .../video/fbdev/omap2/omapfb/omapfb-ioctl.c   |   3 +-
 .../video/fbdev/omap2/omapfb/omapfb-main.c    |   2 +-
 drivers/video/fbdev/pm2fb.c                   |   4 +-
 drivers/video/fbdev/pxafb.c                   |   3 +-
 drivers/video/fbdev/riva/fbdev.c              |   2 +-
 drivers/video/fbdev/s3c-fb.c                  |   7 +-
 drivers/video/fbdev/sa1100fb.c                |   3 +-
 drivers/video/fbdev/savage/savagefb_driver.c  |   4 +-
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |   4 +-
 drivers/video/fbdev/sis/sis_main.c            |   8 +-
 drivers/video/fbdev/sm501fb.c                 |   3 +-
 drivers/video/fbdev/stifb.c                   |   4 +-
 drivers/video/fbdev/tdfxfb.c                  |   2 +-
 drivers/video/fbdev/via/lcd.c                 |   2 +-
 drivers/video/fbdev/xen-fbfront.c             |   2 +-
 drivers/virt/vboxguest/vboxguest_core.c       |   2 +-
 drivers/virt/vboxguest/vboxguest_utils.c      |   2 +-
 drivers/watchdog/advantechwdt.c               |   2 +-
 drivers/watchdog/alim1535_wdt.c               |   2 +-
 drivers/watchdog/alim7101_wdt.c               |   2 +-
 drivers/watchdog/ar7_wdt.c                    |   3 +-
 drivers/watchdog/ath79_wdt.c                  |   3 +-
 drivers/watchdog/eurotechwdt.c                |   3 +-
 drivers/watchdog/f71808e_wdt.c                |   6 +-
 drivers/watchdog/gef_wdt.c                    |   3 +-
 drivers/watchdog/geodewdt.c                   |   2 +-
 drivers/watchdog/ib700wdt.c                   |   3 +-
 drivers/watchdog/it8712f_wdt.c                |   2 +-
 drivers/watchdog/ixp4xx_wdt.c                 |   3 +-
 drivers/watchdog/m54xx_wdt.c                  |   3 +-
 drivers/watchdog/machzwd.c                    |   2 +-
 drivers/watchdog/mv64x60_wdt.c                |   3 +-
 drivers/watchdog/nv_tco.c                     |   2 +-
 drivers/watchdog/pc87413_wdt.c                |   2 +-
 drivers/watchdog/pcwd.c                       |   3 +-
 drivers/watchdog/pcwd_pci.c                   |   3 +-
 drivers/watchdog/pcwd_usb.c                   |   3 +-
 drivers/watchdog/rc32434_wdt.c                |   2 +-
 drivers/watchdog/riowd.c                      |   3 +-
 drivers/watchdog/sa1100_wdt.c                 |   3 +-
 drivers/watchdog/sb_wdog.c                    |   3 +-
 drivers/watchdog/sbc60xxwdt.c                 |   2 +-
 drivers/watchdog/sbc7240_wdt.c                |   2 +-
 drivers/watchdog/sbc_fitpc2_wdt.c             |   3 +-
 drivers/watchdog/sc1200wdt.c                  |   3 +-
 drivers/watchdog/sc520_wdt.c                  |   2 +-
 drivers/watchdog/sch311x_wdt.c                |   2 +-
 drivers/watchdog/scx200_wdt.c                 |   2 +-
 drivers/watchdog/smsc37b787_wdt.c             |   2 +-
 drivers/watchdog/w83877f_wdt.c                |   2 +-
 drivers/watchdog/w83977f_wdt.c                |   3 +-
 drivers/watchdog/wafer5823wdt.c               |   2 +-
 drivers/watchdog/watchdog_dev.c               |   2 +-
 drivers/watchdog/wdrtas.c                     |   3 +-
 drivers/watchdog/wdt.c                        |   2 +-
 drivers/watchdog/wdt285.c                     |   2 +-
 drivers/watchdog/wdt977.c                     |   3 +-
 drivers/watchdog/wdt_pci.c                    |   2 +-
 drivers/xen/pvcalls-front.c                   |   2 +-
 drivers/xen/xen-acpi-memhotplug.c             |   2 +-
 drivers/xen/xen-pciback/xenbus.c              |   2 +-
 drivers/xen/xen-scsiback.c                    |   2 +-
 drivers/xen/xenbus/xenbus_probe_frontend.c    |   6 +-
 fs/9p/vfs_file.c                              |   2 +-
 fs/adfs/dir_f.c                               |  12 +-
 fs/affs/inode.c                               |   2 +-
 fs/affs/super.c                               |   6 +-
 fs/afs/cmservice.c                            |  21 ++--
 fs/afs/file.c                                 |   3 +-
 fs/afs/flock.c                                |   3 +-
 fs/afs/fsclient.c                             |  12 +-
 fs/afs/misc.c                                 |  18 +--
 fs/afs/rotate.c                               |   2 +-
 fs/afs/rxrpc.c                                |   7 +-
 fs/afs/vlclient.c                             |  24 ++--
 fs/afs/write.c                                |   2 +-
 fs/afs/yfsclient.c                            |  24 ++--
 fs/aio.c                                      |   2 +-
 fs/btrfs/ctree.c                              |   2 +-
 fs/btrfs/ref-verify.c                         |   2 +-
 fs/btrfs/super.c                              |   6 +-
 fs/btrfs/volumes.h                            |   2 +-
 fs/buffer.c                                   |   2 +-
 fs/ceph/dir.c                                 |   2 +-
 fs/ceph/file.c                                |   2 +-
 fs/cifs/cifssmb.c                             |   2 +-
 fs/cifs/connect.c                             |  10 +-
 fs/cifs/sess.c                                |   6 +-
 fs/cifs/smb2pdu.c                             |   6 +-
 fs/configfs/dir.c                             |   4 +-
 fs/dax.c                                      |   2 +-
 fs/dlm/lock.c                                 |   2 +-
 fs/erofs/zmap.c                               |   6 +-
 fs/ext2/inode.c                               |   4 +-
 fs/ext2/super.c                               |   2 +-
 fs/ext4/hash.c                                |   4 +-
 fs/ext4/indirect.c                            |  12 +-
 fs/ext4/readpage.c                            |   4 +-
 fs/f2fs/f2fs.h                                |   2 +-
 fs/f2fs/node.c                                |   4 +-
 fs/fcntl.c                                    |   4 +-
 fs/fs_context.c                               |   2 +-
 fs/fsopen.c                                   |   2 +-
 fs/gfs2/bmap.c                                |   4 +-
 fs/gfs2/quota.c                               |   2 +-
 fs/hfsplus/wrapper.c                          |   2 +-
 fs/io_uring.c                                 |   4 +-
 fs/iomap/seek.c                               |   4 +-
 fs/jffs2/fs.c                                 |   3 +-
 fs/jffs2/readinode.c                          |   4 +-
 fs/libfs.c                                    |   4 +-
 fs/locks.c                                    |   6 +-
 fs/namei.c                                    |   2 +-
 fs/nfs/blocklayout/blocklayout.c              |   2 +-
 fs/nfs/dir.c                                  |   2 +-
 fs/nfs/filelayout/filelayout.c                |   2 +-
 fs/nfs/flexfilelayout/flexfilelayout.c        |   2 +-
 fs/nfs/fs_context.c                           |  22 ++--
 fs/nfs/nfs3acl.c                              |   4 +-
 fs/nfs/nfs4file.c                             |   2 +-
 fs/nfs/nfs4idmap.c                            |   4 +-
 fs/nfs/nfs4proc.c                             |  32 ++---
 fs/nfs/nfs4state.c                            |  14 +--
 fs/nfs/pagelist.c                             |   2 +-
 fs/nfs/pnfs.c                                 |   2 +-
 fs/nfs_common/nfsacl.c                        |   2 +-
 fs/nfsd/blocklayout.c                         |   4 +-
 fs/nfsd/nfs4callback.c                        |   2 +-
 fs/nfsd/nfs4layouts.c                         |   2 +-
 fs/nfsd/nfs4proc.c                            |   2 +-
 fs/nfsd/nfs4state.c                           |  12 +-
 fs/nfsd/nfsfh.c                               |   4 +-
 fs/nfsd/nfsproc.c                             |   3 +-
 fs/nfsd/nfssvc.c                              |   2 +-
 fs/nfsd/vfs.c                                 |   4 +-
 fs/nilfs2/bmap.c                              |   2 +-
 fs/nilfs2/recovery.c                          |   2 +-
 fs/nilfs2/segment.c                           |  19 +--
 fs/notify/fanotify/fanotify_user.c            |   2 +-
 fs/ocfs2/cluster/quorum.c                     |   2 +-
 fs/quota/quota.c                              |   2 +-
 fs/seq_file.c                                 |   2 +-
 fs/signalfd.c                                 |   2 +-
 fs/ubifs/lprops.c                             |   4 +-
 fs/udf/symlink.c                              |   2 +-
 fs/ufs/util.h                                 |  12 +-
 fs/vboxsf/utils.c                             |   2 +-
 fs/xfs/libxfs/xfs_ag_resv.c                   |   4 +-
 fs/xfs/libxfs/xfs_alloc.c                     |   2 +-
 fs/xfs/libxfs/xfs_da_btree.c                  |   2 +-
 fs/xfs/libxfs/xfs_inode_buf.c                 |   4 +-
 fs/xfs/scrub/bmap.c                           |   2 +-
 fs/xfs/scrub/btree.c                          |   2 +-
 fs/xfs/scrub/common.c                         |   6 +-
 fs/xfs/scrub/dabtree.c                        |   2 +-
 fs/xfs/scrub/repair.c                         |   2 +-
 fs/xfs/xfs_bmap_util.c                        |   3 +-
 fs/xfs/xfs_export.c                           |   4 +-
 fs/xfs/xfs_file.c                             |   2 +-
 fs/xfs/xfs_fsmap.c                            |   2 +-
 fs/xfs/xfs_inode.c                            |   2 +-
 fs/xfs/xfs_ioctl.c                            |   4 +-
 fs/xfs/xfs_iomap.c                            |   2 +-
 fs/xfs/xfs_log.c                              |   2 +-
 fs/xfs/xfs_trans_buf.c                        |   2 +-
 fs/zonefs/super.c                             |   2 +-
 include/linux/compat.h                        |   6 +-
 include/linux/filter.h                        |   2 +-
 include/linux/jhash.h                         |  39 ++++--
 include/linux/mm.h                            |   9 +-
 include/linux/signal.h                        |  12 +-
 include/linux/skbuff.h                        |  12 +-
 include/math-emu/op-common.h                  |   6 +-
 init/do_mounts_md.c                           |   4 +-
 ipc/sem.c                                     |   4 +-
 ipc/shm.c                                     |   4 +-
 kernel/auditfilter.c                          |   2 +-
 kernel/bpf/cgroup.c                           |   4 +-
 kernel/bpf/syscall.c                          |   2 +-
 kernel/bpf/verifier.c                         |   4 +-
 kernel/capability.c                           |   2 +-
 kernel/compat.c                               |   6 +-
 kernel/debug/gdbstub.c                        |   6 +-
 kernel/debug/kdb/kdb_keyboard.c               |   4 +-
 kernel/debug/kdb/kdb_support.c                |   6 +-
 kernel/events/core.c                          |   3 +-
 kernel/futex.c                                |   4 +-
 kernel/gcov/gcc_3_4.c                         |   6 +-
 kernel/irq/handle.c                           |   3 +-
 kernel/irq/manage.c                           |   5 +-
 kernel/kallsyms.c                             |   4 +-
 kernel/power/hibernate.c                      |   2 +-
 kernel/power/qos.c                            |   4 +-
 kernel/sched/core.c                           |   2 +-
 kernel/sched/topology.c                       |   6 +-
 kernel/signal.c                               |   2 +-
 kernel/sys.c                                  |   3 +-
 kernel/time/hrtimer.c                         |   2 +-
 kernel/time/posix-timers.c                    |   4 +-
 kernel/time/tick-broadcast.c                  |   2 +-
 kernel/time/timer.c                           |   2 +-
 kernel/trace/blktrace.c                       |   2 +-
 kernel/trace/trace_events_filter.c            |   4 +-
 lib/asn1_decoder.c                            |   6 +-
 lib/assoc_array.c                             |   2 +-
 lib/bootconfig.c                              |   4 +-
 lib/cmdline.c                                 |  10 +-
 lib/dim/net_dim.c                             |   2 +-
 lib/dim/rdma_dim.c                            |   4 +-
 lib/glob.c                                    |   2 +-
 lib/nlattr.c                                  |   5 +-
 lib/siphash.c                                 |  54 ++++++---
 lib/ts_fsm.c                                  |   3 +-
 lib/vsprintf.c                                |  18 ++-
 lib/xz/xz_dec_lzma2.c                         |   8 +-
 lib/xz/xz_dec_stream.c                        |  32 ++---
 lib/zlib_inflate/inflate.c                    |  24 ++--
 lib/zstd/bitstream.h                          |  10 +-
 lib/zstd/compress.c                           |   3 +-
 lib/zstd/decompress.c                         |  17 +--
 lib/zstd/huf_compress.c                       |   4 +-
 mm/gup.c                                      |   2 +-
 mm/hugetlb_cgroup.c                           |   6 +-
 mm/ksm.c                                      |   3 +-
 mm/list_lru.c                                 |   2 +-
 mm/memcontrol.c                               |   2 +-
 mm/mempolicy.c                                |   3 -
 mm/mmap.c                                     |   5 +-
 mm/shmem.c                                    |   2 +-
 mm/zsmalloc.c                                 |   2 +-
 net/8021q/vlan_dev.c                          |   2 +-
 net/9p/trans_xen.c                            |   2 +-
 net/atm/common.c                              |   4 +-
 net/atm/lec.c                                 |   2 +-
 net/atm/resources.c                           |   8 +-
 net/bluetooth/hci_event.c                     |   6 +-
 net/bluetooth/hci_sock.c                      |   4 +-
 net/bluetooth/l2cap_core.c                    |  22 ++--
 net/bluetooth/l2cap_sock.c                    |   4 +-
 net/bluetooth/mgmt.c                          |   4 +-
 net/bluetooth/rfcomm/core.c                   |   3 +-
 net/bluetooth/rfcomm/sock.c                   |   3 +-
 net/bluetooth/smp.c                           |   2 +-
 net/bpf/test_run.c                            |   2 +-
 net/bridge/netfilter/ebtables.c               |   2 +-
 net/can/j1939/socket.c                        |   2 +-
 net/can/j1939/transport.c                     |  21 ++--
 net/ceph/ceph_hash.c                          |  20 +--
 net/ceph/crush/mapper.c                       |   2 +-
 net/ceph/messenger.c                          |   4 +-
 net/ceph/mon_client.c                         |   2 +-
 net/ceph/osd_client.c                         |   6 +-
 net/core/dev.c                                |   4 +-
 net/core/dev_ioctl.c                          |   2 +-
 net/core/devlink.c                            |   2 +-
 net/core/drop_monitor.c                       |   2 +-
 net/core/filter.c                             |   2 +-
 net/core/pktgen.c                             |   2 +-
 net/core/skmsg.c                              |   3 +-
 net/core/sock.c                               |   2 +-
 net/dccp/ccids/ccid3.c                        |   2 +-
 net/dccp/feat.c                               |   3 +-
 net/dccp/input.c                              |  10 +-
 net/dccp/options.c                            |   2 +-
 net/dccp/output.c                             |   9 +-
 net/dccp/proto.c                              |   8 +-
 net/decnet/af_decnet.c                        |   6 +-
 net/decnet/dn_nsp_in.c                        |   2 +-
 net/decnet/dn_table.c                         |   2 +-
 net/decnet/sysctl_net_decnet.c                |   2 +-
 net/dsa/slave.c                               |   2 +-
 net/ieee802154/6lowpan/reassembly.c           |   3 +-
 net/ieee802154/6lowpan/rx.c                   |   6 +-
 net/ipv4/af_inet.c                            |   4 +-
 net/ipv4/ah4.c                                |   2 +-
 net/ipv4/arp.c                                |   2 +-
 net/ipv4/devinet.c                            |   6 +-
 net/ipv4/fib_semantics.c                      |   4 +-
 net/ipv4/icmp.c                               |   2 +-
 net/ipv4/ip_output.c                          |   2 +-
 net/ipv4/ipmr.c                               |   2 +-
 net/ipv4/netfilter/nf_log_ipv4.c              |   2 +-
 net/ipv4/netfilter/nf_nat_pptp.c              |   4 +-
 net/ipv4/nexthop.c                            |   2 +-
 net/ipv4/tcp.c                                |   2 +-
 net/ipv4/tcp_input.c                          |   6 +-
 net/ipv4/tcp_ipv4.c                           |   4 +-
 net/ipv4/udp.c                                |   2 +-
 net/ipv6/addrconf.c                           |   6 +-
 net/ipv6/ah6.c                                |   2 +-
 net/ipv6/exthdrs.c                            |   2 +-
 net/ipv6/icmp.c                               |   2 +-
 net/ipv6/ip6_fib.c                            |   8 +-
 net/ipv6/ip6mr.c                              |   2 +-
 net/ipv6/ndisc.c                              |   2 +-
 net/ipv6/netfilter/nf_log_ipv6.c              |   2 +-
 net/ipv6/raw.c                                |   8 +-
 net/ipv6/route.c                              |   2 +-
 net/ipv6/tcp_ipv6.c                           |   2 +-
 net/iucv/af_iucv.c                            |  13 +-
 net/l2tp/l2tp_netlink.c                       |   2 +-
 net/mac80211/cfg.c                            |   6 +-
 net/mac80211/chan.c                           |   2 +-
 net/mac80211/ht.c                             |   4 +-
 net/mac80211/ibss.c                           |   4 +-
 net/mac80211/iface.c                          |  11 +-
 net/mac80211/key.c                            |   3 +-
 net/mac80211/mesh.c                           |   4 +-
 net/mac80211/mesh_hwmp.c                      |   2 +-
 net/mac80211/mesh_plink.c                     |   2 +-
 net/mac80211/mlme.c                           |   4 +-
 net/mac80211/offchannel.c                     |   4 +-
 net/mac80211/rx.c                             |   4 +-
 net/mac80211/tdls.c                           |   8 +-
 net/mac80211/tx.c                             |  12 +-
 net/mac80211/util.c                           |  11 +-
 net/mac80211/wme.c                            |   2 +-
 net/mpls/af_mpls.c                            |   2 +-
 net/mptcp/protocol.c                          |   2 +-
 net/ncsi/ncsi-manage.c                        |   4 +-
 net/netfilter/ipset/ip_set_core.c             |   2 +-
 net/netfilter/ipvs/ip_vs_proto_tcp.c          |   2 +-
 net/netfilter/ipvs/ip_vs_proto_udp.c          |   2 +-
 net/netfilter/nf_conntrack_h323_asn1.c        |   6 +-
 net/netfilter/nf_conntrack_proto.c            |   2 +-
 net/netfilter/nf_conntrack_proto_tcp.c        |   2 +-
 net/netfilter/nf_conntrack_standalone.c       |   2 +-
 net/netfilter/nf_nat_core.c                   |  10 +-
 net/netfilter/nf_synproxy_core.c              |   6 +-
 net/netfilter/nf_tables_api.c                 |   8 +-
 net/netfilter/nf_tables_core.c                |   2 +-
 net/netfilter/nfnetlink_cttimeout.c           |   2 +-
 net/netfilter/nft_cmp.c                       |   4 +-
 net/netfilter/nft_ct.c                        |   4 +-
 net/netfilter/nft_fib.c                       |   2 +-
 net/netfilter/nft_payload.c                   |   2 +-
 net/netfilter/utils.c                         |   8 +-
 net/netfilter/x_tables.c                      |   2 +-
 net/netrom/nr_in.c                            |   2 +-
 net/netrom/nr_route.c                         |   8 +-
 net/openvswitch/conntrack.c                   |   4 +-
 net/openvswitch/flow.c                        |   2 +-
 net/packet/af_packet.c                        |   3 +-
 net/phonet/pep.c                              |  10 +-
 net/rds/send.c                                |   3 +-
 net/rose/rose_in.c                            |   2 +-
 net/rose/rose_route.c                         |   4 +-
 net/rxrpc/af_rxrpc.c                          |   7 +-
 net/rxrpc/call_accept.c                       |   2 +-
 net/rxrpc/conn_client.c                       |   2 +-
 net/rxrpc/input.c                             |   6 +-
 net/rxrpc/local_object.c                      |   2 +-
 net/rxrpc/recvmsg.c                           |   2 +-
 net/rxrpc/sendmsg.c                           |   6 +-
 net/sched/act_csum.c                          |   3 +-
 net/sched/act_ct.c                            |   2 +-
 net/sched/sch_cake.c                          |   2 +-
 net/sched/sch_cbq.c                           |   2 +-
 net/sched/sch_drr.c                           |   2 +-
 net/sched/sch_ets.c                           |   2 +-
 net/sched/sch_fq_codel.c                      |   2 +-
 net/sched/sch_fq_pie.c                        |   2 +-
 net/sched/sch_hfsc.c                          |   2 +-
 net/sched/sch_htb.c                           |   2 +-
 net/sched/sch_multiq.c                        |   2 +-
 net/sched/sch_prio.c                          |   2 +-
 net/sched/sch_qfq.c                           |   2 +-
 net/sched/sch_sfb.c                           |   2 +-
 net/sched/sch_sfq.c                           |   2 +-
 net/sctp/ipv6.c                               |   2 +-
 net/sctp/outqueue.c                           |   6 +-
 net/sctp/sm_make_chunk.c                      |   2 +-
 net/sctp/sm_sideeffect.c                      |   3 +-
 net/sctp/sm_statefuns.c                       |   2 +-
 net/socket.c                                  |   6 +-
 net/sunrpc/auth_gss/gss_krb5_wrap.c           |   2 +-
 net/sunrpc/clnt.c                             |  22 ++--
 net/sunrpc/xprt.c                             |   2 +-
 net/sunrpc/xprtsock.c                         |   8 +-
 net/tipc/bearer.c                             |   2 +-
 net/tipc/group.c                              |   2 +-
 net/tipc/link.c                               |   2 +-
 net/tipc/socket.c                             |   4 +-
 net/unix/af_unix.c                            |   2 +-
 net/wireless/chan.c                           |   4 +-
 net/wireless/mlme.c                           |   2 +-
 net/wireless/nl80211.c                        |  20 +--
 net/wireless/scan.c                           |   2 +-
 net/wireless/sme.c                            |   4 +-
 net/wireless/util.c                           |   4 +-
 net/wireless/wext-compat.c                    |   4 +-
 net/x25/x25_facilities.c                      |   2 +-
 net/x25/x25_in.c                              |   2 +-
 net/xfrm/xfrm_policy.c                        |   2 +-
 samples/bpf/hbm.c                             |   2 +-
 security/apparmor/domain.c                    |   2 +-
 security/apparmor/lib.c                       |   4 +-
 security/integrity/ima/ima_appraise.c         |   4 +-
 security/integrity/ima/ima_policy.c           |   8 +-
 security/integrity/ima/ima_template_lib.c     |   2 +-
 security/keys/process_keys.c                  |   6 +-
 security/keys/request_key.c                   |  12 +-
 security/selinux/hooks.c                      |   8 +-
 security/selinux/ss/mls.c                     |   3 +-
 security/smack/smack_lsm.c                    |   2 +-
 security/tomoyo/common.c                      |  18 +--
 security/tomoyo/file.c                        |   2 +-
 sound/atmel/ac97c.c                           |  16 +--
 sound/core/memalloc.c                         |   2 +-
 sound/core/oss/pcm_oss.c                      |   2 +-
 sound/core/oss/pcm_plugin.c                   |   2 +-
 sound/core/pcm_native.c                       |   8 +-
 sound/core/seq/oss/seq_oss_timer.c            |   2 +-
 sound/core/seq/seq_midi_emul.c                |   2 +-
 sound/drivers/opl3/opl3_midi.c                |   4 +-
 sound/isa/galaxy/galaxy.c                     |   6 +-
 sound/isa/msnd/msnd_pinnacle_mixer.c          |   3 +-
 sound/isa/opti9xx/miro.c                      |  12 +-
 sound/isa/opti9xx/opti92x-ad1848.c            |  13 +-
 sound/isa/sb/sb8_main.c                       |  10 +-
 sound/oss/dmasound/dmasound_atari.c           |   2 +-
 sound/oss/dmasound/dmasound_core.c            |   4 +-
 sound/pci/ac97/ac97_codec.c                   |   4 +-
 sound/pci/atiixp.c                            |   6 +-
 sound/pci/azt3328.c                           |   2 +-
 sound/pci/echoaudio/echoaudio.c               |   4 +-
 sound/pci/emu10k1/emupcm.c                    |   5 +-
 sound/pci/hda/hda_beep.c                      |   2 +-
 sound/pci/hda/patch_conexant.c                |   2 +-
 sound/pci/hda/patch_realtek.c                 |   4 +-
 sound/pci/ice1712/delta.c                     |   2 +-
 sound/pci/intel8x0.c                          |   8 +-
 sound/pci/mixart/mixart.c                     |   2 +-
 sound/pci/mixart/mixart_core.c                |   2 +-
 sound/pci/nm256/nm256.c                       |   6 +-
 sound/pci/oxygen/oxygen_pcm.c                 |   2 +-
 sound/pci/ymfpci/ymfpci_main.c                |   2 +-
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c        |   4 +-
 sound/ppc/snd_ps3.c                           |   4 +-
 sound/soc/atmel/mchp-i2s-mcc.c                |   2 +-
 sound/soc/codecs/ab8500-codec.c               |   2 +-
 sound/soc/codecs/adau1761.c                   |   4 +-
 sound/soc/codecs/adau17x1.c                   |   4 +-
 sound/soc/codecs/adav80x.c                    |   2 +-
 sound/soc/codecs/ak4613.c                     |   6 +-
 sound/soc/codecs/es8328.c                     |   4 +-
 sound/soc/codecs/jz4770.c                     |   2 +-
 sound/soc/codecs/max9860.c                    |   2 +-
 sound/soc/codecs/msm8916-wcd-analog.c         |   2 +-
 sound/soc/codecs/rt274.c                      |   4 +-
 sound/soc/codecs/rt5640.c                     |   4 +-
 sound/soc/codecs/rt5677.c                     |   2 +-
 sound/soc/codecs/sta32x.c                     |   2 +-
 sound/soc/codecs/sta350.c                     |   2 +-
 sound/soc/codecs/tas2552.c                    |   2 +-
 sound/soc/codecs/tlv320aic23.c                |   2 +-
 sound/soc/codecs/tlv320aic31xx.c              |   3 +-
 sound/soc/codecs/tpa6130a2.c                  |   2 +-
 sound/soc/codecs/wm8753.c                     |   6 +-
 sound/soc/codecs/wm8903.c                     |   2 +-
 sound/soc/codecs/wm8904.c                     |   5 +-
 sound/soc/codecs/wm8955.c                     |   2 +-
 sound/soc/codecs/wm8960.c                     |   2 +-
 sound/soc/codecs/wm8961.c                     |   2 +-
 sound/soc/codecs/wm8962.c                     |   2 +-
 sound/soc/codecs/wm8993.c                     |   4 +-
 sound/soc/codecs/wm8994.c                     |   4 +-
 sound/soc/codecs/wm8995.c                     |   2 +-
 sound/soc/codecs/wm8996.c                     |   2 +-
 sound/soc/codecs/wm9081.c                     |   2 +-
 sound/soc/fsl/fsl_ssi.c                       |   2 +-
 sound/soc/hisilicon/hi6210-i2s.c              |   4 +-
 sound/soc/intel/baytrail/sst-baytrail-pcm.c   |   2 +-
 sound/soc/intel/boards/bytcht_es8316.c        |   2 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |   4 +-
 sound/soc/intel/skylake/skl-pcm.c             |   3 +-
 sound/soc/meson/axg-tdm-interface.c           |   8 +-
 sound/soc/pxa/pxa-ssp.c                       |   2 +-
 sound/soc/rockchip/rockchip_pdm.c             |   6 +-
 sound/soc/samsung/i2s.c                       |   2 +-
 sound/soc/soc-core.c                          |   3 +-
 sound/soc/soc-topology.c                      |   4 +-
 sound/soc/sof/intel/hda-dai.c                 |   6 +-
 sound/soc/sof/pcm.c                           |   5 +-
 sound/soc/sof/topology.c                      |   2 +-
 sound/soc/ti/davinci-i2s.c                    |   2 +-
 sound/soc/ti/n810.c                           |   2 +-
 sound/soc/ti/omap-dmic.c                      |   4 +-
 sound/soc/ti/omap-mcpdm.c                     |   8 +-
 sound/soc/ti/rx51.c                           |   2 +-
 sound/soc/zte/zx-i2s.c                        |   4 +-
 sound/soc/zte/zx-spdif.c                      |   2 +-
 sound/sparc/dbri.c                            |   8 +-
 sound/usb/caiaq/audio.c                       |   2 +-
 sound/usb/caiaq/device.c                      |   2 +-
 sound/usb/card.c                              |   3 +-
 sound/usb/clock.c                             |   2 +-
 sound/usb/midi.c                              |   2 +-
 sound/usb/pcm.c                               |   2 +-
 sound/usb/stream.c                            |   3 +-
 sound/xen/xen_snd_front.c                     |   3 -
 sound/xen/xen_snd_front_evtchnl.c             |   4 -
 virt/kvm/arm/hyp/vgic-v3-sr.c                 |  16 +--
 1831 files changed, 4064 insertions(+), 4709 deletions(-)

-- 
2.24.0

