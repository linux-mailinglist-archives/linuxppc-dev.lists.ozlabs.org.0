Return-Path: <linuxppc-dev+bounces-4346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F23099F78AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2024 10:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDQYc58N9z30TQ;
	Thu, 19 Dec 2024 20:41:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734601316;
	cv=none; b=SldtIQyyXmaaweKI4pWgMmh0YCahpXUGaBqjHvA8tcRBdj2sNt4XPZ3d5RVHDeR/9D6mePiSYG5bMT50FvnZyw+W6b9Jo/hHj+pBHKM1ktctK6VHiJiLp7i0xUny+99Lf8Z9UcHLyQQxupS9ZrqeucS3aXzOgg7pC+ahoRXjr0YqZnWRlgxh8/7uXHsuQjd0k5Mwn1+QYeSHDnAOgoC+wEo7wFsXZtGEkHYVTYOVvtQ1KWrYEBZyWxR8gqZRQTJCpbslm+2ME5gqKWXa7fcPQKoBPx8q0W74SSiUad1O+VPJitC3djphawR5f9HLnCdV21dWNgZ4q/z3b8H749MaJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734601316; c=relaxed/relaxed;
	bh=DFUh1IWIJXaY0LiucMJPeOejyT/t2YK03I6fMj2tOMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c0ulTEPtTW2Q89jBL+19svplipof4HMIANWT+EBv5ZMr8vedBbw/xSh+5zeSQL3+hmHWQr8qC9R/AF2wrPBbN6gsfgNo8r6tF4iUJEIa6y7g5lC3Ay1m7Zc8i0BlBla3T0E9aQZTca4pft3Jb9UpmQ2yI3tVxyC1aIvu+DpOv4u3fWKn0aCiqCJaDRqHnJHi8EXbG8LZwIIuV7xw83KdsRHgEWqVtR05oPyUJ89YOi6uwq3cdOUX9VItPxNWQ8o4fZ69GHuoycWyDeqzqg+z0HGHRbq01emlzwLWjLPodhTvlrxISQoNpcwg70s4BJDRHqeNH9iNM3s8+Tp9/7lRdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LDsXS4MQ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LDsXS4MQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDQYb3ddJz2yLr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 20:41:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734601316; x=1766137316;
  h=date:from:to:cc:subject:message-id;
  bh=pa/ReqJbqZIedz9Y1jrcbDDlv0u+djCh4Po+9UsWLro=;
  b=LDsXS4MQ+HL9jmR/ntEdh3gf27d4+xWtxJZJ5Jpg2CMLr+o9YBkNsytr
   Lfj9sZ8jDgO7doFSQbu0A6PlFBkChaV3vMH2YtT82gZB76ElADT4Y+H9y
   t+8tUSm3OX6+upP473OKZfg0WnM6uUqTqLNenc4x8+1vySf4LYS6o5Zr5
   rK5Kdfb2WW4yXSAHlSHYD3L2SNfQJFjBB6Kj1FxYSQL9WH3rbAs+BM4GQ
   nypp+CDe+r+uxQsM9oDWcGI8kZuTqSKd2ZGz4O4JDeUPZA4/2ZA7xWH1r
   zjJE2OFNt65yGhshzc/kKFIaMWJP35gqfw63e5hEELauQOC4m0Pjj3w2r
   A==;
X-CSE-ConnectionGUID: GVsdxQEnQ0+haFzTz+sDrQ==
X-CSE-MsgGUID: rVnJAGqITu6ZPXdFDTRB6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35252233"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="35252233"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 01:41:53 -0800
X-CSE-ConnectionGUID: ULhXK7DnQn++6IT2YJGUQQ==
X-CSE-MsgGUID: jMY2AQmdSTSd7WyVlpxUTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; 
   d="scan'208";a="128948060"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Dec 2024 01:41:52 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOD2T-00009L-11;
	Thu, 19 Dec 2024 09:41:49 +0000
Date: Thu, 19 Dec 2024 17:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 d629d7a8efc33d05d62f4805c0ffb44727e3d99f
Message-ID: <202412191709.C5Ua3SBZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: d629d7a8efc33d05d62f4805c0ffb44727e3d99f  powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump is active

elapsed time: 1446m

