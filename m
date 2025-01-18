Return-Path: <linuxppc-dev+bounces-5374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B2A15B8E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jan 2025 06:43:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZlrg1klpz305S;
	Sat, 18 Jan 2025 16:43:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737179011;
	cv=none; b=EZKGbJ+6hj9R7lMfxIEm+Qe5mSw+H4CJTsOs+aqMCWUrrohbm0jE7Z9X5fGucet2Jf7By6rYmI4hoFPT0/qyxXjdNIGMPumavnk5UAVMK1WhwLtIkBtLWj24e6hmL+1XEmVu4WBw30MXp0KhvU18AGIw7IPLIJ8vdbVtSkJg5aqRGp+hTuRR8QkLCFTmWPRgjy4mRZB+djpFecQQZNk1AbdKNesnl558vCdttBRr1Yauwzy4cvj8YY8ID21Z7iY9RZhAMinnH4uTuyKvVkz4GZu19SE7z/oWRuTCqvhG0mvuYydVdEztCrE4HjUbzVm9IZYzGSSqiA0+JwzI2dx6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737179011; c=relaxed/relaxed;
	bh=VkocLAN+aBbOBY/jt7IE+ou9nMsedsUdoxsCjGWkEXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C7YDRtqCYxJWKWhtXCYSw9pGQkSYx1UkLKof1sd9E7xRoLQak/XqALrwEXYcAJVp7lDqox/iAesU3XnrBdXs/C5H0upVJO8r0fBAVu7BWAJMmkiwSymEGQBycLgnT5ypowTbE3mmhIbibB8of8ufMX57oZ4KKqA2brKw13LYGnL7cieL2dOBS28BxDmAIrK3qt7MlkuezMERclhQnsAHMf4P1mVnHE29jrc1CVCAFe6x9xF0NUZIfOCLE1aMEhMr56UJgSIXqN1lZ+fNXmjmwXYRYHulccBDkxUShVphO4ybB0ZqMHy8qpCzmwIbCj/3Ztsna8VUrIPZ5jEpqZsNsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j8XDkWEu; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j8XDkWEu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZlrf1F4xz2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 16:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737179010; x=1768715010;
  h=date:from:to:cc:subject:message-id;
  bh=0qGaPYNzRexa5VsQ7ODJEtPiH4go6gfpD0brrrmcYBg=;
  b=j8XDkWEuIriSynRhNie8sQeBGEYsFmWYXNTaZ5SlxdeICp+LsH6hfcLK
   1UU24e2qYfyJLQZCKjOwdZZSsMZmvrVumi4YK+onTM6xjyoUyBwf3cyiI
   O4AgC4H9FOIVKhWauYWSHQntMPze4u6l8g/BkEqucoz7a3TVY+Px2lpZY
   z3vAQXspmze5DcgZM+a8p5gRoqotqZNsdd1NNZOkv8pMwTVp/Bwbd15as
   OLk46y0/tVbJoQpDBaD1lwGTiFXH8iHS+1Z23PVO6rkVnKRFop2ucluO9
   hpHb5CuWdsUbBEhvQ6Ell5HKSQPWN0q7ZDiS/vmBGgOc85HTMpBirjKMK
   g==;
X-CSE-ConnectionGUID: yHjPTAViRZG7OL/5UH5odg==
X-CSE-MsgGUID: WxKt+JZKR2OXkI9SBWMZnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36898493"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="36898493"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 21:43:27 -0800
X-CSE-ConnectionGUID: LWZ+LsDsRNSfmwZGmcJ89A==
X-CSE-MsgGUID: mrn4ffh9SEGJlm4DOujvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="105846146"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jan 2025 21:43:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ1cB-000U7j-2v;
	Sat, 18 Jan 2025 05:43:23 +0000
Date: Sat, 18 Jan 2025 13:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 e5b94ed319deb5534cee1cdefe93f128c7fab863
Message-ID: <202501181357.3oBeXeHZ-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: e5b94ed319deb5534cee1cdefe93f128c7fab863  Automatic merge of 'next' into merge (2025-01-17 10:12)

