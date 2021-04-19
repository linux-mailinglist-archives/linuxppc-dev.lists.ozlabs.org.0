Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB7C3639C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 05:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNsx174N7z3c7g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 13:38:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNswK6s2Jz30Cr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 13:38:06 +1000 (AEST)
IronPort-SDR: vgdeBkOHB5Xl9VAxPH7jty7LXu+KpvgM5OTgXjAn1fRL80yiwPHFsuohZSzxnmW0+36rDN4iXN
 HxH/q/MMKleg==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="193139593"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="193139593"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2021 20:38:03 -0700
IronPort-SDR: vX3bTxgEEvgzPrxs8SfhWY12d1uKUope6sr73Sf3eYpA7hJyp9Mf2Ay/SbTyP/12+zZBGPBENZ
 fqhewMg3/5vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; d="scan'208";a="534007468"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 18 Apr 2021 20:38:01 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lYKjY-0001WP-Jh; Mon, 19 Apr 2021 03:38:00 +0000
Date: Mon, 19 Apr 2021 11:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS a38cb4171928f622c8c0ab7902971516540cacad
Message-ID: <607cfaf2.l0/RT+JTWSOADWwv%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: a38cb4171928f622c8c0ab7902971516540cacad  Merge branch 'topic/ppc-kvm' into next

elapsed time: 720m

configs tested: 114
configs skipped: 36

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
riscv                            allyesconfig
powerpc                      pasemi_defconfig
mips                     decstation_defconfig
riscv                            alldefconfig
arm                       versatile_defconfig
powerpc                     ksi8560_defconfig
sh                           se7751_defconfig
powerpc                     tqm5200_defconfig
sh                          sdk7780_defconfig
arm                            mmp2_defconfig
mips                            gpr_defconfig
powerpc                     akebono_defconfig
powerpc                    amigaone_defconfig
ia64                        generic_defconfig
ia64                          tiger_defconfig
arm                        mvebu_v7_defconfig
powerpc64                        alldefconfig
s390                          debug_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                           ci20_defconfig
mips                     cu1000-neo_defconfig
arm                           stm32_defconfig
arm                      pxa255-idp_defconfig
arm                         s5pv210_defconfig
powerpc                        icon_defconfig
arm                             pxa_defconfig
um                           x86_64_defconfig
arm                           u8500_defconfig
xtensa                          iss_defconfig
powerpc                 mpc834x_mds_defconfig
um                            kunit_defconfig
arm                        keystone_defconfig
arm                         palmz72_defconfig
powerpc                    gamecube_defconfig
arm                           h5000_defconfig
mips                         tb0226_defconfig
sh                          polaris_defconfig
sh                   sh7724_generic_defconfig
arm                           sama5_defconfig
sh                           se7712_defconfig
powerpc                     tqm8555_defconfig
mips                        vocore2_defconfig
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
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210418
i386                 randconfig-a001-20210418
i386                 randconfig-a006-20210418
i386                 randconfig-a005-20210418
i386                 randconfig-a004-20210418
i386                 randconfig-a002-20210418
x86_64               randconfig-a014-20210418
x86_64               randconfig-a015-20210418
x86_64               randconfig-a013-20210418
x86_64               randconfig-a011-20210418
x86_64               randconfig-a012-20210418
x86_64               randconfig-a016-20210418
i386                 randconfig-a015-20210418
i386                 randconfig-a013-20210418
i386                 randconfig-a014-20210418
i386                 randconfig-a016-20210418
i386                 randconfig-a012-20210418
i386                 randconfig-a011-20210418
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a003-20210418
x86_64               randconfig-a001-20210418
x86_64               randconfig-a005-20210418
x86_64               randconfig-a002-20210418
x86_64               randconfig-a006-20210418
x86_64               randconfig-a004-20210418

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
