Return-Path: <linuxppc-dev+bounces-4561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6986D9FF4F6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 22:25:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNjYC5zcLz2xGw;
	Thu,  2 Jan 2025 08:25:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735766719;
	cv=none; b=Wh2MrrrFc7h/fF0gDlfCYciux8LoGy6T+tNIf83hndStnVW8/xEEdqencK6TGmtcUeIcyUBG/0I1YE5PQabD6kOzB7oSAnJqZzia+F+yMivvKB9Z+WfxdYb6XL1ZB1CiFTgdPgqgScj0iZoALTEfTM2ckLJ1Om99X46uKXBhqHWOt2jzCdN6ed2NVEU/cVdGqjJkrNYZ+lgLWXziQObzijs47YufApz3ILwwg065OdfrywKeP2FuFs96XSdeFL4xli+znmgNjpfvkpg01AJW3BdI5B5ihmfpw6gm1nW3Li1LSYUld/QxRRd7/bI5ZLYQ165hmbWSPujkYWVGjUpobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735766719; c=relaxed/relaxed;
	bh=riNYf7frMAKBqMV0iBbjizRq6hJCr1+KQwyK1r51AUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bomD/A7igHLOqd6tA90ez2pZFEz7St4KGml9tF/U0UWNbMQqYxCVqfX3ZmpBa2twggt53gLvnSYlgxIvYPQGATPQGmfjBpj7yVDvhh2qXbar5cgI3JrCm8xpCyZE+f9iqiNEi2NBaUnlZppiRxrXzqRD0mOE5V2Jy36TUl0eimb9CZKL/r1vFCueGlZrm9rZSZuTU7RE5XlVq3HtU3tJSJlXJRsHWeOs8ikX1FL2qhTDM0ronlx8EDPZiXGQL4tesEakijZnob/5Gt/cWBl2Kg5zn3guYoT4bdsB46IUZILhQbMlHoNNcrGtVf7dZcxYyp3EGmBO+rqGWwnXtLb9Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEcRaYBE; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEcRaYBE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNjY81rKGz2xGr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2025 08:25:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735766716; x=1767302716;
  h=date:from:to:cc:subject:message-id;
  bh=KreiaPBtuifjgegbMF6RYGcWiSQDrFVYGBZYXLg6Akk=;
  b=ZEcRaYBEHANqcXGYFzWfjLHodZlohAGXqZYmmXk1/F8nzXWYPFovjwnp
   5Zj3jPutM68YDMo9cZtnCEiiqXQ4wPnA+Ez3Wm9VvdS1Bpiuietu8BHUF
   1KfQb/1a844R7O9BdigrMM8nPoYLZY74aBYQXtG+fxYM8t6uLEzgpTc6S
   AGiGbZtgcGhm0kEWnRcOml+bEVAaCQYSUAtKXQnHPwPxtaONm+1pViXRd
   fvXiIcJVSkWzD2csEcyyIoyUQpc1wi+San6gKWro9MAJ2AUYsLA5hD3AD
   3/fJBAwPMKVTIUN0YD+konQmrel4/xP/Ff/rXPADyDOXHXvRmtg8As7Mx
   g==;
X-CSE-ConnectionGUID: GuC7uqRAS+eqwlV+ogFl/g==
X-CSE-MsgGUID: P7hE5FStT0C5u5RtTYn7Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35711883"
X-IronPort-AV: E=Sophos;i="6.12,283,1728975600"; 
   d="scan'208";a="35711883"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 13:25:08 -0800
X-CSE-ConnectionGUID: rxc7oWs+QtaGsXBdIFUH/Q==
X-CSE-MsgGUID: pwZilB3ZSx2+vR4QcKZwQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,283,1728975600"; 
   d="scan'208";a="101760106"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jan 2025 13:25:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT6DB-00084x-1B;
	Wed, 01 Jan 2025 21:25:05 +0000
Date: Thu, 02 Jan 2025 05:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 df6c1289f93dcc78d0ff1b4777d5920eb564a7fc
Message-ID: <202501020535.rI9druzp-lkp@intel.com>
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
branch HEAD: df6c1289f93dcc78d0ff1b4777d5920eb564a7fc  Automatic merge of 'next' into merge (2025-01-01 14:09)

elapsed time: 724m