elapsed time: 1449m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                        nsimosci_defconfig    gcc-13.2.0
arc                   randconfig-001-20250117    gcc-13.2.0
arc                   randconfig-001-20250118    gcc-13.2.0
arc                   randconfig-002-20250117    gcc-13.2.0
arc                   randconfig-002-20250118    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         lpc32xx_defconfig    clang-20
arm                          moxart_defconfig    gcc-14.2.0
arm                   randconfig-001-20250117    clang-18
arm                   randconfig-001-20250118    gcc-14.2.0
arm                   randconfig-002-20250117    gcc-14.2.0
arm                   randconfig-002-20250118    clang-20
arm                   randconfig-003-20250117    gcc-14.2.0
arm                   randconfig-004-20250117    clang-16
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250117    gcc-14.2.0
arm64                 randconfig-002-20250117    clang-18
arm64                 randconfig-003-20250117    clang-20
arm64                 randconfig-004-20250117    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250117    gcc-14.2.0
csky                  randconfig-001-20250118    gcc-14.2.0
csky                  randconfig-002-20250117    gcc-14.2.0
csky                  randconfig-002-20250118    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250117    clang-20
hexagon               randconfig-001-20250118    clang-20
hexagon               randconfig-002-20250117    clang-20
hexagon               randconfig-002-20250118    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250117    clang-19
i386        buildonly-randconfig-001-20250118    gcc-12
i386        buildonly-randconfig-002-20250117    clang-19
i386        buildonly-randconfig-002-20250118    clang-19
i386        buildonly-randconfig-003-20250117    gcc-12
i386        buildonly-randconfig-003-20250118    clang-19
i386        buildonly-randconfig-004-20250117    gcc-12
i386        buildonly-randconfig-004-20250118    gcc-11
i386        buildonly-randconfig-005-20250117    clang-19
i386        buildonly-randconfig-005-20250118    clang-19
i386        buildonly-randconfig-006-20250117    gcc-11
i386        buildonly-randconfig-006-20250118    clang-19
i386                                defconfig    clang-19
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250117    gcc-14.2.0
loongarch             randconfig-001-20250118    gcc-14.2.0
loongarch             randconfig-002-20250117    gcc-14.2.0
loongarch             randconfig-002-20250118    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250117    gcc-14.2.0
nios2                 randconfig-001-20250118    gcc-14.2.0
nios2                 randconfig-002-20250117    gcc-14.2.0
nios2                 randconfig-002-20250118    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250117    gcc-14.2.0
parisc                randconfig-002-20250117    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                       eiger_defconfig    clang-17
powerpc               randconfig-001-20250117    gcc-14.2.0
powerpc               randconfig-002-20250117    gcc-14.2.0
powerpc               randconfig-003-20250117    gcc-14.2.0
powerpc64             randconfig-001-20250117    clang-16
powerpc64             randconfig-002-20250117    clang-20
powerpc64             randconfig-003-20250117    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                 randconfig-001-20250117    gcc-14.2.0
riscv                 randconfig-002-20250117    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250117    gcc-14.2.0
s390                  randconfig-002-20250117    clang-20
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250117    gcc-14.2.0
sh                    randconfig-002-20250117    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250117    gcc-14.2.0
sparc                 randconfig-002-20250117    gcc-14.2.0
sparc64               randconfig-001-20250117    gcc-14.2.0
sparc64               randconfig-002-20250117    gcc-14.2.0
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20250117    clang-20
um                    randconfig-002-20250117    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250117    gcc-12
x86_64      buildonly-randconfig-002-20250117    gcc-12
x86_64      buildonly-randconfig-003-20250117    gcc-12
x86_64      buildonly-randconfig-004-20250117    gcc-12
x86_64      buildonly-randconfig-005-20250117    gcc-12
x86_64      buildonly-randconfig-006-20250117    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250117    gcc-14.2.0
xtensa                randconfig-002-20250117    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

