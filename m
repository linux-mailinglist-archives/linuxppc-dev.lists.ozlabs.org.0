Return-Path: <linuxppc-dev+bounces-10277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF5B08427
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 06:52:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjLBp0BK1z2yDk;
	Thu, 17 Jul 2025 14:52:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752727953;
	cv=none; b=PtoBttpEOfcNrTIKJFmsHaufWYwwYpBXvTzNRzSRixNL0AbAOZWxUxo06f9H47Y2c/Xysr/QCDdqoYaaCDWcxfnp5Z+3fCc3QatkZn2OOnPt5ZvHqmbZsfU6wXYJBNfTz2eq6eOVouYZG4+gk5GL9XvZOKWI0/wErglTx9iudZJpevV/blwzRvZ8o1YkG9YAhyLbSHyvVUknHRLYKhC7VoxwDbiWkV3ZunDggC6uT5FVM73g7lmigoSaUe/vRbj7J64BsRgvzIKFoMYL4RDayDNIVJ8YYP7KpaqNpp9G0cBlQT2jFWF11fepN/iYXhfoqgMJeLbGIC104F81QDheBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752727953; c=relaxed/relaxed;
	bh=lfk+B5/Jqvp11k0DLC0Yok4lGAo+3/cU4hDzVoaSbos=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MC4aJf7b1xDwtNWPmzVgSU4G2eQ95A3UKy79jWECl8g6/0xMa6CRpDQucM/KTV2L/OFFuUakq0eMvru7Tn1aBcHJnemjmTLwn0erA9LGaPZA2mm8nNjVmXSsr7DKncnSr6Bh+2A9iprBC9TJCg5ZydI/BRwmkuPMJ6mVFOz5ik1WSy/ZZNH9MgLNJu3861MiXGf0GZd6QZjRE0S39yB11ulwTJt9ShknS1IeGn90xra1cwYqfBESKp8TiOJBfgjDGpxKzym+XntOr+EbgcnHYhjNJOJwx/kp9erxO9RIF9FGV/DiuF3+JZmPv9HQQP3GO1uRtzRuKOYHrH8pTZGnAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9goMM/X; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g9goMM/X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjLBl3Mygz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 14:52:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752727951; x=1784263951;
  h=date:from:to:cc:subject:message-id;
  bh=sXVZM6ygY7vBmSVWI8QQY3uvE4udAlMus6rjvTnBBNM=;
  b=g9goMM/XDKI7YtbUN+Uya0cBoqM/aRI8t6Ud24vPaSkyDvYBiXbrp+j4
   PdmiVQi5gDhwiYMRqLPDYQjIzzX3Ldiov+RaMct0zojls9qFKM4HTDADc
   L/tMnCYH9L0dxgX5DnhtCIcM9nU3eDX4OOXAWzYnjIZ2LWCQlCQOy53Nm
   aeMt4M/pQXpK8Gxk5ATZeAIXfzI579J8tvDHdm5hbcLNYiJ7KHunKtCoR
   ZaW9Kym4mEe27/KP7GLcdheyL7yODev9Vtm7EWjeQn/myGuPUJJD38EJi
   UHFF9U0TpJeIh9PHDyCfIIUFOqXoxiPTtvdgIl2HJdWswPdkJFXusFpDV
   w==;
X-CSE-ConnectionGUID: IaQqbKaYQ6+saP4hmuJi+A==
X-CSE-MsgGUID: oXEPPOxJR/e5A0VtI2kq3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="80436964"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="80436964"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 21:52:26 -0700
X-CSE-ConnectionGUID: EI63fUpISNu84NPj+klWzQ==
X-CSE-MsgGUID: +ezh8p+2QGq2mBYWCBJpkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; 
   d="scan'208";a="157087530"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jul 2025 21:52:25 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucGbW-000D9r-03;
	Thu, 17 Jul 2025 04:52:22 +0000
Date: Thu, 17 Jul 2025 12:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 8046db6cd84fc6a160a8fe6844de36236585167b
Message-ID: <202507171225.3PvvbUs7-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 8046db6cd84fc6a160a8fe6844de36236585167b  Automatic merge of 'next' into merge (2025-07-16 09:31)

elapsed time: 1451m

