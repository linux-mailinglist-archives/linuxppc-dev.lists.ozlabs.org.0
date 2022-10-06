Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C65B45F5E29
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 03:06:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjYDW4gMsz3cSh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 12:06:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wy//Ur/7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wy//Ur/7;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjYCX48hLz2xWx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 12:05:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665018344; x=1696554344;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZKp3QogwrA2fFQFwZlcPnjs6Zbb1iGvjlvUeKcAXzvQ=;
  b=Wy//Ur/7LVB53zMal8s9h7/YSChGi+LEUgGTWkkI1nWkVBXUNf0oQkMq
   grfGT6wuq53HL3aw9XHXFB1PJEXzDCuV0bw76SGNomoiGvgJbF+Ji7nrZ
   sXMMVhIQo0CwUbJ04JxORjn90Gf43w10TF08vND/hKudxcb1K4TYEXopy
   GUU3wF4RklwzfuH6CJfnYZHsP59nM7vSLGLVKisXWmceip4Lz6W6FNAvJ
   4PYDgB9A2YGOWRfHAUNE6YQTaiCN0YYioeMsA5wN+zwdgA7asvlrIY2PO
   XsrHVO+Eu6K686uvxUmmnX3Xg3LrSxGpJiimpouCIZAq0Qzj0jwyFyb5k
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="304892670"
X-IronPort-AV: E=Sophos;i="5.95,162,1661842800"; 
   d="scan'208";a="304892670"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 18:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="693140008"
X-IronPort-AV: E=Sophos;i="5.95,162,1661842800"; 
   d="scan'208";a="693140008"
Received: from lkp-server01.sh.intel.com (HELO d4f44333118a) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2022 18:05:38 -0700
Received: from kbuild by d4f44333118a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ogFKU-0001l6-0n;
	Thu, 06 Oct 2022 01:05:38 +0000
Date: Thu, 06 Oct 2022 09:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 18e4cc8b62fda447da3e713891c9196d47239cca
Message-ID: <633e29cf.x1er68jYSfjQgpx1%lkp@intel.com>
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
branch HEAD: 18e4cc8b62fda447da3e713891c9196d47239cca  Merge branch 'next' into merge

elapsed time: 720m

configs tested: 67
configs skipped: 4

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
x86_64                              defconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
s390                                defconfig
s390                             allmodconfig
i386                                defconfig
sh                               allmodconfig
i386                 randconfig-a011-20221003
x86_64                          rhel-8.3-func
i386                 randconfig-a012-20221003
x86_64                    rhel-8.3-kselftests
i386                 randconfig-a013-20221003
i386                 randconfig-a015-20221003
mips                             allyesconfig
i386                 randconfig-a016-20221003
m68k                             allmodconfig
powerpc                          allmodconfig
i386                             allyesconfig
arc                              allyesconfig
s390                             allyesconfig
x86_64                           allyesconfig
i386                 randconfig-a014-20221003
alpha                            allyesconfig
x86_64               randconfig-a011-20221003
x86_64               randconfig-a014-20221003
arm                                 defconfig
m68k                             allyesconfig
x86_64               randconfig-a012-20221003
x86_64               randconfig-a013-20221003
x86_64               randconfig-a015-20221003
x86_64               randconfig-a016-20221003
ia64                             allmodconfig
arm64                            allyesconfig
arm                              allyesconfig
riscv                randconfig-r042-20221003
arc                  randconfig-r043-20221003
arc                  randconfig-r043-20221002
s390                 randconfig-r044-20221003
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig

clang tested configs:
x86_64               randconfig-a003-20221003
x86_64               randconfig-a002-20221003
x86_64               randconfig-a001-20221003
x86_64               randconfig-a004-20221003
x86_64               randconfig-a005-20221003
i386                 randconfig-a003-20221003
hexagon              randconfig-r041-20221003
riscv                randconfig-r042-20221002
i386                 randconfig-a002-20221003
hexagon              randconfig-r041-20221002
x86_64               randconfig-a006-20221003
i386                 randconfig-a001-20221003
i386                 randconfig-a004-20221003
i386                 randconfig-a005-20221003
hexagon              randconfig-r045-20221002
hexagon              randconfig-r045-20221003
s390                 randconfig-r044-20221002
i386                 randconfig-a006-20221003

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
