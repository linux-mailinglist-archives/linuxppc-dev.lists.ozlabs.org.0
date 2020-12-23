Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE172E17DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 04:54:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0zpx1gF7zDqTF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 14:54:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0znW67KMzDqS1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 14:52:59 +1100 (AEDT)
IronPort-SDR: pyAHkZ+v87+OwpxA+wRZW1amTontB3MkAvJzzOabmKcILcXtWuMmKMW/EbgXGeM310RHSdFNsC
 QJ3tVK0J/HAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="175182612"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="175182612"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2020 19:52:54 -0800
IronPort-SDR: dxoE1/hfqteMfU42L6akSjsBXOMxCOr4k8OUqAoasGlBKuuMuhpNI3rp49a7efM+TE4CbIYo+w
 8P9g/LP4wBYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="397764757"
Received: from lkp-server02.sh.intel.com (HELO 4242b19f17ef) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2020 19:52:53 -0800
Received: from kbuild by 4242b19f17ef with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1krvCn-00005m-6N; Wed, 23 Dec 2020 03:52:53 +0000
Date: Wed, 23 Dec 2020 11:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 9c7422b92cb27369653c371ad9c44a502e5eea8f
Message-ID: <5fe2bee9.DOPS2m2+4u21gc4q%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  fixes-test
branch HEAD: 9c7422b92cb27369653c371ad9c44a502e5eea8f  powerpc/32s: Fix RTAS machine check with VMAP stack

elapsed time: 875m

configs tested: 118
configs skipped: 109

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                     kilauea_defconfig
powerpc                     tqm8555_defconfig
arc                           tb10x_defconfig
xtensa                       common_defconfig
c6x                        evmc6474_defconfig
powerpc                        fsp2_defconfig
m68k                           sun3_defconfig
powerpc                     skiroot_defconfig
powerpc                 mpc834x_itx_defconfig
m68k                            q40_defconfig
m68k                       m5208evb_defconfig
arm                           h5000_defconfig
arm                          pxa168_defconfig
powerpc                        icon_defconfig
powerpc                    ge_imp3a_defconfig
sh                               j2_defconfig
arm                           spitz_defconfig
arm                          badge4_defconfig
powerpc                     tqm8548_defconfig
powerpc                     mpc512x_defconfig
mips                           xway_defconfig
powerpc                      ppc64e_defconfig
arm                      pxa255-idp_defconfig
arm                           tegra_defconfig
arm                      integrator_defconfig
powerpc                    adder875_defconfig
mips                      fuloong2e_defconfig
powerpc                       ebony_defconfig
arm                            dove_defconfig
sh                             espt_defconfig
arm                        realview_defconfig
s390                             alldefconfig
powerpc                 canyonlands_defconfig
powerpc                       ppc64_defconfig
powerpc                    mvme5100_defconfig
arm                       cns3420vb_defconfig
arm                             rpc_defconfig
arm                         palmz72_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                    vt8500_v6_v7_defconfig
arm                     eseries_pxa_defconfig
mips                           mtx1_defconfig
um                             i386_defconfig
m68k                       bvme6000_defconfig
sh                           sh2007_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a001-20201221
x86_64               randconfig-a006-20201221
x86_64               randconfig-a002-20201221
x86_64               randconfig-a004-20201221
x86_64               randconfig-a003-20201221
x86_64               randconfig-a005-20201221
i386                 randconfig-a005-20201222
i386                 randconfig-a002-20201222
i386                 randconfig-a006-20201222
i386                 randconfig-a004-20201222
i386                 randconfig-a003-20201222
i386                 randconfig-a001-20201222
i386                 randconfig-a011-20201221
i386                 randconfig-a016-20201221
i386                 randconfig-a014-20201221
i386                 randconfig-a012-20201221
i386                 randconfig-a015-20201221
i386                 randconfig-a013-20201221
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a015-20201221
x86_64               randconfig-a014-20201221
x86_64               randconfig-a012-20201221
x86_64               randconfig-a013-20201221
x86_64               randconfig-a011-20201221
x86_64               randconfig-a001-20201222
x86_64               randconfig-a006-20201222
x86_64               randconfig-a002-20201222
x86_64               randconfig-a004-20201222
x86_64               randconfig-a003-20201222
x86_64               randconfig-a005-20201222

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
