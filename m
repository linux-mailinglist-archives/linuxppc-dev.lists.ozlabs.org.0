Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A516323D5FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 06:19:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMZxz2Hf6zDqkL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 14:19:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMZt775HhzDqGl
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 14:15:53 +1000 (AEST)
IronPort-SDR: V8Ii5eYamlLM+yRgZRu8WjNu7LGb/nIQ9Pep7qEi703SwYnr8ZqKIbF15TaIR2o2X+aBtUURHt
 4keVb0w6ksNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="153854343"
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; d="scan'208";a="153854343"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2020 21:15:50 -0700
IronPort-SDR: qo7UoLZOt3Q6fMO1FwiFxTW3V/KNNmAyFtbWmpZBHPiLQGd7uIdC0vpAhnaRy0iHe/EhAqNRsE
 2DagC5C7UwJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; d="scan'208";a="293178899"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
 by orsmga006.jf.intel.com with ESMTP; 05 Aug 2020 21:15:48 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k3XJk-00015h-6g; Thu, 06 Aug 2020 04:15:48 +0000
Date: Thu, 06 Aug 2020 12:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 3cd2184115b85cc8242fec3d42529cd112962984
Message-ID: <5f2b83bd.Ojq0U83pZup1RRcg%lkp@intel.com>
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
branch HEAD: 3cd2184115b85cc8242fec3d42529cd112962984  Automatic merge of 'master', 'next' and 'fixes' (2020-08-05 22:24)

elapsed time: 844m

configs tested: 91
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          polaris_defconfig
mips                  mips_paravirt_defconfig
microblaze                      mmu_defconfig
mips                 pnx8335_stb225_defconfig
arm                       aspeed_g5_defconfig
mips                      bmips_stb_defconfig
sh                   sh7770_generic_defconfig
m68k                       m5249evb_defconfig
alpha                               defconfig
sh                        dreamcast_defconfig
m68k                             alldefconfig
arm                     am200epdkit_defconfig
arm                         nhk8815_defconfig
powerpc                     mpc5200_defconfig
mips                         tb0219_defconfig
powerpc                      ppc6xx_defconfig
arm                       imx_v4_v5_defconfig
arm                     eseries_pxa_defconfig
arm                            pleb_defconfig
arm                        keystone_defconfig
arm                          collie_defconfig
arc                        vdk_hs38_defconfig
arm                      tct_hammer_defconfig
mips                     loongson1b_defconfig
powerpc                       ppc64_defconfig
arm                             ezx_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a005-20200805
i386                 randconfig-a004-20200805
i386                 randconfig-a001-20200805
i386                 randconfig-a003-20200805
i386                 randconfig-a002-20200805
i386                 randconfig-a006-20200805
x86_64               randconfig-a013-20200805
x86_64               randconfig-a011-20200805
x86_64               randconfig-a012-20200805
x86_64               randconfig-a016-20200805
x86_64               randconfig-a015-20200805
x86_64               randconfig-a014-20200805
i386                 randconfig-a011-20200805
i386                 randconfig-a012-20200805
i386                 randconfig-a013-20200805
i386                 randconfig-a014-20200805
i386                 randconfig-a015-20200805
i386                 randconfig-a016-20200805
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
