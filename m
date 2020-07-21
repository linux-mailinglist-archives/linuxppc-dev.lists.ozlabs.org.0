Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89422886C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 20:41:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB6rP5mx6zDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 04:41:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB6ns2DFmzDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 04:39:27 +1000 (AEST)
IronPort-SDR: NUZ//1jQQYQqzGDTd83/7ChmWER3u/t78HsvejDJ+MCKJZONQKfIPjEzhyAvH361VsybbVFEaM
 5qbGszVacEpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="235075503"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="235075503"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 11:39:25 -0700
IronPort-SDR: vygm0I3FbxVuUFo2sw8CPwEAr//UABce2ZelNch3E3SpDTBp1AbD/CwCAtuMdbk/EJkWYmw5eO
 Rs3puaQ+ZEIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="432097022"
Received: from lkp-server02.sh.intel.com (HELO 7dd7ac9fbea4) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2020 11:39:23 -0700
Received: from kbuild by 7dd7ac9fbea4 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jxxAh-0000DB-8W; Tue, 21 Jul 2020 18:39:23 +0000
Date: Wed, 22 Jul 2020 02:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS 9a77c4a0a12597c661be374b8d566516c0341570
Message-ID: <5f1735f8.n4e/KJyYBusJc5aK%lkp@intel.com>
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
branch HEAD: 9a77c4a0a12597c661be374b8d566516c0341570  powerpc/prom: Enable Radix GTSE in cpu pa-features

elapsed time: 1700m

configs tested: 117
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
c6x                                 defconfig
c6x                        evmc6474_defconfig
sh                               alldefconfig
mips                         bigsur_defconfig
arm                           sama5_defconfig
arm                           omap1_defconfig
mips                            e55_defconfig
arm                         shannon_defconfig
sparc64                           allnoconfig
arm                      footbridge_defconfig
s390                             alldefconfig
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
arm                         s3c6400_defconfig
mips                       rbtx49xx_defconfig
arm                            u300_defconfig
ia64                             alldefconfig
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
i386                 randconfig-a015-20200719
i386                 randconfig-a011-20200719
i386                 randconfig-a016-20200719
i386                 randconfig-a012-20200719
i386                 randconfig-a013-20200719
i386                 randconfig-a014-20200719
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
