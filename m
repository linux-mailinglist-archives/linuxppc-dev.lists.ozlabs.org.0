Return-Path: <linuxppc-dev+bounces-14952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B34CD96E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 14:24:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbG215bG1z2yFb;
	Wed, 24 Dec 2025 00:24:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766496265;
	cv=none; b=Xcjy3YlLleb4N1afv26JlRetN6/+591sM/7OdCdipugY8jaWHROO917/sG08trbnbQip80muBj9DK2vGlv/tLjPjfKGerOVxV05gFxeKmbY+RVVSNULMEIq+deeG/W2xGT4UOtKnKVbI3ZhVC7wNogcZJDVebdzj33+cvitpCccJHV6iX98Lb4lH/Zj6Y0L/Srq8Pxzk5o7ZLm/fdZ+Rzab01vbQ5twxljo2KEPMMXcIC8Xl6KhDIxSfH3IYtbEX7A/c2ke66Ow/pzl7qSXnixBS7B2SgGcynmdwOvs5liGOFBkWJu6/OTeMwcdGuAnYcG7A82OQrdwc71KdnPqHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766496265; c=relaxed/relaxed;
	bh=40y8xmZ/BqkswPavBr9lZEhE+ZJkvlQkrWmde3wCVxo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Igk8KfGn6O9bkIGVy7KZ564O0bTe8SQ7g6fQBwZXpJvMBT0wHlutfXu9eCReCz1TovmTrK2fDR2tOYa6ehh0Im3cxmJG0c2wc8nnO1cDlVjEhgAlulNPgpXfD9HxHj+CoCLqjizPjOyPw1yCF+k9IL1CoWj4GwCRjsuPNLtWIwNyfJcXqYWdFQPnMp4ixMIqjgARrXFxQPE75PzgiML4IYcu3cT+RnQLHiJRoR8T3bVZjJXnL8tRdHHIb0ax4HDDobkBeavJljadydMglkI4BJMB6gnO7rk1dd3gxhBv2UKg2qyK98zFXz5yrztGTRhmEfbwjj9TPiVLpst9YjUk/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y8oYgsO5; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y8oYgsO5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbG204mqzz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 00:24:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766496264; x=1798032264;
  h=date:from:to:cc:subject:message-id;
  bh=tvWcxLMjHgGFmcFPg/0hJkEPJ3X39Xil1wmY6/vPulc=;
  b=Y8oYgsO5LVHEO+s9fx77a5dKdCSzIM3WVrW/YPU8Gu09qyT24M1+Op8r
   HR8XfGnBnoDs5K/wQ8AoY4WKGRM0BMJSvGon+fr/uKVXG1H0P/GrDSuym
   +cXTSDzWhyU6BvHDRl7T9suemtX+ZtE8AeiYxGBThWw6OWx/SHI14nrdv
   POKzEoNCOvGfLfJW4G4TQ4Z8W2BdVNGvOM5tdv/XOxxb49u0pquZeIk5h
   n3XVWQmBnGVNy9tyhiWUy7ZwsiRvxX7+RyHWeu9zr9ZMt8qgEnhjjmujq
   jLF+Dmlses2IRvvm1m9MSNFuGKEGt4V0BHydTUgJo13SbXEa33Y5Y3VCZ
   w==;
X-CSE-ConnectionGUID: S8xmrwMyTlW47HzpSs+1cQ==
X-CSE-MsgGUID: SsbNNa3WTnKc8mohUU8rPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="55911728"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="55911728"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:24:22 -0800
X-CSE-ConnectionGUID: Wznz4cN0SvyV4o+AykfwJQ==
X-CSE-MsgGUID: H5b3wVESSmC7aYwjHQ/p0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="237190204"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Dec 2025 05:24:21 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2N8-000000001xp-2cC7;
	Tue, 23 Dec 2025 13:24:18 +0000
Date: Tue, 23 Dec 2025 21:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 608328ba5b0619cbc28b409296b5e3840bcb97b6
Message-ID: <202512232121.73DiLhjr-lkp@intel.com>
User-Agent: s-nail v14.9.25
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 608328ba5b0619cbc28b409296b5e3840bcb97b6  powerpc/32: Restore disabling of interrupts at interrupt/syscall exit

elapsed time: 1454m

