Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22546446BEF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 02:40:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmKnc0pGxz3cSv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 12:40:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmKmj1bPyz2yWG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 12:39:26 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="231958302"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="231958302"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 18:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; d="scan'208";a="668413071"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 05 Nov 2021 18:38:21 -0700
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mjAey-0008V0-Ts; Sat, 06 Nov 2021 01:38:20 +0000
Date: Sat, 06 Nov 2021 09:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 235cee162459d96153d63651ce7ff51752528c96
Message-ID: <6185dc71.+dtZhYlmXVUR1PHz%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 235cee162459d96153d63651ce7ff51752528c96  KVM: PPC: Tick accounting should defer vtime accounting 'til after IRQ handling

elapsed time: 5687m

configs tested: 193
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211101
powerpc              randconfig-c003-20211101
powerpc                          allyesconfig
powerpc                     powernv_defconfig
arm                        shmobile_defconfig
mips                            ar7_defconfig
powerpc                   currituck_defconfig
sh                          landisk_defconfig
mips                          malta_defconfig
powerpc                     tqm8555_defconfig
arm                        cerfcube_defconfig
mips                        bcm63xx_defconfig
powerpc                      bamboo_defconfig
powerpc                      katmai_defconfig
mips                 decstation_r4k_defconfig
powerpc                        icon_defconfig
arc                        nsimosci_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     kmeter1_defconfig
m68k                        m5307c3_defconfig
mips                           mtx1_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     ep8248e_defconfig
sh                  sh7785lcr_32bit_defconfig
h8300                       h8s-sim_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                 mpc837x_mds_defconfig
arm                       spear13xx_defconfig
arm                        mvebu_v7_defconfig
mips                      loongson3_defconfig
mips                      maltasmvp_defconfig
m68k                        stmark2_defconfig
arc                          axs103_defconfig
arm                          pxa3xx_defconfig
sh                             sh03_defconfig
powerpc                     taishan_defconfig
ia64                      gensparse_defconfig
arm                      jornada720_defconfig
mips                   sb1250_swarm_defconfig
powerpc                   bluestone_defconfig
arm                          moxart_defconfig
s390                             allmodconfig
riscv                             allnoconfig
powerpc                    sam440ep_defconfig
m68k                          atari_defconfig
arm                            mmp2_defconfig
mips                        jmr3927_defconfig
arm                             ezx_defconfig
arc                        vdk_hs38_defconfig
powerpc                 mpc8272_ads_defconfig
mips                           xway_defconfig
sh                        apsh4ad0a_defconfig
xtensa                  audio_kc705_defconfig
powerpc                      pcm030_defconfig
arm                       versatile_defconfig
arm                           tegra_defconfig
riscv                               defconfig
mips                           gcw0_defconfig
arm                           corgi_defconfig
sh                            shmin_defconfig
arm                         s3c2410_defconfig
powerpc                      ppc6xx_defconfig
powerpc                      acadia_defconfig
arm                        oxnas_v6_defconfig
powerpc                      tqm8xx_defconfig
m68k                          hp300_defconfig
parisc                generic-64bit_defconfig
arm                  colibri_pxa270_defconfig
xtensa                           alldefconfig
arm                        spear6xx_defconfig
mips                             allmodconfig
powerpc                         wii_defconfig
mips                        vocore2_defconfig
sh                     magicpanelr2_defconfig
s390                          debug_defconfig
powerpc                 mpc834x_itx_defconfig
arm                           h5000_defconfig
arc                              alldefconfig
sh                            hp6xx_defconfig
m68k                            q40_defconfig
arm                       aspeed_g5_defconfig
sh                            titan_defconfig
mips                       capcella_defconfig
powerpc                     tqm8548_defconfig
arm                         cm_x300_defconfig
powerpc                 linkstation_defconfig
sh                           se7712_defconfig
mips                          ath79_defconfig
mips                      maltaaprp_defconfig
sh                          lboxre2_defconfig
sh                           se7206_defconfig
powerpc                 mpc8313_rdb_defconfig
s390                             alldefconfig
ia64                            zx1_defconfig
powerpc                      ep88xc_defconfig
arm                           spitz_defconfig
sh                           se7705_defconfig
m68k                       m5475evb_defconfig
powerpc                      cm5200_defconfig
arm                        mvebu_v5_defconfig
microblaze                      mmu_defconfig
powerpc                    gamecube_defconfig
sh                           se7780_defconfig
mips                     decstation_defconfig
arm                          ep93xx_defconfig
powerpc                   microwatt_defconfig
arm                         orion5x_defconfig
arm                  randconfig-c002-20211101
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a012-20211101
x86_64               randconfig-a015-20211101
x86_64               randconfig-a016-20211101
x86_64               randconfig-a013-20211101
x86_64               randconfig-a011-20211101
x86_64               randconfig-a014-20211101
i386                 randconfig-a016-20211101
i386                 randconfig-a014-20211101
i386                 randconfig-a015-20211101
i386                 randconfig-a013-20211101
i386                 randconfig-a011-20211101
i386                 randconfig-a012-20211101
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
mips                 randconfig-c004-20211101
arm                  randconfig-c002-20211101
i386                 randconfig-c001-20211101
s390                 randconfig-c005-20211101
powerpc              randconfig-c003-20211101
riscv                randconfig-c006-20211101
x86_64               randconfig-c007-20211101
mips                 randconfig-c004-20211102
arm                  randconfig-c002-20211102
i386                 randconfig-c001-20211102
s390                 randconfig-c005-20211102
powerpc              randconfig-c003-20211102
riscv                randconfig-c006-20211102
x86_64               randconfig-c007-20211102
x86_64               randconfig-a004-20211101
x86_64               randconfig-a006-20211101
x86_64               randconfig-a001-20211101
x86_64               randconfig-a002-20211101
x86_64               randconfig-a003-20211101
x86_64               randconfig-a005-20211101
i386                 randconfig-a005-20211101
i386                 randconfig-a001-20211101
i386                 randconfig-a003-20211101
i386                 randconfig-a004-20211101
i386                 randconfig-a006-20211101
i386                 randconfig-a002-20211101
hexagon              randconfig-r041-20211101
hexagon              randconfig-r045-20211101

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
