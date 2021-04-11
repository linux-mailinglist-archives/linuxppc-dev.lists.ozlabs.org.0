Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104935B146
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 05:37:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHyHM1TVbz3c1r
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 13:37:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHyH03zGfz2yxq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 13:37:11 +1000 (AEST)
IronPort-SDR: XJONF5l57SEMZPjOrR9pECPt5JYX7v1VTtSySGJ7e/TQIKXmIgeMpzMby9m4Xupw3NT8NdyyDN
 ZQNp84uqrYPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9950"; a="214435115"
X-IronPort-AV: E=Sophos;i="5.82,213,1613462400"; d="scan'208";a="214435115"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2021 20:37:07 -0700
IronPort-SDR: /yQty7L0DulTHgSv2qX/LTwjfySYJAml2xbIm2B1R0/bodlPETmzDVw6kgoRr/c8DXst3JkGaF
 fyre7c0ssDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,213,1613462400"; d="scan'208";a="520742213"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 10 Apr 2021 20:37:06 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lVQuH-000IoI-Q4; Sun, 11 Apr 2021 03:37:05 +0000
Date: Sun, 11 Apr 2021 11:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS d02429becbe77bc4d27a7357afaf28f9294945bb
Message-ID: <60726ecb.aQW5SACZ1bHtYuVA%lkp@intel.com>
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
branch HEAD: d02429becbe77bc4d27a7357afaf28f9294945bb  Automatic merge of 'master' into merge (2021-04-11 00:30)

elapsed time: 720m

configs tested: 117
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                               defconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
sh                   sh7724_generic_defconfig
xtensa                    xip_kc705_defconfig
powerpc                      ppc64e_defconfig
arm                            hisi_defconfig
xtensa                          iss_defconfig
sh                           se7722_defconfig
m68k                        m5307c3_defconfig
powerpc                       ppc64_defconfig
xtensa                generic_kc705_defconfig
mips                         db1xxx_defconfig
arm                       netwinder_defconfig
openrisc                 simple_smp_defconfig
sh                         ecovec24_defconfig
s390                          debug_defconfig
powerpc                       ebony_defconfig
sh                   secureedge5410_defconfig
powerpc                      tqm8xx_defconfig
nios2                         3c120_defconfig
sh                           se7724_defconfig
arc                         haps_hs_defconfig
xtensa                    smp_lx200_defconfig
arm                        multi_v5_defconfig
sh                      rts7751r2d1_defconfig
h8300                     edosk2674_defconfig
powerpc                      pasemi_defconfig
m68k                         amcore_defconfig
powerpc                     ksi8560_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20210409
i386                 randconfig-a003-20210409
i386                 randconfig-a001-20210409
i386                 randconfig-a004-20210409
i386                 randconfig-a002-20210409
i386                 randconfig-a005-20210409
x86_64               randconfig-a014-20210410
x86_64               randconfig-a015-20210410
x86_64               randconfig-a011-20210410
x86_64               randconfig-a013-20210410
x86_64               randconfig-a012-20210410
x86_64               randconfig-a016-20210410
i386                 randconfig-a015-20210411
i386                 randconfig-a014-20210411
i386                 randconfig-a013-20210411
i386                 randconfig-a012-20210411
i386                 randconfig-a016-20210411
i386                 randconfig-a011-20210411
x86_64               randconfig-a003-20210411
x86_64               randconfig-a002-20210411
x86_64               randconfig-a001-20210411
x86_64               randconfig-a005-20210411
x86_64               randconfig-a006-20210411
x86_64               randconfig-a004-20210411
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20210409
x86_64               randconfig-a005-20210409
x86_64               randconfig-a003-20210409
x86_64               randconfig-a001-20210409
x86_64               randconfig-a002-20210409
x86_64               randconfig-a006-20210409
x86_64               randconfig-a014-20210411
x86_64               randconfig-a015-20210411
x86_64               randconfig-a011-20210411
x86_64               randconfig-a013-20210411
x86_64               randconfig-a012-20210411
x86_64               randconfig-a016-20210411

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
