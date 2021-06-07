Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A82F39D257
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 02:11:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyv0p3kQyz3btd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 10:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyv0N1CYmz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 10:10:37 +1000 (AEST)
IronPort-SDR: U7v19+qXm0aP5Z8VosElULCxaPuPymhV80VuixH+BfY0wefLgf44AvT70cTs2fMxiAlI4fFxHJ
 ldyTBikB389Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="202682434"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; d="scan'208";a="202682434"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2021 17:10:29 -0700
IronPort-SDR: eevyXwi1SPKeinI9m0hH46KptyfqjdA4ChYhDAZ95v8JgbMM7dRh9ff+jtdz/FgmhMIJ/q5Utz
 cfELzzPf2/2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; d="scan'208";a="448910002"
Received: from lkp-server02.sh.intel.com (HELO 1ec8406c5392) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2021 17:10:28 -0700
Received: from kbuild by 1ec8406c5392 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lq2qZ-000875-Jz; Mon, 07 Jun 2021 00:10:27 +0000
Date: Mon, 07 Jun 2021 08:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 8e11d62e2e8769fe29d1ae98b44b23c7233eb8a2
Message-ID: <60bd63d0.Q9UAMr27cmHC4w+b%lkp@intel.com>
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
branch HEAD: 8e11d62e2e8769fe29d1ae98b44b23c7233eb8a2  powerpc/mem: Add back missing header to fix 'no previous prototype' error

elapsed time: 720m

configs tested: 200
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
nds32                            alldefconfig
powerpc                      pcm030_defconfig
sh                           se7343_defconfig
arm                            mps2_defconfig
arm                           sunxi_defconfig
arm                         shannon_defconfig
arm                            lart_defconfig
sh                        sh7785lcr_defconfig
powerpc                  storcenter_defconfig
powerpc                     sequoia_defconfig
sh                             shx3_defconfig
powerpc                     kmeter1_defconfig
microblaze                          defconfig
openrisc                 simple_smp_defconfig
powerpc                       maple_defconfig
powerpc                      bamboo_defconfig
powerpc                      ppc64e_defconfig
arm                         mv78xx0_defconfig
xtensa                          iss_defconfig
m68k                                defconfig
sh                          r7785rp_defconfig
arm                          badge4_defconfig
arm                        multi_v5_defconfig
m68k                        m5272c3_defconfig
powerpc                     kilauea_defconfig
powerpc                      chrp32_defconfig
nds32                             allnoconfig
mips                      fuloong2e_defconfig
xtensa                    smp_lx200_defconfig
arm                       netwinder_defconfig
ia64                             allyesconfig
powerpc                      tqm8xx_defconfig
i386                             alldefconfig
powerpc                      obs600_defconfig
arm                        vexpress_defconfig
powerpc                    adder875_defconfig
m68k                          amiga_defconfig
powerpc                 mpc836x_mds_defconfig
sh                            shmin_defconfig
h8300                    h8300h-sim_defconfig
powerpc                 mpc834x_itx_defconfig
arm                         socfpga_defconfig
arm64                            alldefconfig
arm                        mvebu_v7_defconfig
mips                      pic32mzda_defconfig
sh                ecovec24-romimage_defconfig
mips                             allmodconfig
powerpc                     stx_gp3_defconfig
m68k                          multi_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     ep8248e_defconfig
arm                            xcep_defconfig
arm                         s3c2410_defconfig
arm                          pxa910_defconfig
powerpc                    ge_imp3a_defconfig
arm                           corgi_defconfig
powerpc                      cm5200_defconfig
arc                            hsdk_defconfig
mips                  cavium_octeon_defconfig
powerpc                      pasemi_defconfig
arm                       cns3420vb_defconfig
sh                        apsh4ad0a_defconfig
arm                          iop32x_defconfig
arm                       aspeed_g4_defconfig
mips                  maltasmvp_eva_defconfig
s390                             allyesconfig
arc                        nsim_700_defconfig
mips                            e55_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                     tqm8541_defconfig
mips                     decstation_defconfig
sh                          polaris_defconfig
sh                          kfr2r09_defconfig
powerpc                      pmac32_defconfig
arm                        spear3xx_defconfig
sh                          lboxre2_defconfig
powerpc                     pq2fads_defconfig
sh                             sh03_defconfig
riscv             nommu_k210_sdcard_defconfig
arc                          axs103_defconfig
powerpc                     mpc5200_defconfig
arm                         hackkit_defconfig
arm                         at91_dt_defconfig
sh                               allmodconfig
mips                           ip32_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                        omega2p_defconfig
arm                             rpc_defconfig
mips                          malta_defconfig
powerpc                      ppc44x_defconfig
sh                          rsk7264_defconfig
sh                          r7780mp_defconfig
sh                          sdk7786_defconfig
arm                          collie_defconfig
mips                        maltaup_defconfig
powerpc                     sbc8548_defconfig
powerpc                      ppc40x_defconfig
openrisc                            defconfig
powerpc                        cell_defconfig
arm                          simpad_defconfig
powerpc                      makalu_defconfig
powerpc                     tqm5200_defconfig
arm                           stm32_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                        multi_v7_defconfig
s390                          debug_defconfig
sh                           se7206_defconfig
alpha                            alldefconfig
mips                        bcm47xx_defconfig
riscv                          rv32_defconfig
arm                       imx_v4_v5_defconfig
powerpc                 mpc832x_mds_defconfig
mips                            gpr_defconfig
sh                        edosk7705_defconfig
arm                         nhk8815_defconfig
x86_64                            allnoconfig
riscv                            allyesconfig
ia64                        generic_defconfig
arm                     am200epdkit_defconfig
openrisc                    or1ksim_defconfig
sh                           se7751_defconfig
csky                             alldefconfig
arm                        neponset_defconfig
mips                           ip22_defconfig
arm                       mainstone_defconfig
arm                         s5pv210_defconfig
powerpc                          allmodconfig
mips                      maltasmvp_defconfig
powerpc                           allnoconfig
powerpc                          allyesconfig
m68k                        mvme16x_defconfig
xtensa                              defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
x86_64               randconfig-a002-20210606
x86_64               randconfig-a004-20210606
x86_64               randconfig-a003-20210606
x86_64               randconfig-a006-20210606
x86_64               randconfig-a005-20210606
x86_64               randconfig-a001-20210606
i386                 randconfig-a003-20210606
i386                 randconfig-a006-20210606
i386                 randconfig-a004-20210606
i386                 randconfig-a001-20210606
i386                 randconfig-a005-20210606
i386                 randconfig-a002-20210606
i386                 randconfig-a015-20210606
i386                 randconfig-a013-20210606
i386                 randconfig-a016-20210606
i386                 randconfig-a011-20210606
i386                 randconfig-a014-20210606
i386                 randconfig-a012-20210606
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210606
x86_64               randconfig-b001-20210607
x86_64               randconfig-a015-20210606
x86_64               randconfig-a011-20210606
x86_64               randconfig-a014-20210606
x86_64               randconfig-a012-20210606
x86_64               randconfig-a016-20210606
x86_64               randconfig-a013-20210606

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
