Return-Path: <linuxppc-dev+bounces-14638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A14CA777C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 12:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dN8ss72TZz2xs1;
	Fri, 05 Dec 2025 22:53:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764935633;
	cv=none; b=KnhmpnyBSXrSd0QWKGDd7cLpkar+VKad3qcUSecyg5xymHCjFGxfQ6teK8q2jWE4AnFGbIkMFglr3QnSsTaYKaQxZikmJx5VhninO6FMzD0yXBsArfX01OSlXKEBSvFP8eRJZrO241lnn2YqD4YoN9tNfTuJk3a6s8OyNmA1hUTvShWpzWLnzbHls+odSWtAqYTSDgSdpHKZQtEOx9LWwcXHUhz6eDz8enlTumSWC+LNWOEQbQK0ZDydl/FsH6jXaxQ1+JdmD8ONZTce8ky0Fmk38YYEFqIOI1epbmvat9576UviKC1K1+nDrzJBkjPZZ8NHcRoxZlRf9Xmb8aRW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764935633; c=relaxed/relaxed;
	bh=JNzHKmt7G29ANedyuNhUPhfZiG74psf3CmS4NjW8QH0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hURhtAe3P1ezFLP77VFv8p9YFj3jefbHu/trO04VRtSsv4mhEzsDinC6UtLtRzR83duB0a+O+hGpDEXz9hgl/hfhzg16Ru1++EhckpNRJUtPzTYtpv1pxbW8PBo6z3ubjbbOW4tVxJC9Wnko72KZbZrpdq4YCE3kNa299vt4sNAjMn8fTtCZQX9GKMBev0CJp5IcIEIRlO/Dq/LLCfTwu8ebo/Yk+GaIwWcORQxuwlR7oOHyBx4wplF2dK0Rh4LzIItht9lV3wRMO5A+GL8u5oOwXRfmryyEW686DIfRaUa7jH8/bfizTE7wHfG6z1tZQCvi6VHZulwciuG/QqUjTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AVB0VIG5; dkim-atps=neutral; spf=pass (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AVB0VIG5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dN8sp6f5Kz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 22:53:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764935631; x=1796471631;
  h=date:from:to:cc:subject:message-id;
  bh=aODhzIZ8kMWraifQR1kt28OR8Bagi/Vrh905/ZGYMcE=;
  b=AVB0VIG5xt27tVa96YeijjbuWxMR8JXdhY7g9mQzQYB+levv5BJZpGM2
   AutEsUeB8ZMMaVrE2lAPuVgbExebeNrn6ewcj/VK/4lF3Y3vd/l0aZBGz
   pxEhAjWLbG8aizsCl1OA2y0D92nq7iMRWuooGuNXoEdew1EaYNLuCVgI3
   ZaM9BYbH+eA3A6WWF3gmsgwxUsKh017U7EgebGwzfsxyXjH+T2385xxNY
   GOsiz90bHBxjz94f92wZd8g7UtMOPVwpvnSD0oHyHbzyxOFw5qDuJKjBO
   UP+J7VsJCEz34XmB1hrSdNf3eaiGQjXOgXpipXmdYQCO25suQFM4Y8PDg
   Q==;
X-CSE-ConnectionGUID: 1hK3henkQ3OePF7Bf+ybZg==
X-CSE-MsgGUID: ILcQGUfPTN+u04kh8dJlsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70818784"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="70818784"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 03:53:45 -0800
X-CSE-ConnectionGUID: 8EsokcQlRA+rB1Fv5cYDwg==
X-CSE-MsgGUID: M0XtmMCqT92DL4yX2fS4TQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Dec 2025 03:53:44 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRUNZ-00000000ExB-3uNA;
	Fri, 05 Dec 2025 11:53:41 +0000
Date: Fri, 05 Dec 2025 19:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 85ff9335643c63e55e42fd383d650cc16de94921
Message-ID: <202512051905.63FBd1Ip-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 85ff9335643c63e55e42fd383d650cc16de94921  Automatic merge of 'next' into merge (2025-12-04 21:37)

elapsed time: 1493m

configs tested: 116
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20251205    gcc-8.5.0
arc                   randconfig-002-20251205    gcc-9.5.0
arm                           h3600_defconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    clang-17
arm                   randconfig-001-20251205    gcc-8.5.0
arm                   randconfig-002-20251205    gcc-8.5.0
arm                   randconfig-003-20251205    gcc-13.4.0
arm                   randconfig-004-20251205    gcc-8.5.0
arm                         s5pv210_defconfig    gcc-15.1.0
arm64                 randconfig-001-20251205    clang-22
arm64                 randconfig-002-20251205    clang-22
arm64                 randconfig-003-20251205    gcc-8.5.0
arm64                 randconfig-004-20251205    clang-22
csky                             allmodconfig    gcc-15.1.0
csky                  randconfig-001-20251205    gcc-15.1.0
hexagon                          allmodconfig    clang-17
hexagon               randconfig-001-20251205    clang-22
hexagon               randconfig-002-20251205    clang-22
i386                             allmodconfig    gcc-14
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251205    clang-20
i386        buildonly-randconfig-002-20251205    clang-20
i386        buildonly-randconfig-003-20251205    gcc-14
i386        buildonly-randconfig-004-20251205    gcc-14
i386        buildonly-randconfig-005-20251205    gcc-14
i386        buildonly-randconfig-006-20251205    gcc-12
i386                                defconfig    clang-20
i386                  randconfig-001-20251205    clang-20
i386                  randconfig-002-20251205    gcc-14
i386                  randconfig-003-20251205    clang-20
i386                  randconfig-004-20251205    clang-20
i386                  randconfig-005-20251205    gcc-14
i386                  randconfig-006-20251205    clang-20
i386                  randconfig-007-20251205    gcc-14
i386                  randconfig-011-20251205    clang-20
i386                  randconfig-012-20251205    gcc-13
i386                  randconfig-013-20251205    clang-20
i386                  randconfig-014-20251205    gcc-14
i386                  randconfig-015-20251205    clang-20
i386                  randconfig-016-20251205    gcc-13
i386                  randconfig-017-20251205    clang-20
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251205    clang-22
loongarch             randconfig-002-20251205    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                             allyesconfig    gcc-15.1.0
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251205    gcc-10.5.0
nios2                 randconfig-002-20251205    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-64bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20251205    gcc-8.5.0
parisc                randconfig-002-20251205    gcc-14.3.0
parisc64                            defconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc               randconfig-001-20251205    clang-18
powerpc               randconfig-002-20251205    clang-18
powerpc                     skiroot_defconfig    clang-22
powerpc64             randconfig-001-20251205    gcc-15.1.0
powerpc64             randconfig-002-20251205    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                 randconfig-001-20251205    gcc-13.4.0
riscv                 randconfig-002-20251205    gcc-8.5.0
s390                              allnoconfig    clang-22
s390                  randconfig-001-20251205    gcc-11.5.0
s390                  randconfig-002-20251205    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                         ap325rxa_defconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251205    gcc-13.4.0
sh                    randconfig-002-20251205    gcc-12.5.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20251205    gcc-14.3.0
sparc                 randconfig-002-20251205    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20251205    gcc-8.5.0
sparc64               randconfig-002-20251205    gcc-10.5.0
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251205    gcc-14
um                    randconfig-002-20251205    gcc-14
um                           x86_64_defconfig    clang-22
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251205    clang-20
x86_64      buildonly-randconfig-002-20251205    gcc-14
x86_64      buildonly-randconfig-003-20251205    gcc-12
x86_64      buildonly-randconfig-004-20251205    clang-20
x86_64      buildonly-randconfig-005-20251205    clang-20
x86_64      buildonly-randconfig-006-20251205    gcc-14
x86_64                              defconfig    gcc-14
x86_64                randconfig-001-20251205    clang-20
x86_64                randconfig-002-20251205    gcc-14
x86_64                randconfig-003-20251205    gcc-14
x86_64                randconfig-004-20251205    clang-20
x86_64                randconfig-005-20251205    gcc-14
x86_64                randconfig-072-20251205    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251205    gcc-10.5.0
xtensa                randconfig-002-20251205    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

