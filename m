Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51B2C493D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 21:48:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChCdR0TwlzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 07:47:55 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChCZv3ZdjzDr1N
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 07:45:38 +1100 (AEDT)
IronPort-SDR: eWKcZckGU/rSbeReXCgzl3IvtH+xshjJJGNgo9vRJsyMSa1TvG1T461Eo5zsRYJh+BsVmShZeD
 kKckadUOW6hQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="172355284"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="172355284"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 12:45:34 -0800
IronPort-SDR: laVzEyH6mDNRsRG2o0itqQMlYjJoIdAoC8GU/hNoC7aRyoPnaVTavOj3WZsLDp2atE7SD89udz
 YYEeYpOcQSeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="333137030"
Received: from lkp-server01.sh.intel.com (HELO f59a693d3a73) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 25 Nov 2020 12:45:33 -0800
Received: from kbuild by f59a693d3a73 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ki1fQ-0000Fz-N8; Wed, 25 Nov 2020 20:45:32 +0000
Date: Thu, 26 Nov 2020 04:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 4c202167192a77481310a3cacae9f12618b92216
Message-ID: <5fbec266.dGfCubBa1C614dyP%lkp@intel.com>
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
branch HEAD: 4c202167192a77481310a3cacae9f12618b92216  Automatic merge of 'next' into merge (2020-11-25 15:11)

elapsed time: 960m

configs tested: 130
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     ep8248e_defconfig
powerpc                     sequoia_defconfig
arm                        oxnas_v6_defconfig
arm                           corgi_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                               allmodconfig
powerpc                   lite5200b_defconfig
ia64                          tiger_defconfig
sh                           se7722_defconfig
arm                      tct_hammer_defconfig
sh                           se7721_defconfig
arm                         nhk8815_defconfig
mips                      maltaaprp_defconfig
mips                            ar7_defconfig
sh                            titan_defconfig
powerpc                     mpc83xx_defconfig
powerpc                          allmodconfig
m68k                        stmark2_defconfig
powerpc                  mpc866_ads_defconfig
m68k                         apollo_defconfig
powerpc64                           defconfig
sh                         apsh4a3a_defconfig
powerpc                     mpc512x_defconfig
s390                                defconfig
sh                          rsk7264_defconfig
arm                        vexpress_defconfig
mips                          ath25_defconfig
powerpc                 canyonlands_defconfig
arm                            pleb_defconfig
x86_64                           alldefconfig
arm                        neponset_defconfig
sh                            migor_defconfig
sh                          rsk7203_defconfig
arm                        mvebu_v7_defconfig
mips                 decstation_r4k_defconfig
parisc                           alldefconfig
mips                          rm200_defconfig
sh                   sh7770_generic_defconfig
powerpc                    gamecube_defconfig
arm                        trizeps4_defconfig
powerpc                 mpc836x_mds_defconfig
mips                  cavium_octeon_defconfig
sh                 kfr2r09-romimage_defconfig
arm                         mv78xx0_defconfig
mips                      maltasmvp_defconfig
m68k                                defconfig
sh                        sh7763rdp_defconfig
sparc                            alldefconfig
arm                        magician_defconfig
powerpc                     tqm8548_defconfig
sh                        sh7785lcr_defconfig
powerpc                 mpc8313_rdb_defconfig
xtensa                           alldefconfig
arm                          lpd270_defconfig
powerpc                     ppa8548_defconfig
arm                             pxa_defconfig
mips                      malta_kvm_defconfig
riscv                            alldefconfig
c6x                        evmc6474_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
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
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201125
i386                 randconfig-a003-20201125
i386                 randconfig-a002-20201125
i386                 randconfig-a005-20201125
i386                 randconfig-a001-20201125
i386                 randconfig-a006-20201125
x86_64               randconfig-a015-20201125
x86_64               randconfig-a011-20201125
x86_64               randconfig-a014-20201125
x86_64               randconfig-a016-20201125
x86_64               randconfig-a012-20201125
x86_64               randconfig-a013-20201125
i386                 randconfig-a012-20201125
i386                 randconfig-a013-20201125
i386                 randconfig-a011-20201125
i386                 randconfig-a016-20201125
i386                 randconfig-a014-20201125
i386                 randconfig-a015-20201125
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
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20201125
x86_64               randconfig-a003-20201125
x86_64               randconfig-a004-20201125
x86_64               randconfig-a005-20201125
x86_64               randconfig-a002-20201125
x86_64               randconfig-a001-20201125

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
