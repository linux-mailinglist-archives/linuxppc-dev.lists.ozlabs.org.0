Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A97E507E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 07:50:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JS9L6/gX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQG1Q23YLz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 17:50:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JS9L6/gX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQG0V4NtWz3bsP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Nov 2023 17:49:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699426170; x=1730962170;
  h=date:from:to:cc:subject:message-id;
  bh=saFCMyFrxq/plmpPMiZOfOfeYLuIsW6rPJkN3YKX088=;
  b=JS9L6/gX47AHvqcJD3y3glC0kFu7KCUNkXsfpoYerdvjVd9XdXIRCJxc
   nbmq5j2s+yZft/uG46KtbPRE7k5SWenBrvuaCnMVZDY7Xdo56UJrUpCxd
   DNUQ92WcMfWBFPSXAJTsP35oRxQbwkFAuSkkaFOxrqMB+wnx5UHkTj9KD
   pQ72MBZ4oNclv71WZV/cu2vEp/uVEpbauYKocoP7H1yqmO9W+hvR9mLMy
   S2W0DqRp7GzwtUAO+gIJp9yrej2ajvWCfdUjI3gUZculjB5o/IPF0qBT6
   OdGEJzJeJtrQ1NQ81MSQkNaxR1lGcjHRA4CpNhBVwz+5BgtQNBLctVJR2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456198843"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="456198843"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 22:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1010171644"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="1010171644"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2023 22:49:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0cN3-0007kK-0V;
	Wed, 08 Nov 2023 06:49:01 +0000
Date: Wed, 08 Nov 2023 14:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 644b6025bcaff59737270d812c70302f5a8d4a8f
Message-ID: <202311081457.JFCF8Faj-lkp@intel.com>
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
branch HEAD: 644b6025bcaff59737270d812c70302f5a8d4a8f  powerpc/rtas: Fix ppc_rtas_rmo_buf_show() kernel-doc

elapsed time: 1088m

configs tested: 161
configs skipped: 198

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              alldefconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20231108   gcc  
arc                   randconfig-002-20231108   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         at91_dt_defconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                       omap2plus_defconfig   gcc  
arm                   randconfig-001-20231108   gcc  
arm                   randconfig-002-20231108   gcc  
arm                   randconfig-003-20231108   gcc  
arm                   randconfig-004-20231108   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231108   gcc  
arm64                 randconfig-002-20231108   gcc  
arm64                 randconfig-003-20231108   gcc  
arm64                 randconfig-004-20231108   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231108   gcc  
csky                  randconfig-002-20231108   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231108   gcc  
i386                  randconfig-002-20231108   gcc  
i386                  randconfig-003-20231108   gcc  
i386                  randconfig-004-20231108   gcc  
i386                  randconfig-005-20231108   gcc  
i386                  randconfig-006-20231108   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231108   gcc  
loongarch             randconfig-002-20231108   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                        vocore2_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231108   gcc  
nios2                 randconfig-002-20231108   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231108   gcc  
parisc                randconfig-002-20231108   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      makalu_defconfig   gcc  
powerpc               randconfig-001-20231108   gcc  
powerpc               randconfig-002-20231108   gcc  
powerpc               randconfig-003-20231108   gcc  
powerpc64                           defconfig   gcc  
powerpc64             randconfig-001-20231108   gcc  
powerpc64             randconfig-002-20231108   gcc  
powerpc64             randconfig-003-20231108   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231108   gcc  
riscv                 randconfig-002-20231108   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231108   gcc  
s390                  randconfig-002-20231108   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                    randconfig-001-20231108   gcc  
sh                    randconfig-002-20231108   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231108   gcc  
sparc                 randconfig-002-20231108   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231108   gcc  
sparc64               randconfig-002-20231108   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231108   gcc  
um                    randconfig-002-20231108   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231108   gcc  
x86_64                randconfig-002-20231108   gcc  
x86_64                randconfig-003-20231108   gcc  
x86_64                randconfig-004-20231108   gcc  
x86_64                randconfig-005-20231108   gcc  
x86_64                randconfig-006-20231108   gcc  
x86_64                randconfig-011-20231108   gcc  
x86_64                randconfig-012-20231108   gcc  
x86_64                randconfig-013-20231108   gcc  
x86_64                randconfig-014-20231108   gcc  
x86_64                randconfig-015-20231108   gcc  
x86_64                randconfig-016-20231108   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                              defconfig   gcc  
xtensa                randconfig-001-20231108   gcc  
xtensa                randconfig-002-20231108   gcc  
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
