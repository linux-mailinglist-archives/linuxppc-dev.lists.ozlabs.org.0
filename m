Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C802637031
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 03:02:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHh8q0jHGz3dvl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 13:02:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C5kXGyMm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C5kXGyMm;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHh7t2psTz2yxc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 13:01:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669255322; x=1700791322;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nSyYUSEFgepXgnGtfO4QmB4xpiEvXJ6n4WtBOFSO3N8=;
  b=C5kXGyMmOmpHeYD5Vb9HNlZ/Mx01iIDWWSqUDPQoFLqY36V/TjV9B55r
   O+A5UfsJNZN20ocEl+CGP9cuvxj6KRw1Ja86/3f4bL0cyapwCHfU2tfG3
   yAOjwnrvg562iJAskz3yv7jInybtF786NE8JQByh3g5nSqjoJjpc6f/TE
   hZTxAq1UnOlXI6uRwKERSpamUkg0AG7arT96UKpYkKCDMNrE+50F6CXo4
   onzBAg6z5Hcz1aEKBZKbapHylrfKe/WILI8FUuTbWEKNZ4F2bo58rRbcU
   Q/giX0ruYa74kYxsbZQP3BqtPffr+Q3I5dgpwZPyXyOIw9A3Xnd7HHUPa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="378455247"
X-IronPort-AV: E=Sophos;i="5.96,189,1665471600"; 
   d="scan'208";a="378455247"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 18:01:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="705571089"
X-IronPort-AV: E=Sophos;i="5.96,189,1665471600"; 
   d="scan'208";a="705571089"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Nov 2022 18:01:49 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oy1Yi-0003N3-0U;
	Thu, 24 Nov 2022 02:01:48 +0000
Date: Thu, 24 Nov 2022 10:01:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 409ecd2dbb26f16b778803e8ce148a61aa6418d3
Message-ID: <637ed062.lZLxsCQceaIg0zCF%lkp@intel.com>
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
branch HEAD: 409ecd2dbb26f16b778803e8ce148a61aa6418d3  Automatic merge of 'master' into merge (2022-11-23 21:27)

elapsed time: 730m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
um                             i386_defconfig
s390                                defconfig
um                           x86_64_defconfig
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
i386                                defconfig
x86_64               randconfig-a012-20221121
x86_64               randconfig-a011-20221121
x86_64               randconfig-a015-20221121
x86_64               randconfig-a013-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
i386                             allyesconfig
arc                  randconfig-r043-20221120
arc                  randconfig-r043-20221121
s390                 randconfig-r044-20221121
riscv                randconfig-r042-20221121
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a004-20221121
x86_64               randconfig-a006-20221121
x86_64               randconfig-a005-20221121
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
i386                 randconfig-a004-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120
i386                 randconfig-a003-20221121
i386                 randconfig-a001-20221121
i386                 randconfig-a002-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a006-20221121

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
