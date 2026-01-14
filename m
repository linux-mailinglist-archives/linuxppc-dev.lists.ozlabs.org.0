Return-Path: <linuxppc-dev+bounces-15749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 323B0D2125C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 21:16:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dry7H42gQz2xNg;
	Thu, 15 Jan 2026 07:16:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768421787;
	cv=none; b=F/NNJ0pzHhnk9HJ+zyi01yWQcDdIxB7mGjpXSgvx3HVFIk5ZPcNh63AhP96f7lw5c5o/3wsrPZRPzsGV2Oe+ryRbKTFFBDu+m7hthZDDpeV8NQ9kj836i5ymJJbOeYmWoCAPI7fmPyAplMryxYjXgu2dyrtfGLwe5j7aevf68PpJr14X+1x74DaA8KfAdzQ+1heP9Zre2syS8CzAfxGjBpibnCNPuDwR9zG94LSYHhamh5ojm/MX2a4jFNiYnp6c6otwn/xGoM1TtPhbkm0Qy9W793HaaAYqecOHS3DW62ofqjaEmMHqCJmpMT2eag9QJHttdly6WD2WOGNFiIh5Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768421787; c=relaxed/relaxed;
	bh=O4zZ7akBVpvVG3Ud8rmVTlyyS5uzf//zj8DUOx+Kt18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TAf8hORcvNMdD1vsiUhBsw7r5chVmmG4WL2T/TJYYj0VSedvtS55zc3BieDu3+DVu+FeJGTarAhONUzRgTHNoJlDahxItdqN6msZaxojD6NWKsDMDOw+3YazyXkk5K3YzcViBtBUavnV5in9iQxjh1XMHUZgH8DZkXRs3yATOINmb0xxH10Dw+nIWw9WcVc/YDsX9Iqv9Xslx/WYrbDp8D2RJrLeM0NemIF9bjRdwY7gu7b0mhGTtEn9y9aIqBDuiYWVJpAaaFfBxa5vBSeuuSEHwrhdVQnNxSephgLeN2BmU5QYCSrcJS6BaaGsJ45XhPaY1KMifzFn99TF+i5O8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J1BHnOr6; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J1BHnOr6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dry7D3mkRz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 07:16:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768421785; x=1799957785;
  h=date:from:to:cc:subject:message-id;
  bh=SQuEkQmNGlE7vkMUL6fgGiucKYEs6/LAsMny7HjIZNI=;
  b=J1BHnOr6rag+khSKtDql755bPJFMZFCv0VHcB8JIBoRoyqe3SStX4A5z
   mrwNyjnZaEGXXLpC8u4lGSoZE/NRyw0dybgNxDEcpktF6ryK3q8jCHk8j
   XbvBqry9dqbuYXVIZhEA7TVhzlMc2+f6pGkIkYnqMU4zPq/+md6zESo2I
   tkR9FnGb3Ic25da4zKdhaL//aYgeDTj7zuB0CVFWyrcPKwAIZ2qMXfGIl
   DtfCdtd2LTTmOTn2U+VSYq250gdCuk0JShx4dqhb6NhAoYlY7C24vI63J
   H5XOVAUU72oItxOx4ahFIc9qPoD6L7mngNQtNWJkCvb+etEgpxT7v+CUp
   g==;
X-CSE-ConnectionGUID: ieuKoKI5QaOTubk14D+ViQ==
X-CSE-MsgGUID: O3IHFwCZQCWRQ79Zx8VgMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69896197"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69896197"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 12:16:20 -0800
X-CSE-ConnectionGUID: 3uAsvrDqT56aYsGL6qReWA==
X-CSE-MsgGUID: hpAUKcVhQw+O7+kSPYryjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204390058"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 12:16:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg7Hr-00000000Gxc-3oPj;
	Wed, 14 Jan 2026 20:16:15 +0000
Date: Thu, 15 Jan 2026 04:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 960c1fd29055f49b8d1eaf187ae436acd2591c0d
Message-ID: <202601150426.kbkGY7NL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: 960c1fd29055f49b8d1eaf187ae436acd2591c0d  powerpc/ci: Fix boot issues with corenet32_smp_defconfig for e500mc

elapsed time: 851m

