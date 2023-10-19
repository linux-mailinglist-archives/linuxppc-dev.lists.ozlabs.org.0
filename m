Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 570FA7CF7C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 13:59:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ObxE7Uv3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SB5qJ1nvvz3vXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 22:59:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ObxE7Uv3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SB5pN0rdMz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 22:58:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697716716; x=1729252716;
  h=date:from:to:cc:subject:message-id;
  bh=FQaMkLXbnZuPeKKBbGGS+dmlpJXuUCDGXKnW7qZ18Wg=;
  b=ObxE7Uv3VWp64Ar01QQrcKxdOwe4PdXi0MB3vfyx02JtkIefudHEpirO
   rcoUxFRUzo3iDkAKUUbUcGGOSDsVpvQHkIMR1F7pdsHribSUm6lI9tcxS
   WNVlr7jq0Kk7/DnTC4yarKbUKPyqA1XIzN1PufkhH66kVj3Cbkdg0JdwI
   X0jWgcK7VfDdPd7ygQorbMAJ+5hgZFHWNyCUH23EIdLhigfw0YHBWlSJP
   tpXoNGztGD/6UvMZMyLNGf33x0VdOw80Ai1/kjd98dyPh9BnbgyIipOUI
   yYHcHH9ZqxbjJiPJPJC1LxSITHnEJhkOOo5dkkI0Vyppc/r/2r6SU8tpO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417344298"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="417344298"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 04:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930580468"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930580468"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 04:58:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtRfD-00025O-06;
	Thu, 19 Oct 2023 11:58:07 +0000
Date: Thu, 19 Oct 2023 19:57:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 f9bc9bbe8afdf83412728f0b464979a72a3b9ec2
Message-ID: <202310191947.oFjDqf39-lkp@intel.com>
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
branch HEAD: f9bc9bbe8afdf83412728f0b464979a72a3b9ec2  powerpc/qspinlock: Fix stale propagated yield_cpu

elapsed time: 1442m

configs tested: 160
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
arc                   randconfig-001-20231018   gcc  
arc                   randconfig-001-20231019   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20231019   gcc  
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
i386         buildonly-randconfig-001-20231019   gcc  
i386         buildonly-randconfig-002-20231019   gcc  
i386         buildonly-randconfig-003-20231019   gcc  
i386         buildonly-randconfig-004-20231019   gcc  
i386         buildonly-randconfig-005-20231019   gcc  
i386         buildonly-randconfig-006-20231019   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231019   gcc  
i386                  randconfig-002-20231019   gcc  
i386                  randconfig-003-20231019   gcc  
i386                  randconfig-004-20231019   gcc  
i386                  randconfig-005-20231019   gcc  
i386                  randconfig-006-20231019   gcc  
i386                  randconfig-011-20231019   gcc  
i386                  randconfig-012-20231019   gcc  
i386                  randconfig-013-20231019   gcc  
i386                  randconfig-014-20231019   gcc  
i386                  randconfig-015-20231019   gcc  
i386                  randconfig-016-20231019   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231018   gcc  
loongarch             randconfig-001-20231019   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           xway_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         alldefconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                 mpc8315_rdb_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231018   gcc  
riscv                 randconfig-001-20231019   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231018   gcc  
s390                  randconfig-001-20231019   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                           se7780_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231018   gcc  
sparc                 randconfig-001-20231019   gcc  
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
x86_64       buildonly-randconfig-001-20231019   gcc  
x86_64       buildonly-randconfig-002-20231019   gcc  
x86_64       buildonly-randconfig-003-20231019   gcc  
x86_64       buildonly-randconfig-004-20231019   gcc  
x86_64       buildonly-randconfig-005-20231019   gcc  
x86_64       buildonly-randconfig-006-20231019   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231018   gcc  
x86_64                randconfig-001-20231019   gcc  
x86_64                randconfig-002-20231018   gcc  
x86_64                randconfig-002-20231019   gcc  
x86_64                randconfig-003-20231018   gcc  
x86_64                randconfig-003-20231019   gcc  
x86_64                randconfig-004-20231018   gcc  
x86_64                randconfig-004-20231019   gcc  
x86_64                randconfig-005-20231018   gcc  
x86_64                randconfig-005-20231019   gcc  
x86_64                randconfig-006-20231018   gcc  
x86_64                randconfig-006-20231019   gcc  
x86_64                randconfig-011-20231019   gcc  
x86_64                randconfig-012-20231019   gcc  
x86_64                randconfig-013-20231019   gcc  
x86_64                randconfig-014-20231019   gcc  
x86_64                randconfig-015-20231019   gcc  
x86_64                randconfig-016-20231019   gcc  
x86_64                randconfig-071-20231019   gcc  
x86_64                randconfig-072-20231019   gcc  
x86_64                randconfig-073-20231019   gcc  
x86_64                randconfig-074-20231019   gcc  
x86_64                randconfig-075-20231019   gcc  
x86_64                randconfig-076-20231019   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                       common_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
