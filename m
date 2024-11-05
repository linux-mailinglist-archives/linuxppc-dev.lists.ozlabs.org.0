Return-Path: <linuxppc-dev+bounces-2889-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AD9BD9BC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 00:31:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjl2V2zx0z2yFP;
	Wed,  6 Nov 2024 10:30:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730849458;
	cv=none; b=SvPSuQw73g60QP0fb1xAZWLTmBYL3zzYdWGeaveGMiBX/swkX9eNdaTH42TPqVCLZg3f+5GD7H7Kskh5vsx5384Z0SLxj6XmAgIYzgTsyroweJGjJ3AcbIa6zUNWq2e5jBzvpkk6o8qm/ni54H1PxAhWe5fO83G8P37FuTXQzPHZRzzRc0QVsLjpXiCeG+68EY1FACRWfHY/8gRcltdVus0mfQnmXCNG8NNTeCC8NZ3yde49Q4Fj28dTZtn9YRjg2R+1Gw1DTxfoVWkHj7/xDopAjlcLru8nXKuHnec3hM69yDXPiigIXNARDVEuw7AR8F42pnJBUwU0vr94gXjRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730849458; c=relaxed/relaxed;
	bh=LoBU4fDtUqjWdQuxDeeNyzRPZABX9yNfvyaSqkN6758=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W2eHt2oilE5iGKh6oHPSPyTM67I+okLxCJm9CVS3iJZ3CcOL2T4ni0jChRqS+65xCkVJgND+4vYsDztUB2RYvlKiDoBYnknje4YkLfOf5w0LFDueVCacE6qCpBlFpjnut+1SQbYtmdRnrmIj7BwEOOKA62pQpwJ9AEau2bGuZAyODc/roA2232JcjUIqmamskIkvjBY+F7Az1HcsHgAxKQvxAs0++CD+xeyYa2vsU0vaTfFbqfLbxVIDJ9YI/75R/BSvA8FtHQdOLS8C0rTjG5eTphRirsXImxGtPtlYMDNWuNE4UBdLtZwx6WEECGkdV3RmF07/Vj38dTLL2DDORA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrhXye/b; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lrhXye/b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjl2T04Fbz2xjJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 10:30:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730849457; x=1762385457;
  h=date:from:to:cc:subject:message-id;
  bh=Tr1aj8vMDXQ7cTZPm6zx8f8bLd426G+289GYECSGFEI=;
  b=lrhXye/bFr9mvb3Ax49S0+fixKl04u20lak4qbywx2g3gxOrpoDAaLT0
   SbO96hlilHKuabfb5qQclGu4Fq/wgfjufC5waIm3Gdxu8co9VgpobTzFR
   oN9wAgSb1ivHSgXBUmfggia40dpIOyWnax8DjKsApAXEyV7UOMiMnecq4
   PJTbTxQegL4JiovvWPn4hOjYrdM1r9qn2REwPbNQCaNf0hvzJm6JA30a5
   qJhMdPSY4casb2JBChS3yDR2iqizPwIEgRshk0ihIX8mjalWG1JLcFFO6
   Pzphno8N+CKfthQEzhsDhp4cVMigukF2QBpT/VPd8WYHkrY5wAJebMBDz
   A==;
X-CSE-ConnectionGUID: +sPGweP2Stye/hZHYgUyMg==
X-CSE-MsgGUID: K/o4OWwuQDS+ER2/LpRf9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30053173"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30053173"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 15:30:54 -0800
X-CSE-ConnectionGUID: oWeZE0s3SEyB2hFbE+b0zA==
X-CSE-MsgGUID: tz0xJ0wPScOvlt0tXbJXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84126727"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2024 15:30:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8T0c-000mb5-0l;
	Tue, 05 Nov 2024 23:30:50 +0000
Date: Wed, 06 Nov 2024 07:30:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 ad0be02f7009e3388de94b35d56336de22d79afc
Message-ID: <202411060706.z4xcqBRt-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: ad0be02f7009e3388de94b35d56336de22d79afc  Automatic merge of 'next' into merge (2024-11-04 17:04)

elapsed time: 735m

