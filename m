Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466A8C8015
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 04:54:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OnwFhMwl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgWkx754Dz3cT3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 12:54:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OnwFhMwl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgWkD5gySz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2024 12:53:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715914421; x=1747450421;
  h=date:from:to:cc:subject:message-id;
  bh=bg0tvdneI6RHPz4bu9qD7fnrfshVKa9f7k2KZt7v/3s=;
  b=OnwFhMwlAB+yi2FkoUJS7xgWcCmL74+73kxjXVb5VIC5ZMZPnzFaZF9u
   2z91h1ecbSF/5we0lP3DIJg/5kYg58qxjO72OU0i5ZHnJjumd5MXkcJ+S
   z08trbIYps+BQCv0oyV3BBl6/O8YLtMpWzg+I8mKSTIaftmSfh05uafzy
   rZy9FYz2QLYj0BYMnm1Um5AfOe2LtUGtLSKawAPFJhEjPUT0JKFZfHo7T
   1bvP0qDEKXA/ydTJ1MLr/dfxZ8hlhRF96TgbmqDduSJ99x2Uylzv9MTsi
   7dXWvG5Mz8pNeA9JwhsvzsPUfxre+y61TWLUzB05jc4S4ktQzgI8VaZko
   Q==;
X-CSE-ConnectionGUID: bgShFn+aQOexOcFfnht4nA==
X-CSE-MsgGUID: Ba1e4lSrREKaMdEY7l7yZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23481905"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="23481905"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 19:53:35 -0700
X-CSE-ConnectionGUID: 1DC2Hb0jS0GYs1bnMLTBFg==
X-CSE-MsgGUID: WbjRejwfRqSM+oiletLN+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="31651117"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 May 2024 19:53:32 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7nib-00006R-34;
	Fri, 17 May 2024 02:53:16 +0000
Date: Fri, 17 May 2024 10:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 61700f816e6f58f6b1aaa881a69a784d146e30f0
Message-ID: <202405171055.bQ3F0Ktc-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 61700f816e6f58f6b1aaa881a69a784d146e30f0  powerpc/fadump: Fix section mismatch warning

elapsed time: 734m

configs tested: 190
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240517   gcc  
arc                   randconfig-002-20240517   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                          collie_defconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   clang
arm                            dove_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                         nhk8815_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                   randconfig-001-20240517   clang
arm                   randconfig-002-20240517   clang
arm                   randconfig-003-20240517   clang
arm                   randconfig-004-20240517   clang
arm                           sama7_defconfig   clang
arm                       spear13xx_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240517   clang
arm64                 randconfig-002-20240517   gcc  
arm64                 randconfig-003-20240517   clang
arm64                 randconfig-004-20240517   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240517   gcc  
csky                  randconfig-002-20240517   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240517   clang
hexagon               randconfig-002-20240517   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240516   clang
i386         buildonly-randconfig-001-20240517   clang
i386         buildonly-randconfig-002-20240516   clang
i386         buildonly-randconfig-002-20240517   clang
i386         buildonly-randconfig-003-20240516   clang
i386         buildonly-randconfig-003-20240517   gcc  
i386         buildonly-randconfig-004-20240516   gcc  
i386         buildonly-randconfig-004-20240517   clang
i386         buildonly-randconfig-005-20240516   gcc  
i386         buildonly-randconfig-005-20240517   clang
i386         buildonly-randconfig-006-20240516   gcc  
i386         buildonly-randconfig-006-20240517   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240516   gcc  
i386                  randconfig-001-20240517   gcc  
i386                  randconfig-002-20240516   gcc  
i386                  randconfig-002-20240517   gcc  
i386                  randconfig-003-20240516   clang
i386                  randconfig-003-20240517   gcc  
i386                  randconfig-004-20240516   clang
i386                  randconfig-004-20240517   gcc  
i386                  randconfig-005-20240516   clang
i386                  randconfig-005-20240517   gcc  
i386                  randconfig-006-20240516   clang
i386                  randconfig-006-20240517   gcc  
i386                  randconfig-011-20240516   gcc  
i386                  randconfig-011-20240517   gcc  
i386                  randconfig-012-20240516   gcc  
i386                  randconfig-012-20240517   clang
i386                  randconfig-013-20240516   clang
i386                  randconfig-013-20240517   gcc  
i386                  randconfig-014-20240516   gcc  
i386                  randconfig-014-20240517   gcc  
i386                  randconfig-015-20240516   gcc  
i386                  randconfig-015-20240517   clang
i386                  randconfig-016-20240516   gcc  
i386                  randconfig-016-20240517   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240517   gcc  
loongarch             randconfig-002-20240517   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                           virt_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           jazz_defconfig   clang
mips                      loongson3_defconfig   gcc  
mips                  maltasmvp_eva_defconfig   gcc  
mips                         rt305x_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240517   gcc  
nios2                 randconfig-002-20240517   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240517   gcc  
parisc                randconfig-002-20240517   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     asp8347_defconfig   clang
powerpc                      bamboo_defconfig   clang
powerpc                      chrp32_defconfig   clang
powerpc                     mpc5200_defconfig   clang
powerpc                      pasemi_defconfig   clang
powerpc                      ppc40x_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240517   clang
powerpc               randconfig-002-20240517   clang
powerpc               randconfig-003-20240517   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240517   gcc  
powerpc64             randconfig-002-20240517   gcc  
powerpc64             randconfig-003-20240517   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240517   clang
riscv                 randconfig-002-20240517   gcc  
s390                             alldefconfig   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240517   clang
s390                  randconfig-002-20240517   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                    randconfig-001-20240517   gcc  
sh                    randconfig-002-20240517   gcc  
sh                           se7619_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240517   gcc  
sparc64               randconfig-002-20240517   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240517   clang
um                    randconfig-002-20240517   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa                randconfig-001-20240517   gcc  
xtensa                randconfig-002-20240517   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
