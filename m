Return-Path: <linuxppc-dev+bounces-12807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A2BD73A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 06:15:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm18l6XxQz2yrZ;
	Tue, 14 Oct 2025 15:15:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760415319;
	cv=none; b=ByXh22yRbZAH7DrIie09uv1zPrNwLyauhA1zGmq9EqrR2v1f12XrCDQEIhsF9gJ64l+F4xL7ziB5OF9h4LvYIeYmUrKABse5rhnQOTBjIYVFrCH/SHH+3sm/+4EPTmZcD0dk9ha18LbFmRWjQ8QGME3g7vEqwi3wMZSCHxj7aGWwZpG7Uken1+YCsmC7vkyFI11tF99jExEQ2Oog7ViPREvmE+guwzqq/7nJMxGi+SyLLGJ5Q2Knd71VxSvzSQvUECOa3WR0jSu8WovgYGfX2jPrSw9a06vy0p7J7gQWAhNpTsNWarscKVhA8rS+zNBV/uUsrPgn/oaZTRSiGuBu7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760415319; c=relaxed/relaxed;
	bh=/GcgN6RGtVu90psCelObegRDFN+DFCBWsiTwxnoVsuc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ijWKdIp0sMx5q5U+AUL9uPrwzjVIuMUOKzHTB7VJdL6sKeL6vehq376OEbG0ycHaqoogRHDygfQIkeBk0CkhY3BWU30muT2Uu5amtO9FxJLD7H7Xr24w9tyPCZ1h7GHDg1gTLOsCI1EkDCcYNWkbP9XimX8Am5J4DOBMJfO0l8CQeIKcmQWTEIv33i8x5Bj4lh2rMjdqdDV/8Gr1tlrCTCGs38dIJ4vNR1tscksKdSbZXYX9Yp4TVde8/tk6umjQlkzGH+mdbDD0yXNPrsNu+pa0pDv1mW9bPzlziBifvd/UnkHVEx6liwzCjgMIQ1U2XOPniR2WqjoOUxSEckqTNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXW6jkCj; dkim-atps=neutral; spf=pass (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXW6jkCj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cm18j2SjVz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 15:15:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760415317; x=1791951317;
  h=date:from:to:cc:subject:message-id;
  bh=yOKBj2cb7RvLs8/JbisiiMDR/NJvu7jESGmJhQr3BZA=;
  b=NXW6jkCjk9H8Mng/U62HExSVCKJfua+X4ewhj0rZf/a5yuuatLxaHUh7
   PSg4djIPVKUvh0iaeuxkqO1GIivPDNjOg8E3WnIRA18Kvirkt8tgrFO7Q
   ECEdrHrM0NBOsTkw1NcMyzyJNL6+3WZTtyNWRt/0KKKhxFiQHHv8crdFK
   AXlAfqxDBkcZGZ6NVdrAp7zsDr2O0zba3VPR8eoNpVJgpOAdp6pSHzQ5P
   qZzAJmfLjihjOTaNkrhvOKHJN53PohYYTCiM6kZSaMyrpZmUOEYTNfwz6
   Cok98HnKYNVZcXoRITF2hHmTgEpiw4wVIaIdqMrkEhk9c/CGKhOfOy9Nk
   A==;
X-CSE-ConnectionGUID: 6RGvVusLQIa+M+QgJbKZEg==
X-CSE-MsgGUID: beLlXx6XRnyWKASyatI94Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73170376"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="73170376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 21:15:13 -0700
X-CSE-ConnectionGUID: s5SFfcHxRga+fQVtogfrMA==
X-CSE-MsgGUID: AlGg+foUTbuz/bzdLseUYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="186185155"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2025 21:15:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8WR0-0002L3-2o;
	Tue, 14 Oct 2025 04:15:10 +0000
Date: Tue, 14 Oct 2025 12:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 0843ba458439f38efdc14aa359c14ad0127edb01
Message-ID: <202510141244.4kukFFKL-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 0843ba458439f38efdc14aa359c14ad0127edb01  powerpc/fadump: skip parameter area allocation when fadump is disabled

elapsed time: 1321m

configs tested: 262
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    clang-22
alpha                             allnoconfig    gcc-15.1.0
alpha                            allyesconfig    clang-19
alpha                            allyesconfig    gcc-15.1.0
alpha                               defconfig    clang-19
arc                              allmodconfig    clang-19
arc                              allmodconfig    gcc-15.1.0
arc                               allnoconfig    clang-22
arc                               allnoconfig    gcc-15.1.0
arc                              allyesconfig    clang-19
arc                              allyesconfig    gcc-15.1.0
arc                                 defconfig    clang-19
arc                   randconfig-001-20251013    gcc-8.5.0
arc                   randconfig-001-20251014    clang-16
arc                   randconfig-002-20251013    gcc-13.4.0
arc                   randconfig-002-20251014    clang-16
arm                              allmodconfig    clang-19
arm                              allmodconfig    gcc-15.1.0
arm                               allnoconfig    clang-22
arm                              allyesconfig    clang-19
arm                              allyesconfig    gcc-15.1.0
arm                                 defconfig    clang-19
arm                         mv78xx0_defconfig    clang-18
arm                        mvebu_v5_defconfig    gcc-15.1.0
arm                   randconfig-001-20251013    gcc-10.5.0
arm                   randconfig-001-20251014    clang-16
arm                   randconfig-002-20251013    clang-22
arm                   randconfig-002-20251014    clang-16
arm                   randconfig-003-20251013    gcc-12.5.0
arm                   randconfig-003-20251014    clang-16
arm                   randconfig-004-20251013    clang-22
arm                   randconfig-004-20251014    clang-16
arm64                            allmodconfig    clang-19
arm64                             allnoconfig    clang-22
arm64                             allnoconfig    gcc-15.1.0
arm64                               defconfig    clang-19
arm64                 randconfig-001-20251013    clang-19
arm64                 randconfig-001-20251014    clang-16
arm64                 randconfig-002-20251013    gcc-8.5.0
arm64                 randconfig-002-20251014    clang-16
arm64                 randconfig-003-20251013    clang-22
arm64                 randconfig-003-20251014    clang-16
arm64                 randconfig-004-20251013    gcc-8.5.0
arm64                 randconfig-004-20251014    clang-16
csky                              allnoconfig    clang-22
csky                              allnoconfig    gcc-15.1.0
csky                                defconfig    clang-19
csky                  randconfig-001-20251013    gcc-15.1.0
csky                  randconfig-001-20251014    gcc-8.5.0
csky                  randconfig-002-20251013    gcc-15.1.0
csky                  randconfig-002-20251014    gcc-8.5.0
hexagon                          allmodconfig    clang-17
hexagon                          allmodconfig    clang-19
hexagon                           allnoconfig    clang-22
hexagon                          allyesconfig    clang-19
hexagon                          allyesconfig    clang-22
hexagon                             defconfig    clang-19
hexagon               randconfig-001-20251013    clang-22
hexagon               randconfig-001-20251014    gcc-8.5.0
hexagon               randconfig-002-20251013    clang-22
hexagon               randconfig-002-20251014    gcc-8.5.0
i386                             allmodconfig    clang-20
i386                             allmodconfig    gcc-14
i386                              allnoconfig    clang-20
i386                              allnoconfig    gcc-14
i386                             allyesconfig    clang-20
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20251013    gcc-13
i386        buildonly-randconfig-001-20251014    gcc-14
i386        buildonly-randconfig-002-20251013    clang-20
i386        buildonly-randconfig-002-20251014    gcc-14
i386        buildonly-randconfig-003-20251013    gcc-14
i386        buildonly-randconfig-003-20251014    gcc-14
i386        buildonly-randconfig-004-20251013    clang-20
i386        buildonly-randconfig-004-20251014    gcc-14
i386        buildonly-randconfig-005-20251013    gcc-14
i386        buildonly-randconfig-005-20251014    gcc-14
i386        buildonly-randconfig-006-20251013    gcc-14
i386        buildonly-randconfig-006-20251014    gcc-14
i386                                defconfig    clang-20
i386                  randconfig-001-20251014    clang-20
i386                  randconfig-002-20251014    clang-20
i386                  randconfig-003-20251014    clang-20
i386                  randconfig-004-20251014    clang-20
i386                  randconfig-005-20251014    clang-20
i386                  randconfig-006-20251014    clang-20
i386                  randconfig-007-20251014    clang-20
i386                  randconfig-011-20251014    gcc-14
i386                  randconfig-012-20251014    gcc-14
i386                  randconfig-013-20251014    gcc-14
i386                  randconfig-014-20251014    gcc-14
i386                  randconfig-015-20251014    gcc-14
i386                  randconfig-016-20251014    gcc-14
i386                  randconfig-017-20251014    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                         allnoconfig    clang-22
loongarch                           defconfig    clang-19
loongarch             randconfig-001-20251013    clang-18
loongarch             randconfig-001-20251014    gcc-8.5.0
loongarch             randconfig-002-20251013    gcc-13.4.0
loongarch             randconfig-002-20251014    gcc-8.5.0
m68k                             allmodconfig    gcc-15.1.0
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    gcc-15.1.0
m68k                                defconfig    clang-19
microblaze                       allmodconfig    gcc-15.1.0
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    gcc-15.1.0
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
mips                          ath79_defconfig    clang-18
mips                          eyeq6_defconfig    clang-22
mips                            gpr_defconfig    clang-18
nios2                             allnoconfig    gcc-11.5.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-11.5.0
nios2                 randconfig-001-20251013    gcc-8.5.0
nios2                 randconfig-001-20251014    gcc-8.5.0
nios2                 randconfig-002-20251013    gcc-8.5.0
nios2                 randconfig-002-20251014    gcc-8.5.0
openrisc                          allnoconfig    clang-22
openrisc                          allnoconfig    gcc-15.1.0
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-14
openrisc                            defconfig    gcc-15.1.0
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                            allnoconfig    gcc-15.1.0
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20251013    gcc-12.5.0
parisc                randconfig-001-20251014    gcc-8.5.0
parisc                randconfig-002-20251013    gcc-8.5.0
parisc                randconfig-002-20251014    gcc-8.5.0
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    clang-22
powerpc                          allyesconfig    gcc-15.1.0
powerpc                      bamboo_defconfig    clang-18
powerpc                        cell_defconfig    clang-18
powerpc                       ebony_defconfig    clang-22
powerpc                          g5_defconfig    gcc-15.1.0
powerpc                        icon_defconfig    clang-18
powerpc                 mpc832x_rdb_defconfig    gcc-15.1.0
powerpc               randconfig-001-20251013    clang-22
powerpc               randconfig-001-20251014    gcc-8.5.0
powerpc               randconfig-002-20251013    clang-18
powerpc               randconfig-002-20251014    gcc-8.5.0
powerpc               randconfig-003-20251013    clang-22
powerpc               randconfig-003-20251014    gcc-8.5.0
powerpc                 xes_mpc85xx_defconfig    clang-18
powerpc64             randconfig-001-20251013    gcc-10.5.0
powerpc64             randconfig-001-20251014    gcc-8.5.0
powerpc64             randconfig-002-20251013    gcc-15.1.0
powerpc64             randconfig-002-20251014    gcc-8.5.0
powerpc64             randconfig-003-20251013    clang-20
powerpc64             randconfig-003-20251014    gcc-8.5.0
riscv                            allmodconfig    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                             allnoconfig    gcc-15.1.0
riscv                            allyesconfig    clang-16
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    clang-22
riscv                               defconfig    gcc-14
riscv                 randconfig-001-20251013    clang-22
riscv                 randconfig-001-20251014    gcc-10.5.0
riscv                 randconfig-002-20251013    clang-22
riscv                 randconfig-002-20251014    gcc-10.5.0
s390                             allmodconfig    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    clang-22
s390                                defconfig    gcc-14
s390                  randconfig-001-20251013    gcc-8.5.0
s390                  randconfig-001-20251014    gcc-10.5.0
s390                  randconfig-002-20251013    clang-22
s390                  randconfig-002-20251014    gcc-10.5.0
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-14
sh                                  defconfig    gcc-15.1.0
sh                    randconfig-001-20251013    gcc-10.5.0
sh                    randconfig-001-20251014    gcc-10.5.0
sh                    randconfig-002-20251013    gcc-15.1.0
sh                    randconfig-002-20251014    gcc-10.5.0
sh                           se7705_defconfig    clang-18
sh                            shmin_defconfig    gcc-15.1.0
sh                             shx3_defconfig    gcc-15.1.0
sh                          urquell_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20251013    gcc-8.5.0
sparc                 randconfig-001-20251014    gcc-10.5.0
sparc                 randconfig-002-20251013    gcc-8.5.0
sparc                 randconfig-002-20251014    gcc-10.5.0
sparc64                             defconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20251013    clang-20
sparc64               randconfig-001-20251014    gcc-10.5.0
sparc64               randconfig-002-20251013    gcc-14.3.0
sparc64               randconfig-002-20251014    gcc-10.5.0
um                               allmodconfig    clang-19
um                                allnoconfig    clang-22
um                               allyesconfig    clang-19
um                               allyesconfig    gcc-14
um                                  defconfig    clang-22
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20251013    gcc-14
um                    randconfig-001-20251014    gcc-10.5.0
um                    randconfig-002-20251013    gcc-14
um                    randconfig-002-20251014    gcc-10.5.0
um                           x86_64_defconfig    clang-22
um                           x86_64_defconfig    gcc-14
x86_64                            allnoconfig    clang-20
x86_64                           allyesconfig    clang-20
x86_64      buildonly-randconfig-001-20251013    gcc-13
x86_64      buildonly-randconfig-001-20251014    gcc-14
x86_64      buildonly-randconfig-002-20251013    clang-20
x86_64      buildonly-randconfig-002-20251014    gcc-14
x86_64      buildonly-randconfig-003-20251013    clang-20
x86_64      buildonly-randconfig-003-20251014    gcc-14
x86_64      buildonly-randconfig-004-20251013    gcc-14
x86_64      buildonly-randconfig-004-20251014    gcc-14
x86_64      buildonly-randconfig-005-20251013    clang-20
x86_64      buildonly-randconfig-005-20251014    gcc-14
x86_64      buildonly-randconfig-006-20251013    clang-20
x86_64      buildonly-randconfig-006-20251014    gcc-14
x86_64                              defconfig    clang-20
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20251014    gcc-14
x86_64                randconfig-002-20251014    gcc-14
x86_64                randconfig-003-20251014    gcc-14
x86_64                randconfig-004-20251014    gcc-14
x86_64                randconfig-005-20251014    gcc-14
x86_64                randconfig-006-20251014    gcc-14
x86_64                randconfig-007-20251014    gcc-14
x86_64                randconfig-008-20251014    gcc-14
x86_64                randconfig-071-20251014    gcc-14
x86_64                randconfig-072-20251014    gcc-14
x86_64                randconfig-073-20251014    gcc-14
x86_64                randconfig-074-20251014    gcc-14
x86_64                randconfig-075-20251014    gcc-14
x86_64                randconfig-076-20251014    gcc-14
x86_64                randconfig-077-20251014    gcc-14
x86_64                randconfig-078-20251014    gcc-14
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
x86_64                          rhel-9.4-rust    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                randconfig-001-20251013    gcc-11.5.0
xtensa                randconfig-001-20251014    gcc-10.5.0
xtensa                randconfig-002-20251013    gcc-11.5.0
xtensa                randconfig-002-20251014    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

