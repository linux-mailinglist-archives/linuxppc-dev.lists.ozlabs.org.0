Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 344EC4B1C77
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 03:33:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvyNS5Y7xz3cZb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 13:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ecwFH7W8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ecwFH7W8; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvyM24KHcz3ccG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 13:32:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644546751; x=1676082751;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=oLLIQJbbxSvBOcOh5TUYDyx3wF21Vha1Xx4ICTndD7I=;
 b=ecwFH7W87wm4pPaDLsGQdKCyCrjM6dDts9mmCpcdm3WBYG6mlLG01mj5
 3XH/RADeYvcWYP5oLnNM7029GJbBzLKVk/SBqxYZATE1ZU3Nasftfj6GM
 gtxebg6oV6QlC6mqSTU/mRnjf9mdGPaPpaO4W3cfpcMx5X53nBOBvZmnL
 w+CcaQOGpQMA5qlDkCC3Jjo3jXOGKu96P0lc0kC7hAWiU7XhCHuQzWclr
 HyaHptxkVTpRCf54dzTOzzRKLE2JHr1sJaKog8xI6nBx+hbEi4r4PScoZ
 CeZEFXVsJXKFj89O1Js1obgH/VUsYbFlPJ5oud1eprj8uqVT2Fn3dxInk Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="237045929"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="237045929"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 18:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="633915804"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 10 Feb 2022 18:31:26 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nILiX-00043N-Fp; Fri, 11 Feb 2022 02:31:25 +0000
Date: Fri, 11 Feb 2022 10:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD REGRESSION
 14cc509e7b686ce5db7175d0fb084cacae046d96
Message-ID: <6205ca4b.q5HmbFTSAhOKfs2v%lkp@intel.com>
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
branch HEAD: 14cc509e7b686ce5db7175d0fb084cacae046d96  selftests/powerpc/copyloops: Add memmove_64 test

Error/Warning reports:

https://lore.kernel.org/lkml/202202110717.hZrWu55Z-lkp@intel.com

Error/Warning in current branch:

