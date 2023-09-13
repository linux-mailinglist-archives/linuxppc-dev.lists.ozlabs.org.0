Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1EC79DF3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 06:50:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2mFpw/Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlp1Y52v3z3c9r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 14:50:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q2mFpw/Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlp0f4vL6z2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 14:50:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694580611; x=1726116611;
  h=date:from:to:cc:subject:message-id;
  bh=tTXNpFER0tSKGGY6TJz/uWp1cWSfz5MCyJzvHuCOCXw=;
  b=Q2mFpw/Za/Jrb6DNrfruJmACmAFMaSjdXW66KS0W2qhUbL463gzyQmX7
   d9+d0pE0fmn/KSGa+7+wNc1FPM4KH9wd5rDZSQUiv8ly0QsWMLcYZFrDt
   OHOrhGRtsnd1TjLOJ6+Dz0w3UD9yWEY4kU9B9R+q0MwdViT1W/CNv4QC0
   FW2xt/N0YqppYp9w/GNB9OpQS/06+Q0EGhOENdWDcE5INTpFEUT4KGXR2
   vkLL8oX5vnKFLS8zPvjtkyb1z7nZ6AkdtT1g8tH7cLxQvqZSrbG3rQoPp
   6bjHOoKf06GCdPv85/O5K16Bt6Noh52G7qKYjCbwh/nZWC0Y5G05ytpuz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357994745"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="357994745"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 21:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="747166148"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="747166148"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Sep 2023 21:50:00 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgHp8-000021-2P;
	Wed, 13 Sep 2023 04:49:58 +0000
Date: Wed, 13 Sep 2023 12:49:23 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD REGRESSION
 5af8497e01ed97410b2f19ca8320a3bcdcfe267b
