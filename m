Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9460D82058E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Dec 2023 13:09:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RTrCHGuz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T2Ldd0gTTz3cVq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Dec 2023 23:09:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RTrCHGuz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T2Lcj3zG6z3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Dec 2023 23:08:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703938118; x=1735474118;
  h=date:from:to:cc:subject:message-id;
  bh=5bD9jFHTKpg0F2/t6aPGnzncuczsGv3AVKrr5ReOKZk=;
  b=RTrCHGuz+u5gO+2SO+p0tsdhDd0GjtdSqjrTn6C2eCeZsrkcvyVavLVE
   nfW+zeTINJqeL+asLLtLIfiGUG6h7WNZdW9Y+fgc6y4iheaUtk5GiWFBd
   1cjykQA2thJoHVHzK8iRDpJTJ9F8IPuRf1/Yhio5XQOMrvD/cFfHgrxGN
   KmlrHFK7J00CK9cS7j4PKWce03S8xTaFsnPcMFsXjbDIRHUA5g6EnPkLN
   PFRkOI0BZtDDnfCD6A1J46whNAabkVh8rxHnDFAxY/hZ3MiErgj2Nq9HY
   PTF2wRYeUK90U1Xm1Qx3jAEJOTFCUejrTC8YLxKDv1fICAu4YELwD2xOl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="10294338"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="10294338"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 03:55:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="1110367623"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="1110367623"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Dec 2023 03:54:59 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJXvc-000IPD-0H;
	Sat, 30 Dec 2023 11:54:56 +0000
Date: Sat, 30 Dec 2023 19:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 b5aa3d696430bc74d24a2e6e2bad450fd5229ce7
Message-ID: <202312301956.RJ61Cy0A-lkp@intel.com>
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
branch HEAD: b5aa3d696430bc74d24a2e6e2bad450fd5229ce7  Automatic merge of 'next' into merge (2023-12-29 21:54)

elapsed time: 1458m

configs tested: 256
configs skipped: 2

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
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   clang
arm                   milbeaut_m10v_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
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
loongarch             randconfig-001-20231229   gcc  
loongarch             randconfig-001-20231230   gcc  
loongarch             randconfig-002-20231229   gcc  
loongarch             randconfig-002-20231230   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                     cu1830-neo_defconfig   clang
mips                      fuloong2e_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip22_defconfig   gcc  
mips                     loongson1c_defconfig   clang
mips                     loongson2k_defconfig   gcc  
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
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                        dreamcast_defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20231229   gcc  
sh                    randconfig-001-20231230   gcc  
sh                    randconfig-002-20231229   gcc  
sh                    randconfig-002-20231230   gcc  
sh                          rsk7201_defconfig   gcc  
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
