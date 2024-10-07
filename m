Return-Path: <linuxppc-dev+bounces-1780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E19922B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 04:07:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMMx16lgcz2yMD;
	Mon,  7 Oct 2024 13:07:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728266853;
	cv=none; b=UHLBmxZemfaifwd1V0BZbtREJfRNMATeyKnXaCfJfaL6VyHYWBldkzjPtcLCGjn0mCpJO+yjol/NNoBo+2j3/euhHGD0bw8onjzul4caJvmyubBpCnAWU3/9lFdKIeHzwOntYl8Us0PERspvoCLQsZL/1cW4c70KqV8ketxZ2TjdMqudDLFk5g+R0DLE5j1yXL12vn2n05jrlxT9kGcmXnqxawJFV68Srd5IOKSWNN9YMnoy4X9+mit2SOVxmfJO1ho2DVeaExLvk6HsVw0VvWpQgzk0+fboL07Rg20idBWicHvu3UEJS8ltwmHLEIZnCcfs0qaSLobtkB7rLd940w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728266853; c=relaxed/relaxed;
	bh=3rUgDAU5m59aUTuvUlREvlw7M2l4EfAg0sfA/k4QQNQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g+jzJBjFTb6OKfNBGx//qKTOxmde7PV8qRh5nHC6OlMgRgdLL59H1Rq1tm1+i5ErQCw4o00dNTE7TlA0GGM5rA704ogRLtwrR02SnDMQmWaYq+yugOOyECJKuOXKZlVcboK8vLW7+0bGfc7KXkDbMV0qd+fxVj1pTm4Hm1Y01QQX1qdhCc+RV00TE3FIlJ7Q2rZNw5XTP5k3qIcJWDbieMQoaYvc/m5PXH0OyhBgKlVNbGAG9CAdCXs21isRFQ49IjNWOhCLSrQdThK7t/GCGhjlNRBGddKhS7GU58E1lFnv9nNSLK6NiCVkPLfk2Feg6KPA6xjgJd/4ofBz9Ho31g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oCDfyvEY; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oCDfyvEY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMMwz3pCZz2xHw
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 13:07:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728266852; x=1759802852;
  h=date:from:to:cc:subject:message-id;
  bh=nlliJVeIZ5glw6Ave9XOCax15RHHeSgwpIJYAp1EOsc=;
  b=oCDfyvEYVRlGearKM9zlsgYC6Eq6rVB1ElHeB+OMQ/elS6BJx8FlGnFd
   iuB+qfp5+FYrj1GU+VnXAkoUsf4SthIrM8NY6pbNEv/sCMVyxjOCJO5Uq
   DJ4hHDXSR00FGXOIhNHI6DCO72ESusKuFtR8wMvFaQAHP+S0zD8tB9GdQ
   zPW4qjIi1xs+70lqC8MluSu1ubwr3X9gCtTEFf5QsjznFo/rfDp7c/K6R
   hhUwGrsfSIL/IADb4wPWMT9qXZtE1T7cz+AOxyXo2hgZjZlECXJs+FN74
   XOzeTAMC+pLmUxgaBjA2cLK1q4H6wOlGf3o20cXoMl7Il/7eaqnZkeQb+
   A==;
X-CSE-ConnectionGUID: cZGEJflhT6yqH5Qew4gS6g==
X-CSE-MsgGUID: 5mJyBvkjTzSqynzd0PuDFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="27347259"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="27347259"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 19:07:25 -0700
X-CSE-ConnectionGUID: 1HJ9e8gzRuu4BVdtmUKS9Q==
X-CSE-MsgGUID: ZhY76KGUQZuTDILXNypfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="98638407"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Oct 2024 19:07:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxd9d-0004VU-2V;
	Mon, 07 Oct 2024 02:07:21 +0000
Date: Mon, 07 Oct 2024 10:06:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 f85c105361db641654955608e0a880f7550fe381
Message-ID: <202410071027.yYqiZU9o-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: f85c105361db641654955608e0a880f7550fe381  Automatic merge of 'fixes' into merge (2024-10-06 17:53)

elapsed time: 1122m

configs tested: 131
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                         haps_hs_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                      footbridge_defconfig    clang-20
arm                         lpc32xx_defconfig    gcc-14.1.0
arm                            mps2_defconfig    clang-20
arm                        spear6xx_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241007    clang-18
i386        buildonly-randconfig-002-20241007    clang-18
i386        buildonly-randconfig-003-20241007    clang-18
i386        buildonly-randconfig-004-20241007    clang-18
i386        buildonly-randconfig-006-20241007    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241007    gcc-12
i386                  randconfig-002-20241007    gcc-12
i386                  randconfig-003-20241007    gcc-12
i386                  randconfig-004-20241007    clang-18
i386                  randconfig-005-20241007    clang-18
i386                  randconfig-006-20241007    clang-18
i386                  randconfig-011-20241007    gcc-12
i386                  randconfig-012-20241007    clang-18
i386                  randconfig-013-20241007    clang-18
i386                  randconfig-014-20241007    gcc-12
i386                  randconfig-015-20241007    clang-18
i386                  randconfig-016-20241007    gcc-11
loongarch                        alldefconfig    clang-20
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                          amiga_defconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                          multi_defconfig    clang-20
m68k                        mvme16x_defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                   sb1250_swarm_defconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      ep88xc_defconfig    gcc-14.1.0
powerpc                     mpc512x_defconfig    gcc-14.1.0
powerpc                     ppa8548_defconfig    gcc-14.1.0
powerpc                     rainier_defconfig    gcc-14.1.0
powerpc                     skiroot_defconfig    clang-20
powerpc                     tqm8541_defconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         apsh4a3a_defconfig    clang-20
sh                                  defconfig    gcc-12
sh                         ecovec24_defconfig    clang-20
sh                             espt_defconfig    clang-20
sh                   rts7751r2dplus_defconfig    gcc-14.1.0
sh                           se7206_defconfig    clang-20
sh                           se7619_defconfig    gcc-14.1.0
sh                           se7721_defconfig    clang-20
sh                        sh7763rdp_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    clang-20
sh                          urquell_defconfig    clang-20
sparc                            allmodconfig    gcc-14.1.0
sparc                       sparc32_defconfig    clang-20
sparc64                             defconfig    gcc-12
um                               alldefconfig    gcc-14.1.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0
xtensa                  nommu_kc705_defconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

