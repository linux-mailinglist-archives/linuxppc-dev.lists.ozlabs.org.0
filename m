Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A63DF952
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 03:38:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfZBt1nmHz3d8B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 11:38:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfZBW31JNz2ysv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 11:38:09 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="194106438"
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="194106438"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2021 18:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,293,1620716400"; d="scan'208";a="667624603"
Received: from lkp-server01.sh.intel.com (HELO d053b881505b) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2021 18:37:05 -0700
Received: from kbuild by d053b881505b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mB5qC-000ETI-Rm; Wed, 04 Aug 2021 01:37:04 +0000
Date: Wed, 04 Aug 2021 09:36:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS a6cae77f1bc89368a4e2822afcddc45c3062d499
Message-ID: <6109ef1e.JRgrcabFgHGXco8j%lkp@intel.com>
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
branch HEAD: a6cae77f1bc89368a4e2822afcddc45c3062d499  powerpc/stacktrace: Include linux/delay.h

elapsed time: 725m

configs tested: 154
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210803
mips                           ip28_defconfig
arm                        cerfcube_defconfig
arm                        neponset_defconfig
arc                        nsimosci_defconfig
arm                         hackkit_defconfig
powerpc                      obs600_defconfig
m68k                          atari_defconfig
mips                           rs90_defconfig
mips                        jmr3927_defconfig
mips                           ip32_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                         s3c6400_defconfig
arm                            xcep_defconfig
arm                         vf610m4_defconfig
ia64                             alldefconfig
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
arm                            pleb_defconfig
powerpc                     pseries_defconfig
arm                        trizeps4_defconfig
arm                          imote2_defconfig
arm                            dove_defconfig
h8300                            alldefconfig
sh                           se7619_defconfig
powerpc                   bluestone_defconfig
mips                          rm200_defconfig
powerpc                      ppc64e_defconfig
powerpc                      ppc6xx_defconfig
sh                     sh7710voipgw_defconfig
powerpc                           allnoconfig
x86_64                           alldefconfig
powerpc                     mpc512x_defconfig
openrisc                 simple_smp_defconfig
powerpc                     ppa8548_defconfig
s390                             alldefconfig
sh                           se7343_defconfig
h8300                    h8300h-sim_defconfig
ia64                      gensparse_defconfig
sh                        apsh4ad0a_defconfig
mips                          rb532_defconfig
arc                          axs103_defconfig
sh                           se7722_defconfig
arm                         socfpga_defconfig
mips                         db1xxx_defconfig
powerpc                   lite5200b_defconfig
arm                           omap1_defconfig
sparc                       sparc32_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                       ebony_defconfig
powerpc                      bamboo_defconfig
powerpc                     kilauea_defconfig
mips                        bcm63xx_defconfig
powerpc                 mpc8315_rdb_defconfig
xtensa                generic_kc705_defconfig
mips                           ip27_defconfig
powerpc64                           defconfig
arm                           sama5_defconfig
sh                          sdk7786_defconfig
arc                    vdk_hs38_smp_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
x86_64                            allnoconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a002-20210803
x86_64               randconfig-a004-20210803
x86_64               randconfig-a006-20210803
x86_64               randconfig-a003-20210803
x86_64               randconfig-a001-20210803
x86_64               randconfig-a005-20210803
i386                 randconfig-a004-20210803
i386                 randconfig-a005-20210803
i386                 randconfig-a002-20210803
i386                 randconfig-a006-20210803
i386                 randconfig-a001-20210803
i386                 randconfig-a003-20210803
i386                 randconfig-a004-20210802
i386                 randconfig-a005-20210802
i386                 randconfig-a002-20210802
i386                 randconfig-a006-20210802
i386                 randconfig-a001-20210802
i386                 randconfig-a003-20210802
i386                 randconfig-a005-20210804
i386                 randconfig-a004-20210804
i386                 randconfig-a002-20210804
i386                 randconfig-a006-20210804
i386                 randconfig-a003-20210804
i386                 randconfig-a001-20210804
i386                 randconfig-a012-20210803
i386                 randconfig-a011-20210803
i386                 randconfig-a015-20210803
i386                 randconfig-a013-20210803
i386                 randconfig-a014-20210803
i386                 randconfig-a016-20210803
i386                 randconfig-a012-20210802
i386                 randconfig-a011-20210802
i386                 randconfig-a015-20210802
i386                 randconfig-a013-20210802
i386                 randconfig-a014-20210802
i386                 randconfig-a016-20210802
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
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-c001-20210803
x86_64               randconfig-a012-20210803
x86_64               randconfig-a016-20210803
x86_64               randconfig-a013-20210803
x86_64               randconfig-a011-20210803
x86_64               randconfig-a014-20210803
x86_64               randconfig-a015-20210803

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
