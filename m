Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BEB30D410
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 08:34:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVtjG0FnmzDwvT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 18:34:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVth943FXzDwqx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 18:33:12 +1100 (AEDT)
IronPort-SDR: Tldra8kPSxIZXJy4ZrPD06INPb/dLKQaNzeu0vhp9IYUbKNLvLHrbnAzQIVyKXVI+EF214EGN1
 +9ZuhK78fU/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="199950647"
X-IronPort-AV: E=Sophos;i="5.79,397,1602572400"; d="scan'208";a="199950647"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 23:33:05 -0800
IronPort-SDR: dXYfsR+qD5ADE696/gouiMmSeSD2RGNv4gyjJCPxfNPOnqVERjBA/cQMHxGU1/QLmNTLhpWSKv
 VC7hHaNvRYSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,397,1602572400"; d="scan'208";a="371312392"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2021 23:33:01 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l7Cer-00009H-28; Wed, 03 Feb 2021 07:33:01 +0000
Date: Wed, 03 Feb 2021 15:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 a4d002e384ba1909c1c03799603f00c5909d6097
Message-ID: <601a51a9.XG4nsVnyCwa8Q9Gl%lkp@intel.com>
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
branch HEAD: a4d002e384ba1909c1c03799603f00c5909d6097  powerpc: remove unneeded semicolons

Error/Warning reports:

https://lore.kernel.org/linuxppc-dev/202102030601.iJkLZMTX-lkp@intel.com
https://lore.kernel.org/linuxppc-dev/202102031026.HFU4AdQ8-lkp@intel.com
https://lore.kernel.org/linuxppc-dev/202102031251.hW2Tyxj2-lkp@intel.com

Error/Warning in current branch:

