Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D4F4551C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 01:36:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hvgp84rpyz3cQ8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 11:36:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvgnG4fbCz2yHq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 11:35:28 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="220968389"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="220968389"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 16:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="604938468"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 17 Nov 2021 16:34:24 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mnVNg-0002Qs-3V; Thu, 18 Nov 2021 00:34:24 +0000
Date: Thu, 18 Nov 2021 08:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 5d12a44d97850aacfc86a4817ca304fc33876476
Message-ID: <61959f80.VhxfJp8L0wtsWAHs%lkp@intel.com>
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
branch HEAD: 5d12a44d97850aacfc86a4817ca304fc33876476  powerpc/rtas: rtas_busy_delay_time() kernel-doc

elapsed time: 726m

configs tested: 189
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211117
powerpc              randconfig-c003-20211117
sh                ecovec24-romimage_defconfig
m68k                          multi_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                      jornada720_defconfig
sh                          rsk7269_defconfig
riscv                            alldefconfig
alpha                               defconfig
powerpc                     stx_gp3_defconfig
arc                     nsimosci_hs_defconfig
powerpc                     mpc5200_defconfig
powerpc                    amigaone_defconfig
powerpc                    adder875_defconfig
arm                          iop32x_defconfig
m68k                            mac_defconfig
sh                           se7343_defconfig
powerpc                      pasemi_defconfig
mips                           jazz_defconfig
mips                malta_qemu_32r6_defconfig
sparc                       sparc64_defconfig
i386                                defconfig
ia64                                defconfig
sh                         apsh4a3a_defconfig
arm                          ep93xx_defconfig
mips                          ath79_defconfig
sh                         ecovec24_defconfig
i386                             alldefconfig
mips                       capcella_defconfig
powerpc                     tqm8555_defconfig
arm                             ezx_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                    ge_imp3a_defconfig
um                           x86_64_defconfig
sh                   secureedge5410_defconfig
s390                             allmodconfig
mips                      loongson3_defconfig
sh                   sh7724_generic_defconfig
mips                      malta_kvm_defconfig
powerpc                 mpc832x_mds_defconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
sh                          lboxre2_defconfig
xtensa                           allyesconfig
arm                          moxart_defconfig
arm                        keystone_defconfig
mips                        bcm47xx_defconfig
alpha                            alldefconfig
xtensa                       common_defconfig
mips                           ci20_defconfig
arm                           sunxi_defconfig
mips                   sb1250_swarm_defconfig
powerpc                     akebono_defconfig
powerpc                      chrp32_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                              ul2_defconfig
powerpc                    socrates_defconfig
m68k                          atari_defconfig
mips                      bmips_stb_defconfig
sh                           se7724_defconfig
arm                            mmp2_defconfig
powerpc                         wii_defconfig
arm                         lpc32xx_defconfig
powerpc                      cm5200_defconfig
arm                        mvebu_v7_defconfig
arm                          exynos_defconfig
mips                      fuloong2e_defconfig
ia64                          tiger_defconfig
csky                             alldefconfig
csky                                defconfig
sh                             espt_defconfig
arm                         lubbock_defconfig
arm                          simpad_defconfig
sh                 kfr2r09-romimage_defconfig
x86_64                              defconfig
riscv             nommu_k210_sdcard_defconfig
powerpc                        cell_defconfig
powerpc                       holly_defconfig
xtensa                              defconfig
arm                            mps2_defconfig
arm                          collie_defconfig
sh                        edosk7705_defconfig
um                             i386_defconfig
arm                       aspeed_g5_defconfig
m68k                         amcore_defconfig
ia64                             allyesconfig
sh                             sh03_defconfig
mips                     loongson1c_defconfig
powerpc                   currituck_defconfig
powerpc                     ksi8560_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                      tqm8xx_defconfig
powerpc                  mpc866_ads_defconfig
arm                         s3c6400_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     tqm8560_defconfig
mips                     decstation_defconfig
mips                         db1xxx_defconfig
sh                        sh7763rdp_defconfig
arm                          pxa910_defconfig
mips                           mtx1_defconfig
parisc                generic-64bit_defconfig
powerpc                     asp8347_defconfig
arm                           stm32_defconfig
arm                        magician_defconfig
arm                         assabet_defconfig
h8300                            alldefconfig
mips                         tb0287_defconfig
powerpc64                           defconfig
powerpc                      acadia_defconfig
arm                       versatile_defconfig
arm                            dove_defconfig
arm                  randconfig-c002-20211117
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20211117
x86_64               randconfig-a003-20211117
x86_64               randconfig-a002-20211117
x86_64               randconfig-a001-20211117
x86_64               randconfig-a006-20211117
x86_64               randconfig-a004-20211117
i386                 randconfig-a006-20211117
i386                 randconfig-a003-20211117
i386                 randconfig-a005-20211117
i386                 randconfig-a001-20211117
i386                 randconfig-a004-20211117
i386                 randconfig-a002-20211117
arc                  randconfig-r043-20211117
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211117
i386                 randconfig-c001-20211117
arm                  randconfig-c002-20211117
riscv                randconfig-c006-20211117
powerpc              randconfig-c003-20211117
s390                 randconfig-c005-20211117
mips                 randconfig-c004-20211117
x86_64               randconfig-a015-20211117
x86_64               randconfig-a013-20211117
x86_64               randconfig-a011-20211117
x86_64               randconfig-a012-20211117
x86_64               randconfig-a016-20211117
x86_64               randconfig-a014-20211117
i386                 randconfig-a014-20211117
i386                 randconfig-a016-20211117
i386                 randconfig-a012-20211117
i386                 randconfig-a013-20211117
i386                 randconfig-a011-20211117
i386                 randconfig-a015-20211117
hexagon              randconfig-r045-20211117
hexagon              randconfig-r041-20211117
s390                 randconfig-r044-20211117
riscv                randconfig-r042-20211117

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
