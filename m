Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5BE63FD88
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 02:14:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNZjS1hksz3c7B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 12:14:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jv4W3muL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jv4W3muL;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNZgW0T0lz3bNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 12:12:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669943575; x=1701479575;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=H9wOlfyjLlsVEegngW8OOmnU3mLFvp3Rjbm0JwD2ntc=;
  b=jv4W3muL0qW5m21/+fjIe/5L94s7eZR8Km3tADBKGpk/m+zH5rqneo0C
   vepXZ/uGyVFVX6Ukx1vPU6KmBJLkdOoPnzdsqnzozSBFqhsGwx9fpd4Rm
   yfKEk6BdRipmAkvRPLbfcDUqhadvUrIXx2m1SMRDiPVW1j64TiBDbvPae
   kJgc83wuSFNfRxqfvq1MsOAAdl1vi56TiNdTvP42T+XnhIh+zDPpz3+t5
   wDeEjqUa9R8ZSxZQtURBZkKiWE+uOazkXg+044qMcGUpc6cIODOHFsZzB
   pDtSgbnXYJAxoNLVU/URou3UNpDUt6KBxO2n/7n1gkKG9tkldWF0Oc4JJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="296194903"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="296194903"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2022 17:12:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="751052542"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="751052542"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2022 17:12:49 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p0ubg-000D5v-2k;
	Fri, 02 Dec 2022 01:12:48 +0000
Date: Fri, 02 Dec 2022 09:12:28 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/ppc-kvm] BUILD SUCCESS
 6c645b01e536757a9e1a9f72c13767f9b3f8559f
Message-ID: <638950fc.mnzSiI5DEQNmffJX%lkp@intel.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
branch HEAD: 6c645b01e536757a9e1a9f72c13767f9b3f8559f  KVM: PPC: Book3E: Fix CONFIG_TRACE_IRQFLAGS support

elapsed time: 2230m

configs tested: 156
configs skipped: 145

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
ia64                             allmodconfig
i386                 randconfig-a001-20221128
i386                 randconfig-a005-20221128
i386                 randconfig-a006-20221128
i386                 randconfig-a004-20221128
i386                 randconfig-a003-20221128
i386                 randconfig-a002-20221128
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                            allnoconfig
x86_64               randconfig-a002-20221128
x86_64               randconfig-a001-20221128
x86_64               randconfig-a004-20221128
x86_64               randconfig-a006-20221128
x86_64               randconfig-a005-20221128
x86_64               randconfig-a003-20221128
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
arm                           u8500_defconfig
sh                           se7780_defconfig
openrisc                       virt_defconfig
arm                     eseries_pxa_defconfig
arm                           sunxi_defconfig
powerpc                         ps3_defconfig
mips                    maltaup_xpa_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
i386                          randconfig-c001
arc                  randconfig-r043-20221201
riscv                randconfig-r042-20221201
s390                 randconfig-r044-20221201
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
microblaze                          defconfig
arm                          iop32x_defconfig
arm                            pleb_defconfig
sh                          sdk7780_defconfig
sh                   secureedge5410_defconfig
sparc                       sparc32_defconfig
arm                          badge4_defconfig
arm                        oxnas_v6_defconfig
arc                        nsim_700_defconfig
arm                           h3600_defconfig
m68k                          hp300_defconfig
sh                          r7785rp_defconfig
powerpc                 mpc837x_rdb_defconfig
xtensa                       common_defconfig
powerpc                    adder875_defconfig
arc                              alldefconfig
microblaze                      mmu_defconfig
powerpc                     tqm8555_defconfig
sparc                       sparc64_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                           viper_defconfig
arm                            mps2_defconfig
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
alpha                             allnoconfig
sh                 kfr2r09-romimage_defconfig
powerpc                       holly_defconfig
powerpc                     ep8248e_defconfig
xtensa                  cadence_csp_defconfig
powerpc                 canyonlands_defconfig
mips                           ci20_defconfig
parisc                generic-64bit_defconfig
sparc                             allnoconfig
sh                          rsk7203_defconfig
arm                         assabet_defconfig
arc                      axs103_smp_defconfig
powerpc                    klondike_defconfig
csky                                defconfig
powerpc                      arches_defconfig
arm                             ezx_defconfig
arm                  randconfig-c002-20221201
x86_64                        randconfig-c001

clang tested configs:
s390                 randconfig-r044-20221128
hexagon              randconfig-r041-20221128
riscv                randconfig-r042-20221128
hexagon              randconfig-r045-20221128
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                 randconfig-a014-20221128
i386                 randconfig-a011-20221128
i386                 randconfig-a013-20221128
i386                 randconfig-a016-20221128
i386                 randconfig-a012-20221128
i386                 randconfig-a015-20221128
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
hexagon              randconfig-r041-20221130
hexagon              randconfig-r045-20221130
powerpc                      ppc64e_defconfig
x86_64               randconfig-a011-20221128
x86_64               randconfig-a014-20221128
x86_64               randconfig-a012-20221128
x86_64               randconfig-a013-20221128
x86_64               randconfig-a016-20221128
x86_64               randconfig-a015-20221128
powerpc                 xes_mpc85xx_defconfig
mips                       rbtx49xx_defconfig
powerpc                   lite5200b_defconfig
mips                           rs90_defconfig
mips                      bmips_stb_defconfig
x86_64                        randconfig-k001
arm                  colibri_pxa300_defconfig
powerpc                 mpc836x_rdk_defconfig
powerpc                          g5_defconfig
mips                        maltaup_defconfig
powerpc                      acadia_defconfig
x86_64                           allyesconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