configs tested: 201
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-15.2.0
alpha                            allyesconfig    gcc-15.2.0
alpha                               defconfig    gcc-15.2.0
arc                              allmodconfig    clang-16
arc                               allnoconfig    gcc-15.2.0
arc                              allyesconfig    clang-22
arc                                 defconfig    gcc-15.2.0
arc                            hsdk_defconfig    gcc-15.2.0
arc                 nsimosci_hs_smp_defconfig    gcc-15.2.0
arc                   randconfig-001-20260114    gcc-10.5.0
arc                   randconfig-002-20260114    gcc-10.5.0
arm                               allnoconfig    gcc-15.2.0
arm                              allyesconfig    clang-16
arm                         at91_dt_defconfig    clang-22
arm                                 defconfig    gcc-15.2.0
arm                          ep93xx_defconfig    gcc-15.2.0
arm                            hisi_defconfig    gcc-15.2.0
arm                          ixp4xx_defconfig    clang-22
arm                          moxart_defconfig    clang-22
arm                   randconfig-001-20260114    gcc-10.5.0
arm                   randconfig-002-20260114    gcc-10.5.0
arm                   randconfig-003-20260114    gcc-10.5.0
arm                   randconfig-004-20260114    gcc-10.5.0
arm                         s5pv210_defconfig    gcc-15.2.0
arm                           sama7_defconfig    clang-22
arm                        shmobile_defconfig    gcc-15.2.0
arm                       spear13xx_defconfig    gcc-15.2.0
arm64                            allmodconfig    clang-22
arm64                             allnoconfig    gcc-15.2.0
arm64                               defconfig    gcc-15.2.0
arm64                 randconfig-001-20260114    clang-22
arm64                 randconfig-002-20260114    clang-22
arm64                 randconfig-003-20260114    clang-22
arm64                 randconfig-004-20260114    clang-22
csky                             allmodconfig    gcc-15.2.0
csky                              allnoconfig    gcc-15.2.0
csky                                defconfig    gcc-15.2.0
csky                  randconfig-001-20260114    clang-22
csky                  randconfig-002-20260114    clang-22
hexagon                          allmodconfig    gcc-15.2.0
hexagon                           allnoconfig    gcc-15.2.0
hexagon                             defconfig    gcc-15.2.0
hexagon               randconfig-001-20260114    clang-22
hexagon               randconfig-002-20260114    clang-22
i386                             allmodconfig    clang-20
i386                              allnoconfig    gcc-15.2.0
i386                             allyesconfig    clang-20
i386        buildonly-randconfig-001-20260114    gcc-14
i386        buildonly-randconfig-002-20260114    gcc-14
i386        buildonly-randconfig-003-20260114    gcc-14
i386        buildonly-randconfig-004-20260114    gcc-14
i386        buildonly-randconfig-005-20260114    gcc-14
i386        buildonly-randconfig-006-20260114    gcc-14
i386                                defconfig    gcc-15.2.0
i386                  randconfig-001-20260114    gcc-14
i386                  randconfig-002-20260114    gcc-14
i386                  randconfig-003-20260114    gcc-14
i386                  randconfig-004-20260114    gcc-14
i386                  randconfig-005-20260114    gcc-14
i386                  randconfig-006-20260114    gcc-14
i386                  randconfig-007-20260114    gcc-14
i386                  randconfig-011-20260114    gcc-14
i386                  randconfig-012-20260114    gcc-14
i386                  randconfig-013-20260114    gcc-14
i386                  randconfig-014-20260114    gcc-14
i386                  randconfig-015-20260114    gcc-14
i386                  randconfig-016-20260114    gcc-14
i386                  randconfig-017-20260114    gcc-14
loongarch                        allmodconfig    clang-22
loongarch                         allnoconfig    gcc-15.2.0
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20260114    clang-22
loongarch             randconfig-002-20260114    clang-22
m68k                             allmodconfig    gcc-15.2.0
m68k                              allnoconfig    gcc-15.2.0
m68k                             allyesconfig    clang-16
m68k                                defconfig    clang-19
microblaze                        allnoconfig    gcc-15.2.0
microblaze                       allyesconfig    gcc-15.2.0
microblaze                          defconfig    clang-19
mips                             allmodconfig    gcc-15.2.0
mips                              allnoconfig    gcc-15.2.0
mips                             allyesconfig    gcc-15.2.0
mips                           ip28_defconfig    gcc-15.2.0
mips                           mtx1_defconfig    gcc-15.2.0
mips                      pic32mzda_defconfig    clang-22
mips                          rb532_defconfig    clang-22
nios2                            allmodconfig    clang-22
nios2                             allnoconfig    clang-22
nios2                               defconfig    clang-19
nios2                 randconfig-001-20260114    clang-22
nios2                 randconfig-002-20260114    clang-22
openrisc                         alldefconfig    gcc-15.2.0
openrisc                         allmodconfig    clang-22
openrisc                          allnoconfig    clang-22
openrisc                            defconfig    gcc-15.2.0
parisc                           allmodconfig    gcc-15.2.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    clang-19
parisc                              defconfig    gcc-15.2.0
parisc                randconfig-001-20260114    gcc-14.3.0
parisc                randconfig-001-20260115    clang-22
parisc                randconfig-002-20260114    gcc-14.3.0
parisc                randconfig-002-20260115    clang-22
parisc64                            defconfig    clang-19
powerpc                          allmodconfig    gcc-15.2.0
powerpc                           allnoconfig    clang-22
powerpc                 linkstation_defconfig    clang-22
powerpc                 linkstation_defconfig    gcc-15.2.0
powerpc                   lite5200b_defconfig    gcc-15.2.0
powerpc                 mpc832x_rdb_defconfig    gcc-15.2.0
powerpc               randconfig-001-20260114    gcc-14.3.0
powerpc               randconfig-001-20260115    clang-22
powerpc               randconfig-002-20260114    gcc-14.3.0
powerpc               randconfig-002-20260115    clang-22
powerpc                     tqm8555_defconfig    gcc-15.2.0
powerpc64             randconfig-001-20260114    gcc-14.3.0
powerpc64             randconfig-001-20260115    clang-22
powerpc64             randconfig-002-20260114    gcc-14.3.0
powerpc64             randconfig-002-20260115    clang-22
riscv                            allmodconfig    clang-22
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    clang-16
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-15.2.0
riscv                 randconfig-001-20260114    gcc-14.3.0
riscv                 randconfig-001-20260114    gcc-15.2.0
riscv                 randconfig-002-20260114    gcc-15.2.0
riscv                 randconfig-002-20260114    gcc-9.5.0
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.2.0
s390                                defconfig    gcc-15.2.0
s390                  randconfig-001-20260114    gcc-15.2.0
s390                  randconfig-002-20260114    gcc-15.2.0
s390                  randconfig-002-20260114    gcc-8.5.0
sh                               allmodconfig    gcc-15.2.0
sh                                allnoconfig    clang-22
sh                               allyesconfig    clang-19
sh                                  defconfig    gcc-14
sh                          kfr2r09_defconfig    gcc-15.2.0
sh                    randconfig-001-20260114    gcc-15.2.0
sh                    randconfig-002-20260114    gcc-12.5.0
sh                    randconfig-002-20260114    gcc-15.2.0
sh                             shx3_defconfig    gcc-15.2.0
sparc                             allnoconfig    clang-22
sparc                               defconfig    gcc-15.2.0
sparc                 randconfig-001-20260114    clang-20
sparc                 randconfig-002-20260114    clang-20
sparc64                          allmodconfig    clang-22
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260114    clang-20
sparc64               randconfig-002-20260114    clang-20
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    gcc-15.2.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260114    clang-20
um                    randconfig-002-20260114    clang-20
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-20
x86_64                            allnoconfig    clang-22
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20260114    clang-20
x86_64      buildonly-randconfig-002-20260114    clang-20
x86_64      buildonly-randconfig-003-20260114    clang-20
x86_64      buildonly-randconfig-004-20260114    clang-20
x86_64      buildonly-randconfig-005-20260114    clang-20
x86_64      buildonly-randconfig-006-20260114    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20260114    gcc-14
x86_64                randconfig-002-20260114    gcc-14
x86_64                randconfig-003-20260114    gcc-14
x86_64                randconfig-004-20260114    gcc-14
x86_64                randconfig-005-20260114    gcc-14
x86_64                randconfig-006-20260114    gcc-14
x86_64                randconfig-011-20260114    gcc-14
x86_64                randconfig-012-20260114    gcc-14
x86_64                randconfig-013-20260114    gcc-14
x86_64                randconfig-014-20260114    gcc-14
x86_64                randconfig-015-20260114    gcc-14
x86_64                randconfig-016-20260114    gcc-14
x86_64                randconfig-071-20260114    clang-20
x86_64                randconfig-072-20260114    clang-20
x86_64                randconfig-073-20260114    clang-20
x86_64                randconfig-074-20260114    clang-20
x86_64                randconfig-075-20260114    clang-20
x86_64                randconfig-076-20260114    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    clang-22
xtensa                           allyesconfig    clang-22
xtensa                randconfig-001-20260114    clang-20
xtensa                randconfig-002-20260114    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

