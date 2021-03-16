Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E233CBA1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 03:55:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzyZg5qMdz30GH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 13:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzyZL3NcCz2yxP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 13:55:01 +1100 (AEDT)
IronPort-SDR: XDyqo1VJy2FUvytuH/8F2ng0KKaoJAurPNUBZy2gAgWKvT/JYdqOH48LytlS8kfqjHFsrSojjg
 VUzQoaAyHldQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="188549120"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="188549120"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 19:54:58 -0700
IronPort-SDR: Ul2/7+Dx1qrSRosghnxfaXdvu4KaIBfLA8dLcUjMQYyre2EXW0XAs25TPpuYTDFSmHfAH36dk1
 gmxIlrkmt/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="432862119"
Received: from lkp-server02.sh.intel.com (HELO 1dc5e1a854f4) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 15 Mar 2021 19:54:56 -0700
Received: from kbuild by 1dc5e1a854f4 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lLzrE-0000ki-BB; Tue, 16 Mar 2021 02:54:56 +0000
Date: Tue, 16 Mar 2021 10:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 0512161accb8b6f6dacc85d165350b1812ddcc33
Message-ID: <60501de2.AhiUwFhyqDcvkhyR%lkp@intel.com>
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
branch HEAD: 0512161accb8b6f6dacc85d165350b1812ddcc33  Automatic merge of 'fixes' into merge (2021-03-16 00:24)

elapsed time: 741m

configs tested: 137
configs skipped: 3

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
h8300                     edosk2674_defconfig
powerpc                    amigaone_defconfig
powerpc                 linkstation_defconfig
m68k                        m5407c3_defconfig
arc                 nsimosci_hs_smp_defconfig
openrisc                 simple_smp_defconfig
mips                      malta_kvm_defconfig
arm                          exynos_defconfig
ia64                         bigsur_defconfig
arm                            dove_defconfig
openrisc                         alldefconfig
sparc64                             defconfig
m68k                            mac_defconfig
arm                         orion5x_defconfig
mips                        bcm63xx_defconfig
arm                            zeus_defconfig
powerpc                    socrates_defconfig
m68k                        mvme16x_defconfig
riscv                    nommu_virt_defconfig
arc                           tb10x_defconfig
s390                             alldefconfig
xtensa                         virt_defconfig
ia64                                defconfig
mips                     cu1000-neo_defconfig
sparc                            alldefconfig
mips                           rs90_defconfig
mips                           ip32_defconfig
sh                         ap325rxa_defconfig
mips                           xway_defconfig
arm                       versatile_defconfig
arm                         lpc32xx_defconfig
sh                            shmin_defconfig
powerpc                      tqm8xx_defconfig
sh                           se7722_defconfig
arm                     eseries_pxa_defconfig
m68k                       bvme6000_defconfig
powerpc                     rainier_defconfig
parisc                generic-32bit_defconfig
arm                        mini2440_defconfig
i386                                defconfig
h8300                            allyesconfig
h8300                       h8s-sim_defconfig
sh                          r7785rp_defconfig
mips                        maltaup_defconfig
sh                        apsh4ad0a_defconfig
sh                           se7721_defconfig
powerpc                     mpc5200_defconfig
mips                      fuloong2e_defconfig
parisc                generic-64bit_defconfig
arm                            hisi_defconfig
powerpc                 mpc836x_mds_defconfig
mips                         rt305x_defconfig
arc                     haps_hs_smp_defconfig
sh                           se7712_defconfig
powerpc                     mpc512x_defconfig
ia64                             alldefconfig
csky                                defconfig
arm                  colibri_pxa300_defconfig
sh                           se7751_defconfig
m68k                       m5208evb_defconfig
arm                       aspeed_g5_defconfig
arm                       netwinder_defconfig
parisc                           allyesconfig
powerpc                   motionpro_defconfig
arm                           h3600_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                          g5_defconfig
powerpc                 mpc837x_rdb_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20210315
x86_64               randconfig-a001-20210315
x86_64               randconfig-a005-20210315
x86_64               randconfig-a004-20210315
x86_64               randconfig-a002-20210315
x86_64               randconfig-a003-20210315
i386                 randconfig-a001-20210315
i386                 randconfig-a005-20210315
i386                 randconfig-a003-20210315
i386                 randconfig-a002-20210315
i386                 randconfig-a004-20210315
i386                 randconfig-a006-20210315
i386                 randconfig-a013-20210315
i386                 randconfig-a016-20210315
i386                 randconfig-a011-20210315
i386                 randconfig-a012-20210315
i386                 randconfig-a014-20210315
i386                 randconfig-a015-20210315
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210315
x86_64               randconfig-a016-20210315
x86_64               randconfig-a013-20210315
x86_64               randconfig-a015-20210315
x86_64               randconfig-a014-20210315
x86_64               randconfig-a012-20210315

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
