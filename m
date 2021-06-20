Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C1B3ADE59
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 14:39:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7C074fMjz3c0F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 22:39:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7Bzn57Hgz2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 22:39:01 +1000 (AEST)
IronPort-SDR: t9sMmxMlLokccMQSxgGrVB9qCothfQc4ReSfmQXaPE6JwKhvX9oqtdFwwQiCqq+SgRXfh8tqZJ
 xJkYQyYxeNUA==
X-IronPort-AV: E=McAfee;i="6200,9189,10021"; a="292349136"
X-IronPort-AV: E=Sophos;i="5.83,287,1616482800"; d="scan'208";a="292349136"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2021 05:38:56 -0700
IronPort-SDR: gwpE+fmsMvCo/5mL1wdHnXWvrkaxlc9U35YUEcD8RD0Z0YjEONolyba5Aj2DwtjDOp3ytfcCTn
 SKAQV4ukySJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,287,1616482800"; d="scan'208";a="555991007"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2021 05:38:55 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1luwj0-000474-KY; Sun, 20 Jun 2021 12:38:54 +0000
Date: Sun, 20 Jun 2021 20:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD REGRESSION
 77ba1e2abc7474c5321cbf8d90366ec69150d0a2
Message-ID: <60cf36d1.JFzo6GVy6obMEKaa%lkp@intel.com>
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
branch HEAD: 77ba1e2abc7474c5321cbf8d90366ec69150d0a2  powerpc: Enable KFENCE on BOOK3S/64

Error/Warning in current branch:

arch/powerpc/kernel/interrupt.c:36:20: error: unused function 'exit_must_hard_disable' [-Werror,-Wunused-function]
arch/powerpc/lib/code-patching.c:76:12: error: no previous prototype for 'poking_init' [-Werror=missing-prototypes]
arch/powerpc/lib/code-patching.c:76:12: warning: no previous prototype for 'poking_init' [-Wmissing-prototypes]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- powerpc-mpc885_ads_defconfig
|   `-- arch-powerpc-lib-code-patching.c:error:no-previous-prototype-for-poking_init
`-- powerpc64-randconfig-r011-20210620
    `-- arch-powerpc-lib-code-patching.c:warning:no-previous-prototype-for-poking_init

clang_recent_errors
`-- powerpc-randconfig-r034-20210620
    `-- arch-powerpc-kernel-interrupt.c:error:unused-function-exit_must_hard_disable-Werror-Wunused-function

elapsed time: 723m

configs tested: 108
configs skipped: 5

gcc tested configs:
arm64                               defconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                  mpc885_ads_defconfig
sh                               j2_defconfig
sh                           se7712_defconfig
mips                          rb532_defconfig
xtensa                       common_defconfig
powerpc                     akebono_defconfig
powerpc                    klondike_defconfig
arm                        neponset_defconfig
powerpc                        icon_defconfig
powerpc                      obs600_defconfig
arm                       aspeed_g5_defconfig
powerpc                     skiroot_defconfig
arm                          imote2_defconfig
powerpc                 linkstation_defconfig
powerpc                   currituck_defconfig
microblaze                      mmu_defconfig
mips                     loongson2k_defconfig
mips                malta_qemu_32r6_defconfig
sh                   secureedge5410_defconfig
powerpc                        cell_defconfig
sh                          urquell_defconfig
x86_64                           allyesconfig
arm                       imx_v6_v7_defconfig
arm                          pxa168_defconfig
mips                 decstation_r4k_defconfig
arm                     davinci_all_defconfig
powerpc                     redwood_defconfig
ia64                         bigsur_defconfig
powerpc                 mpc834x_mds_defconfig
mips                        nlm_xlp_defconfig
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
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210620
i386                 randconfig-a002-20210620
i386                 randconfig-a003-20210620
i386                 randconfig-a006-20210620
i386                 randconfig-a005-20210620
i386                 randconfig-a004-20210620
x86_64               randconfig-a012-20210620
x86_64               randconfig-a014-20210620
x86_64               randconfig-a013-20210620
x86_64               randconfig-a011-20210620
x86_64               randconfig-a016-20210620
x86_64               randconfig-a015-20210620
i386                 randconfig-a011-20210620
i386                 randconfig-a014-20210620
i386                 randconfig-a013-20210620
i386                 randconfig-a012-20210620
i386                 randconfig-a015-20210620
i386                 randconfig-a016-20210620
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210620
x86_64               randconfig-a002-20210620
x86_64               randconfig-a001-20210620
x86_64               randconfig-a003-20210620
x86_64               randconfig-a004-20210620
x86_64               randconfig-a005-20210620
x86_64               randconfig-a006-20210620

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
