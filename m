Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150C8213B4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jan 2024 13:18:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NQL18Xlh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T3Zkx67SNz3cVh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jan 2024 23:18:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NQL18Xlh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T3Zk62hFhz2y1j
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jan 2024 23:17:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704111455; x=1735647455;
  h=date:from:to:cc:subject:message-id;
  bh=zMVQ3hBJA8l5vRU0B3v6J5/mhS80be+fW1HhOZcGICw=;
  b=NQL18XlhvA/YlM8tw9gs+/cy7DeVnUPbl73+jtKkHuXSsBAq7KFjx1wZ
   eYl7vRdIzkbBqd29P7ne/5XDK1j7TuPKUbFoernIajVbk7ArNXYSUJon3
   yNP4xoWmgP3BCHQACOavo7QP9qF8uNwli+yxg+ELAo6y8boozhUT1EWUO
   X7qijTj2LSsLwJskFiT78o9as7dKzc5dLLwl6C4ni+ojkZ3TX+JDUpT0A
   UnniIDA3ldujJheSQe4UODdJ0liAtFiAfbPx2kuXQQr4O6IYFTgugvUrG
   wbtocQdzmico7wjhM6m2IdTOiIRPFdIqesJTVXQBJu44E4tigoD0Y58If
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="10179988"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="10179988"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2024 04:17:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="869980269"
X-IronPort-AV: E=Sophos;i="6.04,322,1695711600"; 
   d="scan'208";a="869980269"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jan 2024 04:17:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rKHES-000KEe-0b;
	Mon, 01 Jan 2024 12:17:24 +0000
Date: Mon, 01 Jan 2024 20:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 414e92af226ede4935509b0b5e041810c92e003f
Message-ID: <202401012028.Y8TxpxDJ-lkp@intel.com>
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
branch HEAD: 414e92af226ede4935509b0b5e041810c92e003f  Automatic merge of 'master' into merge (2023-12-31 22:04)

elapsed time: 1452m

configs tested: 221
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
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231231   gcc  
arc                   randconfig-002-20231231   gcc  
arc                           tb10x_defconfig   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                     am200epdkit_defconfig   clang
arm                         at91_dt_defconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   clang
arm                      footbridge_defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                        multi_v5_defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                           omap1_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                            qcom_defconfig   gcc  
arm                   randconfig-001-20231231   gcc  
arm                   randconfig-002-20231231   gcc  
arm                   randconfig-003-20231231   gcc  
arm                   randconfig-004-20231231   gcc  
arm                        spear6xx_defconfig   gcc  
arm                           spitz_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231231   gcc  
arm64                 randconfig-002-20231231   gcc  
arm64                 randconfig-003-20231231   gcc  
arm64                 randconfig-004-20231231   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231231   gcc  
csky                  randconfig-002-20231231   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231231   clang
hexagon               randconfig-002-20231231   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231231   gcc  
i386         buildonly-randconfig-002-20231231   gcc  
i386         buildonly-randconfig-003-20231231   gcc  
i386         buildonly-randconfig-004-20231231   gcc  
i386         buildonly-randconfig-005-20231231   gcc  
i386         buildonly-randconfig-006-20231231   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231231   gcc  
i386                  randconfig-002-20231231   gcc  
i386                  randconfig-003-20231231   gcc  
i386                  randconfig-004-20231231   gcc  
i386                  randconfig-005-20231231   gcc  
i386                  randconfig-006-20231231   gcc  
i386                  randconfig-011-20231231   clang
i386                  randconfig-012-20231231   clang
i386                  randconfig-013-20231231   clang
i386                  randconfig-014-20231231   clang
i386                  randconfig-015-20231231   clang
i386                  randconfig-016-20231231   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231231   gcc  
loongarch             randconfig-002-20231231   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          hp300_defconfig   gcc  
m68k                           sun3_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                           ip27_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                          rm200_defconfig   gcc  
mips                           rs90_defconfig   clang
mips                         rt305x_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231231   gcc  
nios2                 randconfig-002-20231231   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231231   gcc  
parisc                randconfig-002-20231231   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                  mpc866_ads_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20231231   gcc  
powerpc               randconfig-002-20231231   gcc  
powerpc               randconfig-003-20231231   gcc  
powerpc                  storcenter_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
powerpc64             randconfig-001-20231231   gcc  
powerpc64             randconfig-002-20231231   gcc  
powerpc64             randconfig-003-20231231   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231231   gcc  
riscv                 randconfig-002-20231231   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231231   clang
s390                  randconfig-002-20231231   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                    randconfig-001-20231231   gcc  
sh                    randconfig-002-20231231   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231231   gcc  
sparc64               randconfig-002-20231231   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231231   gcc  
um                    randconfig-002-20231231   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231231   gcc  
x86_64       buildonly-randconfig-002-20231231   gcc  
x86_64       buildonly-randconfig-003-20231231   gcc  
x86_64       buildonly-randconfig-004-20231231   gcc  
x86_64       buildonly-randconfig-005-20231231   gcc  
x86_64       buildonly-randconfig-006-20231231   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231231   clang
x86_64                randconfig-002-20231231   clang
x86_64                randconfig-003-20231231   clang
x86_64                randconfig-004-20231231   clang
x86_64                randconfig-005-20231231   clang
x86_64                randconfig-006-20231231   clang
x86_64                randconfig-011-20231231   gcc  
x86_64                randconfig-012-20231231   gcc  
x86_64                randconfig-013-20231231   gcc  
x86_64                randconfig-014-20231231   gcc  
x86_64                randconfig-015-20231231   gcc  
x86_64                randconfig-016-20231231   gcc  
x86_64                randconfig-071-20231231   gcc  
x86_64                randconfig-072-20231231   gcc  
x86_64                randconfig-073-20231231   gcc  
x86_64                randconfig-074-20231231   gcc  
x86_64                randconfig-075-20231231   gcc  
x86_64                randconfig-076-20231231   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20231231   gcc  
xtensa                randconfig-002-20231231   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
