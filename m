Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1317C50A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 12:56:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KycqNmxb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S58pD0y5Rz3vcf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 21:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KycqNmxb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 11 Oct 2023 21:54:03 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S58lb6n43z3cTy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 21:54:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697021645; x=1728557645;
  h=date:from:to:cc:subject:message-id;
  bh=lqh0at36N/OCtpZg225pp67OlbWBhjcJkqX3298W0yM=;
  b=KycqNmxbdFhD122Y42P4/Z4TvKGZv/frXl31AwYDOpupPglhVB+kd273
   941RRwWAvrxVBdysjO1ET5JwsDkh+hoyhYDdVstA/jAOw4f0qMeG2iLHm
   To5rBjU55dvGIw79lrTvLTd6S/DIScRjv/xh+4cthoF9Rchvl890hT3kc
   Zo85zw0OUiJIHgROpqaVCQo1hY5eCbtNxc+QJa+paiV6q2ND9F9jN+R8L
   xbdqwZkD/Pb9J9tlpEvCGWwNUWiBJLQKr/hjCxeH+wgr7c9rQZ7QUQFfg
   7RZ6KVcLpHr7I3BKNJk6PfIIhaP4Ajqrr+fi4RanptJJ8PaUEVd6aiQzl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="3221878"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="3221878"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 03:52:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747404337"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="747404337"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 03:52:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqWpV-00028E-0k;
	Wed, 11 Oct 2023 10:52:41 +0000
Date: Wed, 11 Oct 2023 18:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS
 5ea0bbaa32e8f54e9a57cfee4a3b8769b80be0d2
Message-ID: <202310111800.Z267MGfc-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
branch HEAD: 5ea0bbaa32e8f54e9a57cfee4a3b8769b80be0d2  powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()

elapsed time: 1349m

configs tested: 199
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
arc                                 defconfig   gcc  
arc                   randconfig-001-20231010   gcc  
arc                   randconfig-001-20231011   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                   randconfig-001-20231011   gcc  
arm                        vexpress_defconfig   clang
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231010   gcc  
i386         buildonly-randconfig-001-20231011   gcc  
i386         buildonly-randconfig-002-20231010   gcc  
i386         buildonly-randconfig-002-20231011   gcc  
i386         buildonly-randconfig-003-20231010   gcc  
i386         buildonly-randconfig-003-20231011   gcc  
i386         buildonly-randconfig-004-20231010   gcc  
i386         buildonly-randconfig-004-20231011   gcc  
i386         buildonly-randconfig-005-20231010   gcc  
i386         buildonly-randconfig-005-20231011   gcc  
i386         buildonly-randconfig-006-20231010   gcc  
i386         buildonly-randconfig-006-20231011   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231010   gcc  
i386                  randconfig-001-20231011   gcc  
i386                  randconfig-002-20231010   gcc  
i386                  randconfig-002-20231011   gcc  
i386                  randconfig-003-20231010   gcc  
i386                  randconfig-003-20231011   gcc  
i386                  randconfig-004-20231010   gcc  
i386                  randconfig-004-20231011   gcc  
i386                  randconfig-005-20231010   gcc  
i386                  randconfig-005-20231011   gcc  
i386                  randconfig-006-20231010   gcc  
i386                  randconfig-006-20231011   gcc  
i386                  randconfig-011-20231010   gcc  
i386                  randconfig-011-20231011   gcc  
i386                  randconfig-012-20231010   gcc  
i386                  randconfig-012-20231011   gcc  
i386                  randconfig-013-20231010   gcc  
i386                  randconfig-013-20231011   gcc  
i386                  randconfig-014-20231010   gcc  
i386                  randconfig-014-20231011   gcc  
i386                  randconfig-015-20231010   gcc  
i386                  randconfig-015-20231011   gcc  
i386                  randconfig-016-20231010   gcc  
i386                  randconfig-016-20231011   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231010   gcc  
loongarch             randconfig-001-20231011   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                  cavium_octeon_defconfig   clang
mips                          malta_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   lite5200b_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc                    socrates_defconfig   clang
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231010   gcc  
riscv                 randconfig-001-20231011   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231010   gcc  
s390                  randconfig-001-20231011   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                         microdev_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231011   gcc  
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
x86_64       buildonly-randconfig-001-20231010   gcc  
x86_64       buildonly-randconfig-001-20231011   gcc  
x86_64       buildonly-randconfig-002-20231010   gcc  
x86_64       buildonly-randconfig-002-20231011   gcc  
x86_64       buildonly-randconfig-003-20231010   gcc  
x86_64       buildonly-randconfig-003-20231011   gcc  
x86_64       buildonly-randconfig-004-20231010   gcc  
x86_64       buildonly-randconfig-004-20231011   gcc  
x86_64       buildonly-randconfig-005-20231010   gcc  
x86_64       buildonly-randconfig-005-20231011   gcc  
x86_64       buildonly-randconfig-006-20231010   gcc  
x86_64       buildonly-randconfig-006-20231011   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231010   gcc  
x86_64                randconfig-001-20231011   gcc  
x86_64                randconfig-002-20231010   gcc  
x86_64                randconfig-002-20231011   gcc  
x86_64                randconfig-003-20231010   gcc  
x86_64                randconfig-003-20231011   gcc  
x86_64                randconfig-004-20231010   gcc  
x86_64                randconfig-004-20231011   gcc  
x86_64                randconfig-005-20231010   gcc  
x86_64                randconfig-005-20231011   gcc  
x86_64                randconfig-006-20231010   gcc  
x86_64                randconfig-006-20231011   gcc  
x86_64                randconfig-011-20231010   gcc  
x86_64                randconfig-011-20231011   gcc  
x86_64                randconfig-012-20231010   gcc  
x86_64                randconfig-012-20231011   gcc  
x86_64                randconfig-013-20231010   gcc  
x86_64                randconfig-013-20231011   gcc  
x86_64                randconfig-014-20231010   gcc  
x86_64                randconfig-014-20231011   gcc  
x86_64                randconfig-015-20231010   gcc  
x86_64                randconfig-015-20231011   gcc  
x86_64                randconfig-016-20231010   gcc  
x86_64                randconfig-016-20231011   gcc  
x86_64                randconfig-071-20231010   gcc  
x86_64                randconfig-071-20231011   gcc  
x86_64                randconfig-072-20231010   gcc  
x86_64                randconfig-072-20231011   gcc  
x86_64                randconfig-073-20231010   gcc  
x86_64                randconfig-073-20231011   gcc  
x86_64                randconfig-074-20231010   gcc  
x86_64                randconfig-074-20231011   gcc  
x86_64                randconfig-075-20231010   gcc  
x86_64                randconfig-075-20231011   gcc  
x86_64                randconfig-076-20231010   gcc  
x86_64                randconfig-076-20231011   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
