Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4AF786F0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 14:30:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UUINmWSZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWj952LFjz2yps
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 22:30:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UUINmWSZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWj844YM5z3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 22:29:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692880181; x=1724416181;
  h=date:from:to:cc:subject:message-id;
  bh=Th3cf5ewKnna9nzKdS2fLorU2y4QYD/pbrG7HRqvDm8=;
  b=UUINmWSZpFROQc+OiD7G7aPcopfDMju6CyiXg46JBMaYPquKkq9iiRxG
   Ol5bGSg2Z7ilLt+pyzXQ2TpaG4jsH4H6cjQxo68StKqYcdKn8YRJNrXiF
   PXD2lJqfix/JDQpMu9sGntvId5gV7y9AmmvetsR1eKQXBBTqbJW7fDYE+
   3OAxpbBB/WDTZ3zsjknfpD7yyT8bvZqIfyrTwL2uwv85VA9vmPr685ugJ
   yAG79P4fqbOmGcYtdU6GhntYtB8vQLxM4PlzMy0gZe8hjRIfcV96HU9fV
   oW1oyAD+1vk4wyVVQaZqJKfKF2FFi5ooG9UwHtAb3wgbZxQS3ntKy386H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="378179184"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="378179184"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 05:29:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="983678910"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="983678910"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2023 05:29:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ9Su-0002QL-0t;
	Thu, 24 Aug 2023 12:29:32 +0000
Date: Thu, 24 Aug 2023 20:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 64064aca208d7b078c36be8399825ce8b2cab5be
Message-ID: <202308242037.6XTRp373-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 64064aca208d7b078c36be8399825ce8b2cab5be  Automatic merge of 'next' into merge (2023-08-22 17:17)

elapsed time: 3179m

configs tested: 347
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r014-20230823   gcc  
alpha                randconfig-r025-20230822   gcc  
alpha                randconfig-r035-20230823   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230822   gcc  
arc                  randconfig-r005-20230823   gcc  
arc                  randconfig-r011-20230823   gcc  
arc                  randconfig-r023-20230822   gcc  
arc                  randconfig-r033-20230822   gcc  
arc                  randconfig-r034-20230823   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                          pxa3xx_defconfig   gcc  
arm                   randconfig-001-20230822   gcc  
arm                   randconfig-001-20230823   clang
arm                  randconfig-r003-20230823   gcc  
arm                  randconfig-r025-20230823   clang
arm                       versatile_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230822   gcc  
arm64                randconfig-r012-20230824   clang
arm64                randconfig-r013-20230822   clang
arm64                randconfig-r021-20230823   gcc  
arm64                randconfig-r026-20230823   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230823   gcc  
csky                 randconfig-r012-20230823   gcc  
csky                 randconfig-r015-20230822   gcc  
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
loongarch            randconfig-r003-20230822   gcc  
loongarch            randconfig-r003-20230823   gcc  
loongarch            randconfig-r024-20230823   gcc  
loongarch            randconfig-r036-20230822   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r001-20230824   gcc  
m68k                 randconfig-r024-20230824   gcc  
m68k                 randconfig-r035-20230822   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r005-20230824   gcc  
microblaze           randconfig-r006-20230822   gcc  
microblaze           randconfig-r022-20230824   gcc  
microblaze           randconfig-r033-20230824   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                 randconfig-r004-20230823   gcc  
mips                 randconfig-r006-20230823   gcc  
mips                 randconfig-r032-20230823   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230822   gcc  
nios2                randconfig-r002-20230823   gcc  
nios2                randconfig-r006-20230823   gcc  
nios2                randconfig-r006-20230824   gcc  
nios2                randconfig-r016-20230822   gcc  
nios2                randconfig-r016-20230823   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r005-20230823   gcc  
openrisc             randconfig-r012-20230822   gcc  
openrisc             randconfig-r023-20230823   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-64bit_defconfig   gcc  
parisc               randconfig-r004-20230822   gcc  
parisc               randconfig-r004-20230823   gcc  
parisc               randconfig-r025-20230823   gcc  
parisc               randconfig-r025-20230824   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r002-20230824   gcc  
powerpc              randconfig-r011-20230822   clang
powerpc              randconfig-r034-20230822   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc64                           defconfig   gcc  
powerpc64            randconfig-r022-20230822   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   gcc  
riscv                 randconfig-001-20230822   gcc  
riscv                 randconfig-001-20230823   clang
riscv                randconfig-r005-20230822   gcc  
riscv                randconfig-r013-20230823   gcc  
riscv                randconfig-r023-20230823   gcc  
riscv                randconfig-r032-20230822   gcc  
riscv                randconfig-r032-20230823   clang
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
sh                        edosk7705_defconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r004-20230824   gcc  
sh                   randconfig-r006-20230823   gcc  
sh                   randconfig-r015-20230823   gcc  
sh                   randconfig-r026-20230823   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230823   gcc  
sparc                randconfig-r013-20230823   gcc  
sparc                randconfig-r024-20230822   gcc  
sparc                randconfig-r025-20230823   gcc  
sparc                randconfig-r035-20230824   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r001-20230823   gcc  
sparc64              randconfig-r014-20230823   gcc  
sparc64              randconfig-r016-20230823   gcc  
sparc64              randconfig-r022-20230823   gcc  
sparc64              randconfig-r024-20230823   gcc  
sparc64              randconfig-r026-20230823   gcc  
sparc64              randconfig-r031-20230822   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r014-20230822   gcc  
um                   randconfig-r021-20230822   gcc  
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
x86_64               randconfig-r032-20230824   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r001-20230823   gcc  
xtensa               randconfig-r004-20230823   gcc  
xtensa               randconfig-r015-20230823   gcc  
xtensa               randconfig-r026-20230822   gcc  
xtensa               randconfig-r026-20230824   gcc  
xtensa               randconfig-r036-20230824   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
