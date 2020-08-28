Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8182255F3C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 18:56:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdQjJ0yr9zDqsC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 02:56:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdQgB2rvszDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Aug 2020 02:54:27 +1000 (AEST)
IronPort-SDR: QIQTjYf78zP36htmO0a5e4cA/WSIDKpsA62+MvAO0zHXqeRsdEQhshHYnGUSnTFJnc7l2jD08q
 OEXdbVJWnbtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="155962424"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="155962424"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 09:54:24 -0700
IronPort-SDR: uepu/5YFFg77jaYq3Gb19NG02IeSSIK+neousXjMOEwxGpMdDVSPdW+q/6RCJktGeO7M+nXnla
 L1ruF+POBcsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="403803537"
Received: from lkp-server02.sh.intel.com (HELO 301dc1beeb51) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 28 Aug 2020 09:54:23 -0700
Received: from kbuild by 301dc1beeb51 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kBhdu-00006C-NS; Fri, 28 Aug 2020 16:54:22 +0000
Date: Sat, 29 Aug 2020 00:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS WITH WARNING
 dd419a93bd9954cfdd333f8387a9a0d22218720d
Message-ID: <5f4936aa.CVs0dC6iwZXk0WPy%lkp@intel.com>
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
branch HEAD: dd419a93bd9954cfdd333f8387a9a0d22218720d  powerpc: Update documentation of ISA versions for Power10

Warning in current branch:

/usr/bin/powerpc64-linux-gnu-ld: warning: discarding dynamic section .rela.opd

Warning ids grouped by kconfigs:

clang_recent_errors
`-- powerpc64-randconfig-r025-20200827
    `-- usr-bin-powerpc64-linux-gnu-ld:warning:discarding-dynamic-section-.rela.opd

elapsed time: 869m

configs tested: 129
configs skipped: 12

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                       m5208evb_defconfig
m68k                        mvme147_defconfig
openrisc                    or1ksim_defconfig
arm                         cm_x300_defconfig
arc                        nsim_700_defconfig
sh                           se7206_defconfig
s390                             alldefconfig
mips                         rt305x_defconfig
i386                             allyesconfig
powerpc                     ep8248e_defconfig
powerpc                     pseries_defconfig
arm                        keystone_defconfig
sh                           se7722_defconfig
parisc                generic-64bit_defconfig
mips                           rs90_defconfig
m68k                       bvme6000_defconfig
mips                        bcm47xx_defconfig
c6x                        evmc6474_defconfig
microblaze                    nommu_defconfig
arm                            qcom_defconfig
mips                  maltasmvp_eva_defconfig
nios2                            allyesconfig
powerpc                           allnoconfig
powerpc                          alldefconfig
arc                           tb10x_defconfig
m68k                           sun3_defconfig
sh                           se7721_defconfig
sh                           se7780_defconfig
arm                           efm32_defconfig
powerpc                    adder875_defconfig
arm                        mvebu_v7_defconfig
arm                         lpc18xx_defconfig
mips                        jmr3927_defconfig
arm                          exynos_defconfig
arm                          pxa910_defconfig
arm                          lpd270_defconfig
sh                           se7724_defconfig
mips                         db1xxx_defconfig
mips                        maltaup_defconfig
arm                        realview_defconfig
h8300                               defconfig
mips                malta_kvm_guest_defconfig
mips                  cavium_octeon_defconfig
arc                             nps_defconfig
arm                       spear13xx_defconfig
s390                          debug_defconfig
alpha                            alldefconfig
arm                           sama5_defconfig
arm                            mmp2_defconfig
h8300                            allyesconfig
mips                          rb532_defconfig
sh                          lboxre2_defconfig
s390                       zfcpdump_defconfig
sh                             sh03_defconfig
powerpc                    gamecube_defconfig
sh                        sh7785lcr_defconfig
arm                        oxnas_v6_defconfig
arm                         bcm2835_defconfig
mips                     loongson1b_defconfig
mips                            ar7_defconfig
arc                            hsdk_defconfig
alpha                               defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
csky                                defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a003-20200827
x86_64               randconfig-a002-20200827
x86_64               randconfig-a001-20200827
x86_64               randconfig-a005-20200827
x86_64               randconfig-a006-20200827
x86_64               randconfig-a004-20200827
i386                 randconfig-a002-20200828
i386                 randconfig-a005-20200828
i386                 randconfig-a003-20200828
i386                 randconfig-a004-20200828
i386                 randconfig-a001-20200828
i386                 randconfig-a006-20200828
x86_64               randconfig-a015-20200828
x86_64               randconfig-a012-20200828
x86_64               randconfig-a014-20200828
x86_64               randconfig-a011-20200828
x86_64               randconfig-a013-20200828
x86_64               randconfig-a016-20200828
i386                 randconfig-a013-20200828
i386                 randconfig-a012-20200828
i386                 randconfig-a011-20200828
i386                 randconfig-a016-20200828
i386                 randconfig-a014-20200828
i386                 randconfig-a015-20200828
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
