Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E2B22899E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 22:05:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB8jF2d6QzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:05:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB8gX1nbkzDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 06:04:05 +1000 (AEST)
IronPort-SDR: PkqWf4pkXmyheJPRLgK2O71L0cQEbHx1xBevCRF3E8vJXiqpcQDbxkEWO+ijSgeDcd0z3W8KaO
 p0DtrGZNWmyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="235086941"
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="235086941"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 13:03:58 -0700
IronPort-SDR: iSK800BzCgSpTm+fGLaTPfa+GC3cOwFxN7xUkXHF37KMTf/ymu8NrjiUTePoJPIsvoK8eJA+ij
 Rt1HHBrDrFfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,380,1589266800"; d="scan'208";a="310363644"
Received: from lkp-server02.sh.intel.com (HELO 7dd7ac9fbea4) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 21 Jul 2020 13:03:57 -0700
Received: from kbuild by 7dd7ac9fbea4 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jxyUW-0000EL-KD; Tue, 21 Jul 2020 20:03:56 +0000
Date: Wed, 22 Jul 2020 04:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 08b8bb849948ff5e2305d1115ce8bbdd55364a70
Message-ID: <5f1749a3.ebLwcU1Ni14IC0iQ%lkp@intel.com>
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
branch HEAD: 08b8bb849948ff5e2305d1115ce8bbdd55364a70  powerpc test_emulate_step: move extern declaration to sstep.h

Error/Warning in current branch:

arch/powerpc/include/asm/ppc-opcode.h:277:22: error: called object is not a function or function pointer
arch/powerpc/include/asm/ppc-opcode.h:281:22: error: called object is not a function or function pointer
arch/powerpc/lib/test_emulate_step.c:28:4: error: 'PPC_INST_LWZ' undeclared (first use in this function); did you mean 'PPC_INST_LSWI'?
arch/powerpc/lib/test_emulate_step.c:29:4: error: 'PPC_INST_LWZ' undeclared (first use in this function); did you mean 'PPC_INST_LFD'?

Error/Warning ids grouped by kconfigs:

recent_errors
|-- powerpc-allmodconfig
|   |-- arch-powerpc-include-asm-ppc-opcode.h:error:called-object-is-not-a-function-or-function-pointer
|   `-- arch-powerpc-lib-test_emulate_step.c:error:PPC_INST_LWZ-undeclared-(first-use-in-this-function)
`-- powerpc-allyesconfig
    |-- arch-powerpc-include-asm-ppc-opcode.h:error:called-object-is-not-a-function-or-function-pointer
    `-- arch-powerpc-lib-test_emulate_step.c:error:PPC_INST_LWZ-undeclared-(first-use-in-this-function)

elapsed time: 1784m

configs tested: 97
configs skipped: 2

arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm                            zeus_defconfig
sh                ecovec24-romimage_defconfig
arm                       netwinder_defconfig
mips                        nlm_xlr_defconfig
powerpc                        cell_defconfig
s390                          debug_defconfig
arm                          pxa3xx_defconfig
m68k                        m5407c3_defconfig
sh                          sdk7780_defconfig
c6x                         dsk6455_defconfig
arm                           h5000_defconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
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
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200719
i386                 randconfig-a006-20200719
i386                 randconfig-a002-20200719
i386                 randconfig-a005-20200719
i386                 randconfig-a003-20200719
i386                 randconfig-a004-20200719
x86_64               randconfig-a005-20200719
x86_64               randconfig-a002-20200719
x86_64               randconfig-a006-20200719
x86_64               randconfig-a001-20200719
x86_64               randconfig-a003-20200719
x86_64               randconfig-a004-20200719
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
