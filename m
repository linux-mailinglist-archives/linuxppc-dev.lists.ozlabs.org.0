Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A581EC876
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 06:36:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cGMQ1JMCzDqTg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 14:36:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cGK72RqczDqXr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 14:34:28 +1000 (AEST)
IronPort-SDR: uRM42tm0rA/Dihchwak0eTikZWajhWSHhsKoldAn3IpXUscmYddJyMzwx+uHZKWPXXc44wPHIw
 N/cZBqy0dvjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2020 21:34:25 -0700
IronPort-SDR: rdRrZjXSFI9omg4aUKNa+rvmyxgWKVQetnqC+PKUuTN4bYdPkabaVSJYH88NFoFX0kBUQn5Cfq
 MSVxB/vvoqLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,467,1583222400"; d="scan'208";a="268943038"
Received: from lkp-server01.sh.intel.com (HELO e5a7ad696f24) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 02 Jun 2020 21:34:23 -0700
Received: from kbuild by e5a7ad696f24 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jgL6d-0000Mc-3o; Wed, 03 Jun 2020 04:34:23 +0000
Date: Wed, 03 Jun 2020 12:34:01 +0800
From: kbuild test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 4336b9337824a60a0b10013c622caeee99460db5
Message-ID: <5ed72839.K/YIDrieULN7eOZr%lkp@intel.com>
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
branch HEAD: 4336b9337824a60a0b10013c622caeee99460db5  powerpc/pseries: Make vio and ibmebus initcalls pseries specific

elapsed time: 919m

configs tested: 118
configs skipped: 12

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
arm                     davinci_all_defconfig
m68k                            q40_defconfig
sh                           se7343_defconfig
mips                        nlm_xlp_defconfig
arm                           corgi_defconfig
sparc                            allyesconfig
mips                      bmips_stb_defconfig
arm                        realview_defconfig
alpha                               defconfig
arm                          prima2_defconfig
s390                              allnoconfig
mips                              allnoconfig
mips                            gpr_defconfig
sh                     sh7710voipgw_defconfig
ia64                             allmodconfig
powerpc                  storcenter_defconfig
mips                  decstation_64_defconfig
sh                   rts7751r2dplus_defconfig
sh                     magicpanelr2_defconfig
parisc                            allnoconfig
mips                           ci20_defconfig
mips                           ip22_defconfig
powerpc                          alldefconfig
mips                        maltaup_defconfig
mips                        jmr3927_defconfig
s390                             alldefconfig
c6x                        evmc6472_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
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
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                              defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                             allmodconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200602
i386                 randconfig-a006-20200602
i386                 randconfig-a002-20200602
i386                 randconfig-a005-20200602
i386                 randconfig-a003-20200602
i386                 randconfig-a004-20200602
x86_64               randconfig-a011-20200602
x86_64               randconfig-a016-20200602
x86_64               randconfig-a013-20200602
x86_64               randconfig-a012-20200602
x86_64               randconfig-a014-20200602
x86_64               randconfig-a015-20200602
i386                 randconfig-a014-20200602
i386                 randconfig-a015-20200602
i386                 randconfig-a011-20200602
i386                 randconfig-a016-20200602
i386                 randconfig-a012-20200602
i386                 randconfig-a013-20200602
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                  defconfig
um                                allnoconfig
um                               allyesconfig
um                               allmodconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
