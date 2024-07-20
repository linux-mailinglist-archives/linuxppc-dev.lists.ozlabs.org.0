Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC05937EFB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 06:55:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBIaxWVq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WQvPY16MWz3cG5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jul 2024 14:55:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBIaxWVq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WQvNn43rrz3cG5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jul 2024 14:55:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721451306; x=1752987306;
  h=date:from:to:cc:subject:message-id;
  bh=Qa3IiHG0miyOfGY3RvH6IlZMjZvjuIGWHCjFJrzxja0=;
  b=XBIaxWVqSoGNnd5tsRDvSUPTleJ/qq/81rYgaGJC7csPebMeOnhq/MRV
   Su/L0vPxt1iQLEWmuQUOrCVC1P192ofauo7S+iW/moESXl6PGru/SIvK0
   5M+4idleLJD0HdWaEKdugKGxIJeoAmysRgGsGznzR087X1dli5Zbn+z0W
   fv8PYceRy4g3TpHmiAFUDQtamKlEhK+n8whda6f4ZCARFeFM+vG+8AzIG
   YYgH2Ofe8F7pypWSsge83LHxrFNwdkY1Qex1eNbjk3Yt0t4YpUYUIzC8n
   tr61KGIDvoyLiD9cgU4mChrKOAKYQ3msOb7scQBPmVdZ00zSAqxsHdFN3
   g==;
X-CSE-ConnectionGUID: Lim4oQd4Qz6eO1BHhxioiQ==
X-CSE-MsgGUID: nH/VDS2NQZ2/YPKiet2KUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18900717"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="18900717"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 21:54:59 -0700
X-CSE-ConnectionGUID: vtwoRa8xQQePsqjc/D+rsg==
X-CSE-MsgGUID: khox7ChhTgOHrzoPkQPCaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="51065064"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 19 Jul 2024 21:54:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV27T-000iqe-0M;
	Sat, 20 Jul 2024 04:54:55 +0000
Date: Sat, 20 Jul 2024 12:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 14ce5a61f94e377816564679767ddd0d2f3f6b2d
Message-ID: <202407201223.oTMBxL8F-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 14ce5a61f94e377816564679767ddd0d2f3f6b2d  Automatic merge of 'next' into merge (2024-07-19 22:11)

elapsed time: 973m

