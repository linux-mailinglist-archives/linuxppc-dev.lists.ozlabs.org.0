Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8D5A8BB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 05:03:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJ5TG06Ymz3c4j
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:03:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZZcms0i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZZcms0i;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ5Sb1Y3qz30D0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 13:02:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662001359; x=1693537359;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j1G7JzCiOo+18AdtFvdYwahtLX2+7Kd56YaQCnsjNHQ=;
  b=TZZcms0i6+1oK/wsBDM92lCzoz9IHS3DbDy9+QaVIuN3fcJqysi2rcfc
   ZFDzWtsS1uivBmbku+WL1e/oNsP1UEed8M21PqxY8c9Bcixzcmggn3JeV
   1LALJwVlvxsr/pdsSKO6/eFU+J7iVm/zX0u0385Ub4oOuZGo+Lwyal0ku
   LjskVYPrpqaMcQx3ejq5UMFmzqvgEGDxlshulQpu2FQlLGVphIIsjeczr
   iudNx+iSwIII4xF79QcBdOItZCXqiWrYBs3xUHj/mNhepfICNPNG2TXUp
   HdAylt43q/Jfv91yLOx73s2rO1qlxQRxotmj+2KAlIV6VTTHrJH0mmDBz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296386446"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="296386446"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 20:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="680668107"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 31 Aug 2022 20:02:25 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTaTI-00011J-1K;
	Thu, 01 Sep 2022 03:02:24 +0000
Date: Thu, 01 Sep 2022 11:01:41 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 10da3c652aed277864100a16e8c9d0fc89b484cc
Message-ID: <63102095.Epf5x3vFixpyU6kM%lkp@intel.com>
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
branch HEAD: 10da3c652aed277864100a16e8c9d0fc89b484cc  powerpc/papr_scm: Ensure rc is always initialized in papr_scm_pmu_register()

elapsed time: 723m

configs tested: 58
configs skipped: 111

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
um                           x86_64_defconfig
um                             i386_defconfig
i386                             allyesconfig
i386                                defconfig
mips                             allyesconfig
sh                               allmodconfig
csky                              allnoconfig
alpha                             allnoconfig
arc                               allnoconfig
riscv                             allnoconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit
arc                        nsim_700_defconfig
parisc                generic-32bit_defconfig
riscv             nommu_k210_sdcard_defconfig
sh                          lboxre2_defconfig
xtensa                         virt_defconfig
powerpc                        warp_defconfig
arm                        multi_v7_defconfig
arm64                            alldefconfig
s390                 randconfig-r044-20220831
arc                  randconfig-r043-20220831
riscv                randconfig-r042-20220831
loongarch                           defconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a011
x86_64                        randconfig-a013
x86_64                        randconfig-a015
i386                          randconfig-c001

clang tested configs:
powerpc                          allyesconfig
arm                      pxa255-idp_defconfig
hexagon              randconfig-r045-20220831
hexagon              randconfig-r041-20220831
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
