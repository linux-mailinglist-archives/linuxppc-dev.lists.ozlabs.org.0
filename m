Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D89FC7ACE17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 04:28:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pjo/eCG+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv6HL5fQBz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 12:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pjo/eCG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv6GQ0f2Cz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 12:27:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695608846; x=1727144846;
  h=date:from:to:cc:subject:message-id;
  bh=179SfoEsUxPsvLEExiXOXarruQ78gKMRnAdql76ZcCk=;
  b=Pjo/eCG+RZsK6VCZhmSaV3JVRdUs0RRPbEwHTvvpj5S8NI429Dl+hx6g
   I4xvfEImP7hgivkfsaLdrqMOg4QxEq7bYFUW0Iu/1LYTa6UbYvooZQTeI
   iFbfYiTJni3mdriOvMV3E8YXILirVCatXDKu7UUcn7uovNUKLCAzTDe7X
   yAd48bCU3FpZRWTwCxMGsGoYJh+mD7w3YJ1D5Kd2KRKK655ehdR2StiU3
   Kwr2ByDgrgtrdFtRgIPJ7wClBhWPl25Ekz6zA8XOaiK2wOEULb3ykncWT
   4oOC63yrfiYvmAA5S4PbGHLrnpxq49IwOGSlvq6sX10firfuW+/9BQ6s5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445252846"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="445252846"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 19:27:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697830544"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="697830544"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Sep 2023 19:27:17 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkbJa-0000nb-2x;
	Mon, 25 Sep 2023 02:27:14 +0000
Date: Mon, 25 Sep 2023 10:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 58b33e78a31782ffe25d404d5eba9a45fe636e27
Message-ID: <202309251055.GXm5MzvT-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 58b33e78a31782ffe25d404d5eba9a45fe636e27  selftests/powerpc: Fix emit_tests to work with run_kselftest.sh

elapsed time: 3766m

