Return-Path: <linuxppc-dev+bounces-12571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E2B9DA98
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 08:37:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXPCg5zNrz2ytg;
	Thu, 25 Sep 2025 16:37:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758782255;
	cv=none; b=dNpzpzPjW8NZntsXG+KrTbvfpNU3lbDgzGM78vXjb3pCWU7Qbai9VXg67KUMGhIu54tGKkD1M0MqR/SvKhlI0x9IAa36UR2jwqQXqE+aZLIITlZCPUQKFuyzbb4Llgtf6L3vjHZHBL1h0oL8b6ftIW2d1+KHiWLbbpA0ttVkxShkZ3ThVEQD4QEUUh/93qkrmg32NHIcdpofQTssgYJl7EmSlu8MewGDGLdPU0ywloD/VqvkTklWTS4Cun73LTh/6GVd2ZNlxpz+P9Wjy41NJAixJHd5YJzpCHZ6FsMRTkWsoB1Fmr7v0EuEfXPVJvhpaoi6j//5qswpwF+4Netg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758782255; c=relaxed/relaxed;
	bh=qieXVqmZHeGnThQyTI8PVY1ZIfuQzuj8iJnZif2XCow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NoCPLh8YBPXTCxKOm5sAQZvWBh5W7BtHXen1WGwwKPocHHZQc5EUlHFSnZxS6an0BfQoRJ+CgbmCUhgs9VqsCu2JLCWy9MBaapzz5H49GLungP5AP4UUiFR6v1wrfWMcv1LhQP+GYIyG1r8YQHp3wKUj67Zmc8dhG6RwNcZUfQ74eBjm4OhyFz+G68/XCZMsSkNrc9j55jOwEIwbEeTsAIKrj4ONMRxs6lYgqcTp7zP49G54I4YTDTQsq6sydD1zEc6K8AsywxXLwKWBDGvR3gayFYYiAzVLcscHwA1iKyq5g0thNXdBCxFWMbHkJqbo40qnFLLV7tcfmVyAFFTm8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mdJ+4ANy; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mdJ+4ANy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXPCd4HbVz2yqR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 16:37:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758782254; x=1790318254;
  h=date:from:to:cc:subject:message-id;
  bh=ZI/mMn3g1f7LT8bymzeU207ajxLxwdWWw4sqPqYKvyg=;
  b=mdJ+4ANyuvZAvTneVqmheV06g6XHGXdcWcSpBkxnV/a0LBa5nje1eV0D
   H1ITni1G6Y0OBggeOaqFNfidHpiqqfi3ySUsKPMc62jHRcslzGCmJx32N
   UJza4Lezz4+6MX+E55xxlPlbYhSoiYUWF7A4o54jTIli3UK1qVeuxdPEa
   RsDtIUOdpfh/tDJoK2zv6hHL2zbTLDiitWJT1Wa8DTThj1/JNbhcLSCF1
   jyUQ3wFsgq9iqwVhyV6bk9M92IYQn24la27MALaY3wIrPgRK88MdfQ16G
   99raKx7Qmryg/EZuoww41NXGqezGyeozuqic1EjqvGKPYRNXKn5LIV4YF
   A==;
X-CSE-ConnectionGUID: 37Gww5MBT4u7KtcVIGYx4g==
X-CSE-MsgGUID: C2E5t5MsR3CMHAU52cc7Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="64930182"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="64930182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 23:37:27 -0700
X-CSE-ConnectionGUID: a17xGx+LTFWmQnRrFZDK8g==
X-CSE-MsgGUID: Xsm/p0w5QUWsbvCvl6jF7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="178016313"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Sep 2025 23:37:26 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1fbM-0004yv-1f;
	Thu, 25 Sep 2025 06:37:14 +0000
