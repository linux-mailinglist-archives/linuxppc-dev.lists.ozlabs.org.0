Return-Path: <linuxppc-dev+bounces-9387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F35ABADA442
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 00:03:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bL6bY6Xkrz2xHv;
	Mon, 16 Jun 2025 08:03:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750025033;
	cv=none; b=mSTwXbJIB78YTEdDi1LCdXx5q5734xxcUpVpidwmcTYKT+WSEAw82uSGnl5h9Zl3xu+dQvfkY83o6EnY8jjjdkk9ff/2JDDcFqYMQgonLZ0/PsGp60NUHPbLNlw2huGlaQpDPbxR9iFGuvX9YzZeoIVkF0SEyVp5onD2++GX9rXPYev7AcYOxt4xHd8X1ZLolYzXN62Nnsc4uZ1OQIIHMaMDliHZrud95dMCx7KwyD2LhyxvAppUng37fR0jHrsnGFYhzWobX1EgwRWy0M23Mxs7Z90sFfPBvwCzF61UeHhyp3C/jnXODqeIOrIU6aqJrUIyedisFV6PWEDzLUz5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750025033; c=relaxed/relaxed;
	bh=8VtQf34tF81kJrxGrJxRX2euuAlUg2/rIUi3Q69h/I0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ov2yl3ph3gPn3JZrFVvSNB/aFHzahEESS9Alw/bPqx16L5rpiFYW667Hi91dmQHX0AH21vF+cZcUEC9twRfu0I2MatDmGVsORIPHJ748wAOpD5Gq66oiiFkuf2OHPePVnqr9yo5ruLRCQ8nd4I6XyT9PoVedLhWX8NQGmcRUbqpYESbR2/naBvCTEdZcOsSp44nGnbGXZzNjf7GNaRWG/1rLHfZo0XdEpbT1LiwwFsGV9dlukMea7N/07VE71MBL+YmAkDyvHiLcrFLPB6l39caKeAvBzhUWMvhNfyG/KON5lroGGHnChAQ3Or/19HEwUK+LpQkRI5R3ppkLlne2kA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aw7xFgbq; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aw7xFgbq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bL6bW2yfyz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 08:03:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750025031; x=1781561031;
  h=date:from:to:cc:subject:message-id;
  bh=D9XcOINzM0uGcd5Azz0PJaKdELWuWmaSDlW2LRQCPUE=;
  b=aw7xFgbqkvKtvqjBjTblpvYMbSeIuzrk4QQGNUpMj5PX6me6St5VOWEu
   IVnq/Y42IKWj54LaYuDUFlkR3VJ1/IlYtUQFJgyKb1S1915E4omWH/zsK
   X0Dek9sCw1FjOsJIFH7RRh3bJRhzgRyOoW2+bjThP3iSAnwW9vJ7F8mfO
   56UgEhf+A6TADlfeWZq6jdMcRdd+1WsKsP0uPQQ3AWizH8M6kI/SDnile
   lyQcFJh3N7TSZScCp25y6b1uPIGZUH4sr3mfYxggI2gCK8Fya5ErZWXLM
   rSrCi4kbcCZjRoOC0fQ413inq02U6hYBtA0mrgBDOEUQzdleRJ0jtBtS2
   Q==;
X-CSE-ConnectionGUID: 7YCbcC2TTmCJNs2dl66HOw==
X-CSE-MsgGUID: JkfDvgPRQTGaYNV/l55AsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51275211"
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="51275211"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 15:03:46 -0700
X-CSE-ConnectionGUID: beGXEE/iS+W//PXC2I32Sg==
X-CSE-MsgGUID: vo0EPivLTy27ZtP2lFnRTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,239,1744095600"; 
   d="scan'208";a="171509442"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jun 2025 15:03:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQvS3-000EZI-2X;
	Sun, 15 Jun 2025 22:03:43 +0000
