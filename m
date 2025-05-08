Return-Path: <linuxppc-dev+bounces-8424-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970AAAF234
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 06:49:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtKQz3xXVz2ygm;
	Thu,  8 May 2025 14:48:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746679739;
	cv=none; b=N2tafwB6C/b5Jo1KNvVf6Wh9EM2ILqNPATCySYhuENRHBmU+Cb6z9kNxHZemepIkGC+wMSz/G/Rv/qXloA2BinHULP2vR7ND4un9w4QmY3j9fO730JjtoU0Lk8+PCt5iadTRqAdeFwCWG0I8+SxBrcnnGyXsLyA7aXiTHgbA0gvpHE+Q5+XKywARu39IGRciNbM5/JptzAHzDF2dRyISX+4eorA/dPdelxis+uDpD6PfgbG9gCIXalM9B4aVqR322FNj2MC/IP04P/Vlsuz1BgfegB8utMHR7gbxWbk+HU8WtNQ/YrzLUZAc8HTdr2/WdSBMRrPonwYZdEfI08c7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746679739; c=relaxed/relaxed;
	bh=oUhpalmEkpH7RTMRMhNYkDfEskF6g2vr9hEeYcsME4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VLcFyrk9xk2ed0ExaDzVCHZ3qR3qEHR7zuQlzF35aZjdTLeCCNT9QKPfRI8RY2bRCvAVhIvdStBjhXD9LR4SxJaRbFARTn6KYi1yP2qEGdMw4mP5S3LXp+u0z+Z/Hki2hVd4o8HmR0gb5mLmeIMtv8p+kvB9aCZQS7r13hpa36xSiOuml0oEKbl4/POndjJDekcZvmtF2Ct+tNnLG0Lkkd6UExUqb/MbNZL6KDaBL7BFlrLw2tqaabayk3pH4Pm6oCM4vOTzknMGifyYIXV8FVtB6Q7StYAPwKKgNOQsCC9K6R6NSCLYm4dca3Ed5+EssLQDhh5aG5N3s382rGTuOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQM53rY4; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQM53rY4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtKQw4qFlz2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 14:48:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746679737; x=1778215737;
  h=date:from:to:cc:subject:message-id;
  bh=vrKimHuo7Izj3dZ7k717PKGcQD9vHdKQ+id3h04KJpI=;
  b=ZQM53rY4Y8eGe82Z+kyjBlo5sn4ip94FOG/9Jg+zjUjodGw7AcXk2YE6
   hZZcWFfZE7xITgAGnGRBruafIc8DURPOsWpsx302uLqxA6xCYxkzrRtfs
   eabJtcFGTc4Istb2lA8YP5+eQtZmlX/ttTahy8ktCrRkFg5xSv3UzldbX
   qJqn4peYpH/MeL+tCPE/OsBQmLhZvZWva3tTDBPzQ0mWFFoiNoq6wWnZc
   PFUIx7DtzDidSgjC2NeiNFjt1t6NFOG4qeLSmqc8kaYeFSnAe3ZO7YZNG
   knqUas/5AjJPcRBEgmFP9qbQeUdYNmW15yTb73cRyVM404fZmw6zN6CWP
   A==;
X-CSE-ConnectionGUID: cADe3yAGRPKnm0u+fXVBMQ==
X-CSE-MsgGUID: XYDImdBlRF2yLeV+VLkiaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59795876"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59795876"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 21:48:51 -0700
X-CSE-ConnectionGUID: DCEP6uL2SU+9eQ5/uoEp/g==
X-CSE-MsgGUID: LjyfF0/kSGmVkw6BCppB7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141134034"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 May 2025 21:48:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtBg-000A9N-0F;
	Thu, 08 May 2025 04:48:48 +0000
Date: Thu, 08 May 2025 12:48:42 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 03c9d1a5a30d93bff31b4eb0a52f030b4c7f73ea
Message-ID: <202505081236.or6cB8NK-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 03c9d1a5a30d93bff31b4eb0a52f030b4c7f73ea  Documentation: Fix description format for powerpc RTAS ioctls

elapsed time: 8636m

