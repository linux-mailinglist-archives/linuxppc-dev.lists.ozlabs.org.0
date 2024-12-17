Return-Path: <linuxppc-dev+bounces-4253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2BB9F4558
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 08:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC80V1QGnz30ft;
	Tue, 17 Dec 2024 18:42:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734421338;
	cv=none; b=or+BpmNDvXPL2WAKZ2yXOi/PkPqAGW4jcKyeSuPnjyifAOfELt2I/3dsRs/bShKJOuH/tZtHllfeRk1uBDJy4rql6yQeTMI2YucGUFqcKy9g2M4PksLEQTj1MxATmBnAmq1npJ6p05eb5mGuaRqDX1anxtiTixYgXnHgJi8GEJDDe8uLQIuob5kJlm5cic+8JSiGTjjl5NRg3A9MHUaJBR1+JuB5WfhssWnpsi1KMK+7eXfsQcyJ5QqczWw2DbVaAolPibo9q/vYdXYgBQ9UYACjBdgCfJzNYRvyvl2fJHfYS3lwt+VcP2VWwA2BTBbCg/nnOUY2fods48BWjM3TeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734421338; c=relaxed/relaxed;
	bh=PVrzyO3+J1HknGPyq267/b5iR7R/P+dnv6IJ6ZQ7OsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XXQS0omYuizKYGT5HZJHGVDflI7+DqssgJtBLMdjBuu+GsklX8UXRHUYdkW6Stdbq/GEkTzIBG2VwqENOHfjmCaJeqS0/9REQdLaBGbhURQHuvp0uLgO4/uoKf4llrGweJhQXi8N3WsxLiMjbS2TL0Sxgfgo9lJMIThoi24K9UovyJFHokm7D3E3kfTvMpxkjdf1/S9/4Gk13YKRKjisGbfei7DQh3ZM3/kl4S28ADF5g28Ir60bVGlWcU3p5W8RJr1fC98cT73MA/FhCjg5ohhh7bFA4NxjQ0wG8yy9dPHBzmOfXxwbPNZw45f2zXTqMlc4gQ5gCTNk0xVaLFT4pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c1blxTdZ; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c1blxTdZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC80R1wHsz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 18:42:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734421335; x=1765957335;
  h=date:from:to:cc:subject:message-id;
  bh=GHitgfIPe9eSCl01e/Kc9G2acukGSPn3vLSzABqHdKM=;
  b=c1blxTdZ7OdBtuvXz3seIgCsmNsln84xt4apLmDR9bXrV6ov6nqZ72gY
   Lq+xI9AFbyTZc1hnSM85uwYYX1dT9/s70NH4X3ANsTBJULE+2/3f6d0H5
   NVn2nBTPYpWd5HCJ9vmYUoRU4EtiN73EQ70LJNjoFZ201xmnhmlSpNgOt
   mmZV2XM2fpxFw7SUmpb0B8wCFNgGEHK4qSSI4OcDnD0N0Q+1DPbgbN7a1
   keVlA4p2NItOfpPDmA65GPH/DYDQ5OwRJosegqVaxVUJIjeV+DPyGx5As
   9wGF2udMTIXywkWJ94XfkPoAWJpBTOH1pT6GWhByUabkaJx2kZTkFhZ08
   A==;
X-CSE-ConnectionGUID: ZCSRKFmmSWGBd6Xt0GW9rQ==
X-CSE-MsgGUID: 4ArzBCTbTc6OBHEV+6JPsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38762406"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38762406"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 23:42:10 -0800
X-CSE-ConnectionGUID: qlbRRYxjRteamrZRnBZKtw==
X-CSE-MsgGUID: YSDTvsWURc25OaMe0U8cXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120710461"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Dec 2024 23:42:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNSDW-000EnQ-13;
	Tue, 17 Dec 2024 07:42:06 +0000
Date: Tue, 17 Dec 2024 15:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next-test] BUILD SUCCESS
 34064c8267a61063d684408db6ae78b571a9999d
Message-ID: <202412171550.PtYcyOSP-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 34064c8267a61063d684408db6ae78b571a9999d  powerpc/8xx: Drop legacy-of-mm-gpiochip.h header

elapsed time: 1364m

