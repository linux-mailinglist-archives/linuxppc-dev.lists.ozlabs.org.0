Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA156A787E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 01:52:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRsyr40JXz3cCy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 11:52:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=naHAB73X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=naHAB73X;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRsxv2FX8z3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 11:51:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677718323; x=1709254323;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1knD3ylQesZXeBTTr96BRYakvaJzK95AVm+7hqF07u8=;
  b=naHAB73XIZrxcOv2LqeAwvlzlVGey6vNJkF5/ePMn5Oh+X4El7f95HTF
   MRC+ChOcVoKmB6znkHVPALSWyGxSxMn5s959+CP6kZWKCiGx6Xdt7RViE
   9qBeYRjCpLMCZ+cudZE8+Ggej4fDQ+Tfe79FlcL4cs6TjLOnRzoCrdDc/
   ZW+vtX9LrB16uLMjjxtP735HxsTZ9CYzJwAZChfefP14EuM9gmnAmQWQa
   b2kzli7E97/H4bC67m4+AYnLrBlboHokQMpwvK2i6BEYOG3EjMmHFvuyK
   4NLQON97VlJdIl0knQKeCy+beW6ZTwluoBZMdSg/speNAchB7FAkQii/6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="314240480"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="314240480"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 16:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="743631286"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="743631286"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Mar 2023 16:51:52 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXXAm-00001F-1F;
	Thu, 02 Mar 2023 00:51:52 +0000
Date: Thu, 02 Mar 2023 08:51:15 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 90dbf76e470bc4b973052a8f26ea43bae30f9aec
Message-ID: <63fff303.yzk1J3xBRsLuZhs4%lkp@intel.com>
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
branch HEAD: 90dbf76e470bc4b973052a8f26ea43bae30f9aec  Automatic merge of 'master' into merge (2023-02-26 20:52)

elapsed time: 5173m

configs tested: 178
configs skipped: 14

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230302   gcc  
alpha                randconfig-r031-20230226   gcc  
alpha                randconfig-r034-20230226   gcc  
alpha                randconfig-r035-20230227   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230226   gcc  
arc          buildonly-randconfig-r004-20230227   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r004-20230226   gcc  
arc                  randconfig-r004-20230227   gcc  
arc                  randconfig-r011-20230226   gcc  
arc                  randconfig-r013-20230226   gcc  
arc                  randconfig-r016-20230227   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r034-20230226   clang
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r005-20230226   gcc  
arm64        buildonly-randconfig-r006-20230227   clang
arm64                               defconfig   gcc  
arm64                randconfig-r013-20230227   gcc  
arm64                randconfig-r014-20230226   clang
arm64                randconfig-r031-20230227   clang
arm64                randconfig-r034-20230227   clang
csky                                defconfig   gcc  
hexagon              randconfig-r002-20230226   clang
hexagon              randconfig-r022-20230302   clang
hexagon              randconfig-r035-20230226   clang
hexagon              randconfig-r041-20230226   clang
hexagon              randconfig-r041-20230227   clang
hexagon              randconfig-r045-20230226   clang
hexagon              randconfig-r045-20230227   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230227   clang
i386                          randconfig-a001   gcc  
i386                 randconfig-a002-20230227   clang
i386                          randconfig-a002   clang
i386                 randconfig-a003-20230227   clang
i386                          randconfig-a003   gcc  
i386                 randconfig-a004-20230227   clang
i386                          randconfig-a004   clang
i386                 randconfig-a005-20230227   clang
i386                          randconfig-a005   gcc  
i386                 randconfig-a006-20230227   clang
i386                          randconfig-a006   clang
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
ia64         buildonly-randconfig-r001-20230226   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r022-20230227   gcc  
ia64                 randconfig-r023-20230302   gcc  
ia64                 randconfig-r026-20230226   gcc  
ia64                 randconfig-r032-20230227   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r001-20230226   gcc  
loongarch    buildonly-randconfig-r003-20230226   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r025-20230302   gcc  
loongarch            randconfig-r031-20230226   gcc  
m68k                             allmodconfig   gcc  
m68k         buildonly-randconfig-r005-20230226   gcc  
m68k         buildonly-randconfig-r005-20230227   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r025-20230226   gcc  
m68k                 randconfig-r033-20230226   gcc  
microblaze           randconfig-r012-20230227   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r005-20230226   clang
mips                 randconfig-r025-20230227   clang
mips                 randconfig-r036-20230227   gcc  
nios2        buildonly-randconfig-r002-20230226   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r036-20230226   gcc  
openrisc             randconfig-r004-20230226   gcc  
openrisc             randconfig-r013-20230226   gcc  
openrisc             randconfig-r014-20230227   gcc  
openrisc             randconfig-r016-20230226   gcc  
openrisc             randconfig-r035-20230226   gcc  
parisc       buildonly-randconfig-r001-20230227   gcc  
parisc       buildonly-randconfig-r004-20230226   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230227   gcc  
parisc               randconfig-r011-20230227   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230226   clang
powerpc              randconfig-r022-20230226   clang
powerpc              randconfig-r024-20230302   clang
powerpc              randconfig-r036-20230226   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv        buildonly-randconfig-r002-20230227   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r014-20230226   clang
riscv                randconfig-r015-20230226   clang
riscv                randconfig-r024-20230226   clang
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230226   gcc  
s390                 randconfig-r023-20230226   clang
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh                   randconfig-r003-20230227   gcc  
sh                   randconfig-r011-20230226   gcc  
sh                   randconfig-r033-20230227   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230226   gcc  
sparc                randconfig-r015-20230227   gcc  
sparc                randconfig-r016-20230226   gcc  
sparc                randconfig-r032-20230226   gcc  
sparc64      buildonly-randconfig-r003-20230227   gcc  
sparc64              randconfig-r003-20230226   gcc  
sparc64              randconfig-r012-20230226   gcc  
sparc64              randconfig-r021-20230226   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230227   clang
x86_64                        randconfig-a001   clang
x86_64               randconfig-a002-20230227   clang
x86_64                        randconfig-a002   gcc  
x86_64               randconfig-a003-20230227   clang
x86_64                        randconfig-a003   clang
x86_64               randconfig-a004-20230227   clang
x86_64                        randconfig-a004   gcc  
x86_64               randconfig-a005-20230227   clang
x86_64                        randconfig-a005   clang
x86_64               randconfig-a006-20230227   clang
x86_64                        randconfig-a006   gcc  
x86_64               randconfig-a011-20230227   gcc  
x86_64                        randconfig-a011   gcc  
x86_64               randconfig-a012-20230227   gcc  
x86_64                        randconfig-a012   clang
x86_64               randconfig-a013-20230227   gcc  
x86_64                        randconfig-a013   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64                        randconfig-a014   clang
x86_64               randconfig-a015-20230227   gcc  
x86_64                        randconfig-a015   gcc  
x86_64               randconfig-a016-20230227   gcc  
x86_64                        randconfig-a016   clang
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230226   gcc  
xtensa               randconfig-r001-20230226   gcc  
xtensa               randconfig-r002-20230226   gcc  
xtensa               randconfig-r015-20230226   gcc  
xtensa               randconfig-r032-20230226   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
