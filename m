Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455383FAAF1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Aug 2021 12:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gy98d6q84z306l
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Aug 2021 20:45:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gy9882zQpz2xrp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Aug 2021 20:45:06 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10090"; a="218188742"
X-IronPort-AV: E=Sophos;i="5.84,361,1620716400"; d="scan'208";a="218188742"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 03:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,361,1620716400"; d="scan'208";a="518349351"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 29 Aug 2021 03:43:56 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mKII8-0004Dd-7F; Sun, 29 Aug 2021 10:43:56 +0000
Date: Sun, 29 Aug 2021 18:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS a555f645f92c58683d0a8d3315352a8d0ce8f80e
Message-ID: <612b64b4.fupRGgPRLlA9srDw%lkp@intel.com>
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
branch HEAD: a555f645f92c58683d0a8d3315352a8d0ce8f80e  Automatic merge of 'next' into merge (2021-08-23 23:59)

elapsed time: 6983m

configs tested: 182
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20210827
powerpc              randconfig-c003-20210827
arm                       omap2plus_defconfig
sparc64                          alldefconfig
sparc                       sparc32_defconfig
mips                       lemote2f_defconfig
powerpc                    amigaone_defconfig
mips                           mtx1_defconfig
csky                             alldefconfig
powerpc                     mpc512x_defconfig
sh                   rts7751r2dplus_defconfig
sh                   sh7770_generic_defconfig
arm                       multi_v4t_defconfig
sh                            migor_defconfig
arm                          pxa168_defconfig
arm                         axm55xx_defconfig
powerpc                      pcm030_defconfig
mips                           rs90_defconfig
powerpc                      ppc40x_defconfig
arm                          ixp4xx_defconfig
arm                       spear13xx_defconfig
arc                        vdk_hs38_defconfig
arm                           spitz_defconfig
mips                        nlm_xlr_defconfig
arm                      integrator_defconfig
arm                        clps711x_defconfig
sh                          rsk7264_defconfig
mips                         tb0226_defconfig
powerpc                      pmac32_defconfig
mips                          ath79_defconfig
mips                             allmodconfig
alpha                            alldefconfig
powerpc                       ebony_defconfig
arm                       netwinder_defconfig
arm                         assabet_defconfig
arm                          imote2_defconfig
arm                         shannon_defconfig
arm                             pxa_defconfig
powerpc                   lite5200b_defconfig
mips                        vocore2_defconfig
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
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a005-20210824
x86_64               randconfig-a006-20210824
x86_64               randconfig-a001-20210824
x86_64               randconfig-a003-20210824
x86_64               randconfig-a004-20210824
x86_64               randconfig-a002-20210824
i386                 randconfig-a006-20210824
i386                 randconfig-a001-20210824
i386                 randconfig-a002-20210824
i386                 randconfig-a005-20210824
i386                 randconfig-a003-20210824
i386                 randconfig-a004-20210824
x86_64               randconfig-a014-20210827
x86_64               randconfig-a015-20210827
x86_64               randconfig-a016-20210827
x86_64               randconfig-a013-20210827
x86_64               randconfig-a012-20210827
x86_64               randconfig-a011-20210827
x86_64               randconfig-a014-20210825
x86_64               randconfig-a015-20210825
x86_64               randconfig-a016-20210825
x86_64               randconfig-a013-20210825
x86_64               randconfig-a012-20210825
x86_64               randconfig-a011-20210825
i386                 randconfig-a011-20210827
i386                 randconfig-a016-20210827
i386                 randconfig-a012-20210827
i386                 randconfig-a014-20210827
i386                 randconfig-a013-20210827
i386                 randconfig-a015-20210827
i386                 randconfig-a011-20210825
i386                 randconfig-a016-20210825
i386                 randconfig-a012-20210825
i386                 randconfig-a014-20210825
i386                 randconfig-a013-20210825
i386                 randconfig-a015-20210825
arc                  randconfig-r043-20210825
riscv                randconfig-r042-20210825
s390                 randconfig-r044-20210825
arc                  randconfig-r043-20210824
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
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
s390                 randconfig-c005-20210825
i386                 randconfig-c001-20210825
arm                  randconfig-c002-20210825
riscv                randconfig-c006-20210825
powerpc              randconfig-c003-20210825
x86_64               randconfig-c007-20210825
mips                 randconfig-c004-20210825
i386                 randconfig-c001-20210826
s390                 randconfig-c005-20210826
arm                  randconfig-c002-20210826
riscv                randconfig-c006-20210826
powerpc              randconfig-c003-20210826
x86_64               randconfig-c007-20210826
mips                 randconfig-c004-20210826
i386                 randconfig-a006-20210825
i386                 randconfig-a001-20210825
i386                 randconfig-a002-20210825
i386                 randconfig-a005-20210825
i386                 randconfig-a004-20210825
i386                 randconfig-a003-20210825
i386                 randconfig-a001-20210829
i386                 randconfig-a006-20210829
i386                 randconfig-a005-20210829
i386                 randconfig-a004-20210829
i386                 randconfig-a003-20210829
x86_64               randconfig-a014-20210824
x86_64               randconfig-a015-20210824
x86_64               randconfig-a016-20210824
x86_64               randconfig-a013-20210824
x86_64               randconfig-a012-20210824
x86_64               randconfig-a011-20210824
x86_64               randconfig-a005-20210827
x86_64               randconfig-a001-20210827
x86_64               randconfig-a006-20210827
x86_64               randconfig-a003-20210827
x86_64               randconfig-a004-20210827
x86_64               randconfig-a002-20210827
i386                 randconfig-a011-20210824
i386                 randconfig-a016-20210824
i386                 randconfig-a012-20210824
i386                 randconfig-a014-20210824
i386                 randconfig-a013-20210824
i386                 randconfig-a015-20210824
hexagon              randconfig-r041-20210826
hexagon              randconfig-r045-20210826
riscv                randconfig-r042-20210826
s390                 randconfig-r044-20210826
hexagon              randconfig-r041-20210824
hexagon              randconfig-r045-20210824
riscv                randconfig-r042-20210824
s390                 randconfig-r044-20210824

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
