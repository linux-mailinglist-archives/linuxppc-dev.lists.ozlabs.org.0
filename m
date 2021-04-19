Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533E3639C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 05:38:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNswg1mzvz3bV7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 13:38:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNswK6wdbz30Cw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 13:38:06 +1000 (AEST)
IronPort-SDR: 8tYiTUEJmxJXlb59AiB+Z7WTU2lRWm5ROpchLE9rm+rUNth5vQ8xkg+knBoSOCqjKCulzKWklq
 TEk3oHeOi1tQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="174751630"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="174751630"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 20:38:02 -0700
IronPort-SDR: ogZT9i4UcvSe3Eg7tL9Nd3dM1UeTJlmTgdvUtfYs3I1pFca55tBzXz8iKmiq0NbT8Q7M7eHc32
 gWu7kusoOHDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="602024241"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 18 Apr 2021 20:38:01 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lYKjY-0001WR-KD; Mon, 19 Apr 2021 03:38:00 +0000
Date: Mon, 19 Apr 2021 11:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS e4361a664ee985c1f54ddecf80b93159750d93d3
Message-ID: <607cfaeb.IJdQLy1i3mAYPjgU%lkp@intel.com>
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
branch HEAD: e4361a664ee985c1f54ddecf80b93159750d93d3  Automatic merge of 'next' into merge (2021-04-19 00:04)

elapsed time: 720m

configs tested: 99
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
arm                      pxa255-idp_defconfig
xtensa                  audio_kc705_defconfig
mips                        nlm_xlr_defconfig
m68k                           sun3_defconfig
sh                        sh7785lcr_defconfig
sh                           se7751_defconfig
mips                           xway_defconfig
powerpc                     sbc8548_defconfig
powerpc                     tqm8548_defconfig
mips                 decstation_r4k_defconfig
arm                          lpd270_defconfig
m68k                         apollo_defconfig
powerpc                     asp8347_defconfig
m68k                        mvme147_defconfig
riscv                             allnoconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                      ep88xc_defconfig
sh                          rsk7264_defconfig
sh                          sdk7786_defconfig
mips                          rb532_defconfig
sh                           se7619_defconfig
arm                        trizeps4_defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210418
i386                 randconfig-a001-20210418
i386                 randconfig-a006-20210418
i386                 randconfig-a005-20210418
i386                 randconfig-a004-20210418
i386                 randconfig-a002-20210418
x86_64               randconfig-a014-20210418
x86_64               randconfig-a015-20210418
x86_64               randconfig-a013-20210418
x86_64               randconfig-a011-20210418
x86_64               randconfig-a012-20210418
x86_64               randconfig-a016-20210418
i386                 randconfig-a015-20210418
i386                 randconfig-a013-20210418
i386                 randconfig-a014-20210418
i386                 randconfig-a016-20210418
i386                 randconfig-a012-20210418
i386                 randconfig-a011-20210418
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a003-20210418
x86_64               randconfig-a001-20210418
x86_64               randconfig-a005-20210418
x86_64               randconfig-a002-20210418
x86_64               randconfig-a006-20210418
x86_64               randconfig-a004-20210418

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
