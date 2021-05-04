Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2F37248C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 04:50:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ48p2sYhz3bcf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:50:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ47y38Rdz2yRB
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 12:49:59 +1000 (AEST)
IronPort-SDR: NX7DSShYcbsGu9iAGSaxYxXnM+iywkb7/E+iwHWCpFmahgUj9uaZdamh+83ZIIzUpTUk502QAk
 djZO9MaWXRpA==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="261831639"
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="261831639"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 19:49:55 -0700
IronPort-SDR: rvZoLx7+c1+xxMdTwwfQ9XFOP5nP438JB2PJZ0YZldYF/xefHMBiXvpfj3QXdm3Cp3Uo3ymEHP
 shaE6xIbDNpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,271,1613462400"; d="scan'208";a="606848899"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 03 May 2021 19:49:54 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ldl8D-0009R4-RO; Tue, 04 May 2021 02:49:53 +0000
Date: Tue, 04 May 2021 10:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 134b5c8a49b594ff6cfb4ea1a92400bb382b46d2
Message-ID: <6090b62d.pF3zQQHr+8VQBRPU%lkp@intel.com>
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
branch HEAD: 134b5c8a49b594ff6cfb4ea1a92400bb382b46d2  Automatic merge of 'master' into merge (2021-05-02 23:37)

elapsed time: 2159m

configs tested: 145
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
riscv                            allmodconfig
riscv                            allyesconfig
mips                         tb0219_defconfig
mips                           ip27_defconfig
sh                        apsh4ad0a_defconfig
riscv                             allnoconfig
arm                        neponset_defconfig
sh                          rsk7203_defconfig
sh                   sh7724_generic_defconfig
m68k                          amiga_defconfig
ia64                            zx1_defconfig
mips                       lemote2f_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                        warp_defconfig
xtensa                              defconfig
mips                            e55_defconfig
powerpc                    mvme5100_defconfig
arm                      pxa255-idp_defconfig
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
um                           x86_64_defconfig
mips                        omega2p_defconfig
mips                      pistachio_defconfig
xtensa                       common_defconfig
sh                           se7619_defconfig
arm                          pxa3xx_defconfig
arc                        vdk_hs38_defconfig
arm                          iop32x_defconfig
sh                         ecovec24_defconfig
nds32                            alldefconfig
i386                                defconfig
arm                         assabet_defconfig
arm                  colibri_pxa270_defconfig
arm                        spear3xx_defconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20210503
x86_64               randconfig-a005-20210503
x86_64               randconfig-a003-20210503
x86_64               randconfig-a002-20210503
x86_64               randconfig-a006-20210503
x86_64               randconfig-a004-20210503
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
i386                 randconfig-a013-20210503
i386                 randconfig-a015-20210503
i386                 randconfig-a016-20210503
i386                 randconfig-a014-20210503
i386                 randconfig-a011-20210503
i386                 randconfig-a012-20210503
i386                 randconfig-a013-20210502
i386                 randconfig-a015-20210502
i386                 randconfig-a016-20210502
i386                 randconfig-a014-20210502
i386                 randconfig-a011-20210502
i386                 randconfig-a012-20210502
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
riscv                          rv32_defconfig
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
