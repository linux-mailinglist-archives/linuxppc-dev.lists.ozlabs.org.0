Return-Path: <linuxppc-dev+bounces-3593-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6695C9DAFC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 00:11:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzFYl6M7Zz2xgQ;
	Thu, 28 Nov 2024 10:11:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732749083;
	cv=none; b=Prq3MaP+VB6SSWYkYl6nad7kjl1ciZ6drZxA8/ASvxwj/jjebaeAhhHiu8Fdjo5St/ETumi8CQXXV74xjYuxc1uTxtQxXV2ORwZ60ftzo7+eBhHFdEgENzbB78ix2ma/ECOYYSRehE0mD07dUoZ/S668aXunyo8p4jXentofZoKz7bYKgPgTorav/6ThjGDaIDuqWsaT9xgqlKDT7AM+NHE7GxdxxkTSm8R0Kq+h1hMTdXHiNxjDg34Aodq9CNddrR4MdjTbnadPtq5/oIBRRHsVq+Mz898sgQpYEF1IKpTzKn7dbu0IDY1Did6jbYy9PgXGNEoZ84J+uMa9pOX5RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732749083; c=relaxed/relaxed;
	bh=1IKjY554pWo0aWr1VUG7EA3J6kaaOt6EgKtLkteRlm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yl1vmy0ZKC45sb/Ou/11vBj/je4nmbrgCs/f616tOXvFGdbGC1VZ3pv6RsJjTqqBH3jbgQmBkL+EFtGgPdodYey1e31+33MB1u3ADUxLkTPGGCXdIEwRkUpNA84ecKQRWX3u7Z88uii760OTiXwF6VkUoBZmV3gcqwGXtZgW8zM+lqRXOs97wVEBBIdpd+/lmM4icLbcXul4LYvyVNZ9Kru0HXyKXiI7jO+KvHhXLJd9qSy/DFZwmN7HYoHP2E8OnwCzBtV5GrfDuxWo3fH0EH0Z8Q3uyLsv5hH3n9UnjHIae43Q2WAuYh3UcQPNusgNaIPvo4i7cHVn/hqz5HuhlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Icb+UDj4; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Icb+UDj4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzFYg72Vjz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 10:11:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732749080; x=1764285080;
  h=date:from:to:cc:subject:message-id;
  bh=YxzfHeWpsdfoufzcq61DgUcrMppNANapFxVlZ+B1gh8=;
  b=Icb+UDj4z8eifQGKvUegrH/410KqueuDYeqOhh7CiMYpwQwCsnA+TvFY
   IXDhd52KZ2iMCi6uHRtKTb5WRsbOnXz8Wg6H6tTIeuUzgb9xXsHyhfBFx
   TnTCqbwSsAKtsue97/YcDASaLjiuKKHX2PI4SQaOFnzVJWyaEL6UejyDI
   eVL7yTtBDSPDZ9C9FKYN33WSvnEMoxBBLSVrJ7aLjZMXv4AzZrJf4daaB
   VGjWDUqIHTb0DDY8tZ/C3mTUrDJo6ygzGbDtcYkJCgtr+7FNwbqiaT3hl
   fGn0AC5iZenDvieZZjggorkKT3bwq0YKcU41V2FD1nmNfBcwVqK1UNY7X
   g==;
X-CSE-ConnectionGUID: yIWMztjcRduECJr4defkLg==
X-CSE-MsgGUID: fUnt2k1GRFqT/sWP3fVnhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="58378137"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="58378137"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 15:11:15 -0800
X-CSE-ConnectionGUID: szPLN5cBTgm15VVn0WSMYA==
X-CSE-MsgGUID: jaJcW7IaTC+Yv0KQ7GlFIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="96511789"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Nov 2024 15:11:13 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGRBf-0008Ql-0w;
	Wed, 27 Nov 2024 23:11:11 +0000
Date: Thu, 28 Nov 2024 07:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 cf89c9434af122f28a3552e6f9cc5158c33ce50a
Message-ID: <202411280737.8RYXCp7E-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: cf89c9434af122f28a3552e6f9cc5158c33ce50a  powerpc/prom_init: Fixup missing powermac #size-cells

