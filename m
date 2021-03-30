Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D834E0ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 07:58:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8dzc4D9Wz30Mm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 16:58:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8dzH2hDFz2yxm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 16:58:17 +1100 (AEDT)
IronPort-SDR: HFJgEYm0RrsqjhJB+zFhUH9liGUPqSoyhxd0vu8AL9WDNPp9ly1klsraJAa8cVMEX20PYm/JBs
 dKhfMBW0fxHA==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="191166012"
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="191166012"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 22:58:15 -0700
IronPort-SDR: iFhqCAteiPmLuxqm5VZoVhbtYBhyAp8E1NA94h7L/as1rG7uv83AV6jUWtowrchz9RzI3a0SqR
 NAEG+Kbcg1kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,289,1610438400"; d="scan'208";a="609985549"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 29 Mar 2021 22:58:14 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lR7OH-00054t-EL; Tue, 30 Mar 2021 05:58:13 +0000
Date: Tue, 30 Mar 2021 13:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 69931cc387cca289e0415c79ce5389119670066d
Message-ID: <6062bdc7./86/hyqaRSDsUY1t%lkp@intel.com>
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
branch HEAD: 69931cc387cca289e0415c79ce5389119670066d  powerpc/powernv: Remove unneeded variable: "rc"

elapsed time: 969m

configs tested: 206
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
arm64                            alldefconfig
xtensa                              defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                      pcm030_defconfig
powerpc                    socrates_defconfig
mips                       lemote2f_defconfig
powerpc                      ppc44x_defconfig
powerpc               mpc834x_itxgp_defconfig
arc                            hsdk_defconfig
sh                            hp6xx_defconfig
powerpc                      makalu_defconfig
m68k                            q40_defconfig
mips                     loongson1c_defconfig
sh                   sh7770_generic_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                            migor_defconfig
mips                         cobalt_defconfig
powerpc                      walnut_defconfig
parisc                generic-32bit_defconfig
sh                         ecovec24_defconfig
arc                    vdk_hs38_smp_defconfig
arm                       versatile_defconfig
arm                         mv78xx0_defconfig
sh                                  defconfig
m68k                          atari_defconfig
arm                      pxa255-idp_defconfig
arm                          iop32x_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                    sam440ep_defconfig
powerpc                  storcenter_defconfig
parisc                           allyesconfig
arm                          simpad_defconfig
m68k                        stmark2_defconfig
xtensa                generic_kc705_defconfig
powerpc                 mpc8540_ads_defconfig
m68k                        mvme16x_defconfig
mips                    maltaup_xpa_defconfig
powerpc                      ppc40x_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                       ebony_defconfig
sh                            titan_defconfig
sparc64                             defconfig
powerpc                 mpc834x_itx_defconfig
mips                         tb0219_defconfig
mips                            ar7_defconfig
arm                     am200epdkit_defconfig
arm                          pxa910_defconfig
arm                          collie_defconfig
m68k                       m5475evb_defconfig
sparc                            allyesconfig
sh                ecovec24-romimage_defconfig
arm                        vexpress_defconfig
arm                         lpc18xx_defconfig
powerpc                     rainier_defconfig
riscv                    nommu_virt_defconfig
powerpc                        cell_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
arm                          gemini_defconfig
powerpc                     ppa8548_defconfig
arm                      tct_hammer_defconfig
powerpc                       holly_defconfig
m68k                            mac_defconfig
powerpc64                        alldefconfig
arm                         hackkit_defconfig
m68k                             alldefconfig
parisc                generic-64bit_defconfig
alpha                               defconfig
xtensa                  cadence_csp_defconfig
arm                  colibri_pxa300_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                          axs101_defconfig
powerpc                      chrp32_defconfig
mips                           xway_defconfig
powerpc                 canyonlands_defconfig
sh                           se7724_defconfig
m68k                        m5407c3_defconfig
arm                          pcm027_defconfig
mips                           rs90_defconfig
sh                        dreamcast_defconfig
arm                        clps711x_defconfig
arm                  colibri_pxa270_defconfig
powerpc                 mpc837x_mds_defconfig
arm                          pxa3xx_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          kfr2r09_defconfig
arm                        neponset_defconfig
arm                       omap2plus_defconfig
arm                          exynos_defconfig
sh                            shmin_defconfig
sh                        edosk7705_defconfig
powerpc                     mpc5200_defconfig
powerpc                  mpc885_ads_defconfig
mips                     loongson1b_defconfig
mips                     decstation_defconfig
sh                         apsh4a3a_defconfig
arm                         assabet_defconfig
sh                               alldefconfig
arm                         s3c6400_defconfig
xtensa                       common_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      ppc64e_defconfig
powerpc                      ppc6xx_defconfig
powerpc                         wii_defconfig
arc                        nsimosci_defconfig
powerpc                         ps3_defconfig
arm                       mainstone_defconfig
arm                           omap1_defconfig
arc                      axs103_smp_defconfig
arm                           spitz_defconfig
arm                         s3c2410_defconfig
arm                      jornada720_defconfig
mips                      pic32mzda_defconfig
mips                        jmr3927_defconfig
m68k                       m5275evb_defconfig
mips                        nlm_xlp_defconfig
sh                           se7206_defconfig
mips                     cu1830-neo_defconfig
nios2                         10m50_defconfig
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
alpha                            allyesconfig
h8300                            allyesconfig
arc                                 defconfig
xtensa                           allyesconfig
sh                               allmodconfig
s390                                defconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210329
x86_64               randconfig-a003-20210329
x86_64               randconfig-a006-20210329
x86_64               randconfig-a001-20210329
x86_64               randconfig-a005-20210329
x86_64               randconfig-a004-20210329
i386                 randconfig-a003-20210329
i386                 randconfig-a004-20210329
i386                 randconfig-a001-20210329
i386                 randconfig-a002-20210329
i386                 randconfig-a006-20210329
i386                 randconfig-a005-20210329
i386                 randconfig-a004-20210330
i386                 randconfig-a006-20210330
i386                 randconfig-a003-20210330
i386                 randconfig-a002-20210330
i386                 randconfig-a001-20210330
i386                 randconfig-a005-20210330
i386                 randconfig-a011-20210329
i386                 randconfig-a016-20210329
i386                 randconfig-a013-20210329
i386                 randconfig-a012-20210329
i386                 randconfig-a014-20210329
i386                 randconfig-a015-20210329
i386                 randconfig-a015-20210330
i386                 randconfig-a011-20210330
i386                 randconfig-a014-20210330
i386                 randconfig-a013-20210330
i386                 randconfig-a016-20210330
i386                 randconfig-a012-20210330
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210329
x86_64               randconfig-a012-20210329
x86_64               randconfig-a013-20210329
x86_64               randconfig-a014-20210329
x86_64               randconfig-a011-20210329
x86_64               randconfig-a016-20210329

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
