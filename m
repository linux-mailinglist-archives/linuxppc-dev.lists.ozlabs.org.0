Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6852B5991
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 07:11:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZwYG5Jp8zDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 17:10:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZwWH2KPrzDqPg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 17:09:11 +1100 (AEDT)
IronPort-SDR: 4PuR7GK2xhtSAU+riqgxjljnteYAU10DINzRej1IXEQTldVATDamuQXJM8fONAKOVE1Qzvn6YW
 /p99R7HzJNww==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="170085767"
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="170085767"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2020 22:09:08 -0800
IronPort-SDR: aCQyUgh1iczCmtIC6+Ztuj2v6xX/iEqtq1dC/d40mR6D3AQZMCj7t2GxxC+HtfmaQiLpToUrdN
 0dK1chKey7Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,484,1596524400"; d="scan'208";a="325048815"
Received: from lkp-server01.sh.intel.com (HELO 345567a03a52) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 16 Nov 2020 22:09:06 -0800
Received: from kbuild by 345567a03a52 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1keuAs-00002F-7V; Tue, 17 Nov 2020 06:09:06 +0000
Date: Tue, 17 Nov 2020 14:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 75b49620267c700f0a07fec7f27f69852db70e46
Message-ID: <5fb368d4.zcdbnAgvmFI1WQZ4%lkp@intel.com>
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
branch HEAD: 75b49620267c700f0a07fec7f27f69852db70e46  KVM: PPC: Book3S HV: XIVE: Fix possible oops when accessing ESB page

elapsed time: 721m

configs tested: 160
configs skipped: 86

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     tqm8541_defconfig
arm                            qcom_defconfig
ia64                        generic_defconfig
m68k                         amcore_defconfig
arm                      footbridge_defconfig
mips                     cu1830-neo_defconfig
arm                         socfpga_defconfig
nios2                         10m50_defconfig
powerpc                 mpc8315_rdb_defconfig
xtensa                  nommu_kc705_defconfig
m68k                            q40_defconfig
m68k                       m5475evb_defconfig
arm                       cns3420vb_defconfig
arm                        mini2440_defconfig
arm                        vexpress_defconfig
mips                  decstation_64_defconfig
sh                          rsk7203_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                         bigsur_defconfig
sh                           sh2007_defconfig
mips                        bcm63xx_defconfig
arc                                 defconfig
arm                         shannon_defconfig
mips                           gcw0_defconfig
sh                 kfr2r09-romimage_defconfig
arm                          iop32x_defconfig
powerpc                 linkstation_defconfig
mips                          rb532_defconfig
m68k                        mvme147_defconfig
openrisc                    or1ksim_defconfig
sh                          rsk7201_defconfig
arm                        shmobile_defconfig
openrisc                            defconfig
sh                         microdev_defconfig
sh                             espt_defconfig
powerpc                     tqm8555_defconfig
arm                     am200epdkit_defconfig
mips                          rm200_defconfig
mips                       lemote2f_defconfig
mips                 decstation_r4k_defconfig
powerpc                     ppa8548_defconfig
sh                     magicpanelr2_defconfig
arm                            zeus_defconfig
arm                           omap1_defconfig
arm                        neponset_defconfig
mips                           ip22_defconfig
mips                  cavium_octeon_defconfig
mips                           ip28_defconfig
x86_64                           alldefconfig
sh                           se7721_defconfig
mips                      bmips_stb_defconfig
powerpc                   lite5200b_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
arm                           sunxi_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     powernv_defconfig
arm                            mmp2_defconfig
arm                         lpc32xx_defconfig
ia64                      gensparse_defconfig
powerpc                    amigaone_defconfig
sh                           se7724_defconfig
arc                    vdk_hs38_smp_defconfig
arm                     eseries_pxa_defconfig
arm                           h5000_defconfig
arm                          simpad_defconfig
sh                          rsk7264_defconfig
powerpc                     tqm5200_defconfig
mips                            e55_defconfig
powerpc                     tqm8560_defconfig
sh                     sh7710voipgw_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20201116
x86_64               randconfig-a005-20201116
x86_64               randconfig-a004-20201116
x86_64               randconfig-a002-20201116
x86_64               randconfig-a001-20201116
x86_64               randconfig-a006-20201116
i386                 randconfig-a006-20201116
i386                 randconfig-a005-20201116
i386                 randconfig-a001-20201116
i386                 randconfig-a002-20201116
i386                 randconfig-a004-20201116
i386                 randconfig-a003-20201116
x86_64               randconfig-a015-20201115
x86_64               randconfig-a011-20201115
x86_64               randconfig-a016-20201115
x86_64               randconfig-a012-20201115
i386                 randconfig-a012-20201116
i386                 randconfig-a014-20201116
i386                 randconfig-a016-20201116
i386                 randconfig-a011-20201116
i386                 randconfig-a015-20201116
i386                 randconfig-a013-20201116
i386                 randconfig-a012-20201115
i386                 randconfig-a014-20201115
i386                 randconfig-a016-20201115
i386                 randconfig-a011-20201115
i386                 randconfig-a015-20201115
i386                 randconfig-a013-20201115
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
x86_64               randconfig-a003-20201115
x86_64               randconfig-a005-20201115
x86_64               randconfig-a004-20201115
x86_64               randconfig-a002-20201115
x86_64               randconfig-a001-20201115
x86_64               randconfig-a006-20201115
x86_64               randconfig-a015-20201116
x86_64               randconfig-a014-20201116
x86_64               randconfig-a013-20201116
x86_64               randconfig-a016-20201116
x86_64               randconfig-a011-20201116
x86_64               randconfig-a012-20201116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
