Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47753365094
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 04:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPSsL2Lnzz3bSk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 12:52:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPSrd6Hg6z2xYk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 12:51:57 +1000 (AEST)
IronPort-SDR: ffgrtpHqMsdm+2zW6XAw2xwFapvS0/Ojw5hhTCeddJZSL+iVC32AitBzGV8sGtuu6ppIyVcXeJ
 Qhzh2uatG1Sg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="216016954"
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="216016954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2021 19:51:55 -0700
IronPort-SDR: kYHrOJNRjYHgP1W/f38B0KZnxcBJ6HbW6bnoJBiYJDSm6ih/jME3JqxIKEMfsN57qRrOn2Owj+
 AWx86kp8LkQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,235,1613462400"; d="scan'208";a="385167286"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 19 Apr 2021 19:51:53 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lYgUS-00024D-PN; Tue, 20 Apr 2021 02:51:52 +0000
Date: Tue, 20 Apr 2021 10:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS cbd3d5ba46b68c033986a6087209930f001cbcca
Message-ID: <607e41a2.fCRjA3fBS2yTn3Os%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: cbd3d5ba46b68c033986a6087209930f001cbcca  powerpc/fadump: Fix compile error since trap type change

elapsed time: 725m

configs tested: 132
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
m68k                          atari_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     kmeter1_defconfig
openrisc                 simple_smp_defconfig
powerpc                     mpc5200_defconfig
powerpc                   motionpro_defconfig
sh                         ap325rxa_defconfig
nds32                             allnoconfig
mips                      pic32mzda_defconfig
sh                      rts7751r2d1_defconfig
xtensa                         virt_defconfig
arm                            mmp2_defconfig
arm                           omap1_defconfig
arm                        multi_v5_defconfig
powerpc                     tqm8540_defconfig
arm64                            alldefconfig
powerpc                        fsp2_defconfig
sh                        dreamcast_defconfig
powerpc                     ppa8548_defconfig
xtensa                  cadence_csp_defconfig
sh                           se7750_defconfig
sh                         apsh4a3a_defconfig
sparc                       sparc32_defconfig
um                               alldefconfig
m68k                        m5272c3_defconfig
um                                allnoconfig
powerpc                      ep88xc_defconfig
powerpc                    socrates_defconfig
sparc                       sparc64_defconfig
arm                        magician_defconfig
m68k                            mac_defconfig
powerpc                 linkstation_defconfig
sh                          sdk7786_defconfig
arm                        vexpress_defconfig
mips                      fuloong2e_defconfig
parisc                generic-64bit_defconfig
mips                        maltaup_defconfig
arm                           h5000_defconfig
powerpc                     mpc83xx_defconfig
m68k                         amcore_defconfig
mips                        jmr3927_defconfig
mips                       capcella_defconfig
powerpc                        warp_defconfig
alpha                            allyesconfig
mips                        bcm47xx_defconfig
mips                         mpc30x_defconfig
powerpc                       ppc64_defconfig
powerpc                     kilauea_defconfig
mips                      maltaaprp_defconfig
arm                        spear3xx_defconfig
sh                           se7751_defconfig
m68k                       m5275evb_defconfig
sh                        sh7785lcr_defconfig
powerpc                        icon_defconfig
arm                          gemini_defconfig
arm                          exynos_defconfig
powerpc                 mpc834x_mds_defconfig
riscv                          rv32_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210419
x86_64               randconfig-a001-20210419
x86_64               randconfig-a005-20210419
x86_64               randconfig-a002-20210419
x86_64               randconfig-a006-20210419
x86_64               randconfig-a004-20210419
i386                 randconfig-a003-20210419
i386                 randconfig-a001-20210419
i386                 randconfig-a006-20210419
i386                 randconfig-a005-20210419
i386                 randconfig-a004-20210419
i386                 randconfig-a002-20210419
i386                 randconfig-a015-20210419
i386                 randconfig-a013-20210419
i386                 randconfig-a014-20210419
i386                 randconfig-a016-20210419
i386                 randconfig-a012-20210419
i386                 randconfig-a011-20210419
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210419
x86_64               randconfig-a015-20210419
x86_64               randconfig-a013-20210419
x86_64               randconfig-a011-20210419
x86_64               randconfig-a012-20210419
x86_64               randconfig-a016-20210419

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
