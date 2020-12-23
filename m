Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6A2E17F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 05:01:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0zzF2K4xzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 15:01:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0zxY6q4zzDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 15:00:00 +1100 (AEDT)
IronPort-SDR: 9HFtc7gdI/qc8t7K4TGNGCCwob9gyIItn5Xq9+ECzAlGVXDvL2xOqIBphiLcAUpnyh1pGcT380
 1jhEGVet62Lw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155747019"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="155747019"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:59:56 -0800
IronPort-SDR: 3xnFodRtRmEpyZ1iOa84uYfybA4+Oy/owJIx8I296AczgsiLXKlXe0M7v8kZ6suuxF3uRbUbiy
 S36QCoAyev7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="562874843"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 22 Dec 2020 19:59:54 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1krvJZ-00005y-Na; Wed, 23 Dec 2020 03:59:53 +0000
Date: Wed, 23 Dec 2020 11:59:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 409655c00c9ca27e768b09af3bae5bd675fbd994
Message-ID: <5fe2c099.RObN0vayXvOd5L75%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  merge
branch HEAD: 409655c00c9ca27e768b09af3bae5bd675fbd994  Automatic merge of 'fixes' into merge (2020-12-23 00:08)

elapsed time: 880m

configs tested: 150
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       aspeed_g4_defconfig
m68k                        mvme147_defconfig
arm                            u300_defconfig
mips                             allyesconfig
powerpc                        fsp2_defconfig
m68k                           sun3_defconfig
powerpc                     skiroot_defconfig
nios2                         3c120_defconfig
m68k                       m5475evb_defconfig
sh                ecovec24-romimage_defconfig
powerpc                     taishan_defconfig
mips                        bcm63xx_defconfig
powerpc                    ge_imp3a_defconfig
sh                               j2_defconfig
arm                           spitz_defconfig
arm                          badge4_defconfig
powerpc                     tqm8548_defconfig
powerpc                     mpc512x_defconfig
mips                           xway_defconfig
powerpc                      ppc64e_defconfig
arm                      pxa255-idp_defconfig
arm                           tegra_defconfig
arm                      integrator_defconfig
powerpc                     pq2fads_defconfig
c6x                                 defconfig
arm                             rpc_defconfig
powerpc                   currituck_defconfig
powerpc                mpc7448_hpc2_defconfig
sh                          lboxre2_defconfig
powerpc                    adder875_defconfig
m68k                            q40_defconfig
mips                      fuloong2e_defconfig
powerpc                       ebony_defconfig
arm                            dove_defconfig
arm                  colibri_pxa300_defconfig
mips                           gcw0_defconfig
arm                         socfpga_defconfig
sh                        edosk7760_defconfig
sh                            titan_defconfig
arm                           h5000_defconfig
mips                     cu1000-neo_defconfig
arm                            pleb_defconfig
sh                   secureedge5410_defconfig
arm                            xcep_defconfig
powerpc                       ppc64_defconfig
mips                            gpr_defconfig
powerpc                         ps3_defconfig
sh                                  defconfig
powerpc                     redwood_defconfig
sh                         microdev_defconfig
powerpc                 mpc8313_rdb_defconfig
parisc                           allyesconfig
powerpc                     kilauea_defconfig
h8300                     edosk2674_defconfig
sh                          rsk7269_defconfig
powerpc                 linkstation_defconfig
powerpc64                        alldefconfig
arm                          lpd270_defconfig
arm                    vt8500_v6_v7_defconfig
arm                     eseries_pxa_defconfig
mips                           mtx1_defconfig
um                             i386_defconfig
m68k                       bvme6000_defconfig
sh                           sh2007_defconfig
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
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201221
x86_64               randconfig-a006-20201221
x86_64               randconfig-a002-20201221
x86_64               randconfig-a004-20201221
x86_64               randconfig-a003-20201221
x86_64               randconfig-a005-20201221
i386                 randconfig-a005-20201222
i386                 randconfig-a002-20201222
i386                 randconfig-a006-20201222
i386                 randconfig-a004-20201222
i386                 randconfig-a003-20201222
i386                 randconfig-a001-20201222
i386                 randconfig-a011-20201221
i386                 randconfig-a016-20201221
i386                 randconfig-a014-20201221
i386                 randconfig-a012-20201221
i386                 randconfig-a015-20201221
i386                 randconfig-a013-20201221
i386                 randconfig-a016-20201222
i386                 randconfig-a011-20201222
i386                 randconfig-a014-20201222
i386                 randconfig-a012-20201222
i386                 randconfig-a015-20201222
i386                 randconfig-a013-20201222
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201221
x86_64               randconfig-a014-20201221
x86_64               randconfig-a016-20201221
x86_64               randconfig-a012-20201221
x86_64               randconfig-a013-20201221
x86_64               randconfig-a011-20201221
x86_64               randconfig-a001-20201222
x86_64               randconfig-a006-20201222
x86_64               randconfig-a002-20201222
x86_64               randconfig-a004-20201222
x86_64               randconfig-a003-20201222
x86_64               randconfig-a005-20201222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
