Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCB7408E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 05:21:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kt1Y0xMB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrRhJ02cfz30hn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 13:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kt1Y0xMB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrRgL1txMz306V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 13:20:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687922462; x=1719458462;
  h=date:from:to:cc:subject:message-id;
  bh=M8zUlpz+91RYRSCmN6h/XS90GlvF+DlUr1YFkhwiiNI=;
  b=Kt1Y0xMBBGicrvfxBjLlG872XnVCYpYDyqPxfujb2xWkxUAftLQUnfPD
   drWWkdopS+Fj4fMa6ZipqN6nfNQd/XChr5tOGTddMXu3QXA5jCB19hIDz
   IYB7kVD07p4aq28wR3pcF3//3yPNVkzpR+9+7IXq2u5Bf3F9eg+G+m+3Z
   QTbP4i+zDNoiYFH6MRWOz7YBb9PIkznZYxHbUbbgUNVpNaf2aJa5o0mOa
   DErGyKvfGn5V+vSE8RPRRG0q20h8jgvoU5bw/ohkzZzaI6LrvuGoK9nKy
   jDQq5+KfWFUIyIK2uqd8MVrZ/JGEFu+67B1mgAAUOOoe0UpVtLv3Silmq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359235495"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="359235495"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 20:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="666932505"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="666932505"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Jun 2023 20:20:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qELjQ-000Cc5-2L;
	Wed, 28 Jun 2023 03:20:36 +0000
Date: Wed, 28 Jun 2023 11:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 54a11654de163994e32b24e3aa90ef81f4a3184d
Message-ID: <202306281126.BBLreqTb-lkp@intel.com>
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
branch HEAD: 54a11654de163994e32b24e3aa90ef81f4a3184d  powerpc: remove checks for binutils older than 2.25

elapsed time: 874m

configs tested: 183
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r012-20230627   gcc  
alpha                randconfig-r022-20230627   gcc  
alpha                randconfig-r024-20230627   gcc  
alpha                randconfig-r035-20230627   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230627   gcc  
arc                  randconfig-r031-20230627   gcc  
arc                  randconfig-r043-20230627   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                       imx_v4_v5_defconfig   clang
arm                      jornada720_defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                  randconfig-r001-20230627   clang
arm                  randconfig-r005-20230627   clang
arm                  randconfig-r006-20230627   clang
arm                  randconfig-r015-20230627   gcc  
arm                  randconfig-r036-20230627   clang
arm                  randconfig-r046-20230627   gcc  
arm                          sp7021_defconfig   clang
arm                           u8500_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230627   clang
arm64                randconfig-r014-20230627   clang
arm64                randconfig-r031-20230627   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r011-20230627   gcc  
csky                 randconfig-r012-20230627   gcc  
hexagon              randconfig-r023-20230627   clang
hexagon              randconfig-r025-20230627   clang
hexagon              randconfig-r026-20230627   clang
hexagon              randconfig-r032-20230627   clang
hexagon              randconfig-r034-20230627   clang
hexagon              randconfig-r041-20230627   clang
hexagon              randconfig-r045-20230627   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230627   gcc  
i386         buildonly-randconfig-r005-20230627   gcc  
i386         buildonly-randconfig-r006-20230627   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230627   gcc  
i386                 randconfig-i002-20230627   gcc  
i386                 randconfig-i003-20230627   gcc  
i386                 randconfig-i004-20230627   gcc  
i386                 randconfig-i005-20230627   gcc  
i386                 randconfig-i006-20230627   gcc  
i386                 randconfig-i011-20230627   clang
i386                 randconfig-i012-20230627   clang
i386                 randconfig-i013-20230627   clang
i386                 randconfig-i014-20230627   clang
i386                 randconfig-i015-20230627   clang
i386                 randconfig-i016-20230627   clang
i386                 randconfig-r026-20230627   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r033-20230627   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r003-20230627   gcc  
m68k                 randconfig-r015-20230627   gcc  
m68k                 randconfig-r034-20230627   gcc  
microblaze           randconfig-r011-20230627   gcc  
microblaze           randconfig-r013-20230627   gcc  
microblaze           randconfig-r021-20230627   gcc  
microblaze           randconfig-r023-20230627   gcc  
microblaze           randconfig-r031-20230627   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                           ci20_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                 randconfig-r002-20230627   clang
mips                 randconfig-r011-20230627   gcc  
mips                 randconfig-r025-20230627   gcc  
mips                 randconfig-r026-20230627   gcc  
mips                 randconfig-r035-20230627   clang
nios2                               defconfig   gcc  
nios2                randconfig-r004-20230627   gcc  
nios2                randconfig-r012-20230627   gcc  
nios2                randconfig-r016-20230627   gcc  
nios2                randconfig-r032-20230627   gcc  
nios2                randconfig-r035-20230627   gcc  
openrisc             randconfig-r003-20230627   gcc  
openrisc             randconfig-r021-20230627   gcc  
openrisc             randconfig-r024-20230627   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r015-20230627   gcc  
parisc               randconfig-r026-20230627   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                 mpc832x_rdb_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc              randconfig-r001-20230627   gcc  
powerpc              randconfig-r015-20230627   clang
powerpc              randconfig-r032-20230627   gcc  
powerpc                    sam440ep_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r001-20230627   gcc  
riscv                randconfig-r004-20230627   gcc  
riscv                randconfig-r014-20230627   clang
riscv                randconfig-r023-20230627   clang
riscv                randconfig-r042-20230627   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                          debug_defconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r002-20230627   gcc  
s390                 randconfig-r012-20230627   clang
s390                 randconfig-r013-20230627   clang
s390                 randconfig-r014-20230627   clang
s390                 randconfig-r016-20230627   clang
s390                 randconfig-r032-20230627   gcc  
s390                 randconfig-r044-20230627   clang
sh                               allmodconfig   gcc  
sh                        edosk7705_defconfig   gcc  
sh                   randconfig-r014-20230627   gcc  
sh                   randconfig-r024-20230627   gcc  
sh                          rsk7264_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230627   gcc  
sparc                randconfig-r022-20230627   gcc  
sparc                randconfig-r024-20230627   gcc  
sparc64              randconfig-r005-20230627   gcc  
sparc64              randconfig-r033-20230627   gcc  
sparc64              randconfig-r035-20230627   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r013-20230627   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230627   gcc  
x86_64       buildonly-randconfig-r002-20230627   gcc  
x86_64       buildonly-randconfig-r003-20230627   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230627   gcc  
x86_64               randconfig-r025-20230627   clang
x86_64               randconfig-r031-20230627   gcc  
x86_64               randconfig-x001-20230627   clang
x86_64               randconfig-x002-20230627   clang
x86_64               randconfig-x003-20230627   clang
x86_64               randconfig-x004-20230627   clang
x86_64               randconfig-x005-20230627   clang
x86_64               randconfig-x006-20230627   clang
x86_64               randconfig-x011-20230627   gcc  
x86_64               randconfig-x012-20230627   gcc  
x86_64               randconfig-x013-20230627   gcc  
x86_64               randconfig-x014-20230627   gcc  
x86_64               randconfig-x015-20230627   gcc  
x86_64               randconfig-x016-20230627   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230627   gcc  
xtensa               randconfig-r022-20230627   gcc  
xtensa               randconfig-r023-20230627   gcc  
xtensa               randconfig-r033-20230627   gcc  
xtensa               randconfig-r036-20230627   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
