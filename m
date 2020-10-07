Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7C5285698
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 04:14:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5dFd1ygxzDqJC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 13:14:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5dCy3khYzDq7W
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 13:13:17 +1100 (AEDT)
IronPort-SDR: k74Hgh98w2I2eSJINTTgge2C43OaZacB+mo70OaeNUpwGQI+AjcxtQzCnqiglE5psG0Ofzj619
 KdHGotsSGtkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="226377144"
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; d="scan'208";a="226377144"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 19:13:12 -0700
IronPort-SDR: 37ZOEfDI3GgqZ6R/TnSq+h1Os49gBQgmDj5pH1rcR30lRShtCeXlvGniKlDH5nAK/HUj1mPcN7
 7weI5uohvJRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,344,1596524400"; d="scan'208";a="517577896"
Received: from lkp-server02.sh.intel.com (HELO b5ae2f167493) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 06 Oct 2020 19:13:11 -0700
Received: from kbuild by b5ae2f167493 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kPyx4-0001RN-MJ; Wed, 07 Oct 2020 02:13:10 +0000
Date: Wed, 07 Oct 2020 10:12:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS d1def5df359f3f1882cc29d8baa5cd2a4861a6c6
Message-ID: <5f7d2411.BGVlmQL2jtS9tPG2%lkp@intel.com>
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
branch HEAD: d1def5df359f3f1882cc29d8baa5cd2a4861a6c6  Automatic merge of 'master' into merge (2020-10-05 14:10)

elapsed time: 2819m

configs tested: 196
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                  cavium_octeon_defconfig
sh                           se7724_defconfig
mips                      pic32mzda_defconfig
m68k                       m5275evb_defconfig
powerpc                     rainier_defconfig
sh                        apsh4ad0a_defconfig
arm                          ixp4xx_defconfig
mips                        bcm63xx_defconfig
m68k                        mvme16x_defconfig
ia64                        generic_defconfig
powerpc                      acadia_defconfig
mips                       bmips_be_defconfig
mips                           ip28_defconfig
mips                        omega2p_defconfig
mips                      pistachio_defconfig
sh                           se7721_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                      katmai_defconfig
mips                          ath79_defconfig
powerpc                     skiroot_defconfig
powerpc                     mpc5200_defconfig
arm                            zeus_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      obs600_defconfig
powerpc                 mpc8313_rdb_defconfig
sh                     sh7710voipgw_defconfig
powerpc                     tqm8541_defconfig
arm                         axm55xx_defconfig
arm                          moxart_defconfig
mips                           xway_defconfig
sh                              ul2_defconfig
riscv                          rv32_defconfig
sh                   sh7724_generic_defconfig
arm64                            alldefconfig
powerpc                          g5_defconfig
arm                           sunxi_defconfig
powerpc                 mpc8272_ads_defconfig
arm                        magician_defconfig
arm                         lpc32xx_defconfig
arm                        clps711x_defconfig
arm                            hisi_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     ksi8560_defconfig
arm                       imx_v6_v7_defconfig
arm                        mvebu_v5_defconfig
powerpc                     tqm8555_defconfig
mips                            e55_defconfig
sh                             espt_defconfig
powerpc                     tqm8548_defconfig
powerpc                      makalu_defconfig
arm                         lpc18xx_defconfig
arm                          exynos_defconfig
powerpc                     ppa8548_defconfig
h8300                     edosk2674_defconfig
parisc                generic-64bit_defconfig
sh                   secureedge5410_defconfig
mips                           ip32_defconfig
sh                         apsh4a3a_defconfig
arc                            hsdk_defconfig
arm                        multi_v5_defconfig
xtensa                           alldefconfig
h8300                       h8s-sim_defconfig
powerpc                    ge_imp3a_defconfig
mips                      malta_kvm_defconfig
csky                             alldefconfig
parisc                generic-32bit_defconfig
sh                           se7705_defconfig
sh                               alldefconfig
arm                      footbridge_defconfig
c6x                        evmc6472_defconfig
sh                         ecovec24_defconfig
powerpc                    socrates_defconfig
powerpc                      walnut_defconfig
sh                ecovec24-romimage_defconfig
sh                          r7785rp_defconfig
arm                          pxa168_defconfig
nios2                            alldefconfig
m68k                       m5208evb_defconfig
powerpc                       eiger_defconfig
mips                         tb0226_defconfig
mips                        nlm_xlr_defconfig
sh                           se7722_defconfig
m68k                        m5272c3_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                      ep88xc_defconfig
powerpc                     redwood_defconfig
sh                          rsk7269_defconfig
arm                              alldefconfig
powerpc                  mpc885_ads_defconfig
powerpc                     akebono_defconfig
powerpc                    mvme5100_defconfig
sh                        edosk7705_defconfig
arm                    vt8500_v6_v7_defconfig
sh                          urquell_defconfig
riscv                    nommu_virt_defconfig
mips                         mpc30x_defconfig
arm                        spear3xx_defconfig
m68k                       bvme6000_defconfig
arm                         palmz72_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                          axs101_defconfig
sh                          landisk_defconfig
arm                           sama5_defconfig
sh                        sh7785lcr_defconfig
powerpc                  iss476-smp_defconfig
mips                  maltasmvp_eva_defconfig
powerpc               mpc834x_itxgp_defconfig
s390                             alldefconfig
arm                           h5000_defconfig
arm                      integrator_defconfig
arm                         orion5x_defconfig
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
arc                                 defconfig
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
x86_64               randconfig-a004-20201006
x86_64               randconfig-a002-20201006
x86_64               randconfig-a001-20201006
x86_64               randconfig-a005-20201006
x86_64               randconfig-a003-20201006
x86_64               randconfig-a006-20201006
i386                 randconfig-a006-20201005
i386                 randconfig-a005-20201005
i386                 randconfig-a001-20201005
i386                 randconfig-a004-20201005
i386                 randconfig-a003-20201005
i386                 randconfig-a002-20201005
x86_64               randconfig-a012-20201005
x86_64               randconfig-a015-20201005
x86_64               randconfig-a014-20201005
x86_64               randconfig-a013-20201005
x86_64               randconfig-a011-20201005
x86_64               randconfig-a016-20201005
i386                 randconfig-a014-20201005
i386                 randconfig-a015-20201005
i386                 randconfig-a013-20201005
i386                 randconfig-a016-20201005
i386                 randconfig-a011-20201005
i386                 randconfig-a012-20201005
i386                 randconfig-a014-20201007
i386                 randconfig-a013-20201007
i386                 randconfig-a015-20201007
i386                 randconfig-a016-20201007
i386                 randconfig-a011-20201007
i386                 randconfig-a012-20201007
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201005
x86_64               randconfig-a002-20201005
x86_64               randconfig-a001-20201005
x86_64               randconfig-a003-20201005
x86_64               randconfig-a005-20201005
x86_64               randconfig-a006-20201005

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
