Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E67DE2B73E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 02:50:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbQkc7544zDqZn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 12:50:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbQfv27sbzDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 12:47:33 +1100 (AEDT)
IronPort-SDR: jW8/IwM/Vx2LS7gqTJOUwxJD4CxDOJniKlLwz+EKmg45IaqZ4nXAsgG+wjxnghVCvcE9x82K9/
 Q8tDaCQ2YXtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="150895608"
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="150895608"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 17:47:28 -0800
IronPort-SDR: NkYfaTLn8X9nYE46NCVjmoooQOPHJZlEXB36irZaaHX0o++JMfw0ymB4iDE7GwNHj3RkjcRZ1r
 irWRPVALwtJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,486,1596524400"; d="scan'208";a="330285021"
Received: from lkp-server01.sh.intel.com (HELO d102174a0e0d) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 17 Nov 2020 17:47:26 -0800
Received: from kbuild by d102174a0e0d with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kfCZB-0000Es-QE; Wed, 18 Nov 2020 01:47:25 +0000
Date: Wed, 18 Nov 2020 09:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 e02152ba2810f7c88cb54e71cda096268dfa9241
Message-ID: <5fb47d1c.dZwTDI4ynmyHvMib%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes-test
branch HEAD: e02152ba2810f7c88cb54e71cda096268dfa9241  powerpc: Drop -me200 addition to build flags

elapsed time: 860m

configs tested: 194
configs skipped: 103

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           efm32_defconfig
powerpc                    sam440ep_defconfig
arm                       imx_v4_v5_defconfig
mips                         tb0219_defconfig
um                           x86_64_defconfig
powerpc                 mpc8315_rdb_defconfig
h8300                     edosk2674_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                               j2_defconfig
sparc                       sparc64_defconfig
mips                       bmips_be_defconfig
ia64                            zx1_defconfig
powerpc                 mpc836x_rdk_defconfig
xtensa                generic_kc705_defconfig
powerpc                     tqm8540_defconfig
sh                          rsk7201_defconfig
nios2                         10m50_defconfig
powerpc                       eiger_defconfig
m68k                        mvme147_defconfig
xtensa                          iss_defconfig
mips                           ci20_defconfig
c6x                        evmc6678_defconfig
m68k                        m5407c3_defconfig
arc                 nsimosci_hs_smp_defconfig
ia64                      gensparse_defconfig
powerpc64                        alldefconfig
mips                malta_kvm_guest_defconfig
powerpc                     redwood_defconfig
arm                        cerfcube_defconfig
arc                              alldefconfig
sh                            hp6xx_defconfig
i386                             alldefconfig
xtensa                    smp_lx200_defconfig
parisc                generic-32bit_defconfig
s390                       zfcpdump_defconfig
openrisc                         alldefconfig
powerpc                 xes_mpc85xx_defconfig
arc                         haps_hs_defconfig
arc                    vdk_hs38_smp_defconfig
arm                          pxa910_defconfig
sh                           se7751_defconfig
sh                        sh7785lcr_defconfig
mips                       lemote2f_defconfig
sh                          sdk7786_defconfig
powerpc                     tqm8555_defconfig
powerpc                     tqm8560_defconfig
arm                         orion5x_defconfig
mips                             allyesconfig
powerpc                      mgcoge_defconfig
mips                           mtx1_defconfig
m68k                             allmodconfig
sh                          landisk_defconfig
sh                         apsh4a3a_defconfig
powerpc                        warp_defconfig
arm                            u300_defconfig
arm                      tct_hammer_defconfig
c6x                         dsk6455_defconfig
csky                             alldefconfig
sparc64                             defconfig
arm                           viper_defconfig
powerpc                    amigaone_defconfig
mips                  maltasmvp_eva_defconfig
mips                      bmips_stb_defconfig
arm                     am200epdkit_defconfig
c6x                              allyesconfig
arm                       mainstone_defconfig
xtensa                       common_defconfig
arm                        neponset_defconfig
mips                          rb532_defconfig
h8300                    h8300h-sim_defconfig
arc                          axs103_defconfig
arc                                 defconfig
arm                            zeus_defconfig
arm                        clps711x_defconfig
sh                         ap325rxa_defconfig
mips                     cu1000-neo_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          iop32x_defconfig
mips                      loongson3_defconfig
powerpc                     stx_gp3_defconfig
arc                     nsimosci_hs_defconfig
powerpc                   lite5200b_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
arm                           sunxi_defconfig
s390                          debug_defconfig
sh                            titan_defconfig
arm                        oxnas_v6_defconfig
arm                         lpc18xx_defconfig
powerpc                    klondike_defconfig
arm                          prima2_defconfig
sparc64                          alldefconfig
mips                 decstation_r4k_defconfig
arm                          imote2_defconfig
mips                        workpad_defconfig
powerpc                     ppa8548_defconfig
mips                         cobalt_defconfig
microblaze                    nommu_defconfig
csky                                defconfig
mips                         mpc30x_defconfig
riscv                               defconfig
powerpc                     skiroot_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20201117
i386                 randconfig-a005-20201117
i386                 randconfig-a001-20201117
i386                 randconfig-a002-20201117
i386                 randconfig-a004-20201117
i386                 randconfig-a003-20201117
i386                 randconfig-a006-20201116
i386                 randconfig-a005-20201116
i386                 randconfig-a001-20201116
i386                 randconfig-a002-20201116
i386                 randconfig-a004-20201116
i386                 randconfig-a003-20201116
x86_64               randconfig-a015-20201115
x86_64               randconfig-a011-20201115
x86_64               randconfig-a014-20201115
x86_64               randconfig-a013-20201115
x86_64               randconfig-a016-20201115
x86_64               randconfig-a012-20201115
x86_64               randconfig-a003-20201116
x86_64               randconfig-a005-20201116
x86_64               randconfig-a004-20201116
x86_64               randconfig-a002-20201116
x86_64               randconfig-a001-20201116
x86_64               randconfig-a006-20201116
i386                 randconfig-a012-20201116
i386                 randconfig-a014-20201116
i386                 randconfig-a016-20201116
i386                 randconfig-a011-20201116
i386                 randconfig-a015-20201116
i386                 randconfig-a013-20201116
i386                 randconfig-a012-20201117
i386                 randconfig-a014-20201117
i386                 randconfig-a016-20201117
i386                 randconfig-a011-20201117
i386                 randconfig-a015-20201117
i386                 randconfig-a013-20201117
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20201117
x86_64               randconfig-a005-20201117
x86_64               randconfig-a004-20201117
x86_64               randconfig-a002-20201117
x86_64               randconfig-a001-20201117
x86_64               randconfig-a006-20201117
x86_64               randconfig-a015-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a012-20201116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