Message-ID: <202309131221.RUyTqfZx-lkp@intel.com>
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
branch HEAD: 5af8497e01ed97410b2f19ca8320a3bcdcfe267b  docs: powerpc: Document nested KVM on POWER

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202309130700.eRu2IdWo-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309130935.Bj7eusw4-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kvm/book3s_hv_nestedv2.c:465:29: error: variable 'amor' set but not used [-Werror=unused-but-set-variable]
arch/powerpc/kvm/guest-state-buffer.c:505: warning: expecting prototype for kvmppc_gsm_init(). Prototype was for kvmppc_gsm_new() instead
arch/powerpc/kvm/guest-state-buffer.c:565: warning: expecting prototype for kvmppc_gsm_fill_info(). Prototype was for kvmppc_gsm_refresh_info() instead

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-ppc64_defconfig
    |-- arch-powerpc-kvm-book3s_hv_nestedv2.c:error:variable-amor-set-but-not-used
    |-- arch-powerpc-kvm-guest-state-buffer.c:warning:expecting-prototype-for-kvmppc_gsm_fill_info().-Prototype-was-for-kvmppc_gsm_refresh_info()-instead
    `-- arch-powerpc-kvm-guest-state-buffer.c:warning:expecting-prototype-for-kvmppc_gsm_init().-Prototype-was-for-kvmppc_gsm_new()-instead

elapsed time: 887m

configs tested: 220
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r021-20230913   gcc  
alpha                randconfig-r023-20230913   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs103_defconfig   gcc  
arc                                 defconfig   gcc  
arc                     nsimosci_hs_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                           omap1_defconfig   clang
arm                  randconfig-r016-20230913   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r012-20230913   clang
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r006-20230913   gcc  
csky                 randconfig-r013-20230912   gcc  
csky                 randconfig-r025-20230913   gcc  
hexagon               randconfig-001-20230913   clang
hexagon               randconfig-002-20230913   clang
hexagon              randconfig-r003-20230913   clang
hexagon              randconfig-r036-20230912   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230913   gcc  
i386         buildonly-randconfig-002-20230913   gcc  
i386         buildonly-randconfig-003-20230913   gcc  
i386         buildonly-randconfig-004-20230913   gcc  
i386         buildonly-randconfig-005-20230913   gcc  
i386         buildonly-randconfig-006-20230913   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230913   gcc  
i386                  randconfig-002-20230913   gcc  
i386                  randconfig-003-20230913   gcc  
i386                  randconfig-004-20230913   gcc  
i386                  randconfig-005-20230913   gcc  
i386                  randconfig-006-20230913   gcc  
i386                  randconfig-011-20230913   clang
i386                  randconfig-012-20230913   clang
i386                  randconfig-013-20230913   clang
i386                  randconfig-014-20230913   clang
i386                  randconfig-015-20230913   clang
i386                  randconfig-016-20230913   clang
i386                 randconfig-r004-20230913   gcc  
i386                 randconfig-r006-20230913   gcc  
i386                 randconfig-r031-20230912   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230912   gcc  
loongarch             randconfig-001-20230913   gcc  
loongarch            randconfig-r002-20230913   gcc  
loongarch            randconfig-r004-20230913   gcc  
loongarch            randconfig-r005-20230913   gcc  
loongarch            randconfig-r014-20230912   gcc  
loongarch            randconfig-r032-20230913   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230913   gcc  
m68k                 randconfig-r012-20230913   gcc  
m68k                 randconfig-r022-20230913   gcc  
m68k                 randconfig-r023-20230913   gcc  
m68k                           sun3_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
microblaze           randconfig-r011-20230912   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                 randconfig-r022-20230913   gcc  
mips                 randconfig-r025-20230913   gcc  
mips                   sb1250_swarm_defconfig   clang
nios2                            alldefconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r014-20230913   gcc  
nios2                randconfig-r025-20230913   gcc  
nios2                randconfig-r031-20230913   gcc  
nios2                randconfig-r032-20230912   gcc  
nios2                randconfig-r033-20230913   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r021-20230913   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r004-20230913   gcc  
parisc               randconfig-r005-20230913   gcc  
parisc               randconfig-r023-20230913   gcc  
parisc               randconfig-r024-20230913   gcc  
parisc               randconfig-r026-20230913   gcc  
parisc               randconfig-r035-20230913   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                 canyonlands_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc              randconfig-r003-20230913   gcc  
powerpc64            randconfig-r001-20230913   gcc  
powerpc64            randconfig-r004-20230913   gcc  
powerpc64            randconfig-r005-20230913   gcc  
powerpc64            randconfig-r006-20230913   gcc  
powerpc64            randconfig-r016-20230912   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv                randconfig-r011-20230913   clang
riscv                randconfig-r014-20230913   clang
riscv                randconfig-r016-20230913   clang
riscv                randconfig-r033-20230913   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230913   clang
s390                 randconfig-r002-20230913   gcc  
s390                 randconfig-r005-20230913   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                   randconfig-r002-20230913   gcc  
sh                   randconfig-r015-20230913   gcc  
sh                   randconfig-r025-20230913   gcc  
sh                   randconfig-r036-20230913   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                            titan_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230913   gcc  
sparc                randconfig-r026-20230913   gcc  
sparc                randconfig-r031-20230913   gcc  
sparc                randconfig-r036-20230913   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r012-20230912   gcc  
sparc64              randconfig-r015-20230912   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r006-20230913   clang
um                   randconfig-r026-20230913   gcc  
um                   randconfig-r033-20230912   gcc  
um                   randconfig-r035-20230912   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230913   gcc  
x86_64       buildonly-randconfig-002-20230913   gcc  
x86_64       buildonly-randconfig-003-20230913   gcc  
x86_64       buildonly-randconfig-004-20230913   gcc  
x86_64       buildonly-randconfig-005-20230913   gcc  
x86_64       buildonly-randconfig-006-20230913   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20230913   clang
x86_64                randconfig-002-20230913   clang
x86_64                randconfig-003-20230913   clang
x86_64                randconfig-004-20230913   clang
x86_64                randconfig-005-20230913   clang
x86_64                randconfig-006-20230913   clang
x86_64                randconfig-011-20230913   gcc  
x86_64                randconfig-012-20230913   gcc  
x86_64                randconfig-013-20230913   gcc  
x86_64                randconfig-014-20230913   gcc  
x86_64                randconfig-015-20230913   gcc  
x86_64                randconfig-016-20230913   gcc  
x86_64                randconfig-071-20230913   gcc  
x86_64                randconfig-072-20230913   gcc  
x86_64                randconfig-073-20230913   gcc  
x86_64                randconfig-074-20230913   gcc  
x86_64                randconfig-075-20230913   gcc  
x86_64                randconfig-076-20230913   gcc  
x86_64               randconfig-r021-20230913   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                              defconfig   gcc  
xtensa               randconfig-r034-20230912   gcc  
xtensa               randconfig-r034-20230913   gcc  
xtensa               randconfig-r035-20230913   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
