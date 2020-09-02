Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E1025A423
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 05:47:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh8z66z8PzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 13:47:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh8x32rm4zDqTV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 13:45:58 +1000 (AEST)
IronPort-SDR: /vHK0b3XjHfEWbbWaHY9sKFEkt/8Wn1ojk2MiMRdrV9gMMv+pz4wD2oam7FuDj9C7Am19KiY08
 lKAeoJlAqB4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="158310597"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="158310597"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 20:45:56 -0700
IronPort-SDR: 4owbSGthcgtNIiZQi1Tt9RDOPONnw0FT+Zr9Ru/lQiiBfzewjpPGhHik/xWd23vNhLN7NxeneR
 Ctp9jOz8li6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="338776734"
Received: from lkp-server02.sh.intel.com (HELO 500e1ab2883a) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Sep 2020 20:45:54 -0700
Received: from kbuild by 500e1ab2883a with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kDJic-00001Q-6o; Wed, 02 Sep 2020 03:45:54 +0000
Date: Wed, 02 Sep 2020 11:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 35f066fda170dde0a31f1447547a5d30b83c3920
Message-ID: <5f4f1544.jEjj5P8OfSz5CeLe%lkp@intel.com>
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
branch HEAD: 35f066fda170dde0a31f1447547a5d30b83c3920  Automatic merge of 'master', 'next' and 'fixes' (2020-09-01 14:36)

elapsed time: 809m

configs tested: 147
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
sh                           se7206_defconfig
mips                 pnx8335_stb225_defconfig
arm                            mmp2_defconfig
sh                           sh2007_defconfig
sh                        edosk7705_defconfig
mips                      bmips_stb_defconfig
sh                             espt_defconfig
mips                           rs90_defconfig
c6x                        evmc6474_defconfig
powerpc                           allnoconfig
arm                         shannon_defconfig
arm                     eseries_pxa_defconfig
arm                      footbridge_defconfig
riscv                             allnoconfig
sh                            migor_defconfig
powerpc                      pasemi_defconfig
sh                ecovec24-romimage_defconfig
arm                        mvebu_v5_defconfig
mips                      maltasmvp_defconfig
s390                       zfcpdump_defconfig
arm                             pxa_defconfig
arm                          gemini_defconfig
microblaze                    nommu_defconfig
h8300                       h8s-sim_defconfig
powerpc                  storcenter_defconfig
arm                   milbeaut_m10v_defconfig
mips                            e55_defconfig
arm                        clps711x_defconfig
powerpc                    mvme5100_defconfig
sh                   sh7770_generic_defconfig
sh                           se7343_defconfig
arm                           efm32_defconfig
powerpc                             defconfig
arm                        shmobile_defconfig
sh                         microdev_defconfig
arm                             rpc_defconfig
powerpc                      ppc40x_defconfig
sh                          rsk7269_defconfig
ia64                                defconfig
sh                  sh7785lcr_32bit_defconfig
arm                            lart_defconfig
arm                      pxa255-idp_defconfig
arm                         mv78xx0_defconfig
arm                         s3c2410_defconfig
arm                              alldefconfig
riscv                    nommu_k210_defconfig
nios2                         3c120_defconfig
m68k                             alldefconfig
m68k                       m5475evb_defconfig
mips                         tb0287_defconfig
mips                     cu1000-neo_defconfig
mips                          malta_defconfig
powerpc                    gamecube_defconfig
mips                      malta_kvm_defconfig
m68k                       m5249evb_defconfig
x86_64                              defconfig
sh                          kfr2r09_defconfig
c6x                                 defconfig
arm                       aspeed_g5_defconfig
m68k                        stmark2_defconfig
xtensa                         virt_defconfig
mips                         tb0219_defconfig
arm                          moxart_defconfig
arm                        magician_defconfig
nds32                            alldefconfig
mips                    maltaup_xpa_defconfig
arm                            dove_defconfig
powerpc                     mpc512x_defconfig
arm                            qcom_defconfig
mips                          rm200_defconfig
arc                         haps_hs_defconfig
powerpc                      ppc64e_defconfig
arm                          ixp4xx_defconfig
mips                         cobalt_defconfig
powerpc                       maple_defconfig
arm                          simpad_defconfig
sh                          rsk7201_defconfig
arm                         nhk8815_defconfig
mips                         bigsur_defconfig
arm                        realview_defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
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
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20200901
x86_64               randconfig-a006-20200901
x86_64               randconfig-a003-20200901
x86_64               randconfig-a005-20200901
x86_64               randconfig-a001-20200901
x86_64               randconfig-a002-20200901
i386                 randconfig-a004-20200901
i386                 randconfig-a005-20200901
i386                 randconfig-a006-20200901
i386                 randconfig-a002-20200901
i386                 randconfig-a001-20200901
i386                 randconfig-a003-20200901
i386                 randconfig-a016-20200901
i386                 randconfig-a015-20200901
i386                 randconfig-a011-20200901
i386                 randconfig-a013-20200901
i386                 randconfig-a014-20200901
i386                 randconfig-a012-20200901
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20200901
x86_64               randconfig-a016-20200901
x86_64               randconfig-a011-20200901
x86_64               randconfig-a012-20200901
x86_64               randconfig-a015-20200901
x86_64               randconfig-a014-20200901

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
