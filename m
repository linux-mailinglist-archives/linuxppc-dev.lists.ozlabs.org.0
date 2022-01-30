Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5064A331A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 02:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmYsl40Ptz3cN7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 12:44:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TM2b9Cn3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TM2b9Cn3; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmYs30Sg0z2yYc
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 12:44:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643507063; x=1675043063;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=NDKEBDzV0cVKsEF0WJkAbi0tQ0ZNnTnkZg3KLpoB2Zo=;
 b=TM2b9Cn3p7K1fYr2U5a1DbH0ishEh7hkxukJTTt7ceS88a/Bm/T0r8He
 +2XziRyCzWKAmlMMWu/DfVBl/ZbFp06vUmQY9Qj7cXnzt2ArPe7pgQUPU
 Chqk3UJPWVF5jEGYo3+ZXtYeZveZA+RlzWbNq9bClxIuuTOYBkkG6X7iO
 W2qzRjBc7hAxrZtT+hrQCsXpvfv9mepE2ACNqeD6dxSiSpjmV76V8D3nD
 QVcZ+M2Dop6clrdZUli9pvkvfJfqj8I7NJ3q3TQKYKjrOGB4LADJmIufv
 uxllXl6QBukh09y0nUA5AAjoia9lEPnsCsSVLOqqcANF7pqhbTsyrxqkz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="333665359"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; d="scan'208";a="333665359"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 17:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; d="scan'208";a="598539165"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 29 Jan 2022 17:43:13 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDzFI-000PuP-SD; Sun, 30 Jan 2022 01:43:12 +0000
Date: Sun, 30 Jan 2022 09:42:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 fe8a1487c462c9afb7a7da862b0747b1f57229e7
Message-ID: <61f5ed20.S0MP8je/lV1p8NJU%lkp@intel.com>
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
branch HEAD: fe8a1487c462c9afb7a7da862b0747b1f57229e7  KVM: PPC: Book3s: mmio: Deliver DSI after emulation failure

elapsed time: 1982m

