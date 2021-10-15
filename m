Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246442E70E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 05:06:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVrlT561Dz3bbF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 14:06:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVrl14FjXz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 14:06:15 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="251282789"
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; d="scan'208";a="251282789"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 20:05:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; d="scan'208";a="443065859"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 14 Oct 2021 20:05:09 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mbDWv-00076k-9M; Fri, 15 Oct 2021 03:05:09 +0000
Date: Fri, 15 Oct 2021 11:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 38947529bb05bbb8acfb2fe0ff96c2f1bc3f2c96
Message-ID: <6168efe3.spJwbjUV2XWYt57s%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 38947529bb05bbb8acfb2fe0ff96c2f1bc3f2c96  Automatic merge of 'next' into merge (2021-10-11 23:09)

elapsed time: 5150m

configs tested: 276
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211012
i386                 randconfig-c001-20211011
i386                 randconfig-c001-20211014
mips                         tb0219_defconfig
arm                        mvebu_v7_defconfig
xtensa                  audio_kc705_defconfig
ia64                            zx1_defconfig
powerpc                     tqm8560_defconfig
sh                           se7705_defconfig
m68k                             alldefconfig
sh                              ul2_defconfig
sh                            hp6xx_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                   sb1250_swarm_defconfig
sh                                  defconfig
powerpc                     mpc83xx_defconfig
sh                     sh7710voipgw_defconfig
m68k                          hp300_defconfig
arm                         at91_dt_defconfig
mips                            ar7_defconfig
arm                       cns3420vb_defconfig
sh                   secureedge5410_defconfig
powerpc                     tqm8540_defconfig
powerpc                   motionpro_defconfig
arm                           corgi_defconfig
arm                        vexpress_defconfig
powerpc                     stx_gp3_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                      obs600_defconfig
powerpc                    gamecube_defconfig
mips                       bmips_be_defconfig
sh                           se7619_defconfig
arm                            mps2_defconfig
h8300                            allyesconfig
arm                           tegra_defconfig
mips                       lemote2f_defconfig
xtensa                  cadence_csp_defconfig
powerpc                         ps3_defconfig
powerpc                 xes_mpc85xx_defconfig
sh                ecovec24-romimage_defconfig
sparc                       sparc64_defconfig
sh                        sh7757lcr_defconfig
powerpc                   microwatt_defconfig
mips                           ci20_defconfig
openrisc                    or1ksim_defconfig
powerpc                     akebono_defconfig
arm                            qcom_defconfig
sparc                            alldefconfig
powerpc                        warp_defconfig
sh                 kfr2r09-romimage_defconfig
arm                           u8500_defconfig
powerpc                     tqm8548_defconfig
um                                  defconfig
mips                        maltaup_defconfig
parisc                generic-32bit_defconfig
microblaze                          defconfig
sh                        sh7785lcr_defconfig
mips                           ip22_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                    ge_imp3a_defconfig
xtensa                generic_kc705_defconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
mips                      fuloong2e_defconfig
sh                          sdk7786_defconfig
powerpc                 canyonlands_defconfig
nds32                               defconfig
mips                  cavium_octeon_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                      cm5200_defconfig
m68k                        m5272c3_defconfig
riscv                    nommu_k210_defconfig
xtensa                    xip_kc705_defconfig
powerpc                 linkstation_defconfig
arc                         haps_hs_defconfig
m68k                       m5249evb_defconfig
mips                        vocore2_defconfig
m68k                       m5208evb_defconfig
ia64                         bigsur_defconfig
arc                     nsimosci_hs_defconfig
arm                      tct_hammer_defconfig
mips                       rbtx49xx_defconfig
powerpc                      pmac32_defconfig
sh                          lboxre2_defconfig
powerpc                      ep88xc_defconfig
sh                          kfr2r09_defconfig
powerpc                      mgcoge_defconfig
arm                          simpad_defconfig
powerpc                       ebony_defconfig
xtensa                           alldefconfig
powerpc                      makalu_defconfig
arm                        multi_v7_defconfig
sh                           se7721_defconfig
arm                          gemini_defconfig
powerpc                      pasemi_defconfig
m68k                         apollo_defconfig
arm                       imx_v6_v7_defconfig
sh                            migor_defconfig
xtensa                         virt_defconfig
xtensa                          iss_defconfig
h8300                               defconfig
m68k                          amiga_defconfig
powerpc                 mpc8560_ads_defconfig
arm                      footbridge_defconfig
m68k                            q40_defconfig
mips                         mpc30x_defconfig
powerpc                      ppc44x_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     tqm5200_defconfig
powerpc                     sequoia_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                      bmips_stb_defconfig
powerpc                       eiger_defconfig
mips                            e55_defconfig
mips                        nlm_xlp_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      chrp32_defconfig
arm                           spitz_defconfig
arc                      axs103_smp_defconfig
um                           x86_64_defconfig
powerpc                    klondike_defconfig
arm                            mmp2_defconfig
powerpc                        fsp2_defconfig
h8300                            alldefconfig
arm                         socfpga_defconfig
arm                          pcm027_defconfig
mips                        qi_lb60_defconfig
arm                           omap1_defconfig
m68k                           sun3_defconfig
powerpc                   bluestone_defconfig
mips                     loongson2k_defconfig
mips                     loongson1b_defconfig
mips                         db1xxx_defconfig
arc                        nsimosci_defconfig
arm                  randconfig-c002-20211014
x86_64               randconfig-c001-20211014
arm                  randconfig-c002-20211011
x86_64               randconfig-c001-20211011
arm                  randconfig-c002-20211012
x86_64               randconfig-c001-20211012
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
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
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211014
x86_64               randconfig-a004-20211014
x86_64               randconfig-a001-20211014
x86_64               randconfig-a005-20211014
x86_64               randconfig-a002-20211014
x86_64               randconfig-a003-20211014
i386                 randconfig-a003-20211014
i386                 randconfig-a001-20211014
i386                 randconfig-a005-20211014
i386                 randconfig-a004-20211014
i386                 randconfig-a002-20211014
i386                 randconfig-a006-20211014
i386                 randconfig-a001-20211012
i386                 randconfig-a003-20211012
i386                 randconfig-a004-20211012
i386                 randconfig-a005-20211012
i386                 randconfig-a002-20211012
i386                 randconfig-a006-20211012
x86_64               randconfig-a015-20211011
x86_64               randconfig-a012-20211011
x86_64               randconfig-a016-20211011
x86_64               randconfig-a014-20211011
x86_64               randconfig-a013-20211011
x86_64               randconfig-a011-20211011
x86_64               randconfig-a004-20211012
x86_64               randconfig-a006-20211012
x86_64               randconfig-a001-20211012
x86_64               randconfig-a005-20211012
x86_64               randconfig-a002-20211012
x86_64               randconfig-a003-20211012
i386                 randconfig-a016-20211011
i386                 randconfig-a014-20211011
i386                 randconfig-a011-20211011
i386                 randconfig-a015-20211011
i386                 randconfig-a012-20211011
i386                 randconfig-a013-20211011
arc                  randconfig-r043-20211014
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
arm                  randconfig-c002-20211012
mips                 randconfig-c004-20211012
i386                 randconfig-c001-20211012
s390                 randconfig-c005-20211012
x86_64               randconfig-c007-20211012
powerpc              randconfig-c003-20211012
riscv                randconfig-c006-20211012
x86_64               randconfig-a004-20211011
x86_64               randconfig-a006-20211011
x86_64               randconfig-a001-20211011
x86_64               randconfig-a005-20211011
x86_64               randconfig-a002-20211011
x86_64               randconfig-a003-20211011
i386                 randconfig-a001-20211011
i386                 randconfig-a003-20211011
i386                 randconfig-a004-20211011
i386                 randconfig-a005-20211011
i386                 randconfig-a002-20211011
i386                 randconfig-a006-20211011
x86_64               randconfig-a015-20211012
x86_64               randconfig-a012-20211012
x86_64               randconfig-a016-20211012
x86_64               randconfig-a014-20211012
x86_64               randconfig-a013-20211012
x86_64               randconfig-a011-20211012
x86_64               randconfig-a012-20211014
x86_64               randconfig-a015-20211014
x86_64               randconfig-a016-20211014
x86_64               randconfig-a014-20211014
x86_64               randconfig-a011-20211014
x86_64               randconfig-a013-20211014
i386                 randconfig-a016-20211012
i386                 randconfig-a014-20211012
i386                 randconfig-a011-20211012
i386                 randconfig-a015-20211012
i386                 randconfig-a012-20211012
i386                 randconfig-a013-20211012
i386                 randconfig-a016-20211014
i386                 randconfig-a014-20211014
i386                 randconfig-a011-20211014
i386                 randconfig-a015-20211014
i386                 randconfig-a012-20211014
i386                 randconfig-a013-20211014
hexagon              randconfig-r041-20211012
s390                 randconfig-r044-20211012
riscv                randconfig-r042-20211012
hexagon              randconfig-r045-20211012
hexagon              randconfig-r041-20211011
hexagon              randconfig-r045-20211011
hexagon              randconfig-r041-20211014
s390                 randconfig-r044-20211014
riscv                randconfig-r042-20211014
hexagon              randconfig-r045-20211014

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
