Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1332957A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 02:02:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqJkK5jN8z3clY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 12:02:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqJk00FXxz3cH6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 12:01:37 +1100 (AEDT)
IronPort-SDR: OqzC19VusdbtOOv4gYsgF9NTemubGmV8qMCw0fDvE2jqz9gojvTbdMVgJaTpb9+6ZyidLRT+rL
 Btr72bYZxpgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="183246308"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="183246308"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 17:01:17 -0800
IronPort-SDR: KIyJNSVvL4q5u9fH8FVw1HgUrNLOZM4YGGSzvha8LyZzLdRAzYZ1oly6gPYyjSvMxU9Qbow63N
 eAOfXHitS4Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="366942142"
Received: from lkp-server01.sh.intel.com (HELO 16660e54978b) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 01 Mar 2021 17:01:16 -0800
Received: from kbuild by 16660e54978b with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lGtPX-0004qC-ED; Tue, 02 Mar 2021 01:01:15 +0000
Date: Tue, 02 Mar 2021 09:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 e3d773ddb5a1140780a15703b3e0e2618274cce9
Message-ID: <603d8e33.nXgq5BBHEYwbhRnj%lkp@intel.com>
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
branch HEAD: e3d773ddb5a1140780a15703b3e0e2618274cce9  powerpc/sstep: Fix VSX instruction emulation

elapsed time: 747m

configs tested: 131
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm64                            allyesconfig
arm64                               defconfig
mips                     cu1000-neo_defconfig
arm                            hisi_defconfig
sparc64                          alldefconfig
powerpc                     tqm8560_defconfig
powerpc                           allnoconfig
arm                         hackkit_defconfig
powerpc                      ep88xc_defconfig
mips                          malta_defconfig
h8300                               defconfig
powerpc                    ge_imp3a_defconfig
mips                      bmips_stb_defconfig
powerpc                      katmai_defconfig
arm                      pxa255-idp_defconfig
mips                        nlm_xlr_defconfig
powerpc                 linkstation_defconfig
m68k                        m5272c3_defconfig
sh                        sh7785lcr_defconfig
s390                       zfcpdump_defconfig
xtensa                    xip_kc705_defconfig
sparc                       sparc32_defconfig
nios2                         10m50_defconfig
powerpc                     ep8248e_defconfig
powerpc                     asp8347_defconfig
xtensa                  cadence_csp_defconfig
powerpc                       maple_defconfig
sh                               alldefconfig
sh                          kfr2r09_defconfig
powerpc               mpc834x_itxgp_defconfig
sh                          landisk_defconfig
mips                           xway_defconfig
arm                           stm32_defconfig
powerpc                     stx_gp3_defconfig
m68k                       m5475evb_defconfig
mips                         bigsur_defconfig
powerpc                     sequoia_defconfig
powerpc                     mpc5200_defconfig
mips                         rt305x_defconfig
arm                             pxa_defconfig
sh                          rsk7269_defconfig
mips                       capcella_defconfig
riscv                            alldefconfig
arm                           spitz_defconfig
powerpc                        warp_defconfig
xtensa                       common_defconfig
arm                        neponset_defconfig
sh                     magicpanelr2_defconfig
sh                            titan_defconfig
m68k                          sun3x_defconfig
sparc                       sparc64_defconfig
powerpc                   currituck_defconfig
powerpc                  iss476-smp_defconfig
i386                             alldefconfig
sh                   secureedge5410_defconfig
mips                        qi_lb60_defconfig
powerpc                       eiger_defconfig
sh                          rsk7201_defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
i386                 randconfig-a005-20210301
i386                 randconfig-a003-20210301
i386                 randconfig-a002-20210301
i386                 randconfig-a004-20210301
i386                 randconfig-a006-20210301
i386                 randconfig-a001-20210301
x86_64               randconfig-a015-20210301
x86_64               randconfig-a014-20210301
x86_64               randconfig-a013-20210301
x86_64               randconfig-a016-20210301
x86_64               randconfig-a012-20210301
x86_64               randconfig-a011-20210301
i386                 randconfig-a016-20210301
i386                 randconfig-a012-20210301
i386                 randconfig-a014-20210301
i386                 randconfig-a013-20210301
i386                 randconfig-a011-20210301
i386                 randconfig-a015-20210301
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210301
x86_64               randconfig-a001-20210301
x86_64               randconfig-a004-20210301
x86_64               randconfig-a002-20210301
x86_64               randconfig-a005-20210301
x86_64               randconfig-a003-20210301

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
