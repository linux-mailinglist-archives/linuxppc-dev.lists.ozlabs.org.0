Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE04855713A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 04:58:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LT4hW46xqz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jun 2022 12:58:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0raqMCb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U0raqMCb;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LT4gr221Pz2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jun 2022 12:58:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655953096; x=1687489096;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gjdmsibT2XOVnKUpWeGhWcT365a5t8iOLAfkcKdWJHQ=;
  b=U0raqMCb5EhKkwdJM8geHBrCG+hdDUK1HLeA90aa75tajSBiSgZ3nawp
   MmFC1IL4QfouluE1fzcbbYUU5KadUyUnDr5xw+Coa+qaYfwyD87DQSodn
   0idPzdONlhpfpWChSS0nGa9ujovQFcUwUu1/7pf0Nx9aG72Se4pzFLTDn
   hY1Duv9SAK9vGObY1QekhG+1CMj0FpdmjEGExSuq/jv6Ydx2iippd6DR0
   whrIBg4qsT26p9PlWH2xXcFyFK2KX7CLl0ume7bQlj1FOFcbBR2YBhxw9
   t7C7rq8mFgLf3xGWsVV5q5ek5tqx/U7iIg0cxTHVPs+xAhL3Im0JHSQda
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="281335911"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="281335911"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 19:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; 
   d="scan'208";a="914990669"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2022 19:58:10 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o4D2n-0000ap-Po;
	Thu, 23 Jun 2022 02:58:09 +0000
Date: Thu, 23 Jun 2022 10:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS WITH WARNING
 612d6fddf359556217a89c3e42a6c3a6475e2e1d
Message-ID: <62b3d6b3.A51Rpgx+RFAJmRYB%lkp@intel.com>
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
branch HEAD: 612d6fddf359556217a89c3e42a6c3a6475e2e1d  powerpc: Update asm-prototypes.h comment

Warning reports:

https://lore.kernel.org/lkml/202206230832.VJx0qePJ-lkp@intel.com

Warning: (recently discovered and may have been fixed)

arch/powerpc/platforms/powermac/setup.c:324:6: warning: no previous prototype for 'note_scsi_host' [-Wmissing-prototypes]

Warning ids grouped by kconfigs:

gcc_recent_errors
`-- powerpc-randconfig-r016-20220623
    `-- arch-powerpc-platforms-powermac-setup.c:warning:no-previous-prototype-for-note_scsi_host

elapsed time: 726m

configs tested: 82
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-c001
m68k                          atari_defconfig
sh                             espt_defconfig
arc                    vdk_hs38_smp_defconfig
s390                          debug_defconfig
m68k                        mvme16x_defconfig
arm                            xcep_defconfig
arc                              alldefconfig
sh                           se7343_defconfig
parisc                generic-32bit_defconfig
arm                        oxnas_v6_defconfig
sh                             sh03_defconfig
openrisc                         alldefconfig
arm                           u8500_defconfig
arm                       aspeed_g5_defconfig
xtensa                              defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220622
ia64                             allmodconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
x86_64                        randconfig-a002
x86_64                        randconfig-a006
x86_64                        randconfig-a004
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
arc                  randconfig-r043-20220622
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc                 mpc8315_rdb_defconfig
arm                          ixp4xx_defconfig
arm                         hackkit_defconfig
riscv                             allnoconfig
x86_64                        randconfig-k001
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r041-20220622
riscv                randconfig-r042-20220622
hexagon              randconfig-r045-20220622
s390                 randconfig-r044-20220622
hexagon              randconfig-r041-20220623
hexagon              randconfig-r045-20220623

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
