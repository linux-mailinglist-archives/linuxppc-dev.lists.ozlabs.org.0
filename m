Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98D359202
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 04:29:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGhsD0DZWz3bxT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 12:29:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGhrs4w99z2ywy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 12:28:43 +1000 (AEST)
IronPort-SDR: j3WcmZ1jhDloH3QQ6pYb6lw1jxj/zMBApWO/FipiHRnJduu/2FbuDOQUBo6XBQGE+bjwC43ZTA
 O4iBCOeyNa2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="191521523"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="191521523"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 19:28:40 -0700
IronPort-SDR: /6bsddSVxA/5Afr6COJEypylCGpPTubKlv7yDTAD+UjxFb4xBeEAUT+3m69qkrpFWPRanpzHzR
 h19AQ1KSlOJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="422520686"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
 by orsmga008.jf.intel.com with ESMTP; 08 Apr 2021 19:28:39 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lUgsw-000G2y-TP; Fri, 09 Apr 2021 02:28:38 +0000
Date: Fri, 09 Apr 2021 10:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS f2b8ef18c8e0634e176be99dcf242e515cfdb1d3
Message-ID: <606fbbbd.hqkEp6Mx9BLsTyCr%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: f2b8ef18c8e0634e176be99dcf242e515cfdb1d3  Automatic merge of 'master' into merge (2021-04-07 21:54)

elapsed time: 2263m

configs tested: 165
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
x86_64                           allyesconfig
riscv                            allmodconfig
i386                             allyesconfig
riscv                            allyesconfig
nds32                            alldefconfig
powerpc                   motionpro_defconfig
powerpc                 linkstation_defconfig
mips                       capcella_defconfig
arm                          pxa168_defconfig
arm                         lpc18xx_defconfig
arc                         haps_hs_defconfig
riscv                            alldefconfig
powerpc                     mpc83xx_defconfig
openrisc                 simple_smp_defconfig
arm                          gemini_defconfig
mips                           mtx1_defconfig
arm                      pxa255-idp_defconfig
m68k                        stmark2_defconfig
mips                      maltaaprp_defconfig
m68k                         amcore_defconfig
powerpc                   currituck_defconfig
sh                            hp6xx_defconfig
arc                     nsimosci_hs_defconfig
s390                       zfcpdump_defconfig
nios2                         3c120_defconfig
m68k                        m5407c3_defconfig
powerpc                    klondike_defconfig
powerpc                      ppc44x_defconfig
arm                         at91_dt_defconfig
powerpc                 mpc8272_ads_defconfig
sh                   sh7770_generic_defconfig
arm                          collie_defconfig
mips                           ip28_defconfig
sh                          r7780mp_defconfig
m68k                        mvme16x_defconfig
arm                        multi_v5_defconfig
powerpc                     kmeter1_defconfig
sh                          urquell_defconfig
sh                          kfr2r09_defconfig
xtensa                  audio_kc705_defconfig
xtensa                          iss_defconfig
arm                        spear3xx_defconfig
powerpc                      ppc64e_defconfig
mips                          rb532_defconfig
powerpc                 mpc834x_mds_defconfig
arm                            zeus_defconfig
openrisc                  or1klitex_defconfig
sh                   rts7751r2dplus_defconfig
powerpc                       maple_defconfig
arm                        shmobile_defconfig
mips                        maltaup_defconfig
riscv             nommu_k210_sdcard_defconfig
um                           x86_64_defconfig
arc                    vdk_hs38_smp_defconfig
arm                           u8500_defconfig
arm                             ezx_defconfig
arm                          ixp4xx_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                     sbc8548_defconfig
arm                       netwinder_defconfig
sh                          lboxre2_defconfig
mips                     loongson1c_defconfig
arm                             rpc_defconfig
powerpc                        warp_defconfig
sh                              ul2_defconfig
powerpc                     mpc5200_defconfig
powerpc                      ep88xc_defconfig
m68k                          amiga_defconfig
arm                  colibri_pxa270_defconfig
mips                           ip22_defconfig
arm                         shannon_defconfig
powerpc                 xes_mpc85xx_defconfig
mips                  decstation_64_defconfig
ia64                             allmodconfig
ia64                                defconfig
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
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20210408
x86_64               randconfig-a005-20210408
x86_64               randconfig-a003-20210408
x86_64               randconfig-a001-20210408
x86_64               randconfig-a002-20210408
x86_64               randconfig-a006-20210408
i386                 randconfig-a006-20210408
i386                 randconfig-a003-20210408
i386                 randconfig-a001-20210408
i386                 randconfig-a004-20210408
i386                 randconfig-a005-20210408
i386                 randconfig-a002-20210408
i386                 randconfig-a006-20210407
i386                 randconfig-a003-20210407
i386                 randconfig-a001-20210407
i386                 randconfig-a004-20210407
i386                 randconfig-a002-20210407
i386                 randconfig-a005-20210407
x86_64               randconfig-a014-20210407
x86_64               randconfig-a015-20210407
x86_64               randconfig-a013-20210407
x86_64               randconfig-a011-20210407
x86_64               randconfig-a012-20210407
x86_64               randconfig-a016-20210407
i386                 randconfig-a014-20210408
i386                 randconfig-a016-20210408
i386                 randconfig-a011-20210408
i386                 randconfig-a012-20210408
i386                 randconfig-a013-20210408
i386                 randconfig-a015-20210408
i386                 randconfig-a014-20210407
i386                 randconfig-a011-20210407
i386                 randconfig-a016-20210407
i386                 randconfig-a012-20210407
i386                 randconfig-a015-20210407
i386                 randconfig-a013-20210407
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a014-20210408
x86_64               randconfig-a015-20210408
x86_64               randconfig-a012-20210408
x86_64               randconfig-a011-20210408
x86_64               randconfig-a013-20210408
x86_64               randconfig-a016-20210408

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
