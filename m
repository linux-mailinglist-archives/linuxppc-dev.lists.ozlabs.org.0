Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B402F9612
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 00:07:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJrDH6QJ6zDrS3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jan 2021 10:07:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DJrBV2sXCzDrQk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jan 2021 10:06:06 +1100 (AEDT)
IronPort-SDR: tenNEIRCHg0ckGz7OHx5yxPBV6rbRZwFHhEFUm5pIj5IoAyNwf0ip3eAETq1A4+npWDqz/4E5o
 534v7ZnMRSvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="178888280"
X-IronPort-AV: E=Sophos;i="5.79,355,1602572400"; d="scan'208";a="178888280"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 15:06:00 -0800
IronPort-SDR: OaINafZpT/vITAwXzYM6XCN8hE0l+viBQv8t4XzbO3ijxE2bOc/3WNT5z8gbK7x6Qmgowkzvn+
 w2XlxO9xIyVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,355,1602572400"; d="scan'208";a="406049643"
Received: from lkp-server01.sh.intel.com (HELO 260eafd5ecd0) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2021 15:05:58 -0800
Received: from kbuild by 260eafd5ecd0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l1H7O-0003o7-1x; Sun, 17 Jan 2021 23:05:58 +0000
Date: Mon, 18 Jan 2021 07:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 41d8cb7ece7c81e4eb897ed7ec7d3c3d72fd0af4
Message-ID: <6004c2cd.cOgUVplXAldn9Yb7%lkp@intel.com>
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
branch HEAD: 41d8cb7ece7c81e4eb897ed7ec7d3c3d72fd0af4  Automatic merge of 'master' into merge (2021-01-17 21:16)

elapsed time: 758m

configs tested: 112
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arc                          axs101_defconfig
arc                      axs103_smp_defconfig
mips                     loongson1b_defconfig
c6x                         dsk6455_defconfig
mips                       rbtx49xx_defconfig
sh                           se7343_defconfig
powerpc                    adder875_defconfig
powerpc                 linkstation_defconfig
mips                       capcella_defconfig
powerpc                      katmai_defconfig
h8300                            allyesconfig
powerpc                       holly_defconfig
powerpc                     stx_gp3_defconfig
arm                      integrator_defconfig
mips                  maltasmvp_eva_defconfig
parisc                generic-32bit_defconfig
sh                           sh2007_defconfig
m68k                        m5272c3_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                         ps3_defconfig
arm                        clps711x_defconfig
arc                        vdk_hs38_defconfig
arm                           sama5_defconfig
powerpc                  iss476-smp_defconfig
nds32                               defconfig
sh                         ap325rxa_defconfig
parisc                              defconfig
powerpc                  storcenter_defconfig
xtensa                       common_defconfig
powerpc                  mpc885_ads_defconfig
alpha                            alldefconfig
mips                           rs90_defconfig
arm                          pxa910_defconfig
sh                         ecovec24_defconfig
mips                malta_kvm_guest_defconfig
nios2                            alldefconfig
powerpc                    klondike_defconfig
mips                        nlm_xlr_defconfig
arm                        multi_v7_defconfig
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
x86_64               randconfig-a006-20210117
x86_64               randconfig-a004-20210117
x86_64               randconfig-a001-20210117
x86_64               randconfig-a005-20210117
x86_64               randconfig-a003-20210117
x86_64               randconfig-a002-20210117
i386                 randconfig-a005-20210117
i386                 randconfig-a006-20210117
i386                 randconfig-a004-20210117
i386                 randconfig-a002-20210117
i386                 randconfig-a003-20210117
i386                 randconfig-a001-20210117
i386                 randconfig-a012-20210117
i386                 randconfig-a011-20210117
i386                 randconfig-a016-20210117
i386                 randconfig-a013-20210117
i386                 randconfig-a015-20210117
i386                 randconfig-a014-20210117
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
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20210117
x86_64               randconfig-a016-20210117
x86_64               randconfig-a014-20210117
x86_64               randconfig-a012-20210117
x86_64               randconfig-a013-20210117
x86_64               randconfig-a011-20210117

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
