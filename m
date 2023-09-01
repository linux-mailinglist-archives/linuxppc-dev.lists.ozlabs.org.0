Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3E778F7F6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 07:21:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jFoJDJp6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcRG92Kkjz3c5g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 15:21:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jFoJDJp6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcRFF2prRz302F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 15:20:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693545633; x=1725081633;
  h=date:from:to:cc:subject:message-id;
  bh=Hfei8VKMdR1T0RqeD6++O9+GhLdlnRz/RCve0Ui6Kck=;
  b=jFoJDJp6t2B9mW0hbskpmTrWMA1WQQY1nTF7xFJgIeFc+ooAGMsMI5vG
   IhWWf5207D5f1a30zakLknx/mT48g+MU4cG99pT/MMmeC17mTkWjjsbze
   elDwTpXZOusOn05GFD/Yw6DWgzuflghRJXO8FVTYp+CnPmBtoFztQ2l3Y
   4DPZfHNA8hp4DnmsemVcHkk/KfP6h+bI1dnKLIybYSPTKcxk7JTzcn+Vl
   TkPWw892B9BZW4BrjBArdKDdjwGgciiqgkllrjp+HHVp4CpWrsEObC7JT
   B/WhLdOEZZJIQgyRsfBBG6NHrC1vXJdexazi/vv/5cnUrszORpsbwEzJA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440119436"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="440119436"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 22:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805297027"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="805297027"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Aug 2023 22:20:23 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbwZx-0000uG-2h;
	Fri, 01 Sep 2023 05:20:21 +0000
Date: Fri, 01 Sep 2023 13:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 5c28fde1e3240c87cae1ed98a82a10118fdfa9d7
Message-ID: <202309011349.3F3VxGf3-lkp@intel.com>
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
branch HEAD: 5c28fde1e3240c87cae1ed98a82a10118fdfa9d7  Automatic merge of 'next' into merge (2023-08-31 22:11)

elapsed time: 1024m

configs tested: 204
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230901   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230901   gcc  
arc                  randconfig-r013-20230901   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230901   clang
arm                  randconfig-r005-20230901   gcc  
arm                  randconfig-r012-20230901   clang
arm                  randconfig-r016-20230901   clang
arm                  randconfig-r021-20230901   clang
arm                  randconfig-r033-20230901   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230901   clang
arm64                randconfig-r013-20230901   gcc  
arm64                randconfig-r022-20230901   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230901   gcc  
csky                 randconfig-r011-20230901   gcc  
csky                 randconfig-r023-20230901   gcc  
csky                 randconfig-r025-20230901   gcc  
hexagon               randconfig-001-20230901   clang
hexagon               randconfig-002-20230901   clang
hexagon              randconfig-r032-20230901   clang
hexagon              randconfig-r033-20230901   clang
hexagon              randconfig-r036-20230901   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230901   clang
i386         buildonly-randconfig-002-20230901   clang
i386         buildonly-randconfig-003-20230901   clang
i386         buildonly-randconfig-004-20230901   clang
i386         buildonly-randconfig-005-20230901   clang
i386         buildonly-randconfig-006-20230901   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230901   clang
i386                  randconfig-002-20230901   clang
i386                  randconfig-003-20230901   clang
i386                  randconfig-004-20230901   clang
i386                  randconfig-005-20230901   clang
i386                  randconfig-006-20230901   clang
i386                  randconfig-011-20230901   gcc  
i386                  randconfig-012-20230901   gcc  
i386                  randconfig-013-20230901   gcc  
i386                  randconfig-014-20230901   gcc  
i386                  randconfig-015-20230901   gcc  
i386                  randconfig-016-20230901   gcc  
i386                 randconfig-r006-20230901   clang
i386                 randconfig-r015-20230901   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230901   gcc  
loongarch            randconfig-r013-20230901   gcc  
loongarch            randconfig-r016-20230901   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r011-20230901   gcc  
m68k                 randconfig-r031-20230901   gcc  
m68k                 randconfig-r035-20230901   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r021-20230901   gcc  
microblaze           randconfig-r024-20230901   gcc  
microblaze           randconfig-r025-20230901   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r002-20230901   gcc  
mips                 randconfig-r006-20230901   gcc  
mips                 randconfig-r021-20230901   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230901   gcc  
nios2                randconfig-r022-20230901   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r023-20230901   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r015-20230901   gcc  
parisc               randconfig-r034-20230901   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc              randconfig-r001-20230901   clang
powerpc              randconfig-r002-20230901   clang
powerpc              randconfig-r006-20230901   clang
powerpc              randconfig-r025-20230901   gcc  
powerpc64            randconfig-r004-20230901   clang
powerpc64            randconfig-r005-20230901   clang
powerpc64            randconfig-r022-20230901   gcc  
powerpc64            randconfig-r023-20230901   gcc  
powerpc64            randconfig-r024-20230901   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230901   clang
riscv                randconfig-r012-20230901   gcc  
riscv                randconfig-r026-20230901   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230901   gcc  
s390                 randconfig-r014-20230901   gcc  
s390                 randconfig-r036-20230901   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r012-20230901   gcc  
sh                   randconfig-r015-20230901   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r024-20230901   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r001-20230901   gcc  
sparc64              randconfig-r003-20230901   gcc  
sparc64              randconfig-r005-20230901   gcc  
sparc64              randconfig-r014-20230901   gcc  
sparc64              randconfig-r016-20230901   gcc  
sparc64              randconfig-r031-20230901   gcc  
sparc64              randconfig-r035-20230901   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230901   gcc  
um                   randconfig-r002-20230901   gcc  
um                   randconfig-r032-20230901   gcc  
um                   randconfig-r034-20230901   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230901   clang
x86_64       buildonly-randconfig-002-20230901   clang
x86_64       buildonly-randconfig-003-20230901   clang
x86_64       buildonly-randconfig-004-20230901   clang
x86_64       buildonly-randconfig-005-20230901   clang
x86_64       buildonly-randconfig-006-20230901   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230901   gcc  
x86_64                randconfig-002-20230901   gcc  
x86_64                randconfig-003-20230901   gcc  
x86_64                randconfig-004-20230901   gcc  
x86_64                randconfig-005-20230901   gcc  
x86_64                randconfig-006-20230901   gcc  
x86_64                randconfig-011-20230901   clang
x86_64                randconfig-012-20230901   clang
x86_64                randconfig-013-20230901   clang
x86_64                randconfig-014-20230901   clang
x86_64                randconfig-015-20230901   clang
x86_64                randconfig-016-20230901   clang
x86_64                randconfig-071-20230901   clang
x86_64                randconfig-072-20230901   clang
x86_64                randconfig-073-20230901   clang
x86_64                randconfig-074-20230901   clang
x86_64                randconfig-075-20230901   clang
x86_64                randconfig-076-20230901   clang
x86_64               randconfig-r003-20230901   clang
x86_64               randconfig-r004-20230901   clang
x86_64               randconfig-r014-20230901   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r026-20230901   gcc  
xtensa               randconfig-r032-20230901   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
