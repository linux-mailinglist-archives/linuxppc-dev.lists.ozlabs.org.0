Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B117632341
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 14:16:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NG7FL3vpyz3cHs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 00:16:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MeMYdILo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MeMYdILo;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG7DM2YlBz3c7B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 00:15:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669036531; x=1700572531;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VH2Y6qG1Hw08xLAkIN5x84ykOXR0b/XIh0qb/4EjerI=;
  b=MeMYdILokVUxAFiVI6hrW5Q5XhgSTsPuPfv4C6SxXf/ozAAMsvUQeJf+
   d3h9vRHomodHe7EPlknfvgdgjRYPF7OrqXKNAEYWt5nxApT7u+CfNh0sD
   CAmo+MxIekWbE2YjVUmRwEuOd9f1m3Ko/yrnuAaGFvKZj3u24oj0RCMXH
   qnXfVKKJAt1plCrgpd6TSTzaeyioFDPOHXAn8S89YrKVtaQ+zRL1BJitD
   R9qtcnTyIwRMha5GZKtuVRk1E1chO+cVQHsFqqzJcB8A7sTfZxnCoYVgx
   ZpCou6oZkF4exEMBqMLBepF59rxKAJz7coixqu+Gs6hve9MV5ncOzlBIf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="296909756"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="296909756"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2022 05:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10537"; a="643314951"
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="643314951"
Received: from lkp-server01.sh.intel.com (HELO 64a2d449c951) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2022 05:15:20 -0800
Received: from kbuild by 64a2d449c951 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ox6dr-0000Rs-2d;
	Mon, 21 Nov 2022 13:15:19 +0000
Date: Mon, 21 Nov 2022 21:14:32 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/objtool] BUILD SUCCESS
 c984aef8c8326035570ff6e01d0ff9e79a5dfa76
Message-ID: <637b79b8.Ay11zpNP5n7+sZfe%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/objtool
branch HEAD: c984aef8c8326035570ff6e01d0ff9e79a5dfa76  objtool/powerpc: Add --mcount specific implementation

elapsed time: 4381m

configs tested: 77
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                               defconfig
arc                                 defconfig
s390                                defconfig
x86_64               randconfig-a012-20221121
x86_64               randconfig-a011-20221121
x86_64               randconfig-a014-20221121
x86_64               randconfig-a016-20221121
s390                             allmodconfig
x86_64               randconfig-a013-20221121
powerpc                           allnoconfig
x86_64               randconfig-a015-20221121
i386                 randconfig-a011-20221121
i386                 randconfig-a015-20221121
i386                 randconfig-a013-20221121
i386                 randconfig-a012-20221121
i386                 randconfig-a014-20221121
um                           x86_64_defconfig
i386                 randconfig-a016-20221121
um                             i386_defconfig
s390                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221120
riscv                randconfig-r042-20221121
ia64                             allmodconfig
arc                  randconfig-r043-20221121
i386                                defconfig
s390                 randconfig-r044-20221121
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
x86_64                            allnoconfig
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm                                 defconfig
i386                             allyesconfig
arm64                            allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
arm                              allyesconfig
sh                            migor_defconfig
sh                          urquell_defconfig
arc                              allyesconfig
i386                          randconfig-c001
mips                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
m68k                             allyesconfig
mips                      loongson3_defconfig
csky                                defconfig
powerpc                      ppc6xx_defconfig
sh                             espt_defconfig
arm                              allmodconfig
arm                           corgi_defconfig

clang tested configs:
i386                 randconfig-a004-20221121
i386                 randconfig-a001-20221121
i386                 randconfig-a003-20221121
i386                 randconfig-a005-20221121
i386                 randconfig-a002-20221121
hexagon              randconfig-r041-20221120
hexagon              randconfig-r041-20221121
i386                 randconfig-a006-20221121
hexagon              randconfig-r045-20221120
hexagon              randconfig-r045-20221121
riscv                randconfig-r042-20221120
s390                 randconfig-r044-20221120
x86_64               randconfig-a004-20221121
x86_64               randconfig-a001-20221121
x86_64               randconfig-a003-20221121
x86_64               randconfig-a002-20221121
x86_64               randconfig-a005-20221121
x86_64               randconfig-a006-20221121
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
