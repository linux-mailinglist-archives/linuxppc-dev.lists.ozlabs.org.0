Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCCC346E84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 02:12:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4qvy2gRqz30LC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 12:12:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4qvc61Jrz2yYt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 12:11:54 +1100 (AEDT)
IronPort-SDR: L1CqkWgh2upcXuZKqTJ6djA84xvgask0dMCGefKunY7mqL/KcOSvoYg81d9HqgZT0xOmwcepBr
 AnQu3gMaJvmw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190001317"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="190001317"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 18:11:49 -0700
IronPort-SDR: 2QQDfkQDmmuavTpbYMv6iHk3+t5hYT4IKv1p+b1KSI6iHIkHMY3IAQJ4AYriDoNrTf6V7joliU
 paQ4o0ye81Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="381557701"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2021 18:11:48 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lOs3n-0000tz-M9; Wed, 24 Mar 2021 01:11:47 +0000
Date: Wed, 24 Mar 2021 09:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 909b15d4ac3524a89c6df8c60e0cb0b4d5a3c248
Message-ID: <605a91a9.wHa1HumO8KsdFVAl%lkp@intel.com>
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
branch HEAD: 909b15d4ac3524a89c6df8c60e0cb0b4d5a3c248  Automatic merge of 'fixes' into merge (2021-03-23 22:53)

elapsed time: 725m

configs tested: 127
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
i386                             allyesconfig
powerpc                       maple_defconfig
powerpc                   lite5200b_defconfig
sparc                            alldefconfig
mips                    maltaup_xpa_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                            lart_defconfig
m68k                       m5208evb_defconfig
mips                     cu1000-neo_defconfig
powerpc                     ksi8560_defconfig
arm                            mps2_defconfig
powerpc                      tqm8xx_defconfig
m68k                             alldefconfig
powerpc                      mgcoge_defconfig
sh                           se7751_defconfig
mips                        omega2p_defconfig
powerpc                      ppc64e_defconfig
powerpc                      walnut_defconfig
arm                             rpc_defconfig
mips                        jmr3927_defconfig
arm                     am200epdkit_defconfig
powerpc                   currituck_defconfig
sh                     sh7710voipgw_defconfig
powerpc                    socrates_defconfig
nds32                             allnoconfig
arm                       imx_v6_v7_defconfig
arm                        neponset_defconfig
sh                            hp6xx_defconfig
arm                         orion5x_defconfig
mips                malta_qemu_32r6_defconfig
mips                       capcella_defconfig
arm                         lubbock_defconfig
sh                               alldefconfig
powerpc                     ep8248e_defconfig
powerpc                     tqm8540_defconfig
arm                      integrator_defconfig
riscv                          rv32_defconfig
powerpc                  mpc866_ads_defconfig
arm                       mainstone_defconfig
sh                             sh03_defconfig
m68k                          multi_defconfig
arm                             pxa_defconfig
powerpc                     tqm8555_defconfig
powerpc                       eiger_defconfig
arm                          pxa168_defconfig
mips                     cu1830-neo_defconfig
powerpc                      obs600_defconfig
powerpc64                           defconfig
mips                          ath25_defconfig
arm                       aspeed_g5_defconfig
powerpc                     pseries_defconfig
arm                      pxa255-idp_defconfig
arm                          exynos_defconfig
h8300                            alldefconfig
sh                           se7780_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
nios2                               defconfig
arc                              allyesconfig
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
i386                 randconfig-a004-20210323
i386                 randconfig-a001-20210323
i386                 randconfig-a002-20210323
i386                 randconfig-a006-20210323
i386                 randconfig-a005-20210323
i386                 randconfig-a016-20210323
i386                 randconfig-a014-20210323
i386                 randconfig-a011-20210323
i386                 randconfig-a015-20210323
i386                 randconfig-a012-20210323
i386                 randconfig-a013-20210323
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
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
