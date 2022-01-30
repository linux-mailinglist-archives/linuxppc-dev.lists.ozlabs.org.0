Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835F4A3324
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 02:52:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmZ2s1prsz3bbm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 12:52:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Pr7G7z4s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Pr7G7z4s; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmZ2B03RHz2yPp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 12:52:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643507538; x=1675043538;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=BcPWgjFnvTvkrZW4MW8K5c/yCHxKmLdzlYEuGPb/zdw=;
 b=Pr7G7z4sS+COf0Xd5HjvAQvE93BhhwmJ5wVndikarhqdjQYKErKJ0/uK
 DdkNTCyG7JRIKJZVSpvFCFl5qFphBROf9ksATXBkZ/vDqsVk362y3PuTF
 ckO/ZsRD/2uJFwE0bB81mITGxB53iXkARYF5x7nSUbJUOrZKyOlNdbgMq
 IsBVUnfE7guvaf6u6cSgdVMTZywzc4/IhieQKRoDs47oHBUukGwzBAK9H
 o+nCe4uJ7tZUSqPIGoVfO8CdZ2MrunwmZjTDOX1Z4LhYeodVVuxiCi79+
 KPxx2NR3fwtVrPiSFG6EQ5zuCr985zq35f6yS4VRkbe86OT7+nOMHxyb3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="333666051"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; d="scan'208";a="333666051"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 17:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; d="scan'208";a="629508117"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 29 Jan 2022 17:51:14 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDzN3-000PvK-Sb; Sun, 30 Jan 2022 01:51:13 +0000
Date: Sun, 30 Jan 2022 09:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 33ecb3e590194051dc57eee1125c1d372b14c946
Message-ID: <61f5ef08.gudKFkNre4xC2wUv%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 33ecb3e590194051dc57eee1125c1d372b14c946  Automatic merge of 'master' into merge (2022-01-25 00:07)

elapsed time: 1989m

