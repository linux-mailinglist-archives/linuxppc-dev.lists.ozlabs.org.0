Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA55C5F6EA9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 22:09:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mk2bV5kwMz3drw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 07:09:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzErui7Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JzErui7Y;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mk2ZW5w8Lz2yPN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 07:08:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665086932; x=1696622932;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=swAucizbwUxhdAX/SMI13ZfrywiGOKfoDpdfjfgG+SE=;
  b=JzErui7YQ3ZIspOihKF1McgOEvhNd/jRUwp6d8s5icrgPRgGeSog2u66
   N4AjnOboWCnKNPSB3oX9I/Uv/8ko5CFYrKttbrTCpLJ7RdZdtC9yvU0js
   TXKdpy1Kwqm09auUuee4m4YBL9h+EyOh7igvjGEAjbKs7fC0ls8YFEZNs
   r7bbkWghTjTJ62EOOJlTFbg+q2WbckyjgUSWJmkHjASdXQTgD51pB70xX
   0qllo6yyxLnyWCDgujtiKbmuqrBUT3qM9PFmbx9gg5DrVoYjfnxmE6r7k
   DvmdFdhKdu0W+RR/gYUN+AHxTCjPxrL6SGq6lU2dj6hLbjxU++xTJ0HH2
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="283275077"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="283275077"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 13:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="953763896"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="953763896"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Oct 2022 13:08:43 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ogXAh-0000QR-0v;
	Thu, 06 Oct 2022 20:08:43 +0000
Date: Fri, 07 Oct 2022 04:07:45 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 7da9fed0474b4cd46055dd92d55c42faf32c19ac
Message-ID: <633f3591.GEF0zMh+7lpySqUP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
Cc: amd-gfx@lists.freedesktop.org, kvm@vger.kernel.org, netdev@vger.kernel.org, linux-nvme@lists.infradead.org, Linux Memory Management List <linux-mm@kvack.org>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 7da9fed0474b4cd46055dd92d55c42faf32c19ac  Add linux-next specific files for 20221006

Error/Warning reports:

