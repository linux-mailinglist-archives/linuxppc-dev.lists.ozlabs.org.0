Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD649639D93
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:24:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL3774Ncdz3f5K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 09:24:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gA5/SMo3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gA5/SMo3;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL34B25sVz2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 09:21:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669587722; x=1701123722;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LYkk9DuO2BlasFQhCOcebWhMgrb9PyY2Qav1ivQP070=;
  b=gA5/SMo3KOngBi5VCqiEATmGaBdekBRCFFdjGe8LvpcAduOSrnNP92/E
   I84vcK1PclG5ipSX0btH0kndf3ovqnggNzjGFuPCHmt2IpMFrjGhjMr4M
   68/J8ksXWtXYOCLxfgcf+iRSm4zPn1rZM+otE3QI2O0s3VagElraazaOd
   pXbrAAHQvR3oA4vIUip5v21AWS7vlesU5Td1fLzZFL0XDn84i0hoJOTKL
   YccmBBb0r1HpoRKTQc6ZgWPWgjp4JdguHvHZiVOUxY809irk6x2I4XnLf
   gAOuNpEvaHxQr2Dzjro9g+15pfbvibeufVoMPyuJU/yY6LVEA909KzyEW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="314747228"
X-IronPort-AV: E=Sophos;i="5.96,199,1665471600"; 
   d="scan'208";a="314747228"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2022 14:21:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="645280320"
X-IronPort-AV: E=Sophos;i="5.96,199,1665471600"; 
   d="scan'208";a="645280320"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Nov 2022 14:21:54 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ozQ25-0007RY-1Q;
	Sun, 27 Nov 2022 22:21:53 +0000
Date: Mon, 28 Nov 2022 06:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 2e7ec190a0e38aaa8a6d87fd5f804ec07947febc
Message-ID: <6383e2f6.lFB4ca1GiHgyYZQz%lkp@intel.com>
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
branch HEAD: 2e7ec190a0e38aaa8a6d87fd5f804ec07947febc  powerpc/64s: Add missing declaration for machine_check_early_boot()

elapsed time: 746m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a011
x86_64                        randconfig-a015
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
i386                          randconfig-a001
s390                             allmodconfig
x86_64                              defconfig
alpha                               defconfig
i386                          randconfig-a003
sh                               allmodconfig
i386                                defconfig
powerpc                          allmodconfig
x86_64                        randconfig-a006
i386                          randconfig-a016
mips                             allyesconfig
ia64                             allmodconfig
s390                                defconfig
i386                          randconfig-a005
i386                          randconfig-a012
s390                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                          randconfig-a014
arc                  randconfig-r043-20221127
m68k                             allmodconfig
powerpc                           allnoconfig
arc                              allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a002
alpha                            allyesconfig
riscv                randconfig-r042-20221127
m68k                             allyesconfig
x86_64                        randconfig-a004
s390                 randconfig-r044-20221127
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a012
x86_64                        randconfig-a016
hexagon              randconfig-r045-20221127
hexagon              randconfig-r041-20221127
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a015
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a011
x86_64                        randconfig-a001
x86_64                        randconfig-a003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
