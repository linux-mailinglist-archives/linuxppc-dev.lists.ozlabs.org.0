Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958F1F047B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 05:50:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49f5Bs4K8ZzDr3X
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 13:50:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49f5941GFSzDr0l
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 13:48:49 +1000 (AEST)
IronPort-SDR: ldCzrSZpCfabGFV0q9UCnm8vYV5t2XI1+/4g6QHPUjmXoSXFAERfAKWTwaz8+ikdXURwrAWt67
 apJpOsKXlKEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 20:48:44 -0700
IronPort-SDR: 0p3vRRSS1AENft27RLroiRoqHwpC8H76sK6O1DS224iNwxX7ujjgBBTaXiCq5bxfAaRqOdMu9i
 pe0U2w9dV7nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,478,1583222400"; d="scan'208";a="472124069"
Received: from lkp-server02.sh.intel.com (HELO 85fa322b0eb2) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 05 Jun 2020 20:48:43 -0700
Received: from kbuild by 85fa322b0eb2 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jhPp4-0000UA-Jt; Sat, 06 Jun 2020 03:48:42 +0000
Date: Sat, 06 Jun 2020 11:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS ec7b8eb9bc7a519047485c95f7292b48f5b73fe6
Message-ID: <5edb11f5.1bnxx+mI4Kz81REz%lkp@intel.com>
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
branch HEAD: ec7b8eb9bc7a519047485c95f7292b48f5b73fe6  module: break nested ARCH_HAS_STRICT_MODULE_RWX and STRICT_MODULE_RWX #ifdefs

elapsed time: 747m

configs tested: 134
configs skipped: 4

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
powerpc                          allyesconfig
m68k                       m5475evb_defconfig
nios2                         10m50_defconfig
mips                      malta_kvm_defconfig
m68k                        mvme147_defconfig
arm                          imote2_defconfig
arm                         lpc18xx_defconfig
sh                 kfr2r09-romimage_defconfig
arm                           spitz_defconfig
c6x                              alldefconfig
arm                         orion5x_defconfig
powerpc                     mpc5200_defconfig
arc                        vdk_hs38_defconfig
sh                           se7724_defconfig
powerpc                     mpc512x_defconfig
sh                  sh7785lcr_32bit_defconfig
mips                           ip28_defconfig
arm                         s5pv210_defconfig
mips                           ip32_defconfig
mips                         tb0287_defconfig
ia64                        generic_defconfig
arc                             nps_defconfig
s390                             alldefconfig
h8300                               defconfig
i386                              allnoconfig
powerpc                      mgcoge_defconfig
mips                      bmips_stb_defconfig
arm                              alldefconfig
powerpc                      pasemi_defconfig
arc                    vdk_hs38_smp_defconfig
s390                              allnoconfig
arm                         lpc32xx_defconfig
riscv                             allnoconfig
mips                          ath79_defconfig
mips                     loongson1c_defconfig
arm                        magician_defconfig
arm                          pxa910_defconfig
arc                     nsimosci_hs_defconfig
alpha                            alldefconfig
arm                        mvebu_v5_defconfig
mips                        qi_lb60_defconfig
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
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
xtensa                              defconfig
h8300                            allmodconfig
h8300                            allyesconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200605
i386                 randconfig-a006-20200605
i386                 randconfig-a002-20200605
i386                 randconfig-a005-20200605
i386                 randconfig-a004-20200605
i386                 randconfig-a003-20200605
x86_64               randconfig-a002-20200605
x86_64               randconfig-a001-20200605
x86_64               randconfig-a003-20200605
x86_64               randconfig-a004-20200605
x86_64               randconfig-a005-20200605
i386                 randconfig-a014-20200605
i386                 randconfig-a015-20200605
i386                 randconfig-a011-20200605
i386                 randconfig-a016-20200605
i386                 randconfig-a012-20200605
i386                 randconfig-a013-20200605
x86_64               randconfig-a006-20200605
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allmodconfig
um                               allyesconfig
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
