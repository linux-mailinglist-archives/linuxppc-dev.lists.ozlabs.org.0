Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A777C4F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 03:18:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gKn6QfCQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPtgn4Ygzz2xpv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 11:18:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gKn6QfCQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPtfZ0J9wz2yVl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 11:17:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692062246; x=1723598246;
  h=date:from:to:cc:subject:message-id;
  bh=KZREJ4hgjAtm6err17BCzKkZFxbuoLEYspKv/uQsEL8=;
  b=gKn6QfCQXbWWBIB34fbRHdxeGLAZw6PS41CNBJAyShFsxde1R+JTPcPD
   hhY+HWxM/iRUqRNlcma1qpfk5yuWhA2Lu8WqCIEow9PT9tKeoNjAyXNW7
   8dNwKL+aCZ+eR6XXcqpgZ2Hk/XBaRp2ZQ1P+4R7uAnCQYhj2dTP4+bqmg
   GAJZG/HxWaQFuvcZNyzB1uemXaGnxDvBvJNYYEBeSrrlP5JyT6T235pK8
   wpjb3yj3QQ8uzeVBnldNpm6pqPkATP7yteZ+3OVt0TO6wJIT77jq/8zOG
   8Ad18E3mEsv6sZOEpala89hlHXetxE9eAEtnlFIXoJg4K0EVVNiz3ZcIv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="352502080"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="352502080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:17:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="763115969"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="763115969"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Aug 2023 18:17:17 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVigF-0000YN-1K;
	Tue, 15 Aug 2023 01:17:10 +0000
Date: Tue, 15 Aug 2023 09:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 80e30aa4961e89111ae3e48885138a80add3e2ab
Message-ID: <202308150912.YvaBimhz-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 80e30aa4961e89111ae3e48885138a80add3e2ab  powerpc/rtas_flash: allow user copy to flash block cache objects

elapsed time: 725m

