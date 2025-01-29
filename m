Return-Path: <linuxppc-dev+bounces-5660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7387FA215F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 02:12:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjPJK6l9kz2yDk;
	Wed, 29 Jan 2025 12:12:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738113121;
	cv=none; b=Y7gPw2NZKC45VketnH2ulEGq8YWsRADVf70ykUhcAUmXfpMWDqglZXxthXUqG0+Nm30HqRXBkYPxDLWb1PcHbBsBkhbofzw0eC0pDhQtd7oQJ98ujIL3W1/MK9gO8XJiBtl9YV3Ow/BalMkAoXBZgtYhvCv8HIKXyw6r68DFK5LnjCOYHhBhS8r1mjuALgW6aEAgu1TvhertoFm+Ok75jSRwZBIxdI+0o48q58Ru2mXWkRpWDFMludpyi6t0dDoHqoTTBcso8WeS9C7K1iyuuXESdvsWwAsTdo9xTTNg65aeN6+y0NcSusLR679gmF/qmWMxF3qxpjzn6tTas3JpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738113121; c=relaxed/relaxed;
	bh=QKPZQPl4qFHrnpaw+7ws5jeJaYJU5kn63QNEQ6nbO4A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hU2/N/XrbDhgBmSmTtiP5P46xqxQVfA1jE2dwwfyNtw6ccahz8MsYmhNZUW8sMnHvgZk/lZJQYFSUvmo/YAiQ+5zHdYDJLwn5PF9ZWmYvvKmBq2cUZPQE9+mk1uGQpGQ434cxJSVmWK/3L5kc201g6frgUhtqfHfWm0SIH3jkaCGb78npUXhfunNqoweTKsHEWB5zjYlo+sZ7kxY5H5IgtBd8Wbj5cg1KxH0xsAjB0cVTycJj/GCmWy6XBWXpBgGIH6cPrTq/vcXPc3lP/yCmuEdo3b0vyrkvumhW6xu05j7bDW00/B+zSi21lSFe0t+ZHHycNg5CjmynaFtZLOATQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WrP7Uztk; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WrP7Uztk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjPJH2m4Qz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 12:11:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738113120; x=1769649120;
  h=date:from:to:cc:subject:message-id;
  bh=YvH73A9bGW70lsvdTsyfF8syrtPB1HgPyebHAptKyVs=;
  b=WrP7Uztkpp43LOdPEqM+PqwbVdyNt4UD6cB0p5Fc4zvN81ky0ItuZA9N
   uLVOvuZv4ZjumBAl4sWSy/oyRzTGQv5OBrVBV0uSrc+URyAGVaRbfp89W
   0k3E3Z88BPIAp28px8HuJFxBUth1MVTqQ34saxaC7G0B5oAOgxy5zVqpc
   cx9qknN87D02HbWWO5rYzs39dp2aVgS2AU7SgZ+9psMMEJ5qXG9TjE97t
   TlfmjogTd6XDBK8Qu6wj4UetqQAqsr3VMBh4xWDHijyfEhjshpZtbD9iN
   HPQQl5YNtHwalzr2NDqxeinqHlIzatSsow9t4cX1r4kaMKylJywnI/7xn
   w==;
X-CSE-ConnectionGUID: GiSr6SVzQYyohAlAdcWGAA==
X-CSE-MsgGUID: 2GH0FmCwTFGjFZCyBsMtjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38502336"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38502336"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 17:11:56 -0800
X-CSE-ConnectionGUID: bir0Db4CT/etkN8uUFGgcg==
X-CSE-MsgGUID: sLkU8AKNRmK+TMDcfTU8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="113931092"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2025 17:11:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcwcR-000iRn-2e;
	Wed, 29 Jan 2025 01:11:51 +0000
Date: Wed, 29 Jan 2025 09:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 cd24e66993a004318e9caf6daab4d80015e1a9b6
Message-ID: <202501290925.DrjeI0ox-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: cd24e66993a004318e9caf6daab4d80015e1a9b6  powerpc/ci: Use GCC 8.1 as the 'old' compiler

elapsed time: 1307m

