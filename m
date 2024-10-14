Return-Path: <linuxppc-dev+bounces-2243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3362999D876
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 22:47:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS8Rj6TTmz2y8l;
	Tue, 15 Oct 2024 07:47:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728938833;
	cv=none; b=Mc7NDnvjSxg9D7+nmTTaBT+WJic6uTOnMattvTgBpD05oF6oUUyDFSO296MFGhL4sL5+ItPe4Yc4AJfxA97Js9z6rYhVDEo6OrwVISCmX0kJpiB8cdDLxeE5CwKLCU5AWpPWGfADQpnsxFmb8hItAjOtVHOfMYmXj2+Cu7eVcSr1x5ZCvzuxxjxFZucnCW/PFKE3qs+IHNIwNEed2B/HuOip/bJ42ODgtMP4wKHZmXEBavSJXdR6wm14cUhssrEyezT6afLExyecfxWoxLNMjUFDQdC5PmvhuxhAvHpLaIsydYyLxntXITwL+3+3aIOxVGWox05weFDh68BDmyjQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728938833; c=relaxed/relaxed;
	bh=8lQvZBxQQ64ZcfVjqj8yV0k4tCggGdqOY+04/Ygojz4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ou+etWb8+ej7PdhDqkmiPzVqEObhop4l3xYcJFGupQnz3/4irBHZOMB/iK0Vr8crZQ83ybzah5CDPjUN4WBOvtftoRWNA7EkZ7ehep2OExnkGli7iGmd1wiQzAY4pC/HLO0cFEQcc3EmMvUQoaWMgB5zh0eg2+Lr6z+fu4pmNmNWC5fSYvodZOi8/7FEzHAKHJoRhXW9lPjMtX/Uf9G2Pcrpc/BuTWoWu0uaxiEE3N3h3DBzyoNRxo/hwks5MIcYQ+mSjbygrCnc4XtY+MgJTzm4PHsT6fCOcniDyUfq8j34/kJAxPwXZYUnB0YS70a2PUYutQKpffUzQuGAg2Mifg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fLsTPrlc; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fLsTPrlc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS8Rf3RR6z2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 07:47:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728938831; x=1760474831;
  h=date:from:to:cc:subject:message-id;
  bh=c571hUSu6FM33FqebG+vPbxFavUw0V2f7TtpUHBkwsc=;
  b=fLsTPrlcFTl0hA+fcMv80VU2PEzYSoza154DxQbtVt1j2+uHJkMHyoII
   XMrf+3Hf2HYIpth/GCpqSiOnklWASJnCCQit8zrMCj85Za0UvY7V0FEd2
   +2NdNMMLXm5r67tOizyO/KzhZhM6rYDlIAjdKRKmgUtAsYtxfaxJWcTBx
   w96R9G8p9FlN74kNc9hRotmHuW0YgxL0Oe+XVikCOIfM0B8o22Ap0VCzW
   dA5UbxEYMqEB2V7mnbu4ZQGao2KJwx4hwkXayr0G22PpaE+PN9t5vjoJr
   zPSEDU48GGPrkLk+kXYCL2udcp53gF0j6wVOeyCWJmERpbiAfBFXthcW1
   w==;
X-CSE-ConnectionGUID: esGch7kgRY+/HwRS2pnKJg==
X-CSE-MsgGUID: jScCT1QKSiynWhjS5kWQYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28261882"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28261882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 13:47:04 -0700
X-CSE-ConnectionGUID: irxrSqnVSNKXc1D5Rj64lA==
X-CSE-MsgGUID: 76T0SdfDRBOU5okRghw/Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="108467114"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2024 13:47:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Ry0-000H63-1V;
	Mon, 14 Oct 2024 20:47:00 +0000
Date: Tue, 15 Oct 2024 04:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 bcaab141779a454059c8dd6bae50907caa7f5a57
Message-ID: <202410150412.QvLBiPSy-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
branch HEAD: bcaab141779a454059c8dd6bae50907caa7f5a57  Automatic merge of 'fixes' into merge (2024-10-13 10:01)

elapsed time: 2693m

configs tested: 119
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig    gcc-14.1.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arc                     haps_hs_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm                         lpc32xx_defconfig    gcc-14.1.0
arm                        mvebu_v7_defconfig    gcc-14.1.0
arm                           sama5_defconfig    gcc-14.1.0
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
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241014    clang-18
i386        buildonly-randconfig-002-20241014    clang-18
i386        buildonly-randconfig-003-20241014    clang-18
i386        buildonly-randconfig-004-20241014    clang-18
i386        buildonly-randconfig-005-20241014    clang-18
i386        buildonly-randconfig-006-20241014    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241014    clang-18
i386                  randconfig-002-20241014    clang-18
i386                  randconfig-003-20241014    clang-18
i386                  randconfig-004-20241014    clang-18
i386                  randconfig-005-20241014    clang-18
i386                  randconfig-006-20241014    clang-18
i386                  randconfig-011-20241014    clang-18
i386                  randconfig-012-20241014    clang-18
i386                  randconfig-013-20241014    clang-18
i386                  randconfig-014-20241014    clang-18
i386                  randconfig-015-20241014    clang-18
i386                  randconfig-016-20241014    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                     loongson1b_defconfig    gcc-14.1.0
mips                  maltasmvp_eva_defconfig    gcc-14.1.0
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
parisc                generic-32bit_defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
powerpc                 mpc8313_rdb_defconfig    gcc-14.1.0
powerpc                      pcm030_defconfig    gcc-14.1.0
powerpc                      tqm8xx_defconfig    gcc-14.1.0
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
sh                                  defconfig    gcc-12
sh                          r7785rp_defconfig    gcc-14.1.0
sh                          rsk7269_defconfig    gcc-14.1.0
sh                           se7343_defconfig    gcc-14.1.0
sh                   sh7770_generic_defconfig    gcc-14.1.0
sh                          urquell_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
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
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                           rhel-8.3-bpf    clang-18
x86_64                         rhel-8.3-kunit    clang-18
x86_64                           rhel-8.3-ltp    clang-18
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

