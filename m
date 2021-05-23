Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D99C238DE2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 01:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpHCL65nVz2yxX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 09:50:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpHBv5Hsvz2yWG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 09:49:56 +1000 (AEST)
IronPort-SDR: YllSIzcSkWOfA/mu1IbTSAJQ1A01BBtAxZbgoKlc0oBhzY2PSMHw/ey0ialHugUihfmIwGI7rD
 GQGOEKqpbkJg==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="201852217"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="201852217"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2021 16:49:53 -0700
IronPort-SDR: qAJbGQJQIra8/Xea7hXhN36MGE3TZYox2ZvB3QjBlO0SeNrC0kjMC1uEaLYSvzRVa3/xUrn2xU
 S2MQJ5qjhWSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="463403998"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 23 May 2021 16:49:52 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lkxqx-00010j-Ea; Sun, 23 May 2021 23:49:51 +0000
Date: Mon, 24 May 2021 07:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 b49f9d9b0e428909796b4a7e7f1049f489859e0f
Message-ID: <60aaea05.S5rj29eCaIbGiLc8%lkp@intel.com>
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
branch HEAD: b49f9d9b0e428909796b4a7e7f1049f489859e0f  powerpc/kprobes: Fix validation of prefixed instructions across page boundary

elapsed time: 2177m

