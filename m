Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A495D41116A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 10:54:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCdfk4Kf1z2yxP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 18:54:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCdfJ6rPRz2yKB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 18:54:31 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="221206256"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="221206256"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 01:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="702405819"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2021 01:53:18 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mSF38-0005qi-CM; Mon, 20 Sep 2021 08:53:18 +0000
Date: Mon, 20 Sep 2021 16:53:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 044c2d99d9f43c6d6fde8bed00672517dd9a5a57
Message-ID: <61484bf2.kb/5ePSU0ptbTwSa%lkp@intel.com>
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
branch HEAD: 044c2d99d9f43c6d6fde8bed00672517dd9a5a57  Automatic merge of 'fixes' into merge (2021-09-19 22:18)

elapsed time: 1190m

configs tested: 175
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          landisk_defconfig
arc                     haps_hs_smp_defconfig
arm                            mmp2_defconfig
powerpc                      ppc44x_defconfig
mips                      maltaaprp_defconfig
arm                         nhk8815_defconfig
powerpc                   bluestone_defconfig
powerpc                      bamboo_defconfig
powerpc                        cell_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                   motionpro_defconfig
alpha                               defconfig
arm                           sunxi_defconfig
arm                  colibri_pxa300_defconfig
mips                       capcella_defconfig
powerpc                        warp_defconfig
mips                  decstation_64_defconfig
powerpc                    sam440ep_defconfig
arm64                            alldefconfig
mips                        maltaup_defconfig
powerpc                     sequoia_defconfig
powerpc                      katmai_defconfig
arm                            zeus_defconfig
sh                                  defconfig
m68k                          amiga_defconfig
m68k                       m5249evb_defconfig
sh                          r7785rp_defconfig
arm                       netwinder_defconfig
arm                         lubbock_defconfig
mips                    maltaup_xpa_defconfig
powerpc                 mpc837x_mds_defconfig
arm                       imx_v4_v5_defconfig
mips                         db1xxx_defconfig
arm                   milbeaut_m10v_defconfig
sh                            migor_defconfig
arc                    vdk_hs38_smp_defconfig
xtensa                    smp_lx200_defconfig
mips                           ip32_defconfig
powerpc                      arches_defconfig
mips                       rbtx49xx_defconfig
arm                           viper_defconfig
mips                           ci20_defconfig
arm                        multi_v7_defconfig
m68k                             alldefconfig
arc                                 defconfig
mips                        vocore2_defconfig
arm                      jornada720_defconfig
arm                         axm55xx_defconfig
openrisc                            defconfig
mips                         mpc30x_defconfig
arm                           h5000_defconfig
nds32                            alldefconfig
mips                        workpad_defconfig
arm                            xcep_defconfig
arm                           omap1_defconfig
arm                          exynos_defconfig
powerpc                  mpc866_ads_defconfig
arm                         at91_dt_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                     asp8347_defconfig
mips                       lemote2f_defconfig
powerpc                      cm5200_defconfig
powerpc                          g5_defconfig
arm                           tegra_defconfig
x86_64               randconfig-c001-20210920
arm                  randconfig-c002-20210920
i386                 randconfig-c001-20210920
x86_64               randconfig-c001-20210919
i386                 randconfig-c001-20210919
arm                  randconfig-c002-20210919
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
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                                defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                             allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210919
x86_64               randconfig-a004-20210919
x86_64               randconfig-a006-20210919
x86_64               randconfig-a003-20210919
x86_64               randconfig-a001-20210919
x86_64               randconfig-a005-20210919
i386                 randconfig-a004-20210919
i386                 randconfig-a005-20210919
i386                 randconfig-a002-20210919
i386                 randconfig-a006-20210919
i386                 randconfig-a001-20210919
i386                 randconfig-a003-20210919
x86_64               randconfig-a014-20210920
x86_64               randconfig-a011-20210920
x86_64               randconfig-a013-20210920
x86_64               randconfig-a012-20210920
x86_64               randconfig-a015-20210920
x86_64               randconfig-a016-20210920
i386                 randconfig-a014-20210920
i386                 randconfig-a013-20210920
i386                 randconfig-a016-20210920
i386                 randconfig-a012-20210920
i386                 randconfig-a011-20210920
i386                 randconfig-a015-20210920
arc                  randconfig-r043-20210920
riscv                randconfig-r042-20210920
s390                 randconfig-r044-20210920
arc                  randconfig-r043-20210919
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a002-20210920
x86_64               randconfig-a006-20210920
x86_64               randconfig-a005-20210920
x86_64               randconfig-a001-20210920
x86_64               randconfig-a004-20210920
x86_64               randconfig-a003-20210920
i386                 randconfig-a001-20210920
i386                 randconfig-a005-20210920
i386                 randconfig-a002-20210920
i386                 randconfig-a006-20210920
i386                 randconfig-a003-20210920
i386                 randconfig-a004-20210920
x86_64               randconfig-a013-20210919
x86_64               randconfig-a016-20210919
x86_64               randconfig-a012-20210919
x86_64               randconfig-a011-20210919
x86_64               randconfig-a014-20210919
x86_64               randconfig-a015-20210919
i386                 randconfig-a016-20210919
i386                 randconfig-a012-20210919
i386                 randconfig-a011-20210919
i386                 randconfig-a015-20210919
i386                 randconfig-a013-20210919
i386                 randconfig-a014-20210919
riscv                randconfig-r042-20210919
hexagon              randconfig-r045-20210919
s390                 randconfig-r044-20210919
hexagon              randconfig-r041-20210919

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
