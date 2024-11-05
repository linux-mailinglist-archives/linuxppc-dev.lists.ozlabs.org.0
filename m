Return-Path: <linuxppc-dev+bounces-2888-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F919BD9B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 00:30:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjl1T28PXz2yFJ;
	Wed,  6 Nov 2024 10:30:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730849405;
	cv=none; b=jK+fgwrY5IT4YxvQTH/L1VICFq+iombnpAvtNzT+z07l02Z0BQ9zEiE05y1y5RAEagGJR9MA2oD4ArUmpo0rcBUy4zXAa8i164TSQstL/rVP6NLRlUZsVl+luM/Kpgm46kSAuG/NsQGRQWivKjBDzIn+irWUWstXYcn2bu+Z4/hq5NsQwNzBGso/Um+0ejJHbEaOSJbEXWhWA7zWt7xtL5v4pAWrQn126r+DmIWCihJXN81bYuBOhBPcgWV8/5AjgVH/DXbvEC8LwxOPVoZoC03OqCHsBma8viAdrRdUy+CDjXSCRu4od3Iru1b8VAfXBnWiIghFKzCfRi0Biyb/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730849405; c=relaxed/relaxed;
	bh=pXyOEoklnazXlO5zGZyn6EAApoJXnV2nkmGa/Vn+oTE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RVIaNXlyvldixUn92ZayOa+nnwAmZDW1Ma6so8ydr0bpFKUqNjnp1E0O2JU+u4Mzl5rZPMMjmwkZuXcNVIYEfBB0gHf5x7EveFtuJr1/R5jv4pM/NP7IEDUaBtCTL1gbkj63I6Scyf2ZgKlPftnK9TEeNUKGr8scVed32bHKniXA/5dRHomBR0Keiz37doL0Wau/RvdjgFf0DPoxwRIXN4rKGUFeAqlfI5Z1HX4gbMV3+yg7pkm70WCZ9ZRV/g5ppK4WtAONaKoUuBt6BZaxzwnH1jQUvi8+vav2NeGVs+mS+AiarvV8EovgEvNztx6o5+AuipNAyde1ECRzGyiyrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G68rb16E; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G68rb16E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjl1P68vfz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 10:29:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730849402; x=1762385402;
  h=date:from:to:cc:subject:message-id;
  bh=cdMzYiCw6SEnSgX2yQYmka4hrqE+tQsvy0+xYEKco34=;
  b=G68rb16Elt7X/mLVcj1k/mLDA24fXUZTf4BFcNiJYxI3zFb/2fGSECuy
   xGjisWIar0bhH09o/CO8jXgy5bxCwgk0s3jfwJtyunDzBUqYnViXXjUWM
   Dcu+n64XEIHXCPaw2Iglvp98pagUAm1B8I15XTGZRbV2clJuNFzHEwSRi
   L3Fbx5NVQw28IKtA6/zMhAm7RI7Piyz8c8BH1HcOS1tY9+Sui/1kkwlsi
   XUeWonuItrEfZ3uXeL6zY0fN4WTeWPXI3CMYSdqZ/FjeP/PjOKHHYA+OU
   N9ItbwlpDn6/srNlPebwnrQmbfcRHB1d/Op+kcjgkcgJBlXXHxyFyQgae
   g==;
X-CSE-ConnectionGUID: uNSARxryR1yGbixjaiIoGA==
X-CSE-MsgGUID: VzRKrFI2SwaIsk08az1kvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30399369"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30399369"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 15:29:53 -0800
X-CSE-ConnectionGUID: ICs0Ro3fQYWeZye2YEjNJQ==
X-CSE-MsgGUID: buFo5PW5QDSkm8atTRk3Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="84611624"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2024 15:29:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Sze-000mb1-0f;
	Tue, 05 Nov 2024 23:29:50 +0000
Date: Wed, 06 Nov 2024 07:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 74f02dbcaa622a8fa4171dcc6e12f86d2cb007d0
Message-ID: <202411060742.TRR1XeR0-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 74f02dbcaa622a8fa4171dcc6e12f86d2cb007d0  KVM: PPC: Book3S HV: Mask off LPCR_MER for a vCPU before running it to avoid spurious interrupts

elapsed time: 735m

configs tested: 252
configs skipped: 110

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

