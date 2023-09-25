Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7357ACE94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 05:05:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SyuW2HCp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv75z3QxSz3ddy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 13:05:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SyuW2HCp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv7521JqTz3dVn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 13:04:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695611062; x=1727147062;
  h=date:from:to:cc:subject:message-id;
  bh=DkqlcqzrHqsuXBnyo0j6VE9v62YaYK0hUrZjHGrJOss=;
  b=SyuW2HCpZ16DiisQXRwSCnQ5hCXAihI/nXu0R+WC2jH3pN1zUuux+vTc
   8487ZARRPHOUBeqyi/2iEzIAJ5TmpU4jUhU4iupoVSnJ1E8yGEww3zx6T
   ufSBE3M/tjNTfAgfFcHSYou8FvZPLaDko6NYhxFG6DgZS7ZqV0ro6o1yH
   lEW4TYRBlfQhU7u8SlqQg8GQ600OPJPInakrEV7JYOo/uXMyqhlq+H0EY
   9LomRe/OtgEVOQ47feSKQTPBQxBFCfRqJuISXOsMolYMjGmBp7F2F0QoU
   Yst9EUCU5G0P/RJE7dbXrSpELr6cVXLeirz3Jwc0hNjEQ0nNu6buvyIgH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="467440154"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="467440154"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 20:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="818455723"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="818455723"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Sep 2023 20:04:12 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkbtK-00013y-2A;
	Mon, 25 Sep 2023 03:04:10 +0000
Date: Mon, 25 Sep 2023 11:03:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 2048fdba5ebe7e010a32b98a2ba4a4e0547334d7
Message-ID: <202309251116.et5KTn55-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 2048fdba5ebe7e010a32b98a2ba4a4e0547334d7  Automatic merge of 'master' into merge (2023-09-22 18:04)

elapsed time: 3802m

