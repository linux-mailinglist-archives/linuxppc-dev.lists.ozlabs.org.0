Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E187E1F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 03:02:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CwtL6gkI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TydR36mgZz3vch
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 13:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CwtL6gkI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TydPX27hRz3020
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:01:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710727280; x=1742263280;
  h=date:from:to:cc:subject:message-id;
  bh=Zpje+Mtyoe2tw2f0kqudz1NY7fH6+LJ4UZg0A0bzmjo=;
  b=CwtL6gkI67mBewUmij5BR1y8k3dMXgO+9zRAJ+pK0/wj9u1hRPVdX15f
   Ea6YUhcq/3voY3Am6pTFjKbAugBLkxgnSRzdwLpa+H+l0Jnct1S9woRhN
   7FFT7CVeGfcqnupvscaJ+L1LUESNl1sZnqznTLNLSbKwDc8ioROyADlw5
   CgMioVZG8xPaCyDUakUazPoXxsKs2Y/l/6yHWTXwi8CznMGQ04UTd20i6
   ujjrxV8vqbX0JOv9knUci040P4nVWlbuuTSLuUpUlpCnI5lmFO1MJ1UWP
   l6HYWkrxvE8iuZNlNe92MgLzWMiFhSDBxIYVVqiRtsJRt7B5Wz0Szphe/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5385945"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5385945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 19:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="18003926"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Mar 2024 19:01:02 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rm2J9-000GZr-0J;
	Mon, 18 Mar 2024 02:00:59 +0000
Date: Mon, 18 Mar 2024 10:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 5c4233cc0920cc90787aafe950b90f6c57a35b88
Message-ID: <202403181026.c1Htisrr-lkp@intel.com>
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
branch HEAD: 5c4233cc0920cc90787aafe950b90f6c57a35b88  powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency

elapsed time: 724m

configs tested: 223
configs skipped: 4

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
arc                         haps_hs_defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                   randconfig-001-20240317   gcc  
arc                   randconfig-002-20240317   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   clang
arm                         bcm2835_defconfig   clang
arm                        clps711x_defconfig   clang
arm                                 defconfig   clang
arm                           imxrt_defconfig   clang
arm                      integrator_defconfig   clang
arm                          moxart_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                   randconfig-001-20240317   clang
arm                   randconfig-002-20240317   clang
arm                   randconfig-003-20240317   gcc  
arm                   randconfig-004-20240317   clang
arm                        realview_defconfig   clang
arm                        vexpress_defconfig   gcc  
arm                    vt8500_v6_v7_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   clang
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240317   clang
arm64                 randconfig-002-20240317   gcc  
arm64                 randconfig-003-20240317   gcc  
arm64                 randconfig-004-20240317   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240317   gcc  
csky                  randconfig-002-20240317   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240317   clang
hexagon               randconfig-002-20240317   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240317   gcc  
i386         buildonly-randconfig-002-20240317   clang
i386         buildonly-randconfig-003-20240317   gcc  
i386         buildonly-randconfig-004-20240317   clang
i386         buildonly-randconfig-005-20240317   clang
i386         buildonly-randconfig-006-20240317   gcc  
i386                                defconfig   clang
i386                  randconfig-001-20240317   clang
i386                  randconfig-002-20240317   clang
i386                  randconfig-003-20240317   clang
i386                  randconfig-004-20240317   clang
i386                  randconfig-005-20240317   gcc  
i386                  randconfig-006-20240317   gcc  
i386                  randconfig-011-20240317   clang
i386                  randconfig-012-20240317   clang
i386                  randconfig-013-20240317   clang
i386                  randconfig-014-20240317   gcc  
i386                  randconfig-015-20240317   gcc  
i386                  randconfig-016-20240317   clang
loongarch                        alldefconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240317   gcc  
loongarch             randconfig-002-20240317   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                  cavium_octeon_defconfig   gcc  
mips                         db1xxx_defconfig   clang
mips                           jazz_defconfig   clang
mips                       lemote2f_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                      malta_kvm_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                      pic32mzda_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240317   gcc  
nios2                 randconfig-002-20240317   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                    or1ksim_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240317   gcc  
parisc                randconfig-002-20240317   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                 mpc837x_rdb_defconfig   gcc  
powerpc                  mpc866_ads_defconfig   clang
powerpc                      obs600_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20240317   clang
powerpc               randconfig-002-20240317   gcc  
powerpc               randconfig-003-20240317   clang
powerpc                     sequoia_defconfig   clang
powerpc                     skiroot_defconfig   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm8540_defconfig   gcc  
powerpc                     tqm8548_defconfig   clang
powerpc                     tqm8555_defconfig   clang
powerpc64             randconfig-001-20240317   gcc  
powerpc64             randconfig-002-20240317   clang
powerpc64             randconfig-003-20240317   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240317   clang
riscv                 randconfig-002-20240317   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240317   clang
s390                  randconfig-002-20240317   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20240317   gcc  
sh                    randconfig-002-20240317   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240317   gcc  
sparc64               randconfig-002-20240317   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240317   gcc  
um                    randconfig-002-20240317   gcc  
um                           x86_64_defconfig   clang
x86_64                           alldefconfig   gcc  
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240317   gcc  
x86_64       buildonly-randconfig-002-20240317   gcc  
x86_64       buildonly-randconfig-003-20240317   gcc  
x86_64       buildonly-randconfig-004-20240317   clang
x86_64       buildonly-randconfig-005-20240317   gcc  
x86_64       buildonly-randconfig-006-20240317   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240317   gcc  
x86_64                randconfig-002-20240317   gcc  
x86_64                randconfig-003-20240317   gcc  
x86_64                randconfig-004-20240317   gcc  
x86_64                randconfig-005-20240317   gcc  
x86_64                randconfig-006-20240317   clang
x86_64                randconfig-011-20240317   clang
x86_64                randconfig-012-20240317   gcc  
x86_64                randconfig-013-20240317   clang
x86_64                randconfig-014-20240317   clang
x86_64                randconfig-015-20240317   gcc  
x86_64                randconfig-016-20240317   clang
x86_64                randconfig-071-20240317   gcc  
x86_64                randconfig-072-20240317   clang
x86_64                randconfig-073-20240317   clang
x86_64                randconfig-074-20240317   gcc  
x86_64                randconfig-075-20240317   gcc  
x86_64                randconfig-076-20240317   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                randconfig-001-20240317   gcc  
xtensa                randconfig-002-20240317   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
