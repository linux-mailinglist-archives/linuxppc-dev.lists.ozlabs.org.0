Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A14632907FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 17:11:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCV3t61zkzDqnV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 02:11:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCV1m02CgzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 02:09:28 +1100 (AEDT)
IronPort-SDR: RGnJyY+As5ky/oXIcTUJ2eY5nfYwli3TMmpmxOGZtesskluEvn+WPfn0O3vEnUWvHujGvaIpP8
 QH0WjYVcL5cQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9776"; a="166732784"
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="166732784"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 08:09:25 -0700
IronPort-SDR: eHWtrh1xihyaSy3CORTmS+2CI33roHQGlQmZI8VhUVpuxnvLzDLkQiTH01ONDHkGBq0c5wxKDs
 J3FXhqm05HVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,383,1596524400"; d="scan'208";a="464707291"
Received: from lkp-server02.sh.intel.com (HELO 262a2cdd3070) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 16 Oct 2020 08:09:23 -0700
Received: from kbuild by 262a2cdd3070 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kTRMB-00003J-2i; Fri, 16 Oct 2020 15:09:23 +0000
Date: Fri, 16 Oct 2020 23:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 4fa6f5d55f64e974784cfc8f38312d48479a4323
Message-ID: <5f89b781.xq5qbE8tSL19NS2s%lkp@intel.com>
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
branch HEAD: 4fa6f5d55f64e974784cfc8f38312d48479a4323  Automatic merge of 'next' into merge (2020-10-15 22:13)

elapsed time: 1664m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                         cm_x300_defconfig
arm                              zx_defconfig
powerpc                 mpc8560_ads_defconfig
mips                        jmr3927_defconfig
powerpc                     tqm8555_defconfig
arm                              alldefconfig
powerpc                         ps3_defconfig
xtensa                generic_kc705_defconfig
powerpc                      katmai_defconfig
sparc                       sparc32_defconfig
sh                           se7780_defconfig
arm                  colibri_pxa300_defconfig
arm                            xcep_defconfig
powerpc                       eiger_defconfig
mips                           ip32_defconfig
powerpc                   motionpro_defconfig
mips                          malta_defconfig
arm                         lpc32xx_defconfig
arm                          simpad_defconfig
arm                         at91_dt_defconfig
arm                            lart_defconfig
parisc                generic-64bit_defconfig
x86_64                           alldefconfig
riscv                               defconfig
riscv                    nommu_k210_defconfig
mips                           ip28_defconfig
i386                             alldefconfig
arc                        vdk_hs38_defconfig
powerpc                      pmac32_defconfig
mips                         tb0287_defconfig
powerpc                      mgcoge_defconfig
arm                      tct_hammer_defconfig
arm                        vexpress_defconfig
powerpc                     tqm8540_defconfig
arm                         nhk8815_defconfig
sh                         ap325rxa_defconfig
powerpc                      ppc64e_defconfig
mips                          ath79_defconfig
arm                      jornada720_defconfig
arm                       aspeed_g5_defconfig
arm                        mvebu_v5_defconfig
powerpc                     stx_gp3_defconfig
s390                       zfcpdump_defconfig
sh                           se7705_defconfig
powerpc               mpc834x_itxgp_defconfig
arm                          ep93xx_defconfig
arm                        spear3xx_defconfig
powerpc                  mpc885_ads_defconfig
sh                          polaris_defconfig
powerpc                     powernv_defconfig
sh                ecovec24-romimage_defconfig
powerpc                      ppc6xx_defconfig
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
powerpc                           allnoconfig
i386                 randconfig-a005-20201014
i386                 randconfig-a006-20201014
i386                 randconfig-a001-20201014
i386                 randconfig-a003-20201014
i386                 randconfig-a004-20201014
i386                 randconfig-a002-20201014
i386                 randconfig-a005-20201016
i386                 randconfig-a006-20201016
i386                 randconfig-a001-20201016
i386                 randconfig-a003-20201016
i386                 randconfig-a004-20201016
i386                 randconfig-a002-20201016
x86_64               randconfig-a016-20201014
x86_64               randconfig-a012-20201014
x86_64               randconfig-a015-20201014
x86_64               randconfig-a013-20201014
x86_64               randconfig-a014-20201014
x86_64               randconfig-a011-20201014
i386                 randconfig-a016-20201014
i386                 randconfig-a013-20201014
i386                 randconfig-a015-20201014
i386                 randconfig-a011-20201014
i386                 randconfig-a012-20201014
i386                 randconfig-a014-20201014
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201014
x86_64               randconfig-a002-20201014
x86_64               randconfig-a006-20201014
x86_64               randconfig-a001-20201014
x86_64               randconfig-a005-20201014
x86_64               randconfig-a003-20201014

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
