Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50E76DF63
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 06:23:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m9xdke+x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGbM762hFz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 14:23:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m9xdke+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGbLF2CpSz2ykV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 14:22:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691036581; x=1722572581;
  h=date:from:to:cc:subject:message-id;
  bh=FpmWdbWfqSIP1I4W4Wb3EQ45LdpEt0fgMoiGVNGCKSw=;
  b=m9xdke+xPvJmfADV5teS1/Za4tGwVeYi6FtbCqBQsUXMv7/hO2vaDHe0
   R1n4VsF6tBQlIsNxPK+BH8k7xVYuimFeiqyxwawxZDKyrOSPZvks6V9oi
   rPQeo05+ce2FxSkCiIXMppdss+2swhl72zfdOvjexJ3DNBR12fXNEMx9V
   LJGCVQGqPeqSm7vtI3gIyxpFTcl12PWOn5tDbwSlwgyrmO3l16fqM63yc
   bMggRXD30CO6UxXqkh78VSi+QfQjsEs2lZTnNfBO9b1+pZpzZACOVKLxk
   CCxt6SLpbRoCWT6Tea7brRCyMTpOYiQtC1B/01sT1SA9y70K4sVha5aM/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="350057515"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="350057515"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 21:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="794846454"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="794846454"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Aug 2023 21:22:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRPrR-0001kL-00;
	Thu, 03 Aug 2023 04:22:53 +0000
Date: Thu, 03 Aug 2023 12:21:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/cpu-smt] BUILD SUCCESS
 d1099e2276df1d8dd4037552c2f34eb4c4df4a75
Message-ID: <202308031258.MVu6eB37-lkp@intel.com>
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
branch HEAD: d1099e2276df1d8dd4037552c2f34eb4c4df4a75  powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs

elapsed time: 836m

configs tested: 166
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230731   gcc  
alpha                randconfig-r026-20230731   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r033-20230731   gcc  
arc                  randconfig-r043-20230731   gcc  
arc                  randconfig-r043-20230802   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                          pxa3xx_defconfig   gcc  
arm                  randconfig-r024-20230731   gcc  
arm                  randconfig-r032-20230801   clang
arm                  randconfig-r046-20230731   gcc  
arm                        realview_defconfig   gcc  
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r014-20230731   clang
arm64                randconfig-r036-20230731   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230801   gcc  
csky                 randconfig-r034-20230801   gcc  
hexagon              randconfig-r004-20230801   clang
hexagon              randconfig-r012-20230731   clang
hexagon              randconfig-r015-20230731   clang
hexagon              randconfig-r041-20230731   clang
hexagon              randconfig-r045-20230731   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230731   gcc  
i386         buildonly-randconfig-r004-20230801   gcc  
i386         buildonly-randconfig-r005-20230731   gcc  
i386         buildonly-randconfig-r005-20230801   gcc  
i386         buildonly-randconfig-r006-20230731   gcc  
i386         buildonly-randconfig-r006-20230801   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230731   gcc  
i386                 randconfig-i001-20230802   clang
i386                 randconfig-i002-20230731   gcc  
i386                 randconfig-i002-20230802   clang
i386                 randconfig-i003-20230731   gcc  
i386                 randconfig-i003-20230802   clang
i386                 randconfig-i004-20230731   gcc  
i386                 randconfig-i004-20230802   clang
i386                 randconfig-i005-20230731   gcc  
i386                 randconfig-i005-20230802   clang
i386                 randconfig-i006-20230731   gcc  
i386                 randconfig-i006-20230802   clang
i386                 randconfig-i011-20230801   clang
i386                 randconfig-i011-20230802   gcc  
i386                 randconfig-i012-20230801   clang
i386                 randconfig-i012-20230802   gcc  
i386                 randconfig-i013-20230801   clang
i386                 randconfig-i013-20230802   gcc  
i386                 randconfig-i014-20230801   clang
i386                 randconfig-i014-20230802   gcc  
i386                 randconfig-i015-20230801   clang
i386                 randconfig-i015-20230802   gcc  
i386                 randconfig-i016-20230801   clang
i386                 randconfig-i016-20230802   gcc  
i386                 randconfig-r014-20230731   clang
i386                 randconfig-r025-20230731   clang
i386                 randconfig-r033-20230801   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r002-20230801   gcc  
microblaze           randconfig-r005-20230801   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                 randconfig-r005-20230801   clang
mips                          rb532_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230731   gcc  
nios2                randconfig-r021-20230731   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r003-20230801   gcc  
powerpc              randconfig-r022-20230731   clang
powerpc              randconfig-r026-20230731   clang
powerpc              randconfig-r036-20230801   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230731   clang
riscv                randconfig-r042-20230802   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230801   gcc  
s390                 randconfig-r011-20230731   clang
s390                 randconfig-r035-20230801   gcc  
s390                 randconfig-r044-20230731   clang
s390                 randconfig-r044-20230802   gcc  
sh                               allmodconfig   gcc  
sh                        apsh4ad0a_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                   randconfig-r003-20230801   gcc  
sh                   randconfig-r023-20230731   gcc  
sh                   randconfig-r031-20230801   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           se7724_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230731   gcc  
sparc64              randconfig-r002-20230801   gcc  
sparc64              randconfig-r013-20230731   gcc  
sparc64              randconfig-r016-20230731   gcc  
sparc64              randconfig-r035-20230731   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230731   gcc  
x86_64       buildonly-randconfig-r001-20230801   gcc  
x86_64       buildonly-randconfig-r002-20230731   gcc  
x86_64       buildonly-randconfig-r002-20230801   gcc  
x86_64       buildonly-randconfig-r003-20230731   gcc  
x86_64       buildonly-randconfig-r003-20230801   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r012-20230731   clang
x86_64               randconfig-x001-20230731   clang
x86_64               randconfig-x001-20230801   clang
x86_64               randconfig-x002-20230731   clang
x86_64               randconfig-x002-20230801   clang
x86_64               randconfig-x003-20230731   clang
x86_64               randconfig-x003-20230801   clang
x86_64               randconfig-x004-20230731   clang
x86_64               randconfig-x004-20230801   clang
x86_64               randconfig-x005-20230731   clang
x86_64               randconfig-x005-20230801   clang
x86_64               randconfig-x006-20230731   clang
x86_64               randconfig-x006-20230801   clang
x86_64               randconfig-x011-20230731   gcc  
x86_64               randconfig-x012-20230731   gcc  
x86_64               randconfig-x013-20230731   gcc  
x86_64               randconfig-x014-20230731   gcc  
x86_64               randconfig-x015-20230731   gcc  
x86_64               randconfig-x016-20230731   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
