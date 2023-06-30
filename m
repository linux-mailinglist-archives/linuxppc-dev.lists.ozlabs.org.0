Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8777440F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 19:13:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CeKkK0vM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qt2350q0Zz3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 03:13:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CeKkK0vM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qt2283Ss9z3bmj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 03:12:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688145168; x=1719681168;
  h=date:from:to:cc:subject:message-id;
  bh=4kIcLAKepbqKLwgVyVX9CVPtR2+nxG7NYqqcDXaH4AQ=;
  b=CeKkK0vMsFvzaJoSgeKFXo7T/ekuYrDyx0BWewECSFl7tIo0Tr4ieOSa
   gmLPI3Yafhz3jALYdv+xxPC6Ae1f2lemNElgCidSwGNuxvhq6Gz2mrtkI
   tpg34HUt289PFH0AfoNjca3tDRF7WtskgCCKmmpTW4zt1ojTGO1C1yOQS
   eE5bjo4peCShCKqFhR8FFinZXmHf8W0VR44UMfqDlj+WsKF5pOxTdOfx0
   viM3hyT1J0UkpbZriP660bghJB/j2EKCS0e5C8/UpCaec/tURT1TC8c2I
   oklBf50ujVCwVia7j5PQasU5jNGc7isuaU8BhoOdrRwkHwwm1JrajbBzB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="362487888"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="362487888"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 10:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="862357496"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="862357496"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2023 10:12:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFHfg-000FBf-28;
	Fri, 30 Jun 2023 17:12:36 +0000
Date: Sat, 01 Jul 2023 01:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/cpu-smt] BUILD SUCCESS
 0d882f835c76e5b4e1c7a22443ce85e096cf2be8
Message-ID: <202307010121.p8vdhnNO-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/cpu-smt
branch HEAD: 0d882f835c76e5b4e1c7a22443ce85e096cf2be8  powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs

elapsed time: 721m

configs tested: 106
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r024-20230630   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230630   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r004-20230629   clang
arm                  randconfig-r046-20230630   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230630   clang
hexagon              randconfig-r045-20230630   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230629   gcc  
i386         buildonly-randconfig-r005-20230629   gcc  
i386         buildonly-randconfig-r006-20230629   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230629   gcc  
i386                 randconfig-i002-20230629   gcc  
i386                 randconfig-i003-20230629   gcc  
i386                 randconfig-i004-20230629   gcc  
i386                 randconfig-i005-20230629   gcc  
i386                 randconfig-i006-20230629   gcc  
i386                 randconfig-i011-20230629   clang
i386                 randconfig-i012-20230629   clang
i386                 randconfig-i013-20230629   clang
i386                 randconfig-i014-20230629   clang
i386                 randconfig-i015-20230629   clang
i386                 randconfig-i016-20230629   clang
i386                 randconfig-r025-20230630   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r026-20230630   gcc  
m68k                 randconfig-r035-20230629   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r001-20230629   clang
mips                 randconfig-r014-20230630   gcc  
nios2                               defconfig   gcc  
openrisc             randconfig-r015-20230630   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc              randconfig-r006-20230629   gcc  
powerpc              randconfig-r032-20230629   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230630   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230629   gcc  
s390                 randconfig-r011-20230630   clang
s390                 randconfig-r044-20230630   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r033-20230629   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r013-20230630   gcc  
sparc                randconfig-r031-20230629   gcc  
sparc64              randconfig-r002-20230629   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r016-20230630   gcc  
um                   randconfig-r034-20230629   clang
um                   randconfig-r036-20230629   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230629   gcc  
x86_64       buildonly-randconfig-r002-20230629   gcc  
x86_64       buildonly-randconfig-r003-20230629   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-x001-20230629   clang
x86_64               randconfig-x002-20230629   clang
x86_64               randconfig-x003-20230629   clang
x86_64               randconfig-x004-20230629   clang
x86_64               randconfig-x005-20230629   clang
x86_64               randconfig-x006-20230629   clang
x86_64               randconfig-x011-20230629   gcc  
x86_64               randconfig-x012-20230629   gcc  
x86_64               randconfig-x013-20230629   gcc  
x86_64               randconfig-x014-20230629   gcc  
x86_64               randconfig-x015-20230629   gcc  
x86_64               randconfig-x016-20230629   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa               randconfig-r003-20230629   gcc  
xtensa               randconfig-r022-20230630   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
