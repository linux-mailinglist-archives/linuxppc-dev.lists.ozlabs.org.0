Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07F45884C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 01:36:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyBFy3FGcz3bN6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 09:36:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YfRr1Egx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YfRr1Egx;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyBFL5Wqvz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 09:35:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659483351; x=1691019351;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2HorRO5wJyCXkNiu6Uat6/djHxCba/G23LIhxGlu26I=;
  b=YfRr1Egx5gm5CwyxcJQSFTOXoSYv1fAaSh4qCH+ZiNVz2cez2rqio5Ja
   z8Mx+D0+wgplB8bP2OS65w4ip3JKOnLBBhBOi9Q8ldiu+IqhdR5EheWZd
   kyaw/YbnN18slxibcQ38iZfV7MjHPmt89WDQFvf2GngP3+X3q5721hMw4
   pkfpWFRkyid5lQsOlfSzc8/v+cybg128khWj0cO+eC/qPj/qaSMWs04Y7
   9x8dYGk9TMu0gRO87G7fNw6IxzNKt7wIClf0UA1KFcp0JFx4i9yASwevk
   biNIWUM8BWO6WRzUQev/CXMTPtZPM2z+a1DXp2uqWJmjk/7qCOGSuKeJy
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="272590228"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="272590228"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 16:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; 
   d="scan'208";a="630914859"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2022 16:35:40 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJ1QI-000GYz-08;
	Tue, 02 Aug 2022 23:35:38 +0000
Date: Wed, 03 Aug 2022 07:35:10 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 ca829e05d3d4f728810cc5e4b468d9ebc7745eb3
Message-ID: <62e9b4ae.A7At2EH+UMxryACO%lkp@intel.com>
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
branch HEAD: ca829e05d3d4f728810cc5e4b468d9ebc7745eb3  powerpc/64: Init jump labels before parse_early_param()

elapsed time: 717m

configs tested: 93
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
m68k                             allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
arc                              allyesconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
mips                             allyesconfig
x86_64               randconfig-a014-20220801
powerpc                          allmodconfig
x86_64               randconfig-a015-20220801
x86_64               randconfig-a011-20220801
i386                                defconfig
x86_64               randconfig-a012-20220801
x86_64               randconfig-a013-20220801
x86_64               randconfig-a016-20220801
i386                 randconfig-a012-20220801
sh                               allmodconfig
i386                             allyesconfig
i386                 randconfig-a013-20220801
i386                 randconfig-a014-20220801
i386                 randconfig-a011-20220801
i386                 randconfig-a016-20220801
i386                 randconfig-a015-20220801
ia64                             allmodconfig
arc                  randconfig-r043-20220801
arm                                 defconfig
s390                 randconfig-r044-20220801
riscv                randconfig-r042-20220801
arm                              allyesconfig
arm64                            allyesconfig
arc                        vdk_hs38_defconfig
mips                            ar7_defconfig
sh                   secureedge5410_defconfig
arm                        mini2440_defconfig
nios2                         10m50_defconfig
sh                     sh7710voipgw_defconfig
sh                   sh7724_generic_defconfig
alpha                             allnoconfig
xtensa                generic_kc705_defconfig
i386                 randconfig-c001-20220801
csky                              allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
loongarch                           defconfig
loongarch                         allnoconfig
arm                       imx_v6_v7_defconfig
parisc                              defconfig
xtensa                         virt_defconfig
powerpc                      makalu_defconfig
m68k                          atari_defconfig
arc                      axs103_smp_defconfig
x86_64               randconfig-k001-20220801
mips                      loongson3_defconfig
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
x86_64               randconfig-a002-20220801
x86_64               randconfig-a001-20220801
x86_64               randconfig-a003-20220801
x86_64               randconfig-a004-20220801
x86_64               randconfig-a006-20220801
x86_64               randconfig-a005-20220801
i386                 randconfig-a001-20220801
hexagon              randconfig-r041-20220801
i386                 randconfig-a002-20220801
i386                 randconfig-a003-20220801
i386                 randconfig-a005-20220801
i386                 randconfig-a004-20220801
i386                 randconfig-a006-20220801
hexagon              randconfig-r045-20220801
hexagon              randconfig-r045-20220802
s390                 randconfig-r044-20220802
hexagon              randconfig-r041-20220802
riscv                randconfig-r042-20220802
powerpc                      ppc44x_defconfig
arm                       cns3420vb_defconfig
arm                   milbeaut_m10v_defconfig
powerpc                      obs600_defconfig
s390                             alldefconfig
arm                         mv78xx0_defconfig
powerpc                   bluestone_defconfig
powerpc                 mpc8560_ads_defconfig
powerpc                    gamecube_defconfig
mips                malta_qemu_32r6_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