https://lore.kernel.org/linux-doc/202210070057.NpbaMyxB-lkp@intel.com
https://lore.kernel.org/llvm/202209220019.Yr2VuXhg-lkp@intel.com
https://lore.kernel.org/llvm/202210062012.XvdAjoOT-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
arch/loongarch/mm/init.c:166:24: warning: variable 'new' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/virtual/virtual_link_hwss.c:40:6: warning: no previous prototype for 'virtual_disable_link_output' [-Wmissing-prototypes]
drivers/net/ethernet/freescale/fman/fman_memac.c:1246 memac_initialization() error: uninitialized symbol 'fixed_link'.
drivers/nvme/target/loop.c:578 nvme_loop_create_ctrl() warn: 'opts->queue_size - 1' 4294967295 can't fit into 65535 'ctrl->ctrl.sqsize'
drivers/vfio/pci/mlx5/cmd.c:432 combine_ranges() error: uninitialized symbol 'last'.
drivers/vfio/pci/mlx5/cmd.c:453 combine_ranges() error: potentially dereferencing uninitialized 'comb_end'.
drivers/vfio/pci/mlx5/cmd.c:453 combine_ranges() error: potentially dereferencing uninitialized 'comb_start'.
drivers/vfio/pci/vfio_pci_core.c:1035 vfio_pci_ioctl_get_region_info() warn: potential spectre issue 'vdev->region' [r]
drivers/vfio/pci/vfio_pci_core.c:958 vfio_pci_ioctl_get_region_info() warn: potential spectre issue 'pdev->resource' [w]
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]
include/linux/compiler_types.h:357:45: error: call to '__compiletime_assert_417' declared with attribute error: FIELD_GET: mask is not constant
lib/test_vmalloc.c:154 random_size_alloc_test() error: uninitialized symbol 'n'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- arm64-randconfig-r006-20221002
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-randconfig-r016-20221003
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- csky-buildonly-randconfig-r005-20221002
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a013-20221003
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a014-20221003
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a015-20221003
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-c001
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-c021
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-r024-20221003
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- ia64-randconfig-r026-20221003
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- loongarch-alldefconfig
|   `-- arch-loongarch-mm-init.c:warning:variable-new-set-but-not-used
|-- loongarch-randconfig-c024-20221002
|   |-- arch-loongarch-mm-init.c:warning:variable-new-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- loongarch-randconfig-c44-20221002
|   `-- arch-loongarch-mm-init.c:warning:variable-new-set-but-not-used
|-- m68k-randconfig-c041-20221002
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-virtual_disable_link_output
|-- m68k-randconfig-s051-20221002
clang_recent_errors
|-- arm-omap1_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- arm-pcm027_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-buildonly-randconfig-r005-20221003
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|-- hexagon-randconfig-r011-20221002
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r015-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r041-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a002-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a005-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a006-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- mips-malta_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- mips-rs90_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- powerpc-mvme5100_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- riscv-buildonly-randconfig-r002-20221002
|   `-- ERROR:riscv_cbom_block_size-arch-riscv-kvm-kvm.ko-undefined
|-- riscv-randconfig-r031-20221003
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output
|-- riscv-rv32_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- s390-randconfig-r005-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a001-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a003-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- x86_64-randconfig-a005-20221003
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
`-- x86_64-rhel-8.3-rust
    `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg

elapsed time: 731m

configs tested: 87
configs skipped: 5

gcc tested configs:
arc                                 defconfig
arc                               allnoconfig
alpha                             allnoconfig
alpha                               defconfig
riscv                             allnoconfig
um                             i386_defconfig
powerpc                           allnoconfig
csky                              allnoconfig
um                           x86_64_defconfig
arm                                 defconfig
s390                             allmodconfig
riscv                randconfig-r042-20221003
i386                 randconfig-a014-20221003
arc                  randconfig-r043-20221003
s390                                defconfig
i386                                defconfig
x86_64                          rhel-8.3-func
i386                 randconfig-a011-20221003
x86_64               randconfig-a011-20221003
i386                 randconfig-a012-20221003
x86_64                           rhel-8.3-syz
i386                 randconfig-a013-20221003
arc                        nsim_700_defconfig
arm                          simpad_defconfig
i386                 randconfig-a015-20221003
mips                        bcm47xx_defconfig
x86_64                              defconfig
s390                 randconfig-r044-20221003
sh                          r7780mp_defconfig
i386                 randconfig-a016-20221003
s390                             allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64               randconfig-a012-20221003
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a013-20221003
xtensa                              defconfig
x86_64               randconfig-a016-20221003
x86_64               randconfig-a015-20221003
x86_64               randconfig-a014-20221003
x86_64                           allyesconfig
sh                               allmodconfig
arm64                            allyesconfig
m68k                             allmodconfig
mips                  decstation_64_defconfig
i386                             allyesconfig
mips                             allyesconfig
arm                              allyesconfig
m68k                            q40_defconfig
powerpc                          allmodconfig
powerpc                     tqm8548_defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
arc                           tb10x_defconfig
powerpc                       eiger_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                     taishan_defconfig
ia64                             allmodconfig
parisc                generic-64bit_defconfig
loongarch                        alldefconfig
arm                       omap2plus_defconfig
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r045-20221003
arm                          pcm027_defconfig
hexagon              randconfig-r041-20221003
arm                           omap1_defconfig
x86_64               randconfig-a003-20221003
x86_64               randconfig-a005-20221003
mips                           rs90_defconfig
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
riscv                          rv32_defconfig
x86_64               randconfig-a004-20221003
x86_64               randconfig-a006-20221003
powerpc                    mvme5100_defconfig
powerpc                     ppa8548_defconfig
mips                           ip28_defconfig
i386                 randconfig-a004-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a006-20221003
mips                          malta_defconfig
powerpc                          allmodconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
