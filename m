Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 661D8720DC7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jun 2023 06:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QY6KG08Bfz3f02
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jun 2023 14:27:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UO48kVuZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UO48kVuZ;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QY6JQ0KxQz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jun 2023 14:26:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685766390; x=1717302390;
  h=date:from:to:cc:subject:message-id;
  bh=6AYHhbfGZTJIsQT6DfQUWNxf8bhsO+x92t6yn5qzCCU=;
  b=UO48kVuZhePaoa9n6KKifx6sF6dN0VlJUHvSHgjOBbB/HbFC50oH6ZtX
   5ltSXxH/UTpvePs/h0N9+dRiVjMiydzGA4EVS3JTOkundZxLDU6dSpeoV
   9g3bsDadVD8K/gYPXbwk/J8X1iTu3vhxcUaqV7qvCzAViugb5OfPm5o89
   6HJ2uaZlPtv1SC/Y61t13MTcx6rXokKQSsHB0HoOlCgmo22ChThwwt8Dq
   ETdKq1MAdzVOLoRmzMsXtNe0WYKLSrnYsoE8WeJ2B/Rajsmef6s9L09CI
   gyDxjiePeZNbApApmxUw51V7MYMKuTUwB6bgmOJgJrp1uVOBrZEU0hA64
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359339620"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="359339620"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 21:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773118623"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="773118623"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 21:26:17 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5IqG-0001HN-0x;
	Sat, 03 Jun 2023 04:26:16 +0000
Date: Sat, 03 Jun 2023 12:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/cpu-smt] BUILD SUCCESS
 940e915fcbf3494e794335eaab2ce793b75a3c1d
Message-ID: <20230603042529.wsXu_%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/cpu-smt
branch HEAD: 940e915fcbf3494e794335eaab2ce793b75a3c1d  powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs

elapsed time: 798m

