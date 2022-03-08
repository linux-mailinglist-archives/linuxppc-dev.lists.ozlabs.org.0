Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D64D18A9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 14:06:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCbDd1tcKz3bcW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 00:06:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KNeM6/uz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KNeM6/uz; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCbCy2DvCz30K0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 00:05:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646744735; x=1678280735;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=TVi+UvJ/R1VKVoyIcmuXpw5D5f3ig5z/B+DqVqJt0is=;
 b=KNeM6/uz3ycnG/YKCJIe/ovpI3Xpbnd1P7kR96NmimjRPlC/rQHU6KFe
 F4WyGlHeR2EzrTn7CnRTq+icSe6x7N/4w4VCWhFcGaHl/1ZRHSmQK9IN/
 2DrCA87tIjPZ4EXA6CibdWKit82JBRx0Lx7GVnqNJbmYg0asVlEJmgIeT
 IO2VCtGorVNZWZVks5TvAjdYLhS3Xrpe/smNkTs7wor6BDXR7ao9xLt9s
 G1IVVe4GTcmResUP62U747y9W3H4K63yNhabpUqwm5Vw6wrwVtSJmRDmB
 yoPRrmNq67ghANlesb8GQkKYxX2GQMnWX+N2O2FSFGY2fiv/AGq4m8zbe Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="315392295"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="315392295"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 05:04:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="610997766"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2022 05:04:23 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nRZVm-0001QI-Gr; Tue, 08 Mar 2022 13:04:22 +0000
Date: Tue, 08 Mar 2022 21:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 0a448e06d10e149bf5ed23202d49246b6c4cf77b
Message-ID: <62275451.6J3CJOian9gE0G8X%lkp@intel.com>
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
branch HEAD: 0a448e06d10e149bf5ed23202d49246b6c4cf77b  powerpc/64e: Tie PPC_BOOK3E_64 to PPC_FSL_BOOK3E

Error/Warning reports:

https://lore.kernel.org/lkml/202203081701.3LJH6Dgc-lkp@intel.com
https://lore.kernel.org/lkml/202203081921.SpUkNaaj-lkp@intel.com

Error/Warning:

arch/powerpc/kernel/prom_init.c:3302:22: error: no previous prototype for 'prom_init' [-Werror=missing-prototypes]
arch/powerpc/kernel/prom_init.c:3302:22: warning: no previous prototype for 'prom_init' [-Wmissing-prototypes]

Unverified Error/Warning (likely false positive, please contact us if interested):

clang-15: error: linker command failed with exit code 1 (use -v to see invocation)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-allmodconfig
|   `-- arch-powerpc-kernel-prom_init.c:warning:no-previous-prototype-for-prom_init
|-- powerpc-allyesconfig
|   `-- arch-powerpc-kernel-prom_init.c:warning:no-previous-prototype-for-prom_init
|-- powerpc-mpc834x_itx_defconfig
|   `-- arch-powerpc-kernel-prom_init.c:error:no-previous-prototype-for-prom_init
|-- powerpc-randconfig-r014-20220308
|   `-- arch-powerpc-kernel-prom_init.c:warning:no-previous-prototype-for-prom_init
|-- powerpc-randconfig-r023-20220308
|   `-- arch-powerpc-kernel-prom_init.c:warning:no-previous-prototype-for-prom_init
|-- powerpc64-defconfig
|   `-- arch-powerpc-kernel-prom_init.c:error:no-previous-prototype-for-prom_init
`-- powerpc64-randconfig-s031-20220307
    `-- arch-powerpc-kernel-prom_init.c:error:no-previous-prototype-for-prom_init

