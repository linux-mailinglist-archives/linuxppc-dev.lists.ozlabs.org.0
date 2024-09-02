Return-Path: <linuxppc-dev+bounces-854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E347967D52
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 03:25:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wxrfr0TYPz2yGZ;
	Mon,  2 Sep 2024 11:25:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725240340;
	cv=none; b=PTkwyq+vL8TWkrHGi91/DK7hTkMWHQydMzTPTiz2osG3fzh5CIhu5/cbpsCBoJjQ7pOF7u5kvawWqp9VDboeoWYgXzqIfiphaZiUjtKv8hwwKi8OOvSPFeo99oLMLIapcLzSq4oEy8zbPEJkc2dRZ76c6LJZRBpzP0FTb010VvODGaZ0ni/qYV2QhQMFckszXbTrtotzGsGlk6e4ySmkCqqEC1uML6wcNQ0xIErh+PHLRWHl+fSySHkJKLuwfm/3GH44PPhBSz2vNOzUiBnKb2s4pWDTAN7mCm3pQtui3qR2r4w45Ju80QdkCFoo6Eexg8m9fyZi1arl2a+V/fuc6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725240340; c=relaxed/relaxed;
	bh=KBIy+bckq6Akxv71g21DxMAuLcz2dMScf63/CiXvdiA=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:User-Agent; b=oZCiCnAdTQFmOwgJ1SnY/wIRoQKndIZy0mjBLCMLd8hvPw2WmU+wE9fenuEgmgFnaIi0eoB//QukdGkJ7t2ug/njqMFoCs/4txNxFZY/7HFtSdEO8PfOvWJuCxsqiszjRzr0cTWf3C2vESajLIOdrIcJMwNDwqbr5DdUexWISGj4VpTCBDKCm+7t5T7+Qbz63rcxEJM6wxTyXgWy7jPFKnxeK2hWzipQ0jIh6hCk5R6Msnl33tf47qufABpsL064ndzBMsWL1yEzIBo9b1WgXPskU2sQ84UufkyPhfviXRT2mMUwuNPfMeNwv7yEJ0JofDVAM7qmYdEqGnIyzRpkRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DGMc04nR; dkim-atps=neutral; spf=pass (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DGMc04nR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wxrfp2sNSz2yFP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 11:25:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725240339; x=1756776339;
  h=date:from:to:cc:subject:message-id;
  bh=XL8qNZQKjudG6k/hJ4oqwkQ3KmsRXG0d2fhSjzSBCyg=;
  b=DGMc04nRF3xnjfPkMnJpKhKPz0qFATPkB5oZWFMDniarXTZbq5kU91UH
   oR9Sj3IcMW7apb5aQ1UzCEV8FcM4vMRmnQp6/A1mw+UzUN8nn8uhPHxBf
   WSV/cl6bhvcumXfFHgZQb5ePiIsh4ZeV/ef0KUhS1hqoQePKdRGT/sUmH
   4LYAbnUdQVZwkJWhWiKGj8QryianX1mJrD7vXmfBWiyVqRjg4iQh1gIph
   nut8bZM4x1Oe/cBqj2rd/vxcMGuE4PYQ5zMvAOthB+ivV7fFtj6Y2hcoG
   5lZFVwWM5CEPlsO7fJo8jVceAvubjcBb72B6FaBerFd9YyEG1x2l1Epgf
   g==;
X-CSE-ConnectionGUID: LR8dwz1PSNWpNqiwLjWkPA==
X-CSE-MsgGUID: 7XGvusVlTxi/Ht2ma6KbBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="34376562"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="34376562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 18:25:34 -0700
X-CSE-ConnectionGUID: Y+MTAXguTmuS99g8y2N3Ug==
X-CSE-MsgGUID: 4sCiYH8BTZqbI0XhqTMB4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="65188976"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Sep 2024 18:25:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skvow-00051i-1M;
	Mon, 02 Sep 2024 01:25:30 +0000
Date: Mon, 02 Sep 2024 09:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:next] BUILD SUCCESS
 65948b0e716a47382731889ee6bbb18642b8b003
Message-ID: <202409020938.Uqkx2VsJ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 65948b0e716a47382731889ee6bbb18642b8b003  powerpc/vdso: Inconditionally use CFUNC macro

