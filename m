Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABE5790841
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 16:23:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k6JnvEPb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RdHF40dKRz3cBJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Sep 2023 00:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k6JnvEPb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RdHD92rlXz2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Sep 2023 00:22:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693664553; x=1725200553;
  h=date:from:to:cc:subject:message-id;
  bh=FCyN1yKBYg1042CtZp0/mfwQpflCz0OA2dFnZqAi/lM=;
  b=k6JnvEPbO9/zwc/DGZ0WiJj4NvwshXcMjPQuWJI0l1eyP2LOW/J2utYa
   gzZEVJNJxmLGPTovVdwsKhIgnkkMAqdUGdqAQWSpUiUmqGBEllgq29MTi
   DSebp7BbSdAUdnGs/6D6uXLIgLlIFWj6cR8mmHWIWEpW1XoR57dYzg1CJ
   hJrfWtO1bA94Z5HhFYz3+8FaUS6oxdH79bfWAXR7HTVYbPG5TKAMnsHQh
   fapLBFxzkQWIGEGdI9sHlclgFMySgv7wPpCoCLR6ffjSxRvTk4OMzLx8n
   pJ5fhLlBQFfITKZv9TsmFiIgqsyCm354ciY6sDpmXyTMprQT87+PJqv0l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="442774339"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="442774339"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 07:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="883525897"
X-IronPort-AV: E=Sophos;i="6.02,222,1688454000"; 
   d="scan'208";a="883525897"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Sep 2023 07:22:22 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcRW0-0002OY-1M;
	Sat, 02 Sep 2023 14:22:20 +0000
Date: Sat, 02 Sep 2023 22:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 0ad6bbfc7dab179bb3de79190140acec2862934d
Message-ID: <202309022210.7zaUfhjp-lkp@intel.com>
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
branch HEAD: 0ad6bbfc7dab179bb3de79190140acec2862934d  Automatic merge of 'master' into merge (2023-09-02 11:25)

elapsed time: 737m

configs tested: 211
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230902   gcc  
alpha                randconfig-r015-20230902   gcc  
alpha                randconfig-r032-20230902   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                     haps_hs_smp_defconfig   gcc  
arc                   randconfig-001-20230902   gcc  
arc                  randconfig-r002-20230902   gcc  
arc                  randconfig-r012-20230902   gcc  
arc                  randconfig-r023-20230902   gcc  
arc                  randconfig-r031-20230902   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                                 defconfig   gcc  
arm                      jornada720_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                        multi_v7_defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                   randconfig-001-20230902   gcc  
arm                  randconfig-r015-20230902   gcc  
arm                  randconfig-r021-20230902   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r025-20230902   clang
arm64                randconfig-r031-20230902   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r004-20230902   gcc  
csky                 randconfig-r006-20230902   gcc  
csky                 randconfig-r014-20230902   gcc  
hexagon               randconfig-001-20230902   clang
hexagon               randconfig-002-20230902   clang
hexagon              randconfig-r024-20230902   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230902   gcc  
i386         buildonly-randconfig-002-20230902   gcc  
i386         buildonly-randconfig-003-20230902   gcc  
i386         buildonly-randconfig-004-20230902   gcc  
i386         buildonly-randconfig-005-20230902   gcc  
i386         buildonly-randconfig-006-20230902   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230902   gcc  
i386                  randconfig-002-20230902   gcc  
i386                  randconfig-003-20230902   gcc  
i386                  randconfig-004-20230902   gcc  
i386                  randconfig-005-20230902   gcc  
i386                  randconfig-006-20230902   gcc  
i386                  randconfig-011-20230902   clang
i386                  randconfig-012-20230902   clang
i386                  randconfig-013-20230902   clang
i386                  randconfig-014-20230902   clang
i386                  randconfig-015-20230902   clang
i386                  randconfig-016-20230902   clang
i386                 randconfig-r026-20230902   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230902   gcc  
loongarch            randconfig-r001-20230902   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5475evb_defconfig   gcc  
m68k                 randconfig-r011-20230902   gcc  
m68k                 randconfig-r024-20230902   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r014-20230902   gcc  
microblaze           randconfig-r016-20230902   gcc  
microblaze           randconfig-r035-20230902   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                 randconfig-r011-20230902   gcc  
mips                 randconfig-r013-20230902   gcc  
mips                 randconfig-r033-20230902   clang
mips                 randconfig-r036-20230902   clang
mips                           rs90_defconfig   clang
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r003-20230902   gcc  
openrisc             randconfig-r022-20230902   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r026-20230902   gcc  
parisc64                            defconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc              randconfig-r013-20230902   clang
powerpc              randconfig-r035-20230902   gcc  
powerpc                     skiroot_defconfig   clang
powerpc64            randconfig-r012-20230902   clang
powerpc64            randconfig-r021-20230902   clang
powerpc64            randconfig-r034-20230902   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_virt_defconfig   clang
riscv                 randconfig-001-20230902   gcc  
riscv                randconfig-r001-20230902   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230902   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                            migor_defconfig   gcc  
sh                   randconfig-r004-20230902   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230902   gcc  
sparc                randconfig-r033-20230902   gcc  
sparc                randconfig-r036-20230902   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r002-20230902   gcc  
sparc64              randconfig-r005-20230902   gcc  
sparc64              randconfig-r023-20230902   gcc  
sparc64              randconfig-r025-20230902   gcc  
sparc64              randconfig-r034-20230902   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r005-20230902   clang
um                   randconfig-r006-20230902   clang
um                   randconfig-r016-20230902   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230902   gcc  
x86_64       buildonly-randconfig-002-20230902   gcc  
x86_64       buildonly-randconfig-003-20230902   gcc  
x86_64       buildonly-randconfig-004-20230902   gcc  
x86_64       buildonly-randconfig-005-20230902   gcc  
x86_64       buildonly-randconfig-006-20230902   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230902   clang
x86_64                randconfig-002-20230902   clang
x86_64                randconfig-003-20230902   clang
x86_64                randconfig-004-20230902   clang
x86_64                randconfig-005-20230902   clang
x86_64                randconfig-006-20230902   clang
x86_64                randconfig-011-20230902   gcc  
x86_64                randconfig-012-20230902   gcc  
x86_64                randconfig-013-20230902   gcc  
x86_64                randconfig-014-20230902   gcc  
x86_64                randconfig-015-20230902   gcc  
x86_64                randconfig-016-20230902   gcc  
x86_64                randconfig-071-20230902   gcc  
x86_64                randconfig-072-20230902   gcc  
x86_64                randconfig-073-20230902   gcc  
x86_64                randconfig-074-20230902   gcc  
x86_64                randconfig-075-20230902   gcc  
x86_64                randconfig-076-20230902   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa               randconfig-r032-20230902   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
