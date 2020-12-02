Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BF32CB498
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 06:44:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm7Fd2ttyzDqcR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 16:44:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm7B15CTrzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 16:41:13 +1100 (AEDT)
IronPort-SDR: DGbNtnUE0iJrjoT6Xqa8U9w9PClf5cY6U1Mw8DROKDvr/KaR0Q2N8tljKjOJWYLdeTtE87S6st
 K7YPS6yXYKCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="172173019"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="172173019"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 21:41:11 -0800
IronPort-SDR: tA8Inh8gxXozj2Q9r7VBtIIk2dY0x4v3U/vxXZoSWzm3AiniA2TxEGtn4+QO2+pFPgN9FpI3Ky
 JdeeiW1TMDrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="537842061"
Received: from lkp-server01.sh.intel.com (HELO 4302fe08fc2a) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2020 21:41:10 -0800
Received: from kbuild by 4302fe08fc2a with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kkKt3-000074-Rf; Wed, 02 Dec 2020 05:41:09 +0000
Date: Wed, 02 Dec 2020 13:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 72e886545963b33dd5e1d92ee9c77dadb51adc4e
Message-ID: <5fc728c0.Y8DwuXr+HUHLqRZO%lkp@intel.com>
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
branch HEAD: 72e886545963b33dd5e1d92ee9c77dadb51adc4e  powerpc/pseries: Define PCI bus speed for Gen4 and Gen5

elapsed time: 724m

configs tested: 147
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                        clps711x_defconfig
sh                        edosk7760_defconfig
powerpc                        cell_defconfig
mips                          ath79_defconfig
openrisc                         alldefconfig
sh                               j2_defconfig
mips                       capcella_defconfig
arm                           viper_defconfig
c6x                        evmc6474_defconfig
arm                          pxa3xx_defconfig
c6x                        evmc6457_defconfig
m68k                            q40_defconfig
arc                        nsim_700_defconfig
arc                         haps_hs_defconfig
riscv                    nommu_virt_defconfig
mips                         tb0226_defconfig
arm                            dove_defconfig
m68k                        m5272c3_defconfig
mips                malta_kvm_guest_defconfig
sh                ecovec24-romimage_defconfig
powerpc                         wii_defconfig
arm                      integrator_defconfig
s390                       zfcpdump_defconfig
xtensa                generic_kc705_defconfig
ia64                                defconfig
powerpc                    klondike_defconfig
mips                     loongson1c_defconfig
arc                        nsimosci_defconfig
mips                           gcw0_defconfig
xtensa                         virt_defconfig
c6x                        evmc6678_defconfig
sh                             shx3_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     tqm5200_defconfig
arc                 nsimosci_hs_smp_defconfig
s390                                defconfig
sh                         ap325rxa_defconfig
m68k                       m5475evb_defconfig
c6x                                 defconfig
powerpc                     ep8248e_defconfig
arm                          pcm027_defconfig
mips                           ip22_defconfig
ia64                        generic_defconfig
sh                        dreamcast_defconfig
arm                            mps2_defconfig
arm                         s3c6400_defconfig
powerpc                     rainier_defconfig
powerpc                     taishan_defconfig
powerpc                       eiger_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc40x_defconfig
h8300                               defconfig
powerpc                      ppc44x_defconfig
arm                              alldefconfig
arm                          moxart_defconfig
powerpc                    amigaone_defconfig
mips                        maltaup_defconfig
arc                              alldefconfig
microblaze                      mmu_defconfig
parisc                           alldefconfig
arm                           h3600_defconfig
mips                           jazz_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                    mvme5100_defconfig
sh                        apsh4ad0a_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          imote2_defconfig
mips                      fuloong2e_defconfig
sparc                       sparc64_defconfig
arm                        vexpress_defconfig
mips                           xway_defconfig
xtensa                  audio_kc705_defconfig
powerpc                 canyonlands_defconfig
sh                            hp6xx_defconfig
powerpc                     skiroot_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201201
i386                 randconfig-a005-20201201
i386                 randconfig-a001-20201201
i386                 randconfig-a002-20201201
i386                 randconfig-a006-20201201
i386                 randconfig-a003-20201201
x86_64               randconfig-a016-20201201
x86_64               randconfig-a012-20201201
x86_64               randconfig-a014-20201201
x86_64               randconfig-a013-20201201
x86_64               randconfig-a015-20201201
x86_64               randconfig-a011-20201201
i386                 randconfig-a014-20201201
i386                 randconfig-a013-20201201
i386                 randconfig-a011-20201201
i386                 randconfig-a015-20201201
i386                 randconfig-a012-20201201
i386                 randconfig-a016-20201201
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a004-20201201
x86_64               randconfig-a006-20201201
x86_64               randconfig-a001-20201201
x86_64               randconfig-a002-20201201
x86_64               randconfig-a005-20201201
x86_64               randconfig-a003-20201201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
