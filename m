Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321DE4804BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 22:07:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JN9Gk61y3z3c56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 08:07:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dkpzUSUH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dkpzUSUH; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JN9Fz4KHtz2xWc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 08:06:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640639207; x=1672175207;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=im7FqHbTQCszybx5veswwyapyMBoMesuD1crjbK81oQ=;
 b=dkpzUSUHCbzXTpNlKwedWkDmYyAFLwFtr+XVecibG4nC+uI3a4GT+eq2
 +MdDQ4uVWjjJ310S+Ni4JKHyfkEAOu2y9V6L8Gd/BBo/Rt3nDPT5tEXhe
 Uh9f1sBs84XYQ9fJvNY/D+ZOeYqsda/f+VskcBI9Rst8vd9cZeelUovxZ
 zAAGx7Ps9dzF200VMOoh+hOV2uZ6BzBnOh0NiHLcyBdNWa0s+Me7Mpmkg
 oRVpOw3NLeKqGGmiJ0jU6r6ESbZxwx3pFoxVwGZfDYccjTEJldRAY7iXv
 xQ6Kr0JhODdW62y3TrL+o0sTyoSW7AQy9++ny3LqcdUeRqaMk0aGSc2oo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="221940883"
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; d="scan'208";a="221940883"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 13:05:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; d="scan'208";a="467953668"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 27 Dec 2021 13:05:37 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n1xBY-0006rI-Ra; Mon, 27 Dec 2021 21:05:36 +0000
Date: Tue, 28 Dec 2021 05:05:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS beeac538c366cd2828092adecd1edab28326c55b
Message-ID: <61ca2a88.QlQR7tJ4jbbl06fQ%lkp@intel.com>
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
branch HEAD: beeac538c366cd2828092adecd1edab28326c55b  selftests/powerpc: Add a test of sigreturning to an unaligned address

elapsed time: 4084m

