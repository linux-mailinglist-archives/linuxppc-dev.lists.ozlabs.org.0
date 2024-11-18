Return-Path: <linuxppc-dev+bounces-3394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 626979D07A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2024 02:52:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xs9bb3qW1z2y8X;
	Mon, 18 Nov 2024 12:51:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731894715;
	cv=none; b=PKroWupZ650J7QkVZ6FqBXNMzjHq63FPvD2DYBFXjDjmIAvuoAYRNEKXV7wUR5iLZwCgF3h2gld+g3ywrzps7JCP7r7nMArNWBZexVbWs2Mg+dOO/AZbJ/lUsxueuMKHFCB4dYO4ReusQp4FjFZHkRQrqVHAVfVTVU/w5n/GyOoPS9Ar4xExBrudQM0SMAKGrdHVLTmwLTUU+bV22IaJVzpzTV45HnUDbrdMxh/ht13KIrK6tJPu/2kNrdvZfrWCU82BOKWvwLEbCvpR3ni8SuUSTQ1k6IgoRijHqDbMFffpSpcjgukbZ5xdRMnSpN538SWS29lNE8TGvDUnYnerEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731894715; c=relaxed/relaxed;
	bh=unnrDmBTrCA+1kq/HlSAfNztkAPvUl3ST4fTWpbw4+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ko8guEymqHlrkWurI+tLadC8cOEXoGl/RrRTZASL1IssqC/BoXnmDABkxpPTsG7T8iSnP6hmzXsH/tF+5kRLjpLT+QQBcQmIkGx8YMQYHMVdm6VrbNAYRDxZoCT+lqgn9Z0E20pP9xcBBsdqT30TTt8DuXfTlrIeocUXeampp48AWVI3oBKggYHsgsHEJ9RfhlFwMV4VZdAA4g0oiDgbUdVTAgRpr/t9WhTH5xg3uzWw36U3jpNazy1498gv7KAxaX9cIHpd6kXq8ywsH92ShH+qMVsVhQPPpkfNGFZqQte9IzOJkDvSPWHGM3hiCrGu3T52iDRdcf6B/+U0toa+lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lEu9un6I; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lEu9un6I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xs9bX5Fmtz2xs4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2024 12:51:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731894713; x=1763430713;
  h=date:from:to:cc:subject:message-id;
  bh=XGeeG/Ak3To3cJBBDs8OGfcMMY6ic/YduNit+/Ka8Q0=;
  b=lEu9un6IRW8eGbMk4xcbbNgAK2dKNso7rDkuzJPU0aWirRF80wL3oQJV
   BWdzpBMcdgnqYFvvl5C1XJmJPc80phHpAMj/lTZwhTm35qnJS5UWDnJ67
   1uMcEgAjz0c3kkS1VpSz8RmRgjwkejRuemXmxuXIzFysHh6EZdqlq0ati
   JDuaUWttZ1o0MsRTQBYu0dFRlIxBFiIBJvlamWu0+8rgkwL8fIf+ZSj7j
   jGXUbd0KgdRjw1Ow7rWwM8kvRzbRP7nB1itDsDZ/ZVWekeSuVneCsGsLo
   p5reJmpvqTsVxa5hQGo1G5kV4ZPfppP8xw2y8/U7bmNqrH5Ucq7lT9jqZ
   Q==;
X-CSE-ConnectionGUID: X//Q+J8DRROpLIIfNqAdIw==
X-CSE-MsgGUID: zhRiFP9vTMeVOIbzk3XAxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31684106"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31684106"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:51:46 -0800
X-CSE-ConnectionGUID: vQq31aX1SZqUeLN6AtDsKA==
X-CSE-MsgGUID: JoqsYsvMS5yxH+NHIXQlGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93540490"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 17:51:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCqvT-0002CJ-0K;
	Mon, 18 Nov 2024 01:51:39 +0000
Date: Mon, 18 Nov 2024 09:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 ba6d8efb1bd7318f173846a8f5730a54c93f3ff5
Message-ID: <202411180930.287Rxprk-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: ba6d8efb1bd7318f173846a8f5730a54c93f3ff5  Merge branch 'topic/ppc-kvm' into next

elapsed time: 802m

configs tested: 122
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-20
arc                        nsimosci_defconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    clang-20
arm                         axm55xx_defconfig    clang-20
arm                          ep93xx_defconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241118    gcc-12
i386        buildonly-randconfig-002-20241118    gcc-12
i386        buildonly-randconfig-003-20241118    gcc-12
i386        buildonly-randconfig-004-20241118    gcc-12
i386        buildonly-randconfig-005-20241118    gcc-12
i386        buildonly-randconfig-006-20241118    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241118    gcc-12
i386                  randconfig-002-20241118    gcc-12
i386                  randconfig-003-20241118    gcc-12
i386                  randconfig-004-20241118    gcc-12
i386                  randconfig-005-20241118    gcc-12
i386                  randconfig-006-20241118    gcc-12
i386                  randconfig-011-20241118    gcc-12
i386                  randconfig-012-20241118    gcc-12
i386                  randconfig-013-20241118    gcc-12
i386                  randconfig-014-20241118    gcc-12
i386                  randconfig-015-20241118    gcc-12
i386                  randconfig-016-20241118    gcc-12
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                       m5475evb_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                         db1xxx_defconfig    clang-20
mips                           ip27_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    clang-20
powerpc                    gamecube_defconfig    clang-20
powerpc                    sam440ep_defconfig    clang-20
powerpc                 xes_mpc85xx_defconfig    clang-20
powerpc64                        alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                 kfr2r09-romimage_defconfig    clang-20
sh                           se7750_defconfig    clang-20
sh                   sh7770_generic_defconfig    clang-20
sh                            shmin_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241118    gcc-12
x86_64      buildonly-randconfig-002-20241118    gcc-12
x86_64      buildonly-randconfig-003-20241118    gcc-12
x86_64      buildonly-randconfig-004-20241118    gcc-12
x86_64      buildonly-randconfig-005-20241118    gcc-12
x86_64      buildonly-randconfig-006-20241118    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241118    gcc-12
x86_64                randconfig-002-20241118    gcc-12
x86_64                randconfig-003-20241118    gcc-12
x86_64                randconfig-004-20241118    gcc-12
x86_64                randconfig-005-20241118    gcc-12
x86_64                randconfig-006-20241118    gcc-12
x86_64                randconfig-011-20241118    gcc-12
x86_64                randconfig-012-20241118    gcc-12
x86_64                randconfig-013-20241118    gcc-12
x86_64                randconfig-014-20241118    gcc-12
x86_64                randconfig-015-20241118    gcc-12
x86_64                randconfig-016-20241118    gcc-12
x86_64                randconfig-071-20241118    gcc-12
x86_64                randconfig-072-20241118    gcc-12
x86_64                randconfig-073-20241118    gcc-12
x86_64                randconfig-074-20241118    gcc-12
x86_64                randconfig-075-20241118    gcc-12
x86_64                randconfig-076-20241118    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

