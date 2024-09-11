Return-Path: <linuxppc-dev+bounces-1258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2597576F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 17:46:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3lKW0PHzz2xYk;
	Thu, 12 Sep 2024 01:46:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726069567;
	cv=none; b=RbLVR7S7wWxb6hcR+zLLBTQDB/MPBp+X2D/5157YeysxlkdbOx1yG6vLkHtJlaTf7Alho8koLRPyI8Qanee2Bij3jkzEGbQzd3wQM93LTm31fcx/2X+nuZyaXxYR8P+AQN0Sf1S3V4bBh51vUZ1FHNq6fsRQC3Bq2QvGcKR+AYXB9X1aaoA9CFGO1kREDgIDn35HkUFcKhaxDjidxVLiJsR8lKbOylkfYScdZq0xivtPQcrxMPxmdUbBmgMYaDhfmnFlAnPDfkcRRMoA7nsnYQTXn2nUfq/8dtPwTMlCD7/Voy3rwqvg5TVQOIY5n9t5wxFoAXUw+HpFV3EzL+jxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726069567; c=relaxed/relaxed;
	bh=y/HdZIKg6zXEXoru7pMkPljaUZr2uTr33MtP9qTCtJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HMl+t/DjwpHK7CErtunleLTlRzhV0yq7cVMvLB1z6uhy3RYawefrVVF+fnLZ/S8DCDsNFVF/K9igYAPqpPCqJdoUpZLm5Mt2BED0HOmEIYx1U3XyiW8rLZ3VrzGWMTyrXEAppSh5eoz5LvuE3rE8hOWkENe/bM2xhSbKqbIGlQ2MOZRkbMQI7q81WZLJdVyco326+CRXeXA/lGiWpsN0ZWqHgMQbt/wTOH4xHYBOrrRDO8XbQJ2lYrSpC9y7KifW45Hv9uQALZqVi6bFAz9syGrT9UmL0ffylGNKQlwkqG75qdUxxJmqladgMPmSqWKmVc5G/Mi+pa8RSnNPReHM4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kXKg/G5+; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kXKg/G5+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3lKV2hrgz2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 01:46:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069566; x=1757605566;
  h=date:from:to:cc:subject:message-id;
  bh=bSb2qu8urxj0O/Vbpw0Fmt94123VlVvNpZ5PSpeOv8U=;
  b=kXKg/G5+rcWu530TB2/9aDcjSuo9u7LfHydZG6/9WeqQL3bR+D4h+Oyv
   rzKMxh4P3a70nQIwW4HE1rzhgOPL2pAR75aSwS9cpXl9NOWQu1JiKBg11
   MG/dNNVFvpIkz771KUq6wlp3evcD0KIsgb6DZbrHVS6+4mWeTkffKKRJk
   +2WkIc3Jaw06G13b52Hcfn5YEQ3X3RlbQUY29dRqDaIv55nnTHqeZ256F
   noTomRSvL6rll8067xClHZk8fNE+RvB+abEijwdSGvpHu2lHpGJGvL6Kd
   xdShLX/gEmkZsy+CurG8KAtw/+b1ABOJxlS8ataN4sgfIuVYSEaTVn3Lk
   w==;
X-CSE-ConnectionGUID: WB7KT2enRwi0f6SkaRMPnA==
X-CSE-MsgGUID: I+1ew6GxQ4CleD/AyJ+etw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42393672"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="42393672"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:46:02 -0700
X-CSE-ConnectionGUID: pVU32R8GTluov0IiRCPLLQ==
X-CSE-MsgGUID: /0Pai8bFSTO167kQ4zTRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72186083"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Sep 2024 08:46:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soPXa-0003mQ-2e;
	Wed, 11 Sep 2024 15:45:58 +0000
Date: Wed, 11 Sep 2024 23:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 d79fcc2d4d36f96aa4ed9959337788be86594fd8
Message-ID: <202409112303.hvu6hUNb-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: d79fcc2d4d36f96aa4ed9959337788be86594fd8  powerpc/vdso: Fix VDSO data access when running in a non-root time namespace

elapsed time: 1439m

