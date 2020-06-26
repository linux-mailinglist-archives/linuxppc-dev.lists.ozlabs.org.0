Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C56AF20ABBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:13:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tQ5L0ZFJzDqhY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:13:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPXm0dRNzDqkK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:48:38 +1000 (AEST)
IronPort-SDR: 6aSabnbqbWGNWW5cv5lM5tRYLUeYUWO3Gg/VpvxcOzggjt952LwNSCs1/I5c+fn6t81YJx+7o5
 bDAG2TqyrJhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="146680163"
X-IronPort-AV: E=Sophos;i="5.75,282,1589266800"; d="scan'208";a="146680163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 21:48:34 -0700
IronPort-SDR: Q6yZzj/gLZ74N8NPITEvFjXgWgaE5Mgg79x2f2m/WTLBSLbjVsnGQp5m8zJd+qgWT83yavMvFM
 lD/+Bv2SCAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,282,1589266800"; d="scan'208";a="264120549"
Received: from lkp-server01.sh.intel.com (HELO 538b5e3c8319) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jun 2020 21:48:33 -0700
Received: from kbuild by 538b5e3c8319 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jogHw-00020N-F2; Fri, 26 Jun 2020 04:48:32 +0000
Date: Fri, 26 Jun 2020 12:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 90a3c369b73246c37616c947e83b9939e41974c8
Message-ID: <5ef57e1e.mz90F2M379vs6i3C%lkp@intel.com>
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
branch HEAD: 90a3c369b73246c37616c947e83b9939e41974c8  Automatic merge of 'master', 'next' and 'fixes' (2020-06-25 23:12)

elapsed time: 908m

configs tested: 124
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arc                     haps_hs_smp_defconfig
powerpc                          g5_defconfig
mips                        jmr3927_defconfig
s390                             allyesconfig
sh                           se7751_defconfig
arm                       imx_v6_v7_defconfig
arm                            xcep_defconfig
arm                      pxa255-idp_defconfig
arm                          tango4_defconfig
arm                       mainstone_defconfig
arm                          moxart_defconfig
m68k                            q40_defconfig
sh                          sdk7786_defconfig
s390                              allnoconfig
arm                            mps2_defconfig
arm                             pxa_defconfig
arm                         lpc18xx_defconfig
mips                           ip27_defconfig
arm                     eseries_pxa_defconfig
mips                      loongson3_defconfig
i386                             alldefconfig
nds32                             allnoconfig
sh                           se7724_defconfig
mips                     loongson1b_defconfig
powerpc                  mpc885_ads_defconfig
sh                        sh7763rdp_defconfig
c6x                        evmc6472_defconfig
riscv                          rv32_defconfig
parisc                            allnoconfig
arm                            lart_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
nds32                               defconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a002-20200624
i386                 randconfig-a006-20200624
i386                 randconfig-a003-20200624
i386                 randconfig-a004-20200624
i386                 randconfig-a001-20200624
i386                 randconfig-a005-20200624
i386                 randconfig-a013-20200624
i386                 randconfig-a014-20200624
i386                 randconfig-a016-20200624
i386                 randconfig-a012-20200624
i386                 randconfig-a011-20200624
i386                 randconfig-a015-20200624
x86_64               randconfig-a004-20200624
x86_64               randconfig-a002-20200624
x86_64               randconfig-a003-20200624
x86_64               randconfig-a005-20200624
x86_64               randconfig-a001-20200624
x86_64               randconfig-a006-20200624
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
