Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C45533A8B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 00:03:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzFTz6zklz3bVY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 10:03:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzFTH2RV9z30Lr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 10:03:10 +1100 (AEDT)
IronPort-SDR: qHGgSz6EmLvLr4LwhZxKZZ5wWqBKTD1CVbt3fd2Fr7Ji0cBFx/EL598nlsUVc7eRCc2lfvTcVb
 YOwdvwBI3XTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9923"; a="186637107"
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="186637107"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2021 16:03:06 -0700
IronPort-SDR: BilWV1W3Ntb78LOuS6bT1RWSyhZ1EPijmHsd6mfdt/o8dy0UYdjK/SMIdu4kP2G7F45DND+KJZ
 6urGxgFUZWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,249,1610438400"; d="scan'208";a="439585641"
Received: from lkp-server02.sh.intel.com (HELO 1dc5e1a854f4) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2021 16:03:05 -0700
Received: from kbuild by 1dc5e1a854f4 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lLZlJ-0000Jf-6i; Sun, 14 Mar 2021 23:03:05 +0000
Date: Mon, 15 Mar 2021 07:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 f81787ef053051bef07cc879d609a624dc9b2d48
Message-ID: <604e95f1.YS2c8RczgK2PI/uV%lkp@intel.com>
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
branch HEAD: f81787ef053051bef07cc879d609a624dc9b2d48  powerpc: Force inlining of cpu_has_feature() to avoid build failure

elapsed time: 726m

configs tested: 111
configs skipped: 25

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7705_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7264_defconfig
xtensa                       common_defconfig
sh                           se7722_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                      cm5200_defconfig
h8300                            alldefconfig
mips                      maltaaprp_defconfig
sh                               j2_defconfig
mips                        omega2p_defconfig
arm                         orion5x_defconfig
arm                      jornada720_defconfig
sh                            titan_defconfig
m68k                          sun3x_defconfig
mips                        jmr3927_defconfig
sh                         ecovec24_defconfig
nios2                            alldefconfig
arm                         bcm2835_defconfig
mips                      pic32mzda_defconfig
powerpc                     pseries_defconfig
sh                           se7343_defconfig
sh                     sh7710voipgw_defconfig
riscv                    nommu_virt_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     taishan_defconfig
powerpc                     kmeter1_defconfig
mips                  cavium_octeon_defconfig
powerpc                 mpc832x_rdb_defconfig
x86_64                           alldefconfig
arm                   milbeaut_m10v_defconfig
xtensa                              defconfig
sh                           se7619_defconfig
parisc                              defconfig
openrisc                            defconfig
powerpc                  storcenter_defconfig
csky                                defconfig
microblaze                      mmu_defconfig
mips                           ip22_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210314
i386                 randconfig-a005-20210314
i386                 randconfig-a003-20210314
i386                 randconfig-a002-20210314
i386                 randconfig-a004-20210314
i386                 randconfig-a006-20210314
x86_64               randconfig-a011-20210314
x86_64               randconfig-a016-20210314
x86_64               randconfig-a013-20210314
x86_64               randconfig-a015-20210314
x86_64               randconfig-a014-20210314
x86_64               randconfig-a012-20210314
i386                 randconfig-a013-20210314
i386                 randconfig-a016-20210314
i386                 randconfig-a011-20210314
i386                 randconfig-a012-20210314
i386                 randconfig-a014-20210314
i386                 randconfig-a015-20210314
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210314
x86_64               randconfig-a001-20210314
x86_64               randconfig-a005-20210314
x86_64               randconfig-a004-20210314
x86_64               randconfig-a002-20210314
x86_64               randconfig-a003-20210314

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
