Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BE4263980
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 03:21:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn1LB1b62zDqYj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 11:21:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn1JD49vRzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 11:19:23 +1000 (AEST)
IronPort-SDR: 980/V113NtyshHbziPP7dp1C6adGd4/wAvGl59LoQQi9ePfvauAVNQO4OgEbpW6Rfp5nqq0hIS
 cZn4cHug0L/g==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="138483505"
X-IronPort-AV: E=Sophos;i="5.76,411,1592895600"; d="scan'208";a="138483505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 18:19:21 -0700
IronPort-SDR: w0547qHTb4v1nj7OeD9AtsQv0GtO9e0amQobH3I2h+8DhffjB7RrqKhTpMgE8RKAxZxT37RgrO
 Dx+kHRGjPyhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,411,1592895600"; d="scan'208";a="329133195"
Received: from lkp-server01.sh.intel.com (HELO 12ff3cf3f2e9) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2020 18:19:20 -0700
Received: from kbuild by 12ff3cf3f2e9 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kGBF9-0000ff-VY; Thu, 10 Sep 2020 01:19:19 +0000
Date: Thu, 10 Sep 2020 09:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 a24f73a061494d718b254ec7814cd10010ac2ec3
Message-ID: <5f597efa.Cso+7X/7T7zKsgib%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git  next-test
branch HEAD: a24f73a061494d718b254ec7814cd10010ac2ec3  powerpc/watchpoint/selftests: Tests for kernel accessing user memory

elapsed time: 725m

configs tested: 152
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            zeus_defconfig
powerpc                 linkstation_defconfig
sparc64                             defconfig
h8300                       h8s-sim_defconfig
mips                      fuloong2e_defconfig
sh                         apsh4a3a_defconfig
arm                      footbridge_defconfig
sh                         ecovec24_defconfig
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
m68k                            q40_defconfig
x86_64                           alldefconfig
powerpc                     mpc83xx_defconfig
arm                  colibri_pxa270_defconfig
mips                        nlm_xlp_defconfig
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
arm                       multi_v4t_defconfig
c6x                              alldefconfig
arm                         nhk8815_defconfig
openrisc                         alldefconfig
c6x                         dsk6455_defconfig
mips                 decstation_r4k_defconfig
arc                          axs101_defconfig
mips                       bmips_be_defconfig
m68k                           sun3_defconfig
powerpc                     mpc512x_defconfig
sh                        sh7757lcr_defconfig
mips                  maltasmvp_eva_defconfig
sh                            titan_defconfig
arm                          pxa910_defconfig
mips                        vocore2_defconfig
mips                         rt305x_defconfig
arm                         bcm2835_defconfig
powerpc                    mvme5100_defconfig
mips                           ip32_defconfig
arm                         cm_x300_defconfig
sh                ecovec24-romimage_defconfig
csky                                defconfig
i386                                defconfig
sh                          polaris_defconfig
m68k                        mvme16x_defconfig
openrisc                 simple_smp_defconfig
arm                        shmobile_defconfig
arm64                            alldefconfig
mips                           rs90_defconfig
mips                          ath25_defconfig
arm                        clps711x_defconfig
arc                        vdk_hs38_defconfig
arm                         hackkit_defconfig
arm                          gemini_defconfig
sh                         microdev_defconfig
arm                          ixp4xx_defconfig
arm                          pxa3xx_defconfig
powerpc                    amigaone_defconfig
arm                            xcep_defconfig
riscv                            allmodconfig
arc                          axs103_defconfig
sh                              ul2_defconfig
powerpc                        cell_defconfig
m68k                          multi_defconfig
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
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
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
