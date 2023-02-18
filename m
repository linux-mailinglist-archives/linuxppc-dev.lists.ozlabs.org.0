Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4870969B69C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 01:11:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJTck0tdqz3fRQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 11:11:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrZqTC+1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nrZqTC+1;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJTZl2d7nz3f4s
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 11:09:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676678991; x=1708214991;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Hkc8ZHwaOYn+AjwEVFphc/7mdCZfHlx9SZs5v1OXVK0=;
  b=nrZqTC+1aNJwDaRn0JaiKgMibBHd8A5OvxJ7KtaKNCeZf+A2zvhFQHSI
   vJcd6r7CrlkArqiy0iM26JgfDT1wXp/Iq+lzKasZQWEv7uhu8jQ22maZl
   oNTw3qUD+X3V9gGyscRO52YWUZ7JCXukEbxC00+ZX8aK+0ehD4aQ3duOH
   puGdIcwIpRiqGkkMl0KJ01rd5813dYSxZIC43/ua9SgmziL5OpQMcACHx
   ky4WPlXW3eT9MAi40rKI6RJsnSAMfUZSiA47dlI+DE5lmn2lHiIPbgzCQ
   SuF1RurJApcL6HY3QyPzPr0Qw51W9UYrRvOU6CRKvXLoU+stf36KGBPPG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="333480993"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="333480993"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 16:09:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="664049079"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="664049079"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 16:09:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTAnJ-000Bv3-2b;
	Sat, 18 Feb 2023 00:09:37 +0000
Date: Sat, 18 Feb 2023 08:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 4f8c30390bbb243a5ac0f4a25d9f0dfeaef90977
Message-ID: <63f0170c./JoQPiMuC/dGbdYV%lkp@intel.com>
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
branch HEAD: 4f8c30390bbb243a5ac0f4a25d9f0dfeaef90977  Automatic merge of 'next' into merge (2023-02-17 12:38)

elapsed time: 1276m

configs tested: 118
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
alpha                            allyesconfig
alpha                               defconfig
arc                              allyesconfig
arc                                 defconfig
arc                     nsimosci_hs_defconfig
arc                  randconfig-r043-20230215
arc                  randconfig-r043-20230217
arc                           tb10x_defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                         axm55xx_defconfig
arm                           corgi_defconfig
arm                                 defconfig
arm                           tegra_defconfig
arm64                            allyesconfig
arm64                               defconfig
csky                                defconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
i386                 randconfig-a011-20230213
i386                          randconfig-a012
i386                 randconfig-a012-20230213
i386                 randconfig-a013-20230213
i386                          randconfig-a014
i386                 randconfig-a014-20230213
i386                 randconfig-a015-20230213
i386                          randconfig-a016
i386                 randconfig-a016-20230213
i386                          randconfig-c001
ia64                             allmodconfig
ia64                                defconfig
loongarch                        allmodconfig
loongarch                         allnoconfig
loongarch                           defconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                        mvme16x_defconfig
m68k                           virt_defconfig
microblaze                          defconfig
mips                             allmodconfig
mips                             allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc64                            defconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                   motionpro_defconfig
powerpc                 mpc834x_mds_defconfig
powerpc                     tqm8548_defconfig
riscv                            allmodconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                randconfig-r042-20230215
riscv                randconfig-r042-20230217
riscv                          rv32_defconfig
s390                             allmodconfig
s390                             allyesconfig
s390                                defconfig
s390                 randconfig-r044-20230215
s390                 randconfig-r044-20230217
sh                               allmodconfig
sh                         ecovec24_defconfig
sh                          polaris_defconfig
sh                   sh7770_generic_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                            allnoconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                                  kexec
x86_64                        randconfig-a011
x86_64               randconfig-a011-20230213
x86_64               randconfig-a012-20230213
x86_64                        randconfig-a013
x86_64               randconfig-a013-20230213
x86_64               randconfig-a014-20230213
x86_64                        randconfig-a015
x86_64               randconfig-a015-20230213
x86_64               randconfig-a016-20230213
x86_64                               rhel-8.3
xtensa                           alldefconfig
xtensa                  audio_kc705_defconfig

clang tested configs:
arm                       aspeed_g4_defconfig
arm                  colibri_pxa270_defconfig
arm                          moxart_defconfig
arm                  randconfig-r046-20230215
arm                  randconfig-r046-20230217
arm                       spear13xx_defconfig
arm                           spitz_defconfig
hexagon              randconfig-r041-20230215
hexagon              randconfig-r041-20230217
hexagon              randconfig-r045-20230215
hexagon              randconfig-r045-20230217
i386                 randconfig-a001-20230213
i386                 randconfig-a002-20230213
i386                 randconfig-a003-20230213
i386                 randconfig-a004-20230213
i386                 randconfig-a005-20230213
i386                 randconfig-a006-20230213
i386                          randconfig-a011
i386                          randconfig-a013
i386                          randconfig-a015
powerpc                    gamecube_defconfig
powerpc                   microwatt_defconfig
x86_64               randconfig-a001-20230213
x86_64               randconfig-a002-20230213
x86_64               randconfig-a003-20230213
x86_64               randconfig-a004-20230213
x86_64               randconfig-a005-20230213
x86_64               randconfig-a006-20230213
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
