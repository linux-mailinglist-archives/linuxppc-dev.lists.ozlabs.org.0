Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBE1239DD5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 05:27:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKjwy10zqzDqRB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKjtP3H1yzDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 13:24:44 +1000 (AEST)
IronPort-SDR: dCZCC05pw83oUufBBLx133wuciaMzd6DppAikOo4jwcngYwihe2hhej3QFEeePbd1fodSSuI6y
 E9QH/zVZMdDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="151244114"
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="151244114"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2020 20:24:40 -0700
IronPort-SDR: lTNqx1Aq3sVm13Qe2ACmjt8Z3eFlLXw48AyQcRB7b2FW+pWv/4n4UtBZzVTei1CRD2y2oXcY0N
 LzPaXXnX3NDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,428,1589266800"; d="scan'208";a="492187860"
Received: from lkp-server01.sh.intel.com (HELO e21119890065) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2020 20:24:39 -0700
Received: from kbuild by e21119890065 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k2R5a-0001os-Qn; Mon, 03 Aug 2020 03:24:38 +0000
Date: Mon, 03 Aug 2020 11:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 7f7917ae4d306a72ef9f6265028d8d203702f0b8
Message-ID: <5f278352.bFEHoHbsn104skCX%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: 7f7917ae4d306a72ef9f6265028d8d203702f0b8  selftests/powerpc: Skip vmx/vsx tests on older CPUs

elapsed time: 799m

configs tested: 106
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      chrp32_defconfig
arm                          pxa910_defconfig
sh                        sh7757lcr_defconfig
sh                           se7780_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                  colibri_pxa300_defconfig
arm                          gemini_defconfig
c6x                        evmc6678_defconfig
arm                        multi_v5_defconfig
m68k                        m5272c3_defconfig
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
c6x                         dsk6455_defconfig
m68k                                defconfig
nds32                            alldefconfig
arc                         haps_hs_defconfig
arm                          exynos_defconfig
mips                      pistachio_defconfig
arm                     am200epdkit_defconfig
arm                         lpc32xx_defconfig
alpha                            allyesconfig
mips                          ath25_defconfig
mips                      maltaaprp_defconfig
powerpc                    amigaone_defconfig
arm                         nhk8815_defconfig
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
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
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
i386                 randconfig-a004-20200802
i386                 randconfig-a005-20200802
i386                 randconfig-a001-20200802
i386                 randconfig-a002-20200802
i386                 randconfig-a003-20200802
i386                 randconfig-a006-20200802
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
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
