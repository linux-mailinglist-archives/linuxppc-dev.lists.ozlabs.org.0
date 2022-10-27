Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 540E360EE21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 04:55:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyVfB12gJz3cKX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 13:55:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbjlDL7b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbjlDL7b;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MyVbD5D6Pz3bjm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 13:52:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666839160; x=1698375160;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EMHw2iY1D5syFm2BxD6D7YbxLBNAodmfuWg68HUnLa4=;
  b=dbjlDL7big5lVywTyHomf8PEW30JwnihslBMEOa3B+I5vvRZ0AIHCPLi
   lVR5+qR/KlGfw2ezlMfr2FN7j7CEglGynIjpP1FitFSXIs4lAHaQHPUDw
   RdyORgjKgBcxVg/xxetRbVixFJCsiwZxm/e+Fuk9D5Z3JXecZ7Suh7m6C
   pFZ+PM41MDfKAwHSgdmpM40o3cLt9i0lu4GVcI+MHOFUmkrcjzXeP39kL
   00Z3HuyFIx0R6pd6LkIBcU1ohDLm9BcUHlvmeLY2ZB9hFojoaJbER9e2P
   K9sSNDdRYWP9GGryKWO9YGuJcafy9d40dZQBwoJpm3yBdKoqvlbjPueDy
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="306845171"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="306845171"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2022 19:52:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="701174713"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; 
   d="scan'208";a="701174713"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2022 19:52:30 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ont0P-0008AC-20;
	Thu, 27 Oct 2022 02:52:29 +0000
Date: Thu, 27 Oct 2022 10:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 53c607b08cd6ab06168560e2c830b356a066a13e
Message-ID: <6359f24d.OuvZEQhxYLCvz+Cm%lkp@intel.com>
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
branch HEAD: 53c607b08cd6ab06168560e2c830b356a066a13e  Automatic merge of 'fixes' into merge (2022-10-24 15:06)

elapsed time: 4130m

configs tested: 91
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                          rhel-8.3-func
s390                             allyesconfig
i386                                defconfig
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                           rhel-8.3-syz
alpha                            allyesconfig
x86_64                               rhel-8.3
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
i386                             allyesconfig
arm                                 defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                 randconfig-a015-20221024
i386                 randconfig-a016-20221024
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20221023
arc                  randconfig-r043-20221024
s390                 randconfig-r044-20221024
riscv                randconfig-r042-20221024
i386                 randconfig-a011-20221024
i386                 randconfig-a014-20221024
i386                 randconfig-a012-20221024
i386                 randconfig-a013-20221024
x86_64               randconfig-a014-20221024
x86_64               randconfig-a015-20221024
x86_64               randconfig-a016-20221024
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
x86_64               randconfig-a011-20221024
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20221025
arc                  randconfig-r043-20221026
s390                 randconfig-r044-20221026
riscv                randconfig-r042-20221026
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005

clang tested configs:
x86_64               randconfig-a001-20221024
x86_64               randconfig-a003-20221024
x86_64               randconfig-a002-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a006-20221024
x86_64               randconfig-a004-20221024
i386                 randconfig-a001-20221024
i386                 randconfig-a002-20221024
i386                 randconfig-a005-20221024
i386                 randconfig-a003-20221024
x86_64                        randconfig-a012
i386                 randconfig-a004-20221024
i386                 randconfig-a006-20221024
x86_64                        randconfig-a016
x86_64                        randconfig-a014
s390                 randconfig-r044-20221023
hexagon              randconfig-r041-20221023
riscv                randconfig-r042-20221023
hexagon              randconfig-r045-20221023
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
hexagon              randconfig-r045-20221026
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r041-20221026
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a011

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
