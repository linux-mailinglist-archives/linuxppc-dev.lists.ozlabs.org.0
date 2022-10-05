Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FAD5F4D97
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 04:05:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhybL10Wsz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 13:05:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQvodkTK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQvodkTK;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhyZM0lgYz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 13:04:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664935499; x=1696471499;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YkWp5mc/B3I0gRn3bndabuO/iF6tH37sNuOgb0pJevY=;
  b=hQvodkTKK61HxzdZMQeWf4K81RlCPKIC8rBDvpV0quV59vUyULyKc7Qb
   wV5K+LUwpoarjE7TYFmZCScWO1KGnolGmCVTk48JZaDGGCWR/USqzWQs1
   F9H6PZgVEJmiQX7XeMRkLWj6LtyBrdnDYrksv2ekLsj1D1AbaMMNlkOXC
   +x3kJbDDWbizVVaOUbnRU2jM3LonvcJ9gDNzYMUGRGlb9mCY6Abd1fbD/
   haRwhH1XAmZNmim+1EhQ2fCsyPh/j6oqUTKh0R8QGWYDDPlPIapB0KYjb
   ykbG97ZfQACIyPj3dsFj/3OR4ciOyBGo66iJ5tAwRXAF8iYcjbJhj1L6R
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="364992211"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="364992211"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 19:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="575269764"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; 
   d="scan'208";a="575269764"
Received: from lkp-server01.sh.intel.com (HELO d4f44333118a) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Oct 2022 19:04:48 -0700
Received: from kbuild by d4f44333118a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oftmB-0000ld-22;
	Wed, 05 Oct 2022 02:04:47 +0000
Date: Wed, 05 Oct 2022 10:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 0fa6831811f62cfc10415d731bcf9fde2647ad81
Message-ID: <633ce630.OGh4Ewk2bcqZBBuQ%lkp@intel.com>
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
branch HEAD: 0fa6831811f62cfc10415d731bcf9fde2647ad81  powerpc/64: Fix msr_check_and_set/clear MSR[EE] race

elapsed time: 759m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
x86_64                          rhel-8.3-func
s390                             allyesconfig
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
m68k                             allmodconfig
x86_64                           allyesconfig
sh                               allmodconfig
m68k                             allyesconfig
i386                 randconfig-a011-20221003
i386                 randconfig-a015-20221003
i386                 randconfig-a012-20221003
i386                 randconfig-a016-20221003
i386                 randconfig-a013-20221003
i386                 randconfig-a014-20221003
mips                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
x86_64               randconfig-a015-20221003
x86_64               randconfig-a016-20221003
x86_64               randconfig-a011-20221003
x86_64               randconfig-a014-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a012-20221003
i386                             allyesconfig
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arm                                 defconfig
s390                 randconfig-r044-20221003
arm64                            allyesconfig
arm                              allyesconfig
arc                  randconfig-r043-20221002
ia64                             allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
sh                        sh7763rdp_defconfig
loongarch                 loongson3_defconfig
arm                         cm_x300_defconfig
nios2                            alldefconfig
mips                            gpr_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
riscv                            allyesconfig
mips                        vocore2_defconfig

clang tested configs:
i386                 randconfig-a001-20221003
i386                 randconfig-a006-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a005-20221003
i386                 randconfig-a004-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a006-20221003
x86_64               randconfig-a003-20221003
x86_64               randconfig-a005-20221003
x86_64               randconfig-a004-20221003
hexagon              randconfig-r045-20221003
hexagon              randconfig-r041-20221003
hexagon              randconfig-r041-20221002
hexagon              randconfig-r045-20221002
riscv                randconfig-r042-20221002
s390                 randconfig-r044-20221002
x86_64                        randconfig-k001
mips                malta_qemu_32r6_defconfig
powerpc                 mpc836x_mds_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