configs tested: 217
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-14.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250502    gcc-14.2.0
arc                   randconfig-001-20250506    gcc-8.5.0
arc                   randconfig-002-20250502    gcc-12.4.0
arc                   randconfig-002-20250506    gcc-12.4.0
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    gcc-14.2.0
arm                   randconfig-001-20250502    gcc-8.5.0
arm                   randconfig-001-20250506    clang-21
arm                   randconfig-002-20250502    gcc-7.5.0
arm                   randconfig-002-20250506    clang-21
arm                   randconfig-003-20250502    gcc-7.5.0
arm                   randconfig-003-20250506    clang-17
arm                   randconfig-004-20250502    clang-20
arm                   randconfig-004-20250506    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250502    clang-21
arm64                 randconfig-001-20250506    clang-21
arm64                 randconfig-002-20250502    gcc-8.5.0
arm64                 randconfig-002-20250506    gcc-8.5.0
arm64                 randconfig-003-20250502    gcc-8.5.0
arm64                 randconfig-003-20250506    clang-21
arm64                 randconfig-004-20250502    gcc-6.5.0
arm64                 randconfig-004-20250506    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250502    gcc-12.4.0
csky                  randconfig-001-20250503    gcc-14.2.0
csky                  randconfig-002-20250502    gcc-10.5.0
csky                  randconfig-002-20250503    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250502    clang-21
hexagon               randconfig-001-20250503    clang-21
hexagon               randconfig-002-20250502    clang-21
hexagon               randconfig-002-20250503    clang-16
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250502    clang-20
i386        buildonly-randconfig-001-20250503    gcc-12
i386        buildonly-randconfig-002-20250502    clang-20
i386        buildonly-randconfig-002-20250503    gcc-12
i386        buildonly-randconfig-003-20250502    clang-20
i386        buildonly-randconfig-003-20250503    gcc-12
i386        buildonly-randconfig-004-20250502    clang-20
i386        buildonly-randconfig-004-20250503    clang-20
i386        buildonly-randconfig-005-20250502    gcc-12
i386        buildonly-randconfig-005-20250503    gcc-12
i386        buildonly-randconfig-006-20250502    gcc-12
i386        buildonly-randconfig-006-20250503    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250502    gcc-14.2.0
loongarch             randconfig-001-20250503    gcc-14.2.0
loongarch             randconfig-002-20250502    gcc-14.2.0
loongarch             randconfig-002-20250503    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250502    gcc-14.2.0
nios2                 randconfig-001-20250503    gcc-11.5.0
nios2                 randconfig-002-20250502    gcc-6.5.0
nios2                 randconfig-002-20250503    gcc-7.5.0
openrisc                          allnoconfig    clang-21
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-21
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250502    gcc-5.5.0
parisc                randconfig-001-20250503    gcc-8.5.0
parisc                randconfig-002-20250502    gcc-5.5.0
parisc                randconfig-002-20250503    gcc-14.2.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-21
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc                          allyesconfig    gcc-14.2.0
powerpc               randconfig-001-20250502    clang-21
powerpc               randconfig-001-20250503    gcc-5.5.0
powerpc               randconfig-002-20250502    clang-19
powerpc               randconfig-002-20250503    gcc-9.3.0
powerpc               randconfig-003-20250502    clang-21
powerpc               randconfig-003-20250503    clang-21
powerpc64             randconfig-001-20250502    clang-21
powerpc64             randconfig-001-20250503    gcc-7.5.0
powerpc64             randconfig-002-20250502    clang-17
powerpc64             randconfig-002-20250503    gcc-10.5.0
powerpc64             randconfig-003-20250502    clang-21
powerpc64             randconfig-003-20250503    gcc-7.5.0
riscv                            allmodconfig    clang-21
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-14.2.0
riscv                 randconfig-001-20250502    clang-19
riscv                 randconfig-001-20250503    clang-20
riscv                 randconfig-001-20250506    clang-19
riscv                 randconfig-002-20250502    gcc-14.2.0
riscv                 randconfig-002-20250503    gcc-9.3.0
riscv                 randconfig-002-20250506    clang-21
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250502    clang-21
s390                  randconfig-001-20250503    gcc-7.5.0
s390                  randconfig-001-20250506    gcc-9.3.0
s390                  randconfig-002-20250502    clang-21
s390                  randconfig-002-20250503    gcc-8.5.0
s390                  randconfig-002-20250506    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250502    gcc-14.2.0
sh                    randconfig-001-20250503    gcc-5.5.0
sh                    randconfig-001-20250506    gcc-12.4.0
sh                    randconfig-002-20250502    gcc-14.2.0
sh                    randconfig-002-20250503    gcc-5.5.0
sh                    randconfig-002-20250506    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250502    gcc-10.3.0
sparc                 randconfig-001-20250503    gcc-8.5.0
sparc                 randconfig-001-20250506    gcc-11.5.0
sparc                 randconfig-002-20250502    gcc-11.5.0
sparc                 randconfig-002-20250503    gcc-14.2.0
sparc                 randconfig-002-20250506    gcc-6.5.0
sparc64               randconfig-001-20250502    gcc-5.5.0
sparc64               randconfig-001-20250503    gcc-10.5.0
sparc64               randconfig-001-20250506    gcc-7.5.0
sparc64               randconfig-002-20250502    gcc-5.5.0
sparc64               randconfig-002-20250503    gcc-14.2.0
sparc64               randconfig-002-20250506    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                    randconfig-001-20250502    clang-21
um                    randconfig-001-20250503    clang-21
um                    randconfig-001-20250506    clang-17
um                    randconfig-002-20250502    gcc-11
um                    randconfig-002-20250503    gcc-12
um                    randconfig-002-20250506    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250502    gcc-12
x86_64      buildonly-randconfig-001-20250503    gcc-12
x86_64      buildonly-randconfig-001-20250506    clang-20
x86_64      buildonly-randconfig-002-20250502    clang-20
x86_64      buildonly-randconfig-002-20250503    gcc-12
x86_64      buildonly-randconfig-002-20250506    gcc-12
x86_64      buildonly-randconfig-003-20250502    clang-20
x86_64      buildonly-randconfig-003-20250503    gcc-12
x86_64      buildonly-randconfig-003-20250506    gcc-12
x86_64      buildonly-randconfig-004-20250502    clang-20
x86_64      buildonly-randconfig-004-20250503    gcc-12
x86_64      buildonly-randconfig-004-20250506    clang-20
x86_64      buildonly-randconfig-005-20250502    gcc-12
x86_64      buildonly-randconfig-005-20250503    clang-20
x86_64      buildonly-randconfig-005-20250506    clang-20
x86_64      buildonly-randconfig-006-20250502    clang-20
x86_64      buildonly-randconfig-006-20250503    clang-20
x86_64      buildonly-randconfig-006-20250506    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    clang-18
x86_64                         rhel-9.4-kunit    clang-18
x86_64                           rhel-9.4-ltp    clang-18
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250502    gcc-13.3.0
xtensa                randconfig-001-20250503    gcc-10.5.0
xtensa                randconfig-001-20250506    gcc-13.3.0
xtensa                randconfig-002-20250502    gcc-11.5.0
xtensa                randconfig-002-20250503    gcc-14.2.0
xtensa                randconfig-002-20250506    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

