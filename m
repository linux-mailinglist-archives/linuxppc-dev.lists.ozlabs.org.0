Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6BC8205D3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Dec 2023 13:12:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDTHlQ5E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T2Lj6061Hz3cRD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Dec 2023 23:12:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDTHlQ5E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T2LhH58Hbz3cFf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Dec 2023 23:11:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703938304; x=1735474304;
  h=date:from:to:cc:subject:message-id;
  bh=M0gKrk7udMJzbXzdeMrDLhayHCZl4Nvx+jWzDSqRoJc=;
  b=KDTHlQ5EU+BUAuMV+bvypJOtET2sGESNjTxXa5PX9GlZEbjnY6ZSbehA
   vqMQwhT+GBjKI40IgtAyPsPaqSsqg3dj7rqeP7pkLlTJoTeB/BPswckWa
   bWR1xelIVx1iObrElT/80BMEpIMYSddnsGqUluEhHplebKuZzgyF/fOMm
   VDILDcQcvoL56BWdes309FJ/36PPLVOtjGKJe9MTHCEQEgXVfVXXvcRIA
   JvMeomGIueGr6/Yv9EmBbq3z5rGCqzPa7yF/gCFN/IwfoF+Y5i4NBUr+o
   GTE0zcEuw20Tnk5Uc1o3Y78YpHGYXkzLLtqIiSdQdjpWAsR4YR2xPIPE8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3549689"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="3549689"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 03:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="952285483"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="952285483"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Dec 2023 03:57:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJXxe-000IPV-1n;
	Sat, 30 Dec 2023 11:57:02 +0000
Date: Sat, 30 Dec 2023 19:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 44a1aad2fe6c10bfe0589d8047057b10a4c18a19
Message-ID: <202312301932.3K5c2Uv2-lkp@intel.com>
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
branch HEAD: 44a1aad2fe6c10bfe0589d8047057b10a4c18a19  Merge branch 'topic/ppc-kvm' into next

elapsed time: 1460m

