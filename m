Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659357C25C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 04:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpGvg10Xlz3dB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 12:38:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FRZtJpRr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FRZtJpRr;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpGv05NJ9z2yxF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 12:37:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658371052; x=1689907052;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FYYySzMfmU8qp8G+cK3b/3hK5xlMjNhDwTbWDTTF1is=;
  b=FRZtJpRrDYX2TCkI4kftrLg8Q6FfgoERv+jBa9E2hDxQ5FTJ6tchE2YL
   4O1fUsE8qzx4XowgXYW1bRPeKrFjKoCvhG25gEeE3bLPtMRWvKPXgy6yl
   v7r+K94Yj2uVjcUIMRAPLjLonkwkfAuskx2lYEDtZfN7JCnL0gYg2sfd/
   ttKRsqxeCERU4OXHe0ELKHOO4uOXIUBjwHGgRiDDAoFyct1vunMhxFSbt
   y96PTLXOphBCtkon3y/mjPWSLhpvg1pMdd80KcxC2861dtj3jWSXPEoq4
   r/c2kHCMTdKdYbTBEs0vFfZAQcPcTdDrF9yFtfMvJin9BP9Fvl3Lxa5+k
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="350922216"
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="350922216"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 19:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,288,1650956400"; 
   d="scan'208";a="598298763"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jul 2022 19:37:28 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oEM47-0001Lx-Mt;
	Thu, 21 Jul 2022 02:37:27 +0000
Date: Thu, 21 Jul 2022 10:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 1978c48495171165453a7c90d1345c1d8d776d02
Message-ID: <62d8bbac.DPb+qpJdC6msbpMr%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 1978c48495171165453a7c90d1345c1d8d776d02  powerpc/52xx: Mark gpt driver as not removable

elapsed time: 741m

configs tested: 118
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                          iop32x_defconfig
sh                      rts7751r2d1_defconfig
arm                         nhk8815_defconfig
xtensa                  audio_kc705_defconfig
powerpc                    adder875_defconfig
m68k                        m5272c3_defconfig
mips                         bigsur_defconfig
csky                              allnoconfig
um                             i386_defconfig
sh                           se7206_defconfig
sh                             shx3_defconfig
sh                                  defconfig
powerpc                        cell_defconfig
nios2                               defconfig
openrisc                 simple_smp_defconfig
arc                 nsimosci_hs_smp_defconfig
arm                          badge4_defconfig
sparc                             allnoconfig
arm                        mini2440_defconfig
arc                        nsimosci_defconfig
sparc                            allyesconfig
mips                  maltasmvp_eva_defconfig
sh                   secureedge5410_defconfig
m68k                        mvme147_defconfig
nios2                         10m50_defconfig
xtensa                              defconfig
m68k                            mac_defconfig
arm                           viper_defconfig
powerpc                      ep88xc_defconfig
powerpc                      pcm030_defconfig
alpha                            allyesconfig
ia64                         bigsur_defconfig
arm                          exynos_defconfig
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
loongarch                           defconfig
loongarch                         allnoconfig
arm                  randconfig-c002-20220718
i386                 randconfig-c001-20220718
x86_64               randconfig-c001-20220718
ia64                             allmodconfig
alpha                             allnoconfig
arc                               allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64               randconfig-a012-20220718
x86_64               randconfig-a011-20220718
x86_64               randconfig-a014-20220718
x86_64               randconfig-a016-20220718
x86_64               randconfig-a013-20220718
x86_64               randconfig-a015-20220718
i386                 randconfig-a015-20220718
i386                 randconfig-a011-20220718
i386                 randconfig-a012-20220718
i386                 randconfig-a014-20220718
i386                 randconfig-a016-20220718
i386                 randconfig-a013-20220718
i386                          randconfig-a012
i386                          randconfig-a016
s390                 randconfig-r044-20220718
riscv                randconfig-r042-20220718
arc                  randconfig-r043-20220718
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                      tct_hammer_defconfig
mips                           ip28_defconfig
powerpc                 mpc8315_rdb_defconfig
powerpc                 mpc832x_mds_defconfig
powerpc                    gamecube_defconfig
mips                          ath25_defconfig
powerpc                      acadia_defconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                 randconfig-a001-20220718
i386                 randconfig-a006-20220718
i386                 randconfig-a002-20220718
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                 randconfig-a004-20220718
i386                 randconfig-a005-20220718
i386                 randconfig-a003-20220718
hexagon              randconfig-r041-20220718
hexagon              randconfig-r045-20220718

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
