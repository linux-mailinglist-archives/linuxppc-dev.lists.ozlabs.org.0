Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41C92993E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 20:03:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NHJAH7U9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHFVg44jkz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 04:03:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NHJAH7U9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHFTw2yY8z30V7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2024 04:02:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720375380; x=1751911380;
  h=date:from:to:cc:subject:message-id;
  bh=LB8PLtyXRbFLAgbHnwpCk6G53dtYPUDnybjjKNWKpG4=;
  b=NHJAH7U9miXEJYulR1FUeuDhc97/pozh2Msla6Dls4B/mb1NAH8NTXOw
   rKxud7XsX+vSgyVzJPsB9+zO+6HMU1BVLaNiZCu+Kj2n4C1jXYdkIp2P3
   xvqmzlHgCyjh8D2WkmEATchNmRBOtkeiGSnrGvSRtIO+XxYv1u2NRkg3o
   EJyVzp2n3rKioTrPcqusE3YWeYYrisGX9n1OKTC+/nMiaSjpuopWfO/Cq
   z5YF2qT/9CxgcVDoM4XemC8V9356zPHaai+355TUqX+wlmSJ6RPF9HUE5
   9V6ztKqyG2LkzYq+5hYWbrCVNbnvSTcPrQpM2djCziFDUZ3imSvD8XY6A
   A==;
X-CSE-ConnectionGUID: SWTMi2yfQ+SPKv2b304H4Q==
X-CSE-MsgGUID: Dq0DLfv/SVOpvmUJyrX79w==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="42999961"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="42999961"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 11:02:55 -0700
X-CSE-ConnectionGUID: 4RVwTjmCRUWeBfhZghXqLA==
X-CSE-MsgGUID: QCmOmqbKSR6fpVAOmwukdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47361196"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jul 2024 11:02:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQWDr-000VAr-2s;
	Sun, 07 Jul 2024 18:02:51 +0000
Date: Mon, 08 Jul 2024 02:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 76b93049cc60a9f50fe268afa2785be2c4cb0b12
Message-ID: <202407080252.ybRDgQyL-lkp@intel.com>
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
branch HEAD: 76b93049cc60a9f50fe268afa2785be2c4cb0b12  Automatic merge of 'next' into merge (2024-07-07 09:19)

elapsed time: 1071m

