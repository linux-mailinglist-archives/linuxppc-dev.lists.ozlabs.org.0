Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B1A315F27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 06:46:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db7zd1tRjzDspl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 16:46:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db7tv3D47zDsn4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 16:42:12 +1100 (AEDT)
IronPort-SDR: 8Nx2k9FTvlNgvXWVykn1O4FxwTgIB2zlIdhir/YSYsQkdT0zfunAxxFdHOY6WSANVqq0F2GdIZ
 LNj8UQkwp5XA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="181242593"
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="181242593"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 21:42:10 -0800
IronPort-SDR: rx7yjDdVohwdiOV9eAR62OBr23eDr3ii4WIVMIvLQQ2f9bpTpSqktg7d9HQfPpwnlx49As08Gx
 ml4gOpiyGV/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,167,1610438400"; d="scan'208";a="420403134"
Received: from lkp-server02.sh.intel.com (HELO cd560a204411) ([10.239.97.151])
 by fmsmga002.fm.intel.com with ESMTP; 09 Feb 2021 21:42:08 -0800
Received: from kbuild by cd560a204411 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l9iGO-0002hs-3g; Wed, 10 Feb 2021 05:42:08 +0000
Date: Wed, 10 Feb 2021 13:41:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 8c511eff1827239f24ded212b1bcda7ca5b16203
Message-ID: <60237219.kHXKKlTiI7DpG3K6%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 8c511eff1827239f24ded212b1bcda7ca5b16203  powerpc/kuap: Allow kernel thread to access userspace after kthread_use_mm

elapsed time: 5331m

