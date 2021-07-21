Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 230643D18E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 23:18:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVT2P6jztz3bhT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jul 2021 07:18:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVT231Pjwz2xvH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jul 2021 07:17:43 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="198722335"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="198722335"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 14:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="511937500"
Received: from lkp-server01.sh.intel.com (HELO b8b92b2878b0) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2021 14:16:34 -0700
Received: from kbuild by b8b92b2878b0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m6JZx-0000cY-SC; Wed, 21 Jul 2021 21:16:33 +0000
Date: Thu, 22 Jul 2021 05:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 bc4188a2f56e821ea057aca6bf444e138d06c252
Message-ID: <60f88e8e.0YEKDS2DEz2Dn7bB%lkp@intel.com>
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
branch HEAD: bc4188a2f56e821ea057aca6bf444e138d06c252  KVM: PPC: Fix kvm_arch_vcpu_ioctl vcpu_load leak

elapsed time: 730m

configs tested: 147
configs skipped: 94

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                  mpc885_ads_defconfig
h8300                       h8s-sim_defconfig
sh                ecovec24-romimage_defconfig
parisc                generic-64bit_defconfig
arm                          exynos_defconfig
s390                       zfcpdump_defconfig
arm                          ep93xx_defconfig
mips                      maltasmvp_defconfig
arm                           corgi_defconfig
powerpc                 linkstation_defconfig
m68k                        m5407c3_defconfig
sh                   secureedge5410_defconfig
powerpc                     sequoia_defconfig
powerpc                     mpc5200_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                         apsh4a3a_defconfig
arm                             mxs_defconfig
arm                          pcm027_defconfig
arm                           tegra_defconfig
powerpc                      tqm8xx_defconfig
powerpc                    ge_imp3a_defconfig
csky                             alldefconfig
h8300                               defconfig
sh                  sh7785lcr_32bit_defconfig
arm                      integrator_defconfig
s390                          debug_defconfig
powerpc                     sbc8548_defconfig
powerpc                  storcenter_defconfig
powerpc                      ppc6xx_defconfig
arm                         lpc32xx_defconfig
arm                         bcm2835_defconfig
powerpc                      mgcoge_defconfig
ia64                                defconfig
riscv                            alldefconfig
microblaze                          defconfig
m68k                                defconfig
sh                          rsk7269_defconfig
arm                           stm32_defconfig
arm                         vf610m4_defconfig
x86_64                            allnoconfig
arm                        multi_v5_defconfig
mips                  cavium_octeon_defconfig
powerpc                      chrp32_defconfig
m68k                        mvme16x_defconfig
powerpc                       holly_defconfig
powerpc                      katmai_defconfig
mips                         mpc30x_defconfig
mips                         tb0287_defconfig
sh                          landisk_defconfig
arm                         socfpga_defconfig
powerpc64                           defconfig
powerpc                      cm5200_defconfig
arm                         palmz72_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a003-20210720
x86_64               randconfig-a006-20210720
x86_64               randconfig-a001-20210720
x86_64               randconfig-a005-20210720
x86_64               randconfig-a004-20210720
x86_64               randconfig-a002-20210720
i386                 randconfig-a005-20210719
i386                 randconfig-a004-20210719
i386                 randconfig-a006-20210719
i386                 randconfig-a001-20210719
i386                 randconfig-a003-20210719
i386                 randconfig-a002-20210719
i386                 randconfig-a005-20210720
i386                 randconfig-a003-20210720
i386                 randconfig-a004-20210720
i386                 randconfig-a002-20210720
i386                 randconfig-a001-20210720
i386                 randconfig-a006-20210720
i386                 randconfig-a016-20210720
i386                 randconfig-a013-20210720
i386                 randconfig-a012-20210720
i386                 randconfig-a014-20210720
i386                 randconfig-a011-20210720
i386                 randconfig-a015-20210720
i386                 randconfig-a016-20210721
i386                 randconfig-a013-20210721
i386                 randconfig-a012-20210721
i386                 randconfig-a014-20210721
i386                 randconfig-a011-20210721
i386                 randconfig-a015-20210721
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210720
x86_64               randconfig-a011-20210720
x86_64               randconfig-a016-20210720
x86_64               randconfig-a013-20210720
x86_64               randconfig-a014-20210720
x86_64               randconfig-a012-20210720
x86_64               randconfig-a015-20210720
x86_64               randconfig-a003-20210721
x86_64               randconfig-a006-20210721
x86_64               randconfig-a001-20210721
x86_64               randconfig-a005-20210721
x86_64               randconfig-a004-20210721
x86_64               randconfig-a002-20210721

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
