Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD585EED54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 07:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdMl26Y5Wz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 15:45:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RL3lR2iz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RL3lR2iz;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdMkN19LKz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 15:44:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664430268; x=1695966268;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Bl+/TwPV7FDCGpXRbTkGgUFtGaeio6fuCXAIrios2Fg=;
  b=RL3lR2izlhJq8EJVw7IRJwS+PZTRGtPCtnfHhPOmZYdxpQOTylSnMwe0
   P2KZ62sD7kDpODlLiKUMtjYL75Qz5NCrb6gonddQOCY5qygbOynGg5lrl
   gSQL8M62FN8Ch4AaF/3IwyQQ7X7ZWF7fyhnnAd840vtSE81qMYN/szlxv
   xWAf5LmChed15jHFAaofW6pCWNV44fQI1OFT6Mbp/GwkvDzgMoLH8wBj9
   5+YT24XpYxrLjgdb+GkcTNUUBUqoX85ZB0O5JGYKLM7lurEsY6U9xOzJK
   AUcnFdkmQKyb8EQCeZ/Xoi7wNAsEZy+FNPtl9RbUQcPIIwym5zG1vspGq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="288962847"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="288962847"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2022 22:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="599858575"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="599858575"
Received: from lkp-server01.sh.intel.com (HELO 6126f2790925) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2022 22:44:04 -0700
Received: from kbuild by 6126f2790925 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1odmL6-0000ek-08;
	Thu, 29 Sep 2022 05:44:04 +0000
Date: Thu, 29 Sep 2022 13:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 335e1a91042764629fbbcd8c7e40379fa3762d35
Message-ID: <63353073.Wl9bDEIXn2qmwnr1%lkp@intel.com>
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
branch HEAD: 335e1a91042764629fbbcd8c7e40379fa3762d35  powerpc: Ignore DSI error caused by the copy/paste instruction

elapsed time: 869m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
um                             i386_defconfig
um                           x86_64_defconfig
arc                              allyesconfig
arc                                 defconfig
alpha                               defconfig
m68k                             allyesconfig
s390                             allmodconfig
m68k                             allmodconfig
s390                                defconfig
x86_64                              defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
i386                                defconfig
x86_64                               rhel-8.3
x86_64                        randconfig-a013
x86_64                        randconfig-a011
s390                             allyesconfig
arc                  randconfig-r043-20220928
x86_64                        randconfig-a015
x86_64                           allyesconfig
x86_64               randconfig-a002-20220926
x86_64               randconfig-a001-20220926
powerpc                           allnoconfig
i386                          randconfig-a001
x86_64               randconfig-a003-20220926
arm                                 defconfig
powerpc                          allmodconfig
i386                          randconfig-a003
mips                             allyesconfig
x86_64               randconfig-a004-20220926
i386                             allyesconfig
x86_64               randconfig-a006-20220926
sh                               allmodconfig
x86_64               randconfig-a005-20220926
i386                          randconfig-a005
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a012
hexagon              randconfig-r045-20220928
hexagon              randconfig-r041-20220928
x86_64                        randconfig-a014
x86_64                        randconfig-a016
riscv                randconfig-r042-20220928
s390                 randconfig-r044-20220928
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
i386                 randconfig-a012-20220926
i386                          randconfig-a002
i386                 randconfig-a016-20220926
i386                          randconfig-a006
i386                 randconfig-a015-20220926
i386                          randconfig-a004
i386                 randconfig-a014-20220926

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
