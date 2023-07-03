Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C78B774664A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 02:01:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkYWB1F+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qw2y45N4nz3bsx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 10:01:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mkYWB1F+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qw2wF2gdKz309V
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 09:59:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688428781; x=1719964781;
  h=date:from:to:cc:subject:message-id;
  bh=Xd47jGUeDKLnBzXICJg8+h/EfoOqPATLw2xFGxVJpXQ=;
  b=mkYWB1F+mR+1iYAtlpmfURz9r+oPNBKMQwW+Fq5Ba9pTgmdO990AqM7B
   WfnNQ9mFAMOTw5uN9SGZ2ft6w9zo9eFVsaUHqPt+dMivtVkF100cDvNhq
   zGZo/q33o3XpCQqdfG0d1epe5Zy1pCafKwOl0gfNyIm1WX4PNEheYDA3p
   wjBD1/ydA75uk90gXGUPISx5yMtYosub1t9qE9zmZjYCKi85H7qrxLbVn
   N7j26QNQNxTe4h8w9mTMSI3sS0N6Azb+Ua7btFOiIrjWQWa4TcAHtRDv3
   sqUSoFL6bzbmJJY1HI9dvbkwAdoVPZazku2eWDNR/HFeygaNvsXF5MhWq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360467728"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="360467728"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 16:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="863213565"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="863213565"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2023 16:59:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGTS2-000HiN-11;
	Mon, 03 Jul 2023 23:59:26 +0000
Date: Tue, 04 Jul 2023 07:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 039164657b85340b3318de642aa98ac2f0b99ad7
Message-ID: <202307040705.ipTZi37j-lkp@intel.com>
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
branch HEAD: 039164657b85340b3318de642aa98ac2f0b99ad7  Automatic merge of 'master' into merge (2023-07-03 13:50)

elapsed time: 721m

configs tested: 138
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r023-20230703   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230703   gcc  
arc                  randconfig-r012-20230703   gcc  
arc                  randconfig-r016-20230703   gcc  
arc                  randconfig-r035-20230703   gcc  
arc                  randconfig-r043-20230703   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                        keystone_defconfig   gcc  
arm                       multi_v4t_defconfig   gcc  
arm                  randconfig-r012-20230703   gcc  
arm                  randconfig-r026-20230703   gcc  
arm                  randconfig-r034-20230703   clang
arm                  randconfig-r046-20230703   gcc  
arm                           spitz_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230703   gcc  
arm64                randconfig-r016-20230703   clang
csky                                defconfig   gcc  
csky                 randconfig-r001-20230703   gcc  
csky                 randconfig-r004-20230703   gcc  
csky                 randconfig-r006-20230703   gcc  
csky                 randconfig-r014-20230703   gcc  
csky                 randconfig-r022-20230703   gcc  
csky                 randconfig-r025-20230703   gcc  
csky                 randconfig-r033-20230703   gcc  
hexagon              randconfig-r004-20230703   clang
hexagon              randconfig-r041-20230703   clang
hexagon              randconfig-r045-20230703   clang
i386                             allyesconfig   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230703   gcc  
i386         buildonly-randconfig-r005-20230703   gcc  
i386         buildonly-randconfig-r006-20230703   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230703   gcc  
i386                 randconfig-i002-20230703   gcc  
i386                 randconfig-i003-20230703   gcc  
i386                 randconfig-i004-20230703   gcc  
i386                 randconfig-i005-20230703   gcc  
i386                 randconfig-i006-20230703   gcc  
i386                 randconfig-i011-20230703   clang
i386                 randconfig-i012-20230703   clang
i386                 randconfig-i013-20230703   clang
i386                 randconfig-i014-20230703   clang
i386                 randconfig-i015-20230703   clang
i386                 randconfig-i016-20230703   clang
i386                 randconfig-r002-20230703   gcc  
i386                 randconfig-r024-20230703   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
m68k                 randconfig-r002-20230703   gcc  
m68k                 randconfig-r021-20230703   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r022-20230703   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                     cu1830-neo_defconfig   clang
nios2                               defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r003-20230703   gcc  
parisc               randconfig-r036-20230703   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                      pmac32_defconfig   clang
powerpc                      ppc64e_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r013-20230703   clang
riscv                randconfig-r035-20230703   gcc  
riscv                randconfig-r042-20230703   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r044-20230703   clang
sh                               allmodconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7343_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r014-20230703   gcc  
sparc64              randconfig-r015-20230703   gcc  
sparc64              randconfig-r024-20230703   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r023-20230703   gcc  
um                   randconfig-r034-20230703   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230703   gcc  
x86_64       buildonly-randconfig-r002-20230703   gcc  
x86_64       buildonly-randconfig-r003-20230703   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r003-20230703   gcc  
x86_64               randconfig-r015-20230703   clang
x86_64               randconfig-r032-20230703   gcc  
x86_64               randconfig-x001-20230703   clang
x86_64               randconfig-x002-20230703   clang
x86_64               randconfig-x003-20230703   clang
x86_64               randconfig-x004-20230703   clang
x86_64               randconfig-x005-20230703   clang
x86_64               randconfig-x006-20230703   clang
x86_64               randconfig-x011-20230703   gcc  
x86_64               randconfig-x012-20230703   gcc  
x86_64               randconfig-x013-20230703   gcc  
x86_64               randconfig-x014-20230703   gcc  
x86_64               randconfig-x015-20230703   gcc  
x86_64               randconfig-x016-20230703   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r011-20230703   gcc  
xtensa               randconfig-r013-20230703   gcc  
xtensa               randconfig-r036-20230703   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
