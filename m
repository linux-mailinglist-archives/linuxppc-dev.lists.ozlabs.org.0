Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515D174E37B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:36:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QhpI0e8j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0NkT1fKHz3c3v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 11:36:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QhpI0e8j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0Nhd4VBxz3Wtq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 11:34:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689039281; x=1720575281;
  h=date:from:to:cc:subject:message-id;
  bh=uc9JZzP4mca53MCiMTH23tRgjnn9Ci97kRrEYb163h8=;
  b=QhpI0e8jAVIIgbYZRm7MiIr/2e/yR1v3/2WsNMM2GnQPo5cKRQFwv7tJ
   182jTaH5VQlPmAMCE9jLovkCcpHb95606IMb+m9mB484HcidjivsSz0vS
   zQGf6I8y/I9wQeqwK4qe3G3aQqZIzNYaTOHdniCENgUxY8ebWGQ/JnY+A
   jBrwCo+Qe+cj3ymeXejxJj6bIl9fCdRzq+BU2y+QSTzzvUPN8YArqkEq6
   plU3JnOrh1BmcIHXB0GpW2a2JNGN2R80mBe8nNGIodbvXHiQ8MZL3ujGQ
   UI7C5pz9jO/1qjDbos+Bu/xV2wukd52F3rjmisyEhHs/EWSIFoad9PWaV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367996701"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="367996701"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 18:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="1051583993"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="1051583993"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2023 18:34:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ2Gw-0004Ac-1Y;
	Tue, 11 Jul 2023 01:34:34 +0000
Date: Tue, 11 Jul 2023 09:34:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 20125a0e8655abec375153cc23cc708ffa8c4380
Message-ID: <202307110915.5GaXec8Z-lkp@intel.com>
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
branch HEAD: 20125a0e8655abec375153cc23cc708ffa8c4380  Automatic merge of 'master' into merge (2023-07-10 09:49)

elapsed time: 1249m

configs tested: 169
configs skipped: 9

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r032-20230710   gcc  
arc                              alldefconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r002-20230710   gcc  
arc                  randconfig-r014-20230710   gcc  
arc                  randconfig-r025-20230710   gcc  
arc                  randconfig-r031-20230710   gcc  
arc                  randconfig-r043-20230710   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                  randconfig-r012-20230710   gcc  
arm                  randconfig-r046-20230710   gcc  
arm                         socfpga_defconfig   clang
arm                          sp7021_defconfig   clang
arm                        spear3xx_defconfig   clang
arm                           spitz_defconfig   clang
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230710   gcc  
csky                 randconfig-r013-20230710   gcc  
hexagon              randconfig-r016-20230710   clang
hexagon              randconfig-r036-20230710   clang
hexagon              randconfig-r041-20230710   clang
hexagon              randconfig-r045-20230710   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230710   gcc  
i386         buildonly-randconfig-r005-20230710   gcc  
i386         buildonly-randconfig-r006-20230710   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230710   gcc  
i386                 randconfig-i002-20230710   gcc  
i386                 randconfig-i003-20230710   gcc  
i386                 randconfig-i004-20230710   gcc  
i386                 randconfig-i005-20230710   gcc  
i386                 randconfig-i006-20230710   gcc  
i386                 randconfig-i011-20230710   clang
i386                 randconfig-i012-20230710   clang
i386                 randconfig-i013-20230710   clang
i386                 randconfig-i014-20230710   clang
i386                 randconfig-i015-20230710   clang
i386                 randconfig-i016-20230710   clang
i386                 randconfig-r004-20230710   gcc  
i386                 randconfig-r032-20230710   gcc  
i386                 randconfig-r033-20230710   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230710   gcc  
loongarch            randconfig-r035-20230710   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                          amiga_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                 randconfig-r016-20230710   gcc  
m68k                        stmark2_defconfig   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r015-20230710   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
mips                        bcm47xx_defconfig   gcc  
mips                       bmips_be_defconfig   gcc  
mips                      bmips_stb_defconfig   clang
mips                  cavium_octeon_defconfig   clang
mips                         cobalt_defconfig   gcc  
mips                           ip27_defconfig   clang
mips                           jazz_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
mips                 randconfig-r024-20230710   gcc  
mips                 randconfig-r034-20230710   clang
nios2                               defconfig   gcc  
nios2                randconfig-r011-20230710   gcc  
nios2                randconfig-r014-20230710   gcc  
openrisc             randconfig-r015-20230710   gcc  
openrisc             randconfig-r021-20230710   gcc  
openrisc             randconfig-r022-20230710   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r012-20230710   gcc  
parisc               randconfig-r026-20230710   gcc  
parisc               randconfig-r034-20230710   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r023-20230710   clang
powerpc                     redwood_defconfig   gcc  
powerpc                    sam440ep_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r015-20230710   clang
riscv                randconfig-r024-20230710   clang
riscv                randconfig-r042-20230710   clang
riscv                          rv32_defconfig   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r003-20230710   gcc  
s390                 randconfig-r025-20230710   clang
s390                 randconfig-r031-20230710   gcc  
s390                 randconfig-r033-20230710   gcc  
s390                 randconfig-r044-20230710   clang
sh                               allmodconfig   gcc  
sh                             espt_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                   randconfig-r006-20230710   gcc  
sh                   randconfig-r011-20230710   gcc  
sh                   randconfig-r016-20230710   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7750_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sh                             shx3_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230710   gcc  
sparc                randconfig-r014-20230710   gcc  
sparc                randconfig-r021-20230710   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64              randconfig-r001-20230710   gcc  
sparc64              randconfig-r003-20230710   gcc  
sparc64              randconfig-r004-20230710   gcc  
sparc64              randconfig-r013-20230710   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r012-20230710   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230710   gcc  
x86_64       buildonly-randconfig-r002-20230710   gcc  
x86_64       buildonly-randconfig-r003-20230710   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x011-20230710   gcc  
x86_64               randconfig-x012-20230710   gcc  
x86_64               randconfig-x013-20230710   gcc  
x86_64               randconfig-x014-20230710   gcc  
x86_64               randconfig-x015-20230710   gcc  
x86_64               randconfig-x016-20230710   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                              defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r035-20230710   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
