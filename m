Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C237E37248A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 04:50:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ48P6M85z30Dd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:50:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ47y1Mftz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 12:50:00 +1000 (AEST)
IronPort-SDR: vAUEiCT2cBimj5cCxR8JJYF4HnXk59qAOGdoI1dvNSVi4rXxziBkNd2CVGyOEyICa+/Tj7zpc6
 hYzRSUDAJiuQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="178092840"
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="178092840"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 19:49:55 -0700
IronPort-SDR: LDCkUfmueScDOvDkL/9r5gY5pnDIZHCpJS6/2Cu9uw37nVjuw8YO0vZLmodhHDF7Df0eqDurGJ
 qK853K58h+Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="530793965"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 03 May 2021 19:49:54 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ldl8D-0009Qz-O6; Tue, 04 May 2021 02:49:53 +0000
Date: Tue, 04 May 2021 10:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 7905dafdefe9f1238a3ca2795cf975b311b5a5f6
Message-ID: <6090b631.4yKJxsQZwWTjMpwr%lkp@intel.com>
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
branch HEAD: 7905dafdefe9f1238a3ca2795cf975b311b5a5f6  powerpc/pseries: warn if recursing into the hcall tracing code

elapsed time: 2157m

configs tested: 108
configs skipped: 98

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allyesconfig
mips                         tb0219_defconfig
mips                           ip27_defconfig
sh                        apsh4ad0a_defconfig
riscv                             allnoconfig
arm                        neponset_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                        warp_defconfig
xtensa                              defconfig
mips                            e55_defconfig
arm                             pxa_defconfig
arm                        clps711x_defconfig
m68k                       m5475evb_defconfig
mips                     loongson1c_defconfig
arm                          exynos_defconfig
sh                          polaris_defconfig
powerpc                      cm5200_defconfig
sparc64                          alldefconfig
powerpc                mpc7448_hpc2_defconfig
powerpc                     kmeter1_defconfig
arc                              allyesconfig
arm                            lart_defconfig
powerpc                     ep8248e_defconfig
arm                        multi_v5_defconfig
arm                          pxa910_defconfig
m68k                          multi_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
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
i386                 randconfig-a003-20210503
i386                 randconfig-a006-20210503
i386                 randconfig-a001-20210503
i386                 randconfig-a005-20210503
i386                 randconfig-a004-20210503
i386                 randconfig-a002-20210503
i386                 randconfig-a003-20210502
i386                 randconfig-a006-20210502
i386                 randconfig-a001-20210502
i386                 randconfig-a005-20210502
i386                 randconfig-a004-20210502
i386                 randconfig-a002-20210502
x86_64               randconfig-a014-20210502
x86_64               randconfig-a015-20210502
x86_64               randconfig-a012-20210502
x86_64               randconfig-a011-20210502
x86_64               randconfig-a013-20210502
x86_64               randconfig-a016-20210502
i386                 randconfig-a013-20210502
i386                 randconfig-a015-20210502
i386                 randconfig-a016-20210502
i386                 randconfig-a014-20210502
i386                 randconfig-a011-20210502
i386                 randconfig-a012-20210502
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
x86_64               randconfig-a001-20210502
x86_64               randconfig-a005-20210502
x86_64               randconfig-a003-20210502
x86_64               randconfig-a002-20210502
x86_64               randconfig-a006-20210502
x86_64               randconfig-a004-20210502
x86_64               randconfig-a014-20210503
x86_64               randconfig-a015-20210503
x86_64               randconfig-a012-20210503
x86_64               randconfig-a011-20210503
x86_64               randconfig-a013-20210503
x86_64               randconfig-a016-20210503

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
