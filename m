Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B3623C4C7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:51:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLzjW73QmzDqgL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 14:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLzdj17RDzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 14:48:08 +1000 (AEST)
IronPort-SDR: bgADRj4mcGcBW1AAisPUwyp/fwV4/YmKZ3s1Sp6tZhbeNDVeodt5xm3np8EKnUaqwkykfXcyFZ
 3V9DORLfYuHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9703"; a="132024738"
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="132024738"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2020 21:48:04 -0700
IronPort-SDR: v1fXdXlwTYPTIZgCtt+pMJ8rHlrZ9+orI9mB0t9kv67MhMK5VIZ8Eg5YiZxO6+BvBdufSSPriF
 lnwc4uw40x0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,436,1589266800"; d="scan'208";a="330818163"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2020 21:48:03 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3BLO-0000Zy-Fb; Wed, 05 Aug 2020 04:48:02 +0000
Date: Wed, 05 Aug 2020 12:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 0c83b277ada72b585e6a3e52b067669df15bcedb
Message-ID: <5f2a39fb.glh5Bx25s9LcqQdF%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next
branch HEAD: 0c83b277ada72b585e6a3e52b067669df15bcedb  powerpc: Fix circular dependency between percpu.h and mmu.h

elapsed time: 925m

configs tested: 112
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7750_defconfig
mips                            gpr_defconfig
arm                       spear13xx_defconfig
mips                      maltasmvp_defconfig
sh                           se7206_defconfig
arm                           spitz_defconfig
arm                        neponset_defconfig
arm                  colibri_pxa300_defconfig
arm                       netwinder_defconfig
arm                       versatile_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                        bcm63xx_defconfig
sh                          r7785rp_defconfig
sh                            shmin_defconfig
arm                        multi_v7_defconfig
powerpc                      chrp32_defconfig
powerpc                     powernv_defconfig
sh                          sdk7786_defconfig
arm                     eseries_pxa_defconfig
m68k                          atari_defconfig
powerpc                       holly_defconfig
arm                        keystone_defconfig
powerpc                     mpc83xx_defconfig
sh                         ap325rxa_defconfig
arm                             mxs_defconfig
sh                            titan_defconfig
arc                              alldefconfig
m68k                        mvme147_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200804
x86_64               randconfig-a001-20200804
x86_64               randconfig-a004-20200804
x86_64               randconfig-a005-20200804
x86_64               randconfig-a002-20200804
x86_64               randconfig-a003-20200804
i386                 randconfig-a005-20200805
i386                 randconfig-a004-20200805
i386                 randconfig-a001-20200805
i386                 randconfig-a003-20200805
i386                 randconfig-a002-20200805
i386                 randconfig-a006-20200805
i386                 randconfig-a005-20200804
i386                 randconfig-a004-20200804
i386                 randconfig-a006-20200804
i386                 randconfig-a001-20200804
i386                 randconfig-a003-20200804
i386                 randconfig-a002-20200804
x86_64               randconfig-a013-20200805
x86_64               randconfig-a011-20200805
x86_64               randconfig-a012-20200805
x86_64               randconfig-a016-20200805
x86_64               randconfig-a015-20200805
x86_64               randconfig-a014-20200805
i386                 randconfig-a011-20200804
i386                 randconfig-a012-20200804
i386                 randconfig-a013-20200804
i386                 randconfig-a014-20200804
i386                 randconfig-a015-20200804
i386                 randconfig-a016-20200804
i386                 randconfig-a014-20200805
i386                 randconfig-a015-20200805
i386                 randconfig-a016-20200805
i386                 randconfig-a011-20200805
i386                 randconfig-a012-20200805
i386                 randconfig-a013-20200805
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
