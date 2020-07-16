Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA7221A63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 04:58:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6f8S2P2MzDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 12:58:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6f3s2wFXzDqs3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 12:54:30 +1000 (AEST)
IronPort-SDR: Wt+glL6eNR2J1XBCVqOiaDDkpLpX5PAogcNtTygJDj2m90fpXoPyWDzVws8sJNv9Ir2H4vmWz8
 Z7c4uWqllLeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9683"; a="214048159"
X-IronPort-AV: E=Sophos;i="5.75,357,1589266800"; d="scan'208";a="214048159"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 19:54:26 -0700
IronPort-SDR: n995SIn9lYS1kdynpMpvvRLJ5zHS0wP+Uah26yjvwssn+Xk9Qh2fC2M9t6ieZTmtKhnG9ajLlu
 90QmotgyFK+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,357,1589266800"; d="scan'208";a="326378546"
Received: from lkp-server02.sh.intel.com (HELO 02dcbd16d3ea) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 15 Jul 2020 19:54:25 -0700
Received: from kbuild by 02dcbd16d3ea with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jvu2S-00000n-M9; Thu, 16 Jul 2020 02:54:24 +0000
Date: Thu, 16 Jul 2020 10:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS f88223979044bfae32cb16f814c43739e5ba1301
Message-ID: <5f0fc104.iXSXtScjyCpohh4q%lkp@intel.com>
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
branch HEAD: f88223979044bfae32cb16f814c43739e5ba1301  powerpc: re-initialise lazy FPU/VEC counters on every fault

elapsed time: 724m

configs tested: 100
configs skipped: 2

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
arc                          axs101_defconfig
c6x                        evmc6457_defconfig
sh                 kfr2r09-romimage_defconfig
powerpc                    gamecube_defconfig
arm                          lpd270_defconfig
arm                        clps711x_defconfig
arm                           corgi_defconfig
riscv                            allyesconfig
arm                         orion5x_defconfig
i386                              allnoconfig
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
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200715
i386                 randconfig-a005-20200715
i386                 randconfig-a002-20200715
i386                 randconfig-a006-20200715
i386                 randconfig-a003-20200715
i386                 randconfig-a004-20200715
x86_64               randconfig-a005-20200715
x86_64               randconfig-a006-20200715
x86_64               randconfig-a002-20200715
x86_64               randconfig-a001-20200715
x86_64               randconfig-a003-20200715
x86_64               randconfig-a004-20200715
i386                 randconfig-a016-20200715
i386                 randconfig-a011-20200715
i386                 randconfig-a015-20200715
i386                 randconfig-a012-20200715
i386                 randconfig-a013-20200715
i386                 randconfig-a014-20200715
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
