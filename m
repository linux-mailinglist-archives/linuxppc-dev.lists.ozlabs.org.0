Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B4A7325CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:21:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kg5la72h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj4F265PSz3bhy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:21:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kg5la72h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 16 Jun 2023 13:20:21 AEST
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4D53d63z2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:20:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686885621; x=1718421621;
  h=date:from:to:cc:subject:message-id;
  bh=iyoUPD2Tnv5/AlW5ADGWx9Duc75C7i589jO48QHCm4s=;
  b=kg5la72hnmXcJn4vvRdQ98vqqu9vJgcevybsOcRlXC+FQPwjpY4mHqBR
   jfvbNaxdNKX0U4qKFfhh2GoyK59rwKS5cOk6KHLH7z8RVt6VwpdCww1Lu
   tb8v48/83oNlil5nUDpPKmFrj00v3pSQIrFdeRhlz/OavNdd6IfyTZ4dI
   J2LqzjLTywL3yAI8oiPdS9nbcKDY5LUa8jmlBo5FTscud2vzlipmHl3RV
   VqZ1IFyB8hrgXwAFhI4ViUSUy4NRd1PddLxMSRqSvy/3KkstD4Y1zg0sK
   KAZErnvx7dFPRZEsYs9vYOyjwRSuIcyyPDQz2sIOhD9XrMf6qwwF8N3jV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445484724"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="445484724"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 20:19:07 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="745966756"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="745966756"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2023 20:19:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9zzN-0000kV-14;
	Fri, 16 Jun 2023 03:19:05 +0000
Date: Fri, 16 Jun 2023 11:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 4adc95a3edc152ffc3b0c88117767a31c9c01a1e
Message-ID: <202306161155.jEIHSxS8-lkp@intel.com>
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
branch HEAD: 4adc95a3edc152ffc3b0c88117767a31c9c01a1e  powerpc: update ppc_save_regs to save current r1 in pt_regs

elapsed time: 726m

