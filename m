Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB42647D0C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 05:49:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSz7g5hCyz3bh0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 15:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D8931/TL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D8931/TL;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSz6h3kFlz3bWT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 15:48:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670561292; x=1702097292;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mM4FpneDrLZzRN5AHN0e810rZVcDC1YEcOiSqDSRVxI=;
  b=D8931/TLozjktF98Gt9R3uOodmyShA+oe7CvsUhdPgK6CJSvVeFnJFyL
   7px+BJCAldleO8ReJX1kUBtyyj5gag9Oum5VM2+vIdtlbosiRnBCzPT73
   sBU8tplJDqc+xZTfjahVo/VrJhlCI5k00lkuPjQiUjuKvEH5rm9d+oGqj
   ubgYqhJfQz5DdlL1eJXZphb4GXjWvH5DE+F8EbI3gFDy4qsdxh23HhY78
   FS1sgH1h3u/n6EDxbju4vCqerhWCbWG0tETrpDf1Lb4wGyTUeaGDruCUT
   iWXbolATvmjIEojgg3vZWI8tMUztmca6Iw9lPvIUNxn0vCTmHLLsCsc5D
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="300799449"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="300799449"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 20:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="649432901"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="649432901"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Dec 2022 20:48:03 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3VIo-0001cz-2t;
	Fri, 09 Dec 2022 04:48:02 +0000
Date: Fri, 09 Dec 2022 12:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 f24f21c4122e837fa031cc512a7f20eb8c554c5e
Message-ID: <6392bdc6.+mjbTHbeQY4pCxpt%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: f24f21c4122e837fa031cc512a7f20eb8c554c5e  Merge branch 'topic/objtool' into next

elapsed time: 729m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
m68k                             allyesconfig
um                             i386_defconfig
m68k                             allmodconfig
um                           x86_64_defconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                               rhel-8.3
x86_64                              defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20221207
riscv                randconfig-r042-20221207
i386                                defconfig
s390                 randconfig-r044-20221207
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
ia64                             allmodconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
arm                                 defconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a005
i386                          randconfig-a016
i386                             allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
sh                               allmodconfig
powerpc                          allmodconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
