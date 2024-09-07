Return-Path: <linuxppc-dev+bounces-1145-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 860EC9701F6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2024 13:43:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1B7h29Bwz2yDk;
	Sat,  7 Sep 2024 21:43:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725709424;
	cv=none; b=c1b38g92v/et6gpvdCR6Pox+Ryycf+9+W+4jk5jKnyCt2gPFxhBwAcYI92TLJDESGOx5hv9wEMqbpO5Ye8CZpd+T/IoDPb/thce52VuWfnvH5jwitfv8fQW6cxFfkXfGXaSXcJGvS7TI9OdRPKC5CrVqTBbRi475CzXQFJ9N0oN6jkk6IPYkvOIDbksje8veRza+r3qysCsr7WVLq20zymyeBdLtaay1Zq+Kvz7K9IR12kC0xWEzFBBiot67VlTTYX9TtOu5MCSKVxDJWXTyggUH7qzt2B7xPZeeP9fBiAxefez68tPbnzru18NVOWGV1KF8ZvuAX3MMLAA7MlC8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725709424; c=relaxed/relaxed;
	bh=RvuMVvwQtyBFO/Molap8u4ZjUJZ3YPjhFRGjogWQVJs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID; b=eopHdGLJRKSsZvU8tV5w2POZe9jR/6U+WNUauVq7rTBsOh6E+Ry9eS/oXaH3J4P6s3U+G3L7CZce1aSgUTRcuY7S4uYIUMgHBLBL8sr1yrVn5yQZj2yUwSCz+bY6Ewh2QLt6YcHAlfe/wfRgNM7JSo7lC62cIQtw2vVjhnWyOCKGbQsgquodqP5jJPG8QqeCH0if7J4TsPpUJnIqIHrYSYYceXVxm8FxtG/G8ooKsttT+7am9GYbw8gigjrT8u+muEsMigp8lqHLr5QsYmfp9dtcy645DF6oLyZo8fJ0ZFP8NrAjQDcDLRUA9erhPazvgG2ZyGmDW9tcyXXBBMB69w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cl43R46T; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cl43R46T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1B7f3P38z2y6G
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 21:43:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725709423; x=1757245423;
  h=date:from:to:cc:subject:message-id;
  bh=bE12JE0pjimuz9DCUuslR3jaok/vnHPcbXu9hC6InaU=;
  b=Cl43R46TO5QOV2oD/hfoy411GMacq+V+J0AnYL6TSQquG8IDmQOk9XOs
   jBpPVbWrMrvMzp7ZTEnm1TJERVPbgjIVx9gzZnmt1CMZa3MmwYN0W470m
   LGIgVWhl6GbMyxoXTndWXNdzuf1aqZTW+B/KS5f+b3z44oISPnrBQIje0
   KL4l1/hUMVUl2U4eRG/4fkYBn3GR0d8JuNH3dyNnd5Z+opLemeHxOWbTt
   KSE2ryytuw7zvRpKt8cIJyoqcj0X9DZeTYjhkS5uZ04GrW7QU4UvsyAgK
   GdxOC+iDW9qQYb5WUg4thDrILAV7O8yK2rt4Wcw3dk5cG7o2bqHco57L1
   g==;
X-CSE-ConnectionGUID: D/aYNZxlTVSxb0ZV28IReQ==
X-CSE-MsgGUID: e7ZfU7h4Q0OQHgJXv4TFfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28339951"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="28339951"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:43:37 -0700
X-CSE-ConnectionGUID: NvqhlQmaQBCora1K7Duu4w==
X-CSE-MsgGUID: FG0jZLyzQB+uXDnrhZv6oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="65841213"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2024 04:43:35 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smtqn-000CWJ-2f;
	Sat, 07 Sep 2024 11:43:33 +0000
Date: Sat, 07 Sep 2024 19:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 56e2adc93b44956d70cf304524567a223842ec39
Message-ID: <202409071958.odey3UQk-lkp@intel.com>
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
branch HEAD: 56e2adc93b44956d70cf304524567a223842ec39  Automatic merge of 'next' into merge (2024-09-06 20:41)

elapsed time: 1467m

configs tested: 129
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
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
hexagon                           allnoconfig   gcc-14.1.0
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
um                                allnoconfig   clang-20
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