configs tested: 226
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    clang-18
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    clang-18
arc                              allyesconfig    gcc-13.2.0
arc                          axs101_defconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                         haps_hs_defconfig    gcc-13.2.0
arc                     haps_hs_smp_defconfig    clang-18
arc                 nsimosci_hs_smp_defconfig    gcc-13.2.0
arc                   randconfig-001-20250128    gcc-13.2.0
arc                   randconfig-002-20250128    gcc-13.2.0
arm                              allmodconfig    clang-18
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    clang-18
arm                              allyesconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                       imx_v4_v5_defconfig    clang-16
arm                      jornada720_defconfig    clang-20
arm                           omap1_defconfig    clang-20
arm                   randconfig-001-20250128    gcc-14.2.0
arm                   randconfig-002-20250128    clang-20
arm                   randconfig-003-20250128    clang-20
arm                   randconfig-004-20250128    clang-15
arm                           sunxi_defconfig    clang-20
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250128    gcc-14.2.0
arm64                 randconfig-002-20250128    clang-17
arm64                 randconfig-003-20250128    gcc-14.2.0
arm64                 randconfig-004-20250128    clang-20
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250128    gcc-14.2.0
csky                  randconfig-002-20250128    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250128    clang-20
hexagon               randconfig-002-20250128    clang-14
i386                             allmodconfig    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-19
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-19
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250128    clang-19
i386        buildonly-randconfig-001-20250129    gcc-12
i386        buildonly-randconfig-002-20250128    clang-19
i386        buildonly-randconfig-002-20250129    gcc-12
i386        buildonly-randconfig-003-20250128    gcc-12
i386        buildonly-randconfig-003-20250129    gcc-12
i386        buildonly-randconfig-004-20250128    clang-19
i386        buildonly-randconfig-004-20250129    gcc-12
i386        buildonly-randconfig-005-20250128    clang-19
i386        buildonly-randconfig-005-20250129    gcc-12
i386        buildonly-randconfig-006-20250128    clang-19
i386        buildonly-randconfig-006-20250129    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20250129    gcc-12
i386                  randconfig-002-20250129    gcc-12
i386                  randconfig-003-20250129    gcc-12
i386                  randconfig-004-20250129    gcc-12
i386                  randconfig-005-20250129    gcc-12
i386                  randconfig-006-20250129    gcc-12
i386                  randconfig-007-20250129    gcc-12
i386                  randconfig-011-20250128    clang-19
i386                  randconfig-012-20250128    clang-19
i386                  randconfig-013-20250128    clang-19
i386                  randconfig-014-20250128    clang-19
i386                  randconfig-015-20250128    clang-19
i386                  randconfig-016-20250128    clang-19
i386                  randconfig-017-20250128    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250128    gcc-14.2.0
loongarch             randconfig-002-20250128    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          atari_defconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                      bmips_stb_defconfig    clang-18
mips                           ci20_defconfig    clang-19
mips                           xway_defconfig    clang-20
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250128    gcc-14.2.0
nios2                 randconfig-002-20250128    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                generic-64bit_defconfig    gcc-14.2.0
parisc                randconfig-001-20250128    gcc-14.2.0
parisc                randconfig-002-20250128    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                          allyesconfig    gcc-14.2.0
powerpc                     asp8347_defconfig    clang-20
powerpc                     ep8248e_defconfig    clang-18
powerpc                    gamecube_defconfig    clang-16
powerpc                    gamecube_defconfig    clang-20
powerpc                    ge_imp3a_defconfig    clang-20
powerpc                 mpc8313_rdb_defconfig    clang-18
powerpc                       ppc64_defconfig    clang-19
powerpc                     rainier_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250128    clang-17
powerpc               randconfig-002-20250128    gcc-14.2.0
powerpc               randconfig-003-20250128    clang-20
powerpc                     tqm5200_defconfig    clang-20
powerpc                        warp_defconfig    clang-18
powerpc64             randconfig-001-20250128    clang-15
powerpc64             randconfig-002-20250128    gcc-14.2.0
powerpc64             randconfig-003-20250128    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250128    gcc-14.2.0
riscv                 randconfig-002-20250128    gcc-14.2.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250128    gcc-14.2.0
s390                  randconfig-002-20250128    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          lboxre2_defconfig    gcc-14.2.0
sh                    randconfig-001-20250128    gcc-14.2.0
sh                    randconfig-002-20250128    gcc-14.2.0
sh                          sdk7786_defconfig    gcc-14.2.0
sh                   sh7770_generic_defconfig    clang-18
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250128    gcc-14.2.0
sparc                 randconfig-002-20250128    gcc-14.2.0
sparc64                          alldefconfig    clang-20
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250128    gcc-14.2.0
sparc64               randconfig-002-20250128    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250128    gcc-12
um                    randconfig-002-20250128    gcc-12
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    clang-18
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250128    clang-19
x86_64      buildonly-randconfig-002-20250128    clang-19
x86_64      buildonly-randconfig-003-20250128    gcc-12
x86_64      buildonly-randconfig-004-20250128    clang-19
x86_64      buildonly-randconfig-005-20250128    clang-19
x86_64      buildonly-randconfig-006-20250128    gcc-12
x86_64                              defconfig    clang-19
x86_64                              defconfig    gcc-11
x86_64                randconfig-001-20250128    gcc-12
x86_64                randconfig-002-20250128    gcc-12
x86_64                randconfig-003-20250128    gcc-12
x86_64                randconfig-004-20250128    gcc-12
x86_64                randconfig-005-20250128    gcc-12
x86_64                randconfig-006-20250128    gcc-12
x86_64                randconfig-007-20250128    gcc-12
x86_64                randconfig-008-20250128    gcc-12
x86_64                randconfig-071-20250128    gcc-12
x86_64                randconfig-072-20250128    gcc-12
x86_64                randconfig-073-20250128    gcc-12
x86_64                randconfig-074-20250128    gcc-12
x86_64                randconfig-075-20250128    gcc-12
x86_64                randconfig-076-20250128    gcc-12
x86_64                randconfig-077-20250128    gcc-12
x86_64                randconfig-078-20250128    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250128    gcc-14.2.0
xtensa                randconfig-002-20250128    gcc-14.2.0
xtensa                    xip_kc705_defconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

