Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5196047ED4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 09:38:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JL0nx1JPSz3brd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Dec 2021 19:38:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lGyLLASu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lGyLLASu; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JL0nC2hpTz2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Dec 2021 19:37:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640335071; x=1671871071;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=4Ucac1QXYDy0MbktM0NHF5ueDi8TcJnl1QA2loVBFNA=;
 b=lGyLLASuwe8ECWI+aAgT8itmKEIwvic19afRpsdGv+Rt3B7mEzvm+Tso
 u8YYi54FzqbOs3isDDtcXYxy7rivm1J3o+M1zszOwQ0IsISAJofOOAKst
 ZAJDJo26B9dAu3Do26CQt/3Jc/AnmdNlGFAcbC6/gpj4PsAetaR8UqFzE
 xamIW2gQN1T37W3T1rkDY3+Sx5akRFeuAgsLe7gvW3c+JCVrk/QhSXqz1
 /jrqZpJMCFQKSOSE3CJbeXWPdxHY82nODVYmQt7kRCsrWEsVYDeTTgMe8
 pX+WtYkWfdVWhuco4n3X1he89nxI/4sF967PBsseiStFPB27xrLUcxCXH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="301714161"
X-IronPort-AV: E=Sophos;i="5.88,232,1635231600"; d="scan'208";a="301714161"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2021 00:36:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,232,1635231600"; d="scan'208";a="685617003"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 24 Dec 2021 00:36:45 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n0g4C-0002pu-Es; Fri, 24 Dec 2021 08:36:44 +0000
Date: Fri, 24 Dec 2021 16:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 5b09250cca85ae6f91c9562cf1f5e5747de0a75d
Message-ID: <61c58691.RZFv3FDecdoZutYC%lkp@intel.com>
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
branch HEAD: 5b09250cca85ae6f91c9562cf1f5e5747de0a75d  powerpc/perf: Fix spelling of "its"

elapsed time: 1109m

