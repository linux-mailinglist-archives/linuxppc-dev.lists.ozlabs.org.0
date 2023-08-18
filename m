Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F279E7805FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 08:52:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wc0FoUHJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRsy070m0z3cSH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 16:52:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wc0FoUHJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRsx83C3Sz2ydM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 16:51:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692341516; x=1723877516;
  h=date:from:to:cc:subject:message-id;
  bh=ia40KnVvNO8I4lPzwLHEaLD1RTvo6dLwAQTgF4d5d/E=;
  b=Wc0FoUHJWXSHZCrp1ePfT87qb+4m29aT3G4jd+kdV/w7VRK1Tj3iopw/
   vmq0TEbojK1qdvF6mouemCeMJdUwEqLygjweFlPoQy7tlARMOb4gpMWHf
   C/qZvLVGo6ExsEZs6pXguU5pufnsi5fy9cLlObpawVWKXZYhWirFOATXr
   h+aCUarOY/mvXG9QfwWQYorHnjjjv9ZlwTbodRDAp7xhj+wd/VxTz08oR
   5E4cQ2Q45DyNWjUNrptylm3DCS9chdTvc6VHQx4Mv7TpnQSjxncR6XbcZ
   06OikRCdzb3q7QOQE+Vbm1lhzZuK61IVisoDiylN60idIlZmDTfrx71RV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="404012325"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="404012325"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 23:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="981532040"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="981532040"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 23:51:28 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWtJv-0002BW-11;
	Fri, 18 Aug 2023 06:51:03 +0000
Date: Fri, 18 Aug 2023 14:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS WITH WARNING
 a6a4c847287937c42ad33e053af968ed6ea91e13
Message-ID: <202308181403.4rILGpgu-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: a6a4c847287937c42ad33e053af968ed6ea91e13  Fixup uvmem printk error

Warning reports:

https://lore.kernel.org/oe-kbuild-all/202308161359.9d2Z52f5-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308161433.p1L5wedY-lkp@intel.com

Warning: (recently discovered and may have been fixed)

