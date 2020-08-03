Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDBE239DD8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 05:31:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKk1n12gczDqLW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:31:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKjtQ1PMzzDqGn
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 13:24:44 +1000 (AEST)
IronPort-SDR: aT6Uer0XfcdM8S4qrYCCWEPyC44srV9M2KK9kihI2XHzEJ0f/T6bnwE5+QtH8fx7W2TuRd7HG5
 zQcGigPTD+Fw==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="139616379"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="139616379"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 20:24:40 -0700
IronPort-SDR: oe6pZaoZ3lYtFfBwBBD7gQdIFHf3hxKstPlKcM+RZNp9FBfxSVM9x4xARxyhqR0y/hEP4FNC2P
 +E31Ji2GCqhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="436059495"
Received: from lkp-server01.sh.intel.com (HELO e21119890065) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 02 Aug 2020 20:24:39 -0700
Received: from kbuild by e21119890065 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k2R5a-0001ov-RI; Mon, 03 Aug 2020 03:24:38 +0000
Date: Mon, 03 Aug 2020 11:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS f59195f7faa4896b7c1d947ac2dba29ec18ad569
Message-ID: <5f27834d.qi7etErtgvl/pv4z%lkp@intel.com>
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
branch HEAD: f59195f7faa4896b7c1d947ac2dba29ec18ad569  Automatic merge of 'master', 'next' and 'fixes' (2020-08-02 23:18)

elapsed time: 801m

configs tested: 99
configs skipped: 10

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      chrp32_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          pxa910_defconfig
sh                        sh7757lcr_defconfig
arm                       aspeed_g4_defconfig
sh                                  defconfig
mips                     decstation_defconfig
sh                           se7343_defconfig
mips                           gcw0_defconfig
arm                      pxa255-idp_defconfig
arm                        mini2440_defconfig
sh                      rts7751r2d1_defconfig
nios2                         3c120_defconfig
c6x                        evmc6457_defconfig
h8300                               defconfig
arm                        shmobile_defconfig
arm                            pleb_defconfig
powerpc                mpc7448_hpc2_defconfig
arm                            zeus_defconfig
c6x                         dsk6455_defconfig
sh                         ap325rxa_defconfig
nios2                         10m50_defconfig
powerpc64                           defconfig
m68k                       bvme6000_defconfig
mips                         tb0226_defconfig
sh                           se7780_defconfig
arc                    vdk_hs38_smp_defconfig
arm                   milbeaut_m10v_defconfig
c6x                        evmc6472_defconfig
mips                          ath79_defconfig
mips                  cavium_octeon_defconfig
powerpc                       ppc64_defconfig
mips                  mips_paravirt_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20200802
i386                 randconfig-a005-20200802
i386                 randconfig-a001-20200802
i386                 randconfig-a002-20200802
i386                 randconfig-a003-20200802
i386                 randconfig-a006-20200802
i386                 randconfig-a011-20200802
i386                 randconfig-a012-20200802
i386                 randconfig-a015-20200802
i386                 randconfig-a014-20200802
i386                 randconfig-a013-20200802
i386                 randconfig-a016-20200802
x86_64               randconfig-a006-20200802
x86_64               randconfig-a001-20200802
x86_64               randconfig-a004-20200802
x86_64               randconfig-a003-20200802
x86_64               randconfig-a002-20200802
x86_64               randconfig-a005-20200802
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
