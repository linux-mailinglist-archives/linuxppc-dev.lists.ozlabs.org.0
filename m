Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7B23F2418
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 02:20:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrMjC4Rvdz3clX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 10:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrMhl4vK7z2yMM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 10:19:45 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="216411830"
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="216411830"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 17:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,336,1620716400"; d="scan'208";a="681964712"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 19 Aug 2021 17:18:41 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mGsF6-000UOI-HD; Fri, 20 Aug 2021 00:18:40 +0000
Date: Fri, 20 Aug 2021 08:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 9f7853d7609d59172eecfc5e7ccf503bc1b690bd
Message-ID: <611ef4c1.xa2uh/ZFSK8bMyt5%lkp@intel.com>
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
branch HEAD: 9f7853d7609d59172eecfc5e7ccf503bc1b690bd  powerpc/mm: Fix set_memory_*() against concurrent accesses

elapsed time: 1357m

configs tested: 129
configs skipped: 123

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210819
i386                 randconfig-c001-20210818
powerpc                      pcm030_defconfig
arm                         socfpga_defconfig
m68k                       m5275evb_defconfig
sh                           se7619_defconfig
powerpc                  iss476-smp_defconfig
mips                         rt305x_defconfig
arc                              allyesconfig
powerpc                 linkstation_defconfig
arm                       netwinder_defconfig
alpha                               defconfig
arm                         hackkit_defconfig
mips                  maltasmvp_eva_defconfig
mips                            ar7_defconfig
x86_64                              defconfig
arm                          ixp4xx_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                         ps3_defconfig
sh                           se7724_defconfig
parisc                generic-32bit_defconfig
powerpc                      pmac32_defconfig
sh                          rsk7203_defconfig
arm                           stm32_defconfig
powerpc                       ppc64_defconfig
mips                 decstation_r4k_defconfig
powerpc                    sam440ep_defconfig
powerpc                     pq2fads_defconfig
m68k                        m5407c3_defconfig
sh                               j2_defconfig
m68k                         amcore_defconfig
arm                           viper_defconfig
riscv                    nommu_k210_defconfig
powerpc                      ep88xc_defconfig
arm                        cerfcube_defconfig
arm                       aspeed_g4_defconfig
nios2                         10m50_defconfig
m68k                       m5249evb_defconfig
m68k                       bvme6000_defconfig
microblaze                          defconfig
um                                  defconfig
x86_64                           allyesconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
arm                          iop32x_defconfig
powerpc                        icon_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210818
x86_64               randconfig-a006-20210818
x86_64               randconfig-a003-20210818
x86_64               randconfig-a005-20210818
x86_64               randconfig-a002-20210818
x86_64               randconfig-a001-20210818
i386                 randconfig-a004-20210818
i386                 randconfig-a006-20210818
i386                 randconfig-a002-20210818
i386                 randconfig-a001-20210818
i386                 randconfig-a003-20210818
i386                 randconfig-a005-20210818
i386                 randconfig-a015-20210819
i386                 randconfig-a011-20210819
i386                 randconfig-a014-20210819
i386                 randconfig-a013-20210819
i386                 randconfig-a016-20210819
i386                 randconfig-a012-20210819
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
i386                 randconfig-c001-20210818
x86_64               randconfig-a004-20210819
x86_64               randconfig-a006-20210819
x86_64               randconfig-a003-20210819
x86_64               randconfig-a002-20210819
x86_64               randconfig-a005-20210819
x86_64               randconfig-a001-20210819
i386                 randconfig-a004-20210819
i386                 randconfig-a006-20210819
i386                 randconfig-a001-20210819
i386                 randconfig-a002-20210819
i386                 randconfig-a003-20210819
i386                 randconfig-a005-20210819
x86_64               randconfig-a013-20210818
x86_64               randconfig-a011-20210818
x86_64               randconfig-a012-20210818
x86_64               randconfig-a016-20210818
x86_64               randconfig-a014-20210818
x86_64               randconfig-a015-20210818

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