configs tested: 181
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
alpha                               defconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                                 defconfig    gcc-13.2.0
arc                                 defconfig    gcc-14.2.0
arc                   randconfig-001-20250101    gcc-13.2.0
arc                   randconfig-002-20250101    gcc-13.2.0
arc                    vdk_hs38_smp_defconfig    gcc-13.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                       aspeed_g4_defconfig    gcc-14.2.0
arm                                 defconfig    clang-20
arm                                 defconfig    gcc-14.2.0
arm                           imxrt_defconfig    clang-19
arm                        multi_v7_defconfig    gcc-14.2.0
arm                   randconfig-001-20250101    clang-15
arm                   randconfig-002-20250101    clang-17
arm                   randconfig-003-20250101    gcc-14.2.0
arm                   randconfig-004-20250101    gcc-14.2.0
arm                        shmobile_defconfig    gcc-14.2.0
arm                         socfpga_defconfig    gcc-14.2.0
arm                          sp7021_defconfig    gcc-14.2.0
arm                        spear6xx_defconfig    gcc-14.2.0
arm64                            alldefconfig    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                               defconfig    gcc-14.2.0
arm64                 randconfig-001-20250101    clang-20
arm64                 randconfig-002-20250101    clang-20
arm64                 randconfig-003-20250101    gcc-14.2.0
arm64                 randconfig-004-20250101    clang-19
csky                              allnoconfig    gcc-14.2.0
csky                                defconfig    gcc-14.2.0
csky                  randconfig-001-20250101    gcc-14.2.0
csky                  randconfig-002-20250101    gcc-14.2.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                          allyesconfig    clang-18
hexagon                             defconfig    clang-20
hexagon                             defconfig    gcc-14.2.0
hexagon               randconfig-001-20250101    clang-14
hexagon               randconfig-002-20250101    clang-16
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250101    clang-19
i386        buildonly-randconfig-002-20250101    gcc-12
i386        buildonly-randconfig-003-20250101    clang-19
i386        buildonly-randconfig-004-20250101    clang-19
i386        buildonly-randconfig-005-20250101    clang-19
i386        buildonly-randconfig-006-20250101    clang-19
i386                                defconfig    clang-19
i386                  randconfig-001-20250102    gcc-12
i386                  randconfig-002-20250102    gcc-12
i386                  randconfig-003-20250102    gcc-12
i386                  randconfig-004-20250102    gcc-12
i386                  randconfig-005-20250102    gcc-12
i386                  randconfig-006-20250102    gcc-12
i386                  randconfig-007-20250102    gcc-12
i386                  randconfig-011-20250102    clang-19
i386                  randconfig-012-20250102    clang-19
i386                  randconfig-013-20250102    clang-19
i386                  randconfig-014-20250102    clang-19
i386                  randconfig-015-20250102    clang-19
i386                  randconfig-016-20250102    clang-19
i386                  randconfig-017-20250102    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch                           defconfig    gcc-14.2.0
loongarch             randconfig-001-20250101    gcc-14.2.0
loongarch             randconfig-002-20250101    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                                defconfig    gcc-14.2.0
m68k                       m5208evb_defconfig    gcc-14.2.0
m68k                        m5307c3_defconfig    gcc-14.2.0
m68k                        m5407c3_defconfig    gcc-14.2.0
m68k                        mvme16x_defconfig    gcc-14.2.0
microblaze                       allmodconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
microblaze                       allyesconfig    gcc-14.2.0
microblaze                          defconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                        bcm63xx_defconfig    gcc-14.2.0
mips                         db1xxx_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                               defconfig    gcc-14.2.0
nios2                 randconfig-001-20250101    gcc-14.2.0
nios2                 randconfig-002-20250101    gcc-14.2.0
openrisc                          allnoconfig    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
openrisc                            defconfig    gcc-12
openrisc                            defconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                            allnoconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                              defconfig    gcc-12
parisc                              defconfig    gcc-14.2.0
parisc                randconfig-001-20250101    gcc-14.2.0
parisc                randconfig-002-20250101    gcc-14.2.0
parisc64                            defconfig    gcc-14.1.0
parisc64                            defconfig    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                           allnoconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc                 canyonlands_defconfig    clang-19
powerpc                       ebony_defconfig    clang-18
powerpc                          g5_defconfig    gcc-14.2.0
powerpc                    ge_imp3a_defconfig    gcc-14.2.0
powerpc                     mpc83xx_defconfig    clang-20
powerpc                     ppa8548_defconfig    gcc-14.2.0
powerpc               randconfig-001-20250101    gcc-14.2.0
powerpc               randconfig-002-20250101    clang-17
powerpc               randconfig-003-20250101    gcc-14.2.0
powerpc                        warp_defconfig    gcc-14.2.0
powerpc                 xes_mpc85xx_defconfig    gcc-14.2.0
powerpc64             randconfig-001-20250101    clang-20
powerpc64             randconfig-002-20250101    gcc-14.2.0
powerpc64             randconfig-003-20250101    clang-17
riscv                            allmodconfig    clang-20
riscv                             allnoconfig    gcc-14.2.0
riscv                            allyesconfig    clang-20
riscv                               defconfig    clang-19
riscv                               defconfig    gcc-12
riscv                    nommu_k210_defconfig    gcc-14.2.0
riscv                 randconfig-001-20250101    gcc-14.2.0
riscv                 randconfig-002-20250101    clang-19
s390                             allmodconfig    clang-19
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.2.0
s390                                defconfig    clang-15
s390                                defconfig    gcc-12
s390                  randconfig-001-20250101    clang-20
s390                  randconfig-002-20250101    gcc-14.2.0
sh                               alldefconfig    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                                  defconfig    gcc-12
sh                                  defconfig    gcc-14.2.0
sh                          kfr2r09_defconfig    gcc-14.2.0
sh                    randconfig-001-20250101    gcc-14.2.0
sh                    randconfig-002-20250101    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250101    gcc-14.2.0
sparc                 randconfig-002-20250101    gcc-14.2.0
sparc64                             defconfig    gcc-12
sparc64                             defconfig    gcc-14.2.0
sparc64               randconfig-001-20250101    gcc-14.2.0
sparc64               randconfig-002-20250101    gcc-14.2.0
um                               allmodconfig    clang-20
um                                allnoconfig    clang-18
um                               allyesconfig    gcc-12
um                                  defconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250101    gcc-12
um                    randconfig-002-20250101    clang-20
um                           x86_64_defconfig    clang-15
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250101    clang-19
x86_64      buildonly-randconfig-002-20250101    clang-19
x86_64      buildonly-randconfig-003-20250101    clang-19
x86_64      buildonly-randconfig-004-20250101    gcc-12
x86_64      buildonly-randconfig-005-20250101    clang-19
x86_64      buildonly-randconfig-006-20250101    clang-19
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-19
x86_64                               rhel-9.4    clang-19
xtensa                            allnoconfig    gcc-14.2.0
xtensa                          iss_defconfig    gcc-14.2.0
xtensa                randconfig-001-20250101    gcc-14.2.0
xtensa                randconfig-002-20250101    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

