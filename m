Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ADD639D91
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:22:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL35649SDz3f3L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 09:22:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ATifqyOD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ATifqyOD;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL34B4wZJz3cCn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 09:21:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669587722; x=1701123722;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VmhbrH0s9mu4DWC5rFbJsvW9R/5a7gg2fbgP4LAQvqI=;
  b=ATifqyODvJB82G7OLkWr/o3UR1IRC+5b7HaddMgQkO9Wki1pTESOw9+J
   CA0+b1IflgsTfQbAEiK2IFOblVrzab7Ukm0S9kGNayqQMpCYVZCT8f066
   86rzBDVIdOKPSYUzIcjnnieDuspJV6JFoo0eComR3cbIlmVLJZP9KJ4ub
   Ln5wqYW6ytjn9hRKw4z2M4E+DQ487NWuLhvFMpZ1qhp4ZLzPI1jgXVUKC
   sq4A8BsM1MYow6pw+oqv61QJokhehuHPjCF8cAyf6i5ke9vC9Hcab8lfC
   wYJrR9hwGjS0ydkYlogOnYy27tbQ29alNfQZvoxCz0GpAy8opDeNjFRet
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="316539539"
X-IronPort-AV: E=Sophos;i="5.96,199,1665471600"; 
   d="scan'208";a="316539539"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2022 14:21:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10544"; a="888202893"
X-IronPort-AV: E=Sophos;i="5.96,199,1665471600"; 
   d="scan'208";a="888202893"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Nov 2022 14:21:54 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ozQ25-0007RP-12;
	Sun, 27 Nov 2022 22:21:53 +0000
Date: Mon, 28 Nov 2022 06:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 4eef1c9ccd19132c34fd55e79b104ace87ff09d4
Message-ID: <6383e2fc.xyKZI8QwB9zPHH2J%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 4eef1c9ccd19132c34fd55e79b104ace87ff09d4  selftests/powerpc: Account for offline cpus in perf-hwbreak test

elapsed time: 743m

configs tested: 58
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a004
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a002
x86_64                          rhel-8.3-func
um                           x86_64_defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a013
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                              defconfig
i386                                defconfig
i386                          randconfig-a014
sh                               allmodconfig
arc                  randconfig-r043-20221127
i386                          randconfig-a001
riscv                randconfig-r042-20221127
x86_64                        randconfig-a015
x86_64                           allyesconfig
i386                          randconfig-a003
i386                          randconfig-a005
s390                 randconfig-r044-20221127
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
s390                                defconfig
i386                          randconfig-a016
s390                             allmodconfig
i386                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
s390                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221127
hexagon              randconfig-r041-20221127
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a004
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a014
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
