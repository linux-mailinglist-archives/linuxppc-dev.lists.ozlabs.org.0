Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB764213A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 02:50:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQRMR1YPxz3cGD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 12:50:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xp7sHNu0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xp7sHNu0;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQRKR0D1Kz3bT0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 12:48:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670204923; x=1701740923;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FHCoCfNN+Jbtz4pRKBmMej/xAQRYfIoctYu7FN+DKgw=;
  b=Xp7sHNu0hXXF2CgTM3UJrhlmVZF1iU44BaP8iCR7puhqzNPEgACYm1lW
   4XgUzGZxpHRjMYrwONTw8+Jg4kwhkaEfLk/yxQVdjAKM+awOGGdXMjn0G
   REb9SkEVf+kXAXXFqcE+avHBJZMxA01DrxlbAP/JeNhyqkTe71ZwwlWr5
   s9qKW9dUeRlWrHW/1r0uIKBofDTf076nqLeu2PnwLJHDn6E0sQboBiX58
   6Xl3CR/aDRyT8BZsvwrYoNqTIoRHApgNL6SQm1BfmDzzdjsJdhh9z6Ve9
   6D4AM6tkIpPUl6Z5OFHCp7jG9ky2L3CiD98UtIk8C/DmPp1h1NPRoEGsM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="402520439"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; 
   d="scan'208";a="402520439"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2022 17:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="787885542"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; 
   d="scan'208";a="787885542"
Received: from lkp-server01.sh.intel.com (HELO 4d912534d779) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2022 17:48:34 -0800
Received: from kbuild by 4d912534d779 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p20av-0001AH-1e;
	Mon, 05 Dec 2022 01:48:33 +0000
Date: Mon, 05 Dec 2022 09:48:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD REGRESSION
 22db71bcba826c607324a8ee1b21f5cf7ec71e8b
Message-ID: <638d4dd2.53DrzgYuNG78G7zm%lkp@intel.com>
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
branch HEAD: 22db71bcba826c607324a8ee1b21f5cf7ec71e8b  Merge branch 'topic/qspinlock' into next

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202212050224.i7uh9fOh-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/powerpc/lib/qspinlock.c:207:2: error: call to undeclared function 'spin_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
arch/powerpc/lib/qspinlock.c:224:3: error: call to undeclared function 'spin_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
arch/powerpc/lib/qspinlock.c:230:2: error: call to undeclared function 'spin_cpu_relax'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
include/linux/signal.h:113:11: error: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
include/linux/signal.h:97:11: error: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- powerpc-randconfig-r021-20221204
    |-- arch-powerpc-lib-qspinlock.c:error:call-to-undeclared-function-spin_begin-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- arch-powerpc-lib-qspinlock.c:error:call-to-undeclared-function-spin_cpu_relax-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- arch-powerpc-lib-qspinlock.c:error:call-to-undeclared-function-spin_end-ISO-C99-and-later-do-not-support-implicit-function-declarations
    |-- include-linux-signal.h:error:array-index-is-past-the-end-of-the-array-(that-has-type-const-unsigned-long-)-Werror-Warray-bounds
    `-- include-linux-signal.h:error:array-index-is-past-the-end-of-the-array-(that-has-type-unsigned-long-)-Werror-Warray-bounds

elapsed time: 724m

configs tested: 86
configs skipped: 13

gcc tested configs:
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
um                             i386_defconfig
um                           x86_64_defconfig
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
i386                                defconfig
ia64                             allmodconfig
x86_64                              defconfig
i386                          randconfig-a012
s390                                defconfig
x86_64                        randconfig-a015
m68k                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a014
arm                                 defconfig
s390                             allyesconfig
arc                  randconfig-r043-20221204
x86_64                        randconfig-a013
x86_64                               rhel-8.3
i386                          randconfig-a003
x86_64                           allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a002
arm                  randconfig-r046-20221204
i386                          randconfig-a005
x86_64                        randconfig-a004
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
alpha                            allyesconfig
i386                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                 randconfig-a016-20221205
i386                 randconfig-a013-20221205
i386                 randconfig-a012-20221205
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a014-20221205
s390                             allmodconfig
arc                                 defconfig
alpha                               defconfig
x86_64               randconfig-a014-20221205
x86_64               randconfig-a011-20221205
x86_64               randconfig-a012-20221205
x86_64               randconfig-a013-20221205
x86_64               randconfig-a015-20221205
x86_64               randconfig-a016-20221205

clang tested configs:
i386                          randconfig-a013
s390                 randconfig-r044-20221204
x86_64                        randconfig-a005
i386                          randconfig-a006
i386                          randconfig-a015
i386                          randconfig-a011
x86_64                        randconfig-a016
riscv                randconfig-r042-20221204
i386                          randconfig-a002
hexagon              randconfig-r041-20221204
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a004
hexagon              randconfig-r045-20221204
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64               randconfig-a004-20221205
x86_64               randconfig-a005-20221205
x86_64               randconfig-a003-20221205
x86_64               randconfig-a006-20221205
x86_64               randconfig-a002-20221205
x86_64               randconfig-a001-20221205
i386                 randconfig-a003-20221205
i386                 randconfig-a004-20221205
i386                 randconfig-a001-20221205
i386                 randconfig-a002-20221205
i386                 randconfig-a005-20221205
i386                 randconfig-a006-20221205
hexagon              randconfig-r041-20221205
arm                  randconfig-r046-20221205
hexagon              randconfig-r045-20221205

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
