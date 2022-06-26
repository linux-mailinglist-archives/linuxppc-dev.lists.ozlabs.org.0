Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA155B238
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 15:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWBY15TWqz3dpk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 23:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T8Z605EM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T8Z605EM;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWBWk35tXz3bkv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 23:28:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656250114; x=1687786114;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=E5nOIDIGZIW5NfscF/6SDxYDD3aGCwCF43oCZkteP0I=;
  b=T8Z605EMFsMihWjq2c5LHD08/fPf8ys7j26JbBkT/QaltqUCkkiGQCY+
   J9kTmekjdpFoO7V6dA1u8GtgAJe8sn/IDfWHXhJ8vZNzFJ/647vI0TTHe
   tzh3sVbeiZ215YvVH9rTGVQdhTqj5jh7FF24Whx037F0Ogf7VRdOjC1Uw
   8SyWVD1bK8zh/Bi5Sy45ZrvDUdG9lTfIhGesE374YBOSiXCc3LvjkW7S8
   afDwdxRGSyJK29M5V/rafi1+yvCdulBlkadE+Q1kfXnoW9z/kJ3wI2Zdp
   /aKZK8WTGyufAHmHeuFLSFqWOMK0Dt0rqzRAWfjzzjSetnrRZOLgJIT4z
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="261086355"
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; 
   d="scan'208";a="261086355"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2022 06:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,224,1650956400"; 
   d="scan'208";a="679193745"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2022 06:28:14 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5SJC-0007Kf-3n;
	Sun, 26 Jun 2022 13:28:14 +0000
Date: Sun, 26 Jun 2022 21:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 f85bb0e4405d64c657c3b10ca134bc8fff9afaaa
Message-ID: <62b85ee4.wI+oJ/gqFiaePExj%lkp@intel.com>
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
branch HEAD: f85bb0e4405d64c657c3b10ca134bc8fff9afaaa  Automatic merge of 'fixes' into merge (2022-06-26 10:40)

elapsed time: 720m

configs tested: 52
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
ia64                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                                defconfig
i386                             allyesconfig
m68k                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
x86_64                        randconfig-a011
i386                          randconfig-a016
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a006
arc                  randconfig-r043-20220626
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a013
i386                          randconfig-a011
x86_64                        randconfig-a005
hexagon              randconfig-r041-20220626
hexagon              randconfig-r045-20220626
riscv                randconfig-r042-20220626
s390                 randconfig-r044-20220626

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
