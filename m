Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C8433052B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 00:11:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtxzQ1F2tz3d7x
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 10:10:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dtxyl0G5xz3bPZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 10:10:21 +1100 (AEDT)
IronPort-SDR: uvgQhw5i1xuPafRrLQmoEM6OUe9hSHIKIaJbO6TikOGIt42iAujCIwN7rfhWn7XUJQW7JuySJO
 b+hmFvs7WQNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="175048627"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="175048627"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 15:10:18 -0800
IronPort-SDR: ZHWfAdTkUSDrsBkE4ZmwExbvKg+8pQG5GdUHZjhmsgSV0wPrEPr5mIufz3nMfv5hCxd6ZUsjbO
 3T0RnAcH2VGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="587859292"
Received: from lkp-server01.sh.intel.com (HELO 3e992a48ca98) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 07 Mar 2021 15:10:17 -0800
Received: from kbuild by 3e992a48ca98 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lJ2XQ-0000g6-GP; Sun, 07 Mar 2021 23:10:16 +0000
Date: Mon, 08 Mar 2021 07:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 103ebc760cccd96ab1ebc3558881106d48efdcea
Message-ID: <60455d3d./OoInyokQJk8UWkd%lkp@intel.com>
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
branch HEAD: 103ebc760cccd96ab1ebc3558881106d48efdcea  Automatic merge of 'master' into merge (2021-03-07 21:07)

elapsed time: 723m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           ip28_defconfig
mips                       capcella_defconfig
arm                        mini2440_defconfig
arm                           spitz_defconfig
arm                          pxa168_defconfig
mips                           gcw0_defconfig
sh                           se7724_defconfig
arc                        nsim_700_defconfig
powerpc                     mpc83xx_defconfig
mips                  decstation_64_defconfig
arm                        clps711x_defconfig
arc                              allyesconfig
parisc                              defconfig
powerpc                    klondike_defconfig
sh                            titan_defconfig
xtensa                    smp_lx200_defconfig
powerpc                    ge_imp3a_defconfig
arm                       mainstone_defconfig
mips                             allmodconfig
arm                            dove_defconfig
sh                             shx3_defconfig
arc                          axs101_defconfig
powerpc                  mpc866_ads_defconfig
mips                        workpad_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                        maltaup_defconfig
mips                      loongson3_defconfig
powerpc                 mpc834x_itx_defconfig
alpha                            alldefconfig
sh                        sh7763rdp_defconfig
openrisc                 simple_smp_defconfig
arm                         at91_dt_defconfig
powerpc                     powernv_defconfig
csky                             alldefconfig
mips                        nlm_xlr_defconfig
xtensa                       common_defconfig
sh                                  defconfig
sh                           se7722_defconfig
arm                         s5pv210_defconfig
arm                            hisi_defconfig
ia64                         bigsur_defconfig
powerpc                  mpc885_ads_defconfig
sh                          sdk7786_defconfig
arm                     am200epdkit_defconfig
mips                            gpr_defconfig
arm                         cm_x300_defconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                     tqm8555_defconfig
mips                       rbtx49xx_defconfig
arm                          pxa3xx_defconfig
powerpc                      pasemi_defconfig
arc                      axs103_smp_defconfig
powerpc                     tqm8560_defconfig
microblaze                          defconfig
powerpc                   bluestone_defconfig
mips                           ip27_defconfig
xtensa                          iss_defconfig
mips                         tb0226_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
nds32                             allnoconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210307
i386                 randconfig-a003-20210307
i386                 randconfig-a002-20210307
i386                 randconfig-a004-20210307
i386                 randconfig-a006-20210307
i386                 randconfig-a001-20210307
x86_64               randconfig-a013-20210307
x86_64               randconfig-a016-20210307
x86_64               randconfig-a015-20210307
x86_64               randconfig-a014-20210307
x86_64               randconfig-a012-20210307
x86_64               randconfig-a011-20210307
i386                 randconfig-a016-20210308
i386                 randconfig-a012-20210308
i386                 randconfig-a014-20210308
i386                 randconfig-a013-20210308
i386                 randconfig-a011-20210308
i386                 randconfig-a015-20210308
i386                 randconfig-a016-20210307
i386                 randconfig-a012-20210307
i386                 randconfig-a013-20210307
i386                 randconfig-a014-20210307
i386                 randconfig-a011-20210307
i386                 randconfig-a015-20210307
x86_64               randconfig-a006-20210308
x86_64               randconfig-a001-20210308
x86_64               randconfig-a004-20210308
x86_64               randconfig-a002-20210308
x86_64               randconfig-a005-20210308
x86_64               randconfig-a003-20210308
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210307
x86_64               randconfig-a001-20210307
x86_64               randconfig-a004-20210307
x86_64               randconfig-a005-20210307
x86_64               randconfig-a002-20210307
x86_64               randconfig-a003-20210307
x86_64               randconfig-a013-20210308
x86_64               randconfig-a016-20210308
x86_64               randconfig-a015-20210308
x86_64               randconfig-a014-20210308
x86_64               randconfig-a011-20210308
x86_64               randconfig-a012-20210308

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
