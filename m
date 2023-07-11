Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A62274E37A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 03:35:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hNye5egA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0NjW1NC1z3c7K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 11:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hNye5egA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0Nhc54CWz3Wtq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 11:34:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689039280; x=1720575280;
  h=date:from:to:cc:subject:message-id;
  bh=FrcqWQN4taXF4Or1rklcGeNlrbNHH8R12qCVTBeqzWs=;
  b=hNye5egAwtPyUuaee5BBJx93GYmIRqLlzeyvcMK2bm+xITWFy13CFILG
   DoYo7nXJM0WTk8kU7icvaJazMWYVCHU8b7H/zHTxAuZkgP/9Ho6XgUBnU
   f5Ey0kf9Acp1FbdalIA6YogQf7wU2eN4vznP5mbBPIDBa6lVqcBMapKU4
   UmiXZ+wG8cV4kkyObsTg5X02d+Z0Kt4PLEt6SCenBNjy8Dtd1JH88cOFL
   os2CPQnpBjL1iUng807ItrZ8YOxoo7R4J6mAukH4zFpGNcOVroaLkq/yZ
   BjveE4FJp8FtTRsvfmzEe+WlFVQUUvg/BGutFTzXkx0meeCk/FKKivBKC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367996699"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="367996699"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 18:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="1051583991"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="1051583991"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jul 2023 18:34:35 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ2Gw-0004Aa-1U;
	Tue, 11 Jul 2023 01:34:34 +0000
Date: Tue, 11 Jul 2023 09:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 cf53564b11cef5cdfafc548b172345c9aa753f89
Message-ID: <202307110910.5B2cFcop-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: cf53564b11cef5cdfafc548b172345c9aa753f89  powerpc/mm/book3s64/hash/4k: Add pmd_same callback for 4K page size

elapsed time: 1249m

configs tested: 51
configs skipped: 179

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                          collie_defconfig   clang
arm                                 defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230710   clang
hexagon              randconfig-r045-20230710   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                          ath25_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                        cell_defconfig   gcc  
powerpc                    ge_imp3a_defconfig   clang
powerpc                       maple_defconfig   gcc  
powerpc                 mpc832x_rdb_defconfig   clang
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      ppc40x_defconfig   gcc  
powerpc              randconfig-r004-20230710   gcc  
powerpc              randconfig-r006-20230710   gcc  
powerpc              randconfig-r026-20230710   clang
powerpc                     sequoia_defconfig   gcc  
powerpc                     skiroot_defconfig   clang
powerpc                 xes_mpc85xx_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230710   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                 randconfig-r044-20230710   clang
sh                 kfr2r09-romimage_defconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
x86_64                                  kexec   gcc  
xtensa                  nommu_kc705_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
