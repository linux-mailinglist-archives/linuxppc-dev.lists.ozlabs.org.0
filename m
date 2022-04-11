Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 094634FB154
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 03:24:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcB3D0Gmtz3bcp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 11:24:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aNreVGIB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aNreVGIB; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcB2X40Bdz2xVY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 11:23:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649640228; x=1681176228;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=XSdpUF4Re7aDQE62bFN6P1Dw3K5lDQ7CvfEtxqllw3I=;
 b=aNreVGIBFIs2lEKTRbfoM/aNwiifwVKPy7d1Pn3D9SYxjBI+9VL4HRVI
 t8fucl3cJ4aptG/ktBaS7aYcMBV2I0N2sHE0GhUcGOoAAMu+fA/Uf1pTX
 fRx3TE/bw6u1dsYakbMtjFH4zo6z+P9RjadUERSg/xkPyO1Q+fGko1FGV
 E4EtLU3CXSdkkKffZpvBnyVVFGa1erjiZ97ifALmvX3vieWiJzHpBcM5m
 aAOf5BXQaU6fiFlhU1Uk189Ovg1K8XKRm5+xtpmmH2p/MMSN/fiAA28I4
 bz38MV6KacdbZ2KKt1Z5rEwKQKb+DMXpd9beanp6Rf17JnuuRvlwVeZjt g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261754427"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; d="scan'208";a="261754427"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2022 18:22:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; d="scan'208";a="506910662"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 10 Apr 2022 18:22:37 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ndilI-0001EB-Cs;
 Mon, 11 Apr 2022 01:22:36 +0000
Date: Mon, 11 Apr 2022 09:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 80a1583efa182af91e6a278e82b5431ec9fc8282
Message-ID: <6253829d.4Y/FzLw2xk2jpB7e%lkp@intel.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 80a1583efa182af91e6a278e82b5431ec9fc8282  Automatic merge of 'fixes' into merge (2022-04-10 22:29)

elapsed time: 726m

configs tested: 167
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm64                               defconfig
powerpc              randconfig-c003-20220410
i386                          randconfig-c001
sh                          urquell_defconfig
powerpc                 mpc8540_ads_defconfig
mips                         tb0226_defconfig
arc                        nsimosci_defconfig
arm                        realview_defconfig
m68k                       bvme6000_defconfig
sh                        edosk7705_defconfig
xtensa                         virt_defconfig
powerpc                     taishan_defconfig
powerpc                   currituck_defconfig
nios2                            alldefconfig
m68k                         apollo_defconfig
powerpc                    adder875_defconfig
arm                           imxrt_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      chrp32_defconfig
powerpc                      pasemi_defconfig
s390                                defconfig
powerpc                   motionpro_defconfig
arm                          badge4_defconfig
powerpc                      ppc40x_defconfig
arm                            zeus_defconfig
x86_64                              defconfig
arm                        oxnas_v6_defconfig
sparc                       sparc64_defconfig
sh                   sh7724_generic_defconfig
arm                           h3600_defconfig
arm                       multi_v4t_defconfig
arm                          pxa910_defconfig
powerpc                     tqm8541_defconfig
mips                       capcella_defconfig
nios2                               defconfig
m68k                        mvme16x_defconfig
xtensa                          iss_defconfig
mips                  maltasmvp_eva_defconfig
m68k                       m5249evb_defconfig
xtensa                              defconfig
arm                            xcep_defconfig
sh                         ecovec24_defconfig
h8300                            allyesconfig
m68k                       m5275evb_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                          r7780mp_defconfig
xtensa                    smp_lx200_defconfig
sh                           se7619_defconfig
mips                             allyesconfig
sh                            hp6xx_defconfig
arm                  randconfig-c002-20220411
arm                  randconfig-c002-20220410
i386                 randconfig-c001-20220411
x86_64               randconfig-c001-20220411
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
arc                              allyesconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                 randconfig-a015-20220411
i386                 randconfig-a011-20220411
i386                 randconfig-a016-20220411
i386                 randconfig-a012-20220411
i386                 randconfig-a013-20220411
i386                 randconfig-a014-20220411
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220410
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
hexagon                          alldefconfig
powerpc                    mvme5100_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                     kmeter1_defconfig
powerpc                      acadia_defconfig
arm                             mxs_defconfig
arm                       netwinder_defconfig
arm                      pxa255-idp_defconfig
mips                         tb0219_defconfig
mips                      bmips_stb_defconfig
arm                  colibri_pxa300_defconfig
mips                           rs90_defconfig
mips                         tb0287_defconfig
arm                       imx_v4_v5_defconfig
arm                          moxart_defconfig
mips                   sb1250_swarm_defconfig
mips                          malta_defconfig
powerpc                 mpc8272_ads_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a004-20220411
i386                 randconfig-a001-20220411
i386                 randconfig-a003-20220411
i386                 randconfig-a005-20220411
i386                 randconfig-a006-20220411
i386                 randconfig-a002-20220411
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a003-20220411
x86_64               randconfig-a004-20220411
x86_64               randconfig-a006-20220411
x86_64               randconfig-a001-20220411
x86_64               randconfig-a002-20220411
x86_64               randconfig-a005-20220411
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220410
hexagon              randconfig-r041-20220410
hexagon              randconfig-r045-20220410
hexagon              randconfig-r041-20220411
hexagon              randconfig-r045-20220411
s390                 randconfig-r044-20220410

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