configs tested: 194
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.3.0
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   clang-20
arc                                 defconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arc                   randconfig-001-20240911   gcc-13.2.0
arc                   randconfig-002-20240911   gcc-13.2.0
arm                              allmodconfig   clang-20
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                              allyesconfig   gcc-14.1.0
arm                     davinci_all_defconfig   clang-20
arm                                 defconfig   clang-14
arm                                 defconfig   gcc-14.1.0
arm                            mps2_defconfig   clang-20
arm                   randconfig-001-20240911   clang-20
arm                   randconfig-002-20240911   clang-20
arm                   randconfig-003-20240911   clang-20
arm                   randconfig-004-20240911   gcc-14.1.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
arm64                 randconfig-001-20240911   clang-20
arm64                 randconfig-002-20240911   clang-15
arm64                 randconfig-003-20240911   clang-20
arm64                 randconfig-004-20240911   clang-15
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-14.1.0
csky                  randconfig-001-20240911   gcc-14.1.0
csky                  randconfig-002-20240911   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
hexagon               randconfig-001-20240911   clang-20
hexagon               randconfig-002-20240911   clang-20
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-12
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-12
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-12
i386         buildonly-randconfig-001-20240911   clang-18
i386         buildonly-randconfig-002-20240911   gcc-12
i386         buildonly-randconfig-003-20240911   clang-18
i386         buildonly-randconfig-004-20240911   gcc-12
i386         buildonly-randconfig-005-20240911   gcc-12
i386         buildonly-randconfig-006-20240911   gcc-12
i386                                defconfig   clang-18
i386                  randconfig-001-20240911   gcc-12
i386                  randconfig-002-20240911   clang-18
i386                  randconfig-003-20240911   clang-18
i386                  randconfig-004-20240911   gcc-12
i386                  randconfig-005-20240911   gcc-12
i386                  randconfig-006-20240911   clang-18
i386                  randconfig-011-20240911   gcc-12
i386                  randconfig-012-20240911   gcc-12
i386                  randconfig-013-20240911   clang-18
i386                  randconfig-014-20240911   clang-18
i386                  randconfig-015-20240911   gcc-12
i386                  randconfig-016-20240911   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
loongarch             randconfig-001-20240911   gcc-14.1.0
loongarch             randconfig-002-20240911   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
microblaze                       alldefconfig   clang-20
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                         db1xxx_defconfig   clang-20
mips                  decstation_64_defconfig   clang-20
mips                 decstation_r4k_defconfig   clang-20
mips                          rb532_defconfig   clang-20
mips                          rm200_defconfig   clang-20
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
nios2                 randconfig-001-20240911   gcc-14.1.0
nios2                 randconfig-002-20240911   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240911   gcc-14.1.0
parisc                randconfig-002-20240911   gcc-14.1.0
parisc64                            defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                  iss476-smp_defconfig   clang-20
powerpc                     mpc512x_defconfig   clang-20
powerpc                      ppc64e_defconfig   clang-20
powerpc               randconfig-003-20240911   gcc-14.1.0
powerpc                 xes_mpc85xx_defconfig   clang-20
powerpc64             randconfig-001-20240911   clang-17
powerpc64             randconfig-002-20240911   clang-15
powerpc64             randconfig-003-20240911   gcc-14.1.0
riscv                            allmodconfig   clang-20
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   clang-20
riscv             nommu_k210_sdcard_defconfig   clang-20
riscv                 randconfig-001-20240911   gcc-14.1.0
riscv                 randconfig-002-20240911   gcc-14.1.0
s390                             allmodconfig   clang-20
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   clang-20
s390                  randconfig-001-20240911   gcc-14.1.0
s390                  randconfig-002-20240911   clang-20
s390                       zfcpdump_defconfig   clang-20
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-14.1.0
sh                               j2_defconfig   clang-20
sh                    randconfig-001-20240911   gcc-14.1.0
sh                    randconfig-002-20240911   gcc-14.1.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240911   gcc-14.1.0
sparc64               randconfig-002-20240911   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-17
um                                allnoconfig   clang-20
um                               allyesconfig   gcc-12
um                                  defconfig   clang-20
um                             i386_defconfig   gcc-12
um                    randconfig-001-20240911   clang-15
um                    randconfig-002-20240911   clang-20
um                           x86_64_defconfig   clang-15
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240911   clang-18
x86_64       buildonly-randconfig-002-20240911   clang-18
x86_64       buildonly-randconfig-003-20240911   gcc-12
x86_64       buildonly-randconfig-004-20240911   gcc-12
x86_64       buildonly-randconfig-005-20240911   gcc-12
x86_64       buildonly-randconfig-006-20240911   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-11
x86_64                randconfig-001-20240911   gcc-12
x86_64                randconfig-002-20240911   gcc-12
x86_64                randconfig-003-20240911   clang-18
x86_64                randconfig-004-20240911   clang-18
x86_64                randconfig-005-20240911   clang-18
x86_64                randconfig-006-20240911   gcc-12
x86_64                randconfig-011-20240911   clang-18
x86_64                randconfig-012-20240911   clang-18
x86_64                randconfig-013-20240911   gcc-12
x86_64                randconfig-014-20240911   clang-18
x86_64                randconfig-015-20240911   gcc-12
x86_64                randconfig-016-20240911   clang-18
x86_64                randconfig-071-20240911   clang-18
x86_64                randconfig-072-20240911   gcc-11
x86_64                randconfig-073-20240911   clang-18
x86_64                randconfig-074-20240911   clang-18
x86_64                randconfig-075-20240911   gcc-12
x86_64                randconfig-076-20240911   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-14.1.0
xtensa                  cadence_csp_defconfig   clang-20
xtensa                randconfig-001-20240911   gcc-14.1.0
xtensa                randconfig-002-20240911   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

