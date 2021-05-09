Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC073774D9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 03:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fd6Ll2Q2lz3byk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 11:39:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fd6L14tbcz2yYV
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 May 2021 11:39:19 +1000 (AEST)
IronPort-SDR: M2SNmRWENkj0SX07y+uxq/7Oh65xLWlIPXOIAWxz1sSM9WlKK/jm+m03jjOFgPeENcYOnu5LXQ
 2vwHNaeags2w==
X-IronPort-AV: E=McAfee;i="6200,9189,9978"; a="260241208"
X-IronPort-AV: E=Sophos;i="5.82,284,1613462400"; d="scan'208";a="260241208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2021 18:39:12 -0700
IronPort-SDR: 1PmRjFas/zXJnrNQtpIDm8cSRQfJuZrxiTpVOWtonN8LDCK7k/MgU4PnOtiinCLufqPwyJVUs/
 7HKYtRPj3SVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,284,1613462400"; d="scan'208";a="470341822"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 08 May 2021 18:39:11 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lfYPW-000BsL-Pn; Sun, 09 May 2021 01:39:10 +0000
Date: Sun, 09 May 2021 09:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS fcc98c6d0289241dded10b74f8198fc4ecb22bd1
Message-ID: <60973d19.9tiV//dJZRuSW+sX%lkp@intel.com>
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
branch HEAD: fcc98c6d0289241dded10b74f8198fc4ecb22bd1  Automatic merge of 'next' into merge (2021-05-08 21:19)

elapsed time: 721m

configs tested: 96
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                                 defconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
powerpc                     tqm8540_defconfig
arm                          simpad_defconfig
sh                        edosk7705_defconfig
powerpc                      mgcoge_defconfig
powerpc                     tqm5200_defconfig
mips                        maltaup_defconfig
sh                            migor_defconfig
sh                         ecovec24_defconfig
arm                         socfpga_defconfig
m68k                        mvme16x_defconfig
powerpc                      ppc6xx_defconfig
arm                      jornada720_defconfig
arc                            hsdk_defconfig
um                               allyesconfig
arc                           tb10x_defconfig
arm                        magician_defconfig
arm                            dove_defconfig
arc                          axs103_defconfig
x86_64                            allnoconfig
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
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210508
i386                 randconfig-a006-20210508
i386                 randconfig-a001-20210508
i386                 randconfig-a005-20210508
i386                 randconfig-a004-20210508
i386                 randconfig-a002-20210508
x86_64               randconfig-a014-20210508
x86_64               randconfig-a015-20210508
x86_64               randconfig-a011-20210508
x86_64               randconfig-a013-20210508
x86_64               randconfig-a012-20210508
x86_64               randconfig-a016-20210508
i386                 randconfig-a013-20210508
i386                 randconfig-a015-20210508
i386                 randconfig-a014-20210508
i386                 randconfig-a016-20210508
i386                 randconfig-a011-20210508
i386                 randconfig-a012-20210508
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20210508
x86_64               randconfig-a003-20210508
x86_64               randconfig-a001-20210508
x86_64               randconfig-a002-20210508
x86_64               randconfig-a006-20210508
x86_64               randconfig-a004-20210508

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
