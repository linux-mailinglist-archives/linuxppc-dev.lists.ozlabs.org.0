Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603F36F428
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 04:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWcLQ2zWBz2xZZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 12:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWcL44Zj4z2xYl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 12:50:19 +1000 (AEST)
IronPort-SDR: nfq3tUG4wszB+/FoWgHK7U20xuEqRGF3V8aHsybF7AAmw2RPj8y/hey1LtWeBOMs8NsnjdvMle
 ZfuqMu3dSrHQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="177335499"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="177335499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 19:50:16 -0700
IronPort-SDR: 2ZMftAgFURrKpwuFT53x3vVuH2ZXUAXzIst+Im3FX6s+1Ynw+ilbDtDrrOdRgUEsMD7knaa40i
 +FjAA88bGUXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="426271877"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 29 Apr 2021 19:50:15 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lcJEM-0007wI-MM; Fri, 30 Apr 2021 02:50:14 +0000
Date: Fri, 30 Apr 2021 10:49:54 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 5256426247837feb8703625bda7fcfc824af04cf
Message-ID: <608b7052.eu17Pacb28lz6lOi%lkp@intel.com>
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
branch HEAD: 5256426247837feb8703625bda7fcfc824af04cf  powerpc/signal32: Fix erroneous SIGSEGV on RT signal return

elapsed time: 820m

configs tested: 177
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
nios2                               defconfig
nios2                            allyesconfig
arm                           omap1_defconfig
arm                        mvebu_v7_defconfig
arm                         mv78xx0_defconfig
arc                        nsimosci_defconfig
nds32                             allnoconfig
arm                           h3600_defconfig
mips                         db1xxx_defconfig
arm                      integrator_defconfig
sh                          landisk_defconfig
powerpc                      arches_defconfig
powerpc                   lite5200b_defconfig
ia64                         bigsur_defconfig
sh                           se7721_defconfig
arm                          imote2_defconfig
xtensa                         virt_defconfig
arm                           corgi_defconfig
m68k                          sun3x_defconfig
arm                         socfpga_defconfig
sh                         microdev_defconfig
m68k                       bvme6000_defconfig
arm                           tegra_defconfig
powerpc                        icon_defconfig
arm                          moxart_defconfig
arm                     eseries_pxa_defconfig
arm                       aspeed_g5_defconfig
mips                       capcella_defconfig
um                               allyesconfig
i386                             alldefconfig
csky                                defconfig
arm                          simpad_defconfig
um                                allnoconfig
ia64                                defconfig
arm                             mxs_defconfig
arm                      pxa255-idp_defconfig
sh                        edosk7705_defconfig
arm                         s3c6400_defconfig
arm                        multi_v5_defconfig
powerpc                     stx_gp3_defconfig
parisc                           allyesconfig
um                            kunit_defconfig
powerpc                         ps3_defconfig
m68k                        m5307c3_defconfig
arm                           sunxi_defconfig
sh                          rsk7201_defconfig
parisc                generic-64bit_defconfig
powerpc                       ppc64_defconfig
sh                        sh7785lcr_defconfig
powerpc                     kilauea_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                  colibri_pxa300_defconfig
arm                      tct_hammer_defconfig
powerpc                     tqm5200_defconfig
powerpc64                           defconfig
powerpc                     mpc512x_defconfig
parisc                              defconfig
powerpc                      ppc64e_defconfig
mips                             allmodconfig
mips                malta_kvm_guest_defconfig
mips                         rt305x_defconfig
powerpc                   motionpro_defconfig
sh                           se7619_defconfig
arm                          collie_defconfig
powerpc                     tqm8541_defconfig
riscv                            alldefconfig
powerpc                      katmai_defconfig
sh                        apsh4ad0a_defconfig
mips                        bcm47xx_defconfig
powerpc                     ppa8548_defconfig
sh                        sh7763rdp_defconfig
arm                        neponset_defconfig
powerpc                  mpc885_ads_defconfig
openrisc                         alldefconfig
arc                     haps_hs_smp_defconfig
arm                         at91_dt_defconfig
arm                        vexpress_defconfig
powerpc                      obs600_defconfig
powerpc                         wii_defconfig
mips                          rb532_defconfig
mips                       bmips_be_defconfig
sparc                       sparc32_defconfig
powerpc                      mgcoge_defconfig
powerpc                        warp_defconfig
powerpc                   currituck_defconfig
mips                           ip22_defconfig
arc                    vdk_hs38_smp_defconfig
x86_64                           alldefconfig
sh                             shx3_defconfig
mips                        vocore2_defconfig
m68k                            q40_defconfig
arc                              alldefconfig
m68k                        m5272c3_defconfig
openrisc                 simple_smp_defconfig
arc                          axs103_defconfig
mips                           gcw0_defconfig
sh                          kfr2r09_defconfig
arm                          pxa168_defconfig
sh                   rts7751r2dplus_defconfig
ia64                             allyesconfig
powerpc                 mpc8272_ads_defconfig
sh                        edosk7760_defconfig
sh                   sh7770_generic_defconfig
sh                            hp6xx_defconfig
arm                          lpd270_defconfig
openrisc                    or1ksim_defconfig
sh                           se7724_defconfig
mips                           rs90_defconfig
powerpc                      acadia_defconfig
powerpc                      ppc44x_defconfig
ia64                             allmodconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                               defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
x86_64               randconfig-a005-20210429
x86_64               randconfig-a006-20210429
x86_64               randconfig-a004-20210429
x86_64               randconfig-a002-20210429
x86_64               randconfig-a001-20210429
x86_64               randconfig-a003-20210429
i386                 randconfig-a005-20210429
i386                 randconfig-a002-20210429
i386                 randconfig-a001-20210429
i386                 randconfig-a006-20210429
i386                 randconfig-a003-20210429
i386                 randconfig-a004-20210429
i386                 randconfig-a012-20210429
i386                 randconfig-a014-20210429
i386                 randconfig-a013-20210429
i386                 randconfig-a011-20210429
i386                 randconfig-a015-20210429
i386                 randconfig-a016-20210429
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210429
x86_64               randconfig-a016-20210429
x86_64               randconfig-a011-20210429
x86_64               randconfig-a014-20210429
x86_64               randconfig-a013-20210429
x86_64               randconfig-a012-20210429

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
