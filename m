Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B426D2D1FD1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 02:15:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cqj045C44zDqdX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 12:15:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cqhy403kXzDqW5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 12:13:11 +1100 (AEDT)
IronPort-SDR: MtnLqoaKD5IMyuxBpsib3s0sRU95m07lcYlLAKGQpRXwZjDpvQVZZRt1FVvFoD/HuGfNvbF8+z
 jlUl3LxXU4lQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="258518730"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="258518730"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 17:13:08 -0800
IronPort-SDR: iud8VducIyB0EV1pWgyhOUxE6yLT0xgaQ+Id6kgYMlA1vq8XZefEekzH3Cg29D+3m9CG/BRrle
 c3jLBt+dX8HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="363410866"
Received: from lkp-server01.sh.intel.com (HELO 6c6df46aa5de) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 07 Dec 2020 17:13:07 -0800
Received: from kbuild by 6c6df46aa5de with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kmRYw-00000q-HF; Tue, 08 Dec 2020 01:13:06 +0000
Date: Tue, 08 Dec 2020 09:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 250ad7a45b1e58d580decfb935fc063c4cf56f91
Message-ID: <5fced2fc.kPabZvZRdWhFl2f9%lkp@intel.com>
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
branch HEAD: 250ad7a45b1e58d580decfb935fc063c4cf56f91  powerpc/powernv/idle: Restore CIABR after idle for Power9

elapsed time: 758m

configs tested: 156
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
arc                     haps_hs_smp_defconfig
mips                      fuloong2e_defconfig
powerpc                     ksi8560_defconfig
powerpc                           allnoconfig
powerpc                      walnut_defconfig
arm                         palmz72_defconfig
arm                          simpad_defconfig
m68k                             alldefconfig
m68k                       m5249evb_defconfig
sh                             shx3_defconfig
powerpc                     tqm8560_defconfig
mips                        bcm63xx_defconfig
arc                          axs103_defconfig
nios2                               defconfig
powerpc                     tqm8555_defconfig
powerpc                     powernv_defconfig
m68k                       m5208evb_defconfig
mips                           mtx1_defconfig
powerpc                 mpc832x_mds_defconfig
mips                         cobalt_defconfig
xtensa                generic_kc705_defconfig
m68k                        mvme16x_defconfig
m68k                          amiga_defconfig
mips                      pistachio_defconfig
sh                           se7750_defconfig
mips                     cu1830-neo_defconfig
powerpc                     pq2fads_defconfig
mips                    maltaup_xpa_defconfig
mips                         tb0226_defconfig
arm                        multi_v7_defconfig
s390                       zfcpdump_defconfig
sh                        edosk7760_defconfig
mips                        omega2p_defconfig
sh                           se7619_defconfig
mips                      maltasmvp_defconfig
mips                     loongson1b_defconfig
arc                            hsdk_defconfig
sh                            shmin_defconfig
arm                  colibri_pxa270_defconfig
c6x                              alldefconfig
arm                  colibri_pxa300_defconfig
arm                           tegra_defconfig
powerpc                     tqm8540_defconfig
powerpc                      pcm030_defconfig
powerpc                 mpc8313_rdb_defconfig
sparc                            alldefconfig
arm                      footbridge_defconfig
powerpc                      ppc40x_defconfig
sh                            migor_defconfig
powerpc                      chrp32_defconfig
mips                         db1xxx_defconfig
arc                        nsim_700_defconfig
mips                          rm200_defconfig
ia64                        generic_defconfig
arm                           omap1_defconfig
arm                         lubbock_defconfig
mips                   sb1250_swarm_defconfig
powerpc                       maple_defconfig
sh                          rsk7269_defconfig
arm                           sama5_defconfig
mips                      bmips_stb_defconfig
arm                       omap2plus_defconfig
arm                         lpc18xx_defconfig
sh                          sdk7780_defconfig
m68k                       m5275evb_defconfig
mips                            ar7_defconfig
arm                       netwinder_defconfig
sparc64                          alldefconfig
x86_64                              defconfig
arm                             ezx_defconfig
mips                          ath79_defconfig
powerpc                   lite5200b_defconfig
arm                        realview_defconfig
sh                         microdev_defconfig
openrisc                    or1ksim_defconfig
xtensa                    xip_kc705_defconfig
m68k                       m5475evb_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     kilauea_defconfig
powerpc                    sam440ep_defconfig
powerpc                    klondike_defconfig
m68k                          atari_defconfig
powerpc                mpc7448_hpc2_defconfig
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
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a005-20201207
i386                 randconfig-a004-20201207
i386                 randconfig-a001-20201207
i386                 randconfig-a002-20201207
i386                 randconfig-a006-20201207
i386                 randconfig-a003-20201207
x86_64               randconfig-a016-20201207
x86_64               randconfig-a012-20201207
x86_64               randconfig-a014-20201207
x86_64               randconfig-a013-20201207
x86_64               randconfig-a015-20201207
x86_64               randconfig-a011-20201207
i386                 randconfig-a014-20201207
i386                 randconfig-a013-20201207
i386                 randconfig-a011-20201207
i386                 randconfig-a015-20201207
i386                 randconfig-a012-20201207
i386                 randconfig-a016-20201207
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
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201207
x86_64               randconfig-a005-20201207
x86_64               randconfig-a004-20201207
x86_64               randconfig-a002-20201207
x86_64               randconfig-a001-20201207
x86_64               randconfig-a003-20201207

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
