Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB137F1B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 05:34:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgcjP0cNtz3bnh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 13:34:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgcj00k1Mz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 13:34:21 +1000 (AEST)
IronPort-SDR: P+dvF6tQrmccqRT9gZRvKz9Au9hV8amBVny2AWOFhP/ndT38nyPuExlo5FkCg+YpcHOFIp5SMK
 4Y1p31DuMXUg==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="261109653"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="261109653"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2021 20:34:05 -0700
IronPort-SDR: EzeXMixqUdBidraD7fihoE/O4PGiLJYzJWbvU4mSStaOrPUZPCUiuVjSI27fL1p3BNANjhxcjv
 Foovf5Ki00VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="538139928"
Received: from lkp-server01.sh.intel.com (HELO ddd90b05c979) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 12 May 2021 20:34:04 -0700
Received: from kbuild by ddd90b05c979 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lh26t-00005F-OC; Thu, 13 May 2021 03:34:03 +0000
Date: Thu, 13 May 2021 11:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 1fab3666d738e4af3a7450c44441310e4d7a7e53
Message-ID: <609c9e24.bMvCRfMP4yYLfRjm%lkp@intel.com>
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
branch HEAD: 1fab3666d738e4af3a7450c44441310e4d7a7e53  Automatic merge of 'master' into merge (2021-05-09 08:09)

elapsed time: 6060m

configs tested: 97
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
powerpc                    adder875_defconfig
powerpc                 linkstation_defconfig
powerpc                   lite5200b_defconfig
arm                         mv78xx0_defconfig
sh                          urquell_defconfig
sh                   sh7724_generic_defconfig
powerpc                 mpc837x_mds_defconfig
openrisc                 simple_smp_defconfig
m68k                        m5307c3_defconfig
arm                       cns3420vb_defconfig
m68k                          sun3x_defconfig
ia64                      gensparse_defconfig
arm                              alldefconfig
s390                       zfcpdump_defconfig
powerpc                      ppc64e_defconfig
sparc                       sparc64_defconfig
ia64                             alldefconfig
mips                           ip22_defconfig
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
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210509
i386                 randconfig-a006-20210509
i386                 randconfig-a001-20210509
i386                 randconfig-a005-20210509
i386                 randconfig-a004-20210509
i386                 randconfig-a002-20210509
i386                 randconfig-a013-20210509
i386                 randconfig-a015-20210509
i386                 randconfig-a014-20210509
i386                 randconfig-a016-20210509
i386                 randconfig-a011-20210509
i386                 randconfig-a012-20210509
x86_64               randconfig-a005-20210509
x86_64               randconfig-a003-20210509
x86_64               randconfig-a001-20210509
x86_64               randconfig-a002-20210509
x86_64               randconfig-a006-20210509
x86_64               randconfig-a004-20210509
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
x86_64               randconfig-a014-20210509
x86_64               randconfig-a015-20210509
x86_64               randconfig-a011-20210509
x86_64               randconfig-a013-20210509
x86_64               randconfig-a012-20210509
x86_64               randconfig-a016-20210509

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
