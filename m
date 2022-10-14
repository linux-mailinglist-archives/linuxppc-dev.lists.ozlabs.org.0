Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF115FE781
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 05:18:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpWmW0Gqtz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 14:18:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMz773AO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMz773AO;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpWlZ184nz2xgb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 14:17:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665717434; x=1697253434;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SJM+aovMFhJNLAJ6SnrZfgocgKNPTpvZkCEhV6bpB/Q=;
  b=IMz773AOiUAG1FZ39+aM6CHYHDHxXNsjzfqUSPb4xhcyaHOE9wN099tO
   VER+0x2ylWuwb91cDaGYSptk27Ak4Ka8UznE/c7tPqHeDLk09Eyx6Pb4u
   AXQAJJw/VwusahQa4/Qr7EiODd0G2gYpZ5e8SNhaSXYtsBC4yMJ7zuOEW
   3i7+UnVO1Dwoz69vGzffhX571/OxdlA9JNg1H6cwmj9bmpereKMyGXX5/
   uveyjrOITQb1MDPh8XXJVg9GhKeIfLAvkshiyxy45TVmh8rAZiI+c/ab2
   iatBYDEwwMXwDyOw+a0Su1cAZNUe8213T4WNvwCuWeioJbJzbTfJzHatn
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="306343043"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="306343043"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 20:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="627419409"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="627419409"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Oct 2022 20:17:08 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ojBC7-0005xf-0X;
	Fri, 14 Oct 2022 03:17:07 +0000
Date: Fri, 14 Oct 2022 11:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS
 90d5ce82e143b42b2fdfb95401a89f86b71cedb7
Message-ID: <6348d499.C5YVW9qgtYYSHaG8%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
branch HEAD: 90d5ce82e143b42b2fdfb95401a89f86b71cedb7  powerpc/pseries: Fix CONFIG_DTL=n build

elapsed time: 878m

configs tested: 72
configs skipped: 111

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221012
s390                 randconfig-r044-20221012
riscv                randconfig-r042-20221012
powerpc                  iss476-smp_defconfig
powerpc                       maple_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
mips                             allyesconfig
sh                               allmodconfig
s390                       zfcpdump_defconfig
alpha                            alldefconfig
arc                               allnoconfig
powerpc                 mpc834x_mds_defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
s390                                defconfig
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
s390                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
mips                            ar7_defconfig
xtensa                              defconfig
powerpc                      pasemi_defconfig
csky                              allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
i386                          randconfig-c001
ia64                          tiger_defconfig
sh                           se7751_defconfig
nios2                            alldefconfig
arm                           tegra_defconfig
riscv                            allyesconfig
arc                     haps_hs_smp_defconfig
powerpc                     tqm8548_defconfig
openrisc                         alldefconfig
openrisc                    or1ksim_defconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
mips                        qi_lb60_defconfig
mips                     cu1000-neo_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-k001
arm                        multi_v5_defconfig
arm                         socfpga_defconfig
powerpc                     ksi8560_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
