Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FBA642138
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 02:49:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQRLQ66Jsz3bZV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 12:49:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kzcu0TjO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kzcu0TjO;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQRKR2jCgz3bVY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 12:48:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670204923; x=1701740923;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JHcfp61dIttN8k380eSjhBafqKEknp3iwQKDerVBAQ8=;
  b=Kzcu0TjOjAm7O4rdY6oW/pnvA2VtjBEPD04wedQMbBFAgTwOWg5T5R7T
   oyJg9yAEiaFSc2r6oDRJZU9R9PDDg6HYrmRZTHrq5BgvPrY0OXrVTqI2p
   wmaJwqq5ue3lC5ylXcl6N1ykIgyIMYxYDKq6JnqjCiqUf7TtRrtGByNRL
   e6f+TBV9O8u0ue5tzH6n43wGr3JRoGouTgxGWo6+6h0qK6ywITEISH7QQ
   poUZki2huVYFTXl7JFh6UjOMR9aXUy8SYZvvUHQvebyIlzJ4OyPgnXkhm
   r1OP09dg28LJhrW0DoVuHAER0kZTed43O2LmOKebiaRu5WldDLh/JH+kT
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="380534784"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; 
   d="scan'208";a="380534784"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2022 17:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10551"; a="890770050"
X-IronPort-AV: E=Sophos;i="5.96,218,1665471600"; 
   d="scan'208";a="890770050"
Received: from lkp-server01.sh.intel.com (HELO 4d912534d779) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2022 17:48:34 -0800
Received: from kbuild by 4d912534d779 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p20av-0001A9-1S;
	Mon, 05 Dec 2022 01:48:33 +0000
Date: Mon, 05 Dec 2022 09:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 6f3a81b60091031c2c14eb2373d1937b027deb46
Message-ID: <638d4dd5.f4GcBhmKe8WNdaWb%lkp@intel.com>
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
branch HEAD: 6f3a81b60091031c2c14eb2373d1937b027deb46  powerpc/code-patching: Remove protection against patching init addresses after init

elapsed time: 723m

configs tested: 86
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                                defconfig
x86_64                              defconfig
alpha                               defconfig
i386                                defconfig
i386                          randconfig-a016
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                        randconfig-a004
arm                  randconfig-r046-20221204
arc                  randconfig-r043-20221204
i386                          randconfig-a005
x86_64                        randconfig-a013
i386                          randconfig-a001
x86_64                        randconfig-a011
s390                             allmodconfig
arm                                 defconfig
ia64                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
i386                          randconfig-a003
m68k                             allmodconfig
arc                              allyesconfig
i386                          randconfig-a012
arm                              allyesconfig
alpha                            allyesconfig
sh                               allmodconfig
arm64                            allyesconfig
i386                             allyesconfig
i386                          randconfig-a014
m68k                             allyesconfig
s390                             allyesconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                 randconfig-a016-20221205
i386                 randconfig-a013-20221205
i386                 randconfig-a012-20221205
i386                 randconfig-a015-20221205
i386                 randconfig-a011-20221205
i386                 randconfig-a014-20221205
x86_64               randconfig-a014-20221205
x86_64               randconfig-a011-20221205
x86_64               randconfig-a012-20221205
x86_64               randconfig-a013-20221205
x86_64               randconfig-a015-20221205
x86_64               randconfig-a016-20221205

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a015
hexagon              randconfig-r041-20221204
s390                 randconfig-r044-20221204
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a003
hexagon              randconfig-r045-20221204
i386                          randconfig-a002
x86_64                        randconfig-a014
i386                          randconfig-a004
riscv                randconfig-r042-20221204
i386                          randconfig-a006
i386                          randconfig-a011
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
