Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C361D36D0F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 05:47:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVPj15j31z3bnX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 13:47:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVPhH6gq3z2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 13:46:52 +1000 (AEST)
IronPort-SDR: NiOnikjAfFE4PZZ5XfLb/ErlFOASLPLFlkEAOwsV4sHDLj/F3xufTCly2+HRJMICOkZOK3zv7R
 iwSAP6Mb5lTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9967"; a="193459178"
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; d="scan'208";a="193459178"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 20:46:49 -0700
IronPort-SDR: w5cWmvkyaKtMPU+EVeGz2tPpR2PCTxLMuePgNNrp4Y0Smg7STwlsX2Gf7rDn6YLNafqZB+UpIu
 pTna2UFpADQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,257,1613462400"; d="scan'208";a="619149153"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 27 Apr 2021 20:46:48 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lbb9y-0006ux-UD; Wed, 28 Apr 2021 03:46:46 +0000
Date: Wed, 28 Apr 2021 11:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS ee1bc694fbaec1a662770703fc34a74abf418938
Message-ID: <6088da6d.iZbnxdpMI6fOYIet%lkp@intel.com>
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
branch HEAD: ee1bc694fbaec1a662770703fc34a74abf418938  powerpc/kvm: Fix build error when PPC_MEM_KEYS/PPC_PSERIES=n

elapsed time: 813m

configs tested: 175
configs skipped: 2

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
i386                             allyesconfig
riscv                            allyesconfig
sh                             sh03_defconfig
powerpc                 mpc837x_mds_defconfig
microblaze                          defconfig
parisc                           allyesconfig
arm                         axm55xx_defconfig
arm                        keystone_defconfig
arc                              alldefconfig
arm                  colibri_pxa270_defconfig
sh                     magicpanelr2_defconfig
arm                      pxa255-idp_defconfig
sh                         ecovec24_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                        m5407c3_defconfig
mips                           mtx1_defconfig
powerpc                    mvme5100_defconfig
powerpc                      ppc40x_defconfig
mips                        nlm_xlr_defconfig
mips                        maltaup_defconfig
mips                           rs90_defconfig
powerpc                     mpc83xx_defconfig
openrisc                 simple_smp_defconfig
mips                        bcm47xx_defconfig
h8300                            alldefconfig
powerpc                 linkstation_defconfig
powerpc                     kmeter1_defconfig
arm                              alldefconfig
arm                         shannon_defconfig
mips                         mpc30x_defconfig
sh                            shmin_defconfig
sh                            migor_defconfig
arc                          axs103_defconfig
sh                 kfr2r09-romimage_defconfig
arm                        spear6xx_defconfig
powerpc                          g5_defconfig
m68k                          sun3x_defconfig
m68k                        m5272c3_defconfig
arm                         socfpga_defconfig
openrisc                  or1klitex_defconfig
ia64                                defconfig
parisc                generic-64bit_defconfig
arm                         nhk8815_defconfig
arm                  colibri_pxa300_defconfig
xtensa                    xip_kc705_defconfig
sh                         apsh4a3a_defconfig
arm                           stm32_defconfig
s390                             alldefconfig
mips                      maltaaprp_defconfig
sh                        edosk7760_defconfig
arm                        mvebu_v5_defconfig
ia64                      gensparse_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                    amigaone_defconfig
sh                   sh7724_generic_defconfig
ia64                          tiger_defconfig
mips                        jmr3927_defconfig
arm                            xcep_defconfig
sh                            titan_defconfig
sh                           se7619_defconfig
arm                      integrator_defconfig
arc                                 defconfig
arc                              allyesconfig
mips                            ar7_defconfig
mips                       capcella_defconfig
s390                       zfcpdump_defconfig
mips                     cu1000-neo_defconfig
sh                          r7785rp_defconfig
mips                        omega2p_defconfig
sh                          lboxre2_defconfig
m68k                        m5307c3_defconfig
powerpc                      arches_defconfig
mips                             allmodconfig
powerpc                   bluestone_defconfig
arm                       mainstone_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                     tqm8548_defconfig
powerpc                         wii_defconfig
arm                       spear13xx_defconfig
powerpc                     ppa8548_defconfig
mips                      malta_kvm_defconfig
sh                             espt_defconfig
powerpc                      bamboo_defconfig
arm                         cm_x300_defconfig
sh                          urquell_defconfig
riscv             nommu_k210_sdcard_defconfig
m68k                           sun3_defconfig
sh                               alldefconfig
m68k                       m5475evb_defconfig
mips                      fuloong2e_defconfig
sh                          sdk7780_defconfig
h8300                     edosk2674_defconfig
xtensa                         virt_defconfig
sh                          rsk7203_defconfig
microblaze                      mmu_defconfig
riscv                            alldefconfig
m68k                         amcore_defconfig
sh                  sh7785lcr_32bit_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                             allnoconfig
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
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a005-20210426
i386                 randconfig-a002-20210426
i386                 randconfig-a001-20210426
i386                 randconfig-a006-20210426
i386                 randconfig-a004-20210426
i386                 randconfig-a003-20210426
x86_64               randconfig-a002-20210427
x86_64               randconfig-a004-20210427
x86_64               randconfig-a001-20210427
x86_64               randconfig-a006-20210427
x86_64               randconfig-a005-20210427
x86_64               randconfig-a003-20210427
x86_64               randconfig-a015-20210426
x86_64               randconfig-a016-20210426
x86_64               randconfig-a011-20210426
x86_64               randconfig-a014-20210426
x86_64               randconfig-a012-20210426
x86_64               randconfig-a013-20210426
i386                 randconfig-a014-20210426
i386                 randconfig-a012-20210426
i386                 randconfig-a011-20210426
i386                 randconfig-a013-20210426
i386                 randconfig-a015-20210426
i386                 randconfig-a016-20210426
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a002-20210426
x86_64               randconfig-a004-20210426
x86_64               randconfig-a001-20210426
x86_64               randconfig-a006-20210426
x86_64               randconfig-a005-20210426
x86_64               randconfig-a003-20210426

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
