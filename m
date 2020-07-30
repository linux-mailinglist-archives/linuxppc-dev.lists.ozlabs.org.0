Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D75233583
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 17:33:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHZFQ1r5gzDrBH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 01:33:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHZC603sfzDr43
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 01:31:38 +1000 (AEST)
IronPort-SDR: JZ0MVh9Zj75VP0yMe48MfOX0+9prN6cm5eZM+2PvN+NZelKQn4qWKuZs8GuFNTb+0pzdEVkZKv
 TxYwz/nMNCsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="216093061"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="216093061"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 08:31:34 -0700
IronPort-SDR: 6NlV0vE+0pbz983/0wTHzON9yZOwdahuimUjclg2U86WlfGXcGxik1mrJ7FDsrex4eh3lq4oTz
 j2cIs11fT+9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; d="scan'208";a="465280536"
Received: from lkp-server02.sh.intel.com (HELO d4d86dd808e0) ([10.239.97.151])
 by orsmga005.jf.intel.com with ESMTP; 30 Jul 2020 08:31:32 -0700
Received: from kbuild by d4d86dd808e0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k1AWp-00008X-Vz; Thu, 30 Jul 2020 15:31:31 +0000
Date: Thu, 30 Jul 2020 23:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 909adfc66b9a1db21b5e8733e9ebfa6cd5135d74
Message-ID: <5f22e79a.HcSe0W4OW8nzJpLr%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes-test
branch HEAD: 909adfc66b9a1db21b5e8733e9ebfa6cd5135d74  powerpc/64s/hash: Fix hash_preload running with interrupts enabled

elapsed time: 4429m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                          r7785rp_defconfig
mips                         tb0226_defconfig
mips                      loongson3_defconfig
um                            kunit_defconfig
nds32                            alldefconfig
arm                       imx_v4_v5_defconfig
mips                           gcw0_defconfig
mips                      fuloong2e_defconfig
arm                      pxa255-idp_defconfig
s390                                defconfig
arm                          prima2_defconfig
arm                      footbridge_defconfig
mips                        nlm_xlr_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
x86_64               randconfig-a005-20200727
x86_64               randconfig-a004-20200727
x86_64               randconfig-a003-20200727
x86_64               randconfig-a006-20200727
x86_64               randconfig-a002-20200727
x86_64               randconfig-a001-20200727
i386                 randconfig-a003-20200728
i386                 randconfig-a004-20200728
i386                 randconfig-a005-20200728
i386                 randconfig-a002-20200728
i386                 randconfig-a006-20200728
i386                 randconfig-a001-20200728
i386                 randconfig-a003-20200727
i386                 randconfig-a005-20200727
i386                 randconfig-a004-20200727
i386                 randconfig-a006-20200727
i386                 randconfig-a002-20200727
i386                 randconfig-a001-20200727
x86_64               randconfig-a014-20200728
x86_64               randconfig-a012-20200728
x86_64               randconfig-a015-20200728
x86_64               randconfig-a016-20200728
x86_64               randconfig-a013-20200728
x86_64               randconfig-a011-20200728
i386                 randconfig-a016-20200728
i386                 randconfig-a012-20200728
i386                 randconfig-a013-20200728
i386                 randconfig-a014-20200728
i386                 randconfig-a011-20200728
i386                 randconfig-a015-20200728
i386                 randconfig-a016-20200727
i386                 randconfig-a013-20200727
i386                 randconfig-a012-20200727
i386                 randconfig-a015-20200727
i386                 randconfig-a011-20200727
i386                 randconfig-a014-20200727
i386                 randconfig-a016-20200730
i386                 randconfig-a012-20200730
i386                 randconfig-a014-20200730
i386                 randconfig-a015-20200730
i386                 randconfig-a011-20200730
i386                 randconfig-a013-20200730
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
