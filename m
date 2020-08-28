Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D6B255F49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 18:59:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdQnL4TwLzDqsm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 02:59:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdQgC60tWzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 02:54:31 +1000 (AEST)
IronPort-SDR: LeSispFvMydbFen5ccPGLbsfh8PTL3JoIySN2MzLQErDcNyESwF9a6lDMU1BKzuaVw+3+4AUiN
 2ZwWDNoYrDCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="220947115"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="220947115"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 09:54:28 -0700
IronPort-SDR: XIl4wpQyGJs9TEneKCtiWqYpo1Ak4d4Q8Ws+i6DvfavegdOJQ29O5YIZL+F7X+6iLK9EcliyA+
 tzaqd03eTH1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="282452397"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2020 09:54:23 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kBhdu-00006A-N5; Fri, 28 Aug 2020 16:54:22 +0000
Date: Sat, 29 Aug 2020 00:53:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 4a133eb351ccc275683ad49305d0b04dde903733
Message-ID: <5f493697.sab9iDKIHNxx8kYl%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes-test
branch HEAD: 4a133eb351ccc275683ad49305d0b04dde903733  powerpc/32s: Disable VMAP stack which CONFIG_ADB_PMU

elapsed time: 871m

configs tested: 151
configs skipped: 18

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
m68k                       m5208evb_defconfig
m68k                        mvme147_defconfig
openrisc                    or1ksim_defconfig
arm                         cm_x300_defconfig
arc                        nsim_700_defconfig
sh                           se7206_defconfig
s390                             alldefconfig
mips                         rt305x_defconfig
powerpc                     ep8248e_defconfig
powerpc                     pseries_defconfig
arm                        keystone_defconfig
sh                           se7722_defconfig
parisc                generic-64bit_defconfig
mips                           rs90_defconfig
m68k                       bvme6000_defconfig
mips                        bcm47xx_defconfig
c6x                        evmc6474_defconfig
microblaze                    nommu_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                     pq2fads_defconfig
m68k                         apollo_defconfig
m68k                             allyesconfig
arm                         axm55xx_defconfig
sh                               alldefconfig
mips                      fuloong2e_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                       cns3420vb_defconfig
arm                            qcom_defconfig
mips                  maltasmvp_eva_defconfig
nios2                            allyesconfig
powerpc                           allnoconfig
parisc                generic-32bit_defconfig
mips                          rb532_defconfig
ia64                             alldefconfig
mips                        vocore2_defconfig
powerpc                          alldefconfig
arc                           tb10x_defconfig
m68k                           sun3_defconfig
sh                           se7721_defconfig
sh                           se7780_defconfig
arm                           efm32_defconfig
powerpc                    adder875_defconfig
arm                        mvebu_v7_defconfig
m68k                       m5275evb_defconfig
mips                       rbtx49xx_defconfig
arm                        neponset_defconfig
sh                     magicpanelr2_defconfig
arm                         lpc18xx_defconfig
mips                        jmr3927_defconfig
arm                          exynos_defconfig
arm                          pxa910_defconfig
arm                          lpd270_defconfig
nios2                               defconfig
mips                             allyesconfig
mips                    maltaup_xpa_defconfig
sh                             shx3_defconfig
arm                            u300_defconfig
sh                           se7724_defconfig
mips                         db1xxx_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
h8300                               defconfig
mips                malta_kvm_guest_defconfig
mips                  cavium_octeon_defconfig
arc                             nps_defconfig
arm                       spear13xx_defconfig
arm                          moxart_defconfig
powerpc                      ep88xc_defconfig
mips                         bigsur_defconfig
arm                         orion5x_defconfig
sh                          sdk7780_defconfig
c6x                         dsk6455_defconfig
arc                              alldefconfig
arm                  colibri_pxa270_defconfig
mips                       lemote2f_defconfig
s390                          debug_defconfig
alpha                            alldefconfig
arm                           sama5_defconfig
arm                            mmp2_defconfig
h8300                            allyesconfig
sh                          lboxre2_defconfig
arm                         bcm2835_defconfig
sh                         apsh4a3a_defconfig
m68k                       m5475evb_defconfig
mips                           ip22_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
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
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20200827
x86_64               randconfig-a002-20200827
x86_64               randconfig-a001-20200827
x86_64               randconfig-a005-20200827
x86_64               randconfig-a006-20200827
x86_64               randconfig-a004-20200827
i386                 randconfig-a002-20200828
i386                 randconfig-a005-20200828
i386                 randconfig-a003-20200828
i386                 randconfig-a004-20200828
i386                 randconfig-a001-20200828
i386                 randconfig-a006-20200828
x86_64               randconfig-a015-20200828
x86_64               randconfig-a012-20200828
x86_64               randconfig-a016-20200828
x86_64               randconfig-a014-20200828
x86_64               randconfig-a011-20200828
x86_64               randconfig-a013-20200828
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
