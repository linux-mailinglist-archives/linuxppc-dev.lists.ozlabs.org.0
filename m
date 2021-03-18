Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A2433FC8A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 02:09:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F187K4R8Yz3bsq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 12:09:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F186c5zprz300j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 12:08:36 +1100 (AEDT)
IronPort-SDR: g0Ex47vm+tT6MqBghIFWQGLleWjU7H1Rqojxs4tzpyH4vOncHwhhpqcomuVoWvoDQccm7hZReN
 KalQHRSMtlTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="177170681"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="177170681"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 18:08:34 -0700
IronPort-SDR: QwwJqDSqHvipGe9vND4oePLWSycsjP4k58IYdj9rEB94DqX/2eZJT7Z4Hq4A88dQq0g8plE17E
 DMFrIreq09FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="433618958"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2021 18:08:32 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lMh9M-0000wb-6z; Thu, 18 Mar 2021 01:08:32 +0000
Date: Thu, 18 Mar 2021 09:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 11aa533b82d5785e0475fd1e2f47db1ccf8f5be4
Message-ID: <6052a7fd.c+ToFG1hwa642SCV%lkp@intel.com>
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
branch HEAD: 11aa533b82d5785e0475fd1e2f47db1ccf8f5be4  powerpc/mm: Remove unneeded #ifdef CONFIG_PPC_MEM_KEYS

elapsed time: 1276m

configs tested: 135
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
riscv                            allyesconfig
powerpc                    ge_imp3a_defconfig
powerpc                     skiroot_defconfig
powerpc                     ksi8560_defconfig
sh                           se7721_defconfig
h8300                     edosk2674_defconfig
powerpc                     redwood_defconfig
mips                        qi_lb60_defconfig
powerpc                     taishan_defconfig
mips                            gpr_defconfig
arm                         bcm2835_defconfig
sh                          rsk7269_defconfig
sh                           se7751_defconfig
parisc                generic-64bit_defconfig
powerpc                 mpc85xx_cds_defconfig
arm                              alldefconfig
powerpc                      ppc40x_defconfig
sh                        edosk7705_defconfig
mips                         rt305x_defconfig
arm                         cm_x300_defconfig
sh                                  defconfig
powerpc                 mpc834x_itx_defconfig
mips                     loongson1c_defconfig
sh                        sh7785lcr_defconfig
sh                          sdk7786_defconfig
mips                         mpc30x_defconfig
powerpc                 mpc836x_mds_defconfig
arm                          moxart_defconfig
powerpc                         wii_defconfig
mips                           ip32_defconfig
ia64                         bigsur_defconfig
arm                        multi_v7_defconfig
powerpc                      pcm030_defconfig
arm                     eseries_pxa_defconfig
powerpc                   lite5200b_defconfig
powerpc                     ppa8548_defconfig
powerpc                    sam440ep_defconfig
powerpc                 mpc8560_ads_defconfig
arm                          ixp4xx_defconfig
mips                        vocore2_defconfig
powerpc                     mpc5200_defconfig
powerpc                   motionpro_defconfig
nios2                            alldefconfig
mips                           ip27_defconfig
arm                         palmz72_defconfig
nios2                         3c120_defconfig
mips                            ar7_defconfig
mips                        maltaup_defconfig
arm                           stm32_defconfig
mips                          ath25_defconfig
powerpc64                        alldefconfig
powerpc                    adder875_defconfig
powerpc                      cm5200_defconfig
powerpc                  storcenter_defconfig
sh                   sh7770_generic_defconfig
mips                    maltaup_xpa_defconfig
arc                         haps_hs_defconfig
arm                     am200epdkit_defconfig
arm                         vf610m4_defconfig
xtensa                           alldefconfig
arm                          collie_defconfig
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
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210317
i386                 randconfig-a005-20210317
i386                 randconfig-a002-20210317
i386                 randconfig-a003-20210317
i386                 randconfig-a004-20210317
i386                 randconfig-a006-20210317
x86_64               randconfig-a006-20210317
x86_64               randconfig-a001-20210317
x86_64               randconfig-a005-20210317
x86_64               randconfig-a004-20210317
x86_64               randconfig-a003-20210317
x86_64               randconfig-a002-20210317
i386                 randconfig-a013-20210317
i386                 randconfig-a016-20210317
i386                 randconfig-a011-20210317
i386                 randconfig-a012-20210317
i386                 randconfig-a015-20210317
i386                 randconfig-a014-20210317
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a011-20210317
x86_64               randconfig-a016-20210317
x86_64               randconfig-a013-20210317
x86_64               randconfig-a014-20210317
x86_64               randconfig-a015-20210317
x86_64               randconfig-a012-20210317

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