configs tested: 211
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc-13.3.0
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.3.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                          axs101_defconfig   gcc-13.2.0
arc                      axs103_smp_defconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                   randconfig-001-20240720   gcc-13.2.0
arc                   randconfig-002-20240720   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                              allmodconfig   gcc-14.1.0
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                              allyesconfig   gcc-14.1.0
arm                                 defconfig   gcc-13.2.0
arm                       multi_v4t_defconfig   gcc-13.3.0
arm                   randconfig-001-20240720   gcc-13.2.0
arm                   randconfig-002-20240720   gcc-13.2.0
arm                   randconfig-003-20240720   gcc-13.2.0
arm                   randconfig-004-20240720   gcc-13.2.0
arm                         s5pv210_defconfig   gcc-13.3.0
arm                           stm32_defconfig   gcc-13.2.0
arm                           u8500_defconfig   gcc-13.3.0
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240720   gcc-13.2.0
arm64                 randconfig-002-20240720   gcc-13.2.0
arm64                 randconfig-003-20240720   gcc-13.2.0
arm64                 randconfig-004-20240720   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240720   gcc-13.2.0
csky                  randconfig-002-20240720   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                          allyesconfig   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240719   clang-18
i386         buildonly-randconfig-001-20240720   clang-18
i386         buildonly-randconfig-002-20240719   clang-18
i386         buildonly-randconfig-002-20240720   clang-18
i386         buildonly-randconfig-003-20240719   gcc-10
i386         buildonly-randconfig-003-20240720   clang-18
i386         buildonly-randconfig-004-20240719   clang-18
i386         buildonly-randconfig-004-20240720   clang-18
i386         buildonly-randconfig-005-20240719   gcc-10
i386         buildonly-randconfig-005-20240720   clang-18
i386         buildonly-randconfig-006-20240719   clang-18
i386         buildonly-randconfig-006-20240720   clang-18
i386                                defconfig   clang-18
i386                  randconfig-001-20240719   clang-18
i386                  randconfig-001-20240720   clang-18
i386                  randconfig-002-20240719   clang-18
i386                  randconfig-002-20240720   clang-18
i386                  randconfig-003-20240719   clang-18
i386                  randconfig-003-20240720   clang-18
i386                  randconfig-004-20240719   gcc-13
i386                  randconfig-004-20240720   clang-18
i386                  randconfig-005-20240719   clang-18
i386                  randconfig-005-20240720   clang-18
i386                  randconfig-006-20240719   clang-18
i386                  randconfig-006-20240720   clang-18
i386                  randconfig-011-20240719   clang-18
i386                  randconfig-011-20240720   clang-18
i386                  randconfig-012-20240719   clang-18
i386                  randconfig-012-20240720   clang-18
i386                  randconfig-013-20240719   clang-18
i386                  randconfig-013-20240720   clang-18
i386                  randconfig-014-20240719   clang-18
i386                  randconfig-014-20240720   clang-18
i386                  randconfig-015-20240719   gcc-13
i386                  randconfig-015-20240720   clang-18
i386                  randconfig-016-20240719   gcc-13
i386                  randconfig-016-20240720   clang-18
loongarch                        allmodconfig   gcc-14.1.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240720   gcc-13.2.0
loongarch             randconfig-002-20240720   gcc-13.2.0
m68k                             alldefconfig   gcc-13.2.0
m68k                             allmodconfig   gcc-14.1.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-14.1.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5208evb_defconfig   gcc-13.3.0
m68k                       m5249evb_defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.3.0
m68k                        m5407c3_defconfig   gcc-13.2.0
m68k                        m5407c3_defconfig   gcc-13.3.0
m68k                        mvme147_defconfig   gcc-13.2.0
m68k                           sun3_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-14.1.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-14.1.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                           ci20_defconfig   gcc-13.3.0
mips                     decstation_defconfig   gcc-13.2.0
mips                       lemote2f_defconfig   gcc-13.2.0
mips                        omega2p_defconfig   gcc-13.3.0
mips                          rb532_defconfig   gcc-13.2.0
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240720   gcc-13.2.0
nios2                 randconfig-002-20240720   gcc-13.2.0
openrisc                          allnoconfig   gcc-14.1.0
openrisc                         allyesconfig   gcc-14.1.0
openrisc                            defconfig   gcc-14.1.0
parisc                           allmodconfig   gcc-14.1.0
parisc                            allnoconfig   gcc-14.1.0
parisc                           allyesconfig   gcc-14.1.0
parisc                              defconfig   gcc-14.1.0
parisc                randconfig-001-20240720   gcc-13.2.0
parisc                randconfig-002-20240720   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                    adder875_defconfig   gcc-13.3.0
powerpc                          allmodconfig   gcc-14.1.0
powerpc                           allnoconfig   gcc-14.1.0
powerpc                          allyesconfig   gcc-14.1.0
powerpc                 mpc837x_rdb_defconfig   gcc-13.3.0
powerpc                      pmac32_defconfig   gcc-13.2.0
powerpc                         ps3_defconfig   gcc-13.2.0
powerpc               randconfig-001-20240720   gcc-13.2.0
powerpc               randconfig-002-20240720   gcc-13.2.0
powerpc               randconfig-003-20240720   gcc-13.2.0
powerpc                     redwood_defconfig   gcc-13.2.0
powerpc                     stx_gp3_defconfig   gcc-13.3.0
powerpc                     tqm8540_defconfig   gcc-13.3.0
powerpc                      tqm8xx_defconfig   gcc-13.3.0
powerpc64             randconfig-001-20240720   gcc-13.2.0
powerpc64             randconfig-002-20240720   gcc-13.2.0
powerpc64             randconfig-003-20240720   gcc-13.2.0
riscv                            allmodconfig   gcc-14.1.0
riscv                             allnoconfig   gcc-14.1.0
riscv                            allyesconfig   gcc-14.1.0
riscv                               defconfig   gcc-13.3.0
riscv                               defconfig   gcc-14.1.0
riscv                 randconfig-001-20240720   gcc-13.2.0
riscv                 randconfig-002-20240720   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                              allnoconfig   gcc-14.1.0
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-14.1.0
s390                                defconfig   gcc-14.1.0
s390                  randconfig-001-20240720   gcc-13.2.0
s390                  randconfig-002-20240720   gcc-13.2.0
sh                               allmodconfig   gcc-14.1.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-14.1.0
sh                        apsh4ad0a_defconfig   gcc-13.2.0
sh                                  defconfig   gcc-14.1.0
sh                ecovec24-romimage_defconfig   gcc-13.3.0
sh                    randconfig-001-20240720   gcc-13.2.0
sh                    randconfig-002-20240720   gcc-13.2.0
sh                          urquell_defconfig   gcc-13.3.0
sparc                            allmodconfig   gcc-14.1.0
sparc64                             defconfig   gcc-14.1.0
sparc64               randconfig-001-20240720   gcc-13.2.0
sparc64               randconfig-002-20240720   gcc-13.2.0
um                               allmodconfig   clang-19
um                                allnoconfig   clang-17
um                                allnoconfig   gcc-14.1.0
um                               allyesconfig   gcc-13
um                                  defconfig   gcc-14.1.0
um                             i386_defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-14.1.0
um                    randconfig-001-20240720   gcc-13.2.0
um                    randconfig-002-20240720   gcc-13.2.0
um                           x86_64_defconfig   gcc-14.1.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240720   clang-18
x86_64       buildonly-randconfig-002-20240720   clang-18
x86_64       buildonly-randconfig-003-20240720   clang-18
x86_64       buildonly-randconfig-004-20240720   clang-18
x86_64       buildonly-randconfig-005-20240720   clang-18
x86_64       buildonly-randconfig-006-20240720   clang-18
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240720   clang-18
x86_64                randconfig-002-20240720   clang-18
x86_64                randconfig-003-20240720   clang-18
x86_64                randconfig-004-20240720   clang-18
x86_64                randconfig-005-20240720   clang-18
x86_64                randconfig-006-20240720   clang-18
x86_64                randconfig-011-20240720   clang-18
x86_64                randconfig-012-20240720   clang-18
x86_64                randconfig-013-20240720   clang-18
x86_64                randconfig-014-20240720   clang-18
x86_64                randconfig-015-20240720   clang-18
x86_64                randconfig-016-20240720   clang-18
x86_64                randconfig-071-20240720   clang-18
x86_64                randconfig-072-20240720   clang-18
x86_64                randconfig-073-20240720   clang-18
x86_64                randconfig-074-20240720   clang-18
x86_64                randconfig-075-20240720   clang-18
x86_64                randconfig-076-20240720   clang-18
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240720   gcc-13.2.0
xtensa                randconfig-002-20240720   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
