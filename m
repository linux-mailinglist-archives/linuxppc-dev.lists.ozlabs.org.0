Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 122772CF6B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 23:29:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnnRt2WSqzDrgm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 09:28:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnnQG2qMFzDrZp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 09:27:29 +1100 (AEDT)
IronPort-SDR: mPz4OP1h9H/enpi60DCPfRxYgYV9wI5Qtv+sgb8WVhDHO61MzogbyQHkjNElNIxnBZLFScAlbt
 HDWw2PTkGrLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="170889841"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="170889841"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 14:27:26 -0800
IronPort-SDR: xykVZSWgXiMzNiGI8xD2ETl83JtiRG85yFuGUfE/QoPOSablNJhN/3yPqB9v3ygJ/pXvXKBBx3
 jqgkyXTO4C9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="435937436"
Received: from lkp-server02.sh.intel.com (HELO f74a175f0d75) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2020 14:27:25 -0800
Received: from kbuild by f74a175f0d75 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1klJXx-0000Xk-8C; Fri, 04 Dec 2020 22:27:25 +0000
Date: Sat, 05 Dec 2020 06:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS c9344769e2b46ba28b947bec7a8a8f0a091ecd57
Message-ID: <5fcab79c.NLK4qH4g9qhcLB64%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next
branch HEAD: c9344769e2b46ba28b947bec7a8a8f0a091ecd57  selftests/powerpc: Fix uninitialized variable warning

elapsed time: 1926m

configs tested: 161
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         shannon_defconfig
mips                     decstation_defconfig
mips                         mpc30x_defconfig
mips                           ci20_defconfig
nios2                            alldefconfig
arc                        vdk_hs38_defconfig
powerpc                      cm5200_defconfig
arm                          tango4_defconfig
mips                 decstation_r4k_defconfig
mips                           mtx1_defconfig
mips                        qi_lb60_defconfig
arm                           omap1_defconfig
arm                           h5000_defconfig
m68k                          amiga_defconfig
sh                          r7785rp_defconfig
sh                         microdev_defconfig
m68k                       m5275evb_defconfig
nds32                            alldefconfig
mips                      fuloong2e_defconfig
sh                           se7724_defconfig
powerpc                      obs600_defconfig
arm                          pcm027_defconfig
arm                            dove_defconfig
mips                         tb0219_defconfig
m68k                       m5475evb_defconfig
powerpc                     ep8248e_defconfig
powerpc                     mpc512x_defconfig
arm                         orion5x_defconfig
arm                        shmobile_defconfig
arm                           u8500_defconfig
powerpc                      ppc6xx_defconfig
arm                         vf610m4_defconfig
sh                           se7750_defconfig
powerpc                      mgcoge_defconfig
ia64                          tiger_defconfig
mips                        jmr3927_defconfig
xtensa                          iss_defconfig
arm                          ixp4xx_defconfig
powerpc                   motionpro_defconfig
nds32                               defconfig
mips                           jazz_defconfig
powerpc                        cell_defconfig
ia64                             alldefconfig
powerpc                     tqm5200_defconfig
arc                         haps_hs_defconfig
arm                           spitz_defconfig
arm                          exynos_defconfig
powerpc                     asp8347_defconfig
arm                         nhk8815_defconfig
arm                  colibri_pxa300_defconfig
powerpc                      chrp32_defconfig
sh                          urquell_defconfig
arm                       netwinder_defconfig
mips                            gpr_defconfig
powerpc                     skiroot_defconfig
arm                       aspeed_g4_defconfig
arm                         hackkit_defconfig
sparc                       sparc64_defconfig
powerpc                         wii_defconfig
arm                       versatile_defconfig
arc                     nsimosci_hs_defconfig
mips                  maltasmvp_eva_defconfig
arm                        trizeps4_defconfig
arm                        spear3xx_defconfig
powerpc                     redwood_defconfig
m68k                       m5208evb_defconfig
arm                           stm32_defconfig
powerpc                     pseries_defconfig
arm                          prima2_defconfig
sh                            titan_defconfig
powerpc                       eiger_defconfig
sh                          lboxre2_defconfig
mips                           ip32_defconfig
arm                         s3c2410_defconfig
xtensa                              defconfig
c6x                        evmc6474_defconfig
powerpc                    amigaone_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                    vt8500_v6_v7_defconfig
parisc                              defconfig
arm                        keystone_defconfig
sh                           se7343_defconfig
powerpc                     tqm8540_defconfig
arm                             pxa_defconfig
arm                       omap2plus_defconfig
powerpc                    socrates_defconfig
xtensa                    smp_lx200_defconfig
c6x                        evmc6472_defconfig
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
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
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
x86_64                                  kexec
x86_64                               rhel-8.3

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
