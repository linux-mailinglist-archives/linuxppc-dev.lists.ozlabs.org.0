Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE922E275A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 14:28:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1rWX3jY5zDqMt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Dec 2020 00:28:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1rTH1xWHzDqNL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Dec 2020 00:26:56 +1100 (AEDT)
IronPort-SDR: ZuIQ4Rco7e7NZHotWndmnHKHkuz8EVd0DPVV+6ASiNWkIR7IsR15CfUG3eeuXU1EDH36Q8tT5A
 Y4Sz1/nVgbBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="194612098"
X-IronPort-AV: E=Sophos;i="5.78,444,1599548400"; d="scan'208";a="194612098"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2020 05:26:49 -0800
IronPort-SDR: 9HL2gFprMjXXHfAY04lwJ7KuaA0Om1qffrvdpzpPjsVESLZ9Nc2f6an5MNf4sEFXcycGMz6O15
 OSoc0MAfd9/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,444,1599548400"; d="scan'208";a="374410892"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 24 Dec 2020 05:26:48 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ksQdj-000107-Dg; Thu, 24 Dec 2020 13:26:47 +0000
Date: Thu, 24 Dec 2020 21:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS d5c243989fb0cb03c74d7340daca3b819f706ee7
Message-ID: <5fe496fa.0lW1ANRWZ00dpTJP%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes
branch HEAD: d5c243989fb0cb03c74d7340daca3b819f706ee7  powerpc/32: Fix vmap stack - Properly set r1 before activating MMU on syscall too

elapsed time: 4324m

configs tested: 148
configs skipped: 146

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc866_ads_defconfig
i386                             alldefconfig
parisc                generic-32bit_defconfig
powerpc                     sequoia_defconfig
m68k                          amiga_defconfig
sh                            titan_defconfig
mips                       bmips_be_defconfig
arm                           h5000_defconfig
mips                           ip22_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                     tqm8555_defconfig
arc                           tb10x_defconfig
xtensa                       common_defconfig
c6x                        evmc6474_defconfig
powerpc                 mpc834x_mds_defconfig
i386                             allyesconfig
arc                     haps_hs_smp_defconfig
arm                         vf610m4_defconfig
xtensa                              defconfig
arm                            u300_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                            q40_defconfig
m68k                       m5208evb_defconfig
arm                          pxa168_defconfig
powerpc                        icon_defconfig
powerpc                    ge_imp3a_defconfig
arm                           corgi_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                      ppc40x_defconfig
nds32                             allnoconfig
x86_64                           alldefconfig
sparc                       sparc64_defconfig
m68k                       bvme6000_defconfig
arm                          prima2_defconfig
sparc                            alldefconfig
powerpc                mpc7448_hpc2_defconfig
microblaze                      mmu_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     tqm8560_defconfig
powerpc                    sam440ep_defconfig
m68k                        mvme16x_defconfig
powerpc                  storcenter_defconfig
arm                      integrator_defconfig
sh                             espt_defconfig
arm                        realview_defconfig
s390                             alldefconfig
powerpc                 canyonlands_defconfig
powerpc                    klondike_defconfig
powerpc                      cm5200_defconfig
arm                  colibri_pxa270_defconfig
xtensa                           alldefconfig
powerpc                     akebono_defconfig
mips                        maltaup_defconfig
arm                           u8500_defconfig
arm                          iop32x_defconfig
arc                              alldefconfig
mips                      fuloong2e_defconfig
powerpc                    mvme5100_defconfig
arm                       cns3420vb_defconfig
arm                             rpc_defconfig
arm                         palmz72_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                        spear6xx_defconfig
arm                              zx_defconfig
mips                     loongson1c_defconfig
powerpc                      ppc64e_defconfig
sparc                       sparc32_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201221
x86_64               randconfig-a006-20201221
x86_64               randconfig-a002-20201221
x86_64               randconfig-a004-20201221
x86_64               randconfig-a003-20201221
x86_64               randconfig-a005-20201221
i386                 randconfig-a002-20201221
i386                 randconfig-a005-20201221
i386                 randconfig-a006-20201221
i386                 randconfig-a004-20201221
i386                 randconfig-a003-20201221
i386                 randconfig-a001-20201221
i386                 randconfig-a005-20201222
i386                 randconfig-a002-20201222
i386                 randconfig-a006-20201222
i386                 randconfig-a004-20201222
i386                 randconfig-a003-20201222
i386                 randconfig-a001-20201222
i386                 randconfig-a011-20201221
i386                 randconfig-a016-20201221
i386                 randconfig-a014-20201221
i386                 randconfig-a012-20201221
i386                 randconfig-a015-20201221
i386                 randconfig-a013-20201221
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
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
x86_64               randconfig-a015-20201221
x86_64               randconfig-a014-20201221
x86_64               randconfig-a016-20201221
x86_64               randconfig-a012-20201221
x86_64               randconfig-a013-20201221
x86_64               randconfig-a011-20201221
x86_64               randconfig-a001-20201222
x86_64               randconfig-a006-20201222
x86_64               randconfig-a002-20201222
x86_64               randconfig-a004-20201222
x86_64               randconfig-a003-20201222
x86_64               randconfig-a005-20201222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
