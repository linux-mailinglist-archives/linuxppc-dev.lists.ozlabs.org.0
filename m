Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E868573631B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 07:19:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U8ByWK1y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlZh35Ncpz3bWc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 15:19:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U8ByWK1y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlZg94zTPz2ys4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 15:18:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687238341; x=1718774341;
  h=date:from:to:cc:subject:message-id;
  bh=vOi8kUL9aYU4nVu2rRa/3jnIJsS06iyh5+hOyo601os=;
  b=U8ByWK1y4NIO6kXTF78yqIVvX+7cw9OBfs/VXLF9+WRigBcjLlfcHyT8
   Gozt4P45amwX0ILNnMqwOqB//4gzixdCuQyh1DRUEvC3f0J7VxHvsS0bG
   282QrQzUR52ZXqmCzHvyOI40iuDRQlIWRw+RCogZ3Co30ycChqL93VfJb
   qZXwARwclMe6mnr4//4Oq9xMY0YwXhhUB/Iz5aKEJpkGvnEkMhueMdSCw
   sBJ1wrtdHHSj/utHDUrvL08+/MyYSlDiHNyL6SB9B8v7maqr5lN/FVovB
   3zylKrvGnB9CNU2Sp8HZSomPYK8PNu7cNVODZEVFwMIxHCKKG7PBKrC+k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="339382575"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="339382575"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 22:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="779244018"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="779244018"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jun 2023 22:18:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBTlW-0005X5-2i;
	Tue, 20 Jun 2023 05:18:54 +0000
Date: Tue, 20 Jun 2023 13:17:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 b684c09f09e7a6af3794d4233ef785819e72db79
Message-ID: <202306201353.W03MVCy0-lkp@intel.com>
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
branch HEAD: b684c09f09e7a6af3794d4233ef785819e72db79  powerpc: update ppc_save_regs to save current r1 in pt_regs

elapsed time: 732m

configs tested: 143
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r001-20230619   gcc  
alpha                randconfig-r004-20230619   gcc  
alpha                randconfig-r014-20230619   gcc  
alpha                randconfig-r035-20230619   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r001-20230619   gcc  
arc                  randconfig-r023-20230619   gcc  
arc                  randconfig-r043-20230619   gcc  
arc                    vdk_hs38_smp_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                          gemini_defconfig   gcc  
arm                  randconfig-r002-20230619   clang
arm                  randconfig-r015-20230619   gcc  
arm                  randconfig-r046-20230619   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r023-20230619   clang
arm64                randconfig-r031-20230619   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r016-20230619   gcc  
csky                 randconfig-r025-20230619   gcc  
hexagon              randconfig-r041-20230619   clang
hexagon              randconfig-r045-20230619   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230619   gcc  
i386         buildonly-randconfig-r005-20230619   gcc  
i386         buildonly-randconfig-r006-20230619   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230619   gcc  
i386                 randconfig-i002-20230619   gcc  
i386                 randconfig-i003-20230619   gcc  
i386                 randconfig-i004-20230619   gcc  
i386                 randconfig-i005-20230619   gcc  
i386                 randconfig-i006-20230619   gcc  
i386                 randconfig-i011-20230619   clang
i386                 randconfig-i012-20230619   clang
i386                 randconfig-i013-20230619   clang
i386                 randconfig-i014-20230619   clang
i386                 randconfig-i015-20230619   clang
i386                 randconfig-i016-20230619   clang
i386                 randconfig-r002-20230619   gcc  
i386                 randconfig-r006-20230619   gcc  
i386                 randconfig-r012-20230619   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230619   gcc  
loongarch            randconfig-r012-20230619   gcc  
loongarch            randconfig-r015-20230619   gcc  
loongarch            randconfig-r022-20230619   gcc  
loongarch            randconfig-r036-20230619   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r006-20230619   gcc  
m68k                 randconfig-r013-20230619   gcc  
m68k                 randconfig-r026-20230619   gcc  
m68k                 randconfig-r034-20230619   gcc  
microblaze           randconfig-r003-20230619   gcc  
microblaze           randconfig-r031-20230619   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r015-20230619   gcc  
mips                 randconfig-r016-20230619   gcc  
mips                 randconfig-r022-20230619   gcc  
mips                 randconfig-r026-20230619   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r003-20230619   gcc  
nios2                randconfig-r004-20230619   gcc  
nios2                randconfig-r011-20230619   gcc  
nios2                randconfig-r015-20230619   gcc  
openrisc             randconfig-r003-20230619   gcc  
openrisc             randconfig-r013-20230619   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r001-20230619   gcc  
parisc               randconfig-r002-20230619   gcc  
parisc               randconfig-r004-20230619   gcc  
parisc               randconfig-r021-20230619   gcc  
parisc               randconfig-r035-20230619   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r013-20230619   clang
powerpc                     taishan_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r011-20230619   clang
riscv                randconfig-r042-20230619   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r032-20230619   gcc  
s390                 randconfig-r044-20230619   clang
sh                               allmodconfig   gcc  
sh                         microdev_defconfig   gcc  
sh                   randconfig-r011-20230619   gcc  
sh                   randconfig-r012-20230619   gcc  
sh                   randconfig-r024-20230619   gcc  
sh                   randconfig-r034-20230619   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r003-20230619   gcc  
sparc64              randconfig-r005-20230619   gcc  
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r011-20230619   gcc  
um                   randconfig-r033-20230619   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230619   gcc  
x86_64       buildonly-randconfig-r002-20230619   gcc  
x86_64       buildonly-randconfig-r003-20230619   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230619   gcc  
x86_64               randconfig-a002-20230619   gcc  
x86_64               randconfig-a003-20230619   gcc  
x86_64               randconfig-a004-20230619   gcc  
x86_64               randconfig-a005-20230619   gcc  
x86_64               randconfig-a006-20230619   gcc  
x86_64               randconfig-a011-20230619   clang
x86_64               randconfig-a012-20230619   clang
x86_64               randconfig-a013-20230619   clang
x86_64               randconfig-a014-20230619   clang
x86_64               randconfig-a015-20230619   clang
x86_64               randconfig-a016-20230619   clang
x86_64               randconfig-r005-20230619   gcc  
x86_64               randconfig-r014-20230619   clang
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r005-20230619   gcc  
xtensa               randconfig-r021-20230619   gcc  
xtensa               randconfig-r024-20230619   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
