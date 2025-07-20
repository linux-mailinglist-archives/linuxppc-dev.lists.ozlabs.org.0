Return-Path: <linuxppc-dev+bounces-10332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA508B0B689
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jul 2025 16:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4blRWh598Vz30WS;
	Mon, 21 Jul 2025 00:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753023568;
	cv=none; b=TqEGPTaK7kY5+GMw2KtQREaFRfhmGh5vLFa3cRmGQPZrn2QG7wc4T1bPtUZNYdAEJ7jIFP3PSw551FaQ/CdoWprMhGBOFW3h+tOlgc1boT82mvOOE7df2CWBYZt2XtcsAeigEcObheDK5/0HDTSlVg0oUnnNdenG70/DCzIPmR1OaJ27EJRopgr8Jt9/pQD+vhSCj8N4d79q1JxGRrjkDjMDcMOGsljZPgDYpb0R+z68U49OUUUiarkkAw8Uno7FveHzfj1EnWqCUkBCUob6PLTeVSUa83bcDrbpDkk6eWn5ZjduNngO6oHCAkJ1ujKfm8s5Nzp1WZAmBMbxpz4crQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753023568; c=relaxed/relaxed;
	bh=7dlyhV4pdo0wrKsvANgA8OtLQRKeG0fQIeVX5JgbLic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XqS9dkH6axQcohGETy7FODNPXklXWoRIoTJx0Vzww7EU5CfabEoG97ENk1jd9ceMWMe416/gbOADhAkCrj40B5D7rVFqHEogAub2oCrFKNj+OJTlk8A7GG+IBqSRZkSfeNrYr7Nj1bCQ+PcT10/sOUSpIMLVRgr8EGrwygKcu/q/X+TQ5yOgVEQDfdnI/XliguYanJp8jTnX5oXe55zEFjjbaHFyPQfIUddkzJNi8UH35cBwm7qoqXu6TmPJqPkUrMAItCfDqmKgkS1oq6EA8qf6mSnJgbhdadEvbVBRGmbmvhqmdJ29HQpRpgeudDuo8Mm0PHhxi/IRsIE6JQtJQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UCbZC+LH; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UCbZC+LH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blRWf46Kdz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 00:59:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753023567; x=1784559567;
  h=date:from:to:cc:subject:message-id;
  bh=sSyd30yLx218HxID6gihnhp0xyfUBxPewsYroChgVl0=;
  b=UCbZC+LHwk94/+pzOvMU3vDJojjql3jDT799Stm+OqQ9NWvU6KC5JVpC
   9cnuigRXv0ym91zMNNehPMShMwVXjTPQd/HSrvnIm9G81VHytPs0Iq3ji
   ngiwBi4mi4RfJLLzF9hPJSR2hhSXp3w/NdLsdgRhzxK86N3Ow6kM/9hq3
   aq893H2z67XFRpdii82skV2ejjsuAjCZHqfi+2HHDWnhQKg8379reBXId
   ysq72uwq6e7SVBn2/mSe4AWktFi4sXbydfpxjL11qUDJpgVGrKYY+WF8e
   9NWTdR8IEgTZQCeML5RnKqee6jyv772b/NWxCU2fWQVq+mOnWnfF+qR0k
   Q==;
X-CSE-ConnectionGUID: 8Wb6bQCFSAOPgCjlOxbDlA==
X-CSE-MsgGUID: 19osnATgRziARvHdneFhIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="65944419"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="65944419"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 07:59:23 -0700
X-CSE-ConnectionGUID: NDVOlnvjTwezd1pKmSogWA==
X-CSE-MsgGUID: uch/5FQ+S5e8lULSXl6aeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="157950072"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jul 2025 07:59:21 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udVVW-000G9d-2I;
	Sun, 20 Jul 2025 14:59:18 +0000
Date: Sun, 20 Jul 2025 22:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 3519258edba158e27eb5078309c3320a68334140
Message-ID: <202507202253.C0olhJJ0-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 3519258edba158e27eb5078309c3320a68334140  powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()

elapsed time: 722m

configs tested: 131
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    gcc-15.1.0
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250720    gcc-11.5.0
arc                   randconfig-002-20250720    gcc-8.5.0
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-21
arm                              allyesconfig    gcc-15.1.0
arm                       aspeed_g5_defconfig    gcc-15.1.0
arm                                 defconfig    clang-21
arm                   randconfig-001-20250720    gcc-15.1.0
arm                   randconfig-002-20250720    gcc-15.1.0
arm                   randconfig-003-20250720    gcc-10.5.0
arm                   randconfig-004-20250720    gcc-8.5.0
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250720    gcc-15.1.0
arm64                 randconfig-002-20250720    gcc-12.5.0
arm64                 randconfig-003-20250720    clang-21
arm64                 randconfig-004-20250720    clang-21
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250720    gcc-15.1.0
csky                  randconfig-002-20250720    gcc-13.4.0
hexagon                          allmodconfig    clang-17
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-21
hexagon                             defconfig    clang-21
hexagon               randconfig-001-20250720    clang-21
hexagon               randconfig-002-20250720    clang-21
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250720    clang-20
i386        buildonly-randconfig-002-20250720    gcc-12
i386        buildonly-randconfig-003-20250720    gcc-12
i386        buildonly-randconfig-004-20250720    clang-20
i386        buildonly-randconfig-005-20250720    gcc-12
i386        buildonly-randconfig-006-20250720    clang-20
i386                                defconfig    clang-20
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-21
loongarch             randconfig-001-20250720    clang-18
loongarch             randconfig-002-20250720    clang-18
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20250720    gcc-9.5.0
nios2                 randconfig-002-20250720    gcc-8.5.0
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250720    gcc-8.5.0
parisc                randconfig-002-20250720    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-21
powerpc               randconfig-001-20250720    gcc-10.5.0
powerpc               randconfig-002-20250720    gcc-8.5.0
powerpc               randconfig-003-20250720    gcc-11.5.0
powerpc64             randconfig-001-20250720    gcc-10.5.0
powerpc64             randconfig-002-20250720    gcc-8.5.0
powerpc64             randconfig-003-20250720    clang-21
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-21
riscv                 randconfig-001-20250720    clang-21
riscv                 randconfig-002-20250720    gcc-13.4.0
s390                             allmodconfig    clang-18
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-21
s390                  randconfig-001-20250720    clang-21
s390                  randconfig-002-20250720    gcc-8.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-15.1.0
sh                            hp6xx_defconfig    gcc-15.1.0
sh                    randconfig-001-20250720    gcc-15.1.0
sh                    randconfig-002-20250720    gcc-13.4.0
sh                           sh2007_defconfig    gcc-15.1.0
sh                        sh7785lcr_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250720    gcc-8.5.0
sparc                 randconfig-002-20250720    gcc-8.5.0
sparc64                             defconfig    clang-20
sparc64               randconfig-001-20250720    gcc-8.5.0
sparc64               randconfig-002-20250720    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    gcc-12
um                                  defconfig    clang-21
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250720    gcc-11
um                    randconfig-002-20250720    gcc-12
um                           x86_64_defconfig    clang-21
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250720    gcc-12
x86_64      buildonly-randconfig-002-20250720    gcc-12
x86_64      buildonly-randconfig-003-20250720    gcc-12
x86_64      buildonly-randconfig-004-20250720    clang-20
x86_64      buildonly-randconfig-005-20250720    gcc-11
x86_64      buildonly-randconfig-006-20250720    gcc-12
x86_64                              defconfig    gcc-11
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250720    gcc-8.5.0
xtensa                randconfig-002-20250720    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

