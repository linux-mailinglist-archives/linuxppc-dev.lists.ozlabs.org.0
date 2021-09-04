Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDDE40093B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 04:01:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1dDn6sjzz2yg4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 12:01:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1dDK34YRz2xs6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Sep 2021 12:00:48 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="199778527"
X-IronPort-AV: E=Sophos;i="5.85,267,1624345200"; d="scan'208";a="199778527"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 18:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,267,1624345200"; d="scan'208";a="690126605"
Received: from lkp-server01.sh.intel.com (HELO 2115029a3e5c) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 03 Sep 2021 18:59:44 -0700
Received: from kbuild by 2115029a3e5c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mMKy7-00014T-Br; Sat, 04 Sep 2021 01:59:43 +0000
Date: Sat, 04 Sep 2021 09:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS a3314262eede9c909a0c797f16f25f941d12c78d
Message-ID: <6132d2d8.B5EjoG+11jNmjmO5%lkp@intel.com>
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
branch HEAD: a3314262eede9c909a0c797f16f25f941d12c78d  Merge branch 'fixes' into next

elapsed time: 721m

configs tested: 155
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210904
arm                         axm55xx_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     rainier_defconfig
mips                         tb0226_defconfig
m68k                        m5272c3_defconfig
mips                        bcm63xx_defconfig
arm                         socfpga_defconfig
arm                        spear6xx_defconfig
powerpc                 mpc8560_ads_defconfig
m68k                         amcore_defconfig
sparc                       sparc64_defconfig
sh                   sh7770_generic_defconfig
arm                  colibri_pxa270_defconfig
arm                          simpad_defconfig
arc                     haps_hs_smp_defconfig
powerpc                    klondike_defconfig
powerpc                     tqm8548_defconfig
powerpc                        cell_defconfig
h8300                     edosk2674_defconfig
powerpc                      pasemi_defconfig
s390                             allmodconfig
powerpc                     mpc83xx_defconfig
powerpc                      makalu_defconfig
arm                  colibri_pxa300_defconfig
sh                          polaris_defconfig
arm                       imx_v6_v7_defconfig
mips                    maltaup_xpa_defconfig
sh                          urquell_defconfig
microblaze                      mmu_defconfig
xtensa                  nommu_kc705_defconfig
arm                         at91_dt_defconfig
ia64                        generic_defconfig
powerpc                      katmai_defconfig
arm                         nhk8815_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     asp8347_defconfig
arm                       versatile_defconfig
mips                        nlm_xlr_defconfig
sh                             shx3_defconfig
arm                        clps711x_defconfig
um                                  defconfig
m68k                             allyesconfig
mips                         rt305x_defconfig
mips                        maltaup_defconfig
arm                         s5pv210_defconfig
arm                           viper_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                      pxa255-idp_defconfig
ia64                         bigsur_defconfig
arm                            lart_defconfig
powerpc                      ppc64e_defconfig
mips                           ci20_defconfig
sh                     magicpanelr2_defconfig
arm                    vt8500_v6_v7_defconfig
sh                         ecovec24_defconfig
sh                   rts7751r2dplus_defconfig
nios2                         3c120_defconfig
mips                       capcella_defconfig
arm                        cerfcube_defconfig
riscv                               defconfig
powerpc               mpc834x_itxgp_defconfig
m68k                        mvme16x_defconfig
mips                      bmips_stb_defconfig
mips                      maltaaprp_defconfig
powerpc                     akebono_defconfig
sh                         microdev_defconfig
powerpc                 mpc85xx_cds_defconfig
xtensa                generic_kc705_defconfig
parisc                generic-32bit_defconfig
arm                          exynos_defconfig
sh                          rsk7264_defconfig
powerpc                     tqm5200_defconfig
xtensa                       common_defconfig
arm                  randconfig-c002-20210904
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210904
x86_64               randconfig-a004-20210904
x86_64               randconfig-a003-20210904
x86_64               randconfig-a005-20210904
x86_64               randconfig-a001-20210904
x86_64               randconfig-a002-20210904
i386                 randconfig-a005-20210904
i386                 randconfig-a004-20210904
i386                 randconfig-a006-20210904
i386                 randconfig-a002-20210904
i386                 randconfig-a003-20210904
i386                 randconfig-a001-20210904
arc                  randconfig-r043-20210904
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20210904
mips                 randconfig-c004-20210904
powerpc              randconfig-c003-20210904
x86_64               randconfig-c007-20210904
i386                 randconfig-c001-20210904
arm                  randconfig-c002-20210904
riscv                randconfig-c006-20210904
x86_64               randconfig-a011-20210904
x86_64               randconfig-a016-20210904
x86_64               randconfig-a012-20210904
x86_64               randconfig-a015-20210904
x86_64               randconfig-a014-20210904
x86_64               randconfig-a013-20210904
i386                 randconfig-a012-20210904
i386                 randconfig-a015-20210904
i386                 randconfig-a011-20210904
i386                 randconfig-a013-20210904
i386                 randconfig-a014-20210904
i386                 randconfig-a016-20210904

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
