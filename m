Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A35740770
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 03:08:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IA01MWms;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrNkp6TSPz30Jy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 11:08:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IA01MWms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrNjs4dh7z2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 11:07:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687914481; x=1719450481;
  h=date:from:to:cc:subject:message-id;
  bh=FMSThEVkc4+cPdz/NIz5x2AfkbS8sAjV0zSXN1ENRL4=;
  b=IA01MWmsDdzCmggQCgntVEPWC4oC4DqYwFOaW5xYHfjy48JLRNjbv16j
   bgGl/f+A6s7mBb4YpJYU3wW3xyIU6d2LdICVB9umVNS6C9KqhkSTE5Gxw
   j8SrVkGWiBh8wQf7Kttf0m1QFwyISxErgG9bGHTvIA0AP9AH5g8I9BtLG
   HNUJURQo3z9A69duBJMIZzDWNLgl6YdDM3ujvY/6TLOH/5fDI/ZQ0ZNWl
   RWlXRqj76UdCwzO+1VIBtz129GUM2LOAsASwaRVd2HpA2CkDYrjnYtdpw
   b1wAhVztXIlZK2SdbgBXkr3Qd81eNQC2hdCjcV2p7agRmF9U7hRBLbmCn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="360574466"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="360574466"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 18:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="746448060"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="746448060"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Jun 2023 18:07:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEJeb-000CQF-08;
	Wed, 28 Jun 2023 01:07:29 +0000
Date: Wed, 28 Jun 2023 09:07:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 034451183057cb1f6d0089f86214a8f8171bcaca
Message-ID: <202306280910.l69lorTT-lkp@intel.com>
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
branch HEAD: 034451183057cb1f6d0089f86214a8f8171bcaca  Automatic merge of 'next' into merge (2023-06-27 21:47)

elapsed time: 741m

configs tested: 157
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r002-20230627   gcc  
alpha                randconfig-r016-20230627   gcc  
alpha                randconfig-r022-20230627   gcc  
alpha                randconfig-r032-20230627   gcc  
alpha                randconfig-r033-20230627   gcc  
alpha                randconfig-r034-20230627   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r032-20230627   gcc  
arc                  randconfig-r043-20230627   gcc  
arc                        vdk_hs38_defconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                          pxa910_defconfig   gcc  
arm                  randconfig-r006-20230627   clang
arm                  randconfig-r021-20230627   gcc  
arm                  randconfig-r046-20230627   gcc  
arm                       spear13xx_defconfig   clang
arm                           u8500_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r005-20230627   gcc  
arm64                randconfig-r006-20230627   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r001-20230627   clang
hexagon              randconfig-r003-20230627   clang
hexagon              randconfig-r041-20230627   clang
hexagon              randconfig-r045-20230627   clang
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-r004-20230627   gcc  
i386         buildonly-randconfig-r005-20230627   gcc  
i386         buildonly-randconfig-r006-20230627   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-i001-20230627   gcc  
i386                 randconfig-i002-20230627   gcc  
i386                 randconfig-i003-20230627   gcc  
i386                 randconfig-i004-20230627   gcc  
i386                 randconfig-i005-20230627   gcc  
i386                 randconfig-i006-20230627   gcc  
i386                 randconfig-i011-20230627   clang
i386                 randconfig-i012-20230627   clang
i386                 randconfig-i013-20230627   clang
i386                 randconfig-i014-20230627   clang
i386                 randconfig-i015-20230627   clang
i386                 randconfig-i016-20230627   clang
i386                 randconfig-r031-20230627   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r013-20230627   gcc  
m68k                 randconfig-r031-20230627   gcc  
m68k                 randconfig-r033-20230627   gcc  
m68k                 randconfig-r036-20230627   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze           randconfig-r016-20230627   gcc  
microblaze           randconfig-r021-20230627   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                      maltasmvp_defconfig   gcc  
mips                 randconfig-r014-20230627   gcc  
mips                 randconfig-r033-20230627   clang
nios2                               defconfig   gcc  
nios2                randconfig-r013-20230627   gcc  
nios2                randconfig-r014-20230627   gcc  
nios2                randconfig-r025-20230627   gcc  
openrisc             randconfig-r003-20230627   gcc  
openrisc             randconfig-r012-20230627   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r012-20230627   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       eiger_defconfig   gcc  
powerpc                    gamecube_defconfig   clang
powerpc                      makalu_defconfig   gcc  
powerpc              randconfig-r001-20230627   gcc  
powerpc              randconfig-r006-20230627   gcc  
powerpc              randconfig-r012-20230627   clang
powerpc              randconfig-r024-20230627   clang
powerpc              randconfig-r036-20230627   gcc  
powerpc                     redwood_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r004-20230627   gcc  
riscv                randconfig-r015-20230627   clang
riscv                randconfig-r026-20230627   clang
riscv                randconfig-r035-20230627   gcc  
riscv                randconfig-r042-20230627   clang
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r001-20230627   gcc  
s390                 randconfig-r015-20230627   clang
s390                 randconfig-r026-20230627   clang
s390                 randconfig-r035-20230627   gcc  
s390                 randconfig-r044-20230627   clang
sh                               allmodconfig   gcc  
sh                   randconfig-r004-20230627   gcc  
sh                   randconfig-r011-20230627   gcc  
sh                   randconfig-r022-20230627   gcc  
sh                   randconfig-r034-20230627   gcc  
sh                          sdk7786_defconfig   gcc  
sh                           se7705_defconfig   gcc  
sh                           sh2007_defconfig   gcc  
sh                            titan_defconfig   gcc  
sh                              ul2_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc64              randconfig-r023-20230627   gcc  
sparc64              randconfig-r024-20230627   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                   randconfig-r004-20230627   clang
um                   randconfig-r031-20230627   clang
um                           x86_64_defconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-r001-20230627   gcc  
x86_64       buildonly-randconfig-r002-20230627   gcc  
x86_64       buildonly-randconfig-r003-20230627   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-r005-20230627   gcc  
x86_64               randconfig-r013-20230627   clang
x86_64               randconfig-x001-20230627   clang
x86_64               randconfig-x002-20230627   clang
x86_64               randconfig-x003-20230627   clang
x86_64               randconfig-x004-20230627   clang
x86_64               randconfig-x005-20230627   clang
x86_64               randconfig-x006-20230627   clang
x86_64               randconfig-x011-20230627   gcc  
x86_64               randconfig-x012-20230627   gcc  
x86_64               randconfig-x013-20230627   gcc  
x86_64               randconfig-x014-20230627   gcc  
x86_64               randconfig-x015-20230627   gcc  
x86_64               randconfig-x016-20230627   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                       common_defconfig   gcc  
xtensa               randconfig-r002-20230627   gcc  
xtensa               randconfig-r015-20230627   gcc  
xtensa               randconfig-r036-20230627   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
