Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1166852BDB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 17:21:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Gt60NPNz3cGs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 01:21:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDFDisim;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KDFDisim; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3GsM6S1bz3bZB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 01:20:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652887256; x=1684423256;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=OTmMUiABESTKfrZa9DC7pDEIL6QOHLUGB38MACavgdI=;
 b=KDFDisimY2Dxi8rRdtbkSIoIP9+PnYlgFU/Ev3arOia83b/dJi7pds96
 6V2e8/9xI82bl8cMNA6adG4T1zKR9BnJN4QDpvTxjqLFGvefF6HVbEQFa
 mBGwxn+0FGL2xJw1Ku9wWV3QAeksDu0XeCVfA798YPvg7SAmLLG7FEWH/
 oXWmdXwlL/jA5d3KvkeS3/bqjkY6ZweW8rIBbDqRWhG1Jgxm5jGVC5h6N
 95OPhPMGB173i+khJrZWEKDB08fgd9VNXTAkX4k5fYyfBkCMADxgHpYxT
 CI1MGGtUUP0Nnn0Od5LbaQWkDVCQb0f1W0YJ0hGZanIUw+PM1nNGC/zn5 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="334770966"
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="334770966"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 08:20:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,235,1647327600"; d="scan'208";a="627086718"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 18 May 2022 08:20:38 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nrLTZ-0002Kb-O3;
 Wed, 18 May 2022 15:20:37 +0000
Date: Wed, 18 May 2022 23:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 2e4a9942261f89ad204a8189634029a4b1f0efb6
Message-ID: <62850ebf.NLHwOMaJvJ863SRN%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 2e4a9942261f89ad204a8189634029a4b1f0efb6  powerpc/irq: Remove arch_local_irq_restore() for !CONFIG_CC_HAS_ASM_GOTO

Error/Warning reports:

https://lore.kernel.org/linuxppc-dev/202205180129.rAXTjqF6-lkp@intel.com
https://lore.kernel.org/llvm/202205180443.Cfi2jikJ-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/kernel/trace/ftrace.c:714:6: error: redefinition of 'ftrace_free_init_tramp'
arch/powerpc/sysdev/mpc5xxx_clocks.c:26:2: error: call to undeclared function 'fwnode_for_each_parent_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
arch/powerpc/sysdev/mpc5xxx_clocks.c:26:45: error: expected ';' after expression

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-allmodconfig
|   `-- arch-powerpc-kernel-trace-ftrace.c:error:redefinition-of-ftrace_free_init_tramp
|-- powerpc-allyesconfig
|   `-- arch-powerpc-kernel-trace-ftrace.c:error:redefinition-of-ftrace_free_init_tramp
|-- powerpc-buildonly-randconfig-r005-20220516
|   `-- arch-powerpc-kernel-trace-ftrace.c:error:redefinition-of-ftrace_free_init_tramp
`-- powerpc-ppc64_defconfig
    `-- arch-powerpc-kernel-trace-ftrace.c:error:redefinition-of-ftrace_free_init_tramp

clang_recent_errors
`-- powerpc-mpc512x_defconfig
    |-- arch-powerpc-sysdev-mpc5xxx_clocks.c:error:call-to-undeclared-function-fwnode_for_each_parent_node-ISO-C99-and-later-do-not-support-implicit-function-declarations
    `-- arch-powerpc-sysdev-mpc5xxx_clocks.c:error:expected-after-expression

elapsed time: 1505m

configs tested: 100
configs skipped: 3

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                 randconfig-c001-20220516
arm                        mini2440_defconfig
powerpc                 mpc834x_mds_defconfig
sparc                       sparc64_defconfig
mips                            gpr_defconfig
powerpc                     pq2fads_defconfig
sh                         ecovec24_defconfig
arc                        nsimosci_defconfig
powerpc                       ppc64_defconfig
ia64                                defconfig
powerpc                 mpc8540_ads_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
arc                              allyesconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                   debian-10.3-kselftests
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64               randconfig-a012-20220516
x86_64               randconfig-a011-20220516
x86_64               randconfig-a013-20220516
x86_64               randconfig-a014-20220516
x86_64               randconfig-a016-20220516
x86_64               randconfig-a015-20220516
i386                 randconfig-a011-20220516
i386                 randconfig-a013-20220516
i386                 randconfig-a015-20220516
i386                 randconfig-a012-20220516
i386                 randconfig-a016-20220516
i386                 randconfig-a014-20220516
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220516
riscv                randconfig-r042-20220516
s390                 randconfig-r044-20220516
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests

clang tested configs:
arm                       mainstone_defconfig
arm64                            allyesconfig
powerpc                      katmai_defconfig
powerpc                     mpc512x_defconfig
i386                 randconfig-a003-20220516
i386                 randconfig-a001-20220516
i386                 randconfig-a004-20220516
i386                 randconfig-a006-20220516
i386                 randconfig-a002-20220516
i386                 randconfig-a005-20220516
x86_64               randconfig-a001-20220516
x86_64               randconfig-a006-20220516
x86_64               randconfig-a003-20220516
x86_64               randconfig-a005-20220516
x86_64               randconfig-a002-20220516
x86_64               randconfig-a004-20220516
hexagon              randconfig-r045-20220516
hexagon              randconfig-r041-20220516

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
