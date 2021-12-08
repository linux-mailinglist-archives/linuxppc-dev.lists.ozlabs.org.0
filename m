Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CD46CDB3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 07:24:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J86ZG1ydMz3cDN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 17:24:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J86Ym4Pt1z2ynY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 17:23:34 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="298559842"
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; d="scan'208";a="298559842"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 22:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,296,1631602800"; d="scan'208";a="679774650"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 07 Dec 2021 22:22:28 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1muqLT-00009v-S9; Wed, 08 Dec 2021 06:22:27 +0000
Date: Wed, 08 Dec 2021 14:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 78e00acdd35c0ada7c7d83eab11df0468cc602b7
Message-ID: <61b04eee.LJIUKUoihBR0zY3v%lkp@intel.com>
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
branch HEAD: 78e00acdd35c0ada7c7d83eab11df0468cc602b7  Automatic merge of 'master' into merge (2021-12-03 22:55)

elapsed time: 6754m

configs tested: 349
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
mips                 randconfig-c004-20211203
i386                 randconfig-c001-20211203
i386                 randconfig-c001-20211207
i386                 randconfig-c001-20211206
mips                           ip27_defconfig
sh                          r7780mp_defconfig
powerpc                     tqm5200_defconfig
powerpc                     asp8347_defconfig
arm                            xcep_defconfig
arm                        clps711x_defconfig
alpha                            alldefconfig
ia64                         bigsur_defconfig
sh                             shx3_defconfig
arc                        vdk_hs38_defconfig
sh                          landisk_defconfig
arm                       imx_v6_v7_defconfig
arm                           tegra_defconfig
powerpc                  storcenter_defconfig
arm                          imote2_defconfig
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
s390                             allyesconfig
powerpc                      arches_defconfig
powerpc                     mpc5200_defconfig
sh                      rts7751r2d1_defconfig
s390                                defconfig
nios2                               defconfig
arm                         shannon_defconfig
powerpc                 mpc8540_ads_defconfig
sh                        edosk7760_defconfig
powerpc                     tqm8555_defconfig
openrisc                    or1ksim_defconfig
x86_64                           allyesconfig
arm                        trizeps4_defconfig
arc                          axs101_defconfig
m68k                        m5407c3_defconfig
mips                        maltaup_defconfig
sparc                       sparc64_defconfig
mips                        vocore2_defconfig
arc                              allyesconfig
sh                            hp6xx_defconfig
arm                          pxa3xx_defconfig
sh                               alldefconfig
nios2                         10m50_defconfig
powerpc                     ppa8548_defconfig
openrisc                         alldefconfig
sh                        sh7785lcr_defconfig
riscv                    nommu_k210_defconfig
arm                       cns3420vb_defconfig
sparc64                             defconfig
m68k                            mac_defconfig
arm                        multi_v5_defconfig
arm                          ixp4xx_defconfig
powerpc                  mpc866_ads_defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          rsk7269_defconfig
arc                        nsim_700_defconfig
arm                         s5pv210_defconfig
arm                         axm55xx_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                          atari_defconfig
powerpc                     tqm8560_defconfig
sh                     sh7710voipgw_defconfig
arm                             mxs_defconfig
powerpc                     taishan_defconfig
arm                       omap2plus_defconfig
arm                         lpc32xx_defconfig
arm                       aspeed_g5_defconfig
powerpc                      cm5200_defconfig
powerpc                     skiroot_defconfig
arm                           sunxi_defconfig
arm                  colibri_pxa300_defconfig
i386                             alldefconfig
mips                        qi_lb60_defconfig
mips                         tb0226_defconfig
powerpc                     tqm8541_defconfig
arm                          ep93xx_defconfig
arm                          badge4_defconfig
arc                     nsimosci_hs_defconfig
powerpc                 linkstation_defconfig
powerpc                    gamecube_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      walnut_defconfig
ia64                          tiger_defconfig
xtensa                       common_defconfig
powerpc                     akebono_defconfig
arm                             pxa_defconfig
powerpc                       holly_defconfig
arm                        keystone_defconfig
xtensa                  audio_kc705_defconfig
powerpc                          g5_defconfig
powerpc                      katmai_defconfig
arm                        neponset_defconfig
arm                      integrator_defconfig
powerpc                     kilauea_defconfig
arm                       imx_v4_v5_defconfig
arm                           sama7_defconfig
powerpc                     powernv_defconfig
arm                         orion5x_defconfig
arm                            zeus_defconfig
arm                         vf610m4_defconfig
arm                        multi_v7_defconfig
mips                        workpad_defconfig
sh                             espt_defconfig
arm                      footbridge_defconfig
powerpc                      acadia_defconfig
sh                   sh7724_generic_defconfig
powerpc                    socrates_defconfig
sh                           se7712_defconfig
arm                           stm32_defconfig
sh                           se7780_defconfig
xtensa                generic_kc705_defconfig
arm                             ezx_defconfig
sh                         microdev_defconfig
powerpc                 canyonlands_defconfig
arm                      jornada720_defconfig
powerpc                    ge_imp3a_defconfig
m68k                         apollo_defconfig
h8300                     edosk2674_defconfig
sh                            titan_defconfig
sh                   secureedge5410_defconfig
powerpc                       ppc64_defconfig
m68k                          multi_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          lpd270_defconfig
arm                        oxnas_v6_defconfig
powerpc                 mpc836x_mds_defconfig
sh                          polaris_defconfig
powerpc                      mgcoge_defconfig
arm                         s3c6400_defconfig
sh                           se7721_defconfig
powerpc                      chrp32_defconfig
mips                           mtx1_defconfig
sh                          r7785rp_defconfig
arm                         lubbock_defconfig
mips                         mpc30x_defconfig
powerpc                     sequoia_defconfig
sparc64                          alldefconfig
powerpc                      ppc40x_defconfig
s390                       zfcpdump_defconfig
sh                        sh7757lcr_defconfig
um                           x86_64_defconfig
arm                            qcom_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        mvebu_v5_defconfig
arm                            mps2_defconfig
sh                           se7705_defconfig
m68k                            q40_defconfig
arm                         cm_x300_defconfig
powerpc                    amigaone_defconfig
powerpc                     mpc83xx_defconfig
m68k                           sun3_defconfig
sh                              ul2_defconfig
arm                    vt8500_v6_v7_defconfig
i386                             allyesconfig
arc                     haps_hs_smp_defconfig
m68k                        m5307c3_defconfig
arc                         haps_hs_defconfig
arm                          moxart_defconfig
h8300                    h8300h-sim_defconfig
powerpc                     mpc512x_defconfig
arm                       aspeed_g4_defconfig
sparc                            alldefconfig
powerpc                        warp_defconfig
microblaze                          defconfig
sh                         apsh4a3a_defconfig
sh                            migor_defconfig
powerpc                     pq2fads_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                   currituck_defconfig
sh                          rsk7201_defconfig
arm                           h5000_defconfig
powerpc                     tqm8548_defconfig
arm                  randconfig-c002-20211207
arm                  randconfig-c002-20211205
arm                  randconfig-c002-20211206
arm                  randconfig-c002-20211203
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20211203
x86_64               randconfig-a005-20211203
x86_64               randconfig-a001-20211203
x86_64               randconfig-a002-20211203
x86_64               randconfig-a004-20211203
x86_64               randconfig-a003-20211203
x86_64               randconfig-a006-20211207
x86_64               randconfig-a005-20211207
x86_64               randconfig-a001-20211207
x86_64               randconfig-a002-20211207
x86_64               randconfig-a004-20211207
x86_64               randconfig-a003-20211207
x86_64               randconfig-a006-20211205
x86_64               randconfig-a005-20211205
x86_64               randconfig-a001-20211205
x86_64               randconfig-a002-20211205
x86_64               randconfig-a004-20211205
x86_64               randconfig-a003-20211205
i386                 randconfig-a001-20211205
i386                 randconfig-a005-20211205
i386                 randconfig-a003-20211205
i386                 randconfig-a002-20211205
i386                 randconfig-a006-20211205
i386                 randconfig-a004-20211205
i386                 randconfig-a001-20211203
i386                 randconfig-a005-20211203
i386                 randconfig-a002-20211203
i386                 randconfig-a003-20211203
i386                 randconfig-a006-20211203
i386                 randconfig-a004-20211203
i386                 randconfig-a002-20211207
i386                 randconfig-a003-20211207
i386                 randconfig-a004-20211207
i386                 randconfig-a001-20211207
i386                 randconfig-a005-20211207
i386                 randconfig-a006-20211207
x86_64               randconfig-a016-20211206
x86_64               randconfig-a011-20211206
x86_64               randconfig-a013-20211206
x86_64               randconfig-a014-20211206
x86_64               randconfig-a012-20211206
x86_64               randconfig-a015-20211206
i386                 randconfig-a016-20211206
i386                 randconfig-a013-20211206
i386                 randconfig-a011-20211206
i386                 randconfig-a014-20211206
i386                 randconfig-a012-20211206
i386                 randconfig-a015-20211206
i386                 randconfig-a013-20211204
i386                 randconfig-a016-20211204
i386                 randconfig-a011-20211204
i386                 randconfig-a014-20211204
i386                 randconfig-a012-20211204
i386                 randconfig-a015-20211204
arc                  randconfig-r043-20211207
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c007-20211205
arm                  randconfig-c002-20211205
riscv                randconfig-c006-20211205
mips                 randconfig-c004-20211205
i386                 randconfig-c001-20211205
powerpc              randconfig-c003-20211205
s390                 randconfig-c005-20211205
x86_64               randconfig-a006-20211206
x86_64               randconfig-a005-20211206
x86_64               randconfig-a001-20211206
x86_64               randconfig-a002-20211206
x86_64               randconfig-a004-20211206
x86_64               randconfig-a003-20211206
x86_64               randconfig-a006-20211204
x86_64               randconfig-a005-20211204
x86_64               randconfig-a001-20211204
x86_64               randconfig-a002-20211204
x86_64               randconfig-a004-20211204
x86_64               randconfig-a003-20211204
i386                 randconfig-a001-20211206
i386                 randconfig-a005-20211206
i386                 randconfig-a002-20211206
i386                 randconfig-a003-20211206
i386                 randconfig-a006-20211206
i386                 randconfig-a004-20211206
x86_64               randconfig-a016-20211203
x86_64               randconfig-a011-20211203
x86_64               randconfig-a013-20211203
x86_64               randconfig-a014-20211203
x86_64               randconfig-a015-20211203
x86_64               randconfig-a012-20211203
x86_64               randconfig-a016-20211205
x86_64               randconfig-a011-20211205
x86_64               randconfig-a013-20211205
x86_64               randconfig-a015-20211205
x86_64               randconfig-a012-20211205
x86_64               randconfig-a014-20211205
i386                 randconfig-a016-20211203
i386                 randconfig-a013-20211203
i386                 randconfig-a011-20211203
i386                 randconfig-a014-20211203
i386                 randconfig-a012-20211203
i386                 randconfig-a015-20211203
i386                 randconfig-a013-20211205
i386                 randconfig-a016-20211205
i386                 randconfig-a011-20211205
i386                 randconfig-a014-20211205
i386                 randconfig-a012-20211205
i386                 randconfig-a015-20211205
i386                 randconfig-a013-20211207
i386                 randconfig-a011-20211207
i386                 randconfig-a012-20211207
i386                 randconfig-a016-20211207
i386                 randconfig-a015-20211207
i386                 randconfig-a014-20211207
hexagon              randconfig-r045-20211203
s390                 randconfig-r044-20211203
hexagon              randconfig-r041-20211203
riscv                randconfig-r042-20211203
hexagon              randconfig-r045-20211206
hexagon              randconfig-r041-20211206
hexagon              randconfig-r045-20211204
hexagon              randconfig-r041-20211204
hexagon              randconfig-r045-20211205
s390                 randconfig-r044-20211205
riscv                randconfig-r042-20211205
hexagon              randconfig-r041-20211205
hexagon              randconfig-r045-20211207
s390                 randconfig-r044-20211207
hexagon              randconfig-r041-20211207
riscv                randconfig-r042-20211207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