arch/powerpc/kernel/pci-common.c:1704:12: error: no previous prototype for function 'discover_phbs' [-Werror,-Wmissing-prototypes]
arch/powerpc/kernel/tau_6xx.c:103:1: error: no previous prototype for function 'DEFINE_INTERRUPT_HANDLER_ASYNC' [-Werror,-Wmissing-prototypes]
arch/powerpc/kernel/tau_6xx.c:103:1: warning: no previous prototype for function 'DEFINE_INTERRUPT_HANDLER_ASYNC' [-Wmissing-prototypes]
arch/powerpc/kernel/tau_6xx.c:103:31: error: this old-style function definition is not preceded by a prototype [-Werror,-Wstrict-prototypes]
arch/powerpc/kernel/tau_6xx.c:110:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
arch/powerpc/kernel/tau_6xx.c:113:1: error: non-void function does not return a value [-Werror,-Wreturn-type]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- powerpc-randconfig-r003-20210202
|   |-- arch-powerpc-kernel-tau_6xx.c:error:non-void-function-does-not-return-a-value-Werror-Wreturn-type
|   |-- arch-powerpc-kernel-tau_6xx.c:error:this-old-style-function-definition-is-not-preceded-by-a-prototype-Werror-Wstrict-prototypes
|   `-- arch-powerpc-kernel-tau_6xx.c:warning:no-previous-prototype-for-function-DEFINE_INTERRUPT_HANDLER_ASYNC
`-- powerpc64-randconfig-r035-20210202
    |-- arch-powerpc-kernel-pci-common.c:error:no-previous-prototype-for-function-discover_phbs-Werror-Wmissing-prototypes
    |-- arch-powerpc-kernel-tau_6xx.c:error:no-previous-prototype-for-function-DEFINE_INTERRUPT_HANDLER_ASYNC-Werror-Wmissing-prototypes
    |-- arch-powerpc-kernel-tau_6xx.c:error:non-void-function-does-not-return-a-value-Werror-Wreturn-type
    `-- arch-powerpc-kernel-tau_6xx.c:error:this-old-style-function-definition-is-not-preceded-by-a-prototype-Werror-Wstrict-prototypes

elapsed time: 727m

configs tested: 164
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       omap2plus_defconfig
h8300                     edosk2674_defconfig
arm                          ep93xx_defconfig
h8300                               defconfig
arm                           viper_defconfig
c6x                        evmc6457_defconfig
powerpc                      mgcoge_defconfig
mips                        qi_lb60_defconfig
mips                        nlm_xlr_defconfig
powerpc                     kilauea_defconfig
arm                         socfpga_defconfig
mips                      malta_kvm_defconfig
powerpc                    klondike_defconfig
powerpc                     ep8248e_defconfig
parisc                generic-32bit_defconfig
powerpc                     mpc5200_defconfig
arm                             pxa_defconfig
powerpc                      acadia_defconfig
m68k                        m5272c3_defconfig
arm                        neponset_defconfig
powerpc                      tqm8xx_defconfig
m68k                        m5407c3_defconfig
arm                         lubbock_defconfig
arm                            dove_defconfig
mips                        vocore2_defconfig
mips                     loongson1c_defconfig
mips                          malta_defconfig
sh                        apsh4ad0a_defconfig
powerpc                    ge_imp3a_defconfig
xtensa                    xip_kc705_defconfig
m68k                        mvme16x_defconfig
arm                          collie_defconfig
arm                         cm_x300_defconfig
sh                           se7206_defconfig
powerpc                     pq2fads_defconfig
mips                             allyesconfig
arm                      integrator_defconfig
mips                        bcm63xx_defconfig
sh                          landisk_defconfig
m68k                            q40_defconfig
arc                    vdk_hs38_smp_defconfig
arc                           tb10x_defconfig
c6x                        evmc6474_defconfig
openrisc                  or1klitex_defconfig
arm                          pcm027_defconfig
powerpc                    adder875_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                           mtx1_defconfig
riscv                            allyesconfig
arm                        keystone_defconfig
powerpc                 mpc85xx_cds_defconfig
m68k                       m5208evb_defconfig
powerpc                        warp_defconfig
xtensa                  audio_kc705_defconfig
sh                     magicpanelr2_defconfig
sh                         ap325rxa_defconfig
arc                         haps_hs_defconfig
powerpc                      katmai_defconfig
arm                           h5000_defconfig
powerpc                     tqm8560_defconfig
arm                        multi_v7_defconfig
nios2                         3c120_defconfig
arm                            pleb_defconfig
sh                           se7343_defconfig
arm                          badge4_defconfig
powerpc                       holly_defconfig
mips                       rbtx49xx_defconfig
mips                           ip32_defconfig
mips                      maltasmvp_defconfig
sh                             espt_defconfig
arm                           stm32_defconfig
powerpc                     tqm8555_defconfig
c6x                        evmc6472_defconfig
c6x                              alldefconfig
microblaze                      mmu_defconfig
um                             i386_defconfig
powerpc                  storcenter_defconfig
mips                    maltaup_xpa_defconfig
mips                       lemote2f_defconfig
arm                        realview_defconfig
m68k                        mvme147_defconfig
powerpc64                        alldefconfig
mips                      bmips_stb_defconfig
powerpc                      cm5200_defconfig
powerpc                     skiroot_defconfig
microblaze                          defconfig
powerpc                          allyesconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                        fsp2_defconfig
powerpc                      ppc40x_defconfig
sh                            migor_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210202
i386                 randconfig-a005-20210202
i386                 randconfig-a003-20210202
i386                 randconfig-a006-20210202
i386                 randconfig-a002-20210202
i386                 randconfig-a004-20210202
x86_64               randconfig-a013-20210202
x86_64               randconfig-a014-20210202
x86_64               randconfig-a015-20210202
x86_64               randconfig-a016-20210202
x86_64               randconfig-a011-20210202
x86_64               randconfig-a012-20210202
i386                 randconfig-a013-20210202
i386                 randconfig-a016-20210202
i386                 randconfig-a014-20210202
i386                 randconfig-a012-20210202
i386                 randconfig-a015-20210202
i386                 randconfig-a011-20210202
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a006-20210202
x86_64               randconfig-a001-20210202
x86_64               randconfig-a005-20210202
x86_64               randconfig-a002-20210202
x86_64               randconfig-a004-20210202
x86_64               randconfig-a003-20210202

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
