Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63055786E72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 13:51:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a1ZpDyEu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWhHc05Qmz3cGY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 21:51:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a1ZpDyEu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWhGf1XP9z3c4y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 21:50:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692877818; x=1724413818;
  h=date:from:to:cc:subject:message-id;
  bh=+dsdWszlcpCHwPO0ebs8SRrMO+HZA++v5IQxpkDd93U=;
  b=a1ZpDyEu2UhGvdKtfmtOU+dSJUAvcbX+B8GRDkusb2VCS6XdwHRx47bY
   jmsSxNbFE8xQN+dl5cOpJE286bUMUOhRYJy3tChydExb2+P4H/OCdBmN6
   D9hT+CfOqDYNThNY6V+dRVcQLo1B/s744cKVCghrluIrMk9Vc7A9HJ51W
   wsQf4tT/XKFRsMVnFpQc/BxUF8q1qWxWl9EOY8ITB0G4ZEjgy4K2R9jsV
   WaxyjiFk997MEyfJ2CuIHotPRHYlb1QuIg1xBUbYSWA2ukCO71x0bOWm/
   9yi7DeRjcqIt5IYA0/AowMUmGAXtxz1oK2cLwoli7Z2eRaniKdFmSVVAh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="374382253"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="374382253"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 04:50:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="772079376"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="772079376"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 24 Aug 2023 04:50:08 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ8ql-00029k-1q;
	Thu, 24 Aug 2023 11:50:07 +0000
Date: Thu, 24 Aug 2023 19:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD REGRESSION
 0f71dcfb4aef6043da6cc509e7a7f6a3ae87c12d
