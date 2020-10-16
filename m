Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B4290807
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 17:13:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCV683vZgzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 02:13:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCV1m00rtzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 02:09:28 +1100 (AEDT)
IronPort-SDR: 7gxS39GB1vlr5AK9DSRG4DlrCd2x/a+jg7WKE1B1zw4rZ8FuravNwOxkMHIjLcG/MBC9A3QgZF
 Xkq+Ads6jIew==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="154429121"
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="154429121"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 08:09:25 -0700
IronPort-SDR: Sm/W3v4Ml/cx7Fh+vvNfBn1/0C+SATwY3p2giRhTA7q9EHi10qhRPoVjWZVMd1GJL4KQB7l22/
 uIwsX4cFHHGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="521200632"
Received: from lkp-server02.sh.intel.com (HELO 262a2cdd3070) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 16 Oct 2020 08:09:23 -0700
Received: from kbuild by 262a2cdd3070 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kTRMB-00003M-6H; Fri, 16 Oct 2020 15:09:23 +0000
Date: Fri, 16 Oct 2020 23:08:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS ffd0b25ca049a477cb757e5bcf2d5e1664d12e5d
Message-ID: <5f89b782.LnNN3Pi7gQKyQNiY%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next
branch HEAD: ffd0b25ca049a477cb757e5bcf2d5e1664d12e5d  Revert "powerpc/pci: unmap legacy INTx interrupts when a PHB is removed"

elapsed time: 1663m

configs tested: 197
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           h3600_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
arm                       multi_v4t_defconfig
powerpc                      ppc44x_defconfig
mips                         tb0287_defconfig
sh                   sh7724_generic_defconfig
arm                       netwinder_defconfig
xtensa                              defconfig
mips                            e55_defconfig
xtensa                  audio_kc705_defconfig
m68k                        mvme147_defconfig
powerpc                        cell_defconfig
arm                          collie_defconfig
mips                      maltaaprp_defconfig
arm                         cm_x300_defconfig
arm                              zx_defconfig
powerpc                 mpc8560_ads_defconfig
mips                        jmr3927_defconfig
powerpc                     tqm8555_defconfig
arm                              alldefconfig
powerpc                         ps3_defconfig
xtensa                generic_kc705_defconfig
arc                        vdk_hs38_defconfig
powerpc                      katmai_defconfig
sparc                       sparc32_defconfig
sh                           se7780_defconfig
xtensa                         virt_defconfig
arm                         lpc18xx_defconfig
arm                            u300_defconfig
arm                  colibri_pxa300_defconfig
arm                            xcep_defconfig
powerpc                       eiger_defconfig
mips                           ip32_defconfig
powerpc                   motionpro_defconfig
mips                          malta_defconfig
arm                         lpc32xx_defconfig
arm                          simpad_defconfig
arm                         at91_dt_defconfig
arm                            lart_defconfig
parisc                generic-64bit_defconfig
x86_64                           alldefconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
mips                           ip28_defconfig
i386                             alldefconfig
powerpc                      pmac32_defconfig
arm                      tct_hammer_defconfig
powerpc                     kilauea_defconfig
mips                        nlm_xlp_defconfig
arm                            mps2_defconfig
mips                     decstation_defconfig
sh                          r7785rp_defconfig
arm                         lubbock_defconfig
powerpc                       ppc64_defconfig
arm                        mini2440_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                      mgcoge_defconfig
arm                        vexpress_defconfig
powerpc                     tqm8540_defconfig
arm                         nhk8815_defconfig
arm                     davinci_all_defconfig
mips                  cavium_octeon_defconfig
riscv                            alldefconfig
powerpc                     mpc512x_defconfig
arm                        oxnas_v6_defconfig
arm                             pxa_defconfig
arm                         bcm2835_defconfig
m68k                         amcore_defconfig
sh                           se7206_defconfig
sh                          r7780mp_defconfig
ia64                         bigsur_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
powerpc                     stx_gp3_defconfig
s390                       zfcpdump_defconfig
sh                           se7705_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          ep93xx_defconfig
arm                        spear3xx_defconfig
riscv                            allyesconfig
mips                        maltaup_defconfig
powerpc                     sbc8548_defconfig
sh                     sh7710voipgw_defconfig
sh                           se7721_defconfig
h8300                       h8s-sim_defconfig
arm                           stm32_defconfig
arm                           spitz_defconfig
sh                  sh7785lcr_32bit_defconfig
arc                        nsimosci_defconfig
powerpc                  mpc885_ads_defconfig
sh                          polaris_defconfig
powerpc                     powernv_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      ppc6xx_defconfig
arm                       omap2plus_defconfig
powerpc                     mpc5200_defconfig
m68k                          sun3x_defconfig
sh                            shmin_defconfig
arm                         shannon_defconfig
powerpc                    sam440ep_defconfig
m68k                        m5307c3_defconfig
sh                             sh03_defconfig
sh                        edosk7705_defconfig
arm                           sama5_defconfig
arm                        magician_defconfig
sh                            migor_defconfig
arm                           viper_defconfig
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
x86_64               randconfig-a004-20201015
x86_64               randconfig-a002-20201015
x86_64               randconfig-a006-20201015
x86_64               randconfig-a001-20201015
x86_64               randconfig-a005-20201015
x86_64               randconfig-a003-20201015
i386                 randconfig-a005-20201014
i386                 randconfig-a006-20201014
i386                 randconfig-a001-20201014
i386                 randconfig-a003-20201014
i386                 randconfig-a004-20201014
i386                 randconfig-a002-20201014
i386                 randconfig-a005-20201016
i386                 randconfig-a006-20201016
i386                 randconfig-a001-20201016
i386                 randconfig-a003-20201016
i386                 randconfig-a004-20201016
i386                 randconfig-a002-20201016
x86_64               randconfig-a016-20201014
x86_64               randconfig-a012-20201014
x86_64               randconfig-a015-20201014
x86_64               randconfig-a013-20201014
x86_64               randconfig-a014-20201014
x86_64               randconfig-a011-20201014
i386                 randconfig-a016-20201015
i386                 randconfig-a013-20201015
i386                 randconfig-a015-20201015
i386                 randconfig-a011-20201015
i386                 randconfig-a012-20201015
i386                 randconfig-a014-20201015
i386                 randconfig-a016-20201014
i386                 randconfig-a013-20201014
i386                 randconfig-a015-20201014
i386                 randconfig-a011-20201014
i386                 randconfig-a012-20201014
i386                 randconfig-a014-20201014
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
x86_64               randconfig-a004-20201014
x86_64               randconfig-a002-20201014
x86_64               randconfig-a006-20201014
x86_64               randconfig-a001-20201014
x86_64               randconfig-a005-20201014
x86_64               randconfig-a003-20201014

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
