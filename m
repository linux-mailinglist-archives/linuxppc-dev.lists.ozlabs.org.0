Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 029AF55BBD0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 21:42:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWymC4lftz3c8l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 05:42:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aG6nx/s/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aG6nx/s/;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWylX6ZfFz3bl7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 05:41:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656358889; x=1687894889;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8CuvkP0vcHWHYz4O+MpXmhInxvjdtTkynfXQVhQtVvU=;
  b=aG6nx/s/o6oEqvjNnMcy8GbGYW484W3e3WG9OYjrBAabV8brEuXr4p9A
   3fJAAC43ISSZSeRJ5N5fGu8Vv6h20KyrFB3M0p4xYk4KBj30ss0Vk49U+
   M1NUNcJWc7lzfAW6JZGIwZn7PkHYrYzGupyPud3zDJEVS9nVVvVctpYNP
   dLO7VddWaLUZQex6ljqI16Mlm0SxmaThHsUxFkjOiVvv9+hbY4gAtaxCE
   Fz9ApqSHmCIB7QUC2MpF5ZhATENTKu+E5PZuvwEiJDN9kSmGUeUtLFoIx
   /UNC1i1dJGkRFVudGFP/q/YWluMEJSwZ/yvXLTMbsmzoTw+LqqVvqZZVF
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="343235486"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="343235486"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 12:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="766877478"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Jun 2022 12:40:46 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5ubG-0008wF-9g;
	Mon, 27 Jun 2022 19:40:46 +0000
Date: Tue, 28 Jun 2022 03:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 aab35c3d5112df6e329a1a5a5a1881e5c4ca3821
Message-ID: <62ba07b9.qFa7tsWUZhZoW2FF%lkp@intel.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>, linux-pci@vger.kernel.org, ntb@lists.linux.dev, linux-usb@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-perf-users@vger.kernel.org, linux-acpi@vger.kernel.org, mjpeg-users@lists.sourceforge.net, linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: aab35c3d5112df6e329a1a5a5a1881e5c4ca3821  Add linux-next specific files for 20220627

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kernel/interrupt.c:542:55: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
arch/powerpc/kernel/interrupt.c:542:55: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1025:33: warning: variable 'pre_connection_type' set but not used [-Wunused-but-set-variable]
drivers/ntb/test/ntb_perf.c:1145: undefined reference to `__umoddi3'
drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for 'pci_read' [-Wmissing-prototypes]
drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for 'pci_write' [-Wmissing-prototypes]
vmlinux.o: warning: objtool: __ct_user_enter+0x8c: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_idle_enter+0x19: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_idle_exit+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_irq_enter+0x6a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_irq_exit+0x6a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_enter.constprop.0+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_enter_state+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_exit.constprop.0+0x53: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_kernel_exit_state+0x2d: call to ftrace_likely_update() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_nmi_enter+0x4b: call to ftrace_likely_update() leaves .noinstr.text section

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/acpi/scan.c:615:35: warning: Uninitialized variable: acpi_device_bus_id->bus_id [uninitvar]
drivers/phy/qualcomm/phy-qcom-qmp-combo.c:1701:19: warning: Value stored to 'qmp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
drivers/soc/mediatek/mtk-mutex.c:799:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36016.c:430:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36050.c:829:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/staging/media/zoran/zr36060.c:869:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
drivers/thunderbolt/tmu.c:758:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637
sound/soc/sof/intel/mtl.c:547:1: internal compiler error: in arc_ifcvt, at config/arc/arc.c:9637

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   |-- drivers-soc-mediatek-mtk-mutex.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36016.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36050.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-staging-media-zoran-zr36060.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   |-- drivers-thunderbolt-tmu.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|   `-- sound-soc-sof-intel-mtl.c:internal-compiler-error:in-arc_ifcvt-at-config-arc-arc.c
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|   `-- ntb_perf.c:(.text):undefined-reference-to-__umoddi3
|-- i386-randconfig-a013-20220627
|   `-- ERROR:__umoddi3-drivers-ntb-test-ntb_perf.ko-undefined
|-- i386-randconfig-m021-20220627
|   `-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err
|-- i386-randconfig-p001-20220627
|   `-- drivers-acpi-scan.c:warning:Uninitialized-variable:acpi_device_bus_id-bus_id-uninitvar
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- powerpc-allmodconfig
|   |-- ERROR:__umoddi3-drivers-ntb-test-ntb_perf.ko-undefined
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- powerpc-allnoconfig
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-buildonly-randconfig-r003-20220627
|   `-- arch-powerpc-kernel-interrupt.c:error:suggest-braces-around-empty-body-in-an-if-statement
|-- powerpc-buildonly-randconfig-r005-20220627
|   |-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- powerpc-randconfig-r023-20220627
|   `-- arch-powerpc-kernel-interrupt.c:warning:suggest-braces-around-empty-body-in-an-if-statement
|-- riscv-randconfig-r012-20220627
|   |-- ERROR:__umoddi3-drivers-ntb-test-ntb_perf.ko-undefined
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- s390-buildonly-randconfig-r001-20220627
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- sparc-randconfig-r032-20220627
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link.c:warning:variable-pre_connection_type-set-but-not-used
|   |-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_read
|   `-- drivers-pci-endpoint-functions-pci-epf-vntb.c:warning:no-previous-prototype-for-pci_write
|-- x86_64-randconfig-a011-20220627
|   |-- vmlinux.o:warning:objtool:__ct_user_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_idle_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_idle_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_irq_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_irq_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_enter_state:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_exit:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   |-- vmlinux.o:warning:objtool:ct_kernel_exit_state:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|   `-- vmlinux.o:warning:objtool:ct_nmi_enter:call-to-ftrace_likely_update()-leaves-.noinstr.text-section
|-- x86_64-randconfig-m001-20220627
|   `-- arch-x86-events-core.c-init_hw_perf_events()-warn:missing-error-code-err
`-- xtensa-randconfig-r024-20220627
    `-- drivers-ntb-test-ntb_perf.c:undefined-reference-to-__umoddi3

clang_recent_errors
`-- riscv-randconfig-c006-20220617
    `-- drivers-phy-qualcomm-phy-qcom-qmp-combo.c:warning:Value-stored-to-qmp-during-its-initialization-is-never-read-clang-analyzer-deadcode.DeadStores

elapsed time: 726m

configs tested: 52
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                                defconfig
i386                             allyesconfig
x86_64               randconfig-a012-20220627
x86_64               randconfig-a011-20220627
x86_64               randconfig-a013-20220627
x86_64               randconfig-a014-20220627
x86_64               randconfig-a015-20220627
x86_64               randconfig-a016-20220627
i386                 randconfig-a012-20220627
i386                 randconfig-a011-20220627
i386                 randconfig-a013-20220627
i386                 randconfig-a014-20220627
i386                 randconfig-a015-20220627
i386                 randconfig-a016-20220627
arc                  randconfig-r043-20220627
s390                 randconfig-r044-20220627
riscv                randconfig-r042-20220627
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
i386                 randconfig-a001-20220627
i386                 randconfig-a002-20220627
i386                 randconfig-a003-20220627
i386                 randconfig-a006-20220627
i386                 randconfig-a005-20220627
i386                 randconfig-a004-20220627
x86_64               randconfig-a002-20220627
x86_64               randconfig-a003-20220627
x86_64               randconfig-a001-20220627
x86_64               randconfig-a006-20220627
x86_64               randconfig-a005-20220627
x86_64               randconfig-a004-20220627
hexagon              randconfig-r041-20220627
hexagon              randconfig-r045-20220627

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
