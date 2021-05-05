Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C453733C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 04:44:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZgyh6xd9z30Jb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 12:44:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZgyJ5x5bz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 12:43:48 +1000 (AEST)
IronPort-SDR: FmnDnrqK3TlVaDtsO5RRSQHZfBQPi6+hgtJ0Su8bHgk1lIdVS9eEXKZ54qkVX2j9P1fq2enSM6
 kka3t95iZ/FQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="196074303"
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; d="scan'208";a="196074303"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 19:43:44 -0700
IronPort-SDR: cYT8Qvghio5w2T0GTUAN9Fd1Z7h4jWwauVvVga85ILG5nqkBTGoqW2Lb7vW+qCcpv15GN6ORnj
 h6WrXrRpohCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,273,1613462400"; d="scan'208";a="451509282"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2021 19:43:43 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1le7Vm-0009om-MG; Wed, 05 May 2021 02:43:42 +0000
Date: Wed, 05 May 2021 10:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 7619d98e5041d5c25aba5428704dba6121237a9a
Message-ID: <6092064a.Alafu0H29qBkxtf7%lkp@intel.com>
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
branch HEAD: 7619d98e5041d5c25aba5428704dba6121237a9a  Automatic merge of 'next' into merge (2021-05-04 11:06)

elapsed time: 723m

configs tested: 151
configs skipped: 2

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
arm                             mxs_defconfig
mips                             allyesconfig
mips                    maltaup_xpa_defconfig
arm                           viper_defconfig
arm                          imote2_defconfig
arm                       imx_v6_v7_defconfig
arm                          pcm027_defconfig
powerpc                     tqm8560_defconfig
sh                        sh7763rdp_defconfig
arm                        mvebu_v5_defconfig
powerpc                  storcenter_defconfig
sparc                       sparc32_defconfig
sh                          rsk7201_defconfig
mips                            ar7_defconfig
powerpc                     asp8347_defconfig
sparc64                          alldefconfig
mips                            e55_defconfig
mips                        vocore2_defconfig
powerpc                        icon_defconfig
arm                            zeus_defconfig
sh                          landisk_defconfig
powerpc                      mgcoge_defconfig
arm                           h3600_defconfig
mips                      pic32mzda_defconfig
mips                           xway_defconfig
powerpc                    socrates_defconfig
powerpc                     tqm5200_defconfig
sh                          sdk7780_defconfig
m68k                          atari_defconfig
m68k                        mvme147_defconfig
arm                      integrator_defconfig
ia64                          tiger_defconfig
m68k                       bvme6000_defconfig
powerpc                     tqm8548_defconfig
m68k                        m5272c3_defconfig
mips                           ip22_defconfig
powerpc                      makalu_defconfig
powerpc                    adder875_defconfig
powerpc                      ppc64e_defconfig
riscv                    nommu_virt_defconfig
arm                          ixp4xx_defconfig
sh                        sh7757lcr_defconfig
xtensa                  cadence_csp_defconfig
powerpc                     powernv_defconfig
arm                           sama5_defconfig
arm                           spitz_defconfig
powerpc                        cell_defconfig
powerpc                 mpc837x_mds_defconfig
powerpc                     ppa8548_defconfig
arm                    vt8500_v6_v7_defconfig
mips                         tb0219_defconfig
parisc                           alldefconfig
nios2                         10m50_defconfig
arm                        spear3xx_defconfig
arm                          pxa3xx_defconfig
mips                          rm200_defconfig
arc                         haps_hs_defconfig
sh                           se7712_defconfig
arm                          collie_defconfig
arm                          gemini_defconfig
arm                        spear6xx_defconfig
parisc                           allyesconfig
m68k                        stmark2_defconfig
sh                           se7780_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a003-20210504
i386                 randconfig-a006-20210504
i386                 randconfig-a001-20210504
i386                 randconfig-a005-20210504
i386                 randconfig-a004-20210504
i386                 randconfig-a002-20210504
i386                 randconfig-a003-20210503
i386                 randconfig-a006-20210503
i386                 randconfig-a001-20210503
i386                 randconfig-a005-20210503
i386                 randconfig-a004-20210503
i386                 randconfig-a002-20210503
x86_64               randconfig-a014-20210504
x86_64               randconfig-a015-20210504
x86_64               randconfig-a012-20210504
x86_64               randconfig-a013-20210504
x86_64               randconfig-a011-20210504
x86_64               randconfig-a016-20210504
i386                 randconfig-a015-20210504
i386                 randconfig-a013-20210504
i386                 randconfig-a016-20210504
i386                 randconfig-a014-20210504
i386                 randconfig-a012-20210504
i386                 randconfig-a011-20210504
riscv                    nommu_k210_defconfig
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
x86_64               randconfig-a001-20210504
x86_64               randconfig-a003-20210504
x86_64               randconfig-a005-20210504
x86_64               randconfig-a002-20210504
x86_64               randconfig-a006-20210504
x86_64               randconfig-a004-20210504
x86_64               randconfig-a014-20210503
x86_64               randconfig-a015-20210503
x86_64               randconfig-a012-20210503
x86_64               randconfig-a011-20210503
x86_64               randconfig-a013-20210503
x86_64               randconfig-a016-20210503

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
