Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5883676FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 03:47:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQgKW73Z8z3bV8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 11:47:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQgJr1LLPz2xYt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 11:47:05 +1000 (AEST)
IronPort-SDR: C2iYYrK3Y8YId1fV7ZGgiCQn5k3xX+NcsVPu3wD662BwQf4/FdZr+TFeAILeWj/pbxS5VGkL7j
 IpTIpkjP7SCw==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="175917978"
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="175917978"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2021 18:47:01 -0700
IronPort-SDR: 2STbIMZ8uy+HkBBVa/HkfxgjKNIi7NiQgQgFTk/qaQa+/RZ2J1KMr1MBGYOZYQSZyLcvjEzVM2
 Zo92tHfjBobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,241,1613462400"; d="scan'208";a="535044980"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 21 Apr 2021 18:46:59 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lZOQk-0003uc-Rp; Thu, 22 Apr 2021 01:46:58 +0000
Date: Thu, 22 Apr 2021 09:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 f76c7820fc6ef641b75b5142aea72f1485c73bb1
Message-ID: <6080d58a.XD/Jp0uALq6wN+AM%lkp@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: f76c7820fc6ef641b75b5142aea72f1485c73bb1  powerpc/powernv: Fix type of opal_mpipl_query_tag() addr argument

Error/Warning reports:

https://lore.kernel.org/linuxppc-dev/202104220600.1Zf0gKVF-lkp@intel.com

Error/Warning in current branch:

arch/powerpc/include/asm/book3s/64/hash-pkey.h:10:23: error: 'VM_PKEY_BIT0' undeclared (first use in this function); did you mean 'H_PTE_PKEY_BIT0'?
arch/powerpc/include/asm/book3s/64/hash-pkey.h:11:16: error: 'VM_PKEY_BIT1' undeclared (first use in this function); did you mean 'H_PTE_PKEY_BIT1'?
arch/powerpc/include/asm/book3s/64/hash-pkey.h:12:16: error: 'VM_PKEY_BIT2' undeclared (first use in this function)
arch/powerpc/include/asm/book3s/64/hash-pkey.h:13:16: error: 'VM_PKEY_BIT3' undeclared (first use in this function); did you mean 'H_PTE_PKEY_BIT3'?
arch/powerpc/include/asm/book3s/64/hash-pkey.h:14:16: error: 'VM_PKEY_BIT4' undeclared (first use in this function); did you mean 'H_PTE_PKEY_BIT4'?
arch/powerpc/include/asm/mmu_context.h:287:19: error: redefinition of 'pte_to_hpte_pkey_bits'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc64-randconfig-p001-20210421
    |-- arch-powerpc-include-asm-book3s-hash-pkey.h:error:VM_PKEY_BIT0-undeclared-(first-use-in-this-function)
    |-- arch-powerpc-include-asm-book3s-hash-pkey.h:error:VM_PKEY_BIT1-undeclared-(first-use-in-this-function)
    |-- arch-powerpc-include-asm-book3s-hash-pkey.h:error:VM_PKEY_BIT2-undeclared-(first-use-in-this-function)
    |-- arch-powerpc-include-asm-book3s-hash-pkey.h:error:VM_PKEY_BIT3-undeclared-(first-use-in-this-function)
    |-- arch-powerpc-include-asm-book3s-hash-pkey.h:error:VM_PKEY_BIT4-undeclared-(first-use-in-this-function)
    `-- arch-powerpc-include-asm-mmu_context.h:error:redefinition-of-pte_to_hpte_pkey_bits

elapsed time: 721m

configs tested: 162
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
mips                          malta_defconfig
sh                             shx3_defconfig
powerpc                      ppc44x_defconfig
um                                  defconfig
mips                        workpad_defconfig
powerpc                   currituck_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                 xes_mpc85xx_defconfig
riscv                             allnoconfig
powerpc                      pcm030_defconfig
arm                         s3c6400_defconfig
xtensa                          iss_defconfig
mips                      loongson3_defconfig
powerpc                  iss476-smp_defconfig
arm                              alldefconfig
arm                       omap2plus_defconfig
arm                      tct_hammer_defconfig
mips                           rs90_defconfig
arm                      integrator_defconfig
arm                      footbridge_defconfig
h8300                    h8300h-sim_defconfig
xtensa                              defconfig
alpha                               defconfig
sparc                               defconfig
powerpc                     asp8347_defconfig
ia64                          tiger_defconfig
mips                        nlm_xlr_defconfig
mips                  decstation_64_defconfig
m68k                          hp300_defconfig
mips                           xway_defconfig
powerpc                  storcenter_defconfig
mips                           ci20_defconfig
arm                         lpc18xx_defconfig
mips                      bmips_stb_defconfig
arm                        mvebu_v7_defconfig
powerpc                          allmodconfig
xtensa                  nommu_kc705_defconfig
arm                             ezx_defconfig
powerpc                       eiger_defconfig
mips                       rbtx49xx_defconfig
arm                          exynos_defconfig
sh                           se7619_defconfig
sh                          sdk7780_defconfig
sh                            titan_defconfig
arm                         cm_x300_defconfig
arm                         bcm2835_defconfig
arm                        keystone_defconfig
ia64                         bigsur_defconfig
s390                          debug_defconfig
x86_64                           alldefconfig
m68k                         amcore_defconfig
mips                       capcella_defconfig
um                            kunit_defconfig
arm                        oxnas_v6_defconfig
arc                        vdk_hs38_defconfig
powerpc                      mgcoge_defconfig
arc                        nsim_700_defconfig
powerpc                         wii_defconfig
mips                        maltaup_defconfig
mips                        bcm47xx_defconfig
powerpc                 canyonlands_defconfig
arm                        magician_defconfig
mips                           jazz_defconfig
arm                         s3c2410_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     skiroot_defconfig
mips                      maltaaprp_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                       maple_defconfig
sh                           se7206_defconfig
sh                          sdk7786_defconfig
powerpc                     ksi8560_defconfig
arc                          axs103_defconfig
arm                        clps711x_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          sun3x_defconfig
sh                          rsk7201_defconfig
i386                             alldefconfig
arc                      axs103_smp_defconfig
m68k                         apollo_defconfig
sh                           sh2007_defconfig
sh                           se7722_defconfig
openrisc                         alldefconfig
powerpc                      acadia_defconfig
mips                            e55_defconfig
sh                            migor_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210421
x86_64               randconfig-a002-20210421
x86_64               randconfig-a001-20210421
x86_64               randconfig-a005-20210421
x86_64               randconfig-a006-20210421
x86_64               randconfig-a003-20210421
i386                 randconfig-a005-20210421
i386                 randconfig-a002-20210421
i386                 randconfig-a001-20210421
i386                 randconfig-a006-20210421
i386                 randconfig-a004-20210421
i386                 randconfig-a003-20210421
i386                 randconfig-a012-20210421
i386                 randconfig-a014-20210421
i386                 randconfig-a011-20210421
i386                 randconfig-a013-20210421
i386                 randconfig-a015-20210421
i386                 randconfig-a016-20210421
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210421
x86_64               randconfig-a016-20210421
x86_64               randconfig-a011-20210421
x86_64               randconfig-a014-20210421
x86_64               randconfig-a013-20210421
x86_64               randconfig-a012-20210421

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
