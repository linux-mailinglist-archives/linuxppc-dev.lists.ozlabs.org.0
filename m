Return-Path: <linuxppc-dev+bounces-8422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210BDAAF0EE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 04:00:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtFh03rDpz3020;
	Thu,  8 May 2025 12:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746669600;
	cv=none; b=F+7HWwVdEfHo8M1SFWap7i9RxrYhpFQtY5vLRIwo+cCEsr5ssNcicvyK+27IQd4vzl6zh2qrI3Nqojlkw3YVan0MK5k7xzdUBcGrI2oWr7lKaXfyBb1zHXPDMOtbzgHU+YjdEKUCHmWy9VeycXxUQRiF3IaLQs84Wn83bayekSFxKfHYgLt233ThwIj7D+yqAGwxkbYDY4QGncNgiggixDCyXlhRWD7/vzLwnetdCyU34xTRH7+kPvOdDyzpI7bD1q6dmG1byIU3T/3vvvqIGaMDUQhZjgKPSfsSVYC1e0DbnVXP4w39yDaiL85f8yZ/iYfH0XvYt9mLkFgaX0eRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746669600; c=relaxed/relaxed;
	bh=MrN4yBMWWnWHFFElFWhvYHrTnwrTxQXvLEyVL0/8sls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OXBHVG093JMr62Hzayp+QCRVN67Dil61BWrgT8aWl5+8uJ90uR3eLLLD7GOLuPQd4t04dNp1NWApRp6C4JwWEkm7XdIKlXC6M87TXX0JrrLM3+mKUw6kjWmaBubGMT+5UBeHR901JajyQnnWu6sFVA7Q0+K6JDqHn8Qrc2H62oqRx5Fofq3v39UD85KbKWYhkALezch2QLcGNh8eJM1YeZy9J0+Pcz2XQ5TFNrzq5uavXl3YeDTCdBB8klojAX/zpJZ9DZ+WQjlh8ierYGwaAz1A6GLYO6loA9LLxGN0clVoc6gmqjwaVbYxgQUn9YX4Q3FtHcYm5giLaIqZSm1UUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fyV8dMtF; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fyV8dMtF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtFgy1np6z2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 11:59:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746669598; x=1778205598;
  h=date:from:to:cc:subject:message-id;
  bh=QctunBtlVML3boDm9GKwgBPAaElt56LD6zbP59i0Ls8=;
  b=fyV8dMtFy/EdS/i0OopwhjVnxH9IAzq6l3IABQOOdsZJi6CzV+KZFrNo
   orp0LSFKgFrCGDUwHA3lEkdASXv1ZdLazYa32y2rR83DMP/qmPE0pdbCK
   EXkUnQYu6tcq+DP2dDKlcsuFT5mTVTnLOAOSyvCDLZl36oUrtAQtseJhQ
   OZfpKNDO37e37GicvzWo2KspV0sK90cxAqYyEmplieV+dU9YovD22gLn3
   gYhuED9+9j/iRzkMs+N/h40x/WcQpVqaLX9eaAt9Xls5vIpysa/fDATjj
   s6gHv6miSMDJlnh8x3xbgpGqR27zrqOFxf7zRttKu2+k4Q1fBRO+H5nZe
   A==;
X-CSE-ConnectionGUID: 8fCqUeqyTKiXNLbfZO8w+w==
X-CSE-MsgGUID: Jq8ihJuBTVC/cEVYRdJY/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59784339"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59784339"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 18:59:53 -0700
X-CSE-ConnectionGUID: SFQG5ZxDQA29tTYOjQ3AgA==
X-CSE-MsgGUID: pZ7ArRJ3RtiaEFOVPdrqDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="173350555"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 18:59:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCqYA-0009GR-03;
	Thu, 08 May 2025 01:59:50 +0000
Date: Thu, 08 May 2025 09:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 ee74be3b5209b3ad646793c099499c528c57b241
Message-ID: <202505080940.9c9VhmyI-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: ee74be3b5209b3ad646793c099499c528c57b241  Automatic merge of 'next' into merge (2025-05-04 08:44)

elapsed time: 4157m

configs tested: 106
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-14.2.0
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    gcc-14.2.0
arc                   randconfig-001-20250506    gcc-8.5.0
arc                   randconfig-002-20250506    gcc-12.4.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-14.2.0
arm                   randconfig-001-20250506    clang-21
arm                   randconfig-002-20250506    clang-21
arm                   randconfig-003-20250506    clang-17
arm                   randconfig-004-20250506    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250506    clang-21
arm64                 randconfig-002-20250506    gcc-8.5.0
arm64                 randconfig-003-20250506    clang-21
arm64                 randconfig-004-20250506    gcc-8.5.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250506    gcc-14.2.0
csky                  randconfig-002-20250506    gcc-14.2.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon               randconfig-001-20250506    clang-21
hexagon               randconfig-002-20250506    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250506    clang-20
i386        buildonly-randconfig-002-20250506    clang-20
i386        buildonly-randconfig-003-20250506    clang-20
i386        buildonly-randconfig-004-20250506    gcc-12
i386        buildonly-randconfig-005-20250506    clang-20
i386        buildonly-randconfig-006-20250506    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250506    gcc-14.2.0
loongarch             randconfig-002-20250506    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250506    gcc-8.5.0
nios2                 randconfig-002-20250506    gcc-6.5.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250506    gcc-11.5.0
parisc                randconfig-002-20250506    gcc-5.5.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250506    clang-21
powerpc               randconfig-002-20250506    gcc-8.5.0
powerpc               randconfig-003-20250506    gcc-8.5.0
powerpc64             randconfig-001-20250506    clang-20
powerpc64             randconfig-002-20250506    gcc-8.5.0
powerpc64             randconfig-003-20250506    clang-18
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-16
riscv                 randconfig-001-20250506    clang-19
riscv                 randconfig-002-20250506    clang-21
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250506    gcc-9.3.0
s390                  randconfig-002-20250506    clang-21
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250506    gcc-12.4.0
sh                    randconfig-002-20250506    gcc-12.4.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250506    gcc-11.5.0
sparc                 randconfig-002-20250506    gcc-6.5.0
sparc64               randconfig-001-20250506    gcc-7.5.0
sparc64               randconfig-002-20250506    gcc-5.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250506    clang-17
um                    randconfig-002-20250506    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250506    clang-20
x86_64      buildonly-randconfig-002-20250506    gcc-12
x86_64      buildonly-randconfig-003-20250506    gcc-12
x86_64      buildonly-randconfig-004-20250506    clang-20
x86_64      buildonly-randconfig-005-20250506    clang-20
x86_64      buildonly-randconfig-006-20250506    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250506    gcc-13.3.0
xtensa                randconfig-002-20250506    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

