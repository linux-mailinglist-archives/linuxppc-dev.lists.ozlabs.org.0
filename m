Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C473535FC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 02:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FCYxl5K0Hz3cBf
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Apr 2021 10:07:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FCYx04wqzz301v
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Apr 2021 10:06:24 +1000 (AEST)
IronPort-SDR: ZkxeIzoFcUGI29muxeg8ewPeTayjqM+s7CeRORH1DJK00OCj0x0jz7iwswNnJdfSpkmp7NgMRO
 Sp79dg95PBfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9943"; a="190438559"
X-IronPort-AV: E=Sophos;i="5.81,303,1610438400"; d="scan'208";a="190438559"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2021 17:06:21 -0700
IronPort-SDR: XopvmHMKb+af3OLsJf0hSuKxAkPeMZKpAc0VLJXtyFJG4In6Hn1fZFfUSIgpo2ooRqqoihWN4l
 qtunO6dc+/8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,303,1610438400"; d="scan'208";a="385677185"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 03 Apr 2021 17:06:20 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lSqHU-0007zk-2s; Sun, 04 Apr 2021 00:06:20 +0000
Date: Sun, 04 Apr 2021 08:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 791f9e36599d94af5a76d3f74d04e16326761aae
Message-ID: <606902ef.KUxJX1xEu8iZTLPZ%lkp@intel.com>
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
branch HEAD: 791f9e36599d94af5a76d3f74d04e16326761aae  powerpc/vdso: Make sure vdso_wrapper.o is rebuilt everytime vdso.so is rebuilt

elapsed time: 723m

configs tested: 176
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
x86_64                           allyesconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                     powernv_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme16x_defconfig
powerpc                      ppc40x_defconfig
mips                         tb0226_defconfig
powerpc                 mpc8540_ads_defconfig
mips                         bigsur_defconfig
sh                             sh03_defconfig
powerpc                      katmai_defconfig
arm                         assabet_defconfig
arc                          axs103_defconfig
ia64                             allmodconfig
m68k                         amcore_defconfig
m68k                       bvme6000_defconfig
arm                       spear13xx_defconfig
powerpc                     ppa8548_defconfig
sh                          polaris_defconfig
sh                         ap325rxa_defconfig
sh                          urquell_defconfig
mips                        bcm47xx_defconfig
arm                            mps2_defconfig
powerpc                          g5_defconfig
arm                        mini2440_defconfig
sh                            migor_defconfig
arm                     eseries_pxa_defconfig
m68k                            q40_defconfig
um                           x86_64_defconfig
powerpc                      acadia_defconfig
sh                 kfr2r09-romimage_defconfig
sh                          sdk7780_defconfig
powerpc                     ep8248e_defconfig
powerpc                   bluestone_defconfig
sh                          rsk7269_defconfig
sh                           se7751_defconfig
mips                        omega2p_defconfig
arm                        mvebu_v7_defconfig
um                            kunit_defconfig
powerpc                      ppc64e_defconfig
arm                         lpc32xx_defconfig
m68k                        m5272c3_defconfig
h8300                            alldefconfig
powerpc                      chrp32_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     taishan_defconfig
mips                             allmodconfig
arm                          ep93xx_defconfig
nds32                            alldefconfig
arm                       netwinder_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc836x_mds_defconfig
xtensa                  nommu_kc705_defconfig
sh                           se7712_defconfig
powerpc                     tqm8555_defconfig
arm                         mv78xx0_defconfig
xtensa                          iss_defconfig
arm                          pxa910_defconfig
sh                           se7705_defconfig
mips                     decstation_defconfig
arm                        multi_v5_defconfig
arm                         nhk8815_defconfig
powerpc                      tqm8xx_defconfig
arm                             rpc_defconfig
sparc64                             defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                      ep88xc_defconfig
parisc                generic-32bit_defconfig
sh                           sh2007_defconfig
arm                         hackkit_defconfig
arm                          moxart_defconfig
arm                           stm32_defconfig
sh                            hp6xx_defconfig
mips                           ip22_defconfig
sh                   sh7724_generic_defconfig
arm                      jornada720_defconfig
arc                        nsim_700_defconfig
arc                           tb10x_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210404
i386                 randconfig-a003-20210404
i386                 randconfig-a001-20210404
i386                 randconfig-a004-20210404
i386                 randconfig-a005-20210404
i386                 randconfig-a002-20210404
i386                 randconfig-a006-20210403
i386                 randconfig-a003-20210403
i386                 randconfig-a001-20210403
i386                 randconfig-a004-20210403
i386                 randconfig-a002-20210403
i386                 randconfig-a005-20210403
x86_64               randconfig-a014-20210403
x86_64               randconfig-a015-20210403
x86_64               randconfig-a011-20210403
x86_64               randconfig-a013-20210403
x86_64               randconfig-a012-20210403
x86_64               randconfig-a016-20210403
i386                 randconfig-a014-20210403
i386                 randconfig-a011-20210403
i386                 randconfig-a016-20210403
i386                 randconfig-a012-20210403
i386                 randconfig-a013-20210403
i386                 randconfig-a015-20210403
i386                 randconfig-a014-20210404
i386                 randconfig-a016-20210404
i386                 randconfig-a011-20210404
i386                 randconfig-a012-20210404
i386                 randconfig-a015-20210404
i386                 randconfig-a013-20210404
x86_64               randconfig-a004-20210404
x86_64               randconfig-a003-20210404
x86_64               randconfig-a005-20210404
x86_64               randconfig-a001-20210404
x86_64               randconfig-a002-20210404
x86_64               randconfig-a006-20210404
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a004-20210403
x86_64               randconfig-a005-20210403
x86_64               randconfig-a003-20210403
x86_64               randconfig-a001-20210403
x86_64               randconfig-a002-20210403
x86_64               randconfig-a006-20210403
x86_64               randconfig-a014-20210404
x86_64               randconfig-a015-20210404
x86_64               randconfig-a013-20210404
x86_64               randconfig-a011-20210404
x86_64               randconfig-a012-20210404
x86_64               randconfig-a016-20210404

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
