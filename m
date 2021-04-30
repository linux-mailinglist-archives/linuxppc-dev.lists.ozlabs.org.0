Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340936F41C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 04:43:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWcBR33pRz30GH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 12:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWcB62LKSz2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 12:43:20 +1000 (AEST)
IronPort-SDR: TrnC7kf3pa2HJmvJkWdJdX2BsL+3d+G7AT8CJxzniOc2O+k60owUo3aOHhsg80pJ0TrcItYLzq
 AvPFKSphavOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9969"; a="258461766"
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="258461766"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 19:43:16 -0700
IronPort-SDR: Ned1RBtoHjmk2bCeTaydW6VHK7kzQloIB04VRSvxIF4c7KqJM0XU2PHbmY1fVkKYui7O8pppB4
 m2S7qia90Wzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,260,1613462400"; d="scan'208";a="431201006"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 29 Apr 2021 19:43:15 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lcJ7a-0007w0-D2; Fri, 30 Apr 2021 02:43:14 +0000
Date: Fri, 30 Apr 2021 10:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS e3a9b9d6a03f5fbf99b540e863b001d46ba1735c
Message-ID: <608b6e8b.rK8EUUasWLAd0qff%lkp@intel.com>
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
branch HEAD: e3a9b9d6a03f5fbf99b540e863b001d46ba1735c  powerpc/ci: Add W=1 build

elapsed time: 815m

configs tested: 144
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
powerpc                 mpc836x_rdk_defconfig
powerpc                    sam440ep_defconfig
arm                       aspeed_g5_defconfig
arm                        multi_v5_defconfig
xtensa                              defconfig
mips                      maltasmvp_defconfig
nios2                               defconfig
nios2                            allyesconfig
arm                           omap1_defconfig
arm                        mvebu_v7_defconfig
arm                         mv78xx0_defconfig
arc                        nsimosci_defconfig
sh                          landisk_defconfig
powerpc                      arches_defconfig
powerpc                   lite5200b_defconfig
ia64                         bigsur_defconfig
sh                           se7721_defconfig
arm                          imote2_defconfig
arm                         socfpga_defconfig
mips                         db1xxx_defconfig
sh                         microdev_defconfig
m68k                       bvme6000_defconfig
arm                           tegra_defconfig
powerpc                        icon_defconfig
mips                           ip28_defconfig
powerpc                    ge_imp3a_defconfig
sh                               alldefconfig
arm                        realview_defconfig
m68k                       m5275evb_defconfig
arm                      integrator_defconfig
um                                allnoconfig
ia64                                defconfig
arm                             mxs_defconfig
arm                      pxa255-idp_defconfig
sh                        edosk7705_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                     tqm8541_defconfig
mips                  maltasmvp_eva_defconfig
powerpc                     mpc83xx_defconfig
arm                  colibri_pxa300_defconfig
arm                      tct_hammer_defconfig
powerpc                     tqm5200_defconfig
arm                           h3600_defconfig
powerpc64                           defconfig
powerpc                     mpc512x_defconfig
arm                            zeus_defconfig
powerpc                     pq2fads_defconfig
powerpc                    socrates_defconfig
sh                            hp6xx_defconfig
arm                          pxa910_defconfig
powerpc                  mpc885_ads_defconfig
openrisc                         alldefconfig
arc                     haps_hs_smp_defconfig
arm                         at91_dt_defconfig
arm                        vexpress_defconfig
m68k                            q40_defconfig
arc                              alldefconfig
m68k                        m5272c3_defconfig
openrisc                 simple_smp_defconfig
powerpc                     ppa8548_defconfig
arc                          axs103_defconfig
mips                           gcw0_defconfig
sh                          kfr2r09_defconfig
arm                          pxa168_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                 mpc8272_ads_defconfig
sh                        edosk7760_defconfig
sh                   sh7770_generic_defconfig
arm                          lpd270_defconfig
openrisc                    or1ksim_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a002-20210429
x86_64               randconfig-a001-20210429
x86_64               randconfig-a003-20210429
x86_64               randconfig-a004-20210429
x86_64               randconfig-a005-20210429
x86_64               randconfig-a006-20210429
i386                 randconfig-a005-20210429
i386                 randconfig-a002-20210429
i386                 randconfig-a001-20210429
i386                 randconfig-a006-20210429
i386                 randconfig-a003-20210429
i386                 randconfig-a004-20210429
i386                 randconfig-a012-20210429
i386                 randconfig-a014-20210429
i386                 randconfig-a013-20210429
i386                 randconfig-a011-20210429
i386                 randconfig-a015-20210429
i386                 randconfig-a016-20210429
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210429
x86_64               randconfig-a016-20210429
x86_64               randconfig-a011-20210429
x86_64               randconfig-a014-20210429
x86_64               randconfig-a013-20210429
x86_64               randconfig-a012-20210429

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
