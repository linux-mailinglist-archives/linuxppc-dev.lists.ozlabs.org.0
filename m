Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FBD63F709
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 19:01:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNP5v6Fvrz3dwc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 05:01:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AnEqM2bL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AnEqM2bL;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNP4x1FjFz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 05:00:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669917649; x=1701453649;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7JbfxM0BIJTQeM0nqxSmNKYTXO3qQdt9sUjsZ0/oGGE=;
  b=AnEqM2bLZLBPqa1aZyAO6RawStjckzuiJX7TTQOJw3Uj58fewKNbYwC1
   hwRm5MLjHYcGyAbI+pDXUG5e7lQtPBvlVMoAg6w1ZHa/cGFPB2BDI1DBk
   Bv8cvyszRInPoaugRzPqvzalEB6r5Y4tP8ELVrUHHs4SMx66TMwb5W8lT
   vsYminduwsa1zAiTHDzUhj+dPhH+n/24jfmMSLDl0yxsedF3O+8L5bnKB
   YS1gulaxa1eb8TftRT4GnTUzux8sce/lntLNWC+0HaKTx3tH6VvFAn1Vf
   cSxcopI00TbDZfy3zN2P9DQRh8t/EiaodNlcODOmmizl1h/Io8XJz7ARl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317623784"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="317623784"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2022 10:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="750911949"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="750911949"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2022 10:00:37 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0nrQ-000CnL-1t;
	Thu, 01 Dec 2022 18:00:36 +0000
Date: Fri, 02 Dec 2022 02:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 2934ceb4e967b9233d0f97732e47175574a11406
Message-ID: <6388ebb4.4fWHGaE8GeH20VVN%lkp@intel.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Linux Memory Management List <linux-mm@kvack.org>, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 2934ceb4e967b9233d0f97732e47175574a11406  Add linux-next specific files for 20221201

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211041320.coq8EELJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211090634.RyFKK0WS-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211242021.FDZRFNA8-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211242120.MzZVGULn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211301840.y7rROb13-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212011005.7X5XAsmG-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212020122.myyqvrXj-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/arm/mach-s3c/devs.c:32:10: fatal error: linux/platform_data/dma-s3c24xx.h: No such file or directory
arch/loongarch/kernel/ftrace_dyn.c:47:36: error: invalid use of undefined type 'struct module'
arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for function 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for function 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for function 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for function 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
drivers/irqchip/irq-loongarch-cpu.c:96:12: warning: no previous prototype for 'loongarch_cpu_irq_of_init' [-Wmissing-prototypes]
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1849:38: warning: unused variable 'mt8173_jpeg_drvdata' [-Wunused-const-variable]
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1864:38: warning: unused variable 'mtk_jpeg_drvdata' [-Wunused-const-variable]
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1890:38: warning: unused variable 'mtk8195_jpegdec_drvdata' [-Wunused-const-variable]
drivers/regulator/tps65219-regulator.c:310:60: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:370:26: warning: ordered comparison of pointer with integer zero [-Wextra]
net/netfilter/nf_conntrack_netlink.c:2674:6: warning: unused variable 'mark' [-Wunused-variable]
vmlinux.o: warning: objtool: __btrfs_map_block+0x1d77: unreachable instruction

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- alpha-randconfig-r005-20221128
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm-allyesconfig
|   |-- arch-arm-mach-s3c-devs.c:fatal-error:linux-platform_data-dma-s3c24xx.h:No-such-file-or-directory
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm-defconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- i386-allyesconfig
clang_recent_errors
|-- arm64-randconfig-r016-20221128
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|-- hexagon-randconfig-r041-20221128
|   |-- drivers-media-platform-mediatek-jpeg-mtk_jpeg_core.c:warning:unused-variable-mt8173_jpeg_drvdata
|   |-- drivers-media-platform-mediatek-jpeg-mtk_jpeg_core.c:warning:unused-variable-mtk8195_jpegdec_drvdata
|   `-- drivers-media-platform-mediatek-jpeg-mtk_jpeg_core.c:warning:unused-variable-mtk_jpeg_drvdata
|-- i386-randconfig-a013
|   `-- net-netfilter-nf_conntrack_netlink.c:warning:unused-variable-mark
|-- powerpc-randconfig-r024-20221128
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
|-- s390-randconfig-r044-20221128
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
|   `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump
`-- x86_64-randconfig-a016
    `-- vmlinux.o:warning:objtool:handle_bug:call-to-kmsan_unpoison_entry_regs()-leaves-.noinstr.text-section

elapsed time: 738m

configs tested: 59
configs skipped: 2

gcc tested configs:
powerpc                           allnoconfig
i386                 randconfig-a002-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a001-20221128
i386                 randconfig-a004-20221128
x86_64                              defconfig
ia64                             allmodconfig
arc                  randconfig-r043-20221128
x86_64                           rhel-8.3-syz
i386                 randconfig-a005-20221128
um                             i386_defconfig
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
um                           x86_64_defconfig
arc                                 defconfig
m68k                             allmodconfig
i386                 randconfig-a006-20221128
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
x86_64                        randconfig-a004
alpha                               defconfig
i386                                defconfig
x86_64                        randconfig-a002
s390                                defconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                        randconfig-a006
s390                             allyesconfig
x86_64                          rhel-8.3-func
arm                              allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
s390                 randconfig-r044-20221128
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