Message-ID: <202308241951.1mF1dku3-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 0f71dcfb4aef6043da6cc509e7a7f6a3ae87c12d  powerpc/ftrace: Add support for -fpatchable-function-entry

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202308220708.nRf5AUAe-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308220857.uFq2oAxM-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308221055.lw3UzJIL-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308221352.nocgtdJP-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/include/asm/paca.h:155:23: error: field has incomplete type 'struct tlb_core_data'
arch/powerpc/include/asm/paca.h:155:30: error: field 'tcd' has incomplete type
arch/powerpc/include/asm/paca.h:291:36: warning: 'struct mm_struct' declared inside parameter list will not be visible outside of this definition or declaration
arch/powerpc/include/asm/paca.h:291:36: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc64-randconfig-r031-20230822
|   `-- arch-powerpc-include-asm-paca.h:warning:struct-mm_struct-declared-inside-parameter-list-will-not-be-visible-outside-of-this-definition-or-declaration
`-- powerpc64-randconfig-r036-20230822
    `-- arch-powerpc-include-asm-paca.h:error:field-tcd-has-incomplete-type
clang_recent_errors
`-- powerpc64-randconfig-r012-20230822
    |-- arch-powerpc-include-asm-paca.h:error:field-has-incomplete-type-struct-tlb_core_data
    `-- arch-powerpc-include-asm-paca.h:warning:declaration-of-struct-mm_struct-will-not-be-visible-outside-of-this-function

elapsed time: 3924m

configs tested: 389
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230822   gcc  
alpha                randconfig-r001-20230823   gcc  
alpha                randconfig-r002-20230823   gcc  
alpha                randconfig-r003-20230822   gcc  
alpha                randconfig-r013-20230822   gcc  
alpha                randconfig-r014-20230823   gcc  
alpha                randconfig-r035-20230823   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20230822   gcc  
arc                  randconfig-r005-20230823   gcc  
arc                  randconfig-r006-20230822   gcc  
arc                  randconfig-r011-20230823   gcc  
arc                  randconfig-r015-20230822   gcc  
arc                  randconfig-r025-20230822   gcc  
arc                  randconfig-r026-20230822   gcc  
arc                  randconfig-r031-20230822   gcc  
arc                  randconfig-r034-20230823   gcc  
arc                  randconfig-r036-20230822   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                   randconfig-001-20230822   gcc  
arm                   randconfig-001-20230823   clang
arm                  randconfig-r003-20230823   gcc  
arm                  randconfig-r023-20230822   gcc  
arm                  randconfig-r025-20230823   clang
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230824   clang
arm64                randconfig-r021-20230823   gcc  
arm64                randconfig-r026-20230822   clang
arm64                randconfig-r026-20230823   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230823   gcc  
csky                 randconfig-r011-20230823   gcc  
csky                 randconfig-r012-20230822   gcc  
csky                 randconfig-r012-20230823   gcc  
csky                 randconfig-r014-20230822   gcc  
csky                 randconfig-r016-20230822   gcc  
csky                 randconfig-r023-20230824   gcc  
csky                 randconfig-r031-20230823   gcc  
hexagon               randconfig-001-20230822   clang
hexagon               randconfig-001-20230823   clang
hexagon               randconfig-001-20230824   clang
hexagon               randconfig-002-20230822   clang
hexagon               randconfig-002-20230823   clang
hexagon               randconfig-002-20230824   clang
hexagon              randconfig-r014-20230823   clang
hexagon              randconfig-r015-20230824   clang
hexagon              randconfig-r016-20230822   clang
hexagon              randconfig-r035-20230822   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230822   gcc  
i386         buildonly-randconfig-001-20230823   clang
i386         buildonly-randconfig-001-20230824   gcc  
i386         buildonly-randconfig-002-20230822   gcc  
i386         buildonly-randconfig-002-20230823   clang
i386         buildonly-randconfig-002-20230824   gcc  
i386         buildonly-randconfig-003-20230822   gcc  
i386         buildonly-randconfig-003-20230823   clang
i386         buildonly-randconfig-003-20230824   gcc  
i386         buildonly-randconfig-004-20230822   gcc  
i386         buildonly-randconfig-004-20230823   clang
i386         buildonly-randconfig-004-20230824   gcc  
i386         buildonly-randconfig-005-20230822   gcc  
i386         buildonly-randconfig-005-20230823   clang
i386         buildonly-randconfig-005-20230824   gcc  
i386         buildonly-randconfig-006-20230822   gcc  
i386         buildonly-randconfig-006-20230823   clang
i386         buildonly-randconfig-006-20230824   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230822   gcc  
i386                  randconfig-001-20230823   clang
i386                  randconfig-001-20230824   gcc  
i386                  randconfig-002-20230822   gcc  
i386                  randconfig-002-20230823   clang
i386                  randconfig-002-20230824   gcc  
i386                  randconfig-003-20230822   gcc  
i386                  randconfig-003-20230823   clang
i386                  randconfig-003-20230824   gcc  
i386                  randconfig-004-20230822   gcc  
i386                  randconfig-004-20230823   clang
i386                  randconfig-004-20230824   gcc  
i386                  randconfig-005-20230822   gcc  
i386                  randconfig-005-20230823   clang
i386                  randconfig-005-20230824   gcc  
i386                  randconfig-006-20230822   gcc  
i386                  randconfig-006-20230823   clang
i386                  randconfig-006-20230824   gcc  
i386                  randconfig-011-20230822   clang
i386                  randconfig-011-20230823   gcc  
i386                  randconfig-011-20230824   clang
i386                  randconfig-012-20230822   clang
i386                  randconfig-012-20230823   gcc  
i386                  randconfig-012-20230824   clang
i386                  randconfig-013-20230822   clang
i386                  randconfig-013-20230823   gcc  
i386                  randconfig-013-20230824   clang
i386                  randconfig-014-20230822   clang
i386                  randconfig-014-20230823   gcc  
i386                  randconfig-014-20230824   clang
i386                  randconfig-015-20230822   clang
i386                  randconfig-015-20230823   gcc  
i386                  randconfig-015-20230824   clang
i386                  randconfig-016-20230822   clang
i386                  randconfig-016-20230823   gcc  
i386                  randconfig-016-20230824   clang
i386                 randconfig-r005-20230822   gcc  
i386                 randconfig-r011-20230824   clang
i386                 randconfig-r016-20230824   clang
i386                 randconfig-r022-20230823   gcc  
i386                 randconfig-r025-20230823   gcc  
i386                 randconfig-r031-20230824   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230822   gcc  
loongarch             randconfig-001-20230823   gcc  
loongarch             randconfig-001-20230824   gcc  
loongarch            randconfig-r001-20230823   gcc  
loongarch            randconfig-r003-20230823   gcc  
loongarch            randconfig-r021-20230822   gcc  
loongarch            randconfig-r022-20230822   gcc  
loongarch            randconfig-r024-20230823   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                 randconfig-r001-20230824   gcc  
m68k                 randconfig-r005-20230822   gcc  
m68k                 randconfig-r014-20230822   gcc  
m68k                 randconfig-r024-20230824   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r003-20230822   gcc  
microblaze           randconfig-r004-20230823   gcc  
microblaze           randconfig-r005-20230824   gcc  
microblaze           randconfig-r006-20230822   gcc  
microblaze           randconfig-r022-20230824   gcc  
microblaze           randconfig-r033-20230824   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                  decstation_64_defconfig   gcc  
mips                 randconfig-r004-20230823   gcc  
mips                 randconfig-r006-20230823   gcc  
mips                 randconfig-r016-20230822   gcc  
mips                 randconfig-r032-20230823   gcc  
mips                 randconfig-r034-20230822   clang
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230823   gcc  
nios2                randconfig-r006-20230823   gcc  
nios2                randconfig-r006-20230824   gcc  
nios2                randconfig-r016-20230823   gcc  
nios2                randconfig-r023-20230822   gcc  
nios2                randconfig-r032-20230822   gcc  
nios2                randconfig-r033-20230822   gcc  
nios2                randconfig-r036-20230822   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                  or1klitex_defconfig   gcc  
openrisc             randconfig-r005-20230823   gcc  
openrisc             randconfig-r015-20230822   gcc  
openrisc             randconfig-r015-20230823   gcc  
openrisc             randconfig-r023-20230823   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r004-20230823   gcc  
parisc               randconfig-r005-20230823   gcc  
parisc               randconfig-r011-20230822   gcc  
parisc               randconfig-r012-20230822   gcc  
parisc               randconfig-r012-20230823   gcc  
parisc               randconfig-r013-20230823   gcc  
parisc               randconfig-r025-20230822   gcc  
parisc               randconfig-r025-20230823   gcc  
parisc               randconfig-r025-20230824   gcc  
parisc               randconfig-r031-20230822   gcc  
parisc               randconfig-r032-20230822   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       ebony_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                     mpc5200_defconfig   gcc  
powerpc              randconfig-r002-20230824   gcc  
powerpc              randconfig-r012-20230822   clang
powerpc              randconfig-r024-20230822   clang
powerpc                  storcenter_defconfig   gcc  
powerpc64            randconfig-r014-20230823   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230822   gcc  
riscv                 randconfig-001-20230823   clang
riscv                randconfig-r004-20230822   gcc  
riscv                randconfig-r013-20230823   gcc  
riscv                randconfig-r023-20230823   gcc  
riscv                randconfig-r032-20230823   clang
riscv                randconfig-r033-20230822   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230822   clang
s390                  randconfig-001-20230824   clang
s390                 randconfig-r031-20230823   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                            hp6xx_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r004-20230824   gcc  
sh                   randconfig-r006-20230823   gcc  
sh                   randconfig-r013-20230822   gcc  
sh                   randconfig-r015-20230822   gcc  
sh                   randconfig-r015-20230823   gcc  
sh                   randconfig-r026-20230823   gcc  
sh                   randconfig-r034-20230822   gcc  
sh                          rsk7269_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                   secureedge5410_defconfig   gcc  
sh                            shmin_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230822   gcc  
sparc                randconfig-r011-20230823   gcc  
sparc                randconfig-r013-20230823   gcc  
sparc                randconfig-r021-20230822   gcc  
sparc                randconfig-r025-20230823   gcc  
sparc                randconfig-r035-20230824   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r001-20230823   gcc  
sparc64              randconfig-r002-20230822   gcc  
sparc64              randconfig-r003-20230823   gcc  
sparc64              randconfig-r014-20230823   gcc  
sparc64              randconfig-r016-20230823   gcc  
sparc64              randconfig-r022-20230822   gcc  
sparc64              randconfig-r022-20230823   gcc  
sparc64              randconfig-r024-20230823   gcc  
sparc64              randconfig-r026-20230823   gcc  
sparc64              randconfig-r035-20230822   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r006-20230823   gcc  
um                   randconfig-r013-20230822   gcc  
um                   randconfig-r024-20230822   gcc  
um                   randconfig-r024-20230823   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230822   gcc  
x86_64       buildonly-randconfig-001-20230823   clang
x86_64       buildonly-randconfig-001-20230824   gcc  
x86_64       buildonly-randconfig-002-20230822   gcc  
x86_64       buildonly-randconfig-002-20230823   clang
x86_64       buildonly-randconfig-002-20230824   gcc  
x86_64       buildonly-randconfig-003-20230822   gcc  
x86_64       buildonly-randconfig-003-20230823   clang
x86_64       buildonly-randconfig-003-20230824   gcc  
x86_64       buildonly-randconfig-004-20230822   gcc  
x86_64       buildonly-randconfig-004-20230823   clang
x86_64       buildonly-randconfig-004-20230824   gcc  
x86_64       buildonly-randconfig-005-20230822   gcc  
x86_64       buildonly-randconfig-005-20230823   clang
x86_64       buildonly-randconfig-005-20230824   gcc  
x86_64       buildonly-randconfig-006-20230822   gcc  
x86_64       buildonly-randconfig-006-20230823   clang
x86_64       buildonly-randconfig-006-20230824   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230822   clang
x86_64                randconfig-001-20230823   gcc  
x86_64                randconfig-001-20230824   clang
x86_64                randconfig-002-20230822   clang
x86_64                randconfig-002-20230823   gcc  
x86_64                randconfig-002-20230824   clang
x86_64                randconfig-003-20230822   clang
x86_64                randconfig-003-20230823   gcc  
x86_64                randconfig-003-20230824   clang
x86_64                randconfig-004-20230822   clang
x86_64                randconfig-004-20230823   gcc  
x86_64                randconfig-004-20230824   clang
x86_64                randconfig-005-20230822   clang
x86_64                randconfig-005-20230823   gcc  
x86_64                randconfig-005-20230824   clang
x86_64                randconfig-006-20230822   clang
x86_64                randconfig-006-20230823   gcc  
x86_64                randconfig-006-20230824   clang
x86_64                randconfig-011-20230822   gcc  
x86_64                randconfig-011-20230823   clang
x86_64                randconfig-011-20230824   gcc  
x86_64                randconfig-012-20230822   gcc  
x86_64                randconfig-012-20230823   clang
x86_64                randconfig-012-20230824   gcc  
x86_64                randconfig-013-20230822   gcc  
x86_64                randconfig-013-20230823   clang
x86_64                randconfig-013-20230824   gcc  
x86_64                randconfig-014-20230822   gcc  
x86_64                randconfig-014-20230823   clang
x86_64                randconfig-014-20230824   gcc  
x86_64                randconfig-015-20230822   gcc  
x86_64                randconfig-015-20230823   clang
x86_64                randconfig-015-20230824   gcc  
x86_64                randconfig-016-20230822   gcc  
x86_64                randconfig-016-20230823   clang
x86_64                randconfig-016-20230824   gcc  
x86_64                randconfig-071-20230822   gcc  
x86_64                randconfig-071-20230823   clang
x86_64                randconfig-071-20230824   gcc  
x86_64                randconfig-072-20230822   gcc  
x86_64                randconfig-072-20230823   clang
x86_64                randconfig-072-20230824   gcc  
x86_64                randconfig-073-20230822   gcc  
x86_64                randconfig-073-20230823   clang
x86_64                randconfig-073-20230824   gcc  
x86_64                randconfig-074-20230822   gcc  
x86_64                randconfig-074-20230823   clang
x86_64                randconfig-074-20230824   gcc  
x86_64                randconfig-075-20230822   gcc  
x86_64                randconfig-075-20230823   clang
x86_64                randconfig-075-20230824   gcc  
x86_64                randconfig-076-20230822   gcc  
x86_64                randconfig-076-20230823   clang
x86_64                randconfig-076-20230824   gcc  
x86_64               randconfig-r001-20230822   gcc  
x86_64               randconfig-r032-20230824   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r001-20230823   gcc  
xtensa               randconfig-r002-20230822   gcc  
xtensa               randconfig-r004-20230822   gcc  
xtensa               randconfig-r004-20230823   gcc  
xtensa               randconfig-r011-20230822   gcc  
xtensa               randconfig-r013-20230822   gcc  
xtensa               randconfig-r014-20230822   gcc  
xtensa               randconfig-r015-20230823   gcc  
xtensa               randconfig-r026-20230824   gcc  
xtensa               randconfig-r036-20230824   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
