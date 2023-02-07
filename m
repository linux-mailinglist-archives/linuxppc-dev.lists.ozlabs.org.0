Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C66968CB43
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 01:36:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9khL0r60z3dwn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 11:36:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MjaAQZyC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MjaAQZyC;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9kfN1mfYz2ymk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 11:34:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675730076; x=1707266076;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=N7dPGpQbC2IlZjBvsLRgwQNDnaF0Ft0y1ehdnHbaink=;
  b=MjaAQZyC8IKGR2jZ15YCdhSM5qXXBlqRhWB1H8LYCzwls3ZRGBe4MMaF
   G1dDZBqgkruKR61wNb8wEMXCk7aAmruL66wtFaENJkjyW84u+r1fC/+wW
   tn+dOeMXRsmUBMDE+nMXlZf+Edpajm6YexkY1onevXqN9j0g/HewqvCL1
   ONmiEOzuh2qB9/xHtbB36SAXeKskL/Se1dBceHmJQrWZipIoubM0/jHn/
   R8/BdbcBCKv1G6TxQdR+/QIBT+Y2F/oPHB2F35YwBagO/LT7vXX1RLAgv
   a3g0LhejFk8J4Ag1hj1IDMPRiF8yfHn36NQ5XrXeFPpQQMFe2Jr/4cP41
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="309693372"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="309693372"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 16:34:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="790605153"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="790605153"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Feb 2023 16:34:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPBwG-0002tw-3C;
	Tue, 07 Feb 2023 00:34:24 +0000
Date: Tue, 07 Feb 2023 08:33:45 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 0bfb97203f5f300777624a2ad6f8f84aea3e8658
Message-ID: <63e19c69.uakQgBW1rRRSecVw%lkp@intel.com>
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
branch HEAD: 0bfb97203f5f300777624a2ad6f8f84aea3e8658  Automatic merge of 'fixes' into merge (2023-02-06 22:15)

elapsed time: 720m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
s390                                defconfig
s390                             allmodconfig
i386                 randconfig-a011-20230206
x86_64                           rhel-8.3-bpf
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
i386                 randconfig-a013-20230206
s390                             allyesconfig
i386                 randconfig-a015-20230206
x86_64                              defconfig
sh                               allmodconfig
i386                 randconfig-a016-20230206
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
mips                             allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a014-20230206
x86_64               randconfig-a013-20230206
x86_64                               rhel-8.3
arm                                 defconfig
x86_64               randconfig-a011-20230206
x86_64               randconfig-a015-20230206
x86_64               randconfig-a012-20230206
x86_64               randconfig-a016-20230206
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
i386                                defconfig
ia64                             allmodconfig
x86_64                           allyesconfig
arc                  randconfig-r043-20230205
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
s390                 randconfig-r044-20230206
riscv                randconfig-r042-20230206
arm64                            allyesconfig
arm                              allyesconfig
i386                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig

clang tested configs:
x86_64               randconfig-a001-20230206
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
x86_64               randconfig-a003-20230206
x86_64               randconfig-a005-20230206
x86_64               randconfig-a006-20230206
x86_64                          rhel-8.3-rust
i386                 randconfig-a002-20230206
i386                 randconfig-a004-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
i386                 randconfig-a005-20230206
i386                 randconfig-a006-20230206
hexagon              randconfig-r041-20230205
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
arm                  randconfig-r046-20230206
hexagon              randconfig-r045-20230205
s390                 randconfig-r044-20230205

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
