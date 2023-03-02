Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCB6A78C7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 02:18:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRtXv6S2yz3cKG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 12:18:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hoIRckZP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hoIRckZP;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRtWv3Zv7z3cB4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 12:17:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677719884; x=1709255884;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pcj5BG3AoA6LoU5YBxMBZSG8vhQrazvemAf9EZsO3vQ=;
  b=hoIRckZPA/uGh6ExNX+wS9ak2ZMewflz+HHo123Oa74nNjwKsEW47Cm2
   Khq/I2CusJ/H95qFsVdLVaPwzSTybYSE81QK7MoQOs12KFhitgBWKmm5W
   WCUhw7fB6QgGgsR3TwfwLinTwFrdG77D9PboQZa5rv8yitjbSFETIGxTV
   I6t3SuhY88DlzxEZ7uWLHgEpjju0tq2LNc5qCnLc+/LmQCJR02zeSPKDL
   lpQnKqyF6a1sIbh/UWdJ8sxi5QG6MY7Q8TOZ0lnyXw8v4iSqzefTes0ay
   qDrqzuzzZyxEgQI8F6CJ04BAQkVPqRMMFr7lhqtJzbp5ceh4fZSoLe0gH
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="333304063"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="333304063"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 17:17:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738855885"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="738855885"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 17:17:53 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXXZx-00002J-0Q;
	Thu, 02 Mar 2023 01:17:53 +0000
Date: Thu, 02 Mar 2023 09:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 f8b2336f15f3bc30e37ce5c052cde5b6319bb6df
Message-ID: <63fff90d.KWtdl2O3tp8ipm5w%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: f8b2336f15f3bc30e37ce5c052cde5b6319bb6df  powerpc: Avoid dead code/data elimination when using recordmcount

elapsed time: 746m

configs tested: 162
configs skipped: 15

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r015-20230226   gcc  
alpha                randconfig-r021-20230227   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r001-20230301   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r011-20230226   gcc  
arc                  randconfig-r011-20230227   gcc  
arc                  randconfig-r016-20230227   gcc  
arc                  randconfig-r021-20230226   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r005-20230227   gcc  
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r001-20230302   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r031-20230227   clang
csky                                defconfig   gcc  
csky                 randconfig-r001-20230226   gcc  
csky                 randconfig-r003-20230227   gcc  
csky                 randconfig-r006-20230226   gcc  
csky                 randconfig-r013-20230227   gcc  
csky                 randconfig-r014-20230227   gcc  
csky                 randconfig-r023-20230227   gcc  
csky                 randconfig-r036-20230226   gcc  
hexagon      buildonly-randconfig-r005-20230302   clang
hexagon      buildonly-randconfig-r006-20230301   clang
hexagon              randconfig-r014-20230226   clang
hexagon              randconfig-r024-20230227   clang
hexagon              randconfig-r041-20230226   clang
hexagon              randconfig-r041-20230227   clang
hexagon              randconfig-r045-20230226   clang
hexagon              randconfig-r045-20230227   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230227   clang
i386                 randconfig-a002-20230227   clang
i386                 randconfig-a003-20230227   clang
i386                 randconfig-a004-20230227   clang
i386                 randconfig-a005-20230227   clang
i386                 randconfig-a006-20230227   clang
i386                 randconfig-a011-20230227   gcc  
i386                          randconfig-a011   clang
i386                 randconfig-a012-20230227   gcc  
i386                          randconfig-a012   gcc  
i386                 randconfig-a013-20230227   gcc  
i386                          randconfig-a013   clang
i386                 randconfig-a014-20230227   gcc  
i386                          randconfig-a014   gcc  
i386                 randconfig-a015-20230227   gcc  
i386                          randconfig-a015   clang
i386                 randconfig-a016-20230227   gcc  
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r003-20230226   gcc  
ia64                 randconfig-r016-20230226   gcc  
ia64                 randconfig-r022-20230227   gcc  
ia64                 randconfig-r023-20230302   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r002-20230227   gcc  
loongarch            randconfig-r031-20230226   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r001-20230226   gcc  
m68k                 randconfig-r022-20230302   gcc  
m68k                 randconfig-r025-20230227   gcc  
microblaze   buildonly-randconfig-r004-20230301   gcc  
microblaze           randconfig-r006-20230227   gcc  
microblaze           randconfig-r025-20230302   gcc  
microblaze           randconfig-r026-20230302   gcc  
microblaze           randconfig-r035-20230226   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230227   gcc  
mips                 randconfig-r004-20230227   gcc  
mips                 randconfig-r011-20230226   gcc  
mips                 randconfig-r016-20230227   clang
nios2                               defconfig   gcc  
nios2                randconfig-r023-20230226   gcc  
openrisc             randconfig-r003-20230226   gcc  
openrisc             randconfig-r005-20230226   gcc  
openrisc             randconfig-r005-20230227   gcc  
openrisc             randconfig-r026-20230226   gcc  
parisc       buildonly-randconfig-r003-20230302   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r002-20230226   gcc  
parisc               randconfig-r005-20230226   gcc  
parisc               randconfig-r025-20230226   gcc  
parisc               randconfig-r034-20230226   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r002-20230302   clang
powerpc      buildonly-randconfig-r005-20230301   gcc  
powerpc              randconfig-r003-20230227   clang
powerpc              randconfig-r022-20230226   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r006-20230302   clang
riscv                               defconfig   gcc  
riscv                randconfig-r006-20230226   gcc  
riscv                randconfig-r024-20230302   clang
riscv                randconfig-r034-20230227   clang
riscv                randconfig-r036-20230227   clang
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r012-20230226   clang
s390                 randconfig-r012-20230227   gcc  
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r013-20230226   gcc  
sh                   randconfig-r021-20230302   gcc  
sh                   randconfig-r032-20230227   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r015-20230227   gcc  
sparc64              randconfig-r012-20230226   gcc  
sparc64              randconfig-r012-20230227   gcc  
sparc64              randconfig-r013-20230227   gcc  
sparc64              randconfig-r014-20230226   gcc  
sparc64              randconfig-r015-20230226   gcc  
sparc64              randconfig-r033-20230227   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230227   clang
x86_64               randconfig-a002-20230227   clang
x86_64               randconfig-a003-20230227   clang
x86_64               randconfig-a004-20230227   clang
x86_64               randconfig-a005-20230227   clang
x86_64               randconfig-a006-20230227   clang
x86_64               randconfig-a011-20230227   gcc  
x86_64               randconfig-a012-20230227   gcc  
x86_64               randconfig-a013-20230227   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64               randconfig-a015-20230227   gcc  
x86_64               randconfig-a016-20230227   gcc  
x86_64               randconfig-r004-20230227   clang
x86_64               randconfig-r011-20230227   gcc  
x86_64               randconfig-r035-20230227   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r002-20230226   gcc  
xtensa               randconfig-r002-20230227   gcc  
xtensa               randconfig-r014-20230227   gcc  
xtensa               randconfig-r033-20230226   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
