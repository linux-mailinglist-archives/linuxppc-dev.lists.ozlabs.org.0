Return-Path: <linuxppc-dev+bounces-9275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEDFAD4817
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 03:41:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bH7g76L19z2xlL;
	Wed, 11 Jun 2025 11:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749606099;
	cv=none; b=RI0Fiuebvg9atEFwNUfSzcqKhxjDP/Hk+bvcilvJKquc9jJy26IS3vmaZ81mo/z0c0QWN5D837RBJwPO3rOvVlqpEQv29ROeDNvl0KflwtbIA/+IjTcAJu64OMGQT75GsFV2hloZcodV+aHydaSmiX7gsmNKrRbVlKlV17dgi4XGahOZXQIqkgNX2+T5taP5CPZ9Y0uwMD6d/B6+nMGFYokKyp3rbFAp5ttUpo28EU+78HmcSC4GvOzQcKwRlhk0r4GLWR7Q09vCG8qYOFAlmVVyLDvZWb8wnmpwmbSuZqr+RFTUEq9MTzbeXt1grHY7sEEOM9B2GNEJ4/aR3gR7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749606099; c=relaxed/relaxed;
	bh=BGuH2dyiu/bFkc/fUrMGAjF2Y3c7ohCm2qQGOhEL2I4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RowrEZXlTSIN6nhl2kJ9Jf2EyysNHyvXcVIgY/Ftjoybsv+o+bsSWAqafEtw3SSk4w5FLvQNgWoDGohWEImcntEqCUap30hIv+MUET6ow7aC18OPuDBuRNWAOK9lQU9gwvp9YHQs4LQTjyL+O2DrvWkZBwT5Gc9Pnm3QiK8y9hzNVo1hxrTWlV1g8AtnWf9Ndu9ZWZ11R68ESqCPoFS1/PzxugXpdy82QTRVGqXvQqd2blfcVTzPZOg4HCE6ruUQ74smTqTSpb3fYRi2cfZnlIjj/L5bae300ACrpTPTWj2SWvYehi4rMbpuYeD96u5+rsJfl7gZtJRrlcefz4KCWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DACPMkxI; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DACPMkxI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bH7g53J7Cz2xd4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 11:41:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749606098; x=1781142098;
  h=date:from:to:cc:subject:message-id;
  bh=wiVK25JFxYrZ+M0fM78JCoBoammfjDe4+BJibZWrk1E=;
  b=DACPMkxI4tdjTIBshRKlci6MdIJUOtoHPPjf2HU09pCpbUGw4HKIgQ/C
   tIichc77fMf3y5HNSZuooHQGo3MEmykvt2NhAc7UrbZF82pt4SHaU4sii
   66D78QGH20gsQ11PlhF4iSwLcNye7IzVeOny8tDff3qdmrFoSn0QRnbpx
   cGK0vQQer9DwWzSEUxclYIXdKNNMSX/JjiHozDB6UfpPF/QeJWTNEWqiE
   OlHzwys5la6OfvV8xPoYB0SMtC+Mkk90FfZuIvWyTsTEtf73K8gfTFIHL
   STpTgG5LdZNjNT+i9jZ/VXo+12vPLHMuDONPYeDcay8dcYmLz9O0kstBK
   w==;
X-CSE-ConnectionGUID: ktXFixjsQA6cBxKNGLCQlw==
X-CSE-MsgGUID: WlRXbNY2Tpujhai42Mbyvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51613723"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51613723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 18:41:31 -0700
X-CSE-ConnectionGUID: /5MgwMXjRFGmduAU6Xf4WQ==
X-CSE-MsgGUID: Nw3m/G1nST+8xR0zFqpSEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="184188358"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2025 18:41:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uP5dm-0008jV-0b;
	Tue, 10 Jun 2025 20:32:14 +0000
Date: Wed, 11 Jun 2025 04:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 0d67f0dee6c9176bc09a5482dd7346e3a0f14d0b
Message-ID: <202506110458.HAOBIe7N-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 0d67f0dee6c9176bc09a5482dd7346e3a0f14d0b  powerpc/vas: Return -EINVAL if the offset is non-zero in mmap()

elapsed time: 1042m

