Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E562239DD6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 05:29:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKjzJ5Kb2zDqRj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:29:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKjtP6jwXzDqSm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 13:24:44 +1000 (AEST)
IronPort-SDR: sAMVS+fKCVBOZInUcDOrMTLm0gef0zwmQ9Mafnd6+q8FXtoqbWJbTLUyWiN4wIwXidXvCNvmWb
 weC/E1brBHWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="216465508"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="216465508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 20:24:40 -0700
IronPort-SDR: oGsLhW0jw62ERrCyxSwmyKEFOQv624XgBleMqcIvZHanUUkSXeO/oqGHT8PgNAlEJlKDZ1Jzlu
 XWBJn9447gig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="322042408"
Received: from lkp-server01.sh.intel.com (HELO e21119890065) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 02 Aug 2020 20:24:39 -0700
Received: from kbuild by e21119890065 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k2R5a-0001oq-QH; Mon, 03 Aug 2020 03:24:38 +0000
Date: Mon, 03 Aug 2020 11:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS af0870c4e75655b1931d0a5ffde2f448a2794362
Message-ID: <5f278350.67H+/FHWMuhNZvkt%lkp@intel.com>
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
branch HEAD: af0870c4e75655b1931d0a5ffde2f448a2794362  powerpc/papr_scm: Add support for fetching nvdimm 'fuel-gauge' metric

elapsed time: 800m

configs tested: 96
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                           jazz_defconfig
mips                            ar7_defconfig
c6x                         dsk6455_defconfig
m68k                         amcore_defconfig
ia64                      gensparse_defconfig
mips                           gcw0_defconfig
arm                      pxa255-idp_defconfig
arm                        mini2440_defconfig
powerpc                    adder875_defconfig
powerpc                          g5_defconfig
sh                   rts7751r2dplus_defconfig
s390                                defconfig
arm                      jornada720_defconfig
sh                      rts7751r2d1_defconfig
nios2                         3c120_defconfig
c6x                        evmc6457_defconfig
h8300                               defconfig
arm                            zeus_defconfig
m68k                                defconfig
arm                         bcm2835_defconfig
powerpc                     pseries_defconfig
arm                        cerfcube_defconfig
arm                        multi_v7_defconfig
nds32                            alldefconfig
arc                         haps_hs_defconfig
arm                          exynos_defconfig
mips                      pistachio_defconfig
powerpc                    amigaone_defconfig
arm                         nhk8815_defconfig
mips                  cavium_octeon_defconfig
powerpc                       ppc64_defconfig
mips                  mips_paravirt_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200802
i386                 randconfig-a005-20200802
i386                 randconfig-a006-20200802
i386                 randconfig-a001-20200802
i386                 randconfig-a002-20200802
i386                 randconfig-a003-20200802
x86_64               randconfig-a006-20200802
x86_64               randconfig-a001-20200802
x86_64               randconfig-a004-20200802
x86_64               randconfig-a003-20200802
x86_64               randconfig-a002-20200802
x86_64               randconfig-a005-20200802
i386                 randconfig-a011-20200802
i386                 randconfig-a012-20200802
i386                 randconfig-a015-20200802
i386                 randconfig-a014-20200802
i386                 randconfig-a013-20200802
i386                 randconfig-a016-20200802
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
