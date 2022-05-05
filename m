Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7751C502
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 18:19:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvJnC5LN4z3c92
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:19:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDheDQys;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lDheDQys; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvJmY2KRMz3bft
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 02:19:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651767549; x=1683303549;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=prbGte/8BAHgcuXTWIRN6ZQY4QvityruUUNki/GcKgU=;
 b=lDheDQyskpB8ZEInG4QDdjSn3l74axf6ziwX2WwB2GL3PJTFvhB5dyZx
 68KBFPkicTpnUoa8E5hq51Y1jI/VnoXDOm8HJV/i2dUEVU3541iLsglE0
 ETPRbDae9qTZO5bI5x6jnOn93YAwvyymDoBrbyOSxk4BKg1L1A8y74WuR
 YhcJans1fkSZLvwoDVQ/iq28FJ3n+9JJESfppQClSU3F0LOctXG2RU90n
 XQ7nCsxJ/zo6Gf3xXXmDLrLQTckNua4N4rKQ4lgwllY8lNm39WkqAb3XV
 TFhy79SN1nWJqQyEe3sjzTfNVc7PbBubmvkeD+g5LRQIPfJsk6frN33m7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="331157842"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="331157842"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 09:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="694730653"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 09:16:42 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nme9h-000CYK-98;
 Thu, 05 May 2022 16:16:41 +0000
Date: Fri, 06 May 2022 00:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS 36433b34c029f4181de26a82c94de8c88c339120
Message-ID: <6273f834.x9v1igwcxUWiYvII%lkp@intel.com>
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
branch HEAD: 36433b34c029f4181de26a82c94de8c88c339120  powerpc/ci: Pass SPARSE=2

elapsed time: 13191m

configs tested: 169
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
sh                           se7750_defconfig
powerpc                      pcm030_defconfig
xtensa                          iss_defconfig
powerpc                      cm5200_defconfig
arc                 nsimosci_hs_smp_defconfig
m68k                          sun3x_defconfig
ia64                      gensparse_defconfig
powerpc                 mpc837x_rdb_defconfig
m68k                       bvme6000_defconfig
h8300                     edosk2674_defconfig
arm                      footbridge_defconfig
s390                             allmodconfig
arc                     haps_hs_smp_defconfig
parisc                           alldefconfig
sh                         microdev_defconfig
sh                            shmin_defconfig
microblaze                      mmu_defconfig
arm                         lpc18xx_defconfig
riscv             nommu_k210_sdcard_defconfig
mips                         db1xxx_defconfig
powerpc                         ps3_defconfig
h8300                    h8300h-sim_defconfig
s390                       zfcpdump_defconfig
ia64                          tiger_defconfig
arm                          lpd270_defconfig
powerpc                      pasemi_defconfig
powerpc                      mgcoge_defconfig
mips                           ip32_defconfig
powerpc                        cell_defconfig
powerpc                     tqm8555_defconfig
powerpc                    klondike_defconfig
m68k                       m5208evb_defconfig
sh                           se7751_defconfig
powerpc                 linkstation_defconfig
x86_64               randconfig-c001-20220425
arm                  randconfig-c002-20220425
i386                 randconfig-c001-20220425
x86_64                        randconfig-c001
arm                  randconfig-c002-20220427
arm                  randconfig-c002-20220501
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
parisc                              defconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a003
i386                          randconfig-a005
i386                          randconfig-a001
x86_64               randconfig-a015-20220425
x86_64               randconfig-a014-20220425
x86_64               randconfig-a011-20220425
x86_64               randconfig-a013-20220425
x86_64               randconfig-a012-20220425
x86_64               randconfig-a016-20220425
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                 randconfig-a014-20220425
i386                 randconfig-a012-20220425
i386                 randconfig-a011-20220425
i386                 randconfig-a015-20220425
i386                 randconfig-a013-20220425
i386                 randconfig-a016-20220425
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220501
s390                 randconfig-r044-20220501
riscv                randconfig-r042-20220501
arc                  randconfig-r043-20220502
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                          rhel-8.3-func
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz

clang tested configs:
riscv                randconfig-c006-20220428
mips                 randconfig-c004-20220428
x86_64                        randconfig-c007
i386                          randconfig-c001
s390                 randconfig-c005-20220428
arm                  randconfig-c002-20220428
powerpc              randconfig-c003-20220428
riscv                randconfig-c006-20220427
mips                 randconfig-c004-20220427
arm                  randconfig-c002-20220427
powerpc              randconfig-c003-20220427
powerpc              randconfig-c003-20220505
arm                  randconfig-c002-20220505
mips                 randconfig-c004-20220505
s390                 randconfig-c005-20220505
riscv                randconfig-c006-20220505
arm                         palmz72_defconfig
powerpc                    mvme5100_defconfig
powerpc                      pmac32_defconfig
mips                          ath25_defconfig
powerpc                    socrates_defconfig
mips                     cu1000-neo_defconfig
riscv                             allnoconfig
powerpc                        icon_defconfig
arm                   milbeaut_m10v_defconfig
i386                             allyesconfig
arm                         hackkit_defconfig
mips                           mtx1_defconfig
powerpc                        fsp2_defconfig
arm                      pxa255-idp_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64               randconfig-a002-20220425
x86_64               randconfig-a004-20220425
x86_64               randconfig-a003-20220425
x86_64               randconfig-a001-20220425
x86_64               randconfig-a005-20220425
x86_64               randconfig-a006-20220425
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a011-20220502
x86_64               randconfig-a014-20220502
x86_64               randconfig-a012-20220502
x86_64               randconfig-a013-20220502
x86_64               randconfig-a016-20220502
x86_64               randconfig-a015-20220502
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220501
hexagon              randconfig-r041-20220501

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