Date: Thu, 25 Sep 2025 14:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 606c62074ffeb9c231a5ca256a2c6dc76c445ab3
Message-ID: <202509251450.mcu7Ll2g-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: 606c62074ffeb9c231a5ca256a2c6dc76c445ab3  Automatic merge of 'next' into merge (2025-09-24 11:47)

elapsed time: 1442m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250924    gcc-11.5.0
arc                   randconfig-002-20250924    gcc-14.3.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                      footbridge_defconfig    clang-17
arm                        multi_v7_defconfig    gcc-15.1.0
arm                       netwinder_defconfig    gcc-15.1.0
arm                   randconfig-001-20250924    clang-22
arm                   randconfig-002-20250924    clang-22
arm                   randconfig-003-20250924    clang-22
arm                   randconfig-004-20250924    gcc-13.4.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250924    gcc-14.3.0
arm64                 randconfig-002-20250924    clang-18
arm64                 randconfig-003-20250924    gcc-12.5.0
arm64                 randconfig-004-20250924    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250924    gcc-14.3.0
csky                  randconfig-002-20250924    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250924    clang-22
hexagon               randconfig-002-20250924    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20250924    gcc-14
i386        buildonly-randconfig-001-20250925    clang-20
i386        buildonly-randconfig-002-20250924    clang-20
i386        buildonly-randconfig-002-20250925    clang-20
i386        buildonly-randconfig-003-20250924    gcc-13
i386        buildonly-randconfig-003-20250925    gcc-14
i386        buildonly-randconfig-004-20250924    gcc-14
i386        buildonly-randconfig-004-20250925    gcc-14
i386        buildonly-randconfig-005-20250924    clang-20
i386        buildonly-randconfig-005-20250925    clang-20
i386        buildonly-randconfig-006-20250924    clang-20
i386        buildonly-randconfig-006-20250925    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250924    gcc-15.1.0
loongarch             randconfig-002-20250924    gcc-14.3.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
microblaze                      mmu_defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250924    gcc-11.5.0
nios2                 randconfig-002-20250924    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
openrisc                  or1klitex_defconfig    gcc-15.1.0
openrisc                       virt_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250924    gcc-12.5.0
parisc                randconfig-002-20250924    gcc-13.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                   currituck_defconfig    clang-22
powerpc               randconfig-001-20250924    clang-18
powerpc               randconfig-002-20250924    clang-18
powerpc               randconfig-003-20250924    clang-22
powerpc                    socrates_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250924    clang-22
powerpc64             randconfig-002-20250924    gcc-15.1.0
powerpc64             randconfig-003-20250924    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                 randconfig-001-20250924    gcc-8.5.0
riscv                 randconfig-002-20250924    clang-22
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                  randconfig-001-20250924    gcc-8.5.0
s390                  randconfig-002-20250924    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20250924    gcc-15.1.0
sh                    randconfig-002-20250924    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250924    gcc-15.1.0
sparc                 randconfig-002-20250924    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250924    gcc-8.5.0
sparc64               randconfig-002-20250924    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20250924    clang-16
um                    randconfig-002-20250924    clang-19
um                           x86_64_defconfig    clang-22
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250924    clang-20
x86_64      buildonly-randconfig-001-20250925    clang-20
x86_64      buildonly-randconfig-002-20250924    clang-20
x86_64      buildonly-randconfig-002-20250925    gcc-14
x86_64      buildonly-randconfig-003-20250924    clang-20
x86_64      buildonly-randconfig-003-20250925    gcc-14
x86_64      buildonly-randconfig-004-20250924    gcc-14
x86_64      buildonly-randconfig-004-20250925    clang-20
x86_64      buildonly-randconfig-005-20250924    clang-20
x86_64      buildonly-randconfig-005-20250925    clang-20
x86_64      buildonly-randconfig-006-20250924    clang-20
x86_64      buildonly-randconfig-006-20250925    gcc-14
x86_64                              defconfig    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250924    gcc-13.4.0
xtensa                randconfig-002-20250924    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

