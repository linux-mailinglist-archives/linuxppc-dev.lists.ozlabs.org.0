Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FF8390E1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 04:01:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqZ2C1MkBz3byG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 12:01:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqZ1W3sKyz2xMw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 12:01:19 +1000 (AEST)
IronPort-SDR: NQ2C9bf5l/ln86tmbXqmXjCYmhGFNU9ypqO0liIs73LUBaSTU+5p5xWwtvSZy0fYFBP1Cflf5n
 rlr40UNsHvKw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="266251138"
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="266251138"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 19:01:13 -0700
IronPort-SDR: HJBbBk9y+n8vvIBenJ2O7+9Dj3pjO8MO5jkyxIjIVd1OQZAOm2Xm7lXQSdFp34LGIIRP88V6RZ
 tN6WuR73KICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,330,1613462400"; d="scan'208";a="476700733"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2021 19:01:12 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1llir9-0001vq-CA; Wed, 26 May 2021 02:01:11 +0000
Date: Wed, 26 May 2021 10:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 027f55e87c3094270a3223f7331d033fe15a2b3f
Message-ID: <60adabd2.BPeWTP5NH7cLCo7u%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 027f55e87c3094270a3223f7331d033fe15a2b3f  tty: hvc: udbg_hvc: retry putc on -EAGAIN

elapsed time: 728m