configs tested: 136
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                     nsimosci_hs_defconfig    gcc-13.2.0
arc                   randconfig-001-20241216    gcc-13.2.0
arc                   randconfig-002-20241216    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         bcm2835_defconfig    clang-16
arm                   randconfig-001-20241216    clang-15
arm                   randconfig-002-20241216    gcc-14.2.0
arm                   randconfig-003-20241216    clang-20
arm                   randconfig-004-20241216    clang-17
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241216    gcc-14.2.0
arm64                 randconfig-002-20241216    clang-20
arm64                 randconfig-003-20241216    gcc-14.2.0
arm64                 randconfig-004-20241216    clang-15
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241216    gcc-14.2.0
csky                  randconfig-001-20241217    gcc-14.2.0
csky                  randconfig-002-20241216    gcc-14.2.0
csky                  randconfig-002-20241217    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon               randconfig-001-20241216    clang-20
hexagon               randconfig-001-20241217    clang-20
hexagon               randconfig-002-20241216    clang-20
hexagon               randconfig-002-20241217    clang-19
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20241216    clang-19
i386        buildonly-randconfig-002-20241216    clang-19
i386        buildonly-randconfig-003-20241216    clang-19
i386        buildonly-randconfig-004-20241216    clang-19
i386        buildonly-randconfig-005-20241216    clang-19
i386        buildonly-randconfig-006-20241216    clang-19
i386                                defconfig    clang-19
loongarch                        alldefconfig    gcc-14.2.0
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20241216    gcc-14.2.0
loongarch             randconfig-001-20241217    gcc-14.2.0
loongarch             randconfig-002-20241216    gcc-14.2.0
loongarch             randconfig-002-20241217    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                  cavium_octeon_defconfig    gcc-14.2.0
mips                   sb1250_swarm_defconfig    gcc-14.2.0
nios2                         10m50_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241216    gcc-14.2.0
nios2                 randconfig-001-20241217    gcc-14.2.0
nios2                 randconfig-002-20241216    gcc-14.2.0
nios2                 randconfig-002-20241217    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241216    gcc-14.2.0
parisc                randconfig-001-20241217    gcc-14.2.0
parisc                randconfig-002-20241216    gcc-14.2.0
parisc                randconfig-002-20241217    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                       eiger_defconfig    clang-17
powerpc                 mpc836x_rdk_defconfig    clang-18
powerpc                      ppc64e_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241216    clang-20
powerpc               randconfig-002-20241216    clang-20
powerpc               randconfig-002-20241217    gcc-14.2.0
powerpc               randconfig-003-20241216    gcc-14.2.0
powerpc               randconfig-003-20241217    clang-16
powerpc                      tqm8xx_defconfig    clang-20
powerpc64             randconfig-001-20241216    clang-20
powerpc64             randconfig-002-20241216    clang-15
powerpc64             randconfig-003-20241216    gcc-14.2.0
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                 randconfig-001-20241216    clang-20
riscv                 randconfig-002-20241216    clang-15
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241216    gcc-14.2.0
s390                  randconfig-002-20241216    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                        dreamcast_defconfig    gcc-14.2.0
sh                    randconfig-001-20241216    gcc-14.2.0
sh                    randconfig-002-20241216    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20241216    gcc-14.2.0
sparc                 randconfig-002-20241216    gcc-14.2.0
sparc64               randconfig-001-20241216    gcc-14.2.0
sparc64               randconfig-002-20241216    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                    randconfig-001-20241216    gcc-12
um                    randconfig-002-20241216    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241216    gcc-12
x86_64      buildonly-randconfig-001-20241217    clang-19
x86_64      buildonly-randconfig-002-20241216    gcc-12
x86_64      buildonly-randconfig-002-20241217    gcc-12
x86_64      buildonly-randconfig-003-20241216    clang-19
x86_64      buildonly-randconfig-003-20241217    gcc-12
x86_64      buildonly-randconfig-004-20241216    clang-19
x86_64      buildonly-randconfig-004-20241217    clang-19
x86_64      buildonly-randconfig-005-20241216    clang-19
x86_64      buildonly-randconfig-005-20241217    gcc-12
x86_64      buildonly-randconfig-006-20241216    clang-19
x86_64      buildonly-randconfig-006-20241217    clang-19
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                generic_kc705_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241216    gcc-14.2.0
xtensa                randconfig-002-20241216    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

