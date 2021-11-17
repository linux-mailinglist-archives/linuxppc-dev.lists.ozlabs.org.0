Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F00A7453D37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 01:43:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv40Q6wM9z3bmc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 11:43:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv3zy2jBHz2xtK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 11:42:33 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="214576017"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="214576017"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 16:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="672189077"
Received: from lkp-server02.sh.intel.com (HELO c20d8bc80006) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 16 Nov 2021 16:41:29 -0800
Received: from kbuild by c20d8bc80006 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mn90y-00011P-A4; Wed, 17 Nov 2021 00:41:28 +0000
Date: Wed, 17 Nov 2021 08:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 64044d20a2d777d2346cde7eb41d17497c4f4449
Message-ID: <61944fa3.e+mBtVq0Q8XChYQy%lkp@intel.com>
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
branch HEAD: 64044d20a2d777d2346cde7eb41d17497c4f4449  Automatic merge of 'fixes' into merge (2021-11-16 22:46)

elapsed time: 721m

configs tested: 140
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20211116
mips                         tb0287_defconfig
sh                   sh7724_generic_defconfig
m68k                       m5249evb_defconfig
x86_64                              defconfig
arm                        cerfcube_defconfig
powerpc                       eiger_defconfig
mips                     cu1830-neo_defconfig
powerpc                      pcm030_defconfig
arm                           sama5_defconfig
sparc64                          alldefconfig
s390                       zfcpdump_defconfig
arm                        mini2440_defconfig
microblaze                          defconfig
mips                  cavium_octeon_defconfig
powerpc                    adder875_defconfig
m68k                         amcore_defconfig
powerpc                      ppc40x_defconfig
arc                        vdk_hs38_defconfig
arm                        mvebu_v5_defconfig
arm                         mv78xx0_defconfig
sh                           se7619_defconfig
xtensa                generic_kc705_defconfig
powerpc64                           defconfig
arm                         axm55xx_defconfig
mips                          rm200_defconfig
arm                           stm32_defconfig
arm                       spear13xx_defconfig
ia64                             alldefconfig
powerpc                         ps3_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                          gemini_defconfig
arm                     eseries_pxa_defconfig
arm                           u8500_defconfig
mips                         cobalt_defconfig
arm                            lart_defconfig
powerpc                     pseries_defconfig
sh                            hp6xx_defconfig
mips                      maltaaprp_defconfig
powerpc                 xes_mpc85xx_defconfig
arc                    vdk_hs38_smp_defconfig
sh                        apsh4ad0a_defconfig
s390                             alldefconfig
s390                          debug_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          rsk7264_defconfig
m68k                         apollo_defconfig
sh                            shmin_defconfig
h8300                            alldefconfig
mips                         rt305x_defconfig
powerpc                 mpc832x_mds_defconfig
arm                            mps2_defconfig
xtensa                  cadence_csp_defconfig
riscv                             allnoconfig
arm                    vt8500_v6_v7_defconfig
arc                        nsim_700_defconfig
arm                   milbeaut_m10v_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                  randconfig-c002-20211116
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
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a015-20211116
x86_64               randconfig-a013-20211116
x86_64               randconfig-a012-20211116
x86_64               randconfig-a011-20211116
x86_64               randconfig-a016-20211116
x86_64               randconfig-a014-20211116
i386                 randconfig-a014-20211116
i386                 randconfig-a016-20211116
i386                 randconfig-a012-20211116
i386                 randconfig-a013-20211116
i386                 randconfig-a011-20211116
i386                 randconfig-a015-20211116
arc                  randconfig-r043-20211116
riscv                randconfig-r042-20211116
s390                 randconfig-r044-20211116
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           allyesconfig

clang tested configs:
x86_64               randconfig-a005-20211116
x86_64               randconfig-a003-20211116
x86_64               randconfig-a001-20211116
x86_64               randconfig-a002-20211116
x86_64               randconfig-a006-20211116
x86_64               randconfig-a004-20211116
i386                 randconfig-a006-20211116
i386                 randconfig-a003-20211116
i386                 randconfig-a005-20211116
i386                 randconfig-a001-20211116
i386                 randconfig-a004-20211116
i386                 randconfig-a002-20211116
hexagon              randconfig-r045-20211116
hexagon              randconfig-r041-20211116

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