configs tested: 202
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              alldefconfig    clang-18
arc                              allmodconfig    clang-16
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-22
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251223    gcc-8.5.0
arc                   randconfig-002-20251223    gcc-8.5.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-16
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                   randconfig-001-20251223    clang-22
arm                   randconfig-002-20251223    gcc-10.5.0
arm                   randconfig-003-20251223    clang-20
arm                   randconfig-004-20251223    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20251223    clang-17
arm64                 randconfig-002-20251223    clang-22
arm64                 randconfig-003-20251223    clang-18
arm64                 randconfig-004-20251223    gcc-9.5.0
csky                             allmodconfig    gcc-15.1.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20251223    gcc-11.5.0
csky                  randconfig-002-20251223    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20251223    clang-22
hexagon               randconfig-001-20251223    gcc-15.1.0
hexagon               randconfig-002-20251223    clang-22
hexagon               randconfig-002-20251223    gcc-15.1.0
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251223    clang-20
i386        buildonly-randconfig-002-20251223    gcc-14
i386        buildonly-randconfig-003-20251223    clang-20
i386        buildonly-randconfig-004-20251223    clang-20
i386        buildonly-randconfig-005-20251223    gcc-14
i386        buildonly-randconfig-006-20251223    clang-20
i386                                defconfig    gcc-15.1.0
i386                  randconfig-001-20251223    clang-20
i386                  randconfig-001-20251223    gcc-13
i386                  randconfig-002-20251223    gcc-13
i386                  randconfig-002-20251223    gcc-14
i386                  randconfig-003-20251223    clang-20
i386                  randconfig-003-20251223    gcc-13
i386                  randconfig-004-20251223    gcc-13
i386                  randconfig-004-20251223    gcc-14
i386                  randconfig-005-20251223    gcc-13
i386                  randconfig-006-20251223    gcc-13
i386                  randconfig-006-20251223    gcc-14
i386                  randconfig-007-20251223    gcc-13
i386                  randconfig-011-20251223    gcc-14
i386                  randconfig-012-20251223    gcc-14
i386                  randconfig-013-20251223    gcc-14
i386                  randconfig-014-20251223    gcc-14
i386                  randconfig-015-20251223    gcc-14
i386                  randconfig-016-20251223    gcc-14
i386                  randconfig-017-20251223    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20251223    gcc-15.1.0
loongarch             randconfig-002-20251223    clang-22
loongarch             randconfig-002-20251223    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-16
m68k                             allyesconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
mips                             allmodconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
mips                            gpr_defconfig    clang-18
mips                           mtx1_defconfig    clang-18
mips                       rbtx49xx_defconfig    clang-18
nios2                            allmodconfig    clang-22
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-22
nios2                             allnoconfig    gcc-11.5.0
nios2                 randconfig-001-20251223    gcc-11.5.0
nios2                 randconfig-001-20251223    gcc-15.1.0
nios2                 randconfig-002-20251223    gcc-11.5.0
nios2                 randconfig-002-20251223    gcc-15.1.0
openrisc                         allmodconfig    clang-22
openrisc                         allmodconfig    gcc-15.1.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    clang-19
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251223    clang-22
parisc                randconfig-002-20251223    clang-22
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                 mpc832x_rdb_defconfig    clang-18
powerpc               randconfig-001-20251223    clang-22
powerpc               randconfig-002-20251223    clang-22
powerpc                     tqm8540_defconfig    clang-18
powerpc64             randconfig-001-20251223    clang-22
powerpc64             randconfig-002-20251223    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20251223    gcc-14.3.0
riscv                 randconfig-001-20251223    gcc-8.5.0
riscv                 randconfig-002-20251223    clang-22
riscv                 randconfig-002-20251223    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-15.1.0
s390                  randconfig-001-20251223    gcc-14.3.0
s390                  randconfig-002-20251223    gcc-14.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    clang-22
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    clang-19
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                    randconfig-001-20251223    gcc-10.5.0
sh                    randconfig-001-20251223    gcc-14.3.0
sh                    randconfig-002-20251223    gcc-14.3.0
sh                    randconfig-002-20251223    gcc-15.1.0
sh                           se7712_defconfig    clang-18
sh                              ul2_defconfig    clang-18
sparc                             allnoconfig    clang-22
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251223    clang-22
sparc                 randconfig-002-20251223    clang-22
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251223    clang-22
sparc64               randconfig-002-20251223    clang-22
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251223    clang-22
um                    randconfig-002-20251223    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251223    clang-20
x86_64                randconfig-001-20251223    gcc-14
x86_64                randconfig-002-20251223    clang-20
x86_64                randconfig-003-20251223    clang-20
x86_64                randconfig-003-20251223    gcc-14
x86_64                randconfig-004-20251223    clang-20
x86_64                randconfig-005-20251223    clang-20
x86_64                randconfig-005-20251223    gcc-14
x86_64                randconfig-006-20251223    clang-20
x86_64                randconfig-011-20251223    gcc-14
x86_64                randconfig-012-20251223    gcc-14
x86_64                randconfig-013-20251223    gcc-14
x86_64                randconfig-014-20251223    gcc-14
x86_64                randconfig-015-20251223    gcc-14
x86_64                randconfig-016-20251223    gcc-14
x86_64                randconfig-071-20251223    gcc-14
x86_64                randconfig-072-20251223    clang-20
x86_64                randconfig-073-20251223    clang-20
x86_64                randconfig-074-20251223    gcc-14
x86_64                randconfig-075-20251223    gcc-14
x86_64                randconfig-076-20251223    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                            allnoconfig    gcc-15.1.0
xtensa                           allyesconfig    clang-22
xtensa                           allyesconfig    gcc-15.1.0
xtensa                randconfig-001-20251223    clang-22
xtensa                randconfig-002-20251223    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

