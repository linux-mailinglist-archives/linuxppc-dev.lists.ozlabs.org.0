Return-Path: <linuxppc-dev+bounces-1451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2E497C3BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 07:02:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ng30d9dz2yDg;
	Thu, 19 Sep 2024 15:02:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726722143;
	cv=none; b=DlD4487RsQKjNKl4zZa0IRbynFw7EZEesqd1Y1HMP6OjnVLQr5/QmHz5zMdTaayFUri6r90Lqj9aPR0C+Le3mDzZPyiJeckX39JllaiQ1m4h7R5bExlwb4WGE9skwyUXK2RbpwzaZoZ2wUQ+ik0ZLoTQ/0j8qmakLU5MEvxbWmIyK/RU3PioTpv2V105tPHUK+O9T6VHhdUhX9Dsv/6PQ7yyTO5bVrqy/7maGHF/1ktvrozqo1F3xI/5T66Bud4ypSTfxH18rRDB20+QMalNhQzczI12D/2lRlFhzCDSnmQ/ZXddE5VWnZ1rDxSiEXrERg0x0CuVT+v55afxh0qXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726722143; c=relaxed/relaxed;
	bh=duBcLbyXPyTs+Z2U4FjffLUbBch3xZ6j/xeBAdRq5fA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T5JbTNO12UwEn8mIPHOw9Rb8JJasr4WguDhDgEFdSxTBCFkAKMOsEPPoPuB0VwebeZkWtudkgtx0PNanqrrDO4B6iIRfWalARbI8ufuOyF/cZJxlNbGRu3/IhsvvydnWWl0fdrQx21WDsYBedxpeRzJeKN4vyMI3SVRsBwMJ5dt2iLhSL/RQ/G9nL1nE8SQ4Vt4iRWef9lhYr6A4Q0ZUuxW7GPmp7OpxGken0/8fPJT9cLNLH2B//8NnEm1F6TBGEXZixUONyGxDDov3OocObBcksU0hPXGyu1g974EDSfkckQKvUBflEv1uJ5dYA6MfTYa6dHXJOYakBWUo5DXHvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iegBVUgX; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iegBVUgX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ng1348qz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 15:02:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726722142; x=1758258142;
  h=date:from:to:cc:subject:message-id;
  bh=H5F0/4Btkh31Vvx/BX54WK5kkfMn64oK60cRy1yzcdU=;
  b=iegBVUgXR2poet5rznSKib8iY6lFg2l5c+Qq1JWeptSEf4XDpovq75do
   eQAkIQS+e+9vNbixIsromZneW+bS6uyhsOxlSqZzR8g+iKOWQkEXgh5tj
   0+5mMGBvssJYz2xP3S6zR8jRjv0M2OsqA5FRp7Z6sQZbLNU1NEaNedpLO
   rApyhbHKldtZDs7shdy80T50lpW9blcBdPlmiMIJ+vhmyvG5vLD3aKarF
   syiuh+16iuEMAHLWmnrOWD+QWC4UD/e1zVnRDaO7Zg5nRPqPOUue9fgcr
   1V9ouxbwy+GL2fVp4PN02PiBFYBqT7/J/Rd0Cy2xbS/Dl+50lOYOzBiH7
   g==;
X-CSE-ConnectionGUID: 8D3G+nnIREe1repZi5rZpw==
X-CSE-MsgGUID: YZjTagZrQ6GJNtfcq6GuVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25606610"
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="25606610"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 22:02:16 -0700
X-CSE-ConnectionGUID: 8nj1f1BnQl2Rk08kPL10rg==
X-CSE-MsgGUID: gA0zgIF1SPGAkdlK4a80Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,240,1719903600"; 
   d="scan'208";a="69829235"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Sep 2024 22:02:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sr9Iy-000Cwu-0g;
	Thu, 19 Sep 2024 05:02:12 +0000
Date: Thu, 19 Sep 2024 13:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 93a0594106c7caa79e118776eb9859ecc7993c7a
Message-ID: <202409191325.Y22FmdeL-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 93a0594106c7caa79e118776eb9859ecc7993c7a  Automatic merge of 'next' into merge (2024-09-17 22:19)

elapsed time: 2400m

configs tested: 106
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                            allyesconfig    gcc-13.3.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                      axs103_smp_defconfig    gcc-13.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20240919    gcc-13.2.0
arc                   randconfig-002-20240919    gcc-13.2.0
arm                               allnoconfig    clang-20
arm                              allyesconfig    gcc-14.1.0
arm                      footbridge_defconfig    clang-20
arm                   randconfig-001-20240919    clang-20
arm                   randconfig-002-20240919    clang-20
arm                   randconfig-003-20240919    clang-20
arm                   randconfig-004-20240919    clang-20
arm                           sama5_defconfig    gcc-14.1.0
arm                       versatile_defconfig    gcc-14.1.0
arm64                             allnoconfig    gcc-14.1.0
arm64                 randconfig-001-20240919    gcc-14.1.0
arm64                 randconfig-002-20240919    clang-15
arm64                 randconfig-003-20240919    clang-20
arm64                 randconfig-004-20240919    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                  randconfig-001-20240919    gcc-14.1.0
csky                  randconfig-002-20240919    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20240919    clang-20
hexagon               randconfig-002-20240919    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240918    clang-18
i386        buildonly-randconfig-002-20240918    gcc-12
i386        buildonly-randconfig-003-20240918    gcc-12
i386        buildonly-randconfig-004-20240918    gcc-12
i386        buildonly-randconfig-005-20240918    clang-18
i386        buildonly-randconfig-006-20240918    gcc-12
i386                                defconfig    clang-18
i386                  randconfig-001-20240918    clang-18
i386                  randconfig-002-20240918    clang-18
i386                  randconfig-003-20240918    clang-18
i386                  randconfig-004-20240918    gcc-12
i386                  randconfig-005-20240918    gcc-12
i386                  randconfig-006-20240918    clang-18
i386                  randconfig-011-20240918    gcc-12
i386                  randconfig-012-20240918    clang-18
i386                  randconfig-013-20240918    gcc-12
i386                  randconfig-014-20240918    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch             randconfig-001-20240919    gcc-14.1.0
loongarch             randconfig-002-20240919    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          multi_defconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                          ath25_defconfig    clang-20
mips                  decstation_64_defconfig    gcc-13.2.0
mips                           ip32_defconfig    clang-20
mips                malta_qemu_32r6_defconfig    gcc-13.2.0
nios2                             allnoconfig    gcc-14.1.0
nios2                 randconfig-001-20240919    gcc-14.1.0
nios2                 randconfig-002-20240919    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-14.1.0
parisc                           alldefconfig    gcc-14.1.0
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                     asp8347_defconfig    clang-17
powerpc                       eiger_defconfig    clang-20
powerpc                          g5_defconfig    gcc-14.1.0
powerpc                     tqm8541_defconfig    clang-15
riscv                             allnoconfig    gcc-14.1.0
riscv                               defconfig    clang-20
s390                             allmodconfig    clang-20
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    clang-20
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                           rhel-8.3-bpf    gcc-12
x86_64                         rhel-8.3-kunit    gcc-12
x86_64                           rhel-8.3-ltp    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

