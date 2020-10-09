Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6728800A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 03:35:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6rHL05WjzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 12:35:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6rDy1yFVzDqZC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 12:33:22 +1100 (AEDT)
IronPort-SDR: m3X/QTvd9BTr8agzDM2I62bpZTIVxX5VERc9yUnMyuVkvVodit1/dFPJWRQSNhgkp7PBZc66C2
 Sod3b39meA4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9768"; a="250123392"
X-IronPort-AV: E=Sophos;i="5.77,353,1596524400"; d="scan'208";a="250123392"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2020 18:33:19 -0700
IronPort-SDR: ypE0SdwlQRvdvgJ5FHg5vQnP3nMe14DknasmWm2DrVqlWXf6Ua4LUVYRuJJS8xcc/p0a1P8zJZ
 0TSu73xosTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,353,1596524400"; d="scan'208";a="298285051"
Received: from lkp-server02.sh.intel.com (HELO 80eb06af76cf) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 08 Oct 2020 18:33:18 -0700
Received: from kbuild by 80eb06af76cf with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kQhHZ-00003t-DJ; Fri, 09 Oct 2020 01:33:17 +0000
Date: Fri, 09 Oct 2020 09:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS a2d0230b91f7e23ceb5d8fb6a9799f30517ec33a
Message-ID: <5f7fbd9f.cZy2kF9PQ4Sp7Y93%lkp@intel.com>
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
branch HEAD: a2d0230b91f7e23ceb5d8fb6a9799f30517ec33a  cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_reboot_notifier

elapsed time: 870m