clang_recent_errors
|-- powerpc-pseries_defconfig
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
|-- powerpc-randconfig-c003-20220308
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
|-- powerpc-randconfig-r033-20220308
|   `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)
`-- powerpc64-allmodconfig
    `-- clang:error:linker-command-failed-with-exit-code-(use-v-to-see-invocation)

elapsed time: 1364m

configs tested: 200
configs skipped: 10

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                          randconfig-c001
i386                 randconfig-c001-20220307
alpha                            alldefconfig
arm                      footbridge_defconfig
m68k                           sun3_defconfig
sh                           se7722_defconfig
sh                          urquell_defconfig
powerpc                      ep88xc_defconfig
arm                         nhk8815_defconfig
powerpc                     asp8347_defconfig
arm                        realview_defconfig
sh                           se7780_defconfig
mips                           ip32_defconfig
sh                          landisk_defconfig
nios2                               defconfig
m68k                          sun3x_defconfig
arm                         assabet_defconfig
mips                       bmips_be_defconfig
m68k                        m5307c3_defconfig
mips                     loongson1b_defconfig
powerpc64                           defconfig
xtensa                  cadence_csp_defconfig
arm                          pxa3xx_defconfig
arm                           sama5_defconfig
arc                            hsdk_defconfig
x86_64                           alldefconfig
m68k                       m5208evb_defconfig
sh                        apsh4ad0a_defconfig
sh                           sh2007_defconfig
m68k                          multi_defconfig
sh                        sh7763rdp_defconfig
s390                                defconfig
mips                     decstation_defconfig
ia64                          tiger_defconfig
x86_64                              defconfig
sparc                       sparc32_defconfig
arm                             rpc_defconfig
arc                           tb10x_defconfig
parisc64                         alldefconfig
sh                           se7750_defconfig
sh                             sh03_defconfig
sh                          r7785rp_defconfig
nios2                         3c120_defconfig
powerpc                     ep8248e_defconfig
powerpc                        warp_defconfig
arm                      jornada720_defconfig
sh                          sdk7780_defconfig
um                                  defconfig
sh                            hp6xx_defconfig
arm                           viper_defconfig
arm                            zeus_defconfig
powerpc                   currituck_defconfig
powerpc                      ppc40x_defconfig
xtensa                           alldefconfig
microblaze                          defconfig
sh                           se7712_defconfig
alpha                               defconfig
microblaze                      mmu_defconfig
sh                         ecovec24_defconfig
sh                          rsk7201_defconfig
arm                        shmobile_defconfig
mips                         tb0226_defconfig
mips                  decstation_64_defconfig
arm                         s3c6400_defconfig
sh                            titan_defconfig
arm                            xcep_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                       m5249evb_defconfig
arm                            hisi_defconfig
riscv                               defconfig
um                           x86_64_defconfig
arc                          axs101_defconfig
sh                           se7751_defconfig
sparc                            allyesconfig
mips                      maltasmvp_defconfig
powerpc                  iss476-smp_defconfig
arm                  randconfig-c002-20220308
arm                  randconfig-c002-20220307
ia64                             allmodconfig
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
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                 randconfig-a003-20220307
i386                 randconfig-a001-20220307
i386                 randconfig-a005-20220307
i386                 randconfig-a006-20220307
i386                 randconfig-a004-20220307
i386                 randconfig-a002-20220307
x86_64               randconfig-a003-20220307
x86_64               randconfig-a001-20220307
x86_64               randconfig-a002-20220307
x86_64               randconfig-a004-20220307
x86_64               randconfig-a006-20220307
x86_64               randconfig-a005-20220307
riscv                randconfig-r042-20220308
arc                  randconfig-r043-20220308
s390                 randconfig-r044-20220308
arc                  randconfig-r043-20220307
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                                  kexec

clang tested configs:
x86_64                        randconfig-c007
riscv                randconfig-c006-20220308
powerpc              randconfig-c003-20220308
i386                          randconfig-c001
arm                  randconfig-c002-20220308
mips                 randconfig-c004-20220308
x86_64               randconfig-c007-20220307
i386                 randconfig-c001-20220307
powerpc              randconfig-c003-20220307
riscv                randconfig-c006-20220307
mips                 randconfig-c004-20220307
arm                  randconfig-c002-20220307
s390                 randconfig-c005-20220307
s390                 randconfig-c005-20220308
powerpc                      walnut_defconfig
mips                        qi_lb60_defconfig
powerpc                     skiroot_defconfig
mips                  cavium_octeon_defconfig
powerpc                     pseries_defconfig
mips                           mtx1_defconfig
mips                     loongson2k_defconfig
arm                         bcm2835_defconfig
riscv                          rv32_defconfig
powerpc                      ppc44x_defconfig
arm                         socfpga_defconfig
mips                       lemote2f_defconfig
arm                             mxs_defconfig
arm                                 defconfig
arm                            mmp2_defconfig
arm                        vexpress_defconfig
hexagon                             defconfig
mips                           ip22_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a014-20220307
x86_64               randconfig-a011-20220307
x86_64               randconfig-a012-20220307
x86_64               randconfig-a015-20220307
x86_64               randconfig-a013-20220307
x86_64               randconfig-a016-20220307
i386                 randconfig-a012-20220307
i386                 randconfig-a013-20220307
i386                 randconfig-a015-20220307
i386                 randconfig-a011-20220307
i386                 randconfig-a014-20220307
i386                 randconfig-a016-20220307
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220307
hexagon              randconfig-r045-20220308
hexagon              randconfig-r041-20220308
riscv                randconfig-r042-20220307
hexagon              randconfig-r041-20220307
s390                 randconfig-r044-20220307

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
