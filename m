Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED674BB46
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 04:07:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jo/JUHxt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyYYX5XrDz3c4H
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 12:07:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jo/JUHxt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyYXc34Chz30Pr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 12:06:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688781984; x=1720317984;
  h=date:from:to:cc:subject:message-id;
  bh=4wK/skWLunoVdOjm8GjJPIHHuceNouuK6i9+LDMo3vw=;
  b=jo/JUHxtUM4830HuO5EQsMP7j78vtvlXrHXU9J25v0AokIYFZ4E8wVC2
   GQcsqAZzSNbRVbgYE8eqEdKMDhaepYewKsGb2SGgL2/nysADIFUp9wBpt
   sA11QANmFGsK8Sq4ExEuCghLFRL75j3PGmeZBO0nZbiKfpfAYtDEpGSn7
   xxkZ+kwsCTaRsUHr79X/xnolFWKVa5nVDks80ExYJrbx/tw5TOMB+t2Fy
   nON/qH5WFqCH/bXyiDA6bkjQz2qZ5h5U2MvK6ZUqkz6W/bzvwVnuoQxo2
   ueTi0xmKiBcylHaeFflJ5RBB41LB8Zaw+4o5YwCVAXaJ1mJIuuXZlqHB7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="344349356"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="344349356"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 19:06:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="697399901"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="697399901"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jul 2023 19:06:17 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHxKz-0002UM-0w;
	Sat, 08 Jul 2023 02:06:17 +0000
Date: Sat, 08 Jul 2023 10:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 05088041a9eef84af5386cd237d754754bb142de
Message-ID: <202307081055.SAJpipP8-lkp@intel.com>
User-Agent: s-nail v14.9.24
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
branch HEAD: 05088041a9eef84af5386cd237d754754bb142de  powerpc/mm/book3s64/hash/4k: Add pmd_same callback for 4K page size

elapsed time: 721m

configs tested: 28
configs skipped: 116

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                     am200epdkit_defconfig   clang
arm                         axm55xx_defconfig   gcc  
arm                         bcm2835_defconfig   clang
arm                       multi_v4t_defconfig   gcc  
arm                       netwinder_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                            qcom_defconfig   gcc  
m68k                             alldefconfig   gcc  
m68k                       m5275evb_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                            gpr_defconfig   gcc  
mips                        maltaup_defconfig   clang
openrisc                 simple_smp_defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                      cm5200_defconfig   gcc  
powerpc                    mvme5100_defconfig   clang
powerpc                       ppc64_defconfig   gcc  
powerpc                      ppc6xx_defconfig   gcc  
powerpc                    socrates_defconfig   clang
powerpc                     tqm8540_defconfig   clang
powerpc                     tqm8541_defconfig   gcc  
powerpc                     tqm8560_defconfig   clang
sh                             shx3_defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
xtensa                         virt_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
