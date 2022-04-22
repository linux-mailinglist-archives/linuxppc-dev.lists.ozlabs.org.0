Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93A50AEC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 06:13:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kl1Gt5yKpz3bl5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Apr 2022 14:13:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e8WAZhgY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e8WAZhgY; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kl1B66qSwz3bZg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 14:09:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650600543; x=1682136543;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=knKEY0T+DQD+kg62TnESxr3zDlnrNhrZ9sJgHL2jf4U=;
 b=e8WAZhgYFrqXNknTwtO8YJJLzOCC9eVpUydTu6H+RfpE5DI32bSeh3RP
 VYf8ZOQrfGxe+xemK8ZaRs4YdHl8+cNZ9EvYB4wvhuM1HlG0JVqyJiGaT
 siIb6lOBzK/D2uLOjgXTleGxX67KV8A+0OJs0v9h6JvyT5/OYu22qCBF1
 bm7stV0uu5rd9rMISANS8Z225nxIfaHoTEvghNGIkpOJrY9ChxmcQhzKa
 m1VOce5k54VnZF+SEoyu0lBwWAuLbWLzPw4z6Grwz6+hgU/eVeZ3Cjdtj
 7Q4e/4ldxrV49hhVNmmrJjRrkfCL0mGqb0BYSK4l6Xwoz1+ngEtQuQ8C1 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="264731619"
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="264731619"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 21:07:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,280,1643702400"; d="scan'208";a="805816509"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 21 Apr 2022 21:07:38 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nhka2-0009CA-8X;
 Fri, 22 Apr 2022 04:07:38 +0000
Date: Fri, 22 Apr 2022 12:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 950cf957fe34d40d63dfa3bf3968210430b6491e
Message-ID: <626229f8.yTBrA4B+d1Heco+t%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 950cf957fe34d40d63dfa3bf3968210430b6491e  misc: ocxl: fix possible double free in ocxl_file_register_afu

elapsed time: 809m

configs tested: 123
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
powerpc                     asp8347_defconfig
sh                           se7712_defconfig
powerpc                     ep8248e_defconfig
sh                   sh7724_generic_defconfig
powerpc                       ppc64_defconfig
sh                          rsk7269_defconfig
mips                     loongson1b_defconfig
arm                        mini2440_defconfig
sparc                       sparc32_defconfig
arm                        keystone_defconfig
powerpc                  storcenter_defconfig
powerpc64                           defconfig
parisc                           alldefconfig
mips                         cobalt_defconfig
mips                        bcm47xx_defconfig
sh                          polaris_defconfig
arm                        spear6xx_defconfig
mips                            ar7_defconfig
powerpc                     pq2fads_defconfig
sparc64                             defconfig
arm                          iop32x_defconfig
arm                         assabet_defconfig
arm                           stm32_defconfig
xtensa                    smp_lx200_defconfig
mips                           xway_defconfig
xtensa                          iss_defconfig
microblaze                          defconfig
xtensa                  cadence_csp_defconfig
powerpc                      arches_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220421
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                                 defconfig
sh                               allmodconfig
nios2                               defconfig
arc                              allyesconfig
s390                                defconfig
s390                             allmodconfig
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
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220421
s390                 randconfig-r044-20220421
riscv                randconfig-r042-20220421
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

clang tested configs:
riscv                randconfig-c006-20220421
mips                 randconfig-c004-20220421
x86_64                        randconfig-c007
i386                          randconfig-c001
arm                  randconfig-c002-20220421
powerpc              randconfig-c003-20220421
powerpc                      ppc64e_defconfig
mips                           rs90_defconfig
powerpc                        fsp2_defconfig
powerpc                     tqm8560_defconfig
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
hexagon              randconfig-r041-20220421
hexagon              randconfig-r045-20220421

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