configs tested: 226
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      malta_kvm_defconfig
arc                            hsdk_defconfig
arm                        realview_defconfig
powerpc                        cell_defconfig
mips                       lemote2f_defconfig
powerpc                        icon_defconfig
parisc                generic-64bit_defconfig
mips                     loongson1c_defconfig
arm                   milbeaut_m10v_defconfig
sh                        apsh4ad0a_defconfig
mips                          ath79_defconfig
sh                         microdev_defconfig
arm                          ep93xx_defconfig
x86_64                            allnoconfig
mips                      maltasmvp_defconfig
powerpc                      ppc44x_defconfig
powerpc                      ppc40x_defconfig
sh                        dreamcast_defconfig
powerpc                     stx_gp3_defconfig
powerpc                     mpc512x_defconfig
powerpc                     ksi8560_defconfig
powerpc                     tqm5200_defconfig
sh                            titan_defconfig
csky                                defconfig
arm                       multi_v4t_defconfig
mips                           ip22_defconfig
m68k                             allyesconfig
powerpc                     redwood_defconfig
mips                        omega2p_defconfig
arm                            xcep_defconfig
i386                                defconfig
powerpc                       eiger_defconfig
xtensa                generic_kc705_defconfig
arm                            mmp2_defconfig
powerpc                       ppc64_defconfig
um                               alldefconfig
mips                      loongson3_defconfig
mips                        nlm_xlp_defconfig
openrisc                  or1klitex_defconfig
powerpc                      walnut_defconfig
mips                         db1xxx_defconfig
mips                        maltaup_defconfig
arm                           spitz_defconfig
arm                            lart_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8555_defconfig
arm                          simpad_defconfig
alpha                            alldefconfig
um                           x86_64_defconfig
arm                         s3c6400_defconfig
arc                        vdk_hs38_defconfig
arc                     haps_hs_smp_defconfig
arm                          pcm027_defconfig
arm                        mvebu_v5_defconfig
powerpc                      chrp32_defconfig
m68k                          sun3x_defconfig
arm                        oxnas_v6_defconfig
powerpc                 mpc85xx_cds_defconfig
mips                          ath25_defconfig
um                            kunit_defconfig
arm                          collie_defconfig
powerpc                   motionpro_defconfig
powerpc64                           defconfig
um                             i386_defconfig
sparc64                             defconfig
arm                        multi_v7_defconfig
arm                    vt8500_v6_v7_defconfig
nds32                            alldefconfig
xtensa                         virt_defconfig
mips                     cu1830-neo_defconfig
xtensa                    xip_kc705_defconfig
powerpc                     taishan_defconfig
mips                  cavium_octeon_defconfig
nios2                            alldefconfig
powerpc                     tqm8548_defconfig
arm                      jornada720_defconfig
sh                         ap325rxa_defconfig
mips                       bmips_be_defconfig
riscv                    nommu_k210_defconfig
powerpc                     tqm8541_defconfig
powerpc               mpc834x_itxgp_defconfig
mips                       capcella_defconfig
arm                            mps2_defconfig
nds32                               defconfig
powerpc                      obs600_defconfig
powerpc                      bamboo_defconfig
mips                        bcm47xx_defconfig
arm                         axm55xx_defconfig
sh                          landisk_defconfig
openrisc                    or1ksim_defconfig
mips                      maltaaprp_defconfig
powerpc                     rainier_defconfig
powerpc                      ppc6xx_defconfig
arm                     am200epdkit_defconfig
arm                         hackkit_defconfig
mips                           mtx1_defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
m68k                       m5249evb_defconfig
arm                           tegra_defconfig
riscv                             allnoconfig
csky                             alldefconfig
sparc                       sparc32_defconfig
sh                           se7343_defconfig
sh                           se7619_defconfig
m68k                            q40_defconfig
powerpc                    klondike_defconfig
microblaze                          defconfig
sh                           se7705_defconfig
m68k                        mvme16x_defconfig
arm                             rpc_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                            e55_defconfig
powerpc                 mpc8272_ads_defconfig
powerpc                        fsp2_defconfig
mips                          malta_defconfig
powerpc                         wii_defconfig
sh                               j2_defconfig
arm64                            alldefconfig
sh                   secureedge5410_defconfig
mips                         mpc30x_defconfig
sh                        edosk7705_defconfig
m68k                         apollo_defconfig
arm                      pxa255-idp_defconfig
powerpc                 canyonlands_defconfig
sh                   sh7724_generic_defconfig
powerpc                      pasemi_defconfig
arc                        nsim_700_defconfig
arm                            dove_defconfig
arc                     nsimosci_hs_defconfig
s390                          debug_defconfig
arm                       aspeed_g5_defconfig
mips                          rb532_defconfig
arm                        trizeps4_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nios2                            allyesconfig
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
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210525
i386                 randconfig-a002-20210525
i386                 randconfig-a005-20210525
i386                 randconfig-a006-20210525
i386                 randconfig-a003-20210525
i386                 randconfig-a004-20210525
i386                 randconfig-a001-20210526
i386                 randconfig-a002-20210526
i386                 randconfig-a005-20210526
i386                 randconfig-a004-20210526
i386                 randconfig-a003-20210526
i386                 randconfig-a006-20210526
x86_64               randconfig-a013-20210525
x86_64               randconfig-a012-20210525
x86_64               randconfig-a014-20210525
x86_64               randconfig-a016-20210525
x86_64               randconfig-a015-20210525
x86_64               randconfig-a011-20210525
i386                 randconfig-a011-20210525
i386                 randconfig-a016-20210525
i386                 randconfig-a015-20210525
i386                 randconfig-a012-20210525
i386                 randconfig-a014-20210525
i386                 randconfig-a013-20210525
x86_64               randconfig-a005-20210526
x86_64               randconfig-a001-20210526
x86_64               randconfig-a006-20210526
x86_64               randconfig-a003-20210526
x86_64               randconfig-a004-20210526
x86_64               randconfig-a002-20210526
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
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
x86_64               randconfig-b001-20210525
x86_64               randconfig-b001-20210526
x86_64               randconfig-a005-20210525
x86_64               randconfig-a006-20210525
x86_64               randconfig-a001-20210525
x86_64               randconfig-a003-20210525
x86_64               randconfig-a004-20210525
x86_64               randconfig-a002-20210525
x86_64               randconfig-a013-20210526
x86_64               randconfig-a012-20210526
x86_64               randconfig-a014-20210526
x86_64               randconfig-a016-20210526
x86_64               randconfig-a015-20210526
x86_64               randconfig-a011-20210526

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