configs tested: 245
configs skipped: 23

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
powerpc                      tqm8xx_defconfig
m68k                            q40_defconfig
powerpc                     tqm5200_defconfig
openrisc                            defconfig
sh                             shx3_defconfig
m68k                       m5208evb_defconfig
sh                        edosk7760_defconfig
sparc                            alldefconfig
arm                         palmz72_defconfig
h8300                    h8300h-sim_defconfig
sh                          r7785rp_defconfig
sparc64                             defconfig
arm                     am200epdkit_defconfig
sh                            shmin_defconfig
powerpc                     tqm8540_defconfig
mips                           ci20_defconfig
nds32                             allnoconfig
mips                         tb0226_defconfig
riscv                               defconfig
xtensa                  cadence_csp_defconfig
powerpc                      ep88xc_defconfig
arm                              zx_defconfig
x86_64                           alldefconfig
mips                          rb532_defconfig
powerpc                 mpc836x_mds_defconfig
m68k                       m5249evb_defconfig
sh                   sh7770_generic_defconfig
mips                         cobalt_defconfig
arc                        nsimosci_defconfig
xtensa                         virt_defconfig
microblaze                          defconfig
powerpc                     ksi8560_defconfig
sh                             sh03_defconfig
mips                           rs90_defconfig
powerpc                     pseries_defconfig
arm                       spear13xx_defconfig
powerpc                     kmeter1_defconfig
mips                       lemote2f_defconfig
mips                         rt305x_defconfig
mips                      fuloong2e_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                          exynos_defconfig
arm                          ixp4xx_defconfig
arm                  colibri_pxa300_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                      ppc6xx_defconfig
powerpc                         wii_defconfig
arc                          axs103_defconfig
powerpc                    sam440ep_defconfig
nios2                               defconfig
m68k                        m5307c3_defconfig
m68k                       m5275evb_defconfig
xtensa                       common_defconfig
powerpc                 mpc8315_rdb_defconfig
mips                      pic32mzda_defconfig
mips                        maltaup_defconfig
mips                       rbtx49xx_defconfig
ia64                      gensparse_defconfig
sh                          lboxre2_defconfig
s390                          debug_defconfig
openrisc                  or1klitex_defconfig
powerpc                 linkstation_defconfig
arm                            xcep_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                             alldefconfig
mips                     cu1830-neo_defconfig
arm                        mini2440_defconfig
arm                          ep93xx_defconfig
arm                           sunxi_defconfig
powerpc                      makalu_defconfig
riscv                    nommu_k210_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                 mpc8560_ads_defconfig
arm                         s5pv210_defconfig
sh                      rts7751r2d1_defconfig
arm                           stm32_defconfig
mips                       bmips_be_defconfig
um                            kunit_defconfig
powerpc                     ppa8548_defconfig
arc                              allyesconfig
arm                       versatile_defconfig
powerpc                     stx_gp3_defconfig
sh                        sh7785lcr_defconfig
arm                           sama5_defconfig
sh                        sh7763rdp_defconfig
mips                        bcm47xx_defconfig
openrisc                    or1ksim_defconfig
powerpc                      pasemi_defconfig
arm                             mxs_defconfig
arc                              alldefconfig
mips                          ath79_defconfig
c6x                        evmc6474_defconfig
arm                          pxa3xx_defconfig
powerpc                    socrates_defconfig
xtensa                    smp_lx200_defconfig
mips                        jmr3927_defconfig
powerpc                       ppc64_defconfig
c6x                              allyesconfig
mips                          rm200_defconfig
arm                       aspeed_g5_defconfig
powerpc                      bamboo_defconfig
powerpc                 mpc85xx_cds_defconfig
xtensa                  audio_kc705_defconfig
sh                               allmodconfig
m68k                             alldefconfig
powerpc                    adder875_defconfig
sh                            migor_defconfig
mips                   sb1250_swarm_defconfig
arm                            zeus_defconfig
powerpc                     pq2fads_defconfig
mips                            e55_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                    vt8500_v6_v7_defconfig
arm                             pxa_defconfig
mips                           xway_defconfig
arm                       netwinder_defconfig
mips                            gpr_defconfig
arc                        vdk_hs38_defconfig
powerpc                     sequoia_defconfig
powerpc                     taishan_defconfig
alpha                               defconfig
mips                      maltaaprp_defconfig
m68k                       m5475evb_defconfig
mips                          malta_defconfig
m68k                        mvme147_defconfig
arm                       cns3420vb_defconfig
alpha                            allyesconfig
xtensa                  nommu_kc705_defconfig
arm                        mvebu_v7_defconfig
arm                         s3c2410_defconfig
powerpc                        cell_defconfig
sh                   rts7751r2dplus_defconfig
arm                         hackkit_defconfig
sh                          rsk7201_defconfig
m68k                             allyesconfig
arc                          axs101_defconfig
openrisc                 simple_smp_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                            mac_defconfig
sh                        dreamcast_defconfig
mips                 decstation_r4k_defconfig
arm                       imx_v4_v5_defconfig
microblaze                      mmu_defconfig
sh                  sh7785lcr_32bit_defconfig
nios2                         3c120_defconfig
powerpc                     powernv_defconfig
sh                     sh7710voipgw_defconfig
h8300                     edosk2674_defconfig
powerpc                      ppc40x_defconfig
m68k                          multi_defconfig
arm                         socfpga_defconfig
um                           x86_64_defconfig
arm                            lart_defconfig
arm                        keystone_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210209
x86_64               randconfig-a001-20210209
x86_64               randconfig-a005-20210209
x86_64               randconfig-a004-20210209
x86_64               randconfig-a002-20210209
x86_64               randconfig-a003-20210209
i386                 randconfig-a001-20210209
i386                 randconfig-a005-20210209
i386                 randconfig-a003-20210209
i386                 randconfig-a002-20210209
i386                 randconfig-a006-20210209
i386                 randconfig-a004-20210209
i386                 randconfig-a001-20210206
i386                 randconfig-a005-20210206
i386                 randconfig-a003-20210206
i386                 randconfig-a006-20210206
i386                 randconfig-a002-20210206
i386                 randconfig-a004-20210206
x86_64               randconfig-a013-20210206
x86_64               randconfig-a014-20210206
x86_64               randconfig-a015-20210206
x86_64               randconfig-a011-20210206
x86_64               randconfig-a016-20210206
x86_64               randconfig-a012-20210206
i386                 randconfig-a016-20210209
i386                 randconfig-a013-20210209
i386                 randconfig-a012-20210209
i386                 randconfig-a014-20210209
i386                 randconfig-a011-20210209
i386                 randconfig-a015-20210209
i386                 randconfig-a013-20210206
i386                 randconfig-a016-20210206
i386                 randconfig-a014-20210206
i386                 randconfig-a012-20210206
i386                 randconfig-a015-20210206
i386                 randconfig-a011-20210206
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20210209
x86_64               randconfig-a014-20210209
x86_64               randconfig-a015-20210209
x86_64               randconfig-a012-20210209
x86_64               randconfig-a016-20210209
x86_64               randconfig-a011-20210209
x86_64               randconfig-a006-20210206
x86_64               randconfig-a001-20210206
x86_64               randconfig-a005-20210206
x86_64               randconfig-a002-20210206
x86_64               randconfig-a004-20210206
x86_64               randconfig-a003-20210206

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
