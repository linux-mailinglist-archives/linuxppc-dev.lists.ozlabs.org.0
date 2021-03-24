Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3479346E72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 02:05:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4qls02tMz3bqp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 12:05:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4qlR56Yzz304J
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 12:04:49 +1100 (AEDT)
IronPort-SDR: YDSf0px4PY4avFSKbEgWjueF+d5pvQOxNLuUAnsKIuudSD1T3DoUf5+HJUQBRXCMoQ0J+QmdVB
 acsNVHMKGUkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="251954582"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="251954582"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 18:04:47 -0700
IronPort-SDR: axeWNcM7EiP3UtFEG7ZiQHIBIHkrEeYga+i90NYESwcytjKQjcZAvhYScnfwOnPUdJBMHQOqGw
 riK3jlvGG82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="452372924"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 23 Mar 2021 18:04:45 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lOrwy-0000th-SM; Wed, 24 Mar 2021 01:04:44 +0000
Date: Wed, 24 Mar 2021 09:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 274cb1ca2e7ce02cab56f5f4c61a74aeb566f931
Message-ID: <605a9021.SoZeP/FrrcYOJ0aH%lkp@intel.com>
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
branch HEAD: 274cb1ca2e7ce02cab56f5f4c61a74aeb566f931  powerpc/pseries/mobility: handle premature return from H_JOIN

elapsed time: 721m

configs tested: 206
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
riscv                            allyesconfig
i386                             allyesconfig
powerpc                    sam440ep_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     ppa8548_defconfig
mips                        workpad_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                     cu1000-neo_defconfig
arm                        mini2440_defconfig
powerpc                     redwood_defconfig
mips                            ar7_defconfig
m68k                            mac_defconfig
m68k                             allyesconfig
arm                          imote2_defconfig
mips                           ip27_defconfig
sh                           se7724_defconfig
mips                           jazz_defconfig
m68k                           sun3_defconfig
powerpc                     skiroot_defconfig
mips                      bmips_stb_defconfig
arm                   milbeaut_m10v_defconfig
arm                         mv78xx0_defconfig
arm                           h5000_defconfig
arm                        spear3xx_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                            lart_defconfig
m68k                        m5307c3_defconfig
h8300                    h8300h-sim_defconfig
sh                   rts7751r2dplus_defconfig
arm                           sunxi_defconfig
sh                         ap325rxa_defconfig
mips                         bigsur_defconfig
m68k                        m5407c3_defconfig
arm                            hisi_defconfig
arm                        vexpress_defconfig
m68k                       m5208evb_defconfig
powerpc                     ksi8560_defconfig
arm                            mps2_defconfig
arm                         shannon_defconfig
arm                       omap2plus_defconfig
arm                      tct_hammer_defconfig
powerpc                      cm5200_defconfig
powerpc                  iss476-smp_defconfig
mips                malta_kvm_guest_defconfig
arc                     haps_hs_smp_defconfig
powerpc                   lite5200b_defconfig
powerpc                     sequoia_defconfig
mips                       rbtx49xx_defconfig
arm                      pxa255-idp_defconfig
arm                          exynos_defconfig
powerpc                   bluestone_defconfig
powerpc                    adder875_defconfig
arm                           omap1_defconfig
powerpc                     tqm8560_defconfig
arm                        trizeps4_defconfig
xtensa                  cadence_csp_defconfig
sh                     magicpanelr2_defconfig
m68k                       m5475evb_defconfig
mips                         db1xxx_defconfig
mips                      maltaaprp_defconfig
mips                         tb0287_defconfig
sh                          sdk7780_defconfig
powerpc                  storcenter_defconfig
powerpc                     kilauea_defconfig
mips                   sb1250_swarm_defconfig
arc                        vdk_hs38_defconfig
ia64                        generic_defconfig
arc                        nsim_700_defconfig
arm                          pxa910_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    socrates_defconfig
nds32                             allnoconfig
arm                       imx_v6_v7_defconfig
arm                        neponset_defconfig
sh                            hp6xx_defconfig
arm                         orion5x_defconfig
mips                         tb0219_defconfig
mips                        jmr3927_defconfig
ia64                      gensparse_defconfig
microblaze                      mmu_defconfig
arm                         nhk8815_defconfig
mips                malta_qemu_32r6_defconfig
mips                       capcella_defconfig
arm                         lubbock_defconfig
s390                             alldefconfig
mips                            e55_defconfig
sh                     sh7710voipgw_defconfig
m68k                        stmark2_defconfig
powerpc                      ppc64e_defconfig
powerpc                     sbc8548_defconfig
mips                        bcm47xx_defconfig
mips                      loongson3_defconfig
mips                           ip28_defconfig
powerpc                      obs600_defconfig
m68k                        mvme16x_defconfig
nios2                         3c120_defconfig
sh                          landisk_defconfig
sh                   secureedge5410_defconfig
arm                      integrator_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                 linkstation_defconfig
powerpc                     rainier_defconfig
mips                        maltaup_defconfig
arm                          pxa168_defconfig
arm                          collie_defconfig
arm                         lpc18xx_defconfig
sh                ecovec24-romimage_defconfig
mips                           rs90_defconfig
sh                        sh7785lcr_defconfig
sh                           se7721_defconfig
arm                     davinci_all_defconfig
powerpc                      ppc6xx_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          rsk7201_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          rsk7203_defconfig
mips                     loongson1b_defconfig
arm                             pxa_defconfig
powerpc                     tqm8555_defconfig
powerpc                       eiger_defconfig
mips                     cu1830-neo_defconfig
powerpc64                           defconfig
mips                          ath25_defconfig
arm                         axm55xx_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     asp8347_defconfig
arc                            hsdk_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210323
x86_64               randconfig-a003-20210323
x86_64               randconfig-a006-20210323
x86_64               randconfig-a001-20210323
x86_64               randconfig-a004-20210323
x86_64               randconfig-a005-20210323
i386                 randconfig-a003-20210323
i386                 randconfig-a001-20210323
i386                 randconfig-a002-20210323
i386                 randconfig-a004-20210323
i386                 randconfig-a006-20210323
i386                 randconfig-a005-20210323
i386                 randconfig-a004-20210324
i386                 randconfig-a003-20210324
i386                 randconfig-a001-20210324
i386                 randconfig-a002-20210324
i386                 randconfig-a006-20210324
i386                 randconfig-a005-20210324
i386                 randconfig-a015-20210323
i386                 randconfig-a016-20210323
i386                 randconfig-a014-20210323
i386                 randconfig-a011-20210323
i386                 randconfig-a012-20210323
i386                 randconfig-a013-20210323
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20210323
x86_64               randconfig-a015-20210323
x86_64               randconfig-a013-20210323
x86_64               randconfig-a014-20210323
x86_64               randconfig-a011-20210323
x86_64               randconfig-a016-20210323

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
