Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42940359206
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 04:29:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGhsZ1TNVz3c40
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 12:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGhrs60Y9z2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 12:28:43 +1000 (AEST)
IronPort-SDR: o8fmAV/XciSauwlVh8NKp+ENg30BgKj9+X4Xc1uZ5fpiWB5Cfv5bC6tSXZqv3tqtH9r/3t/WcA
 ThTKCAU/lvKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="173757715"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="173757715"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 19:28:41 -0700
IronPort-SDR: akKVHyO/jQP6/U/15sqKYGBNEi/xGkd0zIoYrW9agrvbZR6eVDKjsr+wdUD7qB6X1gmjL7L5Io
 O96CflkAI02Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="610320997"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2021 19:28:40 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lUgsx-000G3D-Lx; Fri, 09 Apr 2021 02:28:39 +0000
Date: Fri, 09 Apr 2021 10:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 3ac6488df9160f52bbd8b8ec3387a53ac3d0f2eb
Message-ID: <606fbbcd.YCqB+tR1NRgrmWMp%lkp@intel.com>
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
branch HEAD: 3ac6488df9160f52bbd8b8ec3387a53ac3d0f2eb  powerpc/xive: Modernize XIVE-IPI domain with an 'alloc' handler

Error/Warning reports:

https://lore.kernel.org/linuxppc-dev/202104090230.ACwnO03u-lkp@intel.com
https://lore.kernel.org/linuxppc-dev/202104090827.jH0WBiCC-lkp@intel.com

Error/Warning in current branch:

include/linux/compiler_types.h:320:38: error: call to '__compiletime_assert_171' declared with attribute error: BUILD_BUG_ON failed: TASK_SIZE > MODULES_VADDR

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-randconfig-s031-20210408
|   |-- drivers-w1-slaves-w1_ds28e04.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-char-const-noderef-__user-_gu_addr-got-char-const-buf
|   `-- drivers-w1-slaves-w1_ds28e04.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-char-noderef-__user-_pu_addr-got-char-buf
`-- powerpc64-randconfig-c004-20210408
    `-- include-linux-compiler_types.h:error:call-to-__compiletime_assert_NNN-declared-with-attribute-error:BUILD_BUG_ON-failed:TASK_SIZE-MODULES_VADDR

elapsed time: 727m

configs tested: 166
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
riscv                            allyesconfig
i386                             allyesconfig
mips                         rt305x_defconfig
um                                allnoconfig
sh                          urquell_defconfig
sh                            titan_defconfig
arm                             ezx_defconfig
arm                        oxnas_v6_defconfig
powerpc                     akebono_defconfig
arm                     eseries_pxa_defconfig
arm                            pleb_defconfig
m68k                         amcore_defconfig
sparc                       sparc32_defconfig
powerpc                     ppa8548_defconfig
x86_64                           alldefconfig
mips                    maltaup_xpa_defconfig
xtensa                  cadence_csp_defconfig
powerpc                           allnoconfig
powerpc                      mgcoge_defconfig
powerpc                 linkstation_defconfig
sh                            migor_defconfig
mips                       lemote2f_defconfig
m68k                        m5407c3_defconfig
arm                            lart_defconfig
arm                           spitz_defconfig
arm                         palmz72_defconfig
arm                         lpc32xx_defconfig
ia64                             alldefconfig
powerpc                 mpc832x_mds_defconfig
powerpc                      ppc6xx_defconfig
sh                   sh7770_generic_defconfig
sh                           sh2007_defconfig
mips                           ip28_defconfig
sh                          r7780mp_defconfig
m68k                        mvme16x_defconfig
arm                        multi_v5_defconfig
powerpc                     kmeter1_defconfig
arc                     nsimosci_hs_defconfig
arm                        clps711x_defconfig
xtensa                    xip_kc705_defconfig
m68k                       bvme6000_defconfig
h8300                            alldefconfig
riscv                    nommu_k210_defconfig
mips                     loongson1b_defconfig
mips                  decstation_64_defconfig
powerpc                      ppc64e_defconfig
mips                          rb532_defconfig
powerpc                 mpc834x_mds_defconfig
sh                          landisk_defconfig
powerpc                      arches_defconfig
m68k                          hp300_defconfig
s390                          debug_defconfig
sh                 kfr2r09-romimage_defconfig
arm                             mxs_defconfig
mips                          malta_defconfig
arm                           u8500_defconfig
sh                           se7206_defconfig
nios2                            alldefconfig
arc                        vdk_hs38_defconfig
sh                          sdk7786_defconfig
powerpc                     mpc83xx_defconfig
arm                          pxa3xx_defconfig
um                           x86_64_defconfig
arm                            zeus_defconfig
arm                      footbridge_defconfig
powerpc                        warp_defconfig
mips                           ip22_defconfig
m68k                          multi_defconfig
sh                          lboxre2_defconfig
powerpc                     mpc5200_defconfig
powerpc                      ep88xc_defconfig
m68k                          amiga_defconfig
arm                  colibri_pxa270_defconfig
arm                            xcep_defconfig
ia64                            zx1_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            dove_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                         shannon_defconfig
powerpc                 xes_mpc85xx_defconfig
arm                         at91_dt_defconfig
sh                   sh7724_generic_defconfig
arc                    vdk_hs38_smp_defconfig
mips                           ip32_defconfig
powerpc                 mpc8272_ads_defconfig
openrisc                            defconfig
riscv             nommu_k210_sdcard_defconfig
mips                          ath25_defconfig
mips                          ath79_defconfig
powerpc                         ps3_defconfig
arm                          gemini_defconfig
arm                        realview_defconfig
arm                          iop32x_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20210408
x86_64               randconfig-a005-20210408
x86_64               randconfig-a003-20210408
x86_64               randconfig-a001-20210408
x86_64               randconfig-a002-20210408
x86_64               randconfig-a006-20210408
i386                 randconfig-a006-20210408
i386                 randconfig-a003-20210408
i386                 randconfig-a001-20210408
i386                 randconfig-a004-20210408
i386                 randconfig-a005-20210408
i386                 randconfig-a002-20210408
i386                 randconfig-a014-20210408
i386                 randconfig-a016-20210408
i386                 randconfig-a011-20210408
i386                 randconfig-a012-20210408
i386                 randconfig-a013-20210408
i386                 randconfig-a015-20210408
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
x86_64               randconfig-a014-20210408
x86_64               randconfig-a015-20210408
x86_64               randconfig-a012-20210408
x86_64               randconfig-a011-20210408
x86_64               randconfig-a013-20210408
x86_64               randconfig-a016-20210408

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
