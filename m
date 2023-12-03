Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0662B802914
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 00:44:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mGVd2U+g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sk3L03mzzz3cZP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 10:44:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mGVd2U+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sk3K86wS5z2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 10:43:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701647021; x=1733183021;
  h=date:from:to:cc:subject:message-id;
  bh=DSPstFwBNq0+IC/5PsHI38hmDF/AAXe3w8Mj2vaYfUs=;
  b=mGVd2U+gMj/VXI94hcU7pTNk/ItxRig7QNHU4uFJqnbRnE67OpyWoNyj
   yF35kt06fdOhAEQCY43KYhg2SAc6QTgMIQkAHseSruPGrNz958UbDseNn
   O2Q3wcMaKDH69I7vDUb3tCC+BFziT9lBPy5rZxk4GVKdcWFtkx6dHUysk
   bReFrrf7JHWdVXhJHU1dP4NDwuJ5BDqg8z5PIxuiL10Ce1QpWGhe5FGaf
   7l3ox/dqYKUYw0jcqUAv1hjUV1GnscXI4MD4PY0FNymkG/LrF93Sy4Anv
   hBxAWe7iUyK7fceB+umSQna1XOxGUWj/tXM6ClSodJTbr7ZRcpVodAP1t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="479866375"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="479866375"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 15:43:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="763763139"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="763763139"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Dec 2023 15:43:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9w7T-0007F0-1l;
	Sun, 03 Dec 2023 23:43:27 +0000
Date: Mon, 04 Dec 2023 07:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 27951e1d8274e9f9a2925b069e4492939a3f2099
Message-ID: <202312040751.s2suMX8e-lkp@intel.com>
User-Agent: s-nail v14.9.24
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 27951e1d8274e9f9a2925b069e4492939a3f2099  powerpc/pseries/memhp: Log more error conditions in add path

elapsed time: 1444m

configs tested: 199
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            alldefconfig   gcc  
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsim_700_defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20231203   gcc  
arc                   randconfig-002-20231203   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                          gemini_defconfig   gcc  
arm                             mxs_defconfig   clang
arm                   randconfig-001-20231203   gcc  
arm                   randconfig-002-20231203   gcc  
arm                   randconfig-003-20231203   gcc  
arm                   randconfig-004-20231203   gcc  
arm                        realview_defconfig   gcc  
arm                           spitz_defconfig   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231203   gcc  
arm64                 randconfig-002-20231203   gcc  
arm64                 randconfig-003-20231203   gcc  
arm64                 randconfig-004-20231203   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231203   gcc  
csky                  randconfig-002-20231203   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231203   clang
hexagon               randconfig-002-20231203   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231203   gcc  
i386         buildonly-randconfig-002-20231203   gcc  
i386         buildonly-randconfig-003-20231203   gcc  
i386         buildonly-randconfig-004-20231203   gcc  
i386         buildonly-randconfig-005-20231203   gcc  
i386         buildonly-randconfig-006-20231203   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231203   gcc  
i386                  randconfig-002-20231203   gcc  
i386                  randconfig-003-20231203   gcc  
i386                  randconfig-004-20231203   gcc  
i386                  randconfig-005-20231203   gcc  
i386                  randconfig-006-20231203   gcc  
i386                  randconfig-011-20231203   clang
i386                  randconfig-012-20231203   clang
i386                  randconfig-013-20231203   clang
i386                  randconfig-014-20231203   clang
i386                  randconfig-015-20231203   clang
i386                  randconfig-016-20231203   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231203   gcc  
loongarch             randconfig-002-20231203   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                            mac_defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                      loongson3_defconfig   gcc  
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231203   gcc  
nios2                 randconfig-002-20231203   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
openrisc                       virt_defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231203   gcc  
parisc                randconfig-002-20231203   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                      cm5200_defconfig   gcc  
powerpc                 mpc834x_itx_defconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                       ppc64_defconfig   gcc  
powerpc               randconfig-001-20231203   gcc  
powerpc               randconfig-002-20231203   gcc  
powerpc               randconfig-003-20231203   gcc  
powerpc                     sequoia_defconfig   gcc  
powerpc                     taishan_defconfig   gcc  
powerpc64             randconfig-001-20231203   gcc  
powerpc64             randconfig-002-20231203   gcc  
powerpc64             randconfig-003-20231203   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231203   gcc  
riscv                 randconfig-002-20231203   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231203   clang
s390                  randconfig-002-20231203   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                         apsh4a3a_defconfig   gcc  
sh                                  defconfig   gcc  
sh                         ecovec24_defconfig   gcc  
sh                          polaris_defconfig   gcc  
sh                    randconfig-001-20231203   gcc  
sh                    randconfig-002-20231203   gcc  
sh                          rsk7269_defconfig   gcc  
sh                           se7712_defconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                        sh7785lcr_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                            allyesconfig   gcc  
sparc64                          alldefconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231203   gcc  
sparc64               randconfig-002-20231203   gcc  
um                               alldefconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231203   gcc  
um                    randconfig-002-20231203   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231203   gcc  
x86_64       buildonly-randconfig-002-20231203   gcc  
x86_64       buildonly-randconfig-003-20231203   gcc  
x86_64       buildonly-randconfig-004-20231203   gcc  
x86_64       buildonly-randconfig-005-20231203   gcc  
x86_64       buildonly-randconfig-006-20231203   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                randconfig-001-20231203   clang
x86_64                randconfig-002-20231203   clang
x86_64                randconfig-003-20231203   clang
x86_64                randconfig-004-20231203   clang
x86_64                randconfig-005-20231203   clang
x86_64                randconfig-006-20231203   clang
x86_64                randconfig-011-20231203   gcc  
x86_64                randconfig-012-20231203   gcc  
x86_64                randconfig-013-20231203   gcc  
x86_64                randconfig-014-20231203   gcc  
x86_64                randconfig-015-20231203   gcc  
x86_64                randconfig-016-20231203   gcc  
x86_64                randconfig-071-20231203   gcc  
x86_64                randconfig-072-20231203   gcc  
x86_64                randconfig-073-20231203   gcc  
x86_64                randconfig-074-20231203   gcc  
x86_64                randconfig-075-20231203   gcc  
x86_64                randconfig-076-20231203   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  
xtensa                randconfig-001-20231203   gcc  
xtensa                randconfig-002-20231203   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
