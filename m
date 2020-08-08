Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A8F23F8A0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 21:44:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPCNr6NwjzDqgs
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Aug 2020 05:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPCM64tv2zDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Aug 2020 05:43:10 +1000 (AEST)
IronPort-SDR: Rz8u4muR/nl84cXb7RKF3WZX/AKULcpPApngV86Pw0hmRFig2BLoSYB5Y+5VEL/QIeNH7t0CI9
 Z/MRDohvfRmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9707"; a="214865617"
X-IronPort-AV: E=Sophos;i="5.75,450,1589266800"; d="scan'208";a="214865617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2020 12:43:07 -0700
IronPort-SDR: 53qyFMeKasjedcj1b/yO2IbdS9IpEt3jw97rhzW+k5EmI2bDhTOVPSPbgE57gFDAwBl147KsXe
 JZ+U6VGBm9HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,450,1589266800"; d="scan'208";a="493901552"
Received: from lkp-server02.sh.intel.com (HELO 65e25449d42f) ([10.239.97.151])
 by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2020 12:43:06 -0700
Received: from kbuild by 65e25449d42f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1k4UkD-0000Gz-Nz; Sat, 08 Aug 2020 19:43:05 +0000
Date: Sun, 09 Aug 2020 03:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 1f788123eabf933e828eab9cf8f018ae18faa38f
Message-ID: <5f2f0023.RpQ48VCpFYMRDu07%lkp@intel.com>
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
branch HEAD: 1f788123eabf933e828eab9cf8f018ae18faa38f  Automatic merge of 'master', 'next' and 'fixes' (2020-08-08 14:22)

elapsed time: 904m

configs tested: 87
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
ia64                                defconfig
m68k                          sun3x_defconfig
sh                   sh7770_generic_defconfig
c6x                              allyesconfig
powerpc                  mpc885_ads_defconfig
arm                       imx_v6_v7_defconfig
parisc                generic-32bit_defconfig
m68k                          hp300_defconfig
i386                             alldefconfig
mips                       capcella_defconfig
mips                        nlm_xlr_defconfig
arm                        spear3xx_defconfig
sh                   sh7724_generic_defconfig
ia64                          tiger_defconfig
arc                           tb10x_defconfig
mips                       rbtx49xx_defconfig
microblaze                    nommu_defconfig
arm                       omap2plus_defconfig
arm                          pxa3xx_defconfig
arc                     haps_hs_smp_defconfig
arm                             rpc_defconfig
arm                        mvebu_v7_defconfig
mips                      maltasmvp_defconfig
ia64                             allmodconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a006-20200808
x86_64               randconfig-a001-20200808
x86_64               randconfig-a002-20200808
x86_64               randconfig-a003-20200808
x86_64               randconfig-a005-20200808
x86_64               randconfig-a004-20200808
i386                 randconfig-a004-20200808
i386                 randconfig-a005-20200808
i386                 randconfig-a001-20200808
i386                 randconfig-a003-20200808
i386                 randconfig-a002-20200808
i386                 randconfig-a006-20200808
i386                 randconfig-a011-20200808
i386                 randconfig-a014-20200808
i386                 randconfig-a015-20200808
i386                 randconfig-a013-20200808
i386                 randconfig-a012-20200808
i386                 randconfig-a016-20200808
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
