Return-Path: <linuxppc-dev+bounces-10374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973ACB0EF50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 12:07:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bn8vC5tv3z30P3;
	Wed, 23 Jul 2025 20:07:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753265239;
	cv=none; b=MFoJ8mTTyOGk+dUTzLzURki4T9gd7XNpbtzz9WdQ+qRCRMIYyARwCXrQkIWrIMfN87erxlEfHZ9Ce+td716rbK9Q3wJkB+B+rSufxAMh1ZKLh6fEgYfrV6qSgVeq9rMP75aLSgOOlzbrIAjpwYNzdha96BTuJy2tMrCoXqpTdszVgJ8wltjyAVrUavM24kJwOGqkSW6Xs8D8D1uYTsa9uKG2/+/mdtAyIoib4/LvvIq7vSnqIdjlBQDgSRC1+3e7lo3YMdWHBP22cu1x7hCXotlMIzyxJZSlxyQ5NoG5gRphD844q70jyjjacQXTjpsUddxAulSlVfj0e/7W5O6pCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753265239; c=relaxed/relaxed;
	bh=9h8MWGmCXAuwD4zhbQX7c53JUG4F/vEPRFjV3LSSv/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L5fKL3pv0fj6jM+tLW8lPzyaomKRhzXlsgUfVXfIuqocnRf3aYoc8fszFd7TFksem95iWm+SIsE++rvpyh9cPVGaP6jUjPJMTTSUI4q9FnOlTdr//93v8zeMZWbOPQFZWPby7Fsb+lQ3+tjsvpeP70hVxHjEXWkSZQ2mmCKxrvHfO5YmCt/t/RouD+u6NhKI3qc/8rB96Q0ZX0IYK8Q8mpp6mHs+HawjS9NckLt75PfNfjUTb7cPiwwd68U43HX2CDC8PNOFV0H0iXldRAiWSBPVxBXlrM062TtZ5BcnZ4g3TKolfaHVc8lKHe5KU3gvG4mWAjxX+EVdzP1Rn7BQgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hwkavLiE; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hwkavLiE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn8v94xJ4z2xrb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 20:07:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753265238; x=1784801238;
  h=date:from:to:cc:subject:message-id;
  bh=T6DjDc2dQjCfQlrgJbp5n0Xy9ystl6hWlIhairCfHYA=;
  b=hwkavLiEiIwVectMp9ZhjrewqFGgesci1H/JWYgzFuKBzPOFlhuzDKk8
   LzBOcYYh2GQ8ceil1Kkpf8VzvsP3kDSr2S5vp3QGWrU/MkWnAjQxWncJc
   oO04+jagAj04fHmIIq2kxbppwjBwi89awwd+BCWJBlxVrysWIfovc+xvA
   u7mtUdVymTcxLykYvgxgxPaHPpw6XoLP6WCZ2KTF2q/JXtyj2VqHpY8EH
   NtofSPcpRqnS0Q137Aa03ASIj2TsAVTi8CjrEHc6/AqA4CDJNqyHWzyGr
   i2pkmoB63Y13rt0tppKn+ESVBWWukxKxY5YMDGwaxjUMYxS7Gp6IOr8UA
   g==;
X-CSE-ConnectionGUID: DFNbqnHeTIWbh76jThwNAQ==
X-CSE-MsgGUID: s/UGyhSQSxaYo/FIJff0Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="73118771"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="73118771"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 03:07:13 -0700
X-CSE-ConnectionGUID: Wug0He9tRLST7x0i/8Pa4A==
X-CSE-MsgGUID: zJyPY4MpQ0+J1Yue125/pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="158708327"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jul 2025 03:07:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueWNR-000JDg-1q;
	Wed, 23 Jul 2025 10:07:09 +0000
Date: Wed, 23 Jul 2025 18:06:22 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 946cb6e0676759f2d4327e7d400a1ced36370e02
Message-ID: <202507231810.ZMsIXuqC-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 946cb6e0676759f2d4327e7d400a1ced36370e02  Automatic merge of 'next' into merge (2025-07-22 14:21)

elapsed time: 1449m

