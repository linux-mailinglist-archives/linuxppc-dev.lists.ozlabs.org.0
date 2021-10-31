Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3985440ED5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Oct 2021 15:24:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hhz1V53s7z3bP6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 01:23:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hhz123Gxwz2xb2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Nov 2021 01:23:29 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10153"; a="254487076"
X-IronPort-AV: E=Sophos;i="5.87,197,1631602800"; d="scan'208";a="254487076"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2021 07:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,197,1631602800"; d="scan'208";a="598772234"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 31 Oct 2021 07:22:24 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mhBj5-0002Uu-Bx; Sun, 31 Oct 2021 14:22:23 +0000
Date: Sun, 31 Oct 2021 22:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 81291383ffde08b23bce75e7d6b2575ce9d3475c
Message-ID: <617ea679.P3Qn08qH2ucbDtuA%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 81291383ffde08b23bce75e7d6b2575ce9d3475c  powerpc/32e: Ignore ESR in instruction storage interrupt handler

elapsed time: 2268m

configs tested: 279
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
i386                 randconfig-c001-20211028
powerpc              randconfig-c003-20211028
sh                          landisk_defconfig
um                           x86_64_defconfig
sh                           se7751_defconfig
arm                          exynos_defconfig
m68k                          multi_defconfig
mips                         tb0287_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        m5407c3_defconfig
arc                        nsimosci_defconfig
sh                           se7721_defconfig
arm                           corgi_defconfig
arm                     am200epdkit_defconfig
powerpc                     mpc83xx_defconfig
xtensa                  cadence_csp_defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                         amcore_defconfig
sh                        apsh4ad0a_defconfig
arm                        magician_defconfig
mips                   sb1250_swarm_defconfig
arm                         vf610m4_defconfig
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
mips                      maltasmvp_defconfig
h8300                            alldefconfig
arm                       imx_v4_v5_defconfig
mips                        workpad_defconfig
x86_64                           allyesconfig
arc                         haps_hs_defconfig
mips                           ip32_defconfig
arm                          badge4_defconfig
sh                      rts7751r2d1_defconfig
sh                           se7206_defconfig
powerpc                     mpc512x_defconfig
sh                           se7780_defconfig
arm                    vt8500_v6_v7_defconfig
openrisc                         alldefconfig
arm                         bcm2835_defconfig
sh                          kfr2r09_defconfig
parisc                generic-32bit_defconfig
sh                             shx3_defconfig
powerpc                      pasemi_defconfig
powerpc                      arches_defconfig
arm                           sama7_defconfig
sparc                       sparc64_defconfig
arc                     nsimosci_hs_defconfig
xtensa                generic_kc705_defconfig
sh                          rsk7269_defconfig
m68k                       m5208evb_defconfig
sh                        edosk7760_defconfig
s390                             alldefconfig
arm                             pxa_defconfig
powerpc                    klondike_defconfig
arm                       netwinder_defconfig
powerpc                   microwatt_defconfig
powerpc                 canyonlands_defconfig
powerpc                        cell_defconfig
riscv                    nommu_k210_defconfig
m68k                       m5475evb_defconfig
sh                           se7724_defconfig
arm                           h3600_defconfig
powerpc                    mvme5100_defconfig
m68k                        mvme147_defconfig
h8300                     edosk2674_defconfig
powerpc                   lite5200b_defconfig
riscv                    nommu_virt_defconfig
xtensa                              defconfig
arm                          pxa168_defconfig
riscv                          rv32_defconfig
sh                 kfr2r09-romimage_defconfig
sh                         apsh4a3a_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                        vocore2_defconfig
sh                          lboxre2_defconfig
arm                       imx_v6_v7_defconfig
powerpc                          g5_defconfig
ia64                            zx1_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                       maple_defconfig
m68k                       m5249evb_defconfig
arm                            dove_defconfig
arm                          pxa910_defconfig
sh                          polaris_defconfig
mips                          rm200_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                    socrates_defconfig
powerpc                     rainier_defconfig
csky                                defconfig
sh                           se7619_defconfig
mips                           ci20_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                        omega2p_defconfig
arm                          pcm027_defconfig
arm                        realview_defconfig
sh                         ecovec24_defconfig
arm                         shannon_defconfig
powerpc                     tqm8541_defconfig
sh                               j2_defconfig
arm                        multi_v5_defconfig
mips                             allyesconfig
powerpc                     powernv_defconfig
powerpc                 mpc8560_ads_defconfig
arm                           stm32_defconfig
microblaze                      mmu_defconfig
openrisc                  or1klitex_defconfig
sh                           sh2007_defconfig
arm                          ixp4xx_defconfig
powerpc                  iss476-smp_defconfig
xtensa                    smp_lx200_defconfig
arm                           omap1_defconfig
powerpc                      katmai_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      ppc64e_defconfig
microblaze                          defconfig
sh                        edosk7705_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                         db1xxx_defconfig
sh                          r7785rp_defconfig
ia64                             alldefconfig
sh                          urquell_defconfig
arm                           h5000_defconfig
mips                            gpr_defconfig
powerpc                    ge_imp3a_defconfig
arm64                            alldefconfig
powerpc                     tqm8548_defconfig
s390                          debug_defconfig
m68k                          amiga_defconfig
sh                        sh7763rdp_defconfig
powerpc                     tqm8560_defconfig
mips                       lemote2f_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
arm                  randconfig-c002-20211031
arm                  randconfig-c002-20211028
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nds32                               defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
parisc                           allyesconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
i386                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20211028
x86_64               randconfig-a004-20211028
x86_64               randconfig-a005-20211028
x86_64               randconfig-a001-20211028
x86_64               randconfig-a006-20211028
x86_64               randconfig-a003-20211028
i386                 randconfig-a004-20211028
i386                 randconfig-a003-20211028
i386                 randconfig-a002-20211028
i386                 randconfig-a006-20211028
i386                 randconfig-a001-20211028
i386                 randconfig-a005-20211028
i386                 randconfig-a003-20211031
i386                 randconfig-a006-20211031
i386                 randconfig-a002-20211031
i386                 randconfig-a005-20211031
i386                 randconfig-a001-20211031
i386                 randconfig-a004-20211031
x86_64               randconfig-a015-20211029
x86_64               randconfig-a013-20211029
x86_64               randconfig-a011-20211029
x86_64               randconfig-a014-20211029
x86_64               randconfig-a012-20211029
x86_64               randconfig-a016-20211029
i386                 randconfig-a012-20211029
i386                 randconfig-a013-20211029
i386                 randconfig-a011-20211029
i386                 randconfig-a015-20211029
i386                 randconfig-a016-20211029
i386                 randconfig-a014-20211029
x86_64               randconfig-a005-20211031
x86_64               randconfig-a004-20211031
x86_64               randconfig-a002-20211031
x86_64               randconfig-a003-20211031
x86_64               randconfig-a001-20211031
x86_64               randconfig-a006-20211031
arc                  randconfig-r043-20211031
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211028
powerpc              randconfig-c003-20211028
riscv                randconfig-c006-20211028
x86_64               randconfig-c007-20211028
mips                 randconfig-c004-20211028
s390                 randconfig-c005-20211028
i386                 randconfig-c001-20211028
powerpc              randconfig-c003-20211031
riscv                randconfig-c006-20211031
x86_64               randconfig-c007-20211031
mips                 randconfig-c004-20211031
s390                 randconfig-c005-20211031
arm                  randconfig-c002-20211031
i386                 randconfig-c001-20211031
arm                  randconfig-c002-20211029
powerpc              randconfig-c003-20211029
riscv                randconfig-c006-20211029
x86_64               randconfig-c007-20211029
mips                 randconfig-c004-20211029
s390                 randconfig-c005-20211029
i386                 randconfig-c001-20211029
x86_64               randconfig-a002-20211029
x86_64               randconfig-a004-20211029
x86_64               randconfig-a005-20211029
x86_64               randconfig-a001-20211029
x86_64               randconfig-a006-20211029
x86_64               randconfig-a003-20211029
i386                 randconfig-a004-20211029
i386                 randconfig-a003-20211029
i386                 randconfig-a002-20211029
i386                 randconfig-a001-20211029
i386                 randconfig-a006-20211029
i386                 randconfig-a005-20211029
x86_64               randconfig-a013-20211031
x86_64               randconfig-a015-20211031
x86_64               randconfig-a014-20211031
x86_64               randconfig-a011-20211031
x86_64               randconfig-a016-20211031
x86_64               randconfig-a012-20211031
x86_64               randconfig-a015-20211028
x86_64               randconfig-a013-20211028
x86_64               randconfig-a011-20211028
x86_64               randconfig-a014-20211028
x86_64               randconfig-a012-20211028
x86_64               randconfig-a016-20211028
i386                 randconfig-a013-20211031
i386                 randconfig-a012-20211031
i386                 randconfig-a014-20211031
i386                 randconfig-a015-20211031
i386                 randconfig-a011-20211031
i386                 randconfig-a016-20211031
i386                 randconfig-a012-20211028
i386                 randconfig-a013-20211028
i386                 randconfig-a011-20211028
i386                 randconfig-a015-20211028
i386                 randconfig-a016-20211028
i386                 randconfig-a014-20211028
hexagon              randconfig-r045-20211028
riscv                randconfig-r042-20211028
s390                 randconfig-r044-20211028
hexagon              randconfig-r041-20211028
hexagon              randconfig-r045-20211029
hexagon              randconfig-r041-20211029

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
