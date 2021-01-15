Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B22F703E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 02:54:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH44Q4vBKzDsZ5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 12:54:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH40v1MWVzDsVR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 12:51:42 +1100 (AEDT)
IronPort-SDR: NIGyrFbIZdquXh3fvzPa81fiSbOC1vQ5pRvOvgAvdEWrWRgq4jqmGmaTtgr7DywmqjJ5xK956l
 Ub2tjnxMZEqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240024020"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="240024020"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 17:51:39 -0800
IronPort-SDR: bY3yav6dEGgqI4OxwefUM/bhrNBfjGNey3Oji1rBXhGk3xiCn8CHaaKLraO8OPtKZJ+/fg8575
 044Z+vs/AvlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; d="scan'208";a="354113688"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 14 Jan 2021 17:51:38 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l0EH1-00004Q-VL; Fri, 15 Jan 2021 01:51:35 +0000
Date: Fri, 15 Jan 2021 09:51:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 56f0e929cb28f6e28e6f88d88c03b75979cf1f40
Message-ID: <6000f519.KV3/8PRl2f68+1DA%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  merge
branch HEAD: 56f0e929cb28f6e28e6f88d88c03b75979cf1f40  Automatic merge of 'fixes' into merge (2021-01-14 15:57)

elapsed time: 725m

configs tested: 134
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                        mvebu_v7_defconfig
mips                        bcm47xx_defconfig
sh                          rsk7201_defconfig
mips                         tb0287_defconfig
s390                          debug_defconfig
openrisc                            defconfig
arc                        nsim_700_defconfig
arm                           sunxi_defconfig
powerpc                     mpc5200_defconfig
arm                       cns3420vb_defconfig
powerpc                       holly_defconfig
mips                      pistachio_defconfig
mips                        nlm_xlr_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      katmai_defconfig
powerpc                       eiger_defconfig
arc                              alldefconfig
m68k                        mvme147_defconfig
um                            kunit_defconfig
arm                            zeus_defconfig
mips                        workpad_defconfig
arm                     eseries_pxa_defconfig
mips                     cu1000-neo_defconfig
mips                         mpc30x_defconfig
mips                      maltasmvp_defconfig
m68k                             alldefconfig
arm                         at91_dt_defconfig
m68k                        m5407c3_defconfig
riscv                          rv32_defconfig
arm                           corgi_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
arm                         assabet_defconfig
arm                        multi_v7_defconfig
sh                           se7750_defconfig
m68k                            q40_defconfig
m68k                       m5475evb_defconfig
arm                       imx_v6_v7_defconfig
arm                           tegra_defconfig
mips                     loongson1b_defconfig
mips                           mtx1_defconfig
arm                        spear3xx_defconfig
arc                          axs103_defconfig
nios2                               defconfig
arm                         cm_x300_defconfig
sh                           se7206_defconfig
powerpc                     tqm8555_defconfig
arm                         lpc32xx_defconfig
sh                           se7722_defconfig
nds32                             allnoconfig
mips                        maltaup_defconfig
csky                             alldefconfig
arm                          iop32x_defconfig
powerpc                     tqm8541_defconfig
sh                         ap325rxa_defconfig
arm                         palmz72_defconfig
s390                             alldefconfig
h8300                    h8300h-sim_defconfig
powerpc                     tqm8540_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210114
i386                 randconfig-a005-20210114
i386                 randconfig-a006-20210114
i386                 randconfig-a001-20210114
i386                 randconfig-a003-20210114
i386                 randconfig-a004-20210114
x86_64               randconfig-a015-20210114
x86_64               randconfig-a012-20210114
x86_64               randconfig-a013-20210114
x86_64               randconfig-a016-20210114
x86_64               randconfig-a014-20210114
x86_64               randconfig-a011-20210114
i386                 randconfig-a012-20210114
i386                 randconfig-a011-20210114
i386                 randconfig-a016-20210114
i386                 randconfig-a015-20210114
i386                 randconfig-a013-20210114
i386                 randconfig-a014-20210114
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210114
x86_64               randconfig-a006-20210114
x86_64               randconfig-a001-20210114
x86_64               randconfig-a003-20210114
x86_64               randconfig-a005-20210114
x86_64               randconfig-a002-20210114

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
