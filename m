Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B133CBA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 03:56:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzybQ2KHNz3bsN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 13:56:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzyZM2CTSz2yxZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 13:55:07 +1100 (AEDT)
IronPort-SDR: vdLPwYVWgeq1ZH+iFIWtw6hambMXzHrd/JOAXWnRWAJudpQcAeX7nigJjlgzH/1U0d8zKWG/+3
 k5bDO2yfgoTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="168462900"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="168462900"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 19:54:58 -0700
IronPort-SDR: Vzy2uE2xiEfU21WHiV6WNHe09iTYfM+uD4aEY5FdE50HViQWDDoy0DLD2R3HlUzQGZLxn9qm4Q
 xIRzEHLewBnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="371835312"
Received: from lkp-server02.sh.intel.com (HELO 1dc5e1a854f4) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 15 Mar 2021 19:54:57 -0700
Received: from kbuild by 1dc5e1a854f4 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lLzrE-0000km-Bh; Tue, 16 Mar 2021 02:54:56 +0000
Date: Tue, 16 Mar 2021 10:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 eed5fae00593ab9d261a0c1ffc1bdb786a87a55a
Message-ID: <60501de0.aBe/PmH8lSQrhu5x%lkp@intel.com>
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
branch HEAD: eed5fae00593ab9d261a0c1ffc1bdb786a87a55a  powerpc: Force inlining of cpu_has_feature() to avoid build failure

elapsed time: 2398m

configs tested: 187
configs skipped: 97

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
h8300                     edosk2674_defconfig
powerpc                    amigaone_defconfig
powerpc                 linkstation_defconfig
m68k                        m5407c3_defconfig
arc                 nsimosci_hs_smp_defconfig
openrisc                 simple_smp_defconfig
sh                                  defconfig
sh                               alldefconfig
powerpc                     taishan_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                      loongson3_defconfig
openrisc                         alldefconfig
sparc64                             defconfig
m68k                            mac_defconfig
arm                         orion5x_defconfig
mips                        bcm63xx_defconfig
sh                           se7705_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7264_defconfig
xtensa                       common_defconfig
arm                            zeus_defconfig
powerpc                    socrates_defconfig
m68k                        mvme16x_defconfig
riscv                    nommu_virt_defconfig
arc                           tb10x_defconfig
s390                             alldefconfig
sh                           se7722_defconfig
powerpc                      cm5200_defconfig
h8300                            alldefconfig
mips                      maltaaprp_defconfig
mips                         rt305x_defconfig
mips                           xway_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     tqm8555_defconfig
powerpc                     tqm8541_defconfig
sh                          polaris_defconfig
sh                             espt_defconfig
arm                           stm32_defconfig
arm                         s5pv210_defconfig
arm                       aspeed_g4_defconfig
mips                        workpad_defconfig
mips                          rm200_defconfig
powerpc                      ppc44x_defconfig
sh                            titan_defconfig
m68k                          sun3x_defconfig
mips                        jmr3927_defconfig
sh                         ecovec24_defconfig
sh                         ap325rxa_defconfig
mips                     cu1000-neo_defconfig
arm                       versatile_defconfig
arm                         lpc32xx_defconfig
sh                            shmin_defconfig
mips                           ip32_defconfig
arm                            qcom_defconfig
ia64                                defconfig
mips                            gpr_defconfig
mips                  decstation_64_defconfig
powerpc                      tqm8xx_defconfig
xtensa                         virt_defconfig
arm                     eseries_pxa_defconfig
m68k                       bvme6000_defconfig
powerpc                     rainier_defconfig
parisc                generic-32bit_defconfig
arm                        mini2440_defconfig
i386                                defconfig
powerpc                     kmeter1_defconfig
powerpc                     mpc5200_defconfig
mips                      fuloong2e_defconfig
parisc                generic-64bit_defconfig
arm                            hisi_defconfig
powerpc                 mpc836x_mds_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7712_defconfig
powerpc                     mpc512x_defconfig
ia64                             alldefconfig
csky                                defconfig
arc                              alldefconfig
arm                           viper_defconfig
mips                       lemote2f_defconfig
arc                        nsimosci_defconfig
powerpc                 mpc837x_rdb_defconfig
parisc                              defconfig
openrisc                            defconfig
powerpc                  storcenter_defconfig
microblaze                      mmu_defconfig
mips                           ip22_defconfig
sh                        edosk7760_defconfig
arc                    vdk_hs38_smp_defconfig
arm                         s3c2410_defconfig
powerpc                   motionpro_defconfig
arm                           h3600_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          g5_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210315
x86_64               randconfig-a001-20210315
x86_64               randconfig-a005-20210315
x86_64               randconfig-a004-20210315
x86_64               randconfig-a002-20210315
x86_64               randconfig-a003-20210315
i386                 randconfig-a001-20210314
i386                 randconfig-a005-20210314
i386                 randconfig-a003-20210314
i386                 randconfig-a002-20210314
i386                 randconfig-a004-20210314
i386                 randconfig-a006-20210314
i386                 randconfig-a001-20210315
i386                 randconfig-a005-20210315
i386                 randconfig-a003-20210315
i386                 randconfig-a002-20210315
i386                 randconfig-a004-20210315
i386                 randconfig-a006-20210315
x86_64               randconfig-a011-20210314
x86_64               randconfig-a016-20210314
x86_64               randconfig-a013-20210314
x86_64               randconfig-a015-20210314
x86_64               randconfig-a014-20210314
x86_64               randconfig-a012-20210314
i386                 randconfig-a013-20210314
i386                 randconfig-a016-20210314
i386                 randconfig-a011-20210314
i386                 randconfig-a012-20210314
i386                 randconfig-a014-20210314
i386                 randconfig-a015-20210314
i386                 randconfig-a013-20210315
i386                 randconfig-a016-20210315
i386                 randconfig-a011-20210315
i386                 randconfig-a012-20210315
i386                 randconfig-a014-20210315
i386                 randconfig-a015-20210315
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210314
x86_64               randconfig-a001-20210314
x86_64               randconfig-a005-20210314
x86_64               randconfig-a004-20210314
x86_64               randconfig-a002-20210314
x86_64               randconfig-a003-20210314
x86_64               randconfig-a016-20210315
x86_64               randconfig-a015-20210315
x86_64               randconfig-a014-20210315
x86_64               randconfig-a011-20210315
x86_64               randconfig-a013-20210315
x86_64               randconfig-a012-20210315

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