arch/powerpc/kvm/book3s_hv_nestedv2.c:465:29: warning: variable 'amor' set but not used [-Wunused-but-set-variable]
arch/powerpc/kvm/guest-state-buffer.c:505: warning: expecting prototype for kvmppc_gsm_init(). Prototype was for kvmppc_gsm_new() instead
arch/powerpc/kvm/guest-state-buffer.c:565: warning: expecting prototype for kvmppc_gsm_fill_info(). Prototype was for kvmppc_gsm_refresh_info() instead

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-allmodconfig
|   |-- arch-powerpc-kvm-book3s_hv_nestedv2.c:warning:variable-amor-set-but-not-used
|   |-- arch-powerpc-kvm-guest-state-buffer.c:warning:expecting-prototype-for-kvmppc_gsm_fill_info().-Prototype-was-for-kvmppc_gsm_refresh_info()-instead
|   `-- arch-powerpc-kvm-guest-state-buffer.c:warning:expecting-prototype-for-kvmppc_gsm_init().-Prototype-was-for-kvmppc_gsm_new()-instead
`-- powerpc-allyesconfig
    |-- arch-powerpc-kvm-book3s_hv_nestedv2.c:warning:variable-amor-set-but-not-used
    |-- arch-powerpc-kvm-guest-state-buffer.c:warning:expecting-prototype-for-kvmppc_gsm_fill_info().-Prototype-was-for-kvmppc_gsm_refresh_info()-instead
    `-- arch-powerpc-kvm-guest-state-buffer.c:warning:expecting-prototype-for-kvmppc_gsm_init().-Prototype-was-for-kvmppc_gsm_new()-instead

elapsed time: 1008m

configs tested: 182
configs skipped: 10

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r025-20230818   gcc  
alpha                randconfig-r026-20230818   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r014-20230818   gcc  
arc                  randconfig-r021-20230818   gcc  
arc                  randconfig-r022-20230818   gcc  
arc                  randconfig-r043-20230818   gcc  
arm                              alldefconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                      integrator_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                         lpc32xx_defconfig   clang
arm                  randconfig-r004-20230818   clang
arm                  randconfig-r013-20230818   gcc  
arm                  randconfig-r021-20230818   gcc  
arm                  randconfig-r024-20230818   gcc  
arm                  randconfig-r035-20230818   clang
arm                  randconfig-r046-20230818   gcc  
arm                           sama7_defconfig   clang
arm                           tegra_defconfig   gcc  
arm                           u8500_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r033-20230818   gcc  
arm64                randconfig-r034-20230818   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230818   gcc  
csky                 randconfig-r012-20230818   gcc  
csky                 randconfig-r031-20230818   gcc  
csky                 randconfig-r032-20230818   gcc  
csky                 randconfig-r033-20230817   gcc  
hexagon              randconfig-r005-20230818   clang
hexagon              randconfig-r016-20230818   clang
hexagon              randconfig-r021-20230818   clang
hexagon              randconfig-r032-20230817   clang
hexagon              randconfig-r036-20230818   clang
hexagon              randconfig-r041-20230818   clang
hexagon              randconfig-r045-20230818   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230818   gcc  
i386         buildonly-randconfig-r005-20230818   gcc  
i386         buildonly-randconfig-r006-20230818   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230818   gcc  
i386                 randconfig-i002-20230818   gcc  
i386                 randconfig-i003-20230818   gcc  
i386                 randconfig-i004-20230818   gcc  
i386                 randconfig-i005-20230818   gcc  
i386                 randconfig-i006-20230818   gcc  
i386                 randconfig-i011-20230818   clang
i386                 randconfig-i012-20230818   clang
i386                 randconfig-i013-20230818   clang
i386                 randconfig-i014-20230818   clang
i386                 randconfig-i015-20230818   clang
i386                 randconfig-i016-20230818   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230818   gcc  
loongarch            randconfig-r015-20230818   gcc  
loongarch            randconfig-r021-20230818   gcc  
loongarch            randconfig-r025-20230818   gcc  
loongarch            randconfig-r026-20230818   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r023-20230818   gcc  
m68k                 randconfig-r031-20230817   gcc  
m68k                 randconfig-r036-20230817   gcc  
microblaze                      mmu_defconfig   gcc  
microblaze           randconfig-r003-20230818   gcc  
microblaze           randconfig-r013-20230818   gcc  
microblaze           randconfig-r015-20230818   gcc  
microblaze           randconfig-r036-20230818   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      maltaaprp_defconfig   clang
mips                      pic32mzda_defconfig   clang
mips                           rs90_defconfig   clang
nios2                               defconfig   gcc  
nios2                randconfig-r002-20230818   gcc  
nios2                randconfig-r005-20230818   gcc  
nios2                randconfig-r006-20230818   gcc  
nios2                randconfig-r024-20230818   gcc  
nios2                randconfig-r026-20230818   gcc  
openrisc             randconfig-r003-20230818   gcc  
openrisc             randconfig-r004-20230818   gcc  
openrisc             randconfig-r011-20230818   gcc  
openrisc             randconfig-r013-20230818   gcc  
openrisc             randconfig-r035-20230818   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230818   gcc  
parisc               randconfig-r011-20230818   gcc  
parisc               randconfig-r034-20230817   gcc  
parisc               randconfig-r034-20230818   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                   currituck_defconfig   gcc  
powerpc                     ksi8560_defconfig   clang
powerpc                   motionpro_defconfig   gcc  
powerpc                      pcm030_defconfig   gcc  
powerpc              randconfig-r033-20230818   gcc  
powerpc                    socrates_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230818   clang
riscv                randconfig-r022-20230818   clang
riscv                randconfig-r042-20230818   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r006-20230818   gcc  
s390                 randconfig-r031-20230818   gcc  
s390                 randconfig-r044-20230818   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r001-20230818   gcc  
sh                   randconfig-r002-20230818   gcc  
sh                   randconfig-r005-20230818   gcc  
sh                   randconfig-r024-20230818   gcc  
sh                   randconfig-r025-20230818   gcc  
sh                   randconfig-r032-20230818   gcc  
sh                   randconfig-r033-20230818   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r002-20230818   gcc  
sparc                randconfig-r004-20230818   gcc  
sparc                randconfig-r005-20230818   gcc  
sparc                randconfig-r032-20230818   gcc  
sparc64              randconfig-r014-20230818   gcc  
sparc64              randconfig-r015-20230818   gcc  
sparc64              randconfig-r016-20230818   gcc  
sparc64              randconfig-r036-20230818   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230818   clang
um                   randconfig-r014-20230818   gcc  
um                   randconfig-r016-20230818   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230818   gcc  
x86_64       buildonly-randconfig-r002-20230818   gcc  
x86_64       buildonly-randconfig-r003-20230818   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r002-20230818   gcc  
x86_64               randconfig-r005-20230818   gcc  
x86_64               randconfig-r023-20230818   clang
x86_64               randconfig-r034-20230818   gcc  
x86_64               randconfig-r035-20230818   gcc  
x86_64               randconfig-x001-20230818   clang
x86_64               randconfig-x002-20230818   clang
x86_64               randconfig-x003-20230818   clang
x86_64               randconfig-x004-20230818   clang
x86_64               randconfig-x005-20230818   clang
x86_64               randconfig-x006-20230818   clang
x86_64               randconfig-x011-20230818   gcc  
x86_64               randconfig-x012-20230818   gcc  
x86_64               randconfig-x013-20230818   gcc  
x86_64               randconfig-x014-20230818   gcc  
x86_64               randconfig-x015-20230818   gcc  
x86_64               randconfig-x016-20230818   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  
xtensa               randconfig-r035-20230818   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
