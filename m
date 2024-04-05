Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ED5899312
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 04:19:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JrA5s3AR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9hxf4s2vz3vY4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 13:19:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JrA5s3AR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9hwx4WD2z2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 13:18:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712283506; x=1743819506;
  h=date:from:to:cc:subject:message-id;
  bh=e70nthCaGgIEjbQAU4WA1z96AfQ7llcnkMCFy0CefSY=;
  b=JrA5s3AR73iIsryLl5yjiaelloN3/Us2Y2tfiKhjIjEk66CuIuRGSNK5
   qD6aK6xquIDBJyJOoTzGT0nB+1fNnQQoxdH6wGc3VnUIK5aLXBRCisj9L
   /o7cEPc4gsU9/eSVaxHDLtXog6ayxmH6h5AEzDUNovlTstBs0Ahcxe2MD
   dSi7w1aZG9m9JjJdxxNE0uttTPCRLGssQKdqIdqnXRSz3gMcgM1l9atVk
   EXqA/+WikgYqq2oTDRRNoXlcnCHdAmzbJZ9NfUl7lqrqc8krsf3lW56PY
   M8T5D3vWK+7bIhDIVxNDaBeTeWAlUuGK7xWCxTfHQ2VypgUc2qaONMLOg
   w==;
X-CSE-ConnectionGUID: M7nlljIvS+m8QzechxhxvA==
X-CSE-MsgGUID: xLKRpH7ERpm2vYgp9wMVWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="11417682"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="11417682"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 19:18:23 -0700
X-CSE-ConnectionGUID: vOTS1ZW2SlSap/IaXUT2Ag==
X-CSE-MsgGUID: jvOzZLHbTGGFYNGh7HuDew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="49940851"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Apr 2024 19:18:22 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsZ9o-0001mm-0A;
	Fri, 05 Apr 2024 02:18:20 +0000
Date: Fri, 05 Apr 2024 10:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 bfe51886ca544956eb4ff924d1937ac01d0ca9c8
Message-ID: <202404051044.20xlLxRS-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: bfe51886ca544956eb4ff924d1937ac01d0ca9c8  powerpc: Fix PS3 allmodconfig warning

elapsed time: 733m

configs tested: 139
configs skipped: 157

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                               allnoconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240405   gcc  
arc                   randconfig-002-20240405   gcc  
arm                        neponset_defconfig   gcc  
arm                   randconfig-001-20240405   gcc  
arm                   randconfig-002-20240405   clang
arm                   randconfig-003-20240405   gcc  
arm                   randconfig-004-20240405   clang
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20240405   gcc  
arm64                 randconfig-002-20240405   gcc  
arm64                 randconfig-003-20240405   gcc  
arm64                 randconfig-004-20240405   gcc  
csky                              allnoconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240405   gcc  
csky                  randconfig-002-20240405   gcc  
hexagon               randconfig-001-20240405   clang
hexagon               randconfig-002-20240405   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-003-20240405   clang
i386         buildonly-randconfig-005-20240405   clang
i386         buildonly-randconfig-006-20240405   clang
i386                  randconfig-001-20240405   clang
i386                  randconfig-003-20240405   clang
i386                  randconfig-004-20240405   clang
i386                  randconfig-005-20240405   clang
i386                  randconfig-011-20240405   clang
i386                  randconfig-016-20240405   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240405   gcc  
loongarch             randconfig-002-20240405   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                 decstation_r4k_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240405   gcc  
nios2                 randconfig-002-20240405   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240405   gcc  
parisc                randconfig-002-20240405   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                        cell_defconfig   gcc  
powerpc               randconfig-001-20240405   clang
powerpc               randconfig-002-20240405   clang
powerpc               randconfig-003-20240405   clang
powerpc                      walnut_defconfig   gcc  
powerpc64             randconfig-001-20240405   gcc  
powerpc64             randconfig-002-20240405   gcc  
powerpc64             randconfig-003-20240405   clang
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-001-20240405   clang
riscv                 randconfig-002-20240405   gcc  
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240405   clang
s390                  randconfig-002-20240405   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                ecovec24-romimage_defconfig   gcc  
sh                          kfr2r09_defconfig   gcc  
sh                    randconfig-001-20240405   gcc  
sh                    randconfig-002-20240405   gcc  
sh                   rts7751r2dplus_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                   sh7770_generic_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc                       sparc32_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240405   gcc  
sparc64               randconfig-002-20240405   gcc  
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240405   gcc  
um                    randconfig-002-20240405   clang
um                           x86_64_defconfig   clang
x86_64       buildonly-randconfig-003-20240405   gcc  
x86_64       buildonly-randconfig-004-20240405   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-004-20240405   gcc  
x86_64                randconfig-006-20240405   gcc  
x86_64                randconfig-012-20240405   gcc  
x86_64                randconfig-013-20240405   gcc  
x86_64                randconfig-015-20240405   gcc  
x86_64                randconfig-016-20240405   gcc  
x86_64                randconfig-071-20240405   gcc  
x86_64                randconfig-072-20240405   gcc  
x86_64                randconfig-073-20240405   gcc  
x86_64                randconfig-074-20240405   gcc  
x86_64                randconfig-075-20240405   gcc  
x86_64                randconfig-076-20240405   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240405   gcc  
xtensa                randconfig-002-20240405   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
