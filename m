Return-Path: <linuxppc-dev+bounces-1503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4C97DA45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 23:28:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9QVF3b03z2xLR;
	Sat, 21 Sep 2024 07:28:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726867701;
	cv=none; b=k7htRScI1/vAP5Nzg7b1GQKBV7XUTLCIWe/USkESFJDdMmVoCuE+kAaM0qG26OJkS7NEJ49J/r5VZNA3IbGxsklzajREgRlocIyfbXz8O0xje/kABh+VNbsuoiGlO6XO/B9UUa5SPIUojKTQFTdru3x/gtScEG3plWwJO5cuQWaqTaqJ4EmS8+8rxUsf9L70G3FXb6USuc2uLAil501Ee6bhJ4t5fzH1jVtPSnBdAR+hX3WnRhdRRysQf+Mik9ncPdfbvFsOLAt3PWo6BWs/Xp+NQL+eEpDG8TUPeaxp5QAg6TGfcxcRTql9zbidWlBnstAol/CTTzDgRHi0L5WYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726867701; c=relaxed/relaxed;
	bh=lJ6rPsj9VVfllkiHs1bb4xajHHWqqRug0cQgwNgQlxo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ld6GCuMT688ES6Bn/0IFATPa30MON/OCxCwr1PBJxHeQQ6XsejySs5cy8mR1EPiRSNPl/0KqxiAq+IHD7gv1zfUzRKxDf8LgKoVQqV8pcHys33ACmLo7hngCPvNb/zurAnIwyQ3vFjpLJ8nn/z05kZeOoMOD8baSZUeO2HjuLY8Dz7KhypqekWFWi0AlFtuscVM87mrLJgxDSOVRBFtSRDm6fwvjVXbMf2cPW3VamflH1ugW/oTMeCbmABEg6bfooSxP0/UnOftKLdNnFOZZUGJQV2F14CI+aM4XsWogo7byM54kBFj4TVVjtpgwKJgUMNJ9ZR+eQIYw2I51zzq6OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C+fu5jUY; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C+fu5jUY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9QVC5VsVz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 07:28:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726867700; x=1758403700;
  h=date:from:to:cc:subject:message-id;
  bh=+iju2NJi59zJPMKQ1oa80sShb9zjLueV3MvcD5k5b24=;
  b=C+fu5jUY1S0X2dqbiWCKqx9kHjw3d1e5XV6B1AjPK/wlPN4MfpslE65/
   8puYItcSOFX4LsKfjCSt59nUIsOrQzyrqDGdXpkbNwS8b7EKlgT7YVcLa
   zg0xySatWoWnPptmFbDINuD11rt01ZgrsLhbDKtNDC+VuIDOTuiz3uGxQ
   +hF00fPiNmq17aZVHbz0omqDQLJwW/yWlrWXoOQhFo+12XFQuRIut9e2i
   HcgJEpnFsGH3l66EmDITz0BR0tRbYF3l9W2gm79UygcdiARA5ujtucrsG
   Zjor/mq2kAhUjdoBIcIF56wNJWRDDQXuT0y2yKNVfLqocpSLjVj+PsQOK
   Q==;
X-CSE-ConnectionGUID: NoEJX1HbRti7MoUz/Vck9A==
X-CSE-MsgGUID: 9FYiZ0OhRFWuu36piPK4Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29617709"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="29617709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 14:28:13 -0700
X-CSE-ConnectionGUID: ivG0hOHtTCiJ+ktOhxHpEA==
X-CSE-MsgGUID: efnazTy7SJ2s2wwrzvGKJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="70879663"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Sep 2024 14:28:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srlAg-000Es5-0Q;
	Fri, 20 Sep 2024 21:28:10 +0000
Date: Sat, 21 Sep 2024 05:28:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 3af2e2f68cc6baf0a11f662d30b0bf981f77bfea
Message-ID: <202409210503.Sc0aacR7-lkp@intel.com>
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
branch HEAD: 3af2e2f68cc6baf0a11f662d30b0bf981f77bfea  powerpc/pseries/eeh: move pseries_eeh_err_inject() outside CONFIG_DEBUG_FS block

elapsed time: 725m

configs tested: 92
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
arc                               allnoconfig    gcc-14.1.0
arm                               allnoconfig    gcc-14.1.0
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                           allnoconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20240921    clang-18
i386        buildonly-randconfig-002-20240921    clang-18
i386        buildonly-randconfig-003-20240921    clang-18
i386        buildonly-randconfig-004-20240921    clang-18
i386        buildonly-randconfig-005-20240921    clang-18
i386        buildonly-randconfig-006-20240921    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240921    clang-18
i386                  randconfig-002-20240921    clang-18
i386                  randconfig-003-20240921    clang-18
i386                  randconfig-004-20240921    clang-18
i386                  randconfig-005-20240921    clang-18
i386                  randconfig-006-20240921    clang-18
i386                  randconfig-011-20240921    clang-18
i386                  randconfig-012-20240921    clang-18
i386                  randconfig-013-20240921    clang-18
i386                  randconfig-014-20240921    clang-18
i386                  randconfig-015-20240921    clang-18
i386                  randconfig-016-20240921    clang-18
loongarch                         allnoconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
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
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                                allnoconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64      buildonly-randconfig-001-20240921    clang-18
x86_64      buildonly-randconfig-002-20240921    clang-18
x86_64      buildonly-randconfig-003-20240921    clang-18
x86_64      buildonly-randconfig-004-20240921    clang-18
x86_64      buildonly-randconfig-005-20240921    clang-18
x86_64      buildonly-randconfig-006-20240921    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20240921    clang-18
x86_64                randconfig-002-20240921    clang-18
x86_64                randconfig-003-20240921    clang-18
x86_64                randconfig-004-20240921    clang-18
x86_64                randconfig-005-20240921    clang-18
x86_64                randconfig-006-20240921    clang-18
x86_64                randconfig-011-20240921    clang-18
x86_64                randconfig-012-20240921    clang-18
x86_64                randconfig-013-20240921    clang-18
x86_64                randconfig-014-20240921    clang-18
x86_64                randconfig-015-20240921    clang-18
x86_64                randconfig-016-20240921    clang-18
x86_64                randconfig-071-20240921    clang-18
x86_64                randconfig-072-20240921    clang-18
x86_64                randconfig-073-20240921    clang-18
x86_64                randconfig-074-20240921    clang-18
x86_64                randconfig-075-20240921    clang-18
x86_64                randconfig-076-20240921    clang-18
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

