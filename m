Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BF930D02B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:11:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVhtn6BTNzDr3b
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:11:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVHGx6pr4zDwh7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 18:57:43 +1100 (AEDT)
IronPort-SDR: vUGFvuKqSBTRrDeWVUsE5LLiQ6A1uRx+yNk68C0nEHkEZjlo5IjeHGi6H1WxsLHPBoA/mVmu3x
 1rN+yxrzZRoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="242330826"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="242330826"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 23:57:38 -0800
IronPort-SDR: Tt2wtCPzJILhujg7+SLO3nsU7wt1Nkhje/1yUBG5jIdrjOAPLnnI184Vt0FvdJv7sV9EREocfu
 CGk/iNgbjynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="370406818"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 01 Feb 2021 23:57:36 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1l6qZ6-0009CA-6x; Tue, 02 Feb 2021 07:57:36 +0000
Date: Tue, 02 Feb 2021 15:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS a2311d1e2b5ea0e77dcdd35fffb58b035da202b6
Message-ID: <601905ee.y96GNCohF+BrYcz7%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: a2311d1e2b5ea0e77dcdd35fffb58b035da202b6  Automatic merge of 'fixes' into merge (2021-01-31 22:08)

elapsed time: 2645m

configs tested: 136
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
powerpc                      tqm8xx_defconfig
sh                          r7785rp_defconfig
arm                        mvebu_v5_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                     redwood_defconfig
arm                        shmobile_defconfig
arm                           sama5_defconfig
sparc64                             defconfig
mips                 decstation_r4k_defconfig
mips                            ar7_defconfig
sh                   secureedge5410_defconfig
powerpc                        fsp2_defconfig
mips                         mpc30x_defconfig
c6x                        evmc6457_defconfig
sh                          rsk7203_defconfig
powerpc                      arches_defconfig
m68k                        mvme147_defconfig
powerpc                     tqm8548_defconfig
sh                           se7780_defconfig
powerpc                   motionpro_defconfig
arm                          ep93xx_defconfig
arm                        multi_v5_defconfig
mips                         cobalt_defconfig
h8300                               defconfig
mips                      loongson3_defconfig
powerpc                 mpc8272_ads_defconfig
sh                           se7751_defconfig
arc                            hsdk_defconfig
arm                        mini2440_defconfig
arm                         assabet_defconfig
mips                           ip27_defconfig
arm                        realview_defconfig
m68k                          sun3x_defconfig
powerpc                     taishan_defconfig
arm                      integrator_defconfig
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
i386                               tinyconfig
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
x86_64               randconfig-a006-20210201
x86_64               randconfig-a001-20210201
x86_64               randconfig-a005-20210201
x86_64               randconfig-a002-20210201
x86_64               randconfig-a004-20210201
x86_64               randconfig-a003-20210201
i386                 randconfig-a005-20210131
i386                 randconfig-a003-20210131
i386                 randconfig-a002-20210131
i386                 randconfig-a001-20210131
i386                 randconfig-a004-20210131
i386                 randconfig-a006-20210131
i386                 randconfig-a001-20210201
i386                 randconfig-a005-20210201
i386                 randconfig-a003-20210201
i386                 randconfig-a006-20210201
i386                 randconfig-a002-20210201
i386                 randconfig-a004-20210201
x86_64               randconfig-a015-20210131
x86_64               randconfig-a011-20210131
x86_64               randconfig-a014-20210131
x86_64               randconfig-a016-20210131
x86_64               randconfig-a012-20210131
x86_64               randconfig-a013-20210131
i386                 randconfig-a013-20210201
i386                 randconfig-a016-20210201
i386                 randconfig-a014-20210201
i386                 randconfig-a012-20210201
i386                 randconfig-a015-20210201
i386                 randconfig-a011-20210201
i386                 randconfig-a013-20210131
i386                 randconfig-a011-20210131
i386                 randconfig-a015-20210131
i386                 randconfig-a012-20210131
i386                 randconfig-a014-20210131
i386                 randconfig-a016-20210131
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210131
x86_64               randconfig-a002-20210131
x86_64               randconfig-a001-20210131
x86_64               randconfig-a005-20210131
x86_64               randconfig-a006-20210131
x86_64               randconfig-a003-20210131
x86_64               randconfig-a013-20210201
x86_64               randconfig-a014-20210201
x86_64               randconfig-a015-20210201
x86_64               randconfig-a016-20210201
x86_64               randconfig-a011-20210201
x86_64               randconfig-a012-20210201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
