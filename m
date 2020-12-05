Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247C2CF897
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 02:27:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnsPN4gTkzDrVX
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 12:27:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnsLS6SffzDrRh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 12:24:28 +1100 (AEDT)
IronPort-SDR: oG/e2HHgnyhU6nOets+4EgWS9HvMIudkzUSDAmGEmHlWw6rcUH3TLpWADMM1iYogfOqrxDTKED
 OzrL15XzAhig==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="153296191"
X-IronPort-AV: E=Sophos;i="5.78,394,1599548400"; d="scan'208";a="153296191"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 17:24:15 -0800
IronPort-SDR: fE+nJvpCjTPm12Ffzl+hSOTTIVETEu5HWM4yVaBPki7LTs5c9lQXi8/WIdKYPPwZiL7HCKXI0s
 tqHjNBB1/2rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,394,1599548400"; d="scan'208";a="374097352"
Received: from lkp-server02.sh.intel.com (HELO f74a175f0d75) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 04 Dec 2020 17:24:14 -0800
Received: from kbuild by f74a175f0d75 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1klMJ3-0000ig-D7; Sat, 05 Dec 2020 01:24:13 +0000
Date: Sat, 05 Dec 2020 09:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 4e4ed87981c764498942c52004c620bb8f104eac
Message-ID: <5fcae12c.x1YopAvjqVJFVnmn%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: 4e4ed87981c764498942c52004c620bb8f104eac  powerpc/pseries/mobility: refactor node lookup during DT update

Error/Warning reports:

https://lore.kernel.org/linuxppc-dev/202012042220.zO7hSFT2-lkp@intel.com
https://lore.kernel.org/linuxppc-dev/202012050432.SFbbjWMw-lkp@intel.com

Error/Warning in current branch:

arch/powerpc/kernel/rtas.c:938:21: error: no member named 'rtas_args_reentrant' in 'struct paca_struct'
arch/powerpc/kernel/vdso32/vgettimeofday.c:13:5: warning: no previous prototype for function '__c_kernel_clock_gettime64' [-Wmissing-prototypes]
arch/powerpc/kernel/vdso32/vgettimeofday.c:19:5: error: conflicting types for '__c_kernel_clock_getres'
arch/powerpc/kernel/vdso32/vgettimeofday.c:7:5: error: conflicting types for '__c_kernel_clock_gettime'

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- powerpc-randconfig-r016-20201204
|   `-- arch-powerpc-kernel-rtas.c:error:no-member-named-rtas_args_reentrant-in-struct-paca_struct
`-- powerpc64-randconfig-r011-20201204
    |-- arch-powerpc-kernel-vdso32-vgettimeofday.c:error:conflicting-types-for-__c_kernel_clock_getres
    |-- arch-powerpc-kernel-vdso32-vgettimeofday.c:error:conflicting-types-for-__c_kernel_clock_gettime
    `-- arch-powerpc-kernel-vdso32-vgettimeofday.c:warning:no-previous-prototype-for-function-__c_kernel_clock_gettime64

elapsed time: 726m

configs tested: 101
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                          amiga_defconfig
sh                          r7785rp_defconfig
sh                         microdev_defconfig
m68k                       m5275evb_defconfig
arm                        shmobile_defconfig
um                           x86_64_defconfig
ia64                          tiger_defconfig
arm                         mv78xx0_defconfig
ia64                            zx1_defconfig
nios2                            allyesconfig
parisc                generic-64bit_defconfig
powerpc                     sbc8548_defconfig
powerpc                     skiroot_defconfig
sh                          lboxre2_defconfig
powerpc                   motionpro_defconfig
mips                           jazz_defconfig
powerpc                        cell_defconfig
ia64                             alldefconfig
mips                  maltasmvp_eva_defconfig
arm                        trizeps4_defconfig
arm                        spear3xx_defconfig
powerpc                     redwood_defconfig
m68k                       m5208evb_defconfig
arm                           stm32_defconfig
powerpc                     pseries_defconfig
powerpc                    amigaone_defconfig
powerpc               mpc834x_itxgp_defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20201204
x86_64               randconfig-a006-20201204
x86_64               randconfig-a002-20201204
x86_64               randconfig-a001-20201204
x86_64               randconfig-a005-20201204
x86_64               randconfig-a003-20201204
i386                 randconfig-a005-20201204
i386                 randconfig-a004-20201204
i386                 randconfig-a001-20201204
i386                 randconfig-a002-20201204
i386                 randconfig-a006-20201204
i386                 randconfig-a003-20201204
i386                 randconfig-a014-20201204
i386                 randconfig-a013-20201204
i386                 randconfig-a011-20201204
i386                 randconfig-a015-20201204
i386                 randconfig-a012-20201204
i386                 randconfig-a016-20201204
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a016-20201204
x86_64               randconfig-a012-20201204
x86_64               randconfig-a014-20201204
x86_64               randconfig-a013-20201204
x86_64               randconfig-a015-20201204
x86_64               randconfig-a011-20201204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
