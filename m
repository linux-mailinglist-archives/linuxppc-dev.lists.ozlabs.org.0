Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C9263979
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 03:14:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn1Bw56BJzDqLj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 11:14:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn19K2cc6zDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 11:13:21 +1000 (AEST)
IronPort-SDR: wMYclO/VlMWJN2VTNIwgFGgjRT70+WetxA/zRpPjN4Fbocdu1KIZdvGrGpP6EaS9O5/TJdusak
 RuwJuBAeTWDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="176513164"
X-IronPort-AV: E=Sophos;i="5.76,411,1592895600"; d="scan'208";a="176513164"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 18:13:17 -0700
IronPort-SDR: Y7/QEnxt3Q2iBuJwRNxIfuZGLdRP8u2kpchZFwMAZ61zpTy8naMcl3uUcFciSj8WT+2aKOLzBl
 7ojB/B/kzEug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,411,1592895600"; d="scan'208";a="449408825"
Received: from lkp-server01.sh.intel.com (HELO 12ff3cf3f2e9) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 09 Sep 2020 18:13:16 -0700
Received: from kbuild by 12ff3cf3f2e9 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kGB9H-0000fE-GJ; Thu, 10 Sep 2020 01:13:15 +0000
Date: Thu, 10 Sep 2020 09:12:39 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 0460534b532e5518c657c7d6492b9337d975eaa3
Message-ID: <5f597d87.uPMi574R05d1eSIh%lkp@intel.com>
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
branch HEAD: 0460534b532e5518c657c7d6492b9337d975eaa3  powerpc/papr_scm: Limit the readability of 'perf_stats' sysfs attribute

elapsed time: 721m

configs tested: 159
configs skipped: 22

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                malta_kvm_guest_defconfig
mips                         db1xxx_defconfig
mips                          rm200_defconfig
arm                        vexpress_defconfig
mips                         tb0226_defconfig
mips                      maltasmvp_defconfig
h8300                       h8s-sim_defconfig
mips                      fuloong2e_defconfig
sh                         apsh4a3a_defconfig
arm                      footbridge_defconfig
sh                         ecovec24_defconfig
sh                            shmin_defconfig
powerpc                        cell_defconfig
powerpc                     powernv_defconfig
powerpc                      mgcoge_defconfig
arm                        neponset_defconfig
m68k                        stmark2_defconfig
arm                       mainstone_defconfig
mips                           mtx1_defconfig
sh                          r7785rp_defconfig
arc                           tb10x_defconfig
arm                        spear3xx_defconfig
i386                             allyesconfig
arm                           sama5_defconfig
arm                       netwinder_defconfig
microblaze                      mmu_defconfig
sh                           se7721_defconfig
arm                       imx_v4_v5_defconfig
mips                       lemote2f_defconfig
arc                              allyesconfig
h8300                               defconfig
mips                      loongson3_defconfig
sh                           se7750_defconfig
xtensa                    xip_kc705_defconfig
m68k                       bvme6000_defconfig
arm                         lpc18xx_defconfig
mips                           jazz_defconfig
m68k                       m5249evb_defconfig
parisc                generic-32bit_defconfig
arm                         assabet_defconfig
arm                            dove_defconfig
mips                         bigsur_defconfig
mips                     cu1000-neo_defconfig
arm                          pxa910_defconfig
openrisc                         alldefconfig
c6x                         dsk6455_defconfig
mips                 decstation_r4k_defconfig
mips                  maltasmvp_eva_defconfig
sh                            titan_defconfig
mips                        vocore2_defconfig
arm                         cm_x300_defconfig
sh                ecovec24-romimage_defconfig
csky                                defconfig
i386                                defconfig
arm                    vt8500_v6_v7_defconfig
arm                  colibri_pxa300_defconfig
xtensa                generic_kc705_defconfig
arm                         s3c2410_defconfig
um                            kunit_defconfig
sh                          polaris_defconfig
m68k                        mvme16x_defconfig
c6x                              allyesconfig
openrisc                 simple_smp_defconfig
arm                        shmobile_defconfig
arm64                            alldefconfig
mips                           rs90_defconfig
mips                          ath25_defconfig
arm                        clps711x_defconfig
arc                        vdk_hs38_defconfig
sh                               alldefconfig
powerpc                     ep8248e_defconfig
sh                              ul2_defconfig
m68k                          multi_defconfig
arm                         nhk8815_defconfig
alpha                               defconfig
sh                          landisk_defconfig
arc                     haps_hs_smp_defconfig
arm                           tegra_defconfig
powerpc                      chrp32_defconfig
arm                           corgi_defconfig
sh                           se7780_defconfig
x86_64                           alldefconfig
arc                        nsim_700_defconfig
arm                        multi_v7_defconfig
arm                      jornada720_defconfig
sh                           se7206_defconfig
mips                          rb532_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
nios2                               defconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20200909
x86_64               randconfig-a006-20200909
x86_64               randconfig-a003-20200909
x86_64               randconfig-a001-20200909
x86_64               randconfig-a005-20200909
x86_64               randconfig-a002-20200909
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
i386                 randconfig-a016-20200909
i386                 randconfig-a015-20200909
i386                 randconfig-a011-20200909
i386                 randconfig-a013-20200909
i386                 randconfig-a014-20200909
i386                 randconfig-a012-20200909
x86_64               randconfig-a004-20200910
x86_64               randconfig-a006-20200910
x86_64               randconfig-a003-20200910
x86_64               randconfig-a002-20200910
x86_64               randconfig-a005-20200910
x86_64               randconfig-a001-20200910
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a013-20200909
x86_64               randconfig-a016-20200909
x86_64               randconfig-a011-20200909
x86_64               randconfig-a012-20200909
x86_64               randconfig-a015-20200909
x86_64               randconfig-a014-20200909

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
