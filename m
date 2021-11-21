Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E145850E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 17:57:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxxQj4Qblz3cbj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 03:57:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HxxPM5D4zz2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 03:56:07 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="233395520"
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; d="scan'208";a="233395520"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 08:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,252,1631602800"; d="scan'208";a="606141360"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 21 Nov 2021 08:54:57 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1moq7F-00071H-4b; Sun, 21 Nov 2021 16:54:57 +0000
Date: Mon, 22 Nov 2021 00:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 478cb53ce5e2d5fd96c2da42d0f9d2b53620881a
Message-ID: <619a79be.j+ySog3pkbndu0fE%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 478cb53ce5e2d5fd96c2da42d0f9d2b53620881a  powerpc/watchdog: read TB close to where it is used

elapsed time: 721m

configs tested: 132
configs skipped: 16

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
mips                      fuloong2e_defconfig
mips                     loongson1b_defconfig
arm                          simpad_defconfig
sh                           se7722_defconfig
sh                          rsk7264_defconfig
sh                               alldefconfig
mips                           ip28_defconfig
sh                          rsk7269_defconfig
powerpc                     rainier_defconfig
powerpc                        warp_defconfig
arm                        oxnas_v6_defconfig
mips                        bcm47xx_defconfig
sh                           se7343_defconfig
sh                        sh7757lcr_defconfig
sh                        edosk7705_defconfig
sh                          lboxre2_defconfig
arm                       netwinder_defconfig
powerpc                     tqm8548_defconfig
arm                        neponset_defconfig
powerpc                         wii_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                          pxa3xx_defconfig
powerpc                      mgcoge_defconfig
powerpc64                           defconfig
powerpc                        fsp2_defconfig
arc                           tb10x_defconfig
powerpc                     tqm8541_defconfig
powerpc                 mpc832x_mds_defconfig
riscv                    nommu_virt_defconfig
arm                            dove_defconfig
mips                      loongson3_defconfig
mips                      maltasmvp_defconfig
sh                        apsh4ad0a_defconfig
sh                          urquell_defconfig
powerpc                    sam440ep_defconfig
mips                     loongson1c_defconfig
powerpc                     tqm8555_defconfig
m68k                           sun3_defconfig
powerpc                        icon_defconfig
powerpc                      pcm030_defconfig
riscv                            allyesconfig
sh                          r7785rp_defconfig
mips                         tb0219_defconfig
openrisc                 simple_smp_defconfig
arm                         orion5x_defconfig
powerpc                     mpc5200_defconfig
sh                      rts7751r2d1_defconfig
s390                       zfcpdump_defconfig
powerpc                    socrates_defconfig
powerpc                 mpc832x_rdb_defconfig
m68k                       bvme6000_defconfig
arm                  randconfig-c002-20211121
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
m68k                                defconfig
nds32                             allnoconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nds32                               defconfig
nios2                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20211121
x86_64               randconfig-a006-20211121
x86_64               randconfig-a003-20211121
x86_64               randconfig-a004-20211121
x86_64               randconfig-a005-20211121
x86_64               randconfig-a002-20211121
i386                 randconfig-a001-20211121
i386                 randconfig-a002-20211121
i386                 randconfig-a005-20211121
i386                 randconfig-a006-20211121
i386                 randconfig-a004-20211121
i386                 randconfig-a003-20211121
arc                  randconfig-r043-20211121
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig

clang tested configs:
i386                 randconfig-c001-20211121
powerpc              randconfig-c003-20211121
x86_64               randconfig-c007-20211121
mips                 randconfig-c004-20211121
s390                 randconfig-c005-20211121
arm                  randconfig-c002-20211121
riscv                randconfig-c006-20211121
x86_64               randconfig-a011-20211121
x86_64               randconfig-a014-20211121
x86_64               randconfig-a012-20211121
x86_64               randconfig-a016-20211121
x86_64               randconfig-a013-20211121
x86_64               randconfig-a015-20211121
i386                 randconfig-a012-20211121
i386                 randconfig-a013-20211121
i386                 randconfig-a014-20211121
i386                 randconfig-a011-20211121
i386                 randconfig-a016-20211121
i386                 randconfig-a015-20211121
hexagon              randconfig-r045-20211121
hexagon              randconfig-r041-20211121
s390                 randconfig-r044-20211121
riscv                randconfig-r042-20211121

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