configs tested: 223
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230922   gcc  
arc                   randconfig-001-20230923   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                         assabet_defconfig   gcc  
arm                                 defconfig   gcc  
arm                        keystone_defconfig   gcc  
arm                   randconfig-001-20230922   gcc  
arm                   randconfig-001-20230923   gcc  
arm                   randconfig-001-20230924   gcc  
arm                         s3c6400_defconfig   gcc  
arm                           sama7_defconfig   clang
arm                           stm32_defconfig   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230922   gcc  
i386         buildonly-randconfig-001-20230923   gcc  
i386         buildonly-randconfig-001-20230924   gcc  
i386         buildonly-randconfig-002-20230922   gcc  
i386         buildonly-randconfig-002-20230923   gcc  
i386         buildonly-randconfig-002-20230924   gcc  
i386         buildonly-randconfig-003-20230922   gcc  
i386         buildonly-randconfig-003-20230923   gcc  
i386         buildonly-randconfig-003-20230924   gcc  
i386         buildonly-randconfig-004-20230922   gcc  
i386         buildonly-randconfig-004-20230924   gcc  
i386         buildonly-randconfig-005-20230922   gcc  
i386         buildonly-randconfig-005-20230923   gcc  
i386         buildonly-randconfig-005-20230924   gcc  
i386         buildonly-randconfig-006-20230922   gcc  
i386         buildonly-randconfig-006-20230924   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230922   gcc  
i386                  randconfig-001-20230923   gcc  
i386                  randconfig-001-20230924   gcc  
i386                  randconfig-002-20230922   gcc  
i386                  randconfig-002-20230924   gcc  
i386                  randconfig-003-20230922   gcc  
i386                  randconfig-003-20230924   gcc  
i386                  randconfig-004-20230922   gcc  
i386                  randconfig-004-20230924   gcc  
i386                  randconfig-005-20230922   gcc  
i386                  randconfig-005-20230923   gcc  
i386                  randconfig-005-20230924   gcc  
i386                  randconfig-006-20230922   gcc  
i386                  randconfig-006-20230923   gcc  
i386                  randconfig-006-20230924   gcc  
i386                  randconfig-011-20230922   gcc  
i386                  randconfig-011-20230923   gcc  
i386                  randconfig-011-20230924   gcc  
i386                  randconfig-012-20230922   gcc  
i386                  randconfig-012-20230924   gcc  
i386                  randconfig-013-20230922   gcc  
i386                  randconfig-013-20230924   gcc  
i386                  randconfig-014-20230922   gcc  
i386                  randconfig-014-20230923   gcc  
i386                  randconfig-014-20230924   gcc  
i386                  randconfig-015-20230922   gcc  
i386                  randconfig-015-20230923   gcc  
i386                  randconfig-015-20230924   gcc  
i386                  randconfig-016-20230922   gcc  
i386                  randconfig-016-20230923   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230922   gcc  
loongarch             randconfig-001-20230923   gcc  
loongarch             randconfig-001-20230924   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                           ip32_defconfig   gcc  
mips                malta_qemu_32r6_defconfig   clang
mips                           mtx1_defconfig   clang
mips                        qi_lb60_defconfig   clang
mips                          rb532_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                         alldefconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                   bluestone_defconfig   clang
powerpc                      ppc6xx_defconfig   gcc  
powerpc                     tqm8555_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230922   gcc  
riscv                 randconfig-001-20230924   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230922   gcc  
s390                  randconfig-001-20230923   gcc  
s390                  randconfig-001-20230924   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                          landisk_defconfig   gcc  
sh                          rsk7201_defconfig   gcc  
sh                          rsk7269_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230922   gcc  
sparc                 randconfig-001-20230923   gcc  
sparc                 randconfig-001-20230924   gcc  
sparc                       sparc64_defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230922   gcc  
x86_64       buildonly-randconfig-001-20230923   gcc  
x86_64       buildonly-randconfig-001-20230924   gcc  
x86_64       buildonly-randconfig-002-20230922   gcc  
x86_64       buildonly-randconfig-002-20230924   gcc  
x86_64       buildonly-randconfig-003-20230922   gcc  
x86_64       buildonly-randconfig-003-20230923   gcc  
x86_64       buildonly-randconfig-003-20230924   gcc  
x86_64       buildonly-randconfig-004-20230922   gcc  
x86_64       buildonly-randconfig-004-20230924   gcc  
x86_64       buildonly-randconfig-005-20230922   gcc  
x86_64       buildonly-randconfig-005-20230923   gcc  
x86_64       buildonly-randconfig-005-20230924   gcc  
x86_64       buildonly-randconfig-006-20230922   gcc  
x86_64       buildonly-randconfig-006-20230923   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230922   gcc  
x86_64                randconfig-001-20230924   gcc  
x86_64                randconfig-002-20230922   gcc  
x86_64                randconfig-002-20230924   gcc  
x86_64                randconfig-003-20230922   gcc  
x86_64                randconfig-003-20230924   gcc  
x86_64                randconfig-004-20230922   gcc  
x86_64                randconfig-004-20230924   gcc  
x86_64                randconfig-005-20230922   gcc  
x86_64                randconfig-005-20230924   gcc  
x86_64                randconfig-006-20230922   gcc  
x86_64                randconfig-006-20230924   gcc  
x86_64                randconfig-011-20230923   gcc  
x86_64                randconfig-011-20230924   gcc  
x86_64                randconfig-012-20230923   gcc  
x86_64                randconfig-013-20230923   gcc  
x86_64                randconfig-013-20230924   gcc  
x86_64                randconfig-014-20230923   gcc  
x86_64                randconfig-015-20230923   gcc  
x86_64                randconfig-015-20230924   gcc  
x86_64                randconfig-016-20230923   gcc  
x86_64                randconfig-016-20230924   gcc  
x86_64                randconfig-071-20230922   gcc  
x86_64                randconfig-071-20230923   gcc  
x86_64                randconfig-071-20230924   gcc  
x86_64                randconfig-072-20230922   gcc  
x86_64                randconfig-072-20230923   gcc  
x86_64                randconfig-072-20230924   gcc  
x86_64                randconfig-073-20230922   gcc  
x86_64                randconfig-073-20230923   gcc  
x86_64                randconfig-073-20230924   gcc  
x86_64                randconfig-074-20230922   gcc  
x86_64                randconfig-074-20230923   gcc  
x86_64                randconfig-074-20230924   gcc  
x86_64                randconfig-075-20230922   gcc  
x86_64                randconfig-075-20230923   gcc  
x86_64                randconfig-075-20230924   gcc  
x86_64                randconfig-076-20230922   gcc  
x86_64                randconfig-076-20230923   gcc  
x86_64                randconfig-076-20230924   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