(.text+0x18): undefined reference to `._mcount'
compat_audit.c:(.text+0x14): undefined reference to `._mcount'
core.c:(.text+0x24): undefined reference to `._mcount'
fault.c:(.text+0x5c): undefined reference to `._mcount'
i2c-pasemi-platform.c:(.init.text+0x14): undefined reference to `._mcount'
i2c-pasemi-platform.c:(.text+0xc): undefined reference to `._mcount'
i2c-pca-platform.c:(.text+0x34): undefined reference to `._mcount'
main.c:(.text+0x16c): undefined reference to `._mcount'
powerpc64-linux-ld: arch/powerpc/kernel/trace/ftrace.o:(.toc+0x0): undefined reference to `_mcount'
powerpc64-linux-ld: arch/powerpc/kernel/trace/ftrace.o:(.toc+0x10): undefined reference to `ftrace_tramp_init'
powerpc64-linux-ld: arch/powerpc/kernel/trace/ftrace.o:(.toc+0x8): undefined reference to `ftrace_tramp_text'
powerpc64-linux-ld: kernel/trace/ftrace.o:(.toc+0x0): undefined reference to `_mcount'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc64-randconfig-r012-20220210
    |-- (.text):undefined-reference-to-_mcount
    |-- compat_audit.c:(.text):undefined-reference-to-_mcount
    |-- core.c:(.text):undefined-reference-to-_mcount
    |-- fault.c:(.text):undefined-reference-to-_mcount
    |-- i2c-pasemi-platform.c:(.init.text):undefined-reference-to-_mcount
    |-- i2c-pasemi-platform.c:(.text):undefined-reference-to-_mcount
    |-- i2c-pca-platform.c:(.text):undefined-reference-to-_mcount
    |-- main.c:(.text):undefined-reference-to-_mcount
    |-- powerpc64-linux-ld:arch-powerpc-kernel-trace-ftrace.o:(.toc):undefined-reference-to-_mcount
    |-- powerpc64-linux-ld:arch-powerpc-kernel-trace-ftrace.o:(.toc):undefined-reference-to-ftrace_tramp_init
    |-- powerpc64-linux-ld:arch-powerpc-kernel-trace-ftrace.o:(.toc):undefined-reference-to-ftrace_tramp_text
    `-- powerpc64-linux-ld:kernel-trace-ftrace.o:(.toc):undefined-reference-to-_mcount

elapsed time: 726m

configs tested: 177
configs skipped: 13

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc              randconfig-c003-20220210
i386                          randconfig-c001
xtensa                         virt_defconfig
powerpc64                           defconfig
powerpc                     sequoia_defconfig
arm                          iop32x_defconfig
h8300                               defconfig
sh                           se7722_defconfig
alpha                               defconfig
sh                         ecovec24_defconfig
arm                         lpc18xx_defconfig
powerpc                       ppc64_defconfig
arm                        mini2440_defconfig
arm                       multi_v4t_defconfig
openrisc                 simple_smp_defconfig
sh                           se7206_defconfig
sh                            hp6xx_defconfig
parisc                generic-64bit_defconfig
arm                         cm_x300_defconfig
sh                            titan_defconfig
x86_64                           alldefconfig
powerpc                      ppc40x_defconfig
sh                        sh7757lcr_defconfig
m68k                            q40_defconfig
powerpc                        warp_defconfig
s390                                defconfig
riscv                    nommu_k210_defconfig
powerpc                 mpc834x_itx_defconfig
arm                             ezx_defconfig
arm                        cerfcube_defconfig
nios2                            alldefconfig
sh                          urquell_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                       m5249evb_defconfig
powerpc                     tqm8541_defconfig
arm                           h3600_defconfig
powerpc                       eiger_defconfig
arm                         s3c6400_defconfig
csky                             alldefconfig
powerpc                      ep88xc_defconfig
mips                             allmodconfig
ia64                         bigsur_defconfig
sh                        dreamcast_defconfig
arc                     nsimosci_hs_defconfig
sh                                  defconfig
m68k                        m5407c3_defconfig
sh                   sh7770_generic_defconfig
arm                             pxa_defconfig
csky                                defconfig
powerpc                    klondike_defconfig
arc                              alldefconfig
um                                  defconfig
s390                          debug_defconfig
sh                          r7785rp_defconfig
arm                      footbridge_defconfig
alpha                            allyesconfig
m68k                          hp300_defconfig
powerpc                     tqm8555_defconfig
xtensa                              defconfig
arm                      jornada720_defconfig
arm                           sunxi_defconfig
powerpc                 linkstation_defconfig
sh                         microdev_defconfig
arc                    vdk_hs38_smp_defconfig
arm                        multi_v7_defconfig
sh                           se7750_defconfig
m68k                          amiga_defconfig
alpha                            alldefconfig
powerpc                      arches_defconfig
powerpc                 mpc837x_rdb_defconfig
arm                  randconfig-c002-20220210
arm                  randconfig-c002-20220209
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
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
i386                              debian-10.3
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
s390                 randconfig-r044-20220209
arc                  randconfig-r043-20220208
arc                  randconfig-r043-20220209
riscv                randconfig-r042-20220210
riscv                randconfig-r042-20220209
arc                  randconfig-r043-20220210
s390                 randconfig-r044-20220210
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
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220209
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220209
i386                          randconfig-c001
mips                 randconfig-c004-20220209
arm                  randconfig-c002-20220209
riscv                randconfig-c006-20220210
powerpc              randconfig-c003-20220210
arm                  randconfig-c002-20220210
mips                 randconfig-c004-20220210
powerpc                     ksi8560_defconfig
powerpc                      ppc44x_defconfig
mips                            e55_defconfig
x86_64                           allyesconfig
arm                          ep93xx_defconfig
powerpc                    gamecube_defconfig
powerpc                    ge_imp3a_defconfig
arm                        multi_v5_defconfig
mips                       rbtx49xx_defconfig
hexagon                             defconfig
powerpc                 mpc836x_mds_defconfig
powerpc                     tqm5200_defconfig
powerpc                       ebony_defconfig
mips                      pic32mzda_defconfig
powerpc                     kilauea_defconfig
powerpc                     mpc5200_defconfig
powerpc                     akebono_defconfig
mips                          ath79_defconfig
arm                           omap1_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     tqm8540_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r045-20220210
hexagon              randconfig-r045-20220209
hexagon              randconfig-r041-20220210
hexagon              randconfig-r041-20220209
hexagon              randconfig-r045-20220208
hexagon              randconfig-r041-20220208

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