configs tested: 269
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231229   gcc  
arc                   randconfig-001-20231230   gcc  
arc                   randconfig-002-20231229   gcc  
arc                   randconfig-002-20231230   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                        mvebu_v7_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231229   clang
arm                   randconfig-002-20231229   clang
arm                   randconfig-003-20231229   clang
arm                   randconfig-004-20231229   clang
arm                        realview_defconfig   gcc  
arm                         s3c6400_defconfig   gcc  
arm                           sama7_defconfig   clang
arm                        spear6xx_defconfig   gcc  
arm                           stm32_defconfig   gcc  
arm                           sunxi_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm                         wpcm450_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231229   clang
arm64                 randconfig-002-20231229   clang
arm64                 randconfig-003-20231229   clang
arm64                 randconfig-004-20231229   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231229   gcc  
csky                  randconfig-001-20231230   gcc  
csky                  randconfig-002-20231229   gcc  
csky                  randconfig-002-20231230   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231229   clang
hexagon               randconfig-002-20231229   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231229   clang
i386         buildonly-randconfig-002-20231229   clang
i386         buildonly-randconfig-003-20231229   clang
i386         buildonly-randconfig-004-20231229   clang
i386         buildonly-randconfig-005-20231229   clang
i386         buildonly-randconfig-006-20231229   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231229   clang
i386                  randconfig-002-20231229   clang
i386                  randconfig-003-20231229   clang
i386                  randconfig-004-20231229   clang
i386                  randconfig-005-20231229   clang
i386                  randconfig-006-20231229   clang
i386                  randconfig-011-20231229   gcc  
i386                  randconfig-011-20231230   gcc  
i386                  randconfig-012-20231229   gcc  
i386                  randconfig-012-20231230   gcc  
i386                  randconfig-013-20231229   gcc  
i386                  randconfig-013-20231230   gcc  
i386                  randconfig-014-20231229   gcc  
i386                  randconfig-014-20231230   gcc  
i386                  randconfig-015-20231229   gcc  
i386                  randconfig-015-20231230   gcc  
i386                  randconfig-016-20231229   gcc  
i386                  randconfig-016-20231230   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20231229   gcc  
loongarch             randconfig-001-20231230   gcc  
loongarch             randconfig-002-20231229   gcc  
loongarch             randconfig-002-20231230   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                           ci20_defconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                       lemote2f_defconfig   gcc  
mips                     loongson1b_defconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                     loongson2k_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                        qi_lb60_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231229   gcc  
nios2                 randconfig-001-20231230   gcc  
nios2                 randconfig-002-20231229   gcc  
nios2                 randconfig-002-20231230   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231229   gcc  
parisc                randconfig-001-20231230   gcc  
parisc                randconfig-002-20231229   gcc  
parisc                randconfig-002-20231230   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                    amigaone_defconfig   gcc  
powerpc                      arches_defconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                     ppa8548_defconfig   gcc  
powerpc               randconfig-001-20231229   clang
powerpc               randconfig-002-20231229   clang
powerpc               randconfig-003-20231229   clang
powerpc                    socrates_defconfig   gcc  
powerpc                     tqm5200_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc64             randconfig-001-20231229   clang
powerpc64             randconfig-002-20231229   clang
powerpc64             randconfig-003-20231229   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231229   clang
riscv                 randconfig-002-20231229   clang
riscv                          rv32_defconfig   clang
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231229   gcc  
s390                  randconfig-001-20231230   gcc  
s390                  randconfig-002-20231229   gcc  
s390                  randconfig-002-20231230   gcc  
sh                               alldefconfig   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20231229   gcc  
sh                    randconfig-001-20231230   gcc  
sh                    randconfig-002-20231229   gcc  
sh                    randconfig-002-20231230   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231229   gcc  
sparc64               randconfig-001-20231230   gcc  
sparc64               randconfig-002-20231229   gcc  
sparc64               randconfig-002-20231230   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231229   clang
um                    randconfig-002-20231229   clang
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231229   clang
x86_64       buildonly-randconfig-001-20231230   clang
x86_64       buildonly-randconfig-002-20231229   clang
x86_64       buildonly-randconfig-002-20231230   clang
x86_64       buildonly-randconfig-003-20231229   clang
x86_64       buildonly-randconfig-003-20231230   clang
x86_64       buildonly-randconfig-004-20231229   clang
x86_64       buildonly-randconfig-004-20231230   clang
x86_64       buildonly-randconfig-005-20231229   clang
x86_64       buildonly-randconfig-005-20231230   clang
x86_64       buildonly-randconfig-006-20231229   clang
x86_64       buildonly-randconfig-006-20231230   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231229   gcc  
x86_64                randconfig-002-20231229   gcc  
x86_64                randconfig-003-20231229   gcc  
x86_64                randconfig-004-20231229   gcc  
x86_64                randconfig-005-20231229   gcc  
x86_64                randconfig-006-20231229   gcc  
x86_64                randconfig-011-20231229   clang
x86_64                randconfig-011-20231230   clang
x86_64                randconfig-012-20231229   clang
x86_64                randconfig-012-20231230   clang
x86_64                randconfig-013-20231229   clang
x86_64                randconfig-013-20231230   clang
x86_64                randconfig-014-20231229   clang
x86_64                randconfig-014-20231230   clang
x86_64                randconfig-015-20231229   clang
x86_64                randconfig-015-20231230   clang
x86_64                randconfig-016-20231229   clang
x86_64                randconfig-016-20231230   clang
x86_64                randconfig-071-20231229   clang
x86_64                randconfig-071-20231230   clang
x86_64                randconfig-072-20231229   clang
x86_64                randconfig-072-20231230   clang
x86_64                randconfig-073-20231229   clang
x86_64                randconfig-073-20231230   clang
x86_64                randconfig-074-20231229   clang
x86_64                randconfig-074-20231230   clang
x86_64                randconfig-075-20231229   clang
x86_64                randconfig-075-20231230   clang
x86_64                randconfig-076-20231229   clang
x86_64                randconfig-076-20231230   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231229   gcc  
xtensa                randconfig-001-20231230   gcc  
xtensa                randconfig-002-20231229   gcc  
xtensa                randconfig-002-20231230   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
