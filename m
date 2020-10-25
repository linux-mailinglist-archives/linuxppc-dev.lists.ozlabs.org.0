Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F81297FE2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 03:52:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJjDw04YlzDqdf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 13:52:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJj9d5JhmzDqcq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Oct 2020 13:49:38 +1100 (AEDT)
IronPort-SDR: UieU3ElnQg4cwfeCAtnxS6Qdt4LAXK0OfA8zcPH5c6+NKU+3X2koB2R0WmQq4WT9PdaDjyAFAP
 boySXSLT2ucQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9784"; a="154770808"
X-IronPort-AV: E=Sophos;i="5.77,414,1596524400"; d="scan'208";a="154770808"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2020 19:49:34 -0700
IronPort-SDR: kv3jboTNn2F97y/Ulv6AoGItd+jekWZgtqA+MxTi1M8Dg3S8Y5W0nk0nxnqn04TUcXT5a17ITX
 AtbCXIkYasgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,414,1596524400"; d="scan'208";a="349562250"
Received: from lkp-server01.sh.intel.com (HELO cda15bb6d7bd) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 24 Oct 2020 19:49:32 -0700
Received: from kbuild by cda15bb6d7bd with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kWW68-0000lx-82; Sun, 25 Oct 2020 02:49:32 +0000
Date: Sun, 25 Oct 2020 10:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 8cb17737940b156329cb5210669b9c9b23f4dd56
Message-ID: <5f94e794.RygeocCQeVTKDW/x%lkp@intel.com>
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
branch HEAD: 8cb17737940b156329cb5210669b9c9b23f4dd56  Automatic merge of 'master' into merge (2020-10-24 21:33)

elapsed time: 966m

configs tested: 106
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                     cu1830-neo_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8272_ads_defconfig
arm                      tct_hammer_defconfig
powerpc                 canyonlands_defconfig
nios2                               defconfig
powerpc                      mgcoge_defconfig
sh                          r7780mp_defconfig
nios2                            allyesconfig
mips                      loongson3_defconfig
arm                      integrator_defconfig
sh                         ap325rxa_defconfig
sh                          r7785rp_defconfig
sh                              ul2_defconfig
h8300                       h8s-sim_defconfig
sh                           se7722_defconfig
powerpc                          allyesconfig
mips                malta_qemu_32r6_defconfig
m68k                          multi_defconfig
m68k                        m5407c3_defconfig
powerpc                     pseries_defconfig
arm                           tegra_defconfig
m68k                        m5272c3_defconfig
arm                      jornada720_defconfig
m68k                         apollo_defconfig
arm                            lart_defconfig
m68k                             allmodconfig
powerpc                 mpc834x_mds_defconfig
um                            kunit_defconfig
arm                        shmobile_defconfig
powerpc                         wii_defconfig
sh                     sh7710voipgw_defconfig
powerpc                  iss476-smp_defconfig
sh                      rts7751r2d1_defconfig
arm                             pxa_defconfig
mips                         tb0219_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
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
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20201024
i386                 randconfig-a003-20201024
i386                 randconfig-a005-20201024
i386                 randconfig-a001-20201024
i386                 randconfig-a006-20201024
i386                 randconfig-a004-20201024
x86_64               randconfig-a013-20201024
x86_64               randconfig-a016-20201024
x86_64               randconfig-a015-20201024
x86_64               randconfig-a012-20201024
x86_64               randconfig-a014-20201024
x86_64               randconfig-a011-20201024
i386                 randconfig-a016-20201024
i386                 randconfig-a015-20201024
i386                 randconfig-a014-20201024
i386                 randconfig-a013-20201024
i386                 randconfig-a012-20201024
i386                 randconfig-a011-20201024
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
x86_64               randconfig-a001-20201024
x86_64               randconfig-a003-20201024
x86_64               randconfig-a002-20201024
x86_64               randconfig-a006-20201024
x86_64               randconfig-a005-20201024
x86_64               randconfig-a004-20201024

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
