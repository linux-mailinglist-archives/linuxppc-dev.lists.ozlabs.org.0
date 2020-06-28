Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941320C540
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 03:47:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vYQk27nmzDrCM
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 11:47:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vYM93DhBzDr7N
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 11:44:16 +1000 (AEST)
IronPort-SDR: 7BV90lvujnDTRqlkCOmnKZq5Y5crRusGu4AmUWWAzC4bknOTfLnY3g+TZ71+SVYQNmKmJ3x1xA
 CtSagqfLj34w==
X-IronPort-AV: E=McAfee;i="6000,8403,9665"; a="133195937"
X-IronPort-AV: E=Sophos;i="5.75,289,1589266800"; d="scan'208";a="133195937"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2020 18:44:11 -0700
IronPort-SDR: wWYHZYoQCXBGJFMZM33LbNeoERLxskknExAHCqU1CxhCRRHSBnHqt5AygcP4+4MRKGGvBMGUlG
 iNyGWsfQDwZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,289,1589266800"; d="scan'208";a="302703972"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2020 18:44:10 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jpMMb-000334-QP; Sun, 28 Jun 2020 01:44:09 +0000
Date: Sun, 28 Jun 2020 09:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 896066aa0685af3434637998b76218c2045142a8
Message-ID: <5ef7f5d4.w/4m/5Is9iO7pAgo%lkp@intel.com>
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
branch HEAD: 896066aa0685af3434637998b76218c2045142a8  selftests/powerpc: Fix build failure in ebb tests

elapsed time: 2777m

configs tested: 159
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arc                     haps_hs_smp_defconfig
s390                             allyesconfig
powerpc                          g5_defconfig
mips                        jmr3927_defconfig
sh                           se7751_defconfig
arm                       imx_v6_v7_defconfig
arm                            xcep_defconfig
arm                      pxa255-idp_defconfig
arm                          tango4_defconfig
arm                         cm_x300_defconfig
sh                         microdev_defconfig
m68k                             allmodconfig
powerpc                       ppc64_defconfig
arm                             pxa_defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
arm                     eseries_pxa_defconfig
mips                      loongson3_defconfig
m68k                             alldefconfig
nios2                         10m50_defconfig
mips                     decstation_defconfig
arm                       versatile_defconfig
mips                          ath25_defconfig
mips                        nlm_xlp_defconfig
sparc                            allyesconfig
arm                       netwinder_defconfig
mips                    maltaup_xpa_defconfig
powerpc                    gamecube_defconfig
h8300                       h8s-sim_defconfig
sh                          landisk_defconfig
sh                          kfr2r09_defconfig
mips                  maltasmvp_eva_defconfig
sh                         apsh4a3a_defconfig
openrisc                    or1ksim_defconfig
i386                             alldefconfig
sh                           se7724_defconfig
mips                     loongson1b_defconfig
nds32                             allnoconfig
parisc                            allnoconfig
arm                            lart_defconfig
mips                           jazz_defconfig
x86_64                           alldefconfig
arm                         s3c2410_defconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
sh                           cayman_defconfig
arm                         bcm2835_defconfig
sh                  sh7785lcr_32bit_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200624
x86_64               randconfig-a002-20200624
x86_64               randconfig-a003-20200624
x86_64               randconfig-a005-20200624
x86_64               randconfig-a001-20200624
x86_64               randconfig-a006-20200624
x86_64               randconfig-a002-20200628
x86_64               randconfig-a004-20200628
x86_64               randconfig-a003-20200628
x86_64               randconfig-a005-20200628
x86_64               randconfig-a001-20200628
x86_64               randconfig-a006-20200628
i386                 randconfig-a002-20200624
i386                 randconfig-a006-20200624
i386                 randconfig-a003-20200624
i386                 randconfig-a001-20200624
i386                 randconfig-a005-20200624
i386                 randconfig-a004-20200624
i386                 randconfig-a006-20200628
i386                 randconfig-a002-20200628
i386                 randconfig-a003-20200628
i386                 randconfig-a001-20200628
i386                 randconfig-a005-20200628
i386                 randconfig-a004-20200628
i386                 randconfig-a013-20200624
i386                 randconfig-a016-20200624
i386                 randconfig-a012-20200624
i386                 randconfig-a014-20200624
i386                 randconfig-a011-20200624
i386                 randconfig-a015-20200624
i386                 randconfig-a013-20200628
i386                 randconfig-a016-20200628
i386                 randconfig-a014-20200628
i386                 randconfig-a012-20200628
i386                 randconfig-a015-20200628
i386                 randconfig-a011-20200628
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