configs tested: 185
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                               defconfig    gcc-15.1.0
arc                               allnoconfig    gcc-15.1.0
arc                                 defconfig    gcc-15.1.0
arc                   randconfig-001-20250610    gcc-12.4.0
arc                   randconfig-002-20250610    gcc-12.4.0
arm                               allnoconfig    gcc-15.1.0
arm                                 defconfig    gcc-15.1.0
arm                         lpc32xx_defconfig    gcc-15.1.0
arm                   randconfig-001-20250610    gcc-12.4.0
arm                   randconfig-002-20250610    gcc-12.4.0
arm                   randconfig-003-20250610    gcc-12.4.0
arm                   randconfig-004-20250610    gcc-12.4.0
arm                           sama5_defconfig    gcc-15.1.0
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    gcc-15.1.0
arm64                 randconfig-001-20250610    gcc-12.4.0
arm64                 randconfig-002-20250610    gcc-12.4.0
arm64                 randconfig-003-20250610    gcc-12.4.0
arm64                 randconfig-004-20250610    gcc-12.4.0
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    gcc-15.1.0
csky                  randconfig-001-20250610    gcc-12.4.0
csky                  randconfig-001-20250610    gcc-15.1.0
csky                  randconfig-002-20250610    gcc-14.3.0
csky                  randconfig-002-20250610    gcc-15.1.0
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    gcc-15.1.0
hexagon                          allyesconfig    clang-19
hexagon                             defconfig    gcc-15.1.0
hexagon               randconfig-001-20250610    clang-21
hexagon               randconfig-001-20250610    gcc-15.1.0
hexagon               randconfig-002-20250610    clang-21
hexagon               randconfig-002-20250610    gcc-15.1.0
i386                             allmodconfig    clang-20
i386                              allnoconfig    clang-20
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20250610    clang-20
i386        buildonly-randconfig-002-20250610    clang-20
i386        buildonly-randconfig-003-20250610    clang-20
i386        buildonly-randconfig-004-20250610    clang-20
i386        buildonly-randconfig-005-20250610    clang-20
i386        buildonly-randconfig-006-20250610    clang-20
i386                                defconfig    clang-20
i386                  randconfig-001-20250610    clang-20
i386                  randconfig-002-20250610    clang-20
i386                  randconfig-003-20250610    clang-20
i386                  randconfig-004-20250610    clang-20
i386                  randconfig-005-20250610    clang-20
i386                  randconfig-006-20250610    clang-20
i386                  randconfig-007-20250610    clang-20
i386                  randconfig-011-20250610    clang-20
i386                  randconfig-012-20250610    clang-20
i386                  randconfig-013-20250610    clang-20
i386                  randconfig-014-20250610    clang-20
i386                  randconfig-015-20250610    clang-20
i386                  randconfig-016-20250610    clang-20
i386                  randconfig-017-20250610    clang-20
loongarch                        allmodconfig    gcc-15.1.0
loongarch                         allnoconfig    gcc-15.1.0
loongarch                           defconfig    gcc-15.1.0
loongarch                 loongson3_defconfig    gcc-15.1.0
loongarch             randconfig-001-20250610    gcc-15.1.0
loongarch             randconfig-002-20250610    gcc-15.1.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    gcc-15.1.0
m68k                        m5307c3_defconfig    gcc-15.1.0
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                        bcm63xx_defconfig    gcc-15.1.0
mips                          eyeq5_defconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250610    gcc-15.1.0
nios2                 randconfig-001-20250610    gcc-8.5.0
nios2                 randconfig-002-20250610    gcc-13.3.0
nios2                 randconfig-002-20250610    gcc-15.1.0
openrisc                          allnoconfig    clang-21
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-21
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20250610    gcc-10.5.0
parisc                randconfig-001-20250610    gcc-15.1.0
parisc                randconfig-002-20250610    gcc-15.1.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-21
powerpc                          allyesconfig    clang-21
powerpc                      arches_defconfig    gcc-15.1.0
powerpc                  mpc866_ads_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250610    gcc-10.5.0
powerpc               randconfig-001-20250610    gcc-15.1.0
powerpc               randconfig-002-20250610    gcc-15.1.0
powerpc               randconfig-002-20250610    gcc-8.5.0
powerpc               randconfig-003-20250610    clang-21
powerpc               randconfig-003-20250610    gcc-15.1.0
powerpc                     tqm8560_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250610    clang-21
powerpc64             randconfig-001-20250610    gcc-15.1.0
powerpc64             randconfig-002-20250610    clang-21
powerpc64             randconfig-002-20250610    gcc-15.1.0
powerpc64             randconfig-003-20250610    gcc-11.5.0
riscv                            allmodconfig    clang-21
riscv                             allnoconfig    clang-21
riscv                            allyesconfig    clang-16
riscv                               defconfig    gcc-12
riscv                               defconfig    gcc-15.1.0
riscv                 randconfig-001-20250610    gcc-9.3.0
riscv                 randconfig-002-20250610    gcc-9.3.0
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-21
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250610    gcc-9.3.0
s390                  randconfig-002-20250610    gcc-9.3.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                        edosk7760_defconfig    gcc-15.1.0
sh                    randconfig-001-20250610    gcc-9.3.0
sh                    randconfig-002-20250610    gcc-9.3.0
sh                          rsk7264_defconfig    gcc-15.1.0
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            alldefconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                 randconfig-001-20250610    gcc-9.3.0
sparc                 randconfig-002-20250610    gcc-9.3.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250610    gcc-9.3.0
sparc64               randconfig-002-20250610    gcc-9.3.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-21
um                               allyesconfig    clang-19
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250610    gcc-9.3.0
um                    randconfig-002-20250610    gcc-9.3.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20250610    gcc-12
x86_64      buildonly-randconfig-002-20250610    gcc-12
x86_64      buildonly-randconfig-003-20250610    gcc-12
x86_64      buildonly-randconfig-004-20250610    gcc-12
x86_64      buildonly-randconfig-005-20250610    gcc-12
x86_64      buildonly-randconfig-006-20250610    gcc-12
x86_64                              defconfig    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250610    clang-20
x86_64                randconfig-002-20250610    clang-20
x86_64                randconfig-003-20250610    clang-20
x86_64                randconfig-004-20250610    clang-20
x86_64                randconfig-005-20250610    clang-20
x86_64                randconfig-006-20250610    clang-20
x86_64                randconfig-007-20250610    clang-20
x86_64                randconfig-008-20250610    clang-20
x86_64                randconfig-071-20250610    clang-20
x86_64                randconfig-072-20250610    clang-20
x86_64                randconfig-073-20250610    clang-20
x86_64                randconfig-074-20250610    clang-20
x86_64                randconfig-075-20250610    clang-20
x86_64                randconfig-076-20250610    clang-20
x86_64                randconfig-077-20250610    clang-20
x86_64                randconfig-078-20250610    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-12
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-12
x86_64                           rhel-9.4-ltp    gcc-12
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20250610    gcc-9.3.0
xtensa                randconfig-002-20250610    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

