Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75E4D0DFA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 03:24:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCK0m206Nz3bcR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 13:24:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F1U4KBf4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F1U4KBf4; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCK045l4jz30BF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 13:24:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646706262; x=1678242262;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=lW/FdNet4Cb2ve1UKCcNUO61Hi5TWgnAEqmm1kX6h/8=;
 b=F1U4KBf4NrlUtHXQDLELggXQa6QMDIIEuskON/g1YpenyB10J6UST4eG
 k345p5SKB/XcT6n7SM1c5DBobrctaFQoCXPrA1aQTmkhSkCa52jMDM9iC
 7WqxeU6t/m/oNffYcR4UvWG6iYKEkjRF5LFZUUxXj7jtS5CPgUN2ybUWH
 gIwmdKQHY2Uey77wZ/t3lChuadfMVZsZteR7su3ERhABxeGBMG0fkbp2L
 yvSlj7hm1tqg6P16TTpEvM8PYKSGS7s+Kh/84r5CbYSGLAuFpsA1TgpEN
 MGWBMWaVrSIAUdAAkaey4z2joiTAByCgvVT6VXkpTMirm4Ii6aNh+pqLQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254758568"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="254758568"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 18:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="711356674"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 07 Mar 2022 18:23:11 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRPVG-0000s0-F5; Tue, 08 Mar 2022 02:23:10 +0000
Date: Tue, 08 Mar 2022 10:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 48015b632f770c401f3816f144499a39f2884677
Message-ID: <6226bdfd.SuokT/l0MOsX/n3S%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 48015b632f770c401f3816f144499a39f2884677  powerpc: Fix STACKTRACE=n build

elapsed time: 725m

configs tested: 103
configs skipped: 135

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      ep88xc_defconfig
powerpc                     asp8347_defconfig
arm                        realview_defconfig
sh                           se7780_defconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7750_defconfig
sh                             sh03_defconfig
sh                          r7785rp_defconfig
nios2                         3c120_defconfig
powerpc                     ep8248e_defconfig
powerpc                        warp_defconfig
arm                      jornada720_defconfig
arm                        shmobile_defconfig
mips                         tb0226_defconfig
mips                  decstation_64_defconfig
arm                         s3c6400_defconfig
sh                            titan_defconfig
arm                            xcep_defconfig
xtensa                          iss_defconfig
powerpc                  iss476-smp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a003-20220307
i386                 randconfig-a006-20220307
i386                 randconfig-a002-20220307
i386                 randconfig-a001-20220307
x86_64               randconfig-a006-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a005-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a003-20220307
x86_64               randconfig-a002-20220307
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig

clang tested configs:
x86_64               randconfig-c007-20220307
i386                 randconfig-c001-20220307
powerpc              randconfig-c003-20220307
riscv                randconfig-c006-20220308
riscv                randconfig-c006-20220307
powerpc              randconfig-c003-20220308
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
mips                 randconfig-c004-20220307
arm                  randconfig-c002-20220307
s390                 randconfig-c005-20220307
mips                           mtx1_defconfig
mips                     loongson2k_defconfig
arm                         bcm2835_defconfig
powerpc                      ppc44x_defconfig
powerpc                     ksi8560_defconfig
arm                        vexpress_defconfig
hexagon                             defconfig
mips                           ip22_defconfig
i386                 randconfig-a012-20220307
i386                 randconfig-a013-20220307
i386                 randconfig-a015-20220307
i386                 randconfig-a011-20220307
i386                 randconfig-a014-20220307
i386                 randconfig-a016-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
