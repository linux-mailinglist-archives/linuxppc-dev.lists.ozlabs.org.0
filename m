Return-Path: <linuxppc-dev+bounces-1144-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC3A9701C1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 12:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X19324vqPz2yLg;
	Sat,  7 Sep 2024 20:54:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725706478;
	cv=none; b=PwfCihy9fD/Q4dXxgi4OWCD9sMQIVBORV5yQC8Cdzry03qPsIoZuQ/wgyRzrFPe6BGkFGPSA/uYl9/yUEp+IlFsTd5Y+SJYzWq9NCNzlFgBQ24FqwrDW+CPvrliyPVNLLzWxLFZKSAgRrEaQowlcgdwuI84h1N+5fDa+DPWygE2MSvJz//df8eqIXE8D7eqyJSUaeHlxXHW9rbg2LFBvWEYrkjkjNo3LvZLdERalGdHrivk0Zc0PYItyWURXmYDOz08hBtzLkWVn6wUPjnG+q3UDmRfGxLVyGCCz8vX0fAzIGC+l6pVEaYhHRSbkruZbXE7V+CEbLjylmibBpDscWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725706478; c=relaxed/relaxed;
	bh=ozDF7H5bVFtCgg1HH2NbiptsEaf5v3BRPlknRTm5faE=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID; b=Mn356zwE89JSwT1oZ7GqxUPx+EeE3gwT042Z9dtkSm7N3aorutK3RGx9szyX9P8pJmT4U0PsBs31HEAdB5hQ60GFiEjMrdNT3hqhcN2r6B9Ksd5lie5FHLpPpFu6i5eCqaBxLVGdUCQPDk9t1rNoqNF7mWmRhn3bMxlM0OpMXOxT219ByyjmNwBs7YiABLPbHFR8Z/E0zDr2JE86ga+rKMzyldBEACPHddm1rdvQQ2kVaK2vjCgIRn46NBQbSORt51JO/uneXpNG0G1bRI6gA6RB5He0cTIB07eiETjO7/eXEgOlQL00Qwu+7SvoCxNnEZomQ6l7ji/YvCPJoP+uQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B7G6oO6y; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B7G6oO6y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X19310bTQz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 20:54:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725706478; x=1757242478;
  h=date:from:to:cc:subject:message-id;
  bh=5GiqdXAOmGnnLUVtMfS5KGJfTOm5P2y/hnJTFj25Cno=;
  b=B7G6oO6yGIGRN8scTaXNp38qN/pSl25z+e0ziXX5MCTjh/g9/MX4ZuwK
   4Y7t61aFaBiZk1LoZC2AQf2obShKIoU0LEgTT3CTjIIePZim9VQJwEGhx
   Ms30o0UvTmcjul6n8UC/PpHEz072nGLMMnXieeATOyJrZHFB5J2S8/ore
   HGbRjF9n35fntNNIYuq8nB8UgIjwwCPR1w/B5tnFdpYZtdGGgDuKD6ytE
   Z9RfqDxZS1AGawuWlYXE5Pk7XwWfLGxzAlHCAC1Ia7nXn+NCp1bVKPh49
   t7OiFT8Beod2cnuUcLXfkaNkxvGovaUBSORjFkRsJDg4Eb7G+z4jP2AlM
   A==;
X-CSE-ConnectionGUID: PHhmPbUyT7iklUMF65ljBw==
X-CSE-MsgGUID: Am4jfkiaQh6Bq9gTGxeWJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35601862"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35601862"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 03:54:31 -0700
X-CSE-ConnectionGUID: rSmdDNFsTa620R5D6zu+6A==
X-CSE-MsgGUID: YnPqgap2S/2wsdv1AfBcDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="65986404"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2024 03:54:30 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smt5H-000CSL-18;
	Sat, 07 Sep 2024 10:54:27 +0000
Date: Sat, 07 Sep 2024 18:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 a5a670df1db79f4bb462601aa4cc03caffa761a2
Message-ID: <202409071857.4XArMArX-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: a5a670df1db79f4bb462601aa4cc03caffa761a2  macintosh/via-pmu: register_pmu_pm_ops() can be __init

elapsed time: 1417m

configs tested: 134
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                                 defconfig   gcc-14.1.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                                 defconfig   gcc-14.1.0
arm                        neponset_defconfig   clang-15
arm                          pxa168_defconfig   clang-15
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240907   gcc-12
i386         buildonly-randconfig-002-20240907   gcc-12
i386         buildonly-randconfig-003-20240907   gcc-12
i386         buildonly-randconfig-004-20240907   gcc-12
i386         buildonly-randconfig-005-20240907   gcc-12
i386         buildonly-randconfig-006-20240907   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240907   gcc-12
i386                  randconfig-002-20240907   gcc-12
i386                  randconfig-003-20240907   gcc-12
i386                  randconfig-004-20240907   gcc-12
i386                  randconfig-005-20240907   gcc-12
i386                  randconfig-006-20240907   gcc-12
i386                  randconfig-011-20240907   gcc-12
i386                  randconfig-012-20240907   gcc-12
i386                  randconfig-013-20240907   gcc-12
i386                  randconfig-014-20240907   gcc-12
i386                  randconfig-015-20240907   gcc-12
i386                  randconfig-016-20240907   gcc-12
loongarch                        alldefconfig   clang-15
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                          atari_defconfig   clang-15
m68k                                defconfig   gcc-14.1.0
m68k                        m5407c3_defconfig   clang-15
m68k                       m5475evb_defconfig   clang-15
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                        vocore2_defconfig   clang-15
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                      cm5200_defconfig   clang-15
powerpc                       eiger_defconfig   clang-15
powerpc                  iss476-smp_defconfig   clang-15
powerpc                         ps3_defconfig   clang-15
powerpc                     tqm8555_defconfig   clang-15
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
riscv             nommu_k210_sdcard_defconfig   clang-15
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                               j2_defconfig   clang-15
sh                           se7750_defconfig   clang-15
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   clang-15
um                             i386_defconfig   gcc-12
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240907   gcc-12
x86_64       buildonly-randconfig-002-20240907   gcc-12
x86_64       buildonly-randconfig-003-20240907   gcc-12
x86_64       buildonly-randconfig-004-20240907   gcc-12
x86_64       buildonly-randconfig-005-20240907   gcc-12
x86_64       buildonly-randconfig-006-20240907   gcc-12
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                randconfig-001-20240907   gcc-12
x86_64                randconfig-002-20240907   gcc-12
x86_64                randconfig-003-20240907   gcc-12
x86_64                randconfig-004-20240907   gcc-12
x86_64                randconfig-005-20240907   gcc-12
x86_64                randconfig-006-20240907   gcc-12
x86_64                randconfig-011-20240907   gcc-12
x86_64                randconfig-012-20240907   gcc-12
x86_64                randconfig-013-20240907   gcc-12
x86_64                randconfig-014-20240907   gcc-12
x86_64                randconfig-015-20240907   gcc-12
x86_64                randconfig-016-20240907   gcc-12
x86_64                randconfig-071-20240907   gcc-12
x86_64                randconfig-072-20240907   gcc-12
x86_64                randconfig-073-20240907   gcc-12
x86_64                randconfig-074-20240907   gcc-12
x86_64                randconfig-075-20240907   gcc-12
x86_64                randconfig-076-20240907   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