configs tested: 161
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20241218    gcc-13.2.0
arc                   randconfig-001-20241219    gcc-13.2.0
arc                   randconfig-002-20241218    gcc-13.2.0
arc                   randconfig-002-20241219    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                     am200epdkit_defconfig    gcc-14.2.0
arm                         lpc18xx_defconfig    clang-19
arm                          pxa168_defconfig    clang-16
arm                   randconfig-001-20241218    clang-20
arm                   randconfig-001-20241219    clang-18
arm                   randconfig-002-20241218    clang-19
arm                   randconfig-002-20241219    gcc-14.2.0
arm                   randconfig-003-20241218    clang-17
arm                   randconfig-003-20241219    clang-18
arm                   randconfig-004-20241218    clang-19
arm                   randconfig-004-20241219    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241218    clang-20
arm64                 randconfig-001-20241219    clang-16
arm64                 randconfig-002-20241218    clang-20
arm64                 randconfig-002-20241219    clang-18
arm64                 randconfig-003-20241218    gcc-14.2.0
arm64                 randconfig-003-20241219    gcc-14.2.0
arm64                 randconfig-004-20241218    gcc-14.2.0
arm64                 randconfig-004-20241219    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241218    gcc-14.2.0
csky                  randconfig-001-20241219    gcc-14.2.0
csky                  randconfig-002-20241218    gcc-14.2.0
csky                  randconfig-002-20241219    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241218    clang-20
hexagon               randconfig-001-20241219    clang-19
hexagon               randconfig-002-20241218    clang-18
hexagon               randconfig-002-20241219    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241218    clang-19
i386        buildonly-randconfig-001-20241219    gcc-12
i386        buildonly-randconfig-002-20241218    clang-19
i386        buildonly-randconfig-002-20241219    gcc-12
i386        buildonly-randconfig-003-20241218    gcc-12
i386        buildonly-randconfig-003-20241219    clang-19
i386        buildonly-randconfig-004-20241218    gcc-12
i386        buildonly-randconfig-004-20241219    clang-19
i386        buildonly-randconfig-005-20241218    clang-19
i386        buildonly-randconfig-005-20241219    gcc-12
i386        buildonly-randconfig-006-20241218    clang-19
i386        buildonly-randconfig-006-20241219    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241218    gcc-14.2.0
loongarch             randconfig-001-20241219    gcc-14.2.0
loongarch             randconfig-002-20241218    gcc-14.2.0
loongarch             randconfig-002-20241219    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                           virt_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         bigsur_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241218    gcc-14.2.0
nios2                 randconfig-001-20241219    gcc-14.2.0
nios2                 randconfig-002-20241218    gcc-14.2.0
nios2                 randconfig-002-20241219    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20241218    gcc-14.2.0
parisc                randconfig-001-20241219    gcc-14.2.0
parisc                randconfig-002-20241218    gcc-14.2.0
parisc                randconfig-002-20241219    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                     ksi8560_defconfig    gcc-14.2.0
powerpc                      mgcoge_defconfig    clang-20
powerpc               randconfig-001-20241218    gcc-14.2.0
powerpc               randconfig-001-20241219    clang-18
powerpc               randconfig-002-20241218    clang-15
powerpc               randconfig-002-20241219    clang-16
powerpc               randconfig-003-20241218    clang-17
powerpc               randconfig-003-20241219    clang-20
powerpc64             randconfig-001-20241219    gcc-14.2.0
powerpc64             randconfig-002-20241218    clang-20
powerpc64             randconfig-002-20241219    clang-18
powerpc64             randconfig-003-20241218    gcc-14.2.0
powerpc64             randconfig-003-20241219    clang-16
riscv                             allnoconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                    nommu_k210_defconfig    clang-15
riscv                 randconfig-001-20241218    gcc-14.2.0
riscv                 randconfig-002-20241218    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                  randconfig-001-20241218    gcc-14.2.0
s390                  randconfig-002-20241218    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-14.2.0
sh                        edosk7705_defconfig    gcc-14.2.0
sh                            hp6xx_defconfig    gcc-14.2.0
sh                            migor_defconfig    gcc-14.2.0
sh                    randconfig-001-20241218    gcc-14.2.0
sh                    randconfig-002-20241218    gcc-14.2.0
sh                   secureedge5410_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241218    gcc-14.2.0
sparc                 randconfig-002-20241218    gcc-14.2.0
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20241218    gcc-14.2.0
sparc64               randconfig-002-20241218    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241218    gcc-12
um                    randconfig-002-20241218    clang-17
um                           x86_64_defconfig    clang-15
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241218    clang-19
x86_64      buildonly-randconfig-001-20241219    gcc-12
x86_64      buildonly-randconfig-002-20241218    clang-19
x86_64      buildonly-randconfig-002-20241219    gcc-12
x86_64      buildonly-randconfig-003-20241218    gcc-12
x86_64      buildonly-randconfig-003-20241219    clang-19
x86_64      buildonly-randconfig-004-20241218    gcc-12
x86_64      buildonly-randconfig-004-20241219    gcc-12
x86_64      buildonly-randconfig-005-20241218    gcc-12
x86_64      buildonly-randconfig-005-20241219    gcc-12
x86_64      buildonly-randconfig-006-20241218    gcc-11
x86_64      buildonly-randconfig-006-20241219    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20241218    gcc-14.2.0
xtensa                randconfig-002-20241218    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

