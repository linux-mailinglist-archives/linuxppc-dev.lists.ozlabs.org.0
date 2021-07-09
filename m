Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C293C1DC9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 05:26:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLdqk1YkRz3bjB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 13:26:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLdqG37CTz2yXh
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 13:26:12 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10039"; a="196915470"
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; d="scan'208";a="196915470"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 20:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,225,1620716400"; d="scan'208";a="648796897"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
 by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2021 20:25:02 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1m1h8Q-000EeO-6v; Fri, 09 Jul 2021 03:25:02 +0000
Date: Fri, 09 Jul 2021 11:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 8b3ae5772c2771c21ffcda36203f8f507ebc6fc0
Message-ID: <60e7c18b.eWUNXnDIRtaReGZx%lkp@intel.com>
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
branch HEAD: 8b3ae5772c2771c21ffcda36203f8f507ebc6fc0  Automatic merge of 'fixes' into merge (2021-07-08 23:43)

elapsed time: 724m

configs tested: 133
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                      malta_kvm_defconfig
sh                           se7712_defconfig
m68k                       bvme6000_defconfig
arm                         palmz72_defconfig
sh                           se7721_defconfig
mips                          rb532_defconfig
sh                 kfr2r09-romimage_defconfig
x86_64                              defconfig
ia64                            zx1_defconfig
m68k                          multi_defconfig
arm                            mps2_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                      chrp32_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc832x_rdb_defconfig
powerpc                     ep8248e_defconfig
arm                        oxnas_v6_defconfig
arm                         axm55xx_defconfig
arm                        clps711x_defconfig
sparc                       sparc64_defconfig
mips                        vocore2_defconfig
powerpc                         ps3_defconfig
powerpc                    sam440ep_defconfig
arm                           corgi_defconfig
arm                  colibri_pxa270_defconfig
mips                         cobalt_defconfig
powerpc                     akebono_defconfig
powerpc                   motionpro_defconfig
sh                           se7750_defconfig
s390                          debug_defconfig
powerpc                    mvme5100_defconfig
sh                     magicpanelr2_defconfig
sh                               alldefconfig
mips                    maltaup_xpa_defconfig
mips                     loongson2k_defconfig
arc                        nsim_700_defconfig
sparc64                          alldefconfig
sh                        sh7757lcr_defconfig
arm                          imote2_defconfig
sh                   secureedge5410_defconfig
mips                        jmr3927_defconfig
powerpc                     tqm8560_defconfig
powerpc                          allyesconfig
arm                           h3600_defconfig
arm                           u8500_defconfig
arm                        mvebu_v7_defconfig
sh                            hp6xx_defconfig
powerpc                  mpc885_ads_defconfig
arm                     davinci_all_defconfig
riscv                    nommu_k210_defconfig
mips                     loongson1c_defconfig
mips                            gpr_defconfig
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
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210707
x86_64               randconfig-a002-20210707
x86_64               randconfig-a005-20210707
x86_64               randconfig-a006-20210707
x86_64               randconfig-a003-20210707
x86_64               randconfig-a001-20210707
i386                 randconfig-a006-20210708
i386                 randconfig-a004-20210708
i386                 randconfig-a001-20210708
i386                 randconfig-a003-20210708
i386                 randconfig-a005-20210708
i386                 randconfig-a002-20210708
i386                 randconfig-a004-20210707
i386                 randconfig-a006-20210707
i386                 randconfig-a001-20210707
i386                 randconfig-a003-20210707
i386                 randconfig-a005-20210707
i386                 randconfig-a002-20210707
i386                 randconfig-a015-20210707
i386                 randconfig-a016-20210707
i386                 randconfig-a012-20210707
i386                 randconfig-a011-20210707
i386                 randconfig-a014-20210707
i386                 randconfig-a013-20210707
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
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-b001-20210707
x86_64               randconfig-a015-20210707
x86_64               randconfig-a014-20210707
x86_64               randconfig-a012-20210707
x86_64               randconfig-a011-20210707
x86_64               randconfig-a016-20210707
x86_64               randconfig-a013-20210707

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
