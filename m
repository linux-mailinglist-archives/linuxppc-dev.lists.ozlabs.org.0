Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB35F936B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 01:15:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlyZd0vy6z3bnY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 10:15:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U7dxPAtJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U7dxPAtJ;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlyYf2mw8z2y8J
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 10:14:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665357286; x=1696893286;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mWFY5wlMaVAxPjduLvjFYMmqI49/kABOaod7OSi7VAo=;
  b=U7dxPAtJ1mKrNU6c+gfAGv6HUoETd1+p44vnusPp6LuuwLtytJT+i3Wu
   9O45krbYiPTy29QgteS71lf42d3DMbpGLYRPvAz8FDJuwwDBgawqIvt37
   jov7+9r4xYNOA0zH7RQfiy6puhtWKCuUQNEQaRHvJJw/vGYh3uLE7UBvL
   PMQXMuGIRhNhVVnsZM4bK9DaRii6Xi18NI/VSYNAezxs+Zr/QZ49nEw++
   2rwBjqcPcKulp1dXMH3TOm3zgKsrOB99YHgZWdXZTmF2fAdN0Yg6kvZqp
   489gjRkQMqgJxo3qMXNPL9pvjfwwF/s4ZgeNYN5QeGI5uglaEi0YQX5eZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="291392889"
X-IronPort-AV: E=Sophos;i="5.95,172,1661842800"; 
   d="scan'208";a="291392889"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2022 16:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="603526882"
X-IronPort-AV: E=Sophos;i="5.95,172,1661842800"; 
   d="scan'208";a="603526882"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 09 Oct 2022 16:14:35 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ohfVC-0001MG-2W;
	Sun, 09 Oct 2022 23:14:34 +0000
Date: Mon, 10 Oct 2022 07:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 faa0d25c9b7020a688dc48f058bc62602d13ecf0
Message-ID: <634355cd.ZoDZPg4FXlirAP6o%lkp@intel.com>
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
branch HEAD: faa0d25c9b7020a688dc48f058bc62602d13ecf0  Automatic merge of 'next' into merge (2022-10-09 20:06)

elapsed time: 808m

configs tested: 82
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                              defconfig
x86_64                        randconfig-a002
x86_64                           allyesconfig
x86_64                        randconfig-a006
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
i386                          randconfig-a005
x86_64                          rhel-8.3-func
x86_64                        randconfig-a013
i386                                defconfig
x86_64                    rhel-8.3-kselftests
arc                  randconfig-r043-20221009
x86_64                        randconfig-a011
sh                               allmodconfig
m68k                             allyesconfig
riscv                randconfig-r042-20221009
s390                 randconfig-r044-20221009
i386                          randconfig-a014
x86_64                         rhel-8.3-kunit
arm                                 defconfig
x86_64                        randconfig-a015
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
ia64                             allmodconfig
i386                          randconfig-a016
arc                                 defconfig
i386                             allyesconfig
s390                             allmodconfig
alpha                               defconfig
mips                             allyesconfig
s390                                defconfig
arm                              allyesconfig
s390                             allyesconfig
arm                     eseries_pxa_defconfig
loongarch                        alldefconfig
sh                         ecovec24_defconfig
arc                               allnoconfig
alpha                             allnoconfig
sh                     sh7710voipgw_defconfig
riscv                             allnoconfig
csky                              allnoconfig
sh                            hp6xx_defconfig
powerpc                     taishan_defconfig
sh                               alldefconfig
xtensa                  nommu_kc705_defconfig
arm                       omap2plus_defconfig
powerpc                           allnoconfig
alpha                            allyesconfig
arc                              allyesconfig
i386                          randconfig-c001
powerpc                          allmodconfig
arm64                            allyesconfig
m68k                             allmodconfig
loongarch                           defconfig
powerpc                     asp8347_defconfig
m68k                          atari_defconfig

clang tested configs:
i386                          randconfig-a002
i386                          randconfig-a004
x86_64                        randconfig-a001
hexagon              randconfig-r045-20221009
i386                          randconfig-a013
hexagon              randconfig-r041-20221009
i386                          randconfig-a015
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a011
x86_64                        randconfig-a014
x86_64                        randconfig-a016
powerpc                   lite5200b_defconfig
arm                           spitz_defconfig
arm                     davinci_all_defconfig
powerpc                          g5_defconfig
arm                         lpc32xx_defconfig
arm                            dove_defconfig
arm                       cns3420vb_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
