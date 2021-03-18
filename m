Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94A733FC89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 02:08:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F186x5kD8z3bqN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 12:08:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F186c4QkDz2yQm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 12:08:38 +1100 (AEDT)
IronPort-SDR: H1issjPLjBZmRyFrh2/HdrSvnguDJozlE9ZTlriaasa5jcw845APyVBu+AEW04dMFpWRMT26ct
 OYVqhVLMsJmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="187211836"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="187211836"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 18:08:33 -0700
IronPort-SDR: dge/flkxZHXMkMwhWrCxwjLF2x1jAN57KsePRCJPXT508odOmU/OeWFIylGOVteBMdL0WeSh9r
 MHt5snPe+RFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="605936954"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 17 Mar 2021 18:08:32 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lMh9M-0000wV-5K; Thu, 18 Mar 2021 01:08:32 +0000
Date: Thu, 18 Mar 2021 09:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 cc7a0bb058b85ea03db87169c60c7cfdd5d34678
Message-ID: <6052a7f5.ScXwK3UDSwzivtIj%lkp@intel.com>
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
branch HEAD: cc7a0bb058b85ea03db87169c60c7cfdd5d34678  PCI: rpadlpar: Fix potential drc_name corruption in store functions

elapsed time: 1279m

configs tested: 210
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
nds32                            alldefconfig
arm                      pxa255-idp_defconfig
arm                         lpc32xx_defconfig
sh                     sh7710voipgw_defconfig
powerpc                    ge_imp3a_defconfig
arm                     am200epdkit_defconfig
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
sh                           se7721_defconfig
m68k                                defconfig
h8300                     edosk2674_defconfig
powerpc                     redwood_defconfig
mips                        qi_lb60_defconfig
powerpc                     taishan_defconfig
powerpc                          allmodconfig
mips                            gpr_defconfig
powerpc                    socrates_defconfig
arc                         haps_hs_defconfig
arm                       spear13xx_defconfig
powerpc                     mpc512x_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                            mmp2_defconfig
arm                         palmz72_defconfig
arm                          iop32x_defconfig
arm                        neponset_defconfig
powerpc                     kilauea_defconfig
arm                         bcm2835_defconfig
sh                          rsk7269_defconfig
sh                           se7751_defconfig
parisc                generic-64bit_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                              alldefconfig
sh                          landisk_defconfig
powerpc                    mvme5100_defconfig
m68k                       m5249evb_defconfig
sh                            titan_defconfig
powerpc                      ppc40x_defconfig
sh                        edosk7705_defconfig
s390                          debug_defconfig
sh                         apsh4a3a_defconfig
m68k                        mvme16x_defconfig
m68k                       bvme6000_defconfig
powerpc                 mpc832x_mds_defconfig
arm                          ep93xx_defconfig
mips                         cobalt_defconfig
sh                   secureedge5410_defconfig
powerpc                     asp8347_defconfig
arm                           tegra_defconfig
powerpc                      pmac32_defconfig
arm                             rpc_defconfig
arc                           tb10x_defconfig
xtensa                  audio_kc705_defconfig
sh                           se7750_defconfig
arc                        nsim_700_defconfig
arm                          pxa910_defconfig
powerpc                      makalu_defconfig
sh                           se7206_defconfig
sh                           se7724_defconfig
arm                       cns3420vb_defconfig
mips                           rs90_defconfig
arm                          simpad_defconfig
mips                           gcw0_defconfig
powerpc                       eiger_defconfig
mips                       bmips_be_defconfig
m68k                        stmark2_defconfig
powerpc                         wii_defconfig
mips                     loongson1c_defconfig
sh                        sh7785lcr_defconfig
mips                           ip28_defconfig
powerpc                    adder875_defconfig
arm                         assabet_defconfig
arc                              alldefconfig
arm                       multi_v4t_defconfig
sh                           se7619_defconfig
sh                          sdk7786_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc836x_mds_defconfig
arm                        clps711x_defconfig
powerpc                      arches_defconfig
sparc                       sparc32_defconfig
powerpc                     stx_gp3_defconfig
arm                       imx_v4_v5_defconfig
powerpc                      chrp32_defconfig
mips                     loongson1b_defconfig
h8300                    h8300h-sim_defconfig
sh                        sh7757lcr_defconfig
sh                               alldefconfig
powerpc                  storcenter_defconfig
arm                   milbeaut_m10v_defconfig
mips                          ath79_defconfig
powerpc                      pcm030_defconfig
arm                     eseries_pxa_defconfig
powerpc                   lite5200b_defconfig
powerpc                     ppa8548_defconfig
powerpc                       ebony_defconfig
arm                      footbridge_defconfig
mips                        bcm47xx_defconfig
powerpc                mpc7448_hpc2_defconfig
xtensa                              defconfig
arm                         lpc18xx_defconfig
sh                          lboxre2_defconfig
alpha                            allyesconfig
powerpc                     tqm8541_defconfig
alpha                            alldefconfig
arm                         lubbock_defconfig
ia64                            zx1_defconfig
sh                             espt_defconfig
arc                        nsimosci_defconfig
parisc                           allyesconfig
powerpc                    sam440ep_defconfig
powerpc                 mpc8560_ads_defconfig
arm                          ixp4xx_defconfig
mips                        vocore2_defconfig
powerpc                     mpc5200_defconfig
powerpc                   motionpro_defconfig
nios2                            alldefconfig
mips                           ip27_defconfig
xtensa                       common_defconfig
nios2                         3c120_defconfig
mips                            ar7_defconfig
mips                        maltaup_defconfig
arm                           stm32_defconfig
mips                          ath25_defconfig
powerpc64                        alldefconfig
s390                       zfcpdump_defconfig
microblaze                          defconfig
powerpc                      cm5200_defconfig
sh                   sh7770_generic_defconfig
mips                    maltaup_xpa_defconfig
mips                      malta_kvm_defconfig
arm                            lart_defconfig
arm                           spitz_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                         vf610m4_defconfig
xtensa                           alldefconfig
arm                          collie_defconfig
sh                        sh7763rdp_defconfig
powerpc                     sbc8548_defconfig
arm                          exynos_defconfig
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210317
x86_64               randconfig-a001-20210317
x86_64               randconfig-a005-20210317
x86_64               randconfig-a004-20210317
x86_64               randconfig-a003-20210317
x86_64               randconfig-a002-20210317
i386                 randconfig-a001-20210317
i386                 randconfig-a005-20210317
i386                 randconfig-a002-20210317
i386                 randconfig-a003-20210317
i386                 randconfig-a004-20210317
i386                 randconfig-a006-20210317
i386                 randconfig-a013-20210317
i386                 randconfig-a016-20210317
i386                 randconfig-a011-20210317
i386                 randconfig-a012-20210317
i386                 randconfig-a015-20210317
i386                 randconfig-a014-20210317
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210317
x86_64               randconfig-a016-20210317
x86_64               randconfig-a013-20210317
x86_64               randconfig-a014-20210317
x86_64               randconfig-a015-20210317
x86_64               randconfig-a012-20210317

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
