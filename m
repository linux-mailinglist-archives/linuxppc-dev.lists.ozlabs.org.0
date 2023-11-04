Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 555AA7E0F25
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 12:40:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OVbpvbhI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SMwdx1n9xz3cnr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Nov 2023 22:40:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OVbpvbhI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMwd15VgXz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Nov 2023 22:39:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699097974; x=1730633974;
  h=date:from:to:cc:subject:message-id;
  bh=SAZoWk2PYsq7h9I5PMCDG87F9Jp1/DqSYYmJxey3JSU=;
  b=OVbpvbhIzKC9ZiFZQj4qErGSZLfZYUfjyOLtwWggNCaAw2sL9C67/IEk
   hK9vw6fm6HrPibH8OOx2jciwsGVpxKpuW05Ho/xWey4BA8aqPoh79n+75
   1yRr4xP2p6NEIHSvqZ1WmWZu96EwRIagW7b8bgoATPoHUftwcvrIJmhl1
   gzDnTyXaiCjCLSn6sgoLn6Hr5aavKBFmswHQ6dFszT124+ZmGTnENV11G
   qZD4gO8oFhycop6C/76QPCJEIDb3utH3C/eMllF1uwBnCCPd6yviN2pI5
   b0pd3Vq9Qfv1JnUtfQWRlNwVIbq3kT5FEhvSluznnBKUU63gZ0uOTxPBw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="475313752"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="475313752"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 04:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885456240"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="885456240"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Nov 2023 04:39:08 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzEza-0004C4-06;
	Sat, 04 Nov 2023 11:39:06 +0000
Date: Sat, 04 Nov 2023 19:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 303d77a6e1707498f09c9d8ee91b1dc07ca315a5
Message-ID: <202311041914.a54UntuE-lkp@intel.com>
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
branch HEAD: 303d77a6e1707498f09c9d8ee91b1dc07ca315a5  Merge branch 'topic/ppc-kvm' into next

elapsed time: 1779m

configs tested: 223
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
arc                     haps_hs_smp_defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                   randconfig-001-20231103   gcc  
arc                   randconfig-001-20231104   gcc  
arc                   randconfig-002-20231103   gcc  
arc                   randconfig-002-20231104   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                            mps2_defconfig   gcc  
arm                           omap1_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                   randconfig-001-20231104   gcc  
arm                   randconfig-002-20231104   gcc  
arm                   randconfig-003-20231104   gcc  
arm                   randconfig-004-20231104   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231104   gcc  
arm64                 randconfig-002-20231104   gcc  
arm64                 randconfig-003-20231104   gcc  
arm64                 randconfig-004-20231104   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231103   gcc  
csky                  randconfig-001-20231104   gcc  
csky                  randconfig-002-20231103   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20231103   gcc  
i386         buildonly-randconfig-001-20231104   gcc  
i386         buildonly-randconfig-002-20231103   gcc  
i386         buildonly-randconfig-002-20231104   gcc  
i386         buildonly-randconfig-003-20231103   gcc  
i386         buildonly-randconfig-003-20231104   gcc  
i386         buildonly-randconfig-004-20231103   gcc  
i386         buildonly-randconfig-004-20231104   gcc  
i386         buildonly-randconfig-005-20231103   gcc  
i386         buildonly-randconfig-005-20231104   gcc  
i386         buildonly-randconfig-006-20231103   gcc  
i386         buildonly-randconfig-006-20231104   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231103   gcc  
i386                  randconfig-001-20231104   gcc  
i386                  randconfig-002-20231103   gcc  
i386                  randconfig-002-20231104   gcc  
i386                  randconfig-003-20231103   gcc  
i386                  randconfig-003-20231104   gcc  
i386                  randconfig-004-20231103   gcc  
i386                  randconfig-004-20231104   gcc  
i386                  randconfig-005-20231103   gcc  
i386                  randconfig-005-20231104   gcc  
i386                  randconfig-006-20231103   gcc  
i386                  randconfig-006-20231104   gcc  
i386                  randconfig-011-20231104   gcc  
i386                  randconfig-012-20231104   gcc  
i386                  randconfig-013-20231104   gcc  
i386                  randconfig-014-20231104   gcc  
i386                  randconfig-015-20231104   gcc  
i386                  randconfig-016-20231104   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231103   gcc  
loongarch             randconfig-001-20231104   gcc  
loongarch             randconfig-002-20231103   gcc  
loongarch             randconfig-002-20231104   gcc  
m68k                             alldefconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231103   gcc  
nios2                 randconfig-001-20231104   gcc  
nios2                 randconfig-002-20231103   gcc  
nios2                 randconfig-002-20231104   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231103   gcc  
parisc                randconfig-001-20231104   gcc  
parisc                randconfig-002-20231103   gcc  
parisc                randconfig-002-20231104   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc               randconfig-001-20231103   gcc  
powerpc               randconfig-001-20231104   gcc  
powerpc               randconfig-002-20231103   gcc  
powerpc               randconfig-002-20231104   gcc  
powerpc               randconfig-003-20231103   gcc  
powerpc               randconfig-003-20231104   gcc  
powerpc64             randconfig-001-20231103   gcc  
powerpc64             randconfig-001-20231104   gcc  
powerpc64             randconfig-002-20231103   gcc  
powerpc64             randconfig-002-20231104   gcc  
powerpc64             randconfig-003-20231103   gcc  
powerpc64             randconfig-003-20231104   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                 randconfig-001-20231103   gcc  
riscv                 randconfig-001-20231104   gcc  
riscv                 randconfig-002-20231103   gcc  
riscv                 randconfig-002-20231104   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231103   gcc  
s390                  randconfig-001-20231104   gcc  
s390                  randconfig-002-20231103   gcc  
s390                  randconfig-002-20231104   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                    randconfig-001-20231104   gcc  
sh                    randconfig-002-20231104   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20231104   gcc  
sparc                 randconfig-002-20231104   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231104   gcc  
sparc64               randconfig-002-20231104   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231104   gcc  
um                    randconfig-002-20231104   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20231104   gcc  
x86_64       buildonly-randconfig-002-20231104   gcc  
x86_64       buildonly-randconfig-003-20231104   gcc  
x86_64       buildonly-randconfig-004-20231104   gcc  
x86_64       buildonly-randconfig-005-20231104   gcc  
x86_64       buildonly-randconfig-006-20231104   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231104   gcc  
x86_64                randconfig-002-20231104   gcc  
x86_64                randconfig-003-20231104   gcc  
x86_64                randconfig-004-20231104   gcc  
x86_64                randconfig-005-20231104   gcc  
x86_64                randconfig-006-20231104   gcc  
x86_64                randconfig-011-20231104   gcc  
x86_64                randconfig-012-20231104   gcc  
x86_64                randconfig-013-20231104   gcc  
x86_64                randconfig-014-20231104   gcc  
x86_64                randconfig-015-20231104   gcc  
x86_64                randconfig-016-20231104   gcc  
x86_64                randconfig-071-20231104   gcc  
x86_64                randconfig-072-20231104   gcc  
x86_64                randconfig-073-20231104   gcc  
x86_64                randconfig-074-20231104   gcc  
x86_64                randconfig-075-20231104   gcc  
x86_64                randconfig-076-20231104   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231104   gcc  
xtensa                randconfig-002-20231104   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
