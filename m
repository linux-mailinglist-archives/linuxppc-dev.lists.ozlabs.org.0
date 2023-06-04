Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4004721763
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 15:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYy7C2D2nz3dwj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Jun 2023 23:21:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvTrd+3a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvTrd+3a;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYy5Q60rHz3bmP
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Jun 2023 23:19:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685884795; x=1717420795;
  h=date:from:to:cc:subject:message-id;
  bh=0Y9zgoIM77CoU8IED3UfVbOE1jhn9ICt+aFGzYIwu9c=;
  b=kvTrd+3aafFlG1O4l4RwsIaO645hM0QKNxMGSHr1blA3y92bVEUwXCTe
   yHDuROH5zyjpvwjIlVJNQruEPQq17CKnWeMUqjK9MpIrFf7QXj4YIzCX5
   Lfym5KUlUMlq52qaoxzvqOicYHZGk7Tz5b61L0Og4PCb9jx0Q9VFKSA09
   tCokZKTWKVd4IRUtoZ07X9AIS2rxQl6q1LAKdFEzM/xblv7Ws7HLNtLVS
   vkf1kwbAVeu8gmlE6KfehhIdo1Et2VWeQHY+5jue0zV3y/4js+T34PQmJ
   4owjDhJsTtrCRCPZJ+aYnOvfnrdvoBDrWb0XktHbWYd1R88Fx4BzFMPAq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="442558547"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="442558547"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 06:19:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="798124380"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="798124380"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Jun 2023 06:19:38 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5ndx-0002iz-2j;
	Sun, 04 Jun 2023 13:19:37 +0000
Date: Sun, 04 Jun 2023 21:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 bd517a8442b6c6646a136421cd4c1b95bf4ce32b
Message-ID: <20230604131858.yAwi-%lkp@intel.com>
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
branch HEAD: bd517a8442b6c6646a136421cd4c1b95bf4ce32b  Automatic merge of 'fixes' into merge (2023-06-02 23:36)

elapsed time: 741m

configs tested: 152
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r003-20230604   gcc  
alpha                randconfig-r021-20230604   gcc  
alpha                randconfig-r032-20230604   gcc  
arc                              alldefconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230604   gcc  
arc                           tb10x_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                     davinci_all_defconfig   clang
arm                                 defconfig   gcc  
arm                           h3600_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                        neponset_defconfig   clang
arm                         orion5x_defconfig   clang
arm                          pxa168_defconfig   clang
arm                  randconfig-r031-20230604   clang
arm                  randconfig-r034-20230604   clang
arm                  randconfig-r046-20230604   gcc  
arm                         s3c6400_defconfig   gcc  
arm                          sp7021_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230604   gcc  
arm64                randconfig-r025-20230604   clang
csky         buildonly-randconfig-r004-20230604   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r001-20230604   gcc  
csky                 randconfig-r032-20230604   gcc  
hexagon              randconfig-r041-20230604   clang
hexagon              randconfig-r045-20230604   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r003-20230604   gcc  
i386         buildonly-randconfig-r004-20230604   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230604   gcc  
i386                 randconfig-i002-20230604   gcc  
i386                 randconfig-i003-20230604   gcc  
i386                 randconfig-i004-20230604   gcc  
i386                 randconfig-i005-20230604   gcc  
i386                 randconfig-i006-20230604   gcc  
i386                 randconfig-i051-20230604   gcc  
i386                 randconfig-i052-20230604   gcc  
i386                 randconfig-i053-20230604   gcc  
i386                 randconfig-i054-20230604   gcc  
i386                 randconfig-i055-20230604   gcc  
i386                 randconfig-i056-20230604   gcc  
i386                 randconfig-i061-20230604   gcc  
i386                 randconfig-i062-20230604   gcc  
i386                 randconfig-i063-20230604   gcc  
i386                 randconfig-i064-20230604   gcc  
i386                 randconfig-i065-20230604   gcc  
i386                 randconfig-i066-20230604   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230604   gcc  
loongarch            randconfig-r015-20230604   gcc  
loongarch            randconfig-r033-20230604   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230604   gcc  
m68k                                defconfig   gcc  
microblaze   buildonly-randconfig-r002-20230604   gcc  
microblaze   buildonly-randconfig-r006-20230604   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                 randconfig-r002-20230604   clang
mips                 randconfig-r021-20230604   gcc  
mips                 randconfig-r024-20230604   gcc  
mips                 randconfig-r036-20230604   clang
mips                           xway_defconfig   gcc  
nios2                            alldefconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r012-20230604   gcc  
nios2                randconfig-r026-20230604   gcc  
nios2                randconfig-r034-20230604   gcc  
openrisc     buildonly-randconfig-r001-20230604   gcc  
openrisc             randconfig-r003-20230604   gcc  
openrisc             randconfig-r013-20230604   gcc  
openrisc             randconfig-r033-20230604   gcc  
openrisc             randconfig-r035-20230604   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc       buildonly-randconfig-r006-20230604   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230604   gcc  
parisc               randconfig-r005-20230604   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      katmai_defconfig   clang
powerpc                    klondike_defconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                 mpc8313_rdb_defconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                      pcm030_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc              randconfig-r022-20230604   clang
powerpc              randconfig-r023-20230604   clang
powerpc              randconfig-r031-20230604   gcc  
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
powerpc                      tqm8xx_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r001-20230604   gcc  
riscv                randconfig-r006-20230604   gcc  
riscv                randconfig-r025-20230604   clang
riscv                randconfig-r035-20230604   gcc  
riscv                randconfig-r042-20230604   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r011-20230604   clang
s390                 randconfig-r014-20230604   clang
s390                 randconfig-r022-20230604   clang
s390                 randconfig-r044-20230604   clang
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                     magicpanelr2_defconfig   gcc  
sh                   randconfig-r005-20230604   gcc  
sh                           se7619_defconfig   gcc  
sh                        sh7763rdp_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230604   gcc  
sparc                randconfig-r011-20230604   gcc  
sparc64                          alldefconfig   gcc  
sparc64              randconfig-r014-20230604   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r005-20230604   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230604   gcc  
x86_64               randconfig-a002-20230604   gcc  
x86_64               randconfig-a003-20230604   gcc  
x86_64               randconfig-a004-20230604   gcc  
x86_64               randconfig-a005-20230604   gcc  
x86_64               randconfig-a006-20230604   gcc  
x86_64               randconfig-r036-20230604   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r024-20230604   gcc  
xtensa                    xip_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