configs tested: 204
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211223
nds32                            alldefconfig
arm                  colibri_pxa300_defconfig
ia64                        generic_defconfig
mips                          rb532_defconfig
powerpc                 mpc834x_mds_defconfig
parisc                generic-64bit_defconfig
xtensa                         virt_defconfig
m68k                        m5307c3_defconfig
csky                             alldefconfig
sh                              ul2_defconfig
powerpc                     mpc5200_defconfig
arm                       imx_v6_v7_defconfig
sh                   rts7751r2dplus_defconfig
sh                      rts7751r2d1_defconfig
arm                         lubbock_defconfig
arm                   milbeaut_m10v_defconfig
mips                             allmodconfig
m68k                        mvme147_defconfig
arm                            qcom_defconfig
arm                          iop32x_defconfig
arc                          axs103_defconfig
powerpc                      mgcoge_defconfig
powerpc                    mvme5100_defconfig
m68k                         amcore_defconfig
um                           x86_64_defconfig
mips                           ip27_defconfig
arc                              alldefconfig
sh                            migor_defconfig
sh                            hp6xx_defconfig
arm                       spear13xx_defconfig
arm                          gemini_defconfig
arm                         bcm2835_defconfig
powerpc                     rainier_defconfig
sh                            shmin_defconfig
sh                           se7721_defconfig
m68k                            q40_defconfig
arc                      axs103_smp_defconfig
arm                            mmp2_defconfig
arm                           omap1_defconfig
mips                            e55_defconfig
alpha                            alldefconfig
sh                           se7343_defconfig
arm                      integrator_defconfig
mips                        vocore2_defconfig
arm                          simpad_defconfig
powerpc                      ep88xc_defconfig
mips                     decstation_defconfig
arc                            hsdk_defconfig
powerpc                      pmac32_defconfig
arm                        oxnas_v6_defconfig
powerpc                     ppa8548_defconfig
mips                         tb0219_defconfig
powerpc                      pcm030_defconfig
powerpc                    amigaone_defconfig
powerpc                      arches_defconfig
sh                        apsh4ad0a_defconfig
arm                           sunxi_defconfig
m68k                          hp300_defconfig
openrisc                         alldefconfig
mips                      bmips_stb_defconfig
um                                  defconfig
arm                           corgi_defconfig
powerpc                     redwood_defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                 linkstation_defconfig
arm                           u8500_defconfig
arm                            xcep_defconfig
um                               alldefconfig
mips                 decstation_r4k_defconfig
powerpc                     powernv_defconfig
powerpc                 mpc832x_rdb_defconfig
sh                        edosk7760_defconfig
mips                     cu1000-neo_defconfig
arm                           stm32_defconfig
powerpc                       ppc64_defconfig
mips                         rt305x_defconfig
powerpc                       maple_defconfig
powerpc                      obs600_defconfig
sh                          rsk7203_defconfig
mips                       capcella_defconfig
mips                         tb0226_defconfig
xtensa                           alldefconfig
sh                           se7724_defconfig
mips                     loongson1b_defconfig
powerpc                 mpc8313_rdb_defconfig
ia64                             allmodconfig
powerpc                      chrp32_defconfig
powerpc                     tqm5200_defconfig
powerpc                      cm5200_defconfig
h8300                    h8300h-sim_defconfig
h8300                            alldefconfig
arm                     eseries_pxa_defconfig
powerpc64                           defconfig
arm                        neponset_defconfig
um                             i386_defconfig
sh                           se7750_defconfig
powerpc                      ppc40x_defconfig
h8300                               defconfig
arm                      jornada720_defconfig
sh                           se7780_defconfig
arm                         lpc18xx_defconfig
arm                          exynos_defconfig
sh                ecovec24-romimage_defconfig
sh                          lboxre2_defconfig
m68k                            mac_defconfig
nios2                               defconfig
x86_64                           allyesconfig
arm                         palmz72_defconfig
arm                  randconfig-c002-20211223
arm                  randconfig-c002-20211224
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a013-20211223
x86_64               randconfig-a015-20211223
x86_64               randconfig-a014-20211223
x86_64               randconfig-a011-20211223
x86_64               randconfig-a012-20211223
x86_64               randconfig-a016-20211223
i386                 randconfig-a012-20211223
i386                 randconfig-a011-20211223
i386                 randconfig-a014-20211223
i386                 randconfig-a016-20211223
i386                 randconfig-a015-20211223
i386                 randconfig-a013-20211223
arc                  randconfig-r043-20211223
riscv                randconfig-r042-20211223
s390                 randconfig-r044-20211223
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20211223
x86_64               randconfig-a003-20211223
x86_64               randconfig-a005-20211223
x86_64               randconfig-a006-20211223
x86_64               randconfig-a004-20211223
x86_64               randconfig-a002-20211223
i386                 randconfig-a006-20211223
i386                 randconfig-a004-20211223
i386                 randconfig-a002-20211223
i386                 randconfig-a003-20211223
i386                 randconfig-a005-20211223
i386                 randconfig-a001-20211223
x86_64               randconfig-a013-20211224
x86_64               randconfig-a014-20211224
x86_64               randconfig-a015-20211224
x86_64               randconfig-a012-20211224
x86_64               randconfig-a011-20211224
x86_64               randconfig-a016-20211224
i386                 randconfig-a012-20211224
i386                 randconfig-a011-20211224
i386                 randconfig-a014-20211224
i386                 randconfig-a016-20211224
i386                 randconfig-a015-20211224
i386                 randconfig-a013-20211224
hexagon              randconfig-r041-20211223
hexagon              randconfig-r045-20211223
hexagon              randconfig-r041-20211224
hexagon              randconfig-r045-20211224
s390                 randconfig-r044-20211224
riscv                randconfig-r042-20211224

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
