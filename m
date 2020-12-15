Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0982DA523
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 02:00:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cw0Kt6VShzDqM9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:00:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cw0JD2nhVzDqBP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 11:58:51 +1100 (AEDT)
IronPort-SDR: UkK/xJEctFxtWc44euA+Gutu4wawfqfn1VKuaP+pj86r/huvwLrNP1XfdE3bMSnUP0ZqG55WwD
 WwjEqQOZj6Ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="171296797"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="171296797"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 16:58:47 -0800
IronPort-SDR: vNxXub5gskFdi4vIVF/ctVZ6R5y8zhERCgZ0wcdVzjlsKoUuQELtE/0q+EXU33/NBL4ySAYQc4
 oEcOr/y8zmzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="556367055"
Received: from lkp-server02.sh.intel.com (HELO a947d92d0467) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 14 Dec 2020 16:58:46 -0800
Received: from kbuild by a947d92d0467 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1koyft-0000XB-Ek; Tue, 15 Dec 2020 00:58:45 +0000
Date: Tue, 15 Dec 2020 08:57:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 bd9161ccbf25eef78b073c239621dfd298222a64
Message-ID: <5fd80a11.v4G7tRcKH9auHwEX%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: bd9161ccbf25eef78b073c239621dfd298222a64  powerpc: Inline setup_kup()

elapsed time: 721m

configs tested: 183
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                        m5307c3_defconfig
ia64                          tiger_defconfig
arm                            u300_defconfig
powerpc                      ppc44x_defconfig
xtensa                           allyesconfig
arm                      pxa255-idp_defconfig
mips                    maltaup_xpa_defconfig
mips                          rb532_defconfig
arm                          badge4_defconfig
h8300                       h8s-sim_defconfig
arm                         axm55xx_defconfig
arm                          moxart_defconfig
powerpc                      pasemi_defconfig
powerpc                    adder875_defconfig
arc                          axs101_defconfig
sh                           se7206_defconfig
arm                              zx_defconfig
powerpc                      arches_defconfig
arc                              alldefconfig
arm                     eseries_pxa_defconfig
sparc                            allyesconfig
m68k                          amiga_defconfig
arm                            dove_defconfig
xtensa                    xip_kc705_defconfig
mips                           xway_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     ppa8548_defconfig
powerpc                     akebono_defconfig
arc                                 defconfig
mips                         db1xxx_defconfig
mips                        vocore2_defconfig
powerpc                       maple_defconfig
h8300                     edosk2674_defconfig
sh                          sdk7780_defconfig
m68k                           sun3_defconfig
mips                  cavium_octeon_defconfig
m68k                        m5407c3_defconfig
sh                           se7712_defconfig
xtensa                  audio_kc705_defconfig
mips                       rbtx49xx_defconfig
arm                           h5000_defconfig
i386                             alldefconfig
arm                       cns3420vb_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                      acadia_defconfig
arm                          pxa168_defconfig
sh                          rsk7269_defconfig
powerpc                   currituck_defconfig
powerpc                     mpc83xx_defconfig
mips                           ip32_defconfig
mips                            gpr_defconfig
powerpc                     tqm8540_defconfig
arm                       aspeed_g4_defconfig
arm                        shmobile_defconfig
mips                            ar7_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                          g5_defconfig
powerpc                     stx_gp3_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                          rm200_defconfig
powerpc                     tqm8548_defconfig
arm                          lpd270_defconfig
mips                   sb1250_swarm_defconfig
powerpc                         ps3_defconfig
powerpc                      obs600_defconfig
sh                ecovec24-romimage_defconfig
sh                   sh7770_generic_defconfig
powerpc                     kmeter1_defconfig
mips                        nlm_xlp_defconfig
mips                     loongson1b_defconfig
sh                             sh03_defconfig
x86_64                           alldefconfig
xtensa                         virt_defconfig
nds32                             allnoconfig
sh                        edosk7760_defconfig
mips                       capcella_defconfig
sh                          lboxre2_defconfig
sh                          sdk7786_defconfig
sh                            titan_defconfig
powerpc                    gamecube_defconfig
c6x                        evmc6472_defconfig
sh                           se7722_defconfig
arm                        spear6xx_defconfig
mips                        nlm_xlr_defconfig
mips                       lemote2f_defconfig
arc                        nsimosci_defconfig
arm                         at91_dt_defconfig
arm                           sama5_defconfig
arm                        mvebu_v5_defconfig
i386                                defconfig
mips                         mpc30x_defconfig
sh                         ap325rxa_defconfig
sh                         microdev_defconfig
powerpc64                        alldefconfig
mips                 decstation_r4k_defconfig
arm                         cm_x300_defconfig
m68k                            q40_defconfig
arm                            lart_defconfig
arm                          prima2_defconfig
h8300                            alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20201214
i386                 randconfig-a004-20201214
i386                 randconfig-a003-20201214
i386                 randconfig-a002-20201214
i386                 randconfig-a006-20201214
i386                 randconfig-a005-20201214
i386                 randconfig-a001-20201213
i386                 randconfig-a004-20201213
i386                 randconfig-a003-20201213
i386                 randconfig-a002-20201213
i386                 randconfig-a005-20201213
i386                 randconfig-a006-20201213
x86_64               randconfig-a016-20201214
x86_64               randconfig-a012-20201214
x86_64               randconfig-a013-20201214
x86_64               randconfig-a015-20201214
x86_64               randconfig-a014-20201214
x86_64               randconfig-a011-20201214
i386                 randconfig-a014-20201214
i386                 randconfig-a013-20201214
i386                 randconfig-a012-20201214
i386                 randconfig-a011-20201214
i386                 randconfig-a015-20201214
i386                 randconfig-a016-20201214
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
x86_64               randconfig-a003-20201214
x86_64               randconfig-a006-20201214
x86_64               randconfig-a002-20201214
x86_64               randconfig-a005-20201214
x86_64               randconfig-a004-20201214
x86_64               randconfig-a001-20201214
x86_64               randconfig-a016-20201213
x86_64               randconfig-a012-20201213
x86_64               randconfig-a013-20201213
x86_64               randconfig-a015-20201213
x86_64               randconfig-a014-20201213
x86_64               randconfig-a011-20201213

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
