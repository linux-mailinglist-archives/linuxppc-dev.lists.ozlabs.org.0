Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F536151A5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 19:38:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1zKt1Jgpz3cMc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 05:38:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WH0xDV9+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WH0xDV9+;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1zJw197Lz3bjF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 05:37:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667327840; x=1698863840;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=d6/cbBcMNfeimM1FGz6vyvbXexN5NXh2jTB/u0TrsIk=;
  b=WH0xDV9+XkN11e6RtQHkT1RUUYacCBYGUIGW0AkD5ROk4xY91oJHQS7n
   8UHWoFvWn6eT9in1pC1m3gFkpjBhY11OM+aw+/Ol3reh48lXeobriCGzk
   ZKAFqP+uQtEijKlexrsmMTWYuSMQ7Rc/exIxah/3/i/lJ7R7qcISpthrc
   rkRPLjd4Ji4YCC62JBWKKoG8Dc0iQ3cDghOhkWiG3dc7Fo1fd2tp9wQii
   7iKVHQlSE12WOmkcyAwiorNM64QxOfuSI/6QNLtg52j3Z+YvD0fbAb1Ry
   Ipu9M95hB5wcfghRhQu3jR62vj+OIJQxx9ao95SpKk7iNu5mNB7aGGuAY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="310310696"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="310310696"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 11:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="963221647"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="963221647"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 01 Nov 2022 11:37:07 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1opw8I-000DvF-1i;
	Tue, 01 Nov 2022 18:37:06 +0000
Date: Wed, 02 Nov 2022 02:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 02a771c9a68a9f08cce4ec5e324fb1bc4dce7202
Message-ID: <63616738./v3x6NPE7BUlY5+G%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 02a771c9a68a9f08cce4ec5e324fb1bc4dce7202  powerpc/32: Select ARCH_SPLIT_ARG64

elapsed time: 720m

configs tested: 115
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                             allmodconfig
s390                                defconfig
alpha                            allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
i386                                defconfig
s390                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
x86_64                              defconfig
arc                  randconfig-r043-20221101
x86_64                        randconfig-a013
x86_64                               rhel-8.3
powerpc                          allmodconfig
x86_64                        randconfig-a011
x86_64                           allyesconfig
x86_64               randconfig-k001-20221031
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
x86_64                        randconfig-a002
powerpc                           allnoconfig
x86_64                        randconfig-a015
sh                               allmodconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a004
ia64                             allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
mips                           jazz_defconfig
arm                           tegra_defconfig
mips                 decstation_r4k_defconfig
arm                          lpd270_defconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
arm                         lubbock_defconfig
powerpc                      chrp32_defconfig
m68k                                defconfig
arm                            mps2_defconfig
i386                 randconfig-a016-20221031
i386                 randconfig-a012-20221031
i386                 randconfig-a015-20221031
i386                 randconfig-a013-20221031
i386                 randconfig-a014-20221031
i386                 randconfig-a011-20221031
powerpc                         wii_defconfig
sh                           sh2007_defconfig
sparc                             allnoconfig
xtensa                    smp_lx200_defconfig
arm                          gemini_defconfig
sh                 kfr2r09-romimage_defconfig
xtensa                       common_defconfig
i386                 randconfig-c001-20221031
i386                          randconfig-c001
x86_64               randconfig-a016-20221031
x86_64               randconfig-a011-20221031
x86_64               randconfig-a013-20221031
x86_64               randconfig-a012-20221031
x86_64               randconfig-a014-20221031
x86_64               randconfig-a015-20221031
sh                          rsk7203_defconfig
m68k                       bvme6000_defconfig
arm                           viper_defconfig
arm                        mini2440_defconfig
powerpc                      mgcoge_defconfig
powerpc                 mpc834x_itx_defconfig
mips                       bmips_be_defconfig
mips                         db1xxx_defconfig
arm                          pxa910_defconfig
xtensa                generic_kc705_defconfig
m68k                            mac_defconfig
mips                            gpr_defconfig
sh                              ul2_defconfig
powerpc                 mpc8540_ads_defconfig
openrisc                       virt_defconfig
powerpc                 canyonlands_defconfig

clang tested configs:
hexagon              randconfig-r041-20221101
hexagon              randconfig-r045-20221101
riscv                randconfig-r042-20221101
x86_64                        randconfig-a012
s390                 randconfig-r044-20221101
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64               randconfig-a005-20221031
x86_64               randconfig-a006-20221031
x86_64               randconfig-a004-20221031
x86_64               randconfig-a001-20221031
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031
mips                        bcm63xx_defconfig
powerpc                          allyesconfig
arm                    vt8500_v6_v7_defconfig
arm                     am200epdkit_defconfig
arm                       spear13xx_defconfig
arm                              alldefconfig
powerpc                   bluestone_defconfig
arm                        magician_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