configs tested: 285
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211225
mips                  cavium_octeon_defconfig
h8300                     edosk2674_defconfig
powerpc                        fsp2_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc834x_mds_defconfig
arc                        nsimosci_defconfig
mips                         rt305x_defconfig
powerpc                    ge_imp3a_defconfig
xtensa                generic_kc705_defconfig
mips                             allyesconfig
sh                         microdev_defconfig
sparc                       sparc32_defconfig
m68k                       m5475evb_defconfig
mips                        jmr3927_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
powerpc                          allyesconfig
arm                         shannon_defconfig
arm                          moxart_defconfig
powerpc                      obs600_defconfig
arc                         haps_hs_defconfig
arm                       netwinder_defconfig
s390                       zfcpdump_defconfig
arm                       cns3420vb_defconfig
x86_64                              defconfig
sh                              ul2_defconfig
arm                        spear3xx_defconfig
sh                           se7751_defconfig
ia64                          tiger_defconfig
arm                             rpc_defconfig
arm                   milbeaut_m10v_defconfig
sh                        apsh4ad0a_defconfig
powerpc                 mpc8272_ads_defconfig
arm                         vf610m4_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                            hp6xx_defconfig
powerpc                     stx_gp3_defconfig
powerpc                         ps3_defconfig
nios2                         10m50_defconfig
arm                         lpc32xx_defconfig
riscv                            alldefconfig
arc                          axs101_defconfig
mips                         tb0226_defconfig
arc                     nsimosci_hs_defconfig
arm                            zeus_defconfig
csky                                defconfig
mips                          rb532_defconfig
arm                         s3c2410_defconfig
powerpc                      ppc44x_defconfig
arm                        neponset_defconfig
arm                          imote2_defconfig
riscv                    nommu_k210_defconfig
arm                         lpc18xx_defconfig
um                           x86_64_defconfig
arm                        mvebu_v7_defconfig
ia64                             allmodconfig
sh                         ap325rxa_defconfig
powerpc                    amigaone_defconfig
powerpc                 mpc8540_ads_defconfig
sparc                               defconfig
arm                           spitz_defconfig
mips                           ip27_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                          ixp4xx_defconfig
mips                            e55_defconfig
powerpc                   bluestone_defconfig
powerpc                    adder875_defconfig
sparc                       sparc64_defconfig
mips                           ip32_defconfig
arm                        multi_v5_defconfig
mips                      maltaaprp_defconfig
powerpc                 mpc834x_itx_defconfig
sh                               alldefconfig
mips                     decstation_defconfig
m68k                       bvme6000_defconfig
arm                            hisi_defconfig
m68k                           sun3_defconfig
arm                             mxs_defconfig
sparc                            alldefconfig
mips                        bcm47xx_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          rsk7203_defconfig
mips                     loongson2k_defconfig
s390                             alldefconfig
arm                        trizeps4_defconfig
h8300                       h8s-sim_defconfig
powerpc                      acadia_defconfig
powerpc                       eiger_defconfig
arm                            dove_defconfig
arm                           viper_defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc837x_mds_defconfig
sh                  sh7785lcr_32bit_defconfig
nds32                            alldefconfig
sh                 kfr2r09-romimage_defconfig
arm                           sunxi_defconfig
mips                           ip22_defconfig
powerpc                       ppc64_defconfig
sh                           se7619_defconfig
riscv                            allmodconfig
powerpc                   lite5200b_defconfig
powerpc                 canyonlands_defconfig
arm                    vt8500_v6_v7_defconfig
sh                   secureedge5410_defconfig
powerpc                     redwood_defconfig
m68k                        m5307c3_defconfig
nds32                             allnoconfig
powerpc                  mpc866_ads_defconfig
ia64                      gensparse_defconfig
sh                            migor_defconfig
openrisc                         alldefconfig
h8300                    h8300h-sim_defconfig
powerpc                        cell_defconfig
arm                            mps2_defconfig
sh                          lboxre2_defconfig
arm                            pleb_defconfig
powerpc                       holly_defconfig
mips                       capcella_defconfig
arm                      pxa255-idp_defconfig
arm                         cm_x300_defconfig
sh                      rts7751r2d1_defconfig
mips                           mtx1_defconfig
arm                          pcm027_defconfig
arm                          pxa3xx_defconfig
arm                            mmp2_defconfig
sh                        sh7785lcr_defconfig
m68k                             allyesconfig
powerpc                      chrp32_defconfig
powerpc                      cm5200_defconfig
h8300                               defconfig
powerpc                           allnoconfig
mips                     cu1830-neo_defconfig
sh                          urquell_defconfig
arm                           sama5_defconfig
m68k                       m5208evb_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
arm                          pxa168_defconfig
arm                           stm32_defconfig
arm                           tegra_defconfig
arm                              alldefconfig
powerpc                 mpc836x_rdk_defconfig
arm                          gemini_defconfig
arm                       omap2plus_defconfig
arm                           corgi_defconfig
sh                          rsk7264_defconfig
powerpc                         wii_defconfig
arc                              allyesconfig
xtensa                  audio_kc705_defconfig
sh                     sh7710voipgw_defconfig
arm                         orion5x_defconfig
powerpc                     ppa8548_defconfig
i386                             alldefconfig
sh                          rsk7269_defconfig
powerpc                 linkstation_defconfig
powerpc64                           defconfig
powerpc                    gamecube_defconfig
sh                           sh2007_defconfig
powerpc                        icon_defconfig
arm                         nhk8815_defconfig
parisc                              defconfig
powerpc                     asp8347_defconfig
arm                        mini2440_defconfig
sh                            shmin_defconfig
arm                       multi_v4t_defconfig
powerpc                     tqm5200_defconfig
arm                         s3c6400_defconfig
riscv                             allnoconfig
arm                  colibri_pxa270_defconfig
mips                  decstation_64_defconfig
arm                        clps711x_defconfig
powerpc                      pcm030_defconfig
arm                          collie_defconfig
powerpc                      makalu_defconfig
powerpc                  storcenter_defconfig
ia64                         bigsur_defconfig
arm                      integrator_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                         mpc30x_defconfig
arm                           h5000_defconfig
arm                       imx_v4_v5_defconfig
microblaze                      mmu_defconfig
mips                        bcm63xx_defconfig
xtensa                  cadence_csp_defconfig
arm                  randconfig-c002-20211225
arm                  randconfig-c002-20211227
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allmodconfig
powerpc                          allmodconfig
x86_64               randconfig-a013-20211227
x86_64               randconfig-a014-20211227
x86_64               randconfig-a015-20211227
x86_64               randconfig-a011-20211227
x86_64               randconfig-a012-20211227
x86_64               randconfig-a016-20211227
x86_64               randconfig-a013-20211225
x86_64               randconfig-a014-20211225
x86_64               randconfig-a015-20211225
x86_64               randconfig-a011-20211225
x86_64               randconfig-a012-20211225
x86_64               randconfig-a016-20211225
i386                 randconfig-a012-20211227
i386                 randconfig-a011-20211227
i386                 randconfig-a014-20211227
i386                 randconfig-a016-20211227
i386                 randconfig-a015-20211227
i386                 randconfig-a013-20211227
i386                 randconfig-a012-20211225
i386                 randconfig-a011-20211225
i386                 randconfig-a014-20211225
i386                 randconfig-a016-20211225
i386                 randconfig-a015-20211225
i386                 randconfig-a013-20211225
arc                  randconfig-r043-20211225
s390                 randconfig-r044-20211225
riscv                randconfig-r042-20211225
arc                  randconfig-r043-20211227
s390                 randconfig-r044-20211227
riscv                randconfig-r042-20211227
riscv                            allyesconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20211227
powerpc              randconfig-c003-20211227
mips                 randconfig-c004-20211227
arm                  randconfig-c002-20211227
i386                 randconfig-c001-20211227
x86_64               randconfig-c007-20211227
x86_64               randconfig-a003-20211227
x86_64               randconfig-a001-20211227
x86_64               randconfig-a005-20211227
x86_64               randconfig-a006-20211227
x86_64               randconfig-a004-20211227
x86_64               randconfig-a002-20211227
i386                 randconfig-a006-20211227
i386                 randconfig-a004-20211227
i386                 randconfig-a002-20211227
i386                 randconfig-a003-20211227
i386                 randconfig-a005-20211227
i386                 randconfig-a001-20211227
i386                 randconfig-a002-20211225
i386                 randconfig-a001-20211225
i386                 randconfig-a003-20211225
i386                 randconfig-a004-20211225
i386                 randconfig-a006-20211225
i386                 randconfig-a005-20211225
x86_64               randconfig-a003-20211225
x86_64               randconfig-a001-20211225
x86_64               randconfig-a005-20211225
x86_64               randconfig-a006-20211225
x86_64               randconfig-a004-20211225
x86_64               randconfig-a002-20211225

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
