Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A92055E735C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 07:28:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYgfX5Jx4z3cdM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 15:28:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PcbTzAd8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PcbTzAd8;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYgdt1lC5z3c34
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 15:27:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663910866; x=1695446866;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ne1FmqJy73wcD2qYSn90TNFne12UNywyrI1mOZ6QElI=;
  b=PcbTzAd8F9e9ByJE2NAvxggdWCx/yDjAy6uaJDTI82Crm66I7jNjYnxO
   SOwBNIA43DxxlL8EfzcDQH+L1xbvibQUeKWWqOGziKNutkSRFOdC0PxQC
   iZv/Qe9pW/OjEZRalmu2H4DuDqSf7buFarhCzsOa6LK15pnlHgf2z+kKL
   lLq+IjN3PSne7Kxai42vnTnA+CmsVe8RbvYYasSRbjYcRIFWKFYBdyQeD
   MigkLwtfUB7niyfLkNtdg62GGkOckyhYZRyMDAJdh5TPeVFhyLNwOPRGk
   nG7656kevs7hShPjmnkGxS6YUV/GFBS8Llli1JKVrcua6FsFYOHx78dQB
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="298113841"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="298113841"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 22:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="571257753"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Sep 2022 22:27:34 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obbDq-0005LE-09;
	Fri, 23 Sep 2022 05:27:34 +0000
Date: Fri, 23 Sep 2022 13:27:18 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 6d2ed86d96d8c5dec5e6fe355fff678e519c419f
Message-ID: <632d43b6.JWduZWC2q3kQ6Ueq%lkp@intel.com>
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
branch HEAD: 6d2ed86d96d8c5dec5e6fe355fff678e519c419f  powerpc/highmem: Properly handle fragmented memory

elapsed time: 1087m

configs tested: 108
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20220922
sh                               allmodconfig
arc                                 defconfig
s390                             allmodconfig
mips                             allyesconfig
alpha                               defconfig
powerpc                          allmodconfig
s390                                defconfig
i386                                defconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013
s390                             allyesconfig
x86_64                              defconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a004
x86_64                               rhel-8.3
x86_64                        randconfig-a002
arc                              allyesconfig
alpha                            allyesconfig
x86_64                        randconfig-a006
m68k                             allmodconfig
x86_64                           allyesconfig
ia64                             allmodconfig
m68k                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           rhel-8.3-kvm
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
arm                                 defconfig
x86_64                           rhel-8.3-syz
arm                          exynos_defconfig
parisc64                            defconfig
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
sparc                               defconfig
loongarch                        alldefconfig
m68k                        stmark2_defconfig
powerpc                          allyesconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                            allyesconfig
sparc                       sparc32_defconfig
sh                           se7721_defconfig
m68k                          atari_defconfig
mips                             allmodconfig
xtensa                       common_defconfig
xtensa                           allyesconfig
csky                                defconfig
sparc                            allyesconfig
x86_64                                  kexec
i386                          randconfig-c001
nios2                            allyesconfig
nios2                               defconfig
parisc                              defconfig
parisc                           allyesconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220922
loongarch                           defconfig
loongarch                         allnoconfig
loongarch                        allmodconfig
arm                        cerfcube_defconfig
microblaze                          defconfig
arm                           viper_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func

clang tested configs:
hexagon              randconfig-r041-20220922
riscv                randconfig-r042-20220922
hexagon              randconfig-r045-20220922
s390                 randconfig-r044-20220922
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
arm                         s5pv210_defconfig
powerpc                      ppc64e_defconfig
arm                          ep93xx_defconfig
x86_64                        randconfig-c007
arm                  randconfig-c002-20220922
i386                          randconfig-c001
s390                 randconfig-c005-20220922
riscv                randconfig-c006-20220922
mips                 randconfig-c004-20220922
powerpc              randconfig-c003-20220922
x86_64                        randconfig-k001
mips                     loongson1c_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
