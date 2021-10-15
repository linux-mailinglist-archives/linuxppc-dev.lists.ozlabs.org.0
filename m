Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF2242E683
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 04:28:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVqvM6F32z3bWT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 13:28:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVqtw2RKqz2xtN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 13:28:06 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="208638526"
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; d="scan'208";a="208638526"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 19:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,374,1624345200"; d="scan'208";a="660220393"
Received: from lkp-server02.sh.intel.com (HELO 08b2c502c3de) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 14 Oct 2021 19:27:02 -0700
Received: from kbuild by 08b2c502c3de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mbCw1-000736-CS; Fri, 15 Oct 2021 02:27:01 +0000
Date: Fri, 15 Oct 2021 10:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 6f779e1d359b8d5801f677c1d49dcfa10bf95674
Message-ID: <6168e6b9.RvqDB+5J277M6kEu%lkp@intel.com>
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
branch HEAD: 6f779e1d359b8d5801f677c1d49dcfa10bf95674  powerpc/xive: Discard disabled interrupts in get_irqchip_state()

elapsed time: 728m

configs tested: 99
configs skipped: 94

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
i386                 randconfig-c001-20211014
arm                            zeus_defconfig
sh                           se7206_defconfig
sh                         ap325rxa_defconfig
arm                            qcom_defconfig
arc                      axs103_smp_defconfig
powerpc                   currituck_defconfig
mips                  decstation_64_defconfig
powerpc                     skiroot_defconfig
mips                        workpad_defconfig
mips                     loongson2k_defconfig
arc                     haps_hs_smp_defconfig
m68k                          atari_defconfig
um                                  defconfig
powerpc                      tqm8xx_defconfig
powerpc                    adder875_defconfig
arc                        nsim_700_defconfig
powerpc                     tqm8541_defconfig
nios2                         3c120_defconfig
mips                      fuloong2e_defconfig
powerpc                        warp_defconfig
openrisc                    or1ksim_defconfig
powerpc                    ge_imp3a_defconfig
powerpc                   lite5200b_defconfig
powerpc                     sequoia_defconfig
arm                  randconfig-c002-20211014
x86_64               randconfig-c001-20211014
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20211014
i386                 randconfig-a001-20211014
i386                 randconfig-a005-20211014
i386                 randconfig-a004-20211014
i386                 randconfig-a002-20211014
i386                 randconfig-a006-20211014
x86_64               randconfig-a006-20211014
x86_64               randconfig-a004-20211014
x86_64               randconfig-a001-20211014
x86_64               randconfig-a005-20211014
x86_64               randconfig-a002-20211014
x86_64               randconfig-a003-20211014
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20211014
i386                 randconfig-c001-20211014
s390                 randconfig-c005-20211014
x86_64               randconfig-c007-20211014
powerpc              randconfig-c003-20211014
riscv                randconfig-c006-20211014
x86_64               randconfig-a012-20211014
x86_64               randconfig-a015-20211014
x86_64               randconfig-a016-20211014
x86_64               randconfig-a014-20211014
x86_64               randconfig-a011-20211014
x86_64               randconfig-a013-20211014
i386                 randconfig-a016-20211014
i386                 randconfig-a014-20211014
i386                 randconfig-a011-20211014
i386                 randconfig-a015-20211014
i386                 randconfig-a012-20211014
i386                 randconfig-a013-20211014
hexagon              randconfig-r041-20211014
s390                 randconfig-r044-20211014
riscv                randconfig-r042-20211014
hexagon              randconfig-r045-20211014

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