elapsed time: 1032m

configs tested: 191
configs skipped: 23

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.2.0
arc                              allyesconfig    clang-20
arc                        nsim_700_defconfig    clang-20
arc                   randconfig-001-20241127    gcc-14.2.0
arc                   randconfig-002-20241127    gcc-14.2.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.2.0
arm                              allyesconfig    clang-20
arm                            dove_defconfig    gcc-14.2.0
arm                       imx_v6_v7_defconfig    clang-20
arm                       imx_v6_v7_defconfig    gcc-14.2.0
arm                           imxrt_defconfig    gcc-14.2.0
arm                      jornada720_defconfig    clang-20
arm                         mv78xx0_defconfig    clang-20
arm                             mxs_defconfig    gcc-14.2.0
arm                       omap2plus_defconfig    gcc-14.2.0
arm                          pxa3xx_defconfig    clang-20
arm                             pxa_defconfig    gcc-14.2.0
arm                   randconfig-001-20241127    gcc-14.2.0
arm                   randconfig-002-20241127    gcc-14.2.0
arm                   randconfig-003-20241127    gcc-14.2.0
arm                   randconfig-004-20241127    gcc-14.2.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20241127    gcc-14.2.0
arm64                 randconfig-002-20241127    gcc-14.2.0
arm64                 randconfig-003-20241127    gcc-14.2.0
arm64                 randconfig-004-20241127    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20241127    gcc-14.2.0
csky                  randconfig-002-20241127    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.2.0
hexagon                          allyesconfig    clang-20
hexagon               randconfig-001-20241127    gcc-14.2.0
hexagon               randconfig-002-20241127    gcc-14.2.0
i386        buildonly-randconfig-001-20241127    clang-19
i386        buildonly-randconfig-001-20241128    clang-19
i386        buildonly-randconfig-002-20241127    clang-19
i386        buildonly-randconfig-002-20241128    clang-19
i386        buildonly-randconfig-003-20241127    clang-19
i386        buildonly-randconfig-003-20241128    clang-19
i386        buildonly-randconfig-004-20241127    clang-19
i386        buildonly-randconfig-004-20241128    clang-19
i386        buildonly-randconfig-005-20241127    clang-19
i386        buildonly-randconfig-005-20241128    clang-19
i386        buildonly-randconfig-006-20241127    clang-19
i386        buildonly-randconfig-006-20241128    clang-19
i386                  randconfig-001-20241127    clang-19
i386                  randconfig-001-20241128    clang-19
i386                  randconfig-002-20241127    clang-19
i386                  randconfig-002-20241128    clang-19
i386                  randconfig-003-20241127    clang-19
i386                  randconfig-003-20241128    clang-19
i386                  randconfig-004-20241127    clang-19
i386                  randconfig-004-20241128    clang-19
i386                  randconfig-005-20241127    clang-19
i386                  randconfig-005-20241128    clang-19
i386                  randconfig-006-20241127    clang-19
i386                  randconfig-006-20241128    clang-19
i386                  randconfig-011-20241127    clang-19
i386                  randconfig-011-20241128    clang-19
i386                  randconfig-012-20241127    clang-19
i386                  randconfig-012-20241128    clang-19
i386                  randconfig-013-20241127    clang-19
i386                  randconfig-013-20241128    clang-19
i386                  randconfig-014-20241127    clang-19
i386                  randconfig-014-20241128    clang-19
i386                  randconfig-015-20241127    clang-19
i386                  randconfig-015-20241128    clang-19
i386                  randconfig-016-20241127    clang-19
i386                  randconfig-016-20241128    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                 loongson3_defconfig    gcc-14.2.0
loongarch             randconfig-001-20241127    gcc-14.2.0
loongarch             randconfig-002-20241127    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                         amcore_defconfig    clang-20
m68k                          hp300_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    clang-16
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    clang-20
mips                        bcm47xx_defconfig    gcc-14.2.0
mips                          eyeq6_defconfig    clang-20
mips                           mtx1_defconfig    clang-16
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20241127    gcc-14.2.0
nios2                 randconfig-002-20241127    gcc-14.2.0
openrisc                         alldefconfig    gcc-14.2.0
openrisc                          allnoconfig    clang-20
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    clang-20
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20241127    gcc-14.2.0
parisc                randconfig-002-20241127    gcc-14.2.0
powerpc                     akebono_defconfig    clang-20
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    clang-20
powerpc                          allyesconfig    gcc-14.2.0
powerpc                       ebony_defconfig    gcc-14.2.0
powerpc                     ep8248e_defconfig    gcc-14.2.0
powerpc                     mpc5200_defconfig    gcc-14.2.0
powerpc                 mpc8315_rdb_defconfig    gcc-14.2.0
powerpc                    mvme5100_defconfig    gcc-14.2.0
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20241127    gcc-14.2.0
powerpc               randconfig-002-20241127    gcc-14.2.0
powerpc               randconfig-003-20241127    gcc-14.2.0
powerpc                     tqm8540_defconfig    gcc-14.2.0
powerpc                     tqm8548_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20241127    gcc-14.2.0
powerpc64             randconfig-002-20241127    gcc-14.2.0
powerpc64             randconfig-003-20241127    gcc-14.2.0
riscv                            alldefconfig    clang-20
riscv                            allmodconfig    gcc-14.2.0
riscv                             allnoconfig    clang-20
riscv                            allyesconfig    gcc-14.2.0
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20241127    gcc-14.2.0
riscv                 randconfig-002-20241127    gcc-14.2.0
s390                             allmodconfig    clang-20
s390                             allmodconfig    gcc-14.2.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20241127    gcc-14.2.0
s390                  randconfig-002-20241127    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20241127    gcc-14.2.0
sh                    randconfig-002-20241127    gcc-14.2.0
sh                        sh7757lcr_defconfig    gcc-14.2.0
sh                              ul2_defconfig    gcc-14.2.0
sh                          urquell_defconfig    clang-20
sparc                            allmodconfig    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64               randconfig-001-20241127    gcc-14.2.0
sparc64               randconfig-002-20241127    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-20
um                               allyesconfig    clang-20
um                               allyesconfig    gcc-12
um                    randconfig-001-20241127    gcc-14.2.0
um                    randconfig-002-20241127    gcc-14.2.0
x86_64      buildonly-randconfig-001-20241127    clang-19
x86_64      buildonly-randconfig-002-20241127    clang-19
x86_64      buildonly-randconfig-003-20241127    clang-19
x86_64      buildonly-randconfig-004-20241127    clang-19
x86_64      buildonly-randconfig-005-20241127    clang-19
x86_64      buildonly-randconfig-006-20241127    clang-19
x86_64                                  kexec    clang-19
x86_64                randconfig-001-20241127    clang-19
x86_64                randconfig-002-20241127    clang-19
x86_64                randconfig-003-20241127    clang-19
x86_64                randconfig-004-20241127    clang-19
x86_64                randconfig-005-20241127    clang-19
x86_64                randconfig-006-20241127    clang-19
x86_64                randconfig-011-20241127    clang-19
x86_64                randconfig-012-20241127    clang-19
x86_64                randconfig-013-20241127    clang-19
x86_64                randconfig-014-20241127    clang-19
x86_64                randconfig-015-20241127    clang-19
x86_64                randconfig-016-20241127    clang-19
x86_64                randconfig-071-20241127    clang-19
x86_64                randconfig-072-20241127    clang-19
x86_64                randconfig-073-20241127    clang-19
x86_64                randconfig-074-20241127    clang-19
x86_64                randconfig-075-20241127    clang-19
x86_64                randconfig-076-20241127    clang-19
x86_64                               rhel-9.4    clang-19
x86_64                               rhel-9.4    gcc-12
x86_64                           rhel-9.4-bpf    clang-19
x86_64                         rhel-9.4-kunit    clang-19
x86_64                           rhel-9.4-ltp    clang-19
x86_64                          rhel-9.4-rust    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                       common_defconfig    clang-20
xtensa                       common_defconfig    gcc-14.2.0
xtensa                randconfig-001-20241127    gcc-14.2.0
xtensa                randconfig-002-20241127    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