configs tested: 243
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-21
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-21
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                         haps_hs_defconfig    gcc-15.1.0
arc                            hsdk_defconfig    gcc-15.1.0
arc                   randconfig-001-20250716    gcc-13.4.0
arc                   randconfig-001-20250717    clang-21
arc                   randconfig-002-20250716    gcc-8.5.0
arc                   randconfig-002-20250717    clang-21
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                           omap1_defconfig    gcc-15.1.0
arm                   randconfig-001-20250716    clang-20
arm                   randconfig-001-20250717    clang-21
arm                   randconfig-002-20250716    gcc-12.4.0
arm                   randconfig-002-20250717    clang-21
arm                   randconfig-003-20250716    gcc-8.5.0
arm                   randconfig-003-20250717    clang-21
arm                   randconfig-004-20250716    gcc-8.5.0
arm                   randconfig-004-20250717    clang-21
arm                             rpc_defconfig    clang-21
arm                           sama5_defconfig    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-21
arm64                               defconfig    clang-19
arm64                 randconfig-001-20250716    gcc-9.5.0
arm64                 randconfig-001-20250717    clang-21
arm64                 randconfig-002-20250716    gcc-8.5.0
arm64                 randconfig-002-20250717    clang-21
arm64                 randconfig-003-20250716    gcc-8.5.0
arm64                 randconfig-003-20250717    clang-21
arm64                 randconfig-004-20250716    clang-21
arm64                 randconfig-004-20250717    clang-21
csky                              allnoconfig    clang-21
csky                                defconfig    clang-19
csky                  randconfig-001-20250716    gcc-14.3.0
csky                  randconfig-001-20250717    gcc-12.4.0
csky                  randconfig-002-20250716    gcc-15.1.0
csky                  randconfig-002-20250717    gcc-12.4.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20250716    clang-21
hexagon               randconfig-001-20250717    gcc-12.4.0
hexagon               randconfig-002-20250716    clang-21
hexagon               randconfig-002-20250717    gcc-12.4.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250716    gcc-12
i386        buildonly-randconfig-001-20250717    clang-20
i386        buildonly-randconfig-002-20250716    clang-20
i386        buildonly-randconfig-002-20250717    clang-20
i386        buildonly-randconfig-003-20250716    gcc-12
i386        buildonly-randconfig-003-20250717    clang-20
i386        buildonly-randconfig-004-20250716    gcc-11
i386        buildonly-randconfig-004-20250717    clang-20
i386        buildonly-randconfig-005-20250716    gcc-12
i386        buildonly-randconfig-005-20250717    clang-20
i386        buildonly-randconfig-006-20250716    clang-20
i386        buildonly-randconfig-006-20250717    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250717    gcc-12
i386                  randconfig-002-20250717    gcc-12
i386                  randconfig-003-20250717    gcc-12
i386                  randconfig-004-20250717    gcc-12
i386                  randconfig-005-20250717    gcc-12
i386                  randconfig-006-20250717    gcc-12
i386                  randconfig-007-20250717    gcc-12
i386                  randconfig-011-20250717    gcc-12
i386                  randconfig-012-20250717    gcc-12
i386                  randconfig-013-20250717    gcc-12
i386                  randconfig-014-20250717    gcc-12
i386                  randconfig-015-20250717    gcc-12
i386                  randconfig-016-20250717    gcc-12
i386                  randconfig-017-20250717    gcc-12
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20250716    clang-18
loongarch             randconfig-001-20250717    gcc-12.4.0
loongarch             randconfig-002-20250716    clang-21
loongarch             randconfig-002-20250717    gcc-12.4.0
m68k                             allmodconfig    clang-19
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                           xway_defconfig    clang-21
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-14.2.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250716    gcc-14.2.0
nios2                 randconfig-001-20250717    gcc-12.4.0
nios2                 randconfig-002-20250716    gcc-11.5.0
nios2                 randconfig-002-20250717    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
openrisc                    or1ksim_defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250716    gcc-8.5.0
parisc                randconfig-001-20250717    gcc-12.4.0
parisc                randconfig-002-20250716    gcc-8.5.0
parisc                randconfig-002-20250717    gcc-12.4.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                        icon_defconfig    clang-21
powerpc                      mgcoge_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    clang-21
powerpc               randconfig-001-20250716    gcc-8.5.0
powerpc               randconfig-001-20250717    gcc-12.4.0
powerpc               randconfig-002-20250716    clang-21
powerpc               randconfig-002-20250717    gcc-12.4.0
powerpc               randconfig-003-20250716    gcc-14.3.0
powerpc               randconfig-003-20250717    gcc-12.4.0
powerpc64             randconfig-001-20250716    gcc-10.5.0
powerpc64             randconfig-001-20250717    gcc-12.4.0
powerpc64             randconfig-002-20250717    gcc-12.4.0
powerpc64             randconfig-003-20250716    gcc-13.4.0
powerpc64             randconfig-003-20250717    gcc-12.4.0
riscv                             allnoconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250716    gcc-8.5.0
riscv                 randconfig-001-20250717    gcc-13.4.0
riscv                 randconfig-002-20250716    gcc-11.5.0
riscv                 randconfig-002-20250717    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250716    gcc-11.5.0
s390                  randconfig-001-20250717    gcc-13.4.0
s390                  randconfig-002-20250716    gcc-11.5.0
s390                  randconfig-002-20250717    gcc-13.4.0
s390                       zfcpdump_defconfig    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                          r7780mp_defconfig    gcc-15.1.0
sh                    randconfig-001-20250716    gcc-15.1.0
sh                    randconfig-001-20250717    gcc-13.4.0
sh                    randconfig-002-20250716    gcc-14.3.0
sh                    randconfig-002-20250717    gcc-13.4.0
sh                   sh7724_generic_defconfig    clang-21
sparc                            alldefconfig    clang-21
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250716    gcc-8.5.0
sparc                 randconfig-001-20250717    gcc-13.4.0
sparc                 randconfig-002-20250716    gcc-14.3.0
sparc                 randconfig-002-20250717    gcc-13.4.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250716    clang-20
sparc64               randconfig-001-20250717    gcc-13.4.0
sparc64               randconfig-002-20250716    clang-21
sparc64               randconfig-002-20250717    gcc-13.4.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250716    gcc-11
um                    randconfig-001-20250717    gcc-13.4.0
um                    randconfig-002-20250716    gcc-12
um                    randconfig-002-20250717    gcc-13.4.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250716    gcc-12
x86_64      buildonly-randconfig-001-20250717    gcc-12
x86_64      buildonly-randconfig-002-20250716    clang-20
x86_64      buildonly-randconfig-002-20250717    gcc-12
x86_64      buildonly-randconfig-003-20250716    clang-20
x86_64      buildonly-randconfig-003-20250717    gcc-12
x86_64      buildonly-randconfig-004-20250716    clang-20
x86_64      buildonly-randconfig-004-20250717    gcc-12
x86_64      buildonly-randconfig-005-20250716    clang-20
x86_64      buildonly-randconfig-005-20250717    gcc-12
x86_64      buildonly-randconfig-006-20250716    gcc-12
x86_64      buildonly-randconfig-006-20250717    gcc-12
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250717    gcc-11
x86_64                randconfig-002-20250717    gcc-11
x86_64                randconfig-003-20250717    gcc-11
x86_64                randconfig-004-20250717    gcc-11
x86_64                randconfig-005-20250717    gcc-11
x86_64                randconfig-006-20250717    gcc-11
x86_64                randconfig-007-20250717    gcc-11
x86_64                randconfig-008-20250717    gcc-11
x86_64                randconfig-071-20250717    gcc-12
x86_64                randconfig-072-20250717    gcc-12
x86_64                randconfig-073-20250717    gcc-12
x86_64                randconfig-074-20250717    gcc-12
x86_64                randconfig-075-20250717    gcc-12
x86_64                randconfig-076-20250717    gcc-12
x86_64                randconfig-077-20250717    gcc-12
x86_64                randconfig-078-20250717    gcc-12
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  cadence_csp_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250716    gcc-9.3.0
xtensa                randconfig-001-20250717    gcc-13.4.0
xtensa                randconfig-002-20250716    gcc-13.4.0
xtensa                randconfig-002-20250717    gcc-13.4.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

