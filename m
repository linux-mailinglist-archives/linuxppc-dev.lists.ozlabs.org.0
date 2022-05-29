Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6DE5372AD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 23:14:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBB9w73htz3bl3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 07:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WU1siCUX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WU1siCUX;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBB8c5Jkzz2yV6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 07:13:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653858784; x=1685394784;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lVQZENgjdyQuoHD2ZdB7NWFOxeEaDLnh72CTMU9d364=;
  b=WU1siCUX3nCrYN+30B4d1ixaIcd55KIilEFg+7yPDIxEUu7VlgIG18IS
   8eF6os9HSJroq91S2fq9kUpMNOI4CD8rk+3bMknFa4PrHqtkg8TrgfqsU
   csiqypJ4wrr+BfSflSrGg+afiMBZpoveUMbCuZARti9m6DAq6TT9vOQAl
   zRE8uGWVDdEXxh9dC2hJNIy5YYSTNMRZO0tRvXOHBVHhLOJ3+07ya0cHC
   4WXm47BeT2V2LMfnDEyjnc9SpStIsPcAtXr1swwc5LaTJzgMSC+3S0+13
   lTxWunJnjJ35Soc99mderpLxYL6erdst+ZuLb7+rq1OBp3BjDTo90hvf2
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="255331275"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; 
   d="scan'208";a="255331275"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2022 14:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600"; 
   d="scan'208";a="678868761"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 29 May 2022 14:11:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nvQCc-0001FE-C2;
	Sun, 29 May 2022 21:11:58 +0000
Date: Mon, 30 May 2022 05:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 16332b7fbbe46581ddac80c6d32834c1269bc450
Message-ID: <6293e18b.9xVPcFrroYjqkIxB%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 16332b7fbbe46581ddac80c6d32834c1269bc450  Automatic merge of 'master' into merge (2022-05-29 10:31)

elapsed time: 725m

configs tested: 126
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
i386                          randconfig-c001
mips                     decstation_defconfig
powerpc                 mpc834x_mds_defconfig
arm                           stm32_defconfig
arm                            xcep_defconfig
xtensa                           alldefconfig
powerpc                     sequoia_defconfig
m68k                        m5407c3_defconfig
powerpc                 mpc8540_ads_defconfig
mips                        bcm47xx_defconfig
arc                           tb10x_defconfig
powerpc                     pq2fads_defconfig
arm                      footbridge_defconfig
arm                           h3600_defconfig
mips                     loongson1b_defconfig
powerpc                        cell_defconfig
sh                           se7750_defconfig
m68k                          amiga_defconfig
arc                                 defconfig
parisc                           allyesconfig
arm                       aspeed_g5_defconfig
powerpc                     tqm8541_defconfig
m68k                          atari_defconfig
sh                          r7785rp_defconfig
powerpc                      pcm030_defconfig
sh                     magicpanelr2_defconfig
sh                           se7619_defconfig
arc                              alldefconfig
m68k                          multi_defconfig
arm                  randconfig-c002-20220529
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
s390                                defconfig
s390                             allyesconfig
parisc64                            defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220529
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                           allyesconfig

clang tested configs:
powerpc              randconfig-c003-20220529
x86_64                        randconfig-c007
arm                  randconfig-c002-20220529
mips                 randconfig-c004-20220529
riscv                randconfig-c006-20220529
i386                          randconfig-c001
s390                 randconfig-c005-20220529
arm                      tct_hammer_defconfig
mips                         tb0219_defconfig
arm                         hackkit_defconfig
x86_64                           allyesconfig
mips                           ip22_defconfig
arm                        neponset_defconfig
mips                          rm200_defconfig
powerpc                    socrates_defconfig
mips                  cavium_octeon_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220529
hexagon              randconfig-r045-20220529
s390                 randconfig-r044-20220529
riscv                randconfig-r042-20220529

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