configs tested: 155
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250722    gcc-10.5.0
arc                   randconfig-001-20250723    gcc-8.5.0
arc                   randconfig-002-20250722    gcc-11.5.0
arc                   randconfig-002-20250723    gcc-9.5.0
arm                              alldefconfig    gcc-15.1.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250722    gcc-12.5.0
arm                   randconfig-001-20250723    gcc-13.4.0
arm                   randconfig-002-20250722    clang-22
arm                   randconfig-002-20250723    gcc-13.4.0
arm                   randconfig-003-20250722    gcc-8.5.0
arm                   randconfig-003-20250723    clang-16
arm                   randconfig-004-20250722    clang-17
arm                   randconfig-004-20250723    clang-22
arm                        spear6xx_defconfig    clang-22
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250722    clang-22
arm64                 randconfig-001-20250723    clang-22
arm64                 randconfig-002-20250722    clang-22
arm64                 randconfig-002-20250723    clang-16
arm64                 randconfig-003-20250722    clang-22
arm64                 randconfig-003-20250723    clang-16
arm64                 randconfig-004-20250722    gcc-8.5.0
arm64                 randconfig-004-20250723    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250722    gcc-11.5.0
csky                  randconfig-002-20250722    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250722    clang-20
hexagon               randconfig-002-20250722    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250722    gcc-12
i386        buildonly-randconfig-001-20250723    clang-20
i386        buildonly-randconfig-002-20250722    gcc-12
i386        buildonly-randconfig-002-20250723    clang-20
i386        buildonly-randconfig-003-20250722    clang-20
i386        buildonly-randconfig-003-20250723    clang-20
i386        buildonly-randconfig-004-20250722    gcc-12
i386        buildonly-randconfig-004-20250723    clang-20
i386        buildonly-randconfig-005-20250722    clang-20
i386        buildonly-randconfig-005-20250723    gcc-11
i386        buildonly-randconfig-006-20250722    clang-20
i386        buildonly-randconfig-006-20250723    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250722    gcc-15.1.0
loongarch             randconfig-002-20250722    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                           jazz_defconfig    clang-17
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250722    gcc-11.5.0
nios2                 randconfig-002-20250722    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250722    gcc-8.5.0
parisc                randconfig-002-20250722    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250722    gcc-13.4.0
powerpc               randconfig-002-20250722    clang-22
powerpc               randconfig-003-20250722    gcc-14.3.0
powerpc                     tqm8540_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250722    gcc-8.5.0
powerpc64             randconfig-002-20250722    clang-22
powerpc64             randconfig-003-20250722    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250722    clang-16
riscv                 randconfig-001-20250723    gcc-9.5.0
riscv                 randconfig-002-20250722    gcc-12.5.0
riscv                 randconfig-002-20250723    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250722    clang-22
s390                  randconfig-001-20250723    clang-22
s390                  randconfig-002-20250722    gcc-12.5.0
s390                  randconfig-002-20250723    clang-20
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250722    gcc-15.1.0
sh                    randconfig-001-20250723    gcc-12.5.0
sh                    randconfig-002-20250722    gcc-15.1.0
sh                    randconfig-002-20250723    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250722    gcc-13.4.0
sparc                 randconfig-001-20250723    gcc-8.5.0
sparc                 randconfig-002-20250722    gcc-15.1.0
sparc                 randconfig-002-20250723    gcc-8.5.0
sparc64               randconfig-001-20250722    gcc-8.5.0
sparc64               randconfig-001-20250723    gcc-12.5.0
sparc64               randconfig-002-20250722    gcc-8.5.0
sparc64               randconfig-002-20250723    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250722    gcc-12
um                    randconfig-001-20250723    gcc-12
um                    randconfig-002-20250722    gcc-12
um                    randconfig-002-20250723    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250722    gcc-12
x86_64      buildonly-randconfig-001-20250723    gcc-12
x86_64      buildonly-randconfig-002-20250722    gcc-12
x86_64      buildonly-randconfig-002-20250723    gcc-11
x86_64      buildonly-randconfig-003-20250722    gcc-12
x86_64      buildonly-randconfig-003-20250723    gcc-11
x86_64      buildonly-randconfig-004-20250722    clang-20
x86_64      buildonly-randconfig-004-20250723    clang-20
x86_64      buildonly-randconfig-005-20250722    gcc-12
x86_64      buildonly-randconfig-005-20250723    gcc-12
x86_64      buildonly-randconfig-006-20250722    gcc-12
x86_64      buildonly-randconfig-006-20250723    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250722    gcc-15.1.0
xtensa                randconfig-001-20250723    gcc-13.4.0
xtensa                randconfig-002-20250722    gcc-10.5.0
xtensa                randconfig-002-20250723    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

