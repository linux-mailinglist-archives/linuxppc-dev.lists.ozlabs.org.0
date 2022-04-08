Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F664F8D37
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 07:05:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZR5855bHz2ypP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 15:05:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l6jeeE4n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l6jeeE4n; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZR4T10h4z2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 15:04:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649394265; x=1680930265;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=I3Klp/0Gl/mPN8cD2UsmJAOvtycAWwFfnwEuNuL4JvQ=;
 b=l6jeeE4nDMf5Th3JRdSNaf2B6MRCFuaIpTrMUSBS0HtBcPFN5DA8W2/s
 qiCG1LyPnHlvQHVDZ0xkue1scnzNKHGLFS7Hcd5fhy75YbG9dZAcP+5Vr
 KnfZ2kx5GLrZG82PTtFS+1D8S8qQnrMiQB1KAVBwbcTWO6TdOr1oLEqCN
 4OITvXbLXXTrISJmdYi2WmKU5bovNEuCOzuZHRFY9AUk/hNpyofHOEaHc
 rJsL2wz3L0QL4vvJ8Z1w7tonLXqNZUY2Bb9HU+Ra6ov2OIdiVZV85BgOa
 pM6OLsHeTLwKdca37Fr/5BT91w3ibRzBvLQELGSzObNKz3AFOeZS/QPBw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261203335"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="261203335"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 22:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="698057439"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2022 22:03:20 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ncgmG-00063V-09;
 Fri, 08 Apr 2022 05:03:20 +0000
Date: Fri, 08 Apr 2022 13:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 5ecbf98cd2868fdb248164d9bd701559b2270e6c
Message-ID: <624fc206.4XIQcRkCyhrnOg1W%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 5ecbf98cd2868fdb248164d9bd701559b2270e6c  powerpc: Mark arch_get_ima_policy() and is_ppc_trustedboot_enabled() as __init

elapsed time: 731m

configs tested: 188
configs skipped: 93

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
xtensa                  nommu_kc705_defconfig
powerpc                 linkstation_defconfig
powerpc                     mpc83xx_defconfig
riscv                    nommu_k210_defconfig
arm                           h5000_defconfig
sh                         apsh4a3a_defconfig
arm                        shmobile_defconfig
sh                          rsk7201_defconfig
powerpc                     asp8347_defconfig
arm                      integrator_defconfig
powerpc                     taishan_defconfig
sh                          polaris_defconfig
powerpc                      bamboo_defconfig
sh                           se7722_defconfig
arm                          iop32x_defconfig
arc                            hsdk_defconfig
powerpc                      ep88xc_defconfig
powerpc                      ppc6xx_defconfig
sh                           se7780_defconfig
sparc64                          alldefconfig
mips                     decstation_defconfig
arm                            hisi_defconfig
arm                         lubbock_defconfig
sh                              ul2_defconfig
arm                        cerfcube_defconfig
ia64                      gensparse_defconfig
arm                     eseries_pxa_defconfig
arc                                 defconfig
powerpc                    sam440ep_defconfig
arm                          pxa910_defconfig
arm                          gemini_defconfig
sh                     sh7710voipgw_defconfig
openrisc                    or1ksim_defconfig
arm                       imx_v6_v7_defconfig
m68k                        mvme16x_defconfig
sh                        sh7757lcr_defconfig
ia64                          tiger_defconfig
sparc64                             defconfig
arm                             ezx_defconfig
powerpc                 mpc834x_itx_defconfig
arm                        clps711x_defconfig
sh                   sh7770_generic_defconfig
ia64                            zx1_defconfig
powerpc                      mgcoge_defconfig
powerpc                      tqm8xx_defconfig
arc                    vdk_hs38_smp_defconfig
arm                          lpd270_defconfig
sh                ecovec24-romimage_defconfig
mips                     loongson1b_defconfig
sh                   secureedge5410_defconfig
sh                   rts7751r2dplus_defconfig
arm                             pxa_defconfig
sparc                               defconfig
powerpc                      pcm030_defconfig
powerpc64                           defconfig
powerpc                       ppc64_defconfig
ia64                        generic_defconfig
arm                       multi_v4t_defconfig
arc                        vdk_hs38_defconfig
riscv                               defconfig
powerpc                     stx_gp3_defconfig
ia64                         bigsur_defconfig
mips                            ar7_defconfig
xtensa                          iss_defconfig
powerpc                         ps3_defconfig
sh                               allmodconfig
arm                        multi_v7_defconfig
m68k                          multi_defconfig
xtensa                           alldefconfig
sh                          sdk7780_defconfig
i386                             alldefconfig
mips                        vocore2_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220408
arm                  randconfig-c002-20220406
arm                  randconfig-c002-20220407
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
s390                                defconfig
s390                             allmodconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220406
arc                  randconfig-r043-20220407
arc                  randconfig-r043-20220408
s390                 randconfig-r044-20220408
s390                 randconfig-r044-20220406
riscv                randconfig-r042-20220406
riscv                randconfig-r042-20220408
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3

clang tested configs:
x86_64                        randconfig-c007
i386                          randconfig-c001
powerpc              randconfig-c003-20220408
riscv                randconfig-c006-20220408
mips                 randconfig-c004-20220408
arm                  randconfig-c002-20220408
s390                 randconfig-c005-20220406
s390                 randconfig-c005-20220407
powerpc              randconfig-c003-20220407
powerpc              randconfig-c003-20220406
riscv                randconfig-c006-20220407
riscv                randconfig-c006-20220406
mips                 randconfig-c004-20220407
mips                 randconfig-c004-20220406
arm                  randconfig-c002-20220406
arm                  randconfig-c002-20220407
powerpc                      pasemi_defconfig
arm                            mps2_defconfig
arm                       aspeed_g4_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc8313_rdb_defconfig
arm                              alldefconfig
powerpc                 mpc8272_ads_defconfig
powerpc                   bluestone_defconfig
mips                        qi_lb60_defconfig
mips                           ip28_defconfig
powerpc                     skiroot_defconfig
arm                        magician_defconfig
powerpc                       ebony_defconfig
powerpc                   microwatt_defconfig
powerpc                    socrates_defconfig
powerpc                 mpc832x_rdb_defconfig
arm                  colibri_pxa270_defconfig
arm                             mxs_defconfig
arm                            dove_defconfig
arm                          pcm027_defconfig
riscv                             allnoconfig
arm                          collie_defconfig
arm                       mainstone_defconfig
riscv                            alldefconfig
powerpc                     powernv_defconfig
mips                           rs90_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
