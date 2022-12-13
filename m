Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0812164AF93
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 07:06:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWSfj68M2z3cGV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 17:06:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q0SYkdzj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q0SYkdzj;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWSdk5F7Qz3bfV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 17:05:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670911514; x=1702447514;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WTCUWY6zN99CUmfkTkRDNLgNxOPiErf3S7Cj3SyuYzw=;
  b=Q0SYkdzjZKVPNRCFWKw/cYtnafNDNpXZsYKwPJ7lcYDx6XLfGRG4B/Qx
   VRIeneD/vCiNdMqDz/y/Rdg4fV8k+5GPThE5y3BqrIfGIjgxpp0JgYmV8
   3qEZ+xXGBYn0ekAbpU5AiJ+e94eWbiWVVgJqP6vppGk6WIIclF9aJBaEa
   Gj1s/8U8GzSuenZpKjKOupBP4naDM+wp0vgHmAMM4mYMe3kKKU6pMUuQj
   oOfTMYzmAwddAfRIZ81CmIYZcE7UPDKxRLfOf3PDWepEidB+I7CzPiDr5
   CBFrvzSMJQLnHC599aLn62Aj97fynXsAjLO7OrWcIt2TrivAJy7kf9d59
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="301465421"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="301465421"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 22:05:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="626179749"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="626179749"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2022 22:05:00 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p4yPU-00048V-05;
	Tue, 13 Dec 2022 06:05:00 +0000
Date: Tue, 13 Dec 2022 14:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 13959373e9c9021cc80730c7bd1242e07b10b328
Message-ID: <639815f5.0YWtNFcAMXQ7IhMR%lkp@intel.com>
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
branch HEAD: 13959373e9c9021cc80730c7bd1242e07b10b328  powerpc/qspinlock: Fix 32-bit build

elapsed time: 1083m

configs tested: 72
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
sh                               allmodconfig
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                 randconfig-a013-20221212
i386                 randconfig-a014-20221212
i386                 randconfig-a012-20221212
i386                 randconfig-a011-20221212
i386                 randconfig-a016-20221212
i386                 randconfig-a015-20221212
x86_64                               rhel-8.3
x86_64                              defconfig
i386                                defconfig
ia64                             allmodconfig
x86_64               randconfig-a011-20221212
arm                                 defconfig
x86_64               randconfig-a012-20221212
x86_64               randconfig-a014-20221212
x86_64               randconfig-a013-20221212
x86_64               randconfig-a015-20221212
x86_64               randconfig-a016-20221212
x86_64                           allyesconfig
i386                             allyesconfig
arc                  randconfig-r043-20221211
arc                  randconfig-r043-20221212
arm                  randconfig-r046-20221211
s390                 randconfig-r044-20221212
riscv                randconfig-r042-20221212
arm64                            allyesconfig
arm                              allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
x86_64                            allnoconfig

clang tested configs:
x86_64               randconfig-a002-20221212
x86_64               randconfig-a001-20221212
x86_64               randconfig-a004-20221212
x86_64               randconfig-a003-20221212
x86_64               randconfig-a006-20221212
x86_64               randconfig-a005-20221212
i386                 randconfig-a002-20221212
i386                 randconfig-a003-20221212
i386                 randconfig-a001-20221212
i386                 randconfig-a006-20221212
i386                 randconfig-a005-20221212
i386                 randconfig-a004-20221212
arm                  randconfig-r046-20221212
riscv                randconfig-r042-20221211
hexagon              randconfig-r045-20221211
hexagon              randconfig-r041-20221211
hexagon              randconfig-r045-20221212
s390                 randconfig-r044-20221211
hexagon              randconfig-r041-20221212
hexagon              randconfig-r045-20221213
s390                 randconfig-r044-20221213
hexagon              randconfig-r041-20221213
riscv                randconfig-r042-20221213

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