configs tested: 274
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230814   gcc  
alpha                randconfig-r004-20230814   gcc  
alpha                randconfig-r012-20230815   gcc  
alpha                randconfig-r013-20230815   gcc  
alpha                randconfig-r024-20230815   gcc  
alpha                randconfig-r031-20230815   gcc  
alpha                randconfig-r033-20230815   gcc  
alpha                randconfig-r034-20230815   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230815   gcc  
arc                  randconfig-r002-20230815   gcc  
arc                  randconfig-r003-20230815   gcc  
arc                  randconfig-r013-20230814   gcc  
arc                  randconfig-r013-20230815   gcc  
arc                  randconfig-r014-20230814   gcc  
arc                  randconfig-r022-20230814   gcc  
arc                  randconfig-r023-20230815   gcc  
arc                  randconfig-r043-20230815   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                          moxart_defconfig   clang
arm                            mps2_defconfig   gcc  
arm                        multi_v7_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                  randconfig-r003-20230814   clang
arm                  randconfig-r004-20230814   clang
arm                  randconfig-r006-20230815   gcc  
arm                  randconfig-r024-20230815   clang
arm                  randconfig-r025-20230815   clang
arm                  randconfig-r026-20230814   gcc  
arm                  randconfig-r034-20230815   gcc  
arm                  randconfig-r046-20230815   clang
arm                        shmobile_defconfig   gcc  
arm                        spear3xx_defconfig   gcc  
arm                           tegra_defconfig   gcc  
arm64                            alldefconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230814   gcc  
arm64                randconfig-r012-20230815   gcc  
arm64                randconfig-r021-20230815   gcc  
arm64                randconfig-r022-20230815   gcc  
arm64                randconfig-r025-20230815   gcc  
arm64                randconfig-r026-20230815   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r002-20230814   gcc  
csky                 randconfig-r013-20230815   gcc  
csky                 randconfig-r014-20230815   gcc  
csky                 randconfig-r015-20230815   gcc  
csky                 randconfig-r016-20230815   gcc  
csky                 randconfig-r031-20230815   gcc  
csky                 randconfig-r035-20230814   gcc  
hexagon              randconfig-r026-20230815   clang
hexagon              randconfig-r041-20230814   clang
hexagon              randconfig-r041-20230815   clang
hexagon              randconfig-r045-20230814   clang
hexagon              randconfig-r045-20230815   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230814   gcc  
i386         buildonly-randconfig-r004-20230815   clang
i386         buildonly-randconfig-r005-20230814   gcc  
i386         buildonly-randconfig-r005-20230815   clang
i386         buildonly-randconfig-r006-20230814   gcc  
i386         buildonly-randconfig-r006-20230815   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230814   gcc  
i386                 randconfig-i001-20230815   clang
i386                 randconfig-i002-20230814   gcc  
i386                 randconfig-i002-20230815   clang
i386                 randconfig-i003-20230814   gcc  
i386                 randconfig-i003-20230815   clang
i386                 randconfig-i004-20230814   gcc  
i386                 randconfig-i004-20230815   clang
i386                 randconfig-i005-20230814   gcc  
i386                 randconfig-i005-20230815   clang
i386                 randconfig-i006-20230814   gcc  
i386                 randconfig-i006-20230815   clang
i386                 randconfig-i011-20230814   clang
i386                 randconfig-i011-20230815   gcc  
i386                 randconfig-i012-20230814   clang
i386                 randconfig-i012-20230815   gcc  
i386                 randconfig-i013-20230814   clang
i386                 randconfig-i013-20230815   gcc  
i386                 randconfig-i014-20230814   clang
i386                 randconfig-i014-20230815   gcc  
i386                 randconfig-i015-20230814   clang
i386                 randconfig-i015-20230815   gcc  
i386                 randconfig-i016-20230814   clang
i386                 randconfig-i016-20230815   gcc  
i386                 randconfig-r004-20230815   clang
i386                 randconfig-r005-20230814   gcc  
i386                 randconfig-r005-20230815   clang
i386                 randconfig-r016-20230815   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r001-20230815   gcc  
loongarch            randconfig-r013-20230815   gcc  
loongarch            randconfig-r021-20230814   gcc  
loongarch            randconfig-r022-20230814   gcc  
loongarch            randconfig-r035-20230815   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                       bvme6000_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                        mvme16x_defconfig   gcc  
m68k                 randconfig-r006-20230815   gcc  
m68k                 randconfig-r014-20230815   gcc  
m68k                 randconfig-r021-20230815   gcc  
m68k                 randconfig-r024-20230815   gcc  
m68k                 randconfig-r025-20230814   gcc  
m68k                 randconfig-r035-20230815   gcc  
m68k                 randconfig-r036-20230814   gcc  
microblaze           randconfig-r005-20230814   gcc  
microblaze           randconfig-r011-20230815   gcc  
microblaze           randconfig-r012-20230815   gcc  
microblaze           randconfig-r015-20230815   gcc  
microblaze           randconfig-r022-20230815   gcc  
microblaze           randconfig-r024-20230814   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                     decstation_defconfig   gcc  
mips                       lemote2f_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                    maltaup_xpa_defconfig   gcc  
mips                 randconfig-r002-20230815   gcc  
mips                          rb532_defconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r001-20230814   gcc  
nios2                randconfig-r003-20230814   gcc  
nios2                randconfig-r004-20230815   gcc  
nios2                randconfig-r005-20230815   gcc  
nios2                randconfig-r011-20230815   gcc  
nios2                randconfig-r015-20230815   gcc  
openrisc             randconfig-r001-20230815   gcc  
openrisc             randconfig-r006-20230815   gcc  
openrisc             randconfig-r026-20230815   gcc  
openrisc                 simple_smp_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r016-20230814   gcc  
parisc               randconfig-r023-20230815   gcc  
parisc               randconfig-r032-20230815   gcc  
parisc               randconfig-r036-20230815   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                    klondike_defconfig   gcc  
powerpc                      mgcoge_defconfig   gcc  
powerpc              randconfig-r011-20230815   gcc  
powerpc              randconfig-r016-20230814   clang
powerpc              randconfig-r023-20230815   gcc  
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                    nommu_k210_defconfig   gcc  
riscv             nommu_k210_sdcard_defconfig   gcc  
riscv                randconfig-r031-20230814   gcc  
riscv                randconfig-r042-20230814   clang
riscv                randconfig-r042-20230815   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r022-20230815   gcc  
s390                 randconfig-r044-20230814   clang
s390                 randconfig-r044-20230815   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                        edosk7760_defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                          r7780mp_defconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sh                   randconfig-r002-20230815   gcc  
sh                   randconfig-r005-20230815   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7780_defconfig   gcc  
sh                           se7619_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230815   gcc  
sparc                randconfig-r006-20230814   gcc  
sparc                randconfig-r024-20230815   gcc  
sparc                randconfig-r031-20230815   gcc  
sparc                randconfig-r033-20230815   gcc  
sparc64                             defconfig   gcc  
sparc64              randconfig-r002-20230814   gcc  
sparc64              randconfig-r002-20230815   gcc  
sparc64              randconfig-r003-20230815   gcc  
sparc64              randconfig-r004-20230815   gcc  
sparc64              randconfig-r005-20230815   gcc  
sparc64              randconfig-r012-20230815   gcc  
sparc64              randconfig-r023-20230814   gcc  
sparc64              randconfig-r024-20230815   gcc  
sparc64              randconfig-r036-20230815   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r001-20230815   gcc  
um                   randconfig-r005-20230815   gcc  
um                   randconfig-r006-20230814   clang
um                   randconfig-r014-20230815   clang
um                   randconfig-r023-20230814   gcc  
um                   randconfig-r024-20230814   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230814   gcc  
x86_64       buildonly-randconfig-r001-20230815   clang
x86_64       buildonly-randconfig-r002-20230814   gcc  
x86_64       buildonly-randconfig-r002-20230815   clang
x86_64       buildonly-randconfig-r003-20230814   gcc  
x86_64       buildonly-randconfig-r003-20230815   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r015-20230814   clang
x86_64               randconfig-r015-20230815   gcc  
x86_64               randconfig-r021-20230815   gcc  
x86_64               randconfig-r025-20230815   gcc  
x86_64               randconfig-x001-20230814   clang
x86_64               randconfig-x001-20230815   gcc  
x86_64               randconfig-x002-20230814   clang
x86_64               randconfig-x002-20230815   gcc  
x86_64               randconfig-x003-20230814   clang
x86_64               randconfig-x003-20230815   gcc  
x86_64               randconfig-x004-20230814   clang
x86_64               randconfig-x004-20230815   gcc  
x86_64               randconfig-x005-20230814   clang
x86_64               randconfig-x005-20230815   gcc  
x86_64               randconfig-x006-20230814   clang
x86_64               randconfig-x006-20230815   gcc  
x86_64               randconfig-x011-20230814   gcc  
x86_64               randconfig-x011-20230815   clang
x86_64               randconfig-x012-20230814   gcc  
x86_64               randconfig-x012-20230815   clang
x86_64               randconfig-x013-20230814   gcc  
x86_64               randconfig-x013-20230815   clang
x86_64               randconfig-x014-20230814   gcc  
x86_64               randconfig-x014-20230815   clang
x86_64               randconfig-x015-20230814   gcc  
x86_64               randconfig-x015-20230815   clang
x86_64               randconfig-x016-20230814   gcc  
x86_64               randconfig-x016-20230815   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                  audio_kc705_defconfig   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r003-20230815   gcc  
xtensa               randconfig-r015-20230815   gcc  
xtensa               randconfig-r022-20230815   gcc  
xtensa               randconfig-r033-20230814   gcc  
xtensa               randconfig-r033-20230815   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