configs tested: 277
configs skipped: 23

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r001-20230531   gcc  
alpha        buildonly-randconfig-r005-20230531   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230531   gcc  
alpha                randconfig-r002-20230531   gcc  
alpha                randconfig-r004-20230531   gcc  
alpha                randconfig-r013-20230531   gcc  
alpha                randconfig-r015-20230601   gcc  
alpha                randconfig-r021-20230531   gcc  
alpha                randconfig-r024-20230531   gcc  
alpha                randconfig-r025-20230531   gcc  
alpha                randconfig-r031-20230531   gcc  
alpha                randconfig-r033-20230602   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r005-20230531   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r003-20230531   gcc  
arc                  randconfig-r015-20230601   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                            mmp2_defconfig   clang
arm                        multi_v5_defconfig   clang
arm                             mxs_defconfig   clang
arm                  randconfig-r022-20230531   gcc  
arm                  randconfig-r024-20230531   gcc  
arm                             rpc_defconfig   gcc  
arm                           sama7_defconfig   clang
arm                           spitz_defconfig   clang
arm                           sunxi_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230531   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230602   gcc  
arm64                randconfig-r012-20230602   clang
arm64                randconfig-r026-20230531   clang
arm64                randconfig-r031-20230531   gcc  
arm64                randconfig-r031-20230602   gcc  
arm64                randconfig-r034-20230602   gcc  
arm64                randconfig-r036-20230602   gcc  
csky         buildonly-randconfig-r002-20230531   gcc  
csky         buildonly-randconfig-r003-20230531   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r005-20230531   gcc  
csky                 randconfig-r006-20230602   gcc  
csky                 randconfig-r012-20230601   gcc  
csky                 randconfig-r023-20230531   gcc  
csky                 randconfig-r035-20230531   gcc  
csky                 randconfig-r035-20230602   gcc  
hexagon              randconfig-r026-20230531   clang
hexagon              randconfig-r031-20230531   clang
hexagon              randconfig-r036-20230531   clang
hexagon              randconfig-r041-20230531   clang
hexagon              randconfig-r045-20230531   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r001-20230531   gcc  
i386         buildonly-randconfig-r001-20230602   gcc  
i386         buildonly-randconfig-r002-20230531   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230531   gcc  
i386                 randconfig-i001-20230602   gcc  
i386                 randconfig-i002-20230531   gcc  
i386                 randconfig-i002-20230602   gcc  
i386                 randconfig-i003-20230531   gcc  
i386                 randconfig-i003-20230602   gcc  
i386                 randconfig-i004-20230531   gcc  
i386                 randconfig-i004-20230602   gcc  
i386                 randconfig-i005-20230531   gcc  
i386                 randconfig-i005-20230602   gcc  
i386                 randconfig-i006-20230531   gcc  
i386                 randconfig-i006-20230602   gcc  
i386                 randconfig-i051-20230531   gcc  
i386                 randconfig-i051-20230602   gcc  
i386                 randconfig-i052-20230531   gcc  
i386                 randconfig-i052-20230602   gcc  
i386                 randconfig-i053-20230531   gcc  
i386                 randconfig-i053-20230602   gcc  
i386                 randconfig-i054-20230531   gcc  
i386                 randconfig-i054-20230602   gcc  
i386                 randconfig-i055-20230531   gcc  
i386                 randconfig-i055-20230602   gcc  
i386                 randconfig-i056-20230531   gcc  
i386                 randconfig-i056-20230602   gcc  
i386                 randconfig-i061-20230531   gcc  
i386                 randconfig-i061-20230602   gcc  
i386                 randconfig-i062-20230531   gcc  
i386                 randconfig-i062-20230602   gcc  
i386                 randconfig-i063-20230531   gcc  
i386                 randconfig-i063-20230602   gcc  
i386                 randconfig-i064-20230531   gcc  
i386                 randconfig-i064-20230602   gcc  
i386                 randconfig-i065-20230531   gcc  
i386                 randconfig-i065-20230602   gcc  
i386                 randconfig-i066-20230531   gcc  
i386                 randconfig-i066-20230602   gcc  
i386                 randconfig-r003-20230531   gcc  
i386                 randconfig-r006-20230531   gcc  
i386                 randconfig-r012-20230601   gcc  
i386                 randconfig-r035-20230531   gcc  
i386                 randconfig-r035-20230602   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r004-20230531   gcc  
loongarch    buildonly-randconfig-r006-20230602   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230531   gcc  
loongarch            randconfig-r005-20230602   gcc  
loongarch            randconfig-r011-20230601   gcc  
loongarch            randconfig-r016-20230601   gcc  
loongarch            randconfig-r021-20230531   gcc  
loongarch            randconfig-r033-20230602   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                          atari_defconfig   gcc  
m68k         buildonly-randconfig-r004-20230531   gcc  
m68k         buildonly-randconfig-r006-20230531   gcc  
m68k                                defconfig   gcc  
m68k                       m5249evb_defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r002-20230531   gcc  
m68k                 randconfig-r016-20230601   gcc  
m68k                 randconfig-r021-20230531   gcc  
m68k                 randconfig-r023-20230531   gcc  
m68k                 randconfig-r031-20230531   gcc  
m68k                 randconfig-r034-20230531   gcc  
m68k                 randconfig-r034-20230602   gcc  
m68k                 randconfig-r036-20230531   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r013-20230601   gcc  
microblaze           randconfig-r014-20230601   gcc  
microblaze           randconfig-r015-20230531   gcc  
microblaze           randconfig-r021-20230531   gcc  
microblaze           randconfig-r022-20230531   gcc  
microblaze           randconfig-r025-20230531   gcc  
microblaze           randconfig-r031-20230602   gcc  
microblaze           randconfig-r032-20230531   gcc  
microblaze           randconfig-r036-20230602   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath79_defconfig   clang
mips                           ci20_defconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                        maltaup_defconfig   clang
mips                          rb532_defconfig   gcc  
mips                          rm200_defconfig   clang
nios2                         3c120_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2        buildonly-randconfig-r002-20230531   gcc  
nios2        buildonly-randconfig-r004-20230531   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230531   gcc  
nios2                randconfig-r012-20230531   gcc  
nios2                randconfig-r012-20230601   gcc  
nios2                randconfig-r024-20230531   gcc  
openrisc     buildonly-randconfig-r003-20230531   gcc  
openrisc             randconfig-r002-20230602   gcc  
openrisc             randconfig-r011-20230601   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230531   gcc  
parisc               randconfig-r016-20230531   gcc  
parisc               randconfig-r026-20230531   gcc  
parisc               randconfig-r032-20230531   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      chrp32_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                        icon_defconfig   clang
powerpc                      mgcoge_defconfig   gcc  
powerpc                   motionpro_defconfig   gcc  
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                      ppc44x_defconfig   clang
powerpc              randconfig-r002-20230602   gcc  
powerpc              randconfig-r006-20230531   gcc  
powerpc              randconfig-r011-20230601   gcc  
powerpc              randconfig-r024-20230531   clang
powerpc              randconfig-r032-20230602   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                     tqm8560_defconfig   clang
powerpc                        warp_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r033-20230531   gcc  
riscv                randconfig-r034-20230531   gcc  
riscv                randconfig-r034-20230602   gcc  
riscv                randconfig-r036-20230531   gcc  
riscv                randconfig-r042-20230531   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r004-20230531   gcc  
s390                 randconfig-r011-20230601   gcc  
s390                 randconfig-r016-20230602   clang
s390                 randconfig-r033-20230531   gcc  
s390                 randconfig-r044-20230531   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230531   gcc  
sh                            hp6xx_defconfig   gcc  
sh                   randconfig-r003-20230531   gcc  
sh                   randconfig-r004-20230602   gcc  
sh                   randconfig-r005-20230602   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7721_defconfig   gcc  
sh                           se7722_defconfig   gcc  
sh                             sh03_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc        buildonly-randconfig-r002-20230531   gcc  
sparc        buildonly-randconfig-r002-20230602   gcc  
sparc        buildonly-randconfig-r006-20230531   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230602   gcc  
sparc                randconfig-r013-20230601   gcc  
sparc                randconfig-r015-20230601   gcc  
sparc                randconfig-r016-20230601   gcc  
sparc                randconfig-r022-20230531   gcc  
sparc                randconfig-r023-20230531   gcc  
sparc                randconfig-r035-20230602   gcc  
sparc64      buildonly-randconfig-r002-20230531   gcc  
sparc64      buildonly-randconfig-r004-20230531   gcc  
sparc64              randconfig-r002-20230531   gcc  
sparc64              randconfig-r013-20230601   gcc  
sparc64              randconfig-r022-20230531   gcc  
sparc64              randconfig-r025-20230531   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r003-20230531   gcc  
x86_64       buildonly-randconfig-r005-20230602   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230531   gcc  
x86_64               randconfig-a002-20230531   gcc  
x86_64               randconfig-a003-20230531   gcc  
x86_64               randconfig-a004-20230531   gcc  
x86_64               randconfig-a005-20230531   gcc  
x86_64               randconfig-a006-20230531   gcc  
x86_64               randconfig-a011-20230603   gcc  
x86_64               randconfig-a012-20230603   gcc  
x86_64               randconfig-a013-20230603   gcc  
x86_64               randconfig-a014-20230603   gcc  
x86_64               randconfig-a015-20230603   gcc  
x86_64               randconfig-a016-20230603   gcc  
x86_64               randconfig-r004-20230531   gcc  
x86_64               randconfig-r006-20230531   gcc  
x86_64               randconfig-r032-20230602   gcc  
x86_64               randconfig-x051-20230603   gcc  
x86_64               randconfig-x052-20230603   gcc  
x86_64               randconfig-x053-20230603   gcc  
x86_64               randconfig-x054-20230603   gcc  
x86_64               randconfig-x055-20230603   gcc  
x86_64               randconfig-x056-20230603   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r001-20230531   gcc  
xtensa               randconfig-r033-20230602   gcc  
xtensa               randconfig-r036-20230531   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