configs tested: 243
configs skipped: 144

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220124
powerpc                 mpc8540_ads_defconfig
m68k                          amiga_defconfig
arm                           u8500_defconfig
sparc64                             defconfig
powerpc                        cell_defconfig
sh                  sh7785lcr_32bit_defconfig
arc                 nsimosci_hs_smp_defconfig
mips                          rb532_defconfig
ia64                            zx1_defconfig
powerpc64                        alldefconfig
arm                          gemini_defconfig
sparc                       sparc32_defconfig
xtensa                  cadence_csp_defconfig
ia64                        generic_defconfig
powerpc                   motionpro_defconfig
parisc                generic-32bit_defconfig
arc                     nsimosci_hs_defconfig
sh                        edosk7760_defconfig
sh                             espt_defconfig
um                                  defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
sparc                               defconfig
xtensa                           alldefconfig
arm                          pxa3xx_defconfig
m68k                                defconfig
xtensa                         virt_defconfig
sh                          r7780mp_defconfig
sh                   sh7770_generic_defconfig
arm                           viper_defconfig
arm                       aspeed_g5_defconfig
arm                         vf610m4_defconfig
arm                           tegra_defconfig
h8300                               defconfig
arm                         cm_x300_defconfig
sh                           se7751_defconfig
powerpc                      ppc6xx_defconfig
arc                           tb10x_defconfig
nios2                               defconfig
mips                           xway_defconfig
mips                 decstation_r4k_defconfig
m68k                          multi_defconfig
arm                            zeus_defconfig
powerpc                      arches_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                 canyonlands_defconfig
powerpc                      ep88xc_defconfig
powerpc                     ep8248e_defconfig
m68k                        stmark2_defconfig
powerpc                 mpc834x_itx_defconfig
arm                        shmobile_defconfig
mips                     decstation_defconfig
arm                         lubbock_defconfig
arm                          iop32x_defconfig
nds32                               defconfig
nds32                             allnoconfig
m68k                         amcore_defconfig
arm                           corgi_defconfig
arm                            hisi_defconfig
sh                             shx3_defconfig
openrisc                         alldefconfig
powerpc                     sequoia_defconfig
m68k                           sun3_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                       ppc64_defconfig
arm                        multi_v7_defconfig
powerpc                    adder875_defconfig
powerpc                       eiger_defconfig
powerpc                      pasemi_defconfig
xtensa                    xip_kc705_defconfig
parisc                           alldefconfig
powerpc                  storcenter_defconfig
sh                                  defconfig
ia64                         bigsur_defconfig
arm                           sunxi_defconfig
mips                         tb0226_defconfig
sh                        edosk7705_defconfig
powerpc                 mpc837x_rdb_defconfig
sh                           se7705_defconfig
xtensa                    smp_lx200_defconfig
arm                        mini2440_defconfig
sh                           se7343_defconfig
sh                   sh7724_generic_defconfig
mips                         bigsur_defconfig
sh                   rts7751r2dplus_defconfig
sh                          polaris_defconfig
sh                           se7712_defconfig
xtensa                  audio_kc705_defconfig
mips                        vocore2_defconfig
sh                         microdev_defconfig
arm                        cerfcube_defconfig
h8300                    h8300h-sim_defconfig
mips                            ar7_defconfig
powerpc                     mpc83xx_defconfig
m68k                        m5272c3_defconfig
powerpc                      makalu_defconfig
powerpc                     asp8347_defconfig
mips                           ip32_defconfig
sh                          rsk7264_defconfig
ia64                                defconfig
sh                        sh7763rdp_defconfig
powerpc                     rainier_defconfig
microblaze                      mmu_defconfig
sh                          rsk7203_defconfig
arm                      footbridge_defconfig
parisc                              defconfig
parisc                           allyesconfig
arm                  randconfig-c002-20220127
arm                  randconfig-c002-20220124
arm                  randconfig-c002-20220129
arm                  randconfig-c002-20220130
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                             allyesconfig
arc                              allyesconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                             allyesconfig
s390                             allmodconfig
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
powerpc                           allnoconfig
x86_64               randconfig-a002-20220124
x86_64               randconfig-a003-20220124
x86_64               randconfig-a004-20220124
x86_64               randconfig-a005-20220124
x86_64               randconfig-a006-20220124
x86_64               randconfig-a001-20220124
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a002-20220124
i386                 randconfig-a005-20220124
i386                 randconfig-a003-20220124
i386                 randconfig-a004-20220124
i386                 randconfig-a001-20220124
i386                 randconfig-a006-20220124
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
riscv                randconfig-r042-20220127
arc                  randconfig-r043-20220127
arc                  randconfig-r043-20220124
s390                 randconfig-r044-20220127
riscv                randconfig-r042-20220129
s390                 randconfig-r044-20220129
arc                  randconfig-r043-20220129
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
arm                  randconfig-c002-20220124
riscv                randconfig-c006-20220124
i386                 randconfig-c001-20220124
powerpc              randconfig-c003-20220124
mips                 randconfig-c004-20220124
x86_64               randconfig-c007-20220124
riscv                randconfig-c006-20220130
x86_64                        randconfig-c007
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
i386                          randconfig-c001
riscv                randconfig-c006-20220129
arm                  randconfig-c002-20220129
powerpc              randconfig-c003-20220129
mips                 randconfig-c004-20220129
powerpc                      acadia_defconfig
riscv                            alldefconfig
arm                        multi_v5_defconfig
arm                        spear3xx_defconfig
arm                          ixp4xx_defconfig
mips                     cu1000-neo_defconfig
arm                            mmp2_defconfig
powerpc                     ppa8548_defconfig
arm                        mvebu_v5_defconfig
powerpc                     mpc5200_defconfig
arm                         s3c2410_defconfig
powerpc                     ksi8560_defconfig
arm                         socfpga_defconfig
arm                         mv78xx0_defconfig
powerpc                     mpc512x_defconfig
mips                      maltaaprp_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220124
x86_64               randconfig-a013-20220124
x86_64               randconfig-a015-20220124
x86_64               randconfig-a016-20220124
x86_64               randconfig-a014-20220124
x86_64               randconfig-a012-20220124
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                 randconfig-a011-20220124
i386                 randconfig-a016-20220124
i386                 randconfig-a013-20220124
i386                 randconfig-a014-20220124
i386                 randconfig-a015-20220124
i386                 randconfig-a012-20220124
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
riscv                randconfig-r042-20220126
riscv                randconfig-r042-20220124
hexagon              randconfig-r045-20220124
hexagon              randconfig-r045-20220126
hexagon              randconfig-r041-20220124
hexagon              randconfig-r041-20220126
hexagon              randconfig-r045-20220127
hexagon              randconfig-r041-20220127
hexagon              randconfig-r045-20220125
hexagon              randconfig-r041-20220125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
