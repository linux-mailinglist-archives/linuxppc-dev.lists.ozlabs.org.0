Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F48B480793
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 10:06:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNTDl24mKz306j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 20:06:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E3mioBB7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E3mioBB7; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNTD15DRMz2xDC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 20:06:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640682369; x=1672218369;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=WlOH3No3LAjNbYcfYkY9fjTtFhe4nMWFrWyivVEbYQk=;
 b=E3mioBB7/2ZATh7vF+MRvW5rtHL1HSp5CrWOUXEkiit2J+GIn69XctPH
 i6CZ28lUP4qCB3zNdV+NVmb0FmPHXGeLEKhmQuHl04XE3Z8lGEavGLmrP
 w2OCU6cdHMhuuMd3rRxwlPPeZXFta9ihwZ/9zaEXjnmmHl/gMoS9TWDep
 pkEe/LjLEMnqpkAAcmN+HxxyKCBvnTxX78HCNhscSZby4Dp9d4fWdtt8H
 gRSIU/kUg7W6kzXPzdjXBJy2u8+B5ErAGyDdbz1XF1hRU+9Qx/LFe41Pz
 hwttLJbuCW//vIXYzU6DynfdOBrPH9GaId5XP4AsogQBwodgscQd8UsIy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="222011354"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="222011354"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 01:04:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="523570320"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 28 Dec 2021 01:04:58 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n28Ph-0007R0-KT; Tue, 28 Dec 2021 09:04:57 +0000
Date: Tue, 28 Dec 2021 17:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS bdcf18e133f656b2c97390a594fc95e37849e682
Message-ID: <61cad331.OIvF0uddgUtzzVtY%lkp@intel.com>
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
branch HEAD: bdcf18e133f656b2c97390a594fc95e37849e682  Automatic merge of 'next' into merge (2021-12-27 08:58)

elapsed time: 2067m

