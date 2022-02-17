Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED04B96D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 04:45:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzghm74Bxz3cWS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 14:45:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cGwkpVTd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cGwkpVTd; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzgh31WRbz30NW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 14:45:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645069507; x=1676605507;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=6zbk/6uOtUTHWzvTdrZBAxX9DGYd8Gp/lPPNKtNgF+A=;
 b=cGwkpVTdI2HP1C6mrqn/mPhdDIml6ir8dnBpX4aVzwerQtET9E98w+N+
 knW2Cf5PYaUree4+aLUtHhSjNSc5q0KqtWGE6mzp21X9sckKADz93RRT+
 UNRK14X/Jo/OfXEiRAV/4Y22Jm1pAtITxj8uVAY/UkoEL+VJ8O3g2ZgDY
 a6bSYvDjG2iN8OS7qiqr6aRYvTGRUQceTOdws4VNsbmIfho9W/F2TTSfc
 zhKt6lK8OtEVLB4cKCV8Q7qDf229psNPrMpTBQU0tZ9j0uW9zKt4n4mPp
 BJOok4t6P4j1CeYZsWviOcKCQKGjXKTvmW3I1logTQclD6NuYmk55gbms g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="238186133"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="238186133"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 19:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="500961451"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 16 Feb 2022 19:43:58 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nKXi1-000BOF-Th; Thu, 17 Feb 2022 03:43:57 +0000
Date: Thu, 17 Feb 2022 11:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 bbbca72352bb9484bc057c91a408332b35ee8f4c
Message-ID: <620dc478.e3r3aWXbQptS8M9J%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: bbbca72352bb9484bc057c91a408332b35ee8f4c  powerpc/papr_scm: Implement initial support for injecting smart errors

elapsed time: 738m

configs tested: 129
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
powerpc                 mpc8540_ads_defconfig
m68k                       m5208evb_defconfig
sparc                       sparc32_defconfig
mips                            gpr_defconfig
m68k                        m5307c3_defconfig
h8300                    h8300h-sim_defconfig
m68k                        stmark2_defconfig
sh                        sh7785lcr_defconfig
arm                      jornada720_defconfig
m68k                          hp300_defconfig
arm                          exynos_defconfig
openrisc                    or1ksim_defconfig
powerpc                   motionpro_defconfig
sparc                            allyesconfig
sh                             espt_defconfig
mips                         tb0226_defconfig
arm                        keystone_defconfig
arm                       multi_v4t_defconfig
nds32                            alldefconfig
mips                       bmips_be_defconfig
xtensa                          iss_defconfig
mips                           ci20_defconfig
arm                        multi_v7_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      makalu_defconfig
mips                           gcw0_defconfig
sh                          sdk7786_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                     sh7710voipgw_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc837x_rdb_defconfig
s390                             allyesconfig
sh                          kfr2r09_defconfig
xtensa                           alldefconfig
openrisc                 simple_smp_defconfig
sh                           se7750_defconfig
powerpc                     mpc83xx_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                 mpc834x_itx_defconfig
arm                  randconfig-c002-20220216
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
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220216
arc                  randconfig-r043-20220216
s390                 randconfig-r044-20220216
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220216
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220216
arm                  randconfig-c002-20220216
i386                          randconfig-c001
mips                 randconfig-c004-20220216
powerpc                     mpc5200_defconfig
mips                           ip22_defconfig
powerpc                          allmodconfig
powerpc                 mpc8315_rdb_defconfig
arm                        multi_v5_defconfig
mips                            e55_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc836x_mds_defconfig
mips                  cavium_octeon_defconfig
mips                     cu1830-neo_defconfig
arm                          imote2_defconfig
mips                           ip27_defconfig
riscv                          rv32_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220216
hexagon              randconfig-r041-20220216

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
