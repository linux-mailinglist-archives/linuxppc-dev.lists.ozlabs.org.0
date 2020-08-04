Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF60F23B45D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 07:19:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLNNd6533zDqXK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 15:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLNLw1KJBzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 15:18:11 +1000 (AEST)
IronPort-SDR: cnFvy3dXegbfiNAvasm8eRZm2yVKnUkjnuzb1kg8muiqcbkK6txodsLF10S7GYppdHP6rw9vPf
 5XyqsSwQF42w==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="140172292"
X-IronPort-AV: E=Sophos;i="5.75,432,1589266800"; d="scan'208";a="140172292"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 22:18:07 -0700
IronPort-SDR: 3wsIrwtNafiSTMtfLt2aFWwgLzXw/w6EKiVMrVH2yrP62r4NRI0DMv0rch7feAGMr/WB2gWVJY
 Sij2OfcSzyZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,432,1589266800"; d="scan'208";a="315191924"
Received: from lkp-server02.sh.intel.com (HELO 84ccfe698a63) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2020 22:18:05 -0700
Received: from kbuild by 84ccfe698a63 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k2pKv-0000RI-Ab; Tue, 04 Aug 2020 05:18:05 +0000
Date: Tue, 04 Aug 2020 13:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS a3dcfbc2456df1a2d416b7d0b627d9cededa1432
Message-ID: <5f28ef54.o3bTb7yr0+WSXGk3%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  merge
branch HEAD: a3dcfbc2456df1a2d416b7d0b627d9cededa1432  Automatic merge of 'master', 'next' and 'fixes' (2020-08-03 22:40)

elapsed time: 987m

configs tested: 82
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
ia64                        generic_defconfig
m68k                       bvme6000_defconfig
arm                          pxa168_defconfig
powerpc                       maple_defconfig
mips                malta_qemu_32r6_defconfig
arm64                            alldefconfig
arm                    vt8500_v6_v7_defconfig
arm                            lart_defconfig
mips                        omega2p_defconfig
mips                     loongson1c_defconfig
xtensa                           alldefconfig
nds32                             allnoconfig
powerpc                          alldefconfig
mips                      bmips_stb_defconfig
arm                        magician_defconfig
parisc                           alldefconfig
mips                           ip32_defconfig
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
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a004-20200803
i386                 randconfig-a005-20200803
i386                 randconfig-a001-20200803
i386                 randconfig-a002-20200803
i386                 randconfig-a003-20200803
i386                 randconfig-a006-20200803
x86_64               randconfig-a013-20200803
x86_64               randconfig-a011-20200803
x86_64               randconfig-a012-20200803
x86_64               randconfig-a016-20200803
x86_64               randconfig-a015-20200803
x86_64               randconfig-a014-20200803
i386                 randconfig-a011-20200803
i386                 randconfig-a012-20200803
i386                 randconfig-a015-20200803
i386                 randconfig-a014-20200803
i386                 randconfig-a013-20200803
i386                 randconfig-a016-20200803
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