configs tested: 179
configs skipped: 13

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r004-20230615   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230615   gcc  
alpha                randconfig-r011-20230614   gcc  
alpha                randconfig-r013-20230614   gcc  
alpha                randconfig-r025-20230615   gcc  
alpha                randconfig-r026-20230615   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r003-20230615   gcc  
arc                  randconfig-r034-20230615   gcc  
arc                  randconfig-r043-20230614   gcc  
arc                  randconfig-r043-20230615   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                      footbridge_defconfig   gcc  
arm                  randconfig-r046-20230614   clang
arm                  randconfig-r046-20230615   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r033-20230615   gcc  
arm64                randconfig-r036-20230615   gcc  
csky         buildonly-randconfig-r003-20230614   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r003-20230615   gcc  
csky                 randconfig-r034-20230615   gcc  
hexagon              randconfig-r015-20230614   clang
hexagon              randconfig-r025-20230615   clang
hexagon              randconfig-r035-20230615   clang
hexagon              randconfig-r041-20230614   clang
hexagon              randconfig-r041-20230615   clang
hexagon              randconfig-r045-20230614   clang
hexagon              randconfig-r045-20230615   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230614   clang
i386                 randconfig-i001-20230615   gcc  
i386                 randconfig-i002-20230614   clang
i386                 randconfig-i002-20230615   gcc  
i386                 randconfig-i003-20230614   clang
i386                 randconfig-i003-20230615   gcc  
i386                 randconfig-i004-20230614   clang
i386                 randconfig-i004-20230615   gcc  
i386                 randconfig-i005-20230614   clang
i386                 randconfig-i005-20230615   gcc  
i386                 randconfig-i006-20230614   clang
i386                 randconfig-i006-20230615   gcc  
i386                 randconfig-i011-20230614   gcc  
i386                 randconfig-i011-20230615   clang
i386                 randconfig-i012-20230614   gcc  
i386                 randconfig-i012-20230615   clang
i386                 randconfig-i013-20230614   gcc  
i386                 randconfig-i013-20230615   clang
i386                 randconfig-i014-20230614   gcc  
i386                 randconfig-i014-20230615   clang
i386                 randconfig-i015-20230614   gcc  
i386                 randconfig-i015-20230615   clang
i386                 randconfig-i016-20230614   gcc  
i386                 randconfig-i016-20230615   clang
i386                 randconfig-r014-20230614   gcc  
i386                 randconfig-r021-20230615   clang
i386                 randconfig-r032-20230615   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r005-20230614   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r004-20230615   gcc  
loongarch            randconfig-r024-20230615   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r002-20230615   gcc  
m68k                 randconfig-r013-20230614   gcc  
m68k                 randconfig-r023-20230615   gcc  
m68k                 randconfig-r033-20230615   gcc  
microblaze   buildonly-randconfig-r002-20230614   gcc  
microblaze           randconfig-r005-20230615   gcc  
microblaze           randconfig-r023-20230615   gcc  
microblaze           randconfig-r025-20230615   gcc  
microblaze           randconfig-r033-20230615   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           jazz_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                 randconfig-r022-20230615   gcc  
mips                 randconfig-r024-20230615   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230615   gcc  
nios2                randconfig-r016-20230614   gcc  
openrisc     buildonly-randconfig-r001-20230614   gcc  
openrisc     buildonly-randconfig-r006-20230614   gcc  
openrisc             randconfig-r012-20230614   gcc  
openrisc             randconfig-r026-20230615   gcc  
openrisc             randconfig-r032-20230615   gcc  
parisc                           allyesconfig   gcc  
parisc       buildonly-randconfig-r004-20230614   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r036-20230615   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r001-20230614   gcc  
powerpc      buildonly-randconfig-r005-20230614   gcc  
powerpc                     kilauea_defconfig   clang
powerpc              randconfig-r011-20230614   gcc  
powerpc              randconfig-r021-20230615   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r005-20230615   gcc  
riscv                randconfig-r042-20230614   gcc  
riscv                randconfig-r042-20230615   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230615   gcc  
s390                 randconfig-r014-20230614   gcc  
s390                 randconfig-r044-20230614   gcc  
s390                 randconfig-r044-20230615   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230615   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                   randconfig-r016-20230614   gcc  
sh                   randconfig-r024-20230615   gcc  
sh                   randconfig-r031-20230615   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc        buildonly-randconfig-r003-20230615   gcc  
sparc                               defconfig   gcc  
sparc64      buildonly-randconfig-r005-20230615   gcc  
sparc64              randconfig-r006-20230615   gcc  
sparc64              randconfig-r021-20230615   gcc  
sparc64              randconfig-r032-20230615   gcc  
um                               alldefconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230614   clang
x86_64               randconfig-a001-20230615   gcc  
x86_64               randconfig-a002-20230614   clang
x86_64               randconfig-a002-20230615   gcc  
x86_64               randconfig-a003-20230614   clang
x86_64               randconfig-a003-20230615   gcc  
x86_64               randconfig-a004-20230614   clang
x86_64               randconfig-a004-20230615   gcc  
x86_64               randconfig-a005-20230614   clang
x86_64               randconfig-a005-20230615   gcc  
x86_64               randconfig-a006-20230614   clang
x86_64               randconfig-a006-20230615   gcc  
x86_64               randconfig-a011-20230614   gcc  
x86_64               randconfig-a011-20230615   clang
x86_64               randconfig-a012-20230614   gcc  
x86_64               randconfig-a012-20230615   clang
x86_64               randconfig-a013-20230614   gcc  
x86_64               randconfig-a013-20230615   clang
x86_64               randconfig-a014-20230614   gcc  
x86_64               randconfig-a014-20230615   clang
x86_64               randconfig-a015-20230614   gcc  
x86_64               randconfig-a015-20230615   clang
x86_64               randconfig-a016-20230614   gcc  
x86_64               randconfig-a016-20230615   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r004-20230614   gcc  
xtensa               randconfig-r015-20230614   gcc  
xtensa               randconfig-r022-20230615   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
