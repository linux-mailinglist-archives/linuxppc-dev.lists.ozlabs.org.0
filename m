Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0717C48E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 06:49:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QvFJoinu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S50gP5LZDz3cBd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 15:49:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QvFJoinu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S50fW6qLVz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 15:49:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696999748; x=1728535748;
  h=date:from:to:cc:subject:message-id;
  bh=bz+C0QTMNujTfCTX8RVnxQcwZvb5Yznc67UseMrYbcw=;
  b=QvFJoinuGnmqogbppFORBXhQAeRT+ubkhIvo+IMmIvnvXM5kaX0P96ho
   A5Mu2SvcM4YxTvDpco2OTIZSFCqpvwP4433LXvIUeWj2C8sHBu3MY7f6O
   +EBC0CQyumBjnc0Kns0L4FBprLsFd4Mhn4IBw9ShLEEzbNqqZIV1QY4KU
   JhxNH61Ch7sUAiggE2QcW7yB0nS/jKeLlKXh7J3T4VVVOvf7+C3ieGdrz
   dz3WIIuXrWCT1hkr3OwOgmmlV8gaL+UFmii7J2KjSm0Iv2Tg4TaYge/Dq
   Y6tbSKINh83Px+f1+eKOlq7J4OXVX0KXrBp+NZaL4Py/gxJ9WbYhQsniy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470842080"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="470842080"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 21:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747318025"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="747318025"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2023 21:48:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqR9V-0001k3-1t;
	Wed, 11 Oct 2023 04:48:57 +0000
Date: Wed, 11 Oct 2023 12:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 b8b05bc6d83c86e15b6d55a4c70c206eb74f840d
Message-ID: <202310111256.fzOHFX0W-lkp@intel.com>
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
branch HEAD: b8b05bc6d83c86e15b6d55a4c70c206eb74f840d  Automatic merge of 'master' into merge (2023-10-10 00:15)

elapsed time: 985m

configs tested: 146
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20231010   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                   randconfig-001-20231010   gcc  
arm                          sp7021_defconfig   clang
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231010   gcc  
i386         buildonly-randconfig-002-20231010   gcc  
i386         buildonly-randconfig-003-20231010   gcc  
i386         buildonly-randconfig-004-20231010   gcc  
i386         buildonly-randconfig-005-20231010   gcc  
i386         buildonly-randconfig-006-20231010   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231010   gcc  
i386                  randconfig-002-20231010   gcc  
i386                  randconfig-003-20231010   gcc  
i386                  randconfig-004-20231010   gcc  
i386                  randconfig-005-20231010   gcc  
i386                  randconfig-006-20231010   gcc  
i386                  randconfig-011-20231010   gcc  
i386                  randconfig-012-20231010   gcc  
i386                  randconfig-013-20231010   gcc  
i386                  randconfig-014-20231010   gcc  
i386                  randconfig-015-20231010   gcc  
i386                  randconfig-016-20231010   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231010   gcc  
loongarch             randconfig-001-20231011   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                           ip27_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                          g5_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231010   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231010   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231010   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231010   gcc  
x86_64                randconfig-002-20231010   gcc  
x86_64                randconfig-003-20231010   gcc  
x86_64                randconfig-004-20231010   gcc  
x86_64                randconfig-005-20231010   gcc  
x86_64                randconfig-006-20231010   gcc  
x86_64                randconfig-011-20231010   gcc  
x86_64                randconfig-012-20231010   gcc  
x86_64                randconfig-013-20231010   gcc  
x86_64                randconfig-014-20231010   gcc  
x86_64                randconfig-015-20231010   gcc  
x86_64                randconfig-016-20231010   gcc  
x86_64                randconfig-071-20231010   gcc  
x86_64                randconfig-072-20231010   gcc  
x86_64                randconfig-073-20231010   gcc  
x86_64                randconfig-074-20231010   gcc  
x86_64                randconfig-075-20231010   gcc  
x86_64                randconfig-076-20231010   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