configs tested: 289
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220124
i386                          randconfig-c001
powerpc              randconfig-c003-20220124
sh                  sh7785lcr_32bit_defconfig
arm                           sunxi_defconfig
sh                             sh03_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                          amiga_defconfig
arm                           u8500_defconfig
sparc64                             defconfig
powerpc                        cell_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                          rb532_defconfig
ia64                            zx1_defconfig
powerpc64                        alldefconfig
arm                          gemini_defconfig
sparc                       sparc32_defconfig
xtensa                  cadence_csp_defconfig
ia64                        generic_defconfig
powerpc                   motionpro_defconfig
parisc                generic-32bit_defconfig
arc                     nsimosci_hs_defconfig
arm64                            alldefconfig
mips                        jmr3927_defconfig
sh                           se7780_defconfig
sh                        edosk7760_defconfig
sh                             espt_defconfig
um                                  defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
sparc                               defconfig
xtensa                           alldefconfig
arm                             rpc_defconfig
arm                             ezx_defconfig
powerpc                  iss476-smp_defconfig
arm                          pxa3xx_defconfig
m68k                                defconfig
xtensa                         virt_defconfig
sh                          r7780mp_defconfig
sh                   sh7770_generic_defconfig
arm                           viper_defconfig
arm                       aspeed_g5_defconfig
arm                         vf610m4_defconfig
arm                           tegra_defconfig
h8300                               defconfig
arm                         cm_x300_defconfig
sh                           se7751_defconfig
powerpc                      ppc6xx_defconfig
arc                           tb10x_defconfig
arm                         s3c6400_defconfig
powerpc                      arches_defconfig
mips                       capcella_defconfig
arm                         lubbock_defconfig
mips                           xway_defconfig
mips                 decstation_r4k_defconfig
m68k                          multi_defconfig
arm                            zeus_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 canyonlands_defconfig
powerpc                      ep88xc_defconfig
powerpc                     ep8248e_defconfig
m68k                        stmark2_defconfig
h8300                     edosk2674_defconfig
sh                   secureedge5410_defconfig
sparc64                          alldefconfig
powerpc                 mpc834x_itx_defconfig
arm                        shmobile_defconfig
mips                     decstation_defconfig
arm                          iop32x_defconfig
nds32                               defconfig
nds32                             allnoconfig
m68k                         amcore_defconfig
powerpc                     tqm8541_defconfig
arm                        spear6xx_defconfig
openrisc                         alldefconfig
powerpc                     sequoia_defconfig
m68k                           sun3_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                       ppc64_defconfig
arm                        multi_v7_defconfig
powerpc                    adder875_defconfig
powerpc                       eiger_defconfig
sh                                  defconfig
ia64                         bigsur_defconfig
powerpc                     rainier_defconfig
arm                          badge4_defconfig
mips                         tb0226_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7705_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
sh                           se7343_defconfig
sh                   sh7724_generic_defconfig
mips                         bigsur_defconfig
sh                   rts7751r2dplus_defconfig
sh                          polaris_defconfig
sh                           se7712_defconfig
xtensa                  audio_kc705_defconfig
mips                        vocore2_defconfig
sh                         microdev_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
mips                        bcm47xx_defconfig
arm                          lpd270_defconfig
mips                            ar7_defconfig
powerpc                     mpc83xx_defconfig
ia64                             allmodconfig
powerpc                     pq2fads_defconfig
openrisc                 simple_smp_defconfig
riscv                    nommu_k210_defconfig
sh                           se7206_defconfig
m68k                        m5272c3_defconfig
powerpc                      makalu_defconfig
powerpc                     asp8347_defconfig
mips                           ip32_defconfig
sh                          rsk7264_defconfig
sh                        sh7763rdp_defconfig
microblaze                      mmu_defconfig
arm                           sama5_defconfig
sh                           sh2007_defconfig
powerpc                      mgcoge_defconfig
sh                          rsk7203_defconfig
arm                      footbridge_defconfig
arm                  randconfig-c002-20220127
arm                  randconfig-c002-20220124
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220129
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
x86_64               randconfig-a001-20220124
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
i386                          randconfig-a003
i386                          randconfig-a001
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
riscv                randconfig-r042-20220129
s390                 randconfig-r044-20220129
arc                  randconfig-r043-20220129
riscv                randconfig-r042-20220127
arc                  randconfig-r043-20220127
arc                  randconfig-r043-20220124
s390                 randconfig-r044-20220127
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
x86_64                        randconfig-c007
riscv                randconfig-c006-20220129
arm                  randconfig-c002-20220129
powerpc              randconfig-c003-20220129
mips                 randconfig-c004-20220129
i386                          randconfig-c001
riscv                randconfig-c006-20220130
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
s390                 randconfig-c005-20220129
mips                         tb0287_defconfig
mips                           ip28_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                      acadia_defconfig
riscv                            alldefconfig
arm                        vexpress_defconfig
arm                         orion5x_defconfig
powerpc                      ppc44x_defconfig
arm                        multi_v5_defconfig
arm                        spear3xx_defconfig
arm                          ixp4xx_defconfig
mips                  cavium_octeon_defconfig
mips                     cu1000-neo_defconfig
arm                            mmp2_defconfig
powerpc                     ppa8548_defconfig
arm                        mvebu_v5_defconfig
powerpc                     mpc5200_defconfig
arm                         s3c2410_defconfig
powerpc                     ksi8560_defconfig
arm                         socfpga_defconfig
arm                         mv78xx0_defconfig
powerpc                     mpc512x_defconfig
mips                      maltaaprp_defconfig
arm                  colibri_pxa300_defconfig
arm                       imx_v4_v5_defconfig
arm                           omap1_defconfig
powerpc                      walnut_defconfig
powerpc                      katmai_defconfig
mips                        bcm63xx_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a005
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r045-20220127
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220127
riscv                randconfig-r042-20220126
hexagon              randconfig-r045-20220126
hexagon              randconfig-r041-20220126
hexagon              randconfig-r045-20220125
hexagon              randconfig-r041-20220125
s390                 randconfig-r044-20220124
hexagon              randconfig-r045-20220129
hexagon              randconfig-r041-20220129
hexagon              randconfig-r045-20220130
hexagon              randconfig-r041-20220130

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