Date: Mon, 16 Jun 2025 06:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 33e1e70809f236800d22617095ae221e28d7b382
Message-ID: <202506160656.cFIPQrdx-lkp@intel.com>
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
branch HEAD: 33e1e70809f236800d22617095ae221e28d7b382  Automatic merge of 'fixes' into merge (2025-06-15 08:01)

elapsed time: 1097m

configs tested: 147
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              alldefconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250615    gcc-12.4.0
arc                   randconfig-002-20250615    gcc-10.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                         bcm2835_defconfig    clang-21
arm                                 defconfig    clang-21
arm                          gemini_defconfig    clang-20
arm                      integrator_defconfig    clang-21
arm                             mxs_defconfig    clang-21
arm                            qcom_defconfig    clang-21
arm                   randconfig-001-20250615    clang-16
arm                   randconfig-002-20250615    clang-21
arm                   randconfig-003-20250615    gcc-8.5.0
arm                   randconfig-004-20250615    clang-21
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250615    clang-16
arm64                 randconfig-002-20250615    gcc-9.5.0
arm64                 randconfig-003-20250615    gcc-12.3.0
arm64                 randconfig-004-20250615    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250615    gcc-14.3.0
csky                  randconfig-002-20250615    gcc-10.5.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250615    clang-21
hexagon               randconfig-002-20250615    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250615    gcc-12
i386        buildonly-randconfig-002-20250615    gcc-12
i386        buildonly-randconfig-003-20250615    gcc-12
i386        buildonly-randconfig-004-20250615    clang-20
i386        buildonly-randconfig-005-20250615    gcc-12
i386        buildonly-randconfig-006-20250615    gcc-12
i386                                defconfig    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch             randconfig-001-20250615    gcc-15.1.0
loongarch             randconfig-002-20250615    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        mvme16x_defconfig    gcc-15.1.0
m68k                           virt_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                       bmips_be_defconfig    gcc-15.1.0
mips                   sb1250_swarm_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250615    gcc-8.5.0
nios2                 randconfig-002-20250615    gcc-12.4.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                generic-32bit_defconfig    gcc-15.1.0
parisc                randconfig-001-20250615    gcc-14.3.0
parisc                randconfig-002-20250615    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc                     mpc5200_defconfig    clang-21
powerpc                      ppc64e_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250615    gcc-8.5.0
powerpc               randconfig-002-20250615    clang-21
powerpc               randconfig-003-20250615    gcc-10.5.0
powerpc64             randconfig-001-20250615    gcc-15.1.0
powerpc64             randconfig-002-20250615    gcc-15.1.0
powerpc64             randconfig-003-20250615    gcc-8.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv             nommu_k210_sdcard_defconfig    gcc-15.1.0
riscv                 randconfig-001-20250615    clang-21
riscv                 randconfig-002-20250615    gcc-14.3.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250615    gcc-12.4.0
s390                  randconfig-002-20250615    clang-21
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                               j2_defconfig    gcc-15.1.0
sh                    randconfig-001-20250615    gcc-15.1.0
sh                    randconfig-002-20250615    gcc-9.3.0
sh                           se7751_defconfig    gcc-15.1.0
sh                   secureedge5410_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250615    gcc-8.5.0
sparc                 randconfig-002-20250615    gcc-8.5.0
sparc                       sparc64_defconfig    gcc-15.1.0
sparc64                             defconfig    gcc-15.1.0
sparc64               randconfig-001-20250615    gcc-15.1.0
sparc64               randconfig-002-20250615    gcc-14.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250615    clang-21
um                    randconfig-002-20250615    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250615    clang-20
x86_64      buildonly-randconfig-002-20250615    clang-20
x86_64      buildonly-randconfig-003-20250615    gcc-12
x86_64      buildonly-randconfig-004-20250615    clang-20
x86_64      buildonly-randconfig-005-20250615    clang-20
x86_64      buildonly-randconfig-006-20250615    clang-20
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-18
xtensa                            allnoconfig    gcc-15.1.0
xtensa                  audio_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250615    gcc-9.3.0
xtensa                randconfig-002-20250615    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

