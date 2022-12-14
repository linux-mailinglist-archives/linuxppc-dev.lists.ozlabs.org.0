Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97364CDFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 17:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXLRG2Bn8z3cM3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Dec 2022 03:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H50Xa3BF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H50Xa3BF;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXLQK47HVz3bgb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Dec 2022 03:28:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671035305; x=1702571305;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PEm95h/YTHcJiYhCqCHq1kOQJQryjVd8bKLlGnmtus4=;
  b=H50Xa3BFxpYZ0VzYoY3Hpj7Vd7YG/30kKwYH22wyBWqUQ7UU7VHyqnQ6
   UBvOSXltggNP3l69DqxLmxQAdfv0FoUrrA7dPFAjY1zuqJetXPm4k4TKl
   CvxPg8M2+kxlYW7BrpoFZIXxoBUdW01me54/BjzmgY5rgYAwxFyEZy8ao
   TtjmdwR3f9JwXDBpiqNQpb5E8mx0oHAogu97Ss+RgJGs9bIC01sLXa9Ah
   cPG/sq6KiZ1YMCP6vWu3TfVuEpO6FHELqPH+jznwXOGG8PrmmJg9jxN2r
   xDCE2KovEbPR/vxzWYdO92JUJ/WZOm+VBUSH8s6wUQjjoDsH7SFUluIYB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="316085818"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="316085818"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 08:28:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="823349494"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; 
   d="scan'208";a="823349494"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2022 08:28:13 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5Uc8-0005ck-1T;
	Wed, 14 Dec 2022 16:28:12 +0000
Date: Thu, 15 Dec 2022 00:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 663397d1b469ff57f216d499b74a0b0183a508b8
Message-ID: <6399f97f.8g32TjfFuyg/ourC%lkp@intel.com>
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
Cc: kvm@vger.kernel.org, linux-parisc@vger.kernel.org, amd-gfx@lists.freedesktop.org, Linux Memory Management List <linux-mm@kvack.org>, loongarch@lists.linux.dev, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 663397d1b469ff57f216d499b74a0b0183a508b8  Add linux-next specific files for 20221214

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211242120.MzZVGULn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212141410.IlFkWqph-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212141742.w69HZXVa-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212141833.3QHN4iDl-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212142121.vendKsOc-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "___ratelimit" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "__asan_report_load4_noabort" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "__asan_report_load8_noabort" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "__asan_report_load8_noabort" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "__fentry__" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "__fentry__" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "__gcov_exit" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "__gcov_init" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "_find_next_bit" [arch/x86/events/intel/intel-cstate.ko] undefined!
ERROR: modpost: "_printk" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "capable" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "current_task" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "device_create" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "device_destroy" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "ftrace_likely_update" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "kasprintf" [arch/x86/kernel/msr.ko] undefined!
ERROR: modpost: "memcpy" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "pcpu_hot" [arch/x86/kvm/kvm-intel.ko] undefined!
ERROR: modpost: "twofish_dec_blk" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "twofish_dec_blk_3way" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "twofish_dec_blk_cbc_3way" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
ERROR: modpost: "twofish_setkey" [arch/x86/crypto/twofish-avx-x86_64.ko] undefined!
arch/loongarch/kernel/asm-offsets.c:265:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
arch/parisc/include/asm/pgtable.h:169:32: warning: "PMD_SHIFT" is not defined, evaluates to 0 [-Wundef]
arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/regulator/tps65219-regulator.c:310:60: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:370:26: warning: ordered comparison of pointer with integer zero [-Wextra]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- alpha-buildonly-randconfig-r004-20221213
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- loongarch-allyesconfig
|   `-- arch-loongarch-kernel-asm-offsets.c:warning:no-previous-prototype-for-output_pbe_defines
|-- m68k-allmodconfig
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- m68k-allyesconfig
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- openrisc-randconfig-r005-20221213
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|-- parisc-randconfig-r033-20221214
|   `-- arch-parisc-include-asm-pgtable.h:warning:PMD_SHIFT-is-not-defined-evaluates-to
|-- powerpc-allmodconfig
|   |-- arch-powerpc-kernel-kvm_emul.o:warning:objtool:kvm_template_end():can-t-find-starting-instruction
|   |-- arch-powerpc-kernel-optprobes_head.o:warning:objtool:optprobe_template_end():can-t-find-starting-instruction
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
clang_recent_errors
|-- i386-randconfig-a002
|   `-- ERROR:pcpu_hot-arch-x86-kvm-kvm-intel.ko-undefined
`-- i386-randconfig-a015
    `-- ERROR:_find_next_bit-arch-x86-events-intel-intel-cstate.ko-undefined

elapsed time: 740m

configs tested: 67
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
x86_64                            allnoconfig
um                           x86_64_defconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
x86_64                          rhel-8.3-rust
arm                                 defconfig
i386                          randconfig-a001
arc                  randconfig-r043-20221213
s390                                defconfig
arm                  randconfig-r046-20221213
x86_64                        randconfig-a013
x86_64                        randconfig-a004
sh                               allmodconfig
x86_64                           rhel-8.3-bpf
x86_64                              defconfig
x86_64                        randconfig-a002
m68k                             allyesconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a003
m68k                             allmodconfig
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a014
arc                              allyesconfig
x86_64                        randconfig-a006
m68k                       m5475evb_defconfig
x86_64                           rhel-8.3-syz
i386                                defconfig
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
s390                             allmodconfig
x86_64                        randconfig-a011
i386                          randconfig-a012
nios2                            alldefconfig
i386                          randconfig-a016
powerpc                          allmodconfig
riscv             nommu_k210_sdcard_defconfig
x86_64                           allyesconfig
i386                          randconfig-c001
arm64                            allyesconfig
alpha                            allyesconfig
s390                             allyesconfig
i386                          randconfig-a005
arm                              allyesconfig
mips                             allyesconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221213
hexagon              randconfig-r045-20221213
riscv                randconfig-r042-20221213
s390                 randconfig-r044-20221213
i386                          randconfig-a013
x86_64                        randconfig-a012
x86_64                        randconfig-a001
arm                           spitz_defconfig
x86_64                        randconfig-a014
x86_64                        randconfig-a003
i386                          randconfig-a011
x86_64                        randconfig-a005
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a016
i386                          randconfig-a006
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
