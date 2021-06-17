Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605C3AA978
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 05:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G56kt0hznz3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 13:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G56kS72gSz3019
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 13:20:11 +1000 (AEST)
IronPort-SDR: rLOi+H0jDwC4XQ/VXfKx1WhhBDUO6IN43PWVFuzI7vfCYNKsYozvFRf+us2EIQxxfcn+eeiwFm
 1J9LMZm6Se8Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193603854"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="193603854"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 20:20:04 -0700
IronPort-SDR: OFY/ohIRb/yEP+n7wS3XN2yLo7fI6fCgJVy3/8ny5Lx7fWRfL3KpvZ6QD9zqJBhwOtxYuZbbGx
 VUYWWqnh40ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="452623357"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2021 20:20:02 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ltiZW-0001lh-7f; Thu, 17 Jun 2021 03:20:02 +0000
Date: Thu, 17 Jun 2021 11:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 27f6bc40cd9485020869fb01244b77ae6a266680
Message-ID: <60cabf4f.NMfln43zjgBvGyGC%lkp@intel.com>
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
branch HEAD: 27f6bc40cd9485020869fb01244b77ae6a266680  selftests/powerpc: Always test lmw and stmw

elapsed time: 740m

configs tested: 153
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
powerpc                  mpc885_ads_defconfig
arm                             pxa_defconfig
sh                         ap325rxa_defconfig
openrisc                    or1ksim_defconfig
m68k                         apollo_defconfig
arm                           h3600_defconfig
arm                            pleb_defconfig
sh                            shmin_defconfig
powerpc                      makalu_defconfig
parisc                generic-64bit_defconfig
arc                            hsdk_defconfig
xtensa                  audio_kc705_defconfig
mips                            e55_defconfig
powerpc                 mpc837x_rdb_defconfig
mips                        workpad_defconfig
xtensa                generic_kc705_defconfig
arm                           sama5_defconfig
arm                         s5pv210_defconfig
ia64                         bigsur_defconfig
arm                        oxnas_v6_defconfig
powerpc                     tqm5200_defconfig
powerpc                 mpc8560_ads_defconfig
arm                         vf610m4_defconfig
arm                       omap2plus_defconfig
mips                        maltaup_defconfig
sh                              ul2_defconfig
um                                  defconfig
s390                          debug_defconfig
sh                          sdk7780_defconfig
sparc                            alldefconfig
arm                             ezx_defconfig
arc                        nsimosci_defconfig
mips                     cu1000-neo_defconfig
powerpc                    gamecube_defconfig
microblaze                      mmu_defconfig
xtensa                  cadence_csp_defconfig
arm                        multi_v7_defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20210615
i386                 randconfig-a006-20210615
i386                 randconfig-a004-20210615
i386                 randconfig-a001-20210615
i386                 randconfig-a005-20210615
i386                 randconfig-a003-20210615
i386                 randconfig-a002-20210617
i386                 randconfig-a006-20210617
i386                 randconfig-a001-20210617
i386                 randconfig-a004-20210617
i386                 randconfig-a005-20210617
i386                 randconfig-a003-20210617
x86_64               randconfig-a004-20210617
x86_64               randconfig-a001-20210617
x86_64               randconfig-a002-20210617
x86_64               randconfig-a003-20210617
x86_64               randconfig-a006-20210617
x86_64               randconfig-a005-20210617
x86_64               randconfig-a015-20210616
x86_64               randconfig-a011-20210616
x86_64               randconfig-a014-20210616
x86_64               randconfig-a012-20210616
x86_64               randconfig-a013-20210616
x86_64               randconfig-a016-20210616
i386                 randconfig-a015-20210617
i386                 randconfig-a013-20210617
i386                 randconfig-a016-20210617
i386                 randconfig-a012-20210617
i386                 randconfig-a014-20210617
i386                 randconfig-a011-20210617
i386                 randconfig-a015-20210616
i386                 randconfig-a013-20210616
i386                 randconfig-a016-20210616
i386                 randconfig-a012-20210616
i386                 randconfig-a014-20210616
i386                 randconfig-a011-20210616
i386                 randconfig-a015-20210615
i386                 randconfig-a013-20210615
i386                 randconfig-a016-20210615
i386                 randconfig-a012-20210615
i386                 randconfig-a014-20210615
i386                 randconfig-a011-20210615
x86_64               randconfig-a001-20210615
x86_64               randconfig-a004-20210615
x86_64               randconfig-a002-20210615
x86_64               randconfig-a003-20210615
x86_64               randconfig-a006-20210615
x86_64               randconfig-a005-20210615
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
um                            kunit_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210615
x86_64               randconfig-b001-20210617
x86_64               randconfig-a015-20210617
x86_64               randconfig-a011-20210617
x86_64               randconfig-a014-20210617
x86_64               randconfig-a012-20210617
x86_64               randconfig-a013-20210617
x86_64               randconfig-a016-20210617
x86_64               randconfig-a015-20210615
x86_64               randconfig-a011-20210615
x86_64               randconfig-a012-20210615
x86_64               randconfig-a014-20210615
x86_64               randconfig-a016-20210615
x86_64               randconfig-a013-20210615

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