configs tested: 229
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc-13.2.0
alpha                            allyesconfig   gcc-13.2.0
alpha                               defconfig   gcc-13.2.0
arc                              allmodconfig   gcc-13.2.0
arc                               allnoconfig   gcc-13.2.0
arc                              allyesconfig   gcc-13.2.0
arc                                 defconfig   gcc-13.2.0
arc                     haps_hs_smp_defconfig   gcc-13.2.0
arc                   randconfig-001-20240707   gcc-13.2.0
arc                   randconfig-002-20240707   gcc-13.2.0
arm                              allmodconfig   gcc-13.2.0
arm                               allnoconfig   clang-19
arm                               allnoconfig   gcc-13.2.0
arm                              allyesconfig   gcc-13.2.0
arm                                 defconfig   clang-14
arm                                 defconfig   gcc-13.2.0
arm                          ep93xx_defconfig   clang-14
arm                            hisi_defconfig   gcc-13.2.0
arm                         lpc32xx_defconfig   clang-14
arm                        multi_v5_defconfig   clang-14
arm                       netwinder_defconfig   gcc-13.2.0
arm                   randconfig-001-20240707   gcc-13.2.0
arm                   randconfig-002-20240707   clang-19
arm                   randconfig-002-20240707   gcc-13.2.0
arm                   randconfig-003-20240707   clang-19
arm                   randconfig-003-20240707   gcc-13.2.0
arm                   randconfig-004-20240707   clang-19
arm                   randconfig-004-20240707   gcc-13.2.0
arm                        spear3xx_defconfig   clang-14
arm                           tegra_defconfig   clang-14
arm64                            allmodconfig   clang-19
arm64                            allmodconfig   gcc-13.2.0
arm64                             allnoconfig   gcc-13.2.0
arm64                               defconfig   gcc-13.2.0
arm64                 randconfig-001-20240707   clang-19
arm64                 randconfig-001-20240707   gcc-13.2.0
arm64                 randconfig-002-20240707   gcc-13.2.0
arm64                 randconfig-003-20240707   gcc-13.2.0
arm64                 randconfig-004-20240707   clang-19
arm64                 randconfig-004-20240707   gcc-13.2.0
csky                              allnoconfig   gcc-13.2.0
csky                                defconfig   gcc-13.2.0
csky                  randconfig-001-20240707   gcc-13.2.0
csky                  randconfig-002-20240707   gcc-13.2.0
hexagon                          allmodconfig   clang-19
hexagon                           allnoconfig   clang-19
hexagon                          allyesconfig   clang-19
hexagon                             defconfig   clang-19
hexagon               randconfig-001-20240707   clang-14
hexagon               randconfig-002-20240707   clang-19
i386                             allmodconfig   clang-18
i386                             allmodconfig   gcc-13
i386                              allnoconfig   clang-18
i386                              allnoconfig   gcc-13
i386                             allyesconfig   clang-18
i386                             allyesconfig   gcc-13
i386         buildonly-randconfig-001-20240707   gcc-13
i386         buildonly-randconfig-002-20240707   clang-18
i386         buildonly-randconfig-003-20240707   clang-18
i386         buildonly-randconfig-004-20240707   gcc-13
i386         buildonly-randconfig-005-20240707   gcc-11
i386         buildonly-randconfig-006-20240707   gcc-9
i386                                defconfig   clang-18
i386                  randconfig-001-20240707   gcc-7
i386                  randconfig-002-20240707   clang-18
i386                  randconfig-003-20240707   clang-18
i386                  randconfig-004-20240707   clang-18
i386                  randconfig-005-20240707   clang-18
i386                  randconfig-006-20240707   clang-18
i386                  randconfig-011-20240707   gcc-13
i386                  randconfig-012-20240707   gcc-8
i386                  randconfig-013-20240707   gcc-13
i386                  randconfig-014-20240707   clang-18
i386                  randconfig-015-20240707   clang-18
i386                  randconfig-016-20240707   gcc-13
loongarch                        allmodconfig   gcc-13.2.0
loongarch                         allnoconfig   gcc-13.2.0
loongarch                           defconfig   gcc-13.2.0
loongarch             randconfig-001-20240707   gcc-13.2.0
loongarch             randconfig-002-20240707   gcc-13.2.0
m68k                             allmodconfig   gcc-13.2.0
m68k                              allnoconfig   gcc-13.2.0
m68k                             allyesconfig   gcc-13.2.0
m68k                                defconfig   gcc-13.2.0
m68k                       m5275evb_defconfig   gcc-13.2.0
microblaze                       allmodconfig   gcc-13.2.0
microblaze                        allnoconfig   gcc-13.2.0
microblaze                       allyesconfig   gcc-13.2.0
microblaze                          defconfig   gcc-13.2.0
mips                              allnoconfig   gcc-13.2.0
mips                          ath25_defconfig   clang-19
mips                     cu1830-neo_defconfig   gcc-13.2.0
mips                            gpr_defconfig   clang-19
mips                           ip27_defconfig   gcc-13.2.0
mips                           ip28_defconfig   gcc-13.2.0
mips                          rb532_defconfig   clang-14
nios2                             allnoconfig   gcc-13.2.0
nios2                               defconfig   gcc-13.2.0
nios2                 randconfig-001-20240707   gcc-13.2.0
nios2                 randconfig-002-20240707   gcc-13.2.0
openrisc                         alldefconfig   gcc-13.2.0
openrisc                          allnoconfig   gcc-13.2.0
openrisc                         allyesconfig   gcc-13.2.0
openrisc                            defconfig   gcc-13.2.0
parisc                           allmodconfig   gcc-13.2.0
parisc                            allnoconfig   gcc-13.2.0
parisc                           allyesconfig   gcc-13.2.0
parisc                              defconfig   gcc-13.2.0
parisc                generic-64bit_defconfig   gcc-13.2.0
parisc                randconfig-001-20240707   gcc-13.2.0
parisc                randconfig-002-20240707   gcc-13.2.0
parisc64                            defconfig   gcc-13.2.0
powerpc                     akebono_defconfig   clang-14
powerpc                          allmodconfig   gcc-13.2.0
powerpc                           allnoconfig   gcc-13.2.0
powerpc                          allyesconfig   clang-19
powerpc                 canyonlands_defconfig   clang-14
powerpc                 mpc8315_rdb_defconfig   clang-19
powerpc                      pmac32_defconfig   clang-14
powerpc               randconfig-001-20240707   clang-19
powerpc               randconfig-001-20240707   gcc-13.2.0
powerpc               randconfig-002-20240707   gcc-13.2.0
powerpc               randconfig-003-20240707   clang-19
powerpc               randconfig-003-20240707   gcc-13.2.0
powerpc                     tqm8541_defconfig   clang-15
powerpc                         wii_defconfig   clang-14
powerpc64             randconfig-001-20240707   clang-17
powerpc64             randconfig-001-20240707   gcc-13.2.0
powerpc64             randconfig-002-20240707   clang-19
powerpc64             randconfig-002-20240707   gcc-13.2.0
powerpc64             randconfig-003-20240707   clang-19
powerpc64             randconfig-003-20240707   gcc-13.2.0
riscv                            alldefconfig   clang-14
riscv                            allmodconfig   clang-19
riscv                             allnoconfig   gcc-13.2.0
riscv                            allyesconfig   clang-19
riscv                               defconfig   clang-19
riscv                               defconfig   gcc-13.2.0
riscv             nommu_k210_sdcard_defconfig   clang-14
riscv                 randconfig-001-20240707   clang-15
riscv                 randconfig-001-20240707   gcc-13.2.0
riscv                 randconfig-002-20240707   clang-19
riscv                 randconfig-002-20240707   gcc-13.2.0
s390                             allmodconfig   clang-19
s390                              allnoconfig   clang-19
s390                             allyesconfig   clang-19
s390                             allyesconfig   gcc-13.2.0
s390                                defconfig   clang-19
s390                                defconfig   gcc-13.2.0
s390                  randconfig-001-20240707   gcc-13.2.0
s390                  randconfig-002-20240707   clang-19
s390                  randconfig-002-20240707   gcc-13.2.0
sh                               allmodconfig   gcc-13.2.0
sh                                allnoconfig   gcc-13.2.0
sh                               allyesconfig   gcc-13.2.0
sh                                  defconfig   gcc-13.2.0
sh                        edosk7705_defconfig   gcc-13.2.0
sh                    randconfig-001-20240707   gcc-13.2.0
sh                    randconfig-002-20240707   gcc-13.2.0
sh                           se7705_defconfig   gcc-13.2.0
sh                        sh7757lcr_defconfig   gcc-13.2.0
sparc                            allmodconfig   gcc-13.2.0
sparc64                             defconfig   gcc-13.2.0
sparc64               randconfig-001-20240707   gcc-13.2.0
sparc64               randconfig-002-20240707   gcc-13.2.0
um                               allmodconfig   clang-19
um                               allmodconfig   gcc-13.2.0
um                                allnoconfig   clang-17
um                               allyesconfig   gcc-13
um                               allyesconfig   gcc-13.2.0
um                                  defconfig   clang-19
um                                  defconfig   gcc-13.2.0
um                             i386_defconfig   gcc-13
um                             i386_defconfig   gcc-13.2.0
um                    randconfig-001-20240707   clang-19
um                    randconfig-001-20240707   gcc-13.2.0
um                    randconfig-002-20240707   gcc-11
um                    randconfig-002-20240707   gcc-13.2.0
um                           x86_64_defconfig   clang-15
um                           x86_64_defconfig   gcc-13.2.0
x86_64                            allnoconfig   clang-18
x86_64                           allyesconfig   clang-18
x86_64       buildonly-randconfig-001-20240707   gcc-13
x86_64       buildonly-randconfig-002-20240707   gcc-13
x86_64       buildonly-randconfig-003-20240707   clang-18
x86_64       buildonly-randconfig-003-20240707   gcc-13
x86_64       buildonly-randconfig-004-20240707   gcc-13
x86_64       buildonly-randconfig-005-20240707   clang-18
x86_64       buildonly-randconfig-005-20240707   gcc-13
x86_64       buildonly-randconfig-006-20240707   clang-18
x86_64       buildonly-randconfig-006-20240707   gcc-13
x86_64                              defconfig   clang-18
x86_64                              defconfig   gcc-13
x86_64                randconfig-001-20240707   clang-18
x86_64                randconfig-001-20240707   gcc-13
x86_64                randconfig-002-20240707   clang-18
x86_64                randconfig-002-20240707   gcc-13
x86_64                randconfig-003-20240707   clang-18
x86_64                randconfig-003-20240707   gcc-13
x86_64                randconfig-004-20240707   clang-18
x86_64                randconfig-004-20240707   gcc-13
x86_64                randconfig-005-20240707   gcc-13
x86_64                randconfig-006-20240707   gcc-12
x86_64                randconfig-006-20240707   gcc-13
x86_64                randconfig-011-20240707   clang-18
x86_64                randconfig-011-20240707   gcc-13
x86_64                randconfig-012-20240707   gcc-13
x86_64                randconfig-012-20240707   gcc-7
x86_64                randconfig-013-20240707   clang-18
x86_64                randconfig-013-20240707   gcc-13
x86_64                randconfig-014-20240707   gcc-13
x86_64                randconfig-015-20240707   gcc-13
x86_64                randconfig-015-20240707   gcc-7
x86_64                randconfig-016-20240707   clang-18
x86_64                randconfig-016-20240707   gcc-13
x86_64                randconfig-071-20240707   gcc-13
x86_64                randconfig-072-20240707   gcc-13
x86_64                randconfig-072-20240707   gcc-7
x86_64                randconfig-073-20240707   clang-18
x86_64                randconfig-073-20240707   gcc-13
x86_64                randconfig-074-20240707   clang-18
x86_64                randconfig-074-20240707   gcc-13
x86_64                randconfig-075-20240707   clang-18
x86_64                randconfig-075-20240707   gcc-13
x86_64                randconfig-076-20240707   gcc-13
x86_64                          rhel-8.3-rust   clang-18
xtensa                            allnoconfig   gcc-13.2.0
xtensa                randconfig-001-20240707   gcc-13.2.0
xtensa                randconfig-002-20240707   gcc-13.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