configs tested: 255
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211228
mips                  cavium_octeon_defconfig
h8300                     edosk2674_defconfig
powerpc                        fsp2_defconfig
riscv                    nommu_virt_defconfig
powerpc                 mpc834x_mds_defconfig
arc                        nsimosci_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                      obs600_defconfig
mips                        jmr3927_defconfig
powerpc                   microwatt_defconfig
sh                            shmin_defconfig
m68k                       m5475evb_defconfig
m68k                       m5275evb_defconfig
mips                            gpr_defconfig
arm                         shannon_defconfig
arm                          moxart_defconfig
arc                         haps_hs_defconfig
arm                       netwinder_defconfig
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
h8300                            allyesconfig
powerpc                     ep8248e_defconfig
sparc64                             defconfig
powerpc                       holly_defconfig
powerpc                     skiroot_defconfig
sh                          rsk7203_defconfig
arm                       mainstone_defconfig
arm                           stm32_defconfig
powerpc                     taishan_defconfig
ia64                         bigsur_defconfig
arm                            zeus_defconfig
csky                                defconfig
mips                          rb532_defconfig
arm                         s3c2410_defconfig
sh                              ul2_defconfig
powerpc                      ppc44x_defconfig
arm                        neponset_defconfig
arm                          imote2_defconfig
ia64                             allmodconfig
sh                         ap325rxa_defconfig
powerpc                    amigaone_defconfig
sparc                               defconfig
arm                           spitz_defconfig
arm                         cm_x300_defconfig
openrisc                  or1klitex_defconfig
arm                         at91_dt_defconfig
powerpc                      cm5200_defconfig
arm                          pcm027_defconfig
mips                       rbtx49xx_defconfig
powerpc                   bluestone_defconfig
powerpc                    adder875_defconfig
sparc                       sparc64_defconfig
mips                           ip32_defconfig
arm                        multi_v5_defconfig
mips                      maltaaprp_defconfig
m68k                           sun3_defconfig
arm                             mxs_defconfig
sparc                            alldefconfig
mips                        bcm47xx_defconfig
sh                          rsk7201_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                         palmz72_defconfig
powerpc                    gamecube_defconfig
xtensa                          iss_defconfig
mips                      loongson3_defconfig
powerpc                  iss476-smp_defconfig
sh                          kfr2r09_defconfig
powerpc                 mpc837x_mds_defconfig
sh                  sh7785lcr_32bit_defconfig
nds32                            alldefconfig
sh                 kfr2r09-romimage_defconfig
mips                           ip27_defconfig
arm                           viper_defconfig
arm                           sunxi_defconfig
mips                           ip22_defconfig
xtensa                generic_kc705_defconfig
powerpc                   lite5200b_defconfig
powerpc                 canyonlands_defconfig
arm                        spear3xx_defconfig
powerpc                     tqm8541_defconfig
arm                           h3600_defconfig
mips                           jazz_defconfig
openrisc                            defconfig
xtensa                           alldefconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     redwood_defconfig
m68k                        m5307c3_defconfig
nds32                             allnoconfig
powerpc                  mpc866_ads_defconfig
s390                             alldefconfig
ia64                      gensparse_defconfig
sh                            migor_defconfig
xtensa                    xip_kc705_defconfig
arm                      pxa255-idp_defconfig
arc                          axs103_defconfig
arm                            pleb_defconfig
mips                       capcella_defconfig
m68k                          hp300_defconfig
nios2                            alldefconfig
arm                           u8500_defconfig
powerpc                      chrp32_defconfig
h8300                               defconfig
powerpc                           allnoconfig
sh                           se7724_defconfig
xtensa                       common_defconfig
ia64                            zx1_defconfig
mips                 decstation_r4k_defconfig
xtensa                  cadence_csp_defconfig
m68k                       m5208evb_defconfig
sh                   secureedge5410_defconfig
arc                        nsim_700_defconfig
arm                            xcep_defconfig
arm                          pxa168_defconfig
sh                          rsk7269_defconfig
sh                         ecovec24_defconfig
arm                       omap2plus_defconfig
arm                           corgi_defconfig
sh                          rsk7264_defconfig
powerpc                         wii_defconfig
arc                              allyesconfig
powerpc                       ppc64_defconfig
xtensa                  audio_kc705_defconfig
sh                     sh7710voipgw_defconfig
i386                             alldefconfig
powerpc                 linkstation_defconfig
powerpc64                           defconfig
sh                           sh2007_defconfig
powerpc                        icon_defconfig
arm                         nhk8815_defconfig
powerpc                    ge_imp3a_defconfig
parisc                              defconfig
powerpc                     asp8347_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
mips                            ar7_defconfig
sh                           se7780_defconfig
sh                          landisk_defconfig
arc                            hsdk_defconfig
sh                         microdev_defconfig
powerpc                  storcenter_defconfig
arm                      integrator_defconfig
riscv                    nommu_k210_defconfig
sh                               alldefconfig
riscv             nommu_k210_sdcard_defconfig
mips                         mpc30x_defconfig
arm                           h5000_defconfig
sh                        sh7785lcr_defconfig
um                           x86_64_defconfig
mips                        bcm63xx_defconfig
arm                  randconfig-c002-20211227
arm                  randconfig-c002-20211228
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a005-20211228
x86_64               randconfig-a001-20211228
x86_64               randconfig-a003-20211228
x86_64               randconfig-a006-20211228
x86_64               randconfig-a004-20211228
x86_64               randconfig-a002-20211228
x86_64               randconfig-a013-20211227
x86_64               randconfig-a014-20211227
x86_64               randconfig-a015-20211227
x86_64               randconfig-a011-20211227
x86_64               randconfig-a012-20211227
x86_64               randconfig-a016-20211227
i386                 randconfig-a012-20211227
i386                 randconfig-a011-20211227
i386                 randconfig-a014-20211227
i386                 randconfig-a016-20211227
i386                 randconfig-a015-20211227
i386                 randconfig-a013-20211227
arc                  randconfig-r043-20211227
s390                 randconfig-r044-20211227
riscv                randconfig-r042-20211227
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                                  kexec

clang tested configs:
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
x86_64               randconfig-a015-20211228
x86_64               randconfig-a014-20211228
x86_64               randconfig-a013-20211228
x86_64               randconfig-a012-20211228
x86_64               randconfig-a011-20211228
x86_64               randconfig-a016-20211228
i386                 randconfig-a012-20211228
i386                 randconfig-a011-20211228
i386                 randconfig-a014-20211228
i386                 randconfig-a016-20211228
i386                 randconfig-a013-20211228
i386                 randconfig-a015-20211228
hexagon              randconfig-r041-20211228
riscv                randconfig-r042-20211228
hexagon              randconfig-r045-20211228

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
