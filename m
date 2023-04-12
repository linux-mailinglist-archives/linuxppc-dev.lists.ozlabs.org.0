Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6F6DE8E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 03:29:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px4rD6YFLz3f6K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 11:29:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k9RiBAEG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k9RiBAEG;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px4qN1pwYz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 11:28:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681262928; x=1712798928;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w6/EpGUzo8SMcribLNXdJFGezYzjuqUVdPXQ8Qs/gEs=;
  b=k9RiBAEG5SsKahnBSpExj9gjdVryXsHcUiYKWmmvOHFh/1CxHgwp87B5
   ttDlqAObHYR+WILqlFPgRGA7MP3oiafkWwsCTbf2ru/5x5iXym5UcW9P2
   dmAxgf73fZ7Yk5XKuBLxBJDwJX7OjUfXVvTkD9dE8y6SD4uPS7sKKKmYw
   ymhTTi5RMGb5yN7uzzri0gn4uA2kC3Uu5Q/Rot2o0lySPI888iIQiHKDo
   LvFq9022H/02BTNqYCmhSbrhjOWK9vO0uYqOK4d3RriyZK8eLFQWDC4AS
   qzRKlk5X483GOFJUX/MFtsNPmF4ULOOHb39VlrqSwV0k3qmPvLlwE8/BB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343779245"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="343779245"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 18:28:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753336778"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="753336778"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2023 18:28:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmPHp-000Wvd-07;
	Wed, 12 Apr 2023 01:28:37 +0000
Date: Wed, 12 Apr 2023 09:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 dbb657a5b3626e8f03770abfe8b5af191f2f7230
Message-ID: <64360910.8z7aoNYYBA+haO2Z%lkp@intel.com>
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
branch HEAD: dbb657a5b3626e8f03770abfe8b5af191f2f7230  .gitignore: Don't ignore .github

elapsed time: 720m

configs tested: 130
configs skipped: 12

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r005-20230409   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r005-20230410   gcc  
alpha                randconfig-r006-20230410   gcc  
alpha                randconfig-r011-20230410   gcc  
alpha                randconfig-r013-20230409   gcc  
alpha                randconfig-r025-20230410   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230410   gcc  
arc                  randconfig-r004-20230409   gcc  
arc                  randconfig-r033-20230410   gcc  
arc                  randconfig-r043-20230409   gcc  
arc                  randconfig-r043-20230410   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r046-20230409   clang
arm                  randconfig-r046-20230410   clang
arm64                            allyesconfig   gcc  
arm64        buildonly-randconfig-r002-20230409   clang
arm64                               defconfig   gcc  
arm64                randconfig-r002-20230409   clang
arm64                randconfig-r012-20230410   gcc  
csky         buildonly-randconfig-r003-20230410   gcc  
csky                                defconfig   gcc  
hexagon      buildonly-randconfig-r006-20230410   clang
hexagon              randconfig-r013-20230410   clang
hexagon              randconfig-r016-20230409   clang
hexagon              randconfig-r041-20230409   clang
hexagon              randconfig-r041-20230410   clang
hexagon              randconfig-r045-20230409   clang
hexagon              randconfig-r045-20230410   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230410   clang
i386                 randconfig-a002-20230410   clang
i386                 randconfig-a003-20230410   clang
i386                 randconfig-a004-20230410   clang
i386                 randconfig-a005-20230410   clang
i386                 randconfig-a006-20230410   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
i386                 randconfig-r002-20230410   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230409   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r022-20230409   gcc  
loongarch            randconfig-r026-20230410   gcc  
loongarch            randconfig-r033-20230409   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r014-20230409   gcc  
m68k                 randconfig-r015-20230409   gcc  
microblaze           randconfig-r015-20230410   gcc  
microblaze           randconfig-r032-20230410   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r016-20230410   clang
mips                 randconfig-r032-20230409   gcc  
mips                 randconfig-r034-20230409   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r006-20230409   gcc  
openrisc     buildonly-randconfig-r006-20230409   gcc  
openrisc             randconfig-r022-20230410   gcc  
parisc       buildonly-randconfig-r002-20230410   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r011-20230409   gcc  
parisc               randconfig-r014-20230410   gcc  
parisc               randconfig-r023-20230410   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r012-20230409   gcc  
powerpc              randconfig-r035-20230409   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r021-20230409   gcc  
riscv                randconfig-r026-20230409   gcc  
riscv                randconfig-r042-20230409   gcc  
riscv                randconfig-r042-20230410   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390         buildonly-randconfig-r005-20230410   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230409   clang
s390                 randconfig-r003-20230410   clang
s390                 randconfig-r044-20230409   gcc  
s390                 randconfig-r044-20230410   gcc  
sh                               allmodconfig   gcc  
sh           buildonly-randconfig-r001-20230410   gcc  
sh           buildonly-randconfig-r004-20230410   gcc  
sh                   randconfig-r005-20230409   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r004-20230410   gcc  
sparc64      buildonly-randconfig-r001-20230409   gcc  
sparc64              randconfig-r003-20230409   gcc  
sparc64              randconfig-r021-20230410   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230410   clang
x86_64               randconfig-a002-20230410   clang
x86_64               randconfig-a003-20230410   clang
x86_64               randconfig-a004-20230410   clang
x86_64               randconfig-a005-20230410   clang
x86_64               randconfig-a006-20230410   clang
x86_64               randconfig-a011-20230410   gcc  
x86_64               randconfig-a012-20230410   gcc  
x86_64               randconfig-a013-20230410   gcc  
x86_64               randconfig-a014-20230410   gcc  
x86_64               randconfig-a015-20230410   gcc  
x86_64               randconfig-a016-20230410   gcc  
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r024-20230410   gcc  
xtensa               randconfig-r036-20230410   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