elapsed time: 785m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-14.1.0
alpha                            allyesconfig   clang-20
alpha                               defconfig   gcc-14.1.0
arc                              allmodconfig   clang-20
arc                               allnoconfig   gcc-14.1.0
arc                              allyesconfig   clang-20
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-14.1.0
arc                     nsimosci_hs_defconfig   gcc-13.2.0
arm                              allmodconfig   clang-20
arm                               allnoconfig   gcc-14.1.0
arm                              allyesconfig   clang-20
arm                       aspeed_g4_defconfig   gcc-14.1.0
arm                                 defconfig   gcc-14.1.0
arm                         mv78xx0_defconfig   gcc-13.2.0
arm64                            allmodconfig   clang-20
arm64                             allnoconfig   gcc-14.1.0
arm64                               defconfig   gcc-14.1.0
csky                              allnoconfig   gcc-14.1.0
csky                                defconfig   gcc-13.2.0
csky                                defconfig   gcc-14.1.0
hexagon                          allmodconfig   clang-20
hexagon                           allnoconfig   gcc-14.1.0
hexagon                          allyesconfig   clang-20
hexagon                             defconfig   gcc-14.1.0
i386                             allmodconfig   clang-18
i386                              allnoconfig   clang-18
i386                             allyesconfig   clang-18
i386         buildonly-randconfig-001-20240902   clang-18
i386         buildonly-randconfig-002-20240902   clang-18
i386         buildonly-randconfig-003-20240902   clang-18
i386         buildonly-randconfig-004-20240902   clang-18
i386         buildonly-randconfig-005-20240902   clang-18
i386         buildonly-randconfig-006-20240902   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240902   clang-18
i386                  randconfig-002-20240902   clang-18
i386                  randconfig-003-20240902   clang-18
i386                  randconfig-004-20240902   clang-18
i386                  randconfig-005-20240902   clang-18
i386                  randconfig-006-20240902   clang-18
i386                  randconfig-011-20240902   clang-18
i386                  randconfig-012-20240902   clang-18
i386                  randconfig-013-20240902   clang-18
i386                  randconfig-014-20240902   clang-18
i386                  randconfig-015-20240902   clang-18
i386                  randconfig-016-20240902   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-14.1.0
loongarch                           defconfig   gcc-14.1.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-14.1.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-14.1.0
m68k                            q40_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-14.1.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-14.1.0
mips                              allnoconfig   gcc-14.1.0
mips                          ath79_defconfig   gcc-14.1.0
mips                        bcm63xx_defconfig   gcc-14.1.0
mips                  cavium_octeon_defconfig   gcc-13.2.0
mips                        maltaup_defconfig   gcc-14.1.0
mips                           mtx1_defconfig   gcc-13.2.0
mips                        omega2p_defconfig   gcc-13.2.0
nios2                         3c120_defconfig   gcc-14.1.0
nios2                             allnoconfig   gcc-14.1.0
nios2                               defconfig   gcc-14.1.0
openrisc                          allnoconfig   clang-20
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-12
openrisc                    or1ksim_defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   clang-20
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-12
parisc64                            defconfig   gcc-14.1.0
powerpc                    adder875_defconfig   gcc-14.1.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   clang-20
powerpc                          allyesconfig   gcc-14.1.0
powerpc                   currituck_defconfig   gcc-14.1.0
powerpc                       maple_defconfig   gcc-13.2.0
powerpc                     mpc5200_defconfig   gcc-14.1.0
powerpc                    socrates_defconfig   gcc-13.2.0
powerpc                    socrates_defconfig   gcc-14.1.0
powerpc                     stx_gp3_defconfig   gcc-14.1.0
powerpc                     tqm8540_defconfig   gcc-13.2.0
powerpc                     tqm8548_defconfig   gcc-14.1.0
powerpc                      tqm8xx_defconfig   gcc-14.1.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   clang-20
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-12
s390                             allmodconfig   gcc-14.1.0
s390                              allnoconfig   clang-20
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-12
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-14.1.0
sh                               allyesconfig   gcc-14.1.0
sh                                  defconfig   gcc-12
sh                            migor_defconfig   gcc-13.2.0
sh                           se7780_defconfig   gcc-13.2.0
sh                           sh2007_defconfig   gcc-13.2.0
sh                   sh7724_generic_defconfig   gcc-13.2.0
sh                  sh7785lcr_32bit_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-12
um                               alldefconfig   gcc-14.1.0
um                               allmodconfig   clang-20
um                                allnoconfig   clang-20
um                               allyesconfig   clang-20
um                                  defconfig   gcc-12
um                             i386_defconfig   gcc-12
um                             i386_defconfig   gcc-13.2.0
um                           x86_64_defconfig   gcc-12
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64                              defconfig   clang-18
x86_64                                  kexec   gcc-12
x86_64                          rhel-8.3-rust   clang-18
x86_64                               rhel-8.3   gcc-12
xtensa                            allnoconfig   gcc-14.1.0
xtensa                    xip_kc705_defconfig   gcc-14.1.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