configs tested: 338
configs skipped: 2

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
arc                      axs103_smp_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arc                   randconfig-001-20230922   gcc  
arc                   randconfig-001-20230923   gcc  
arc                   randconfig-001-20230924   gcc  
arc                        vdk_hs38_defconfig   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g4_defconfig   clang
arm                                 defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                   randconfig-001-20230922   gcc  
arm                   randconfig-001-20230923   gcc  
arm                   randconfig-001-20230924   gcc  
arm                   randconfig-001-20230925   gcc  
arm                             rpc_defconfig   gcc  
arm                         s3c6400_defconfig   gcc  
arm                        shmobile_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
hexagon                           allnoconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230922   gcc  
i386         buildonly-randconfig-001-20230923   gcc  
i386         buildonly-randconfig-001-20230924   gcc  
i386         buildonly-randconfig-002-20230922   gcc  
i386         buildonly-randconfig-002-20230923   gcc  
i386         buildonly-randconfig-002-20230924   gcc  
i386         buildonly-randconfig-003-20230922   gcc  
i386         buildonly-randconfig-003-20230923   gcc  
i386         buildonly-randconfig-003-20230924   gcc  
i386         buildonly-randconfig-004-20230922   gcc  
i386         buildonly-randconfig-004-20230923   gcc  
i386         buildonly-randconfig-004-20230924   gcc  
i386         buildonly-randconfig-005-20230922   gcc  
i386         buildonly-randconfig-005-20230923   gcc  
i386         buildonly-randconfig-005-20230924   gcc  
i386         buildonly-randconfig-006-20230922   gcc  
i386         buildonly-randconfig-006-20230923   gcc  
i386         buildonly-randconfig-006-20230924   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230922   gcc  
i386                  randconfig-001-20230923   gcc  
i386                  randconfig-001-20230924   gcc  
i386                  randconfig-001-20230925   gcc  
i386                  randconfig-002-20230922   gcc  
i386                  randconfig-002-20230923   gcc  
i386                  randconfig-002-20230924   gcc  
i386                  randconfig-002-20230925   gcc  
i386                  randconfig-003-20230922   gcc  
i386                  randconfig-003-20230923   gcc  
i386                  randconfig-003-20230924   gcc  
i386                  randconfig-003-20230925   gcc  
i386                  randconfig-004-20230922   gcc  
i386                  randconfig-004-20230923   gcc  
i386                  randconfig-004-20230924   gcc  
i386                  randconfig-004-20230925   gcc  
i386                  randconfig-005-20230922   gcc  
i386                  randconfig-005-20230923   gcc  
i386                  randconfig-005-20230924   gcc  
i386                  randconfig-005-20230925   gcc  
i386                  randconfig-006-20230922   gcc  
i386                  randconfig-006-20230923   gcc  
i386                  randconfig-006-20230924   gcc  
i386                  randconfig-006-20230925   gcc  
i386                  randconfig-011-20230922   gcc  
i386                  randconfig-011-20230923   gcc  
i386                  randconfig-011-20230924   gcc  
i386                  randconfig-011-20230925   gcc  
i386                  randconfig-012-20230922   gcc  
i386                  randconfig-012-20230923   gcc  
i386                  randconfig-012-20230924   gcc  
i386                  randconfig-012-20230925   gcc  
i386                  randconfig-013-20230922   gcc  
i386                  randconfig-013-20230923   gcc  
i386                  randconfig-013-20230924   gcc  
i386                  randconfig-013-20230925   gcc  
i386                  randconfig-014-20230922   gcc  
i386                  randconfig-014-20230923   gcc  
i386                  randconfig-014-20230924   gcc  
i386                  randconfig-014-20230925   gcc  
i386                  randconfig-015-20230922   gcc  
i386                  randconfig-015-20230923   gcc  
i386                  randconfig-015-20230924   gcc  
i386                  randconfig-015-20230925   gcc  
i386                  randconfig-016-20230922   gcc  
i386                  randconfig-016-20230923   gcc  
i386                  randconfig-016-20230924   gcc  
i386                  randconfig-016-20230925   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch                 loongson3_defconfig   gcc  
loongarch             randconfig-001-20230922   gcc  
loongarch             randconfig-001-20230923   gcc  
loongarch             randconfig-001-20230924   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                          multi_defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                            ar7_defconfig   gcc  
mips                         bigsur_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                     cu1000-neo_defconfig   clang
mips                  decstation_64_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                           ip27_defconfig   clang
mips                           ip32_defconfig   gcc  
mips                          rb532_defconfig   gcc  
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           alldefconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                  iss476-smp_defconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      pmac32_defconfig   clang
powerpc                     stx_gp3_defconfig   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8548_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                         wii_defconfig   gcc  
powerpc64                           defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20230922   gcc  
riscv                 randconfig-001-20230923   gcc  
riscv                 randconfig-001-20230924   gcc  
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230922   gcc  
s390                  randconfig-001-20230923   gcc  
s390                  randconfig-001-20230924   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7203_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                           se7206_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sh                  sh7785lcr_32bit_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230922   gcc  
sparc                 randconfig-001-20230923   gcc  
sparc                 randconfig-001-20230924   gcc  
sparc                 randconfig-001-20230925   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230922   gcc  
x86_64       buildonly-randconfig-001-20230923   gcc  
x86_64       buildonly-randconfig-001-20230924   gcc  
x86_64       buildonly-randconfig-001-20230925   gcc  
x86_64       buildonly-randconfig-002-20230922   gcc  
x86_64       buildonly-randconfig-002-20230923   gcc  
x86_64       buildonly-randconfig-002-20230924   gcc  
x86_64       buildonly-randconfig-002-20230925   gcc  
x86_64       buildonly-randconfig-003-20230922   gcc  
x86_64       buildonly-randconfig-003-20230923   gcc  
x86_64       buildonly-randconfig-003-20230924   gcc  
x86_64       buildonly-randconfig-003-20230925   gcc  
x86_64       buildonly-randconfig-004-20230922   gcc  
x86_64       buildonly-randconfig-004-20230923   gcc  
x86_64       buildonly-randconfig-004-20230924   gcc  
x86_64       buildonly-randconfig-004-20230925   gcc  
x86_64       buildonly-randconfig-005-20230922   gcc  
x86_64       buildonly-randconfig-005-20230923   gcc  
x86_64       buildonly-randconfig-005-20230924   gcc  
x86_64       buildonly-randconfig-005-20230925   gcc  
x86_64       buildonly-randconfig-006-20230922   gcc  
x86_64       buildonly-randconfig-006-20230923   gcc  
x86_64       buildonly-randconfig-006-20230924   gcc  
x86_64       buildonly-randconfig-006-20230925   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230922   gcc  
x86_64                randconfig-001-20230923   gcc  
x86_64                randconfig-001-20230924   gcc  
x86_64                randconfig-001-20230925   gcc  
x86_64                randconfig-002-20230922   gcc  
x86_64                randconfig-002-20230923   gcc  
x86_64                randconfig-002-20230924   gcc  
x86_64                randconfig-002-20230925   gcc  
x86_64                randconfig-003-20230922   gcc  
x86_64                randconfig-003-20230923   gcc  
x86_64                randconfig-003-20230924   gcc  
x86_64                randconfig-003-20230925   gcc  
x86_64                randconfig-004-20230922   gcc  
x86_64                randconfig-004-20230923   gcc  
x86_64                randconfig-004-20230924   gcc  
x86_64                randconfig-004-20230925   gcc  
x86_64                randconfig-005-20230922   gcc  
x86_64                randconfig-005-20230923   gcc  
x86_64                randconfig-005-20230924   gcc  
x86_64                randconfig-005-20230925   gcc  
x86_64                randconfig-006-20230922   gcc  
x86_64                randconfig-006-20230923   gcc  
x86_64                randconfig-006-20230924   gcc  
x86_64                randconfig-006-20230925   gcc  
x86_64                randconfig-011-20230923   gcc  
x86_64                randconfig-011-20230924   gcc  
x86_64                randconfig-011-20230925   gcc  
x86_64                randconfig-012-20230923   gcc  
x86_64                randconfig-012-20230924   gcc  
x86_64                randconfig-012-20230925   gcc  
x86_64                randconfig-013-20230923   gcc  
x86_64                randconfig-013-20230924   gcc  
x86_64                randconfig-013-20230925   gcc  
x86_64                randconfig-014-20230923   gcc  
x86_64                randconfig-014-20230924   gcc  
x86_64                randconfig-014-20230925   gcc  
x86_64                randconfig-015-20230923   gcc  
x86_64                randconfig-015-20230924   gcc  
x86_64                randconfig-015-20230925   gcc  
x86_64                randconfig-016-20230923   gcc  
x86_64                randconfig-016-20230924   gcc  
x86_64                randconfig-016-20230925   gcc  
x86_64                randconfig-071-20230922   gcc  
x86_64                randconfig-071-20230923   gcc  
x86_64                randconfig-071-20230924   gcc  
x86_64                randconfig-071-20230925   gcc  
x86_64                randconfig-072-20230922   gcc  
x86_64                randconfig-072-20230923   gcc  
x86_64                randconfig-072-20230924   gcc  
x86_64                randconfig-072-20230925   gcc  
x86_64                randconfig-073-20230922   gcc  
x86_64                randconfig-073-20230923   gcc  
x86_64                randconfig-073-20230924   gcc  
x86_64                randconfig-073-20230925   gcc  
x86_64                randconfig-074-20230922   gcc  
x86_64                randconfig-074-20230923   gcc  
x86_64                randconfig-074-20230924   gcc  
x86_64                randconfig-074-20230925   gcc  
x86_64                randconfig-075-20230922   gcc  
x86_64                randconfig-075-20230923   gcc  
x86_64                randconfig-075-20230924   gcc  
x86_64                randconfig-075-20230925   gcc  
x86_64                randconfig-076-20230922   gcc  
x86_64                randconfig-076-20230923   gcc  
x86_64                randconfig-076-20230924   gcc  
x86_64                randconfig-076-20230925   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                       common_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
