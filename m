Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 294EF26A0F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 10:34:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrGjt1NfSzDqTV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 18:34:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrGh70fVvzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 18:32:49 +1000 (AEST)
IronPort-SDR: cqPpuq3H6dHIXM+819zszXUMDJJ2zb1b6ZLumNK5HLGTwi9vBEaygSP4Ii/4kg2i0IVs/zXG4l
 ADZHSSlvF49Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9744"; a="159267835"
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; d="scan'208";a="159267835"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 01:32:45 -0700
IronPort-SDR: JFiJnw/CNEy7WxA/ZkrKsC2TKD8qd2tPOPKyQDFeM5nNVfElPJLl0WpR9v/lmbPO5BxcbGizfO
 EQ8YfKAJEoqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,429,1592895600"; d="scan'208";a="331090086"
Received: from lkp-server01.sh.intel.com (HELO 96654786cb26) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 15 Sep 2020 01:32:44 -0700
Received: from kbuild by 96654786cb26 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kI6OJ-00003q-NA; Tue, 15 Sep 2020 08:32:43 +0000
Date: Tue, 15 Sep 2020 16:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 27e2fbcd815a088d7d83c7158f76b6e95ab07c50
Message-ID: <5f607c18.l1bWm7lJfg7TOLKi%lkp@intel.com>
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
branch HEAD: 27e2fbcd815a088d7d83c7158f76b6e95ab07c50  Automatic merge of 'master', 'next' and 'fixes' (2020-09-14 23:28)

elapsed time: 1138m

configs tested: 154
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      ppc40x_defconfig
mips                        vocore2_defconfig
m68k                         amcore_defconfig
mips                    maltaup_xpa_defconfig
mips                       rbtx49xx_defconfig
powerpc                   currituck_defconfig
riscv                          rv32_defconfig
arm                        clps711x_defconfig
arm                          iop32x_defconfig
powerpc                         wii_defconfig
arm                         lpc32xx_defconfig
powerpc                        icon_defconfig
powerpc                     redwood_defconfig
arm                         s3c6400_defconfig
sh                               j2_defconfig
powerpc                     sbc8548_defconfig
powerpc                      ppc6xx_defconfig
sh                          rsk7201_defconfig
arm                         shannon_defconfig
powerpc                      pcm030_defconfig
parisc                generic-64bit_defconfig
sh                        dreamcast_defconfig
arm                            mps2_defconfig
arm                          pxa3xx_defconfig
sh                                  defconfig
m68k                        m5307c3_defconfig
powerpc                      mgcoge_defconfig
sparc                               defconfig
arm                         nhk8815_defconfig
arm                    vt8500_v6_v7_defconfig
ia64                                defconfig
mips                        bcm47xx_defconfig
arc                        nsimosci_defconfig
m68k                          hp300_defconfig
powerpc                      obs600_defconfig
riscv                            alldefconfig
arm                        multi_v5_defconfig
powerpc                     tqm8541_defconfig
arm                         hackkit_defconfig
arm                             ezx_defconfig
nds32                             allnoconfig
m68k                        mvme16x_defconfig
arm                           omap1_defconfig
arm                       multi_v4t_defconfig
powerpc                  mpc866_ads_defconfig
m68k                             alldefconfig
mips                           jazz_defconfig
arm                              zx_defconfig
mips                      bmips_stb_defconfig
sh                          r7780mp_defconfig
arm                       aspeed_g5_defconfig
sparc                       sparc64_defconfig
powerpc                     tqm8560_defconfig
riscv                            allmodconfig
arm                        spear3xx_defconfig
powerpc                 mpc8540_ads_defconfig
powerpc                    gamecube_defconfig
c6x                              alldefconfig
arm                        trizeps4_defconfig
arm                        multi_v7_defconfig
powerpc                  mpc885_ads_defconfig
arm                   milbeaut_m10v_defconfig
microblaze                          defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allmodconfig
m68k                             allyesconfig
nios2                               defconfig
c6x                              allyesconfig
arc                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
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
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200914
x86_64               randconfig-a006-20200914
x86_64               randconfig-a003-20200914
x86_64               randconfig-a002-20200914
x86_64               randconfig-a001-20200914
x86_64               randconfig-a005-20200914
i386                 randconfig-a004-20200913
i386                 randconfig-a006-20200913
i386                 randconfig-a003-20200913
i386                 randconfig-a001-20200913
i386                 randconfig-a002-20200913
i386                 randconfig-a005-20200913
i386                 randconfig-a004-20200914
i386                 randconfig-a006-20200914
i386                 randconfig-a001-20200914
i386                 randconfig-a003-20200914
i386                 randconfig-a002-20200914
i386                 randconfig-a005-20200914
x86_64               randconfig-a014-20200913
x86_64               randconfig-a011-20200913
x86_64               randconfig-a012-20200913
x86_64               randconfig-a016-20200913
x86_64               randconfig-a015-20200913
x86_64               randconfig-a013-20200913
i386                 randconfig-a015-20200913
i386                 randconfig-a014-20200913
i386                 randconfig-a011-20200913
i386                 randconfig-a013-20200913
i386                 randconfig-a016-20200913
i386                 randconfig-a012-20200913
i386                 randconfig-a015-20200914
i386                 randconfig-a014-20200914
i386                 randconfig-a011-20200914
i386                 randconfig-a013-20200914
i386                 randconfig-a016-20200914
i386                 randconfig-a012-20200914
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20200914
x86_64               randconfig-a011-20200914
x86_64               randconfig-a016-20200914
x86_64               randconfig-a012-20200914
x86_64               randconfig-a015-20200914
x86_64               randconfig-a013-20200914
x86_64               randconfig-a006-20200913
x86_64               randconfig-a004-20200913
x86_64               randconfig-a003-20200913
x86_64               randconfig-a002-20200913
x86_64               randconfig-a005-20200913
x86_64               randconfig-a001-20200913

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
