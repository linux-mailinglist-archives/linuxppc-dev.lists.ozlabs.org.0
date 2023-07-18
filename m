Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C6757257
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 05:32:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nvoKH5jQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4kzf2hsDz3cNB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 13:32:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nvoKH5jQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4kxp60Ysz2yVX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 13:31:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689651071; x=1721187071;
  h=date:from:to:cc:subject:message-id;
  bh=Ph9GxNEod2jOPXICsQGIMp+9NbItF2loBM/zX2PwFwk=;
  b=nvoKH5jQLB8Fm6DzebIRdweob5nRvyCgEHhwzcTDsKf+vBqJ3MwQ/3QA
   y2R5bZvk/NEiICGslaKSEeONkRlXGUguJrGFLRr5plNTDcPuciVTiqAMt
   ceH2yMNzoqEQwo4y5cGNCQn9TuMVzOvrJjQI/adWV3t+DGYkb0MprnhpN
   pL75sZ7bdkFbSsqt63OFiuvOwOL7txD3rssm+9SuqiDLmuAjibNvme7A6
   LCTlIDza6wAWHZPeLf2NdwehD0bc0pri0jNWOx+esOPXpoxVfjXbiwYiP
   CrALYYLvQgkVYnO93nUCYH5kishjtbZJt9FWkgA8YPDl6W+Wv65RujdCS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="350960306"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="350960306"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 20:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="847550411"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="847550411"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 17 Jul 2023 20:30:47 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLbQE-00009Z-1e;
	Tue, 18 Jul 2023 03:30:46 +0000
Date: Tue, 18 Jul 2023 11:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 7c5878b16f9cd959e232169b967be5b2a0897afa
Message-ID: <202307181108.Rbab0nFp-lkp@intel.com>
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
branch HEAD: 7c5878b16f9cd959e232169b967be5b2a0897afa  Automatic merge of 'master' into merge (2023-07-17 08:46)

elapsed time: 1545m

configs tested: 175
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc                          axs101_defconfig   gcc  
arc                                 defconfig   gcc  
arc                            hsdk_defconfig   gcc  
arc                  randconfig-r012-20230717   gcc  
arc                  randconfig-r043-20230717   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                       aspeed_g5_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                         orion5x_defconfig   clang
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r006-20230717   gcc  
arm                  randconfig-r046-20230717   clang
arm                        realview_defconfig   gcc  
arm                           sama5_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r001-20230717   clang
arm64                randconfig-r002-20230717   clang
arm64                randconfig-r005-20230717   clang
arm64                randconfig-r014-20230717   gcc  
arm64                randconfig-r034-20230717   clang
arm64                randconfig-r035-20230717   clang
csky                                defconfig   gcc  
csky                 randconfig-r004-20230717   gcc  
csky                 randconfig-r013-20230717   gcc  
csky                 randconfig-r023-20230717   gcc  
hexagon              randconfig-r041-20230717   clang
hexagon              randconfig-r045-20230717   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230717   clang
i386         buildonly-randconfig-r005-20230717   clang
i386         buildonly-randconfig-r006-20230717   clang
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230717   clang
i386                 randconfig-i002-20230717   clang
i386                 randconfig-i003-20230717   clang
i386                 randconfig-i004-20230717   clang
i386                 randconfig-i005-20230717   clang
i386                 randconfig-i006-20230717   clang
i386                 randconfig-i011-20230717   gcc  
i386                 randconfig-i012-20230717   gcc  
i386                 randconfig-i013-20230717   gcc  
i386                 randconfig-i014-20230717   gcc  
i386                 randconfig-i015-20230717   gcc  
i386                 randconfig-i016-20230717   gcc  
i386                 randconfig-r016-20230717   gcc  
i386                 randconfig-r025-20230717   gcc  
i386                 randconfig-r034-20230717   clang
i386                 randconfig-r035-20230717   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230717   gcc  
loongarch            randconfig-r036-20230717   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5272c3_defconfig   gcc  
m68k                 randconfig-r015-20230717   gcc  
m68k                        stmark2_defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm47xx_defconfig   gcc  
mips                      fuloong2e_defconfig   gcc  
mips                          malta_defconfig   clang
mips                malta_qemu_32r6_defconfig   clang
mips                  maltasmvp_eva_defconfig   gcc  
mips                        omega2p_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r021-20230717   clang
mips                 randconfig-r033-20230717   gcc  
nios2                               defconfig   gcc  
openrisc                            defconfig   gcc  
openrisc             randconfig-r005-20230717   gcc  
openrisc             randconfig-r012-20230717   gcc  
openrisc             randconfig-r021-20230717   gcc  
openrisc             randconfig-r024-20230717   gcc  
openrisc             randconfig-r031-20230717   gcc  
openrisc             randconfig-r032-20230717   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                generic-32bit_defconfig   gcc  
parisc               randconfig-r001-20230717   gcc  
parisc               randconfig-r016-20230717   gcc  
parisc               randconfig-r032-20230717   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     asp8347_defconfig   gcc  
powerpc                      chrp32_defconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                      katmai_defconfig   clang
powerpc                     ksi8560_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                      pasemi_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc                      ppc44x_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc              randconfig-r026-20230717   gcc  
powerpc                     redwood_defconfig   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230717   clang
riscv                randconfig-r033-20230717   clang
riscv                randconfig-r042-20230717   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r015-20230717   gcc  
s390                 randconfig-r022-20230717   gcc  
s390                 randconfig-r025-20230717   gcc  
s390                 randconfig-r044-20230717   gcc  
sh                               allmodconfig   gcc  
sh                         ap325rxa_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                   randconfig-r002-20230717   gcc  
sh                      rts7751r2d1_defconfig   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                   sh7724_generic_defconfig   gcc  
sh                          urquell_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r022-20230717   gcc  
sparc                randconfig-r024-20230717   gcc  
sparc                randconfig-r026-20230717   gcc  
sparc                randconfig-r036-20230717   gcc  
sparc64              randconfig-r003-20230717   gcc  
sparc64              randconfig-r011-20230717   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r031-20230717   gcc  
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230717   clang
x86_64       buildonly-randconfig-r002-20230717   clang
x86_64       buildonly-randconfig-r003-20230717   clang
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r023-20230717   gcc  
x86_64               randconfig-x001-20230717   gcc  
x86_64               randconfig-x002-20230717   gcc  
x86_64               randconfig-x003-20230717   gcc  
x86_64               randconfig-x004-20230717   gcc  
x86_64               randconfig-x005-20230717   gcc  
x86_64               randconfig-x006-20230717   gcc  
x86_64               randconfig-x011-20230717   clang
x86_64               randconfig-x012-20230717   clang
x86_64               randconfig-x013-20230717   clang
x86_64               randconfig-x014-20230717   clang
x86_64               randconfig-x015-20230717   clang
x86_64               randconfig-x016-20230717   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                           alldefconfig   gcc  
xtensa                generic_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
