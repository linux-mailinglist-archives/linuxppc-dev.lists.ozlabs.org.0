Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2FD859A8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 02:29:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i8xromRU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdQ2B74ckz3d2g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 12:29:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i8xromRU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdQ1P0x74z3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Feb 2024 12:29:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708306154; x=1739842154;
  h=date:from:to:cc:subject:message-id;
  bh=1UG4nm0RXeYjgKLvArd2fvfB0e0rSl4O7j5dTjivaD4=;
  b=i8xromRUMRCNc17DcPQm2PO5Sm/qpITugG+49X0j8v6RXl6zVQXuJh0F
   nXbznVof0ZbcjAGQYTSbAwtkFVpTjo5CVBpqmfOv4i25bwUzFVQcxOn7l
   /m38MU30yDim8NLoqf2Awuvg80aGqxKMfAuGAi/yXSSOlTFZCCTLKfpAS
   79SanKyxGZAvBbix0QBtUOTySvBbE4Q6dau7Dujs3PwjGitZrz27SnOGL
   g+pB1dwe44igR/6VM90p77HvDyar7wWXTbo4pB8lzglB6YZqI3Vkw3M8T
   KAaLv3v2IxdplhgRu1rLnIgcdNdDmnR9cwX3v19/rZmv+6qz04v0a1Xzb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2232198"
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="2232198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 17:29:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,169,1705392000"; 
   d="scan'208";a="35382983"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Feb 2024 17:29:06 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbsSt-0003PS-1x;
	Mon, 19 Feb 2024 01:29:03 +0000
Date: Mon, 19 Feb 2024 09:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 d7a009087fa074f0362c1f6333a619873f9c74c6
Message-ID: <202402190910.t6la8glR-lkp@intel.com>
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
branch HEAD: d7a009087fa074f0362c1f6333a619873f9c74c6  Automatic merge of 'master' into merge (2024-02-18 10:41)

elapsed time: 1442m