configs tested: 254
configs skipped: 11

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
arc                        nsim_700_defconfig    gcc-14.1.0
arc                   randconfig-001-20241105    gcc-14.1.0
arc                   randconfig-001-20241106    gcc-14.1.0
arc                   randconfig-002-20241105    gcc-14.1.0
arc                   randconfig-002-20241106    gcc-14.1.0
arc                    vdk_hs38_smp_defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                       aspeed_g5_defconfig    gcc-14.1.0
arm                        clps711x_defconfig    clang-20
arm                        clps711x_defconfig    gcc-14.1.0
arm                                 defconfig    gcc-14.1.0
arm                       imx_v4_v5_defconfig    gcc-14.1.0
arm                           imxrt_defconfig    gcc-14.1.0
arm                          ixp4xx_defconfig    clang-20
arm                             mxs_defconfig    gcc-14.1.0
arm                           omap1_defconfig    gcc-14.1.0
arm                   randconfig-001-20241105    gcc-14.1.0
arm                   randconfig-001-20241106    gcc-14.1.0
arm                   randconfig-002-20241105    gcc-14.1.0
arm                   randconfig-002-20241106    gcc-14.1.0
arm                   randconfig-003-20241105    gcc-14.1.0
arm                   randconfig-003-20241106    gcc-14.1.0
arm                   randconfig-004-20241105    gcc-14.1.0
arm                   randconfig-004-20241106    gcc-14.1.0
arm                         socfpga_defconfig    gcc-14.1.0
arm                           spitz_defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
arm64                 randconfig-001-20241105    gcc-14.1.0
arm64                 randconfig-001-20241106    gcc-14.1.0
arm64                 randconfig-002-20241105    gcc-14.1.0
arm64                 randconfig-002-20241106    gcc-14.1.0
arm64                 randconfig-003-20241105    gcc-14.1.0
arm64                 randconfig-003-20241106    gcc-14.1.0
arm64                 randconfig-004-20241105    gcc-14.1.0
arm64                 randconfig-004-20241106    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
csky                  randconfig-001-20241105    gcc-14.1.0
csky                  randconfig-001-20241106    gcc-14.1.0
csky                  randconfig-002-20241105    gcc-14.1.0
csky                  randconfig-002-20241106    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
hexagon               randconfig-001-20241105    gcc-14.1.0
hexagon               randconfig-001-20241106    gcc-14.1.0
hexagon               randconfig-002-20241105    gcc-14.1.0
hexagon               randconfig-002-20241106    gcc-14.1.0
i386                             allmodconfig    clang-19
i386                              allnoconfig    clang-19
i386                             allyesconfig    clang-19
i386        buildonly-randconfig-001-20241105    clang-19
i386        buildonly-randconfig-001-20241106    gcc-12
i386        buildonly-randconfig-002-20241105    clang-19
i386        buildonly-randconfig-002-20241106    gcc-12
i386        buildonly-randconfig-003-20241105    clang-19
i386        buildonly-randconfig-003-20241106    gcc-12
i386        buildonly-randconfig-004-20241105    clang-19
i386        buildonly-randconfig-004-20241106    gcc-12
i386        buildonly-randconfig-005-20241105    clang-19
i386        buildonly-randconfig-005-20241106    gcc-12
i386        buildonly-randconfig-006-20241105    clang-19
i386        buildonly-randconfig-006-20241106    gcc-12
i386                                defconfig    clang-19
i386                  randconfig-001-20241105    clang-19
i386                  randconfig-001-20241106    gcc-12
i386                  randconfig-002-20241105    clang-19
i386                  randconfig-002-20241106    gcc-12
i386                  randconfig-003-20241105    clang-19
i386                  randconfig-003-20241106    gcc-12
i386                  randconfig-004-20241105    clang-19
i386                  randconfig-004-20241106    gcc-12
i386                  randconfig-005-20241105    clang-19
i386                  randconfig-005-20241106    gcc-12
i386                  randconfig-006-20241105    clang-19
i386                  randconfig-006-20241106    gcc-12
i386                  randconfig-011-20241105    clang-19
i386                  randconfig-011-20241106    gcc-12
i386                  randconfig-012-20241105    clang-19
i386                  randconfig-012-20241106    gcc-12
i386                  randconfig-013-20241105    clang-19
i386                  randconfig-013-20241106    gcc-12
i386                  randconfig-014-20241105    clang-19
i386                  randconfig-014-20241106    gcc-12
i386                  randconfig-015-20241105    clang-19
i386                  randconfig-015-20241106    gcc-12
i386                  randconfig-016-20241105    clang-19
i386                  randconfig-016-20241106    gcc-12
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
loongarch             randconfig-001-20241105    gcc-14.1.0
loongarch             randconfig-001-20241106    gcc-14.1.0
loongarch             randconfig-002-20241105    gcc-14.1.0
loongarch             randconfig-002-20241106    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
m68k                       m5275evb_defconfig    clang-20
m68k                        mvme147_defconfig    clang-20
m68k                        mvme16x_defconfig    clang-20
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
microblaze                      mmu_defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
mips                         bigsur_defconfig    gcc-14.1.0
mips                           gcw0_defconfig    gcc-14.1.0
mips                        maltaup_defconfig    clang-20
nios2                         10m50_defconfig    clang-20
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
nios2                 randconfig-001-20241105    gcc-14.1.0
nios2                 randconfig-001-20241106    gcc-14.1.0
nios2                 randconfig-002-20241105    gcc-14.1.0
nios2                 randconfig-002-20241106    gcc-14.1.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
openrisc                       virt_defconfig    clang-20
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc                randconfig-001-20241105    gcc-14.1.0
parisc                randconfig-001-20241106    gcc-14.1.0
parisc                randconfig-002-20241105    gcc-14.1.0
parisc                randconfig-002-20241106    gcc-14.1.0
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.1.0
powerpc                      cm5200_defconfig    gcc-14.1.0
powerpc                        fsp2_defconfig    clang-20
powerpc                       holly_defconfig    clang-20
powerpc                      mgcoge_defconfig    gcc-14.1.0
powerpc                 mpc832x_rdb_defconfig    gcc-14.1.0
powerpc                 mpc834x_itx_defconfig    gcc-14.1.0
powerpc                      ppc44x_defconfig    gcc-14.1.0
powerpc               randconfig-001-20241105    gcc-14.1.0
powerpc               randconfig-001-20241106    gcc-14.1.0
powerpc               randconfig-002-20241105    gcc-14.1.0
powerpc               randconfig-002-20241106    gcc-14.1.0
powerpc               randconfig-003-20241105    gcc-14.1.0
powerpc               randconfig-003-20241106    gcc-14.1.0
powerpc                     skiroot_defconfig    gcc-14.1.0
powerpc64             randconfig-001-20241105    gcc-14.1.0
powerpc64             randconfig-001-20241106    gcc-14.1.0
powerpc64             randconfig-002-20241105    gcc-14.1.0
powerpc64             randconfig-002-20241106    gcc-14.1.0
powerpc64             randconfig-003-20241105    gcc-14.1.0
powerpc64             randconfig-003-20241106    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
riscv             nommu_k210_sdcard_defconfig    clang-20
riscv                 randconfig-001-20241105    gcc-14.1.0
riscv                 randconfig-001-20241106    gcc-14.1.0
riscv                 randconfig-002-20241105    gcc-14.1.0
riscv                 randconfig-002-20241106    gcc-14.1.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20241105    gcc-14.1.0
s390                  randconfig-001-20241106    gcc-14.1.0
s390                  randconfig-002-20241105    gcc-14.1.0
s390                  randconfig-002-20241106    gcc-14.1.0
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                         ap325rxa_defconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sh                        edosk7705_defconfig    gcc-14.1.0
sh                    randconfig-001-20241105    gcc-14.1.0
sh                    randconfig-001-20241106    gcc-14.1.0
sh                    randconfig-002-20241105    gcc-14.1.0
sh                    randconfig-002-20241106    gcc-14.1.0
sh                      rts7751r2d1_defconfig    gcc-14.1.0
sh                          sdk7786_defconfig    gcc-14.1.0
sh                           se7724_defconfig    gcc-14.1.0
sh                   secureedge5410_defconfig    gcc-14.1.0
sh                           sh2007_defconfig    gcc-14.1.0
sh                   sh7724_generic_defconfig    gcc-14.1.0
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20241105    gcc-14.1.0
sparc64               randconfig-001-20241106    gcc-14.1.0
sparc64               randconfig-002-20241105    gcc-14.1.0
sparc64               randconfig-002-20241106    gcc-14.1.0
um                               alldefconfig    clang-20
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20241105    gcc-14.1.0
um                    randconfig-001-20241106    gcc-14.1.0
um                    randconfig-002-20241105    gcc-14.1.0
um                    randconfig-002-20241106    gcc-14.1.0
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20241105    gcc-12
x86_64      buildonly-randconfig-002-20241105    gcc-12
x86_64      buildonly-randconfig-003-20241105    gcc-12
x86_64      buildonly-randconfig-004-20241105    gcc-12
x86_64      buildonly-randconfig-005-20241105    gcc-12
x86_64      buildonly-randconfig-006-20241105    gcc-12
x86_64                              defconfig    clang-19
x86_64                                  kexec    clang-19
x86_64                                  kexec    gcc-12
x86_64                randconfig-001-20241105    gcc-12
x86_64                randconfig-002-20241105    gcc-12
x86_64                randconfig-003-20241105    gcc-12
x86_64                randconfig-004-20241105    gcc-12
x86_64                randconfig-005-20241105    gcc-12
x86_64                randconfig-006-20241105    gcc-12
x86_64                randconfig-011-20241105    gcc-12
x86_64                randconfig-012-20241105    gcc-12
x86_64                randconfig-013-20241105    gcc-12
x86_64                randconfig-014-20241105    gcc-12
x86_64                randconfig-015-20241105    gcc-12
x86_64                randconfig-016-20241105    gcc-12
x86_64                randconfig-071-20241105    gcc-12
x86_64                randconfig-072-20241105    gcc-12
x86_64                randconfig-073-20241105    gcc-12
x86_64                randconfig-074-20241105    gcc-12
x86_64                randconfig-075-20241105    gcc-12
x86_64                randconfig-076-20241105    gcc-12
x86_64                               rhel-8.3    gcc-12
xtensa                            allnoconfig    gcc-14.1.0
xtensa                       common_defconfig    clang-20
xtensa                generic_kc705_defconfig    gcc-14.1.0
xtensa                randconfig-001-20241105    gcc-14.1.0
xtensa                randconfig-001-20241106    gcc-14.1.0
xtensa                randconfig-002-20241105    gcc-14.1.0
xtensa                randconfig-002-20241106    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

