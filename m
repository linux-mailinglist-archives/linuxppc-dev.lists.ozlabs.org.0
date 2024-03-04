Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555B86F7FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 01:42:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WH6xTqNJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tp0Jq1Tp8z3d39
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 11:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WH6xTqNJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tp0J30k1Xz3btk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 11:41:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709512899; x=1741048899;
  h=date:from:to:cc:subject:message-id;
  bh=vP5pBurX5rkOmenDL9rFU14zBk16Njb5TAIq3w5QKS4=;
  b=WH6xTqNJTvT4/t4kaHhFY1niDOX6B0Q4oPFDc7OkKhKMwD1vYt537BPa
   eDajdpZzJ5SiKV9HcTR+VM9YbNxcIMoy1SCsbf4/iINVoDdjbP5n7biLJ
   ndqdaFBPbwqBofo59EGwsNiTxem57ZNsAzQdxzyxGa+XvVuoHFX5jhbNE
   mg48EMpIy7niWHjV9uPRiZFemyjOZQfJseMwov6JEHXyV/ITvLrJPwnHZ
   zuqZIdrVpdGIUa+fGL7A8xXpIOZ392ogTrd23LhtEshlRU2cVw0Jwv1pS
   yRAki+RpM80+UvHyPlFIt3yxwDimWsq/Sb7GfoikpfQ2853V2kTUirx/2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14700263"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14700263"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 16:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8761224"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2024 16:41:35 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgwOb-0002Dv-1j;
	Mon, 04 Mar 2024 00:41:33 +0000
Date: Mon, 04 Mar 2024 08:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 ca3d3aa14e7673f1b15e862b71998a4664d50ebe
Message-ID: <202403040831.bbBYdztv-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: ca3d3aa14e7673f1b15e862b71998a4664d50ebe  powerpc: Remove cpu-as-y completely

elapsed time: 722m

configs tested: 187
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240303   gcc  
arc                   randconfig-002-20240303   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          ixp4xx_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                          pxa168_defconfig   clang
arm                   randconfig-001-20240303   gcc  
arm                   randconfig-002-20240303   clang
arm                   randconfig-003-20240303   clang
arm                   randconfig-004-20240303   clang
arm                       spear13xx_defconfig   gcc  
arm                       versatile_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240303   clang
arm64                 randconfig-002-20240303   gcc  
arm64                 randconfig-003-20240303   gcc  
arm64                 randconfig-004-20240303   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240303   gcc  
csky                  randconfig-002-20240303   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20240303   clang
hexagon               randconfig-002-20240303   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240303   clang
i386         buildonly-randconfig-001-20240304   clang
i386         buildonly-randconfig-002-20240303   clang
i386         buildonly-randconfig-002-20240304   clang
i386         buildonly-randconfig-003-20240303   gcc  
i386         buildonly-randconfig-003-20240304   gcc  
i386         buildonly-randconfig-004-20240303   clang
i386         buildonly-randconfig-004-20240304   clang
i386         buildonly-randconfig-005-20240303   clang
i386         buildonly-randconfig-005-20240304   gcc  
i386         buildonly-randconfig-006-20240303   clang
i386         buildonly-randconfig-006-20240304   clang
i386                                defconfig   clang
i386                  randconfig-001-20240303   gcc  
i386                  randconfig-001-20240304   clang
i386                  randconfig-002-20240303   gcc  
i386                  randconfig-002-20240304   gcc  
i386                  randconfig-003-20240303   gcc  
i386                  randconfig-003-20240304   gcc  
i386                  randconfig-004-20240303   clang
i386                  randconfig-005-20240303   gcc  
i386                  randconfig-006-20240303   gcc  
i386                  randconfig-011-20240303   clang
i386                  randconfig-012-20240303   gcc  
i386                  randconfig-013-20240303   gcc  
i386                  randconfig-014-20240303   gcc  
i386                  randconfig-015-20240303   gcc  
i386                  randconfig-016-20240303   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240303   gcc  
loongarch             randconfig-002-20240303   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                      maltasmvp_defconfig   gcc  
mips                   sb1250_swarm_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240303   gcc  
nios2                 randconfig-002-20240303   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240303   gcc  
parisc                randconfig-002-20240303   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        fsp2_defconfig   gcc  
powerpc                  mpc885_ads_defconfig   clang
powerpc               randconfig-001-20240303   clang
powerpc               randconfig-002-20240303   gcc  
powerpc               randconfig-003-20240303   gcc  
powerpc64             randconfig-001-20240303   gcc  
powerpc64             randconfig-002-20240303   clang
powerpc64             randconfig-003-20240303   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240303   gcc  
riscv                 randconfig-002-20240303   clang
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240303   clang
s390                  randconfig-002-20240303   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                    randconfig-001-20240303   gcc  
sh                    randconfig-002-20240303   gcc  
sh                           se7750_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240303   gcc  
sparc64               randconfig-002-20240303   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240303   clang
um                    randconfig-002-20240303   clang
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240303   clang
x86_64       buildonly-randconfig-002-20240303   clang
x86_64       buildonly-randconfig-003-20240303   clang
x86_64       buildonly-randconfig-004-20240303   clang
x86_64       buildonly-randconfig-005-20240303   gcc  
x86_64       buildonly-randconfig-006-20240303   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240303   clang
x86_64                randconfig-002-20240303   gcc  
x86_64                randconfig-003-20240303   clang
x86_64                randconfig-004-20240303   clang
x86_64                randconfig-005-20240303   clang
x86_64                randconfig-006-20240303   gcc  
x86_64                randconfig-011-20240303   gcc  
x86_64                randconfig-012-20240303   gcc  
x86_64                randconfig-013-20240303   clang
x86_64                randconfig-014-20240303   gcc  
x86_64                randconfig-015-20240303   clang
x86_64                randconfig-016-20240303   gcc  
x86_64                randconfig-071-20240303   clang
x86_64                randconfig-072-20240303   gcc  
x86_64                randconfig-073-20240303   gcc  
x86_64                randconfig-074-20240303   gcc  
x86_64                randconfig-075-20240303   clang
x86_64                randconfig-076-20240303   clang
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                randconfig-001-20240303   gcc  
xtensa                randconfig-002-20240303   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
