Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEC234DDD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 03:55:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8XZX2qgLz30CG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 12:55:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8XZB2Gq8z2yyh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 12:54:35 +1100 (AEDT)
IronPort-SDR: NoWybNeduw0CpBW3lRXkRCZYtUU/Q2dx+8MKsh/ZSvJHlbv1dyD4e0Enq+IeicWnIZmpkOjB3r
 gMcgJ/Y+FAUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="171682180"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="171682180"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 18:54:31 -0700
IronPort-SDR: Xc0dyJ4ul8D6/FmmJBBY0QY7NOILgSzcp9+TrQ4x9G+cHu81I8032emyfBmINMnjzbP164JDqf
 Bcmw3vNnXqJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="606587332"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 29 Mar 2021 18:54:30 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lR3aP-0004wm-8e; Tue, 30 Mar 2021 01:54:29 +0000
Date: Tue, 30 Mar 2021 09:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 53f1d31708f6240e4615b0927df31f182e389e2f
Message-ID: <606284be.0rJoXd5GhdI+ZwyY%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 53f1d31708f6240e4615b0927df31f182e389e2f  powerpc/mm/book3s64: Use the correct storage key value when calling H_PROTECT

elapsed time: 3677m

configs tested: 297
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
sh                        sh7763rdp_defconfig
arm                         lpc32xx_defconfig
arm64                            alldefconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                          atari_defconfig
sh                           se7712_defconfig
arc                        nsim_700_defconfig
arc                           tb10x_defconfig
arm                        keystone_defconfig
powerpc                      pcm030_defconfig
powerpc                    socrates_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
arm                    vt8500_v6_v7_defconfig
arm                         cm_x300_defconfig
riscv                            alldefconfig
arm                            hisi_defconfig
microblaze                      mmu_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                            hsdk_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
powerpc                      walnut_defconfig
parisc                generic-32bit_defconfig
sh                         ecovec24_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       versatile_defconfig
arm                         mv78xx0_defconfig
powerpc                     akebono_defconfig
powerpc                    adder875_defconfig
sh                         microdev_defconfig
arm                        multi_v7_defconfig
sh                                  defconfig
arm                      pxa255-idp_defconfig
arm                          iop32x_defconfig
powerpc                 mpc836x_mds_defconfig
nios2                         10m50_defconfig
openrisc                            defconfig
powerpc                       holly_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                         orion5x_defconfig
powerpc                      chrp32_defconfig
arm                       omap2plus_defconfig
sh                          rsk7264_defconfig
riscv                    nommu_virt_defconfig
um                            kunit_defconfig
powerpc                    sam440ep_defconfig
powerpc                  storcenter_defconfig
parisc                           allyesconfig
arm                          simpad_defconfig
m68k                        stmark2_defconfig
nds32                            alldefconfig
arc                     haps_hs_smp_defconfig
arm                      footbridge_defconfig
ia64                            zx1_defconfig
m68k                                defconfig
arm                          imote2_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        mvme16x_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
sh                   rts7751r2dplus_defconfig
h8300                       h8s-sim_defconfig
m68k                         apollo_defconfig
mips                        omega2p_defconfig
um                             i386_defconfig
powerpc                     sbc8548_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                       ebony_defconfig
sh                            titan_defconfig
sparc64                             defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
arm                     am200epdkit_defconfig
arm                          pxa910_defconfig
arm                          collie_defconfig
powerpc                 mpc834x_itx_defconfig
sh                           se7722_defconfig
parisc                generic-64bit_defconfig
m68k                        mvme147_defconfig
h8300                    h8300h-sim_defconfig
m68k                       m5475evb_defconfig
sparc                            allyesconfig
sh                ecovec24-romimage_defconfig
arm                        vexpress_defconfig
powerpc                   bluestone_defconfig
powerpc                      acadia_defconfig
arm                       multi_v4t_defconfig
arm                            mps2_defconfig
powerpc                        cell_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                          gemini_defconfig
powerpc                     ppa8548_defconfig
mips                         cobalt_defconfig
powerpc                  mpc885_ads_defconfig
arm                       aspeed_g4_defconfig
riscv                    nommu_k210_defconfig
arm                       cns3420vb_defconfig
sh                           sh2007_defconfig
arm                      tct_hammer_defconfig
m68k                            mac_defconfig
powerpc64                        alldefconfig
sh                           se7705_defconfig
powerpc                     rainier_defconfig
powerpc                          g5_defconfig
powerpc                     tqm8541_defconfig
i386                             alldefconfig
sparc                       sparc64_defconfig
arm                  colibri_pxa300_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          rsk7203_defconfig
powerpc                     redwood_defconfig
powerpc                     tqm5200_defconfig
arm                  colibri_pxa270_defconfig
sh                        edosk7705_defconfig
sh                           se7724_defconfig
m68k                        m5407c3_defconfig
arm                          pcm027_defconfig
mips                           rs90_defconfig
sh                        dreamcast_defconfig
arm                     eseries_pxa_defconfig
mips                          rb532_defconfig
arm                        clps711x_defconfig
powerpc                 mpc837x_mds_defconfig
arm                        mini2440_defconfig
arm                           tegra_defconfig
mips                      pistachio_defconfig
openrisc                 simple_smp_defconfig
mips                        nlm_xlp_defconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          kfr2r09_defconfig
arm                        neponset_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                          sdk7780_defconfig
powerpc                 mpc8560_ads_defconfig
sh                          r7785rp_defconfig
m68k                       bvme6000_defconfig
arm                             pxa_defconfig
sh                         ap325rxa_defconfig
mips                        maltaup_defconfig
powerpc                      katmai_defconfig
powerpc                     mpc5200_defconfig
mips                     loongson1b_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
arm                         assabet_defconfig
sh                               alldefconfig
arm                         s3c6400_defconfig
xtensa                       common_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      bamboo_defconfig
powerpc                        warp_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                     pq2fads_defconfig
m68k                            q40_defconfig
arm                           h5000_defconfig
sh                        edosk7760_defconfig
sh                        sh7757lcr_defconfig
powerpc                         ps3_defconfig
arm                       mainstone_defconfig
arm                           omap1_defconfig
sparc64                          alldefconfig
riscv             nommu_k210_sdcard_defconfig
arm                         shannon_defconfig
powerpc                      ppc6xx_defconfig
arm                          ixp4xx_defconfig
arc                      axs103_smp_defconfig
arm                           spitz_defconfig
arm                         s3c2410_defconfig
arm                      jornada720_defconfig
mips                      pic32mzda_defconfig
mips                        jmr3927_defconfig
m68k                       m5275evb_defconfig
sh                           se7206_defconfig
mips                     cu1830-neo_defconfig
sh                            shmin_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
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
s390                             allmodconfig
s390                                defconfig
sparc                               defconfig
i386                                defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210329
x86_64               randconfig-a003-20210329
x86_64               randconfig-a006-20210329
x86_64               randconfig-a001-20210329
x86_64               randconfig-a005-20210329
x86_64               randconfig-a004-20210329
i386                 randconfig-a003-20210329
i386                 randconfig-a004-20210329
i386                 randconfig-a001-20210329
i386                 randconfig-a002-20210329
i386                 randconfig-a006-20210329
i386                 randconfig-a005-20210329
i386                 randconfig-a003-20210327
i386                 randconfig-a004-20210327
i386                 randconfig-a001-20210327
i386                 randconfig-a002-20210327
i386                 randconfig-a006-20210327
i386                 randconfig-a005-20210327
x86_64               randconfig-a015-20210328
x86_64               randconfig-a012-20210328
x86_64               randconfig-a013-20210328
x86_64               randconfig-a014-20210328
x86_64               randconfig-a016-20210328
x86_64               randconfig-a011-20210328
i386                 randconfig-a011-20210329
i386                 randconfig-a016-20210329
i386                 randconfig-a013-20210329
i386                 randconfig-a012-20210329
i386                 randconfig-a014-20210329
i386                 randconfig-a015-20210329
i386                 randconfig-a014-20210326
i386                 randconfig-a011-20210326
i386                 randconfig-a015-20210326
i386                 randconfig-a016-20210326
i386                 randconfig-a012-20210326
i386                 randconfig-a013-20210326
i386                 randconfig-a014-20210327
i386                 randconfig-a011-20210327
i386                 randconfig-a015-20210327
i386                 randconfig-a016-20210327
i386                 randconfig-a012-20210327
i386                 randconfig-a013-20210327
x86_64               randconfig-a002-20210327
x86_64               randconfig-a003-20210327
x86_64               randconfig-a006-20210327
x86_64               randconfig-a001-20210327
x86_64               randconfig-a004-20210327
x86_64               randconfig-a005-20210327
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210328
x86_64               randconfig-a003-20210328
x86_64               randconfig-a001-20210328
x86_64               randconfig-a006-20210328
x86_64               randconfig-a005-20210328
x86_64               randconfig-a004-20210328
x86_64               randconfig-a015-20210329
x86_64               randconfig-a012-20210329
x86_64               randconfig-a013-20210329
x86_64               randconfig-a014-20210329
x86_64               randconfig-a011-20210329
x86_64               randconfig-a016-20210329
x86_64               randconfig-a012-20210327
x86_64               randconfig-a015-20210327
x86_64               randconfig-a014-20210327
x86_64               randconfig-a013-20210327
x86_64               randconfig-a011-20210327
x86_64               randconfig-a016-20210327

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
