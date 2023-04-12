Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A46DE900
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 03:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px50F5T8Sz3cht
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 11:36:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKnC/EuX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oKnC/EuX;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px4zM66Q2z3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 11:35:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681263344; x=1712799344;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=laBUDDZsMDfZEGXpo9bheNVcGhWlPKfvMD25W/CBces=;
  b=oKnC/EuXuEM17F7Mc1ze6lqu/TKN4PNsTfFVdmt8HuTc9JahF9/Nx8hU
   CuaKRKu0DOdWYxjXguU78GctkQHyMsqA+QoYRDR3e4QwaC6gZpfe28NdH
   fXMwNOzFima6JaWqTsDBUAsTdtmRpudBglE1C+od4qxwoEYuKY268ZlYr
   /3vnqem6UuuFbq/ncymbh6VGiEWONjmId+fWtTtRo7W/YqcRNx5QjiJjP
   8VG/7CxH9HkXVjN8K3JJ6g0SKeaERjzt/TZZoDPPiI2J1BKWl4WlCRX0Z
   9mVXWcHZsaU071FzlNArqn26i8dNxiM4Gu8wNV1dcxuXVE2H3PGX90t0I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="430062906"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="430062906"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 18:35:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="719184740"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="719184740"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Apr 2023 18:35:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmPOc-000WwM-0i;
	Wed, 12 Apr 2023 01:35:38 +0000
Date: Wed, 12 Apr 2023 09:35:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 8002725b9e3369ce8616d32dc2e7a57870475142
Message-ID: <64360ae4.fST1Jt8XwMrbeNxi%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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
branch HEAD: 8002725b9e3369ce8616d32dc2e7a57870475142  powerpc/32: Include thread_info.h in head_booke.h

elapsed time: 726m

configs tested: 171
configs skipped: 20

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r006-20230410   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arc                  randconfig-r043-20230411   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230409   clang
arm                                 defconfig   gcc  
arm                           omap1_defconfig   clang
arm                  randconfig-r026-20230409   clang
arm                  randconfig-r033-20230410   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm                  randconfig-r046-20230411   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r004-20230410   clang
arm64                randconfig-r015-20230409   gcc  
arm64                randconfig-r031-20230409   clang
arm64                randconfig-r031-20230410   clang
csky         buildonly-randconfig-r001-20230409   gcc  
csky         buildonly-randconfig-r004-20230411   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r012-20230411   clang
hexagon              randconfig-r025-20230411   clang
hexagon              randconfig-r026-20230411   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r041-20230411   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
hexagon              randconfig-r045-20230411   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                 randconfig-a011-20230410   gcc  
i386                 randconfig-a012-20230410   gcc  
i386                 randconfig-a013-20230410   gcc  
i386                 randconfig-a014-20230410   gcc  
i386                 randconfig-a015-20230410   gcc  
i386                 randconfig-a016-20230410   gcc  
i386                 randconfig-r006-20230410   clang
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r003-20230410   gcc  
ia64         buildonly-randconfig-r006-20230411   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r016-20230410   gcc  
ia64                 randconfig-r016-20230411   gcc  
ia64                 randconfig-r031-20230411   gcc  
ia64                 randconfig-r036-20230410   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230410   gcc  
loongarch    buildonly-randconfig-r002-20230410   gcc  
loongarch    buildonly-randconfig-r004-20230409   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r011-20230410   gcc  
loongarch            randconfig-r015-20230411   gcc  
loongarch            randconfig-r023-20230411   gcc  
loongarch            randconfig-r033-20230411   gcc  
loongarch            randconfig-r035-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r002-20230409   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r015-20230410   gcc  
m68k                 randconfig-r021-20230410   gcc  
m68k                 randconfig-r024-20230409   gcc  
microblaze   buildonly-randconfig-r003-20230411   gcc  
microblaze   buildonly-randconfig-r006-20230409   gcc  
microblaze           randconfig-r023-20230410   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips         buildonly-randconfig-r001-20230409   gcc  
mips         buildonly-randconfig-r001-20230410   gcc  
mips         buildonly-randconfig-r002-20230409   gcc  
mips                     cu1830-neo_defconfig   clang
mips                      loongson3_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                 randconfig-r012-20230410   clang
mips                 randconfig-r023-20230409   clang
mips                 randconfig-r025-20230409   clang
mips                 randconfig-r026-20230410   clang
nios2        buildonly-randconfig-r002-20230410   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230409   gcc  
nios2                randconfig-r022-20230411   gcc  
openrisc     buildonly-randconfig-r002-20230411   gcc  
openrisc             randconfig-r024-20230410   gcc  
openrisc             randconfig-r032-20230411   gcc  
openrisc             randconfig-r034-20230411   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r013-20230411   gcc  
parisc               randconfig-r016-20230409   gcc  
parisc64                            defconfig   gcc  
powerpc                      acadia_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                mpc7448_hpc2_defconfig   gcc  
powerpc              randconfig-r001-20230410   clang
powerpc              randconfig-r014-20230410   gcc  
powerpc              randconfig-r026-20230410   gcc  
powerpc              randconfig-r032-20230409   clang
powerpc              randconfig-r035-20230409   clang
powerpc              randconfig-r036-20230411   gcc  
powerpc                      walnut_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r012-20230409   gcc  
riscv                randconfig-r034-20230410   clang
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                randconfig-r042-20230411   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r003-20230409   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
s390                 randconfig-r044-20230411   clang
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r005-20230411   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r013-20230410   gcc  
sh                   randconfig-r014-20230409   gcc  
sh                   randconfig-r032-20230410   gcc  
sparc        buildonly-randconfig-r003-20230409   gcc  
sparc        buildonly-randconfig-r004-20230410   gcc  
sparc        buildonly-randconfig-r005-20230409   gcc  
sparc        buildonly-randconfig-r006-20230410   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r012-20230410   gcc  
sparc                randconfig-r021-20230411   gcc  
sparc                randconfig-r035-20230411   gcc  
sparc64      buildonly-randconfig-r005-20230410   gcc  
sparc64              randconfig-r022-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                        randconfig-k001   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r001-20230411   gcc  
xtensa       buildonly-randconfig-r006-20230409   gcc  
xtensa               randconfig-r011-20230409   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
