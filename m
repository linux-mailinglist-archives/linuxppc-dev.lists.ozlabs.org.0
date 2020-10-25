Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AF3297FE1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 03:51:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJjCC3GXszDqv9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 13:51:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJj9d2J33zDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Oct 2020 13:49:37 +1100 (AEDT)
IronPort-SDR: kKuOCkFgwf1voVdtkUgeS4qVOVTv9slzdsIgUnGgVg52jpzq4pJXI1qm1oaNVqS1VKdlWBfZgX
 U6H3F2D6clvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9784"; a="147664336"
X-IronPort-AV: E=Sophos;i="5.77,414,1596524400"; d="scan'208";a="147664336"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2020 19:49:34 -0700
IronPort-SDR: kdjQ8HLL965MmBWwgHTl2fRD98POEDyWBMy7N4WdxIdbsCwhYwihPm5PBGLrv5RCTuYZTqwL5j
 ym17qd2FgTkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,414,1596524400"; d="scan'208";a="525116718"
Received: from lkp-server01.sh.intel.com (HELO cda15bb6d7bd) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 24 Oct 2020 19:49:33 -0700
Received: from kbuild by cda15bb6d7bd with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kWW68-0000m0-Dd; Sun, 25 Oct 2020 02:49:32 +0000
Date: Sun, 25 Oct 2020 10:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 29b535f8c5da3984d083068bd651af0631dcdca6
Message-ID: <5f94e795.m6KYMRrdRyFilAaX%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: 29b535f8c5da3984d083068bd651af0631dcdca6  selftests/powerpc/eeh: disable kselftest timeout setting for eeh-basic

elapsed time: 965m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     cu1830-neo_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8272_ads_defconfig
arm                      tct_hammer_defconfig
powerpc                 canyonlands_defconfig
s390                       zfcpdump_defconfig
mips                malta_kvm_guest_defconfig
arm                         hackkit_defconfig
m68k                       m5249evb_defconfig
sh                           se7619_defconfig
sh                            hp6xx_defconfig
h8300                       h8s-sim_defconfig
sh                           se7722_defconfig
powerpc                          allyesconfig
mips                malta_qemu_32r6_defconfig
m68k                          multi_defconfig
powerpc                     mpc5200_defconfig
arm                              zx_defconfig
mips                        bcm47xx_defconfig
xtensa                           alldefconfig
xtensa                  nommu_kc705_defconfig
m68k                        m5407c3_defconfig
powerpc                     pseries_defconfig
arm                           tegra_defconfig
m68k                        m5272c3_defconfig
arm                      jornada720_defconfig
m68k                         apollo_defconfig
arm                            lart_defconfig
m68k                             allmodconfig
powerpc                 mpc834x_mds_defconfig
um                            kunit_defconfig
sh                      rts7751r2d1_defconfig
arm                             pxa_defconfig
mips                         tb0219_defconfig
arm                        shmobile_defconfig
sh                             sh03_defconfig
powerpc                      ppc6xx_defconfig
sparc64                          alldefconfig
arm                        magician_defconfig
arm                             ezx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201024
i386                 randconfig-a003-20201024
i386                 randconfig-a005-20201024
i386                 randconfig-a001-20201024
i386                 randconfig-a006-20201024
i386                 randconfig-a004-20201024
x86_64               randconfig-a013-20201024
x86_64               randconfig-a016-20201024
x86_64               randconfig-a015-20201024
x86_64               randconfig-a012-20201024
x86_64               randconfig-a014-20201024
x86_64               randconfig-a011-20201024
i386                 randconfig-a016-20201024
i386                 randconfig-a015-20201024
i386                 randconfig-a014-20201024
i386                 randconfig-a013-20201024
i386                 randconfig-a012-20201024
i386                 randconfig-a011-20201024
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20201024
x86_64               randconfig-a003-20201024
x86_64               randconfig-a002-20201024
x86_64               randconfig-a006-20201024
x86_64               randconfig-a005-20201024
x86_64               randconfig-a004-20201024

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
