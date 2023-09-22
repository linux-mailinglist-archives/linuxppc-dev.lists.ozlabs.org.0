Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 619427AACF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:43:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=go7DzX0H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQlk1Rxyz3fvb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:43:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=go7DzX0H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsQkp0dC6z3cbj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:42:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695372162; x=1726908162;
  h=date:from:to:cc:subject:message-id;
  bh=019+gI6E7715sDH59TZFp/yYlAa1XAfeVSRuTUJMFWE=;
  b=go7DzX0Hi+5O8hJrYk6q0m92XmlBB5MGbe/UclIMWSTkYPNgpdRi7+mg
   vyjSx935ReHaFm8tifkCsdEdWn9G5FnE9kJsaUudAAk2Rs8yGN/Li+dtB
   Pb9FatXLAwUgdstsTUZ0ZhnsPirFMtJrbJkssthQurRHm2YxzhI0HSwO6
   iOd4WkeYUFRI3WWQotcRJGeqz1kVb2P6SGJcdI5G3BQPJKkEOVGUKMfgK
   Fi4CwAmBgYEgLS1Aif5+Jp3G2RIVYJVfzeScFVLSjFQHjVbRhyMzrEDc1
   2GbDLmFLARoUvP31Uf/xutX+1ICd25Bh2lZ7up6qruY/0UU4NfTrvoedC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="384613362"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="384613362"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 01:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="862866395"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="862866395"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2023 01:42:33 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjbk7-0000P7-1F;
	Fri, 22 Sep 2023 08:42:31 +0000
Date: Fri, 22 Sep 2023 16:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 c945e6f453a361b0e9daddd2be9c099d1b80d6f8
Message-ID: <202309221634.pDJ10fhu-lkp@intel.com>
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
branch HEAD: c945e6f453a361b0e9daddd2be9c099d1b80d6f8  powerpc/configs: Remove ReiserFS from defconfig

elapsed time: 1346m

configs tested: 177
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
arc                   randconfig-001-20230921   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230921   gcc  
arm                   randconfig-001-20230922   gcc  
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
i386         buildonly-randconfig-001-20230921   gcc  
i386         buildonly-randconfig-001-20230922   gcc  
i386         buildonly-randconfig-002-20230921   gcc  
i386         buildonly-randconfig-002-20230922   gcc  
i386         buildonly-randconfig-003-20230921   gcc  
i386         buildonly-randconfig-003-20230922   gcc  
i386         buildonly-randconfig-004-20230921   gcc  
i386         buildonly-randconfig-004-20230922   gcc  
i386         buildonly-randconfig-005-20230921   gcc  
i386         buildonly-randconfig-005-20230922   gcc  
i386         buildonly-randconfig-006-20230921   gcc  
i386         buildonly-randconfig-006-20230922   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230921   gcc  
i386                  randconfig-001-20230922   gcc  
i386                  randconfig-002-20230921   gcc  
i386                  randconfig-002-20230922   gcc  
i386                  randconfig-003-20230921   gcc  
i386                  randconfig-003-20230922   gcc  
i386                  randconfig-004-20230921   gcc  
i386                  randconfig-004-20230922   gcc  
i386                  randconfig-005-20230921   gcc  
i386                  randconfig-005-20230922   gcc  
i386                  randconfig-006-20230921   gcc  
i386                  randconfig-006-20230922   gcc  
i386                  randconfig-011-20230921   gcc  
i386                  randconfig-011-20230922   gcc  
i386                  randconfig-012-20230921   gcc  
i386                  randconfig-012-20230922   gcc  
i386                  randconfig-013-20230921   gcc  
i386                  randconfig-013-20230922   gcc  
i386                  randconfig-014-20230921   gcc  
i386                  randconfig-014-20230922   gcc  
i386                  randconfig-015-20230921   gcc  
i386                  randconfig-015-20230922   gcc  
i386                  randconfig-016-20230921   gcc  
i386                  randconfig-016-20230922   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230921   gcc  
loongarch             randconfig-001-20230922   gcc  
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
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230921   gcc  
riscv                 randconfig-001-20230922   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230921   gcc  
s390                  randconfig-001-20230922   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230921   gcc  
sparc                 randconfig-001-20230922   gcc  
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
x86_64       buildonly-randconfig-001-20230921   gcc  
x86_64       buildonly-randconfig-001-20230922   gcc  
x86_64       buildonly-randconfig-002-20230921   gcc  
x86_64       buildonly-randconfig-002-20230922   gcc  
x86_64       buildonly-randconfig-003-20230921   gcc  
x86_64       buildonly-randconfig-003-20230922   gcc  
x86_64       buildonly-randconfig-004-20230921   gcc  
x86_64       buildonly-randconfig-004-20230922   gcc  
x86_64       buildonly-randconfig-005-20230921   gcc  
x86_64       buildonly-randconfig-005-20230922   gcc  
x86_64       buildonly-randconfig-006-20230921   gcc  
x86_64       buildonly-randconfig-006-20230922   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230921   gcc  
x86_64                randconfig-001-20230922   gcc  
x86_64                randconfig-002-20230921   gcc  
x86_64                randconfig-002-20230922   gcc  
x86_64                randconfig-003-20230921   gcc  
x86_64                randconfig-003-20230922   gcc  
x86_64                randconfig-004-20230921   gcc  
x86_64                randconfig-004-20230922   gcc  
x86_64                randconfig-005-20230921   gcc  
x86_64                randconfig-005-20230922   gcc  
x86_64                randconfig-006-20230921   gcc  
x86_64                randconfig-006-20230922   gcc  
x86_64                randconfig-011-20230921   gcc  
x86_64                randconfig-012-20230921   gcc  
x86_64                randconfig-013-20230921   gcc  
x86_64                randconfig-014-20230921   gcc  
x86_64                randconfig-015-20230921   gcc  
x86_64                randconfig-016-20230921   gcc  
x86_64                randconfig-071-20230921   gcc  
x86_64                randconfig-071-20230922   gcc  
x86_64                randconfig-072-20230921   gcc  
x86_64                randconfig-072-20230922   gcc  
x86_64                randconfig-073-20230921   gcc  
x86_64                randconfig-073-20230922   gcc  
x86_64                randconfig-074-20230921   gcc  
x86_64                randconfig-074-20230922   gcc  
x86_64                randconfig-075-20230921   gcc  
x86_64                randconfig-075-20230922   gcc  
x86_64                randconfig-076-20230921   gcc  
x86_64                randconfig-076-20230922   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