configs tested: 290
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
openrisc                         alldefconfig
powerpc                 xes_mpc85xx_defconfig
i386                                defconfig
mips                          ath79_defconfig
sh                        sh7785lcr_defconfig
mips                         rt305x_defconfig
m68k                       m5249evb_defconfig
mips                     loongson1c_defconfig
arm                        mini2440_defconfig
powerpc                         wii_defconfig
microblaze                          defconfig
mips                     cu1830-neo_defconfig
mips                       bmips_be_defconfig
powerpc                     tqm8560_defconfig
sh                               j2_defconfig
arm                            pleb_defconfig
arm                         lubbock_defconfig
arm                        mvebu_v7_defconfig
sh                           se7619_defconfig
powerpc                      tqm8xx_defconfig
powerpc                      mgcoge_defconfig
ia64                        generic_defconfig
arm                         s5pv210_defconfig
arm                          pxa168_defconfig
powerpc                  iss476-smp_defconfig
arm                             pxa_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
m68k                          amiga_defconfig
powerpc                     ppa8548_defconfig
h8300                            allyesconfig
powerpc                      chrp32_defconfig
arm                         hackkit_defconfig
openrisc                            defconfig
openrisc                 simple_smp_defconfig
arc                        vdk_hs38_defconfig
sh                          polaris_defconfig
powerpc                    adder875_defconfig
m68k                        m5307c3_defconfig
powerpc                 mpc832x_mds_defconfig
mips                        nlm_xlr_defconfig
arm                            lart_defconfig
sh                         microdev_defconfig
mips                       capcella_defconfig
arm                          lpd270_defconfig
sh                          rsk7264_defconfig
x86_64                           alldefconfig
powerpc                     pseries_defconfig
ia64                            zx1_defconfig
ia64                      gensparse_defconfig
powerpc                     mpc512x_defconfig
powerpc                      ppc64e_defconfig
riscv                    nommu_virt_defconfig
sh                            shmin_defconfig
xtensa                           alldefconfig
mips                      loongson3_defconfig
arm                         orion5x_defconfig
arm                          pxa3xx_defconfig
powerpc                          g5_defconfig
arc                          axs101_defconfig
riscv                    nommu_k210_defconfig
arm                           stm32_defconfig
powerpc                       ppc64_defconfig
arm                           h5000_defconfig
sh                              ul2_defconfig
sh                ecovec24-romimage_defconfig
xtensa                       common_defconfig
powerpc                       ebony_defconfig
sh                        edosk7760_defconfig
powerpc                      cm5200_defconfig
s390                             allmodconfig
powerpc                        cell_defconfig
nios2                         3c120_defconfig
mips                     loongson2k_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc836x_mds_defconfig
xtensa                generic_kc705_defconfig
ia64                          tiger_defconfig
arm                             ezx_defconfig
arm                         lpc32xx_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                          urquell_defconfig
sparc64                             defconfig
mips                          rb532_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                         tb0226_defconfig
sh                             shx3_defconfig
powerpc                      makalu_defconfig
mips                           ip27_defconfig
sh                          kfr2r09_defconfig
mips                malta_qemu_32r6_defconfig
arm64                            alldefconfig
sh                                  defconfig
m68k                       m5475evb_defconfig
arm                        spear6xx_defconfig
um                             i386_defconfig
xtensa                              defconfig
sh                        edosk7705_defconfig
sh                          landisk_defconfig
arm                      footbridge_defconfig
arm                          collie_defconfig
sh                          rsk7201_defconfig
mips                        qi_lb60_defconfig
arm                          pxa910_defconfig
sh                        sh7757lcr_defconfig
arm                      pxa255-idp_defconfig
m68k                            mac_defconfig
powerpc                          allmodconfig
m68k                        m5272c3_defconfig
powerpc                     tqm8541_defconfig
mips                      bmips_stb_defconfig
riscv                               defconfig
mips                        bcm63xx_defconfig
sh                          rsk7203_defconfig
sh                         apsh4a3a_defconfig
arm                             rpc_defconfig
arm                           sunxi_defconfig
powerpc                         ps3_defconfig
m68k                            q40_defconfig
ia64                         bigsur_defconfig
powerpc                    amigaone_defconfig
arc                           tb10x_defconfig
arm                        magician_defconfig
mips                       lemote2f_defconfig
arm                       cns3420vb_defconfig
arm                           viper_defconfig
powerpc                 mpc8560_ads_defconfig
sh                           sh2007_defconfig
um                            kunit_defconfig
powerpc                     powernv_defconfig
sh                          r7780mp_defconfig
arc                         haps_hs_defconfig
sh                   sh7770_generic_defconfig
mips                        vocore2_defconfig
arm                         nhk8815_defconfig
m68k                           sun3_defconfig
arm                        neponset_defconfig
powerpc                      pasemi_defconfig
powerpc                      obs600_defconfig
powerpc                mpc7448_hpc2_defconfig
mips                 decstation_r4k_defconfig
powerpc                     akebono_defconfig
arm                         palmz72_defconfig
m68k                        mvme147_defconfig
arm                           tegra_defconfig
mips                  decstation_64_defconfig
arc                     haps_hs_smp_defconfig
arm                         vf610m4_defconfig
h8300                               defconfig
h8300                     edosk2674_defconfig
powerpc                      pcm030_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                          atari_defconfig
powerpc                      katmai_defconfig
sh                     sh7710voipgw_defconfig
sh                      rts7751r2d1_defconfig
mips                         tb0219_defconfig
arm                          gemini_defconfig
mips                            gpr_defconfig
arc                          axs103_defconfig
sh                           se7750_defconfig
arm                           corgi_defconfig
mips                          malta_defconfig
mips                         mpc30x_defconfig
mips                          ath25_defconfig
x86_64                            allnoconfig
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
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210522
x86_64               randconfig-a006-20210522
x86_64               randconfig-a005-20210522
x86_64               randconfig-a003-20210522
x86_64               randconfig-a004-20210522
x86_64               randconfig-a002-20210522
x86_64               randconfig-a005-20210524
x86_64               randconfig-a001-20210524
x86_64               randconfig-a006-20210524
x86_64               randconfig-a003-20210524
x86_64               randconfig-a004-20210524
x86_64               randconfig-a002-20210524
i386                 randconfig-a001-20210524
i386                 randconfig-a002-20210524
i386                 randconfig-a005-20210524
i386                 randconfig-a006-20210524
i386                 randconfig-a004-20210524
i386                 randconfig-a003-20210524
i386                 randconfig-a001-20210523
i386                 randconfig-a005-20210523
i386                 randconfig-a002-20210523
i386                 randconfig-a003-20210523
i386                 randconfig-a004-20210523
i386                 randconfig-a006-20210523
i386                 randconfig-a001-20210522
i386                 randconfig-a005-20210522
i386                 randconfig-a002-20210522
i386                 randconfig-a004-20210522
i386                 randconfig-a003-20210522
i386                 randconfig-a006-20210522
x86_64               randconfig-a013-20210523
x86_64               randconfig-a014-20210523
x86_64               randconfig-a012-20210523
x86_64               randconfig-a016-20210523
x86_64               randconfig-a015-20210523
x86_64               randconfig-a011-20210523
i386                 randconfig-a016-20210523
i386                 randconfig-a011-20210523
i386                 randconfig-a015-20210523
i386                 randconfig-a012-20210523
i386                 randconfig-a014-20210523
i386                 randconfig-a013-20210523
i386                 randconfig-a016-20210522
i386                 randconfig-a011-20210522
i386                 randconfig-a015-20210522
i386                 randconfig-a012-20210522
i386                 randconfig-a014-20210522
i386                 randconfig-a013-20210522
i386                 randconfig-a011-20210524
i386                 randconfig-a016-20210524
i386                 randconfig-a015-20210524
i386                 randconfig-a012-20210524
i386                 randconfig-a014-20210524
i386                 randconfig-a013-20210524
riscv                            allyesconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210524
x86_64               randconfig-b001-20210522
x86_64               randconfig-b001-20210523
x86_64               randconfig-a006-20210523
x86_64               randconfig-a001-20210523
x86_64               randconfig-a005-20210523
x86_64               randconfig-a003-20210523
x86_64               randconfig-a004-20210523
x86_64               randconfig-a002-20210523
x86_64               randconfig-a013-20210524
x86_64               randconfig-a012-20210524
x86_64               randconfig-a014-20210524
x86_64               randconfig-a016-20210524
x86_64               randconfig-a015-20210524
x86_64               randconfig-a011-20210524
x86_64               randconfig-a013-20210522
x86_64               randconfig-a014-20210522
x86_64               randconfig-a012-20210522
x86_64               randconfig-a016-20210522
x86_64               randconfig-a015-20210522
x86_64               randconfig-a011-20210522

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
