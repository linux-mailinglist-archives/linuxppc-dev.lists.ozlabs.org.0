Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB01A23F8A1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 21:46:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPCR24LSvzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Aug 2020 05:46:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPCM630LMzDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Aug 2020 05:43:11 +1000 (AEST)
IronPort-SDR: g80Rmd9xoSTwIDnDzbH7GKV3ur1vtucZqDHHcxApBU3AIy/GnpREpe8Qa4NU6sySewVoTKM9wO
 QMsyRY6F+psA==
X-IronPort-AV: E=McAfee;i="6000,8403,9707"; a="171388710"
X-IronPort-AV: E=Sophos;i="5.75,450,1589266800"; d="scan'208";a="171388710"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2020 12:43:07 -0700
IronPort-SDR: hcwqlKkxOWdh/NI/alqHbIDDqacy2uEz/On1FiT/kHB4+MTTS/bwzA3uMkdI2mlAZ91/r8q1Q2
 86vVtPHW6Y2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,450,1589266800"; d="scan'208";a="438234193"
Received: from lkp-server02.sh.intel.com (HELO 65e25449d42f) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 08 Aug 2020 12:43:06 -0700
Received: from kbuild by 65e25449d42f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k4UkD-0000Gx-NY; Sat, 08 Aug 2020 19:43:05 +0000
Date: Sun, 09 Aug 2020 03:42:30 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 6fe62ce0c24b06da0b9a8706851e3aaf152fbd72
Message-ID: <5f2f0026.sfgCHj5Dd3TomB2C%lkp@intel.com>
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
branch HEAD: 6fe62ce0c24b06da0b9a8706851e3aaf152fbd72  powerpc/smp: Rename ppc_md.cpu_die(void) to ppc_md.cpu_offline_self()

elapsed time: 1799m

configs tested: 100
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc885_ads_defconfig
arm                       imx_v6_v7_defconfig
parisc                generic-32bit_defconfig
microblaze                    nommu_defconfig
i386                             allyesconfig
sh                           se7206_defconfig
arm                         lpc32xx_defconfig
arm                          ixp4xx_defconfig
m68k                         apollo_defconfig
mips                          malta_defconfig
mips                    maltaup_xpa_defconfig
arm                          exynos_defconfig
powerpc                      chrp32_defconfig
mips                           ip28_defconfig
powerpc64                           defconfig
arm                         mv78xx0_defconfig
sh                     sh7710voipgw_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
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
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200808
x86_64               randconfig-a001-20200808
x86_64               randconfig-a002-20200808
x86_64               randconfig-a003-20200808
x86_64               randconfig-a005-20200808
x86_64               randconfig-a004-20200808
i386                 randconfig-a005-20200807
i386                 randconfig-a004-20200807
i386                 randconfig-a001-20200807
i386                 randconfig-a002-20200807
i386                 randconfig-a003-20200807
i386                 randconfig-a006-20200807
i386                 randconfig-a004-20200808
i386                 randconfig-a005-20200808
i386                 randconfig-a001-20200808
i386                 randconfig-a003-20200808
i386                 randconfig-a002-20200808
i386                 randconfig-a006-20200808
x86_64               randconfig-a013-20200807
x86_64               randconfig-a011-20200807
x86_64               randconfig-a012-20200807
x86_64               randconfig-a016-20200807
x86_64               randconfig-a015-20200807
x86_64               randconfig-a014-20200807
i386                 randconfig-a011-20200807
i386                 randconfig-a012-20200807
i386                 randconfig-a013-20200807
i386                 randconfig-a015-20200807
i386                 randconfig-a014-20200807
i386                 randconfig-a016-20200807
i386                 randconfig-a011-20200808
i386                 randconfig-a014-20200808
i386                 randconfig-a015-20200808
i386                 randconfig-a013-20200808
i386                 randconfig-a012-20200808
i386                 randconfig-a016-20200808
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
