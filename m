Return-Path: <linuxppc-dev+bounces-10412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452DB12CB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jul 2025 23:42:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bqJB517y0z2xjP;
	Sun, 27 Jul 2025 07:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753566157;
	cv=none; b=msAdmisZTHIWm1aJjStcSBa7PiNL1DZxI/Rvku+3tbYwEGZd/zE1e9gxzxjHI3yrJYtffhnS8yd4Ocae2933jNM8qJ2GZNU6QEbFhC4MsKvGL7SZKZgYXcDxrCcH/UdL/i2Yt825vuxZNZvmnwR/oT5ZQbAXVGR4TUrvyK2+0u0u89EVKyPm2rdNE+rdTQITnwuw43TjzmjEu2xMOd7BiDlyHdTrfwq4g1keBitUXonKEsttUuiLOKJR7uVaSyuzVqUp0D632jm0qqet7wtCaM1a8Y89MWfjAEpbF2fGO4cDF2Vs3lJ1M2iuFrReRI2zd00QS3Hl4iVK3qbIGdqt/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753566157; c=relaxed/relaxed;
	bh=0RgsxJS0lLHybYl5+Xi5oKhQvIB38zMMiYSiiQmeXGg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b0oiZJMTXYKJmrEYo+fL7N7TG7earet5j2omerlZ6SLt6z5w476yC1MtASR/UasG9Noxl7lIoCIXHZPtEZUXJTLIdzzV0VQ8vF4xPgw0t1O/+746gpQKEM8+YBIej8z8wiERDC3U0E5cbBuI2qaU1ovRZrblxQyv3Jo3j3TqjmvIYyG7IaM5p0GIkYODEKKJzdj+N/NY8VeGOJAxH/CPmL8sepIPZkqgDbY3gLXyjK24GGFkLJEYDMbC1jUwcnk2kSPf/WM/NWPrnipABiPiyjJIfvCXh69GMpvlGn11PGGfe37/m5jiUS5qV85UmveiyIM6tAs8e9hz6KQ3O/rc2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OXj7n89R; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OXj7n89R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bqJB23h4bz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jul 2025 07:42:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753566154; x=1785102154;
  h=date:from:to:cc:subject:message-id;
  bh=lFFEwOcGRbFr0wWxObPdNM0VV+k2i1jEaeHd/jODvQA=;
  b=OXj7n89RGUqrFqahoFJyrXzBM9EV3MKPPoNE8cCaUGj3PwYr9KccPfba
   bnPNYJ+/xqHxj3RRC+G8CbmAhvaHeJkQQVmtz6Pa3nX91DgB5OHyLkc0T
   8fxAI5L7QTsItBEUz7ghbQDzomuigFGP2rF3cALg0OmIuN3JjPk0m5C+o
   L4uPlLFm+qWC+LpTZnRExCpJfDLNNZvnFvbrr2scm1js8XX5MLij0WPzp
   qZ25mw5wls53PfFcsRX+0mYctwZQKpowSBm5o+vnAQHK/0UyNadtKQxUo
   naHmsj17tKTUtaY+0AtHXRa7+qXV8XPnovIU3dHZvwFsHFs0XRRZW9H46
   g==;
X-CSE-ConnectionGUID: GERJWu0iQ8WKLR31aF6qkQ==
X-CSE-MsgGUID: 29DwxCrPTu6fXx+8B5Y12A==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56011777"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56011777"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 14:42:29 -0700
X-CSE-ConnectionGUID: Iw5u3MLQRWixzUwOxVm9/w==
X-CSE-MsgGUID: 45Y/2B9NSKGQftj7MKgEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192642394"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 14:42:28 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufmev-000MIp-1j;
	Sat, 26 Jul 2025 21:42:25 +0000
Date: Sun, 27 Jul 2025 05:41:52 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 a8f2b96ca9ee87be8091fcc2746b811c173648a0
Message-ID: <202507270540.KCseBZzs-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: a8f2b96ca9ee87be8091fcc2746b811c173648a0  PCI: pnv_php: Enable third attention indicator state

elapsed time: 820m

configs tested: 121
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                   randconfig-001-20250726    gcc-14.3.0
arc                   randconfig-002-20250726    gcc-12.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    gcc-15.1.0
arm                   randconfig-001-20250726    gcc-8.5.0
arm                   randconfig-002-20250726    gcc-10.5.0
arm                   randconfig-003-20250726    gcc-10.5.0
arm                   randconfig-004-20250726    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                 randconfig-001-20250726    gcc-8.5.0
arm64                 randconfig-002-20250726    clang-22
arm64                 randconfig-003-20250726    gcc-12.5.0
arm64                 randconfig-004-20250726    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                  randconfig-001-20250726    gcc-15.1.0
csky                  randconfig-001-20250727    gcc-15.1.0
csky                  randconfig-002-20250726    gcc-15.1.0
csky                  randconfig-002-20250727    gcc-12.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-22
hexagon               randconfig-001-20250726    clang-22
hexagon               randconfig-001-20250727    clang-22
hexagon               randconfig-002-20250726    clang-20
hexagon               randconfig-002-20250727    clang-22
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250726    gcc-12
i386        buildonly-randconfig-002-20250726    gcc-12
i386        buildonly-randconfig-003-20250726    clang-20
i386        buildonly-randconfig-004-20250726    gcc-12
i386        buildonly-randconfig-005-20250726    clang-20
i386        buildonly-randconfig-006-20250726    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch             randconfig-001-20250726    gcc-15.1.0
loongarch             randconfig-001-20250727    clang-22
loongarch             randconfig-002-20250726    gcc-14.3.0
loongarch             randconfig-002-20250727    clang-22
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250726    gcc-8.5.0
nios2                 randconfig-001-20250727    gcc-8.5.0
nios2                 randconfig-002-20250726    gcc-8.5.0
nios2                 randconfig-002-20250727    gcc-11.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250726    gcc-8.5.0
parisc                randconfig-002-20250726    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc               randconfig-001-20250726    clang-16
powerpc               randconfig-002-20250726    gcc-11.5.0
powerpc               randconfig-003-20250726    gcc-8.5.0
powerpc64             randconfig-001-20250726    clang-22
powerpc64             randconfig-002-20250726    gcc-10.5.0
powerpc64             randconfig-003-20250726    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250726    gcc-11.5.0
riscv                 randconfig-002-20250726    clang-17
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                  randconfig-001-20250726    clang-22
s390                  randconfig-002-20250726    clang-22
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                    randconfig-001-20250726    gcc-12.5.0
sh                    randconfig-002-20250726    gcc-9.5.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250726    gcc-8.5.0
sparc                 randconfig-002-20250726    gcc-15.1.0
sparc64               randconfig-001-20250726    clang-22
sparc64               randconfig-002-20250726    gcc-8.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-12
um                    randconfig-001-20250726    gcc-12
um                    randconfig-002-20250726    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250726    gcc-12
x86_64      buildonly-randconfig-002-20250726    gcc-12
x86_64      buildonly-randconfig-003-20250726    gcc-12
x86_64      buildonly-randconfig-004-20250726    clang-20
x86_64      buildonly-randconfig-005-20250726    clang-20
x86_64      buildonly-randconfig-006-20250726    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250726    gcc-8.5.0
xtensa                randconfig-002-20250726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