configs tested: 246
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
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                   randconfig-001-20240218   gcc  
arc                   randconfig-001-20240219   gcc  
arc                   randconfig-002-20240218   gcc  
arc                   randconfig-002-20240219   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          exynos_defconfig   clang
arm                      jornada720_defconfig   clang
arm                        mvebu_v7_defconfig   clang
arm                   randconfig-001-20240218   clang
arm                   randconfig-001-20240219   gcc  
arm                   randconfig-002-20240218   clang
arm                   randconfig-002-20240219   gcc  
arm                   randconfig-003-20240218   gcc  
arm                   randconfig-003-20240219   gcc  
arm                   randconfig-004-20240218   clang
arm                   randconfig-004-20240219   gcc  
arm                        shmobile_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240218   clang
arm64                 randconfig-001-20240219   gcc  
arm64                 randconfig-002-20240218   clang
arm64                 randconfig-002-20240219   gcc  
arm64                 randconfig-003-20240218   clang
arm64                 randconfig-004-20240218   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240218   gcc  
csky                  randconfig-001-20240219   gcc  
csky                  randconfig-002-20240218   gcc  
csky                  randconfig-002-20240219   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240218   clang
hexagon               randconfig-002-20240218   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240218   clang
i386         buildonly-randconfig-002-20240218   clang
i386         buildonly-randconfig-003-20240218   clang
i386         buildonly-randconfig-004-20240218   clang
i386         buildonly-randconfig-005-20240218   clang
i386         buildonly-randconfig-006-20240218   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240218   clang
i386                  randconfig-002-20240218   gcc  
i386                  randconfig-003-20240218   clang
i386                  randconfig-004-20240218   clang
i386                  randconfig-005-20240218   clang
i386                  randconfig-006-20240218   gcc  
i386                  randconfig-011-20240218   gcc  
i386                  randconfig-012-20240218   gcc  
i386                  randconfig-013-20240218   clang
i386                  randconfig-014-20240218   gcc  
i386                  randconfig-015-20240218   gcc  
i386                  randconfig-016-20240218   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240218   gcc  
loongarch             randconfig-001-20240219   gcc  
loongarch             randconfig-002-20240218   gcc  
loongarch             randconfig-002-20240219   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     cu1000-neo_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                           mtx1_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240218   gcc  
nios2                 randconfig-001-20240219   gcc  
nios2                 randconfig-002-20240218   gcc  
nios2                 randconfig-002-20240219   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240218   gcc  
parisc                randconfig-001-20240219   gcc  
parisc                randconfig-002-20240218   gcc  
parisc                randconfig-002-20240219   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                      mgcoge_defconfig   clang
powerpc                      ppc64e_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc               randconfig-001-20240218   gcc  
powerpc               randconfig-001-20240219   gcc  
powerpc               randconfig-002-20240218   gcc  
powerpc               randconfig-003-20240218   clang
powerpc                     stx_gp3_defconfig   clang
powerpc                 xes_mpc85xx_defconfig   gcc  
powerpc64             randconfig-001-20240218   clang
powerpc64             randconfig-002-20240218   gcc  
powerpc64             randconfig-002-20240219   gcc  
powerpc64             randconfig-003-20240218   gcc  
powerpc64             randconfig-003-20240219   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240218   gcc  
riscv                 randconfig-001-20240219   gcc  
riscv                 randconfig-002-20240218   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240218   gcc  
s390                  randconfig-001-20240219   gcc  
s390                  randconfig-002-20240218   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20240218   gcc  
sh                    randconfig-001-20240219   gcc  
sh                    randconfig-002-20240218   gcc  
sh                    randconfig-002-20240219   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240218   gcc  
sparc64               randconfig-001-20240219   gcc  
sparc64               randconfig-002-20240218   gcc  
sparc64               randconfig-002-20240219   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                    randconfig-001-20240218   gcc  
um                    randconfig-002-20240218   clang
um                    randconfig-002-20240219   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240218   clang
x86_64       buildonly-randconfig-001-20240219   clang
x86_64       buildonly-randconfig-002-20240218   gcc  
x86_64       buildonly-randconfig-002-20240219   clang
x86_64       buildonly-randconfig-003-20240218   gcc  
x86_64       buildonly-randconfig-004-20240218   clang
x86_64       buildonly-randconfig-004-20240219   clang
x86_64       buildonly-randconfig-005-20240218   gcc  
x86_64       buildonly-randconfig-005-20240219   clang
x86_64       buildonly-randconfig-006-20240218   gcc  
x86_64       buildonly-randconfig-006-20240219   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240218   clang
x86_64                randconfig-001-20240219   clang
x86_64                randconfig-002-20240218   clang
x86_64                randconfig-002-20240219   clang
x86_64                randconfig-003-20240218   gcc  
x86_64                randconfig-004-20240218   gcc  
x86_64                randconfig-005-20240218   gcc  
x86_64                randconfig-005-20240219   clang
x86_64                randconfig-006-20240218   clang
x86_64                randconfig-006-20240219   clang
x86_64                randconfig-011-20240218   clang
x86_64                randconfig-011-20240219   clang
x86_64                randconfig-012-20240218   gcc  
x86_64                randconfig-013-20240218   clang
x86_64                randconfig-013-20240219   clang
x86_64                randconfig-014-20240218   clang
x86_64                randconfig-015-20240218   gcc  
x86_64                randconfig-015-20240219   clang
x86_64                randconfig-016-20240218   clang
x86_64                randconfig-071-20240218   gcc  
x86_64                randconfig-072-20240218   clang
x86_64                randconfig-072-20240219   clang
x86_64                randconfig-073-20240218   gcc  
x86_64                randconfig-074-20240218   gcc  
x86_64                randconfig-075-20240218   clang
x86_64                randconfig-075-20240219   clang
x86_64                randconfig-076-20240218   gcc  
x86_64                randconfig-076-20240219   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20240218   gcc  
xtensa                randconfig-001-20240219   gcc  
xtensa                randconfig-002-20240218   gcc  
xtensa                randconfig-002-20240219   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
