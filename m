Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB363B8C68
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 04:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFjKP4xxFz3bXh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 12:46:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFjK34YDvz2yP6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 12:46:27 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10031"; a="208282338"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="208282338"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 19:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="447708948"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 30 Jun 2021 19:45:17 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lymhY-000AEQ-L5; Thu, 01 Jul 2021 02:45:16 +0000
Date: Thu, 01 Jul 2021 10:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD REGRESSION
 91fc46eced0f70526d74468ac6c932c90a8585b3
Message-ID: <60dd2c10.CtAfm5ZLKGNoGY2B%lkp@intel.com>
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
branch HEAD: 91fc46eced0f70526d74468ac6c932c90a8585b3  powerpc/64s: move ret_from_fork etc above __end_soft_masked

Error/Warning in current branch:

arch/powerpc/lib/restart_table.c:14:15: error: no previous prototype for function 'search_kernel_restart_table' [-Werror,-Wmissing-prototypes]
arch/powerpc/lib/restart_table.c:14:15: warning: no previous prototype for function 'search_kernel_restart_table' [-Wmissing-prototypes]
arch/powerpc/lib/restart_table.c:22:6: error: no previous prototype for function 'search_kernel_soft_mask_table' [-Werror,-Wmissing-prototypes]
arch/powerpc/lib/restart_table.c:22:6: warning: no previous prototype for function 'search_kernel_soft_mask_table' [-Wmissing-prototypes]

possible Error/Warning in current branch:

arch/powerpc/platforms/pseries/vas.c:186:13: warning: no previous prototype for 'pseries_vas_fault_thread_fn' [-Wmissing-prototypes]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc64-randconfig-r034-20210630
    `-- arch-powerpc-platforms-pseries-vas.c:warning:no-previous-prototype-for-pseries_vas_fault_thread_fn

clang_recent_errors
|-- powerpc-buildonly-randconfig-r003-20210630
|   |-- arch-powerpc-lib-restart_table.c:error:no-previous-prototype-for-function-search_kernel_restart_table-Werror-Wmissing-prototypes
|   `-- arch-powerpc-lib-restart_table.c:error:no-previous-prototype-for-function-search_kernel_soft_mask_table-Werror-Wmissing-prototypes
`-- powerpc-randconfig-r012-20210630
    |-- arch-powerpc-lib-restart_table.c:warning:no-previous-prototype-for-function-search_kernel_restart_table
    `-- arch-powerpc-lib-restart_table.c:warning:no-previous-prototype-for-function-search_kernel_soft_mask_table

elapsed time: 726m

configs tested: 137
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                        workpad_defconfig
arm                         at91_dt_defconfig
sh                           se7712_defconfig
ia64                         bigsur_defconfig
mips                      maltasmvp_defconfig
arm                       aspeed_g4_defconfig
sh                           se7724_defconfig
arm                         s5pv210_defconfig
m68k                        m5272c3_defconfig
ia64                             alldefconfig
m68k                        m5307c3_defconfig
sh                          sdk7786_defconfig
sh                        dreamcast_defconfig
sh                        edosk7705_defconfig
arm                            zeus_defconfig
powerpc                       maple_defconfig
powerpc                 mpc834x_mds_defconfig
arm                          collie_defconfig
sh                           se7721_defconfig
powerpc                 mpc8540_ads_defconfig
parisc                           alldefconfig
mips                         db1xxx_defconfig
sh                          r7785rp_defconfig
mips                           xway_defconfig
powerpc                     sbc8548_defconfig
arc                          axs103_defconfig
sh                          rsk7203_defconfig
mips                        qi_lb60_defconfig
powerpc                        warp_defconfig
arm                           h5000_defconfig
mips                   sb1250_swarm_defconfig
s390                             allyesconfig
arm                         hackkit_defconfig
powerpc                   bluestone_defconfig
mips                       capcella_defconfig
arm                      pxa255-idp_defconfig
powerpc                     pseries_defconfig
mips                       bmips_be_defconfig
powerpc                   currituck_defconfig
mips                          ath25_defconfig
mips                         rt305x_defconfig
sh                           se7705_defconfig
powerpc                        fsp2_defconfig
ia64                          tiger_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 mpc836x_mds_defconfig
arm                             pxa_defconfig
sh                           se7206_defconfig
mips                         mpc30x_defconfig
arc                     nsimosci_hs_defconfig
sh                           se7722_defconfig
powerpc                 canyonlands_defconfig
sh                           se7619_defconfig
sh                        sh7785lcr_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                      tqm8xx_defconfig
nios2                            alldefconfig
mips                     loongson1c_defconfig
sh                           se7343_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
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
powerpc                           allnoconfig
x86_64               randconfig-a002-20210630
x86_64               randconfig-a001-20210630
x86_64               randconfig-a004-20210630
x86_64               randconfig-a005-20210630
x86_64               randconfig-a003-20210630
x86_64               randconfig-a006-20210630
i386                 randconfig-a004-20210630
i386                 randconfig-a001-20210630
i386                 randconfig-a003-20210630
i386                 randconfig-a002-20210630
i386                 randconfig-a005-20210630
i386                 randconfig-a006-20210630
i386                 randconfig-a014-20210630
i386                 randconfig-a011-20210630
i386                 randconfig-a016-20210630
i386                 randconfig-a012-20210630
i386                 randconfig-a013-20210630
i386                 randconfig-a015-20210630
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
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210630
x86_64               randconfig-a012-20210630
x86_64               randconfig-a015-20210630
x86_64               randconfig-a016-20210630
x86_64               randconfig-a013-20210630
x86_64               randconfig-a011-20210630
x86_64               randconfig-a014-20210630

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