configs tested: 215
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                  colibri_pxa300_defconfig
m68k                       m5475evb_defconfig
mips                      fuloong2e_defconfig
arm                          exynos_defconfig
mips                         bigsur_defconfig
powerpc                       eiger_defconfig
mips                       rbtx49xx_defconfig
arm                           tegra_defconfig
powerpc                        icon_defconfig
powerpc                  mpc885_ads_defconfig
mips                      bmips_stb_defconfig
arm                      footbridge_defconfig
sh                         ap325rxa_defconfig
powerpc                 xes_mpc85xx_defconfig
m68k                        m5307c3_defconfig
arm                             mxs_defconfig
h8300                               defconfig
nios2                               defconfig
xtensa                generic_kc705_defconfig
sh                   secureedge5410_defconfig
sh                        apsh4ad0a_defconfig
arm                       multi_v4t_defconfig
m68k                           sun3_defconfig
sh                          rsk7203_defconfig
sh                 kfr2r09-romimage_defconfig
c6x                        evmc6678_defconfig
powerpc                      ppc64e_defconfig
powerpc                        warp_defconfig
sh                          polaris_defconfig
arm                           sama5_defconfig
powerpc                      bamboo_defconfig
sh                         ecovec24_defconfig
m68k                             allmodconfig
arm                             ezx_defconfig
powerpc                     tqm8540_defconfig
arm                       imx_v6_v7_defconfig
arm                      pxa255-idp_defconfig
powerpc                     stx_gp3_defconfig
powerpc                       maple_defconfig
sh                          urquell_defconfig
powerpc               mpc834x_itxgp_defconfig
powerpc                         ps3_defconfig
arm                           h3600_defconfig
powerpc                     mpc512x_defconfig
parisc                           allyesconfig
arm                       omap2plus_defconfig
m68k                         apollo_defconfig
powerpc                          g5_defconfig
mips                          ath25_defconfig
sh                          landisk_defconfig
mips                     decstation_defconfig
sparc                               defconfig
powerpc                     pseries_defconfig
arm                       netwinder_defconfig
arm                          ep93xx_defconfig
i386                             alldefconfig
powerpc                 mpc834x_itx_defconfig
powerpc                     powernv_defconfig
powerpc                      mgcoge_defconfig
m68k                        mvme16x_defconfig
arc                    vdk_hs38_smp_defconfig
arc                          axs103_defconfig
powerpc                  storcenter_defconfig
sh                        dreamcast_defconfig
m68k                       m5275evb_defconfig
powerpc                     ppa8548_defconfig
openrisc                    or1ksim_defconfig
sh                          rsk7201_defconfig
riscv                             allnoconfig
arm                             pxa_defconfig
mips                           mtx1_defconfig
mips                          malta_defconfig
c6x                              allyesconfig
powerpc                      pmac32_defconfig
mips                      malta_kvm_defconfig
sh                           se7721_defconfig
arc                     haps_hs_smp_defconfig
sh                          r7780mp_defconfig
sh                          r7785rp_defconfig
um                             i386_defconfig
powerpc                     tqm8548_defconfig
sh                           se7712_defconfig
mips                         mpc30x_defconfig
powerpc                     kilauea_defconfig
powerpc                      makalu_defconfig
arm                            qcom_defconfig
arm                             rpc_defconfig
c6x                              alldefconfig
arm                      integrator_defconfig
sh                        sh7757lcr_defconfig
arm                         assabet_defconfig
sparc                       sparc32_defconfig
h8300                            alldefconfig
arm                           viper_defconfig
powerpc                      ppc44x_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5249evb_defconfig
xtensa                    smp_lx200_defconfig
arm                        keystone_defconfig
arm                         cm_x300_defconfig
mips                         db1xxx_defconfig
powerpc                      ppc6xx_defconfig
riscv                               defconfig
powerpc                    ge_imp3a_defconfig
arm                         axm55xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                    gamecube_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                       aspeed_g5_defconfig
mips                     cu1000-neo_defconfig
sh                           se7619_defconfig
arm                         nhk8815_defconfig
i386                             allyesconfig
arm                         bcm2835_defconfig
sh                             espt_defconfig
mips                      loongson3_defconfig
mips                           ip28_defconfig
arm                        shmobile_defconfig
powerpc                      arches_defconfig
powerpc                     ksi8560_defconfig
arm                     davinci_all_defconfig
powerpc                          allyesconfig
mips                  decstation_64_defconfig
powerpc                     kmeter1_defconfig
powerpc                      obs600_defconfig
mips                       capcella_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
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
s390                                defconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201008
x86_64               randconfig-a003-20201008
x86_64               randconfig-a005-20201008
x86_64               randconfig-a001-20201008
x86_64               randconfig-a002-20201008
x86_64               randconfig-a006-20201008
i386                 randconfig-a006-20201008
i386                 randconfig-a005-20201008
i386                 randconfig-a001-20201008
i386                 randconfig-a004-20201008
i386                 randconfig-a002-20201008
i386                 randconfig-a003-20201008
i386                 randconfig-a006-20201009
i386                 randconfig-a005-20201009
i386                 randconfig-a001-20201009
i386                 randconfig-a004-20201009
i386                 randconfig-a002-20201009
i386                 randconfig-a003-20201009
x86_64               randconfig-a012-20201009
x86_64               randconfig-a015-20201009
x86_64               randconfig-a013-20201009
x86_64               randconfig-a014-20201009
x86_64               randconfig-a011-20201009
x86_64               randconfig-a016-20201009
i386                 randconfig-a015-20201009
i386                 randconfig-a013-20201009
i386                 randconfig-a014-20201009
i386                 randconfig-a016-20201009
i386                 randconfig-a011-20201009
i386                 randconfig-a012-20201009
i386                 randconfig-a015-20201008
i386                 randconfig-a013-20201008
i386                 randconfig-a014-20201008
i386                 randconfig-a016-20201008
i386                 randconfig-a011-20201008
i386                 randconfig-a012-20201008
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201009
x86_64               randconfig-a003-20201009
x86_64               randconfig-a005-20201009
x86_64               randconfig-a001-20201009
x86_64               randconfig-a002-20201009
x86_64               randconfig-a006-20201009
x86_64               randconfig-a012-20201008
x86_64               randconfig-a015-20201008
x86_64               randconfig-a013-20201008
x86_64               randconfig-a014-20201008
x86_64               randconfig-a011-20201008
x86_64               randconfig-a016-20201008

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
