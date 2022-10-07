Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97A5F72AC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 04:05:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkBVD37qgz3dsr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 13:05:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d3vs7EQI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d3vs7EQI;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkBTF1hvcz2yhy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 13:04:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665108289; x=1696644289;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2rEwu2+y8z7MBWV886m9lqgWQuvCVfmqEEJl1F/UXDA=;
  b=d3vs7EQIVm4ew3vALumUd7zFdpQ8mG3kf99cwYaqR8JoTPRusWn11hkK
   P6DRR4J/uOOVHSxDhe3rNcFic5CofUxbgwNaAYBZaoZDoP2HSbCUTwiXk
   sJky8Ja/AWXXjfor1aEetKE6Wb6mJeHrttwBL1dTpgtVSfA8JU3WspPgl
   Km/sjCz06AVGlwi/p1MM5DO5PtIPCs4lUJUWnlj2wvHncqeuUWyR0Ea25
   1Qbdx+CewaquQnur7jN3LxXFsK2e5BAi+BVpGc6FofVy1chPjKbkYydP/
   bPM0X9+tVNTS7apTZuSG4RGCTPVhh7DLrIXtOWuF7bJB2yfKXZ6BFqPp/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="302347662"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="302347662"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2022 19:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10492"; a="576059903"
X-IronPort-AV: E=Sophos;i="5.95,164,1661842800"; 
   d="scan'208";a="576059903"
Received: from lkp-server01.sh.intel.com (HELO 3c15167049b7) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Oct 2022 19:03:58 -0700
Received: from kbuild by 3c15167049b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ogciU-0000fE-0g;
	Fri, 07 Oct 2022 02:03:58 +0000
Date: Fri, 07 Oct 2022 10:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 94746890202cf18e5266b4de77895243e55b0a79
Message-ID: <633f88ee.ApN6znz9bS8V5Jnq%lkp@intel.com>
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
branch HEAD: 94746890202cf18e5266b4de77895243e55b0a79  powerpc: Don't add __powerpc_ prefix to syscall entry points

elapsed time: 720m

configs tested: 67
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
um                             i386_defconfig
s390                             allmodconfig
um                           x86_64_defconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
arm                                 defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
i386                 randconfig-a011-20221003
i386                 randconfig-a012-20221003
powerpc                           allnoconfig
i386                 randconfig-a013-20221003
i386                 randconfig-a015-20221003
x86_64               randconfig-a011-20221003
i386                 randconfig-a016-20221003
x86_64               randconfig-a012-20221003
i386                 randconfig-a014-20221003
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64               randconfig-a013-20221003
x86_64                           allyesconfig
x86_64               randconfig-a015-20221003
x86_64               randconfig-a016-20221003
x86_64               randconfig-a014-20221003
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
i386                                defconfig
arm64                            allyesconfig
arm                              allyesconfig
sh                               allmodconfig
riscv                randconfig-r042-20221003
mips                             allyesconfig
arc                  randconfig-r043-20221003
powerpc                          allmodconfig
arc                               allnoconfig
i386                             allyesconfig
arc                  randconfig-r043-20221002
alpha                             allnoconfig
s390                 randconfig-r044-20221003
riscv                             allnoconfig
csky                              allnoconfig
ia64                             allmodconfig
alpha                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
m68k                             allyesconfig

clang tested configs:
x86_64               randconfig-a005-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a001-20221003
hexagon              randconfig-r041-20221003
x86_64               randconfig-a002-20221003
riscv                randconfig-r042-20221002
x86_64               randconfig-a003-20221003
x86_64               randconfig-a006-20221003
hexagon              randconfig-r041-20221002
s390                 randconfig-r044-20221002
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221003
i386                 randconfig-a006-20221003
i386                 randconfig-a003-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a004-20221003
i386                 randconfig-a002-20221003
i386                 randconfig-a005-20221003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
