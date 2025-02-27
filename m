Return-Path: <linuxppc-dev+bounces-6525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2429A47564
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 06:51:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3L7Z74fkz30VX;
	Thu, 27 Feb 2025 16:51:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740635498;
	cv=none; b=bsUaQMj56Whpgy/A8pnVBSGrXDlYIL/BuNASorWk51AwZ8cr5cbqAwRmvJvyamGxag1rWF4rjLEO8SO9io+LWW77eJWLB7vHNNTopmr5eTQgezTyA+Mqxa4KO+UR002ZSTJMwF48mOCXIZCm/DYLKSkLnr8Gm4ioegwHBz8VrJUCVhYPAbQPh8jNAZTFfqVi+EWphJ6xj5y9MqT4Vf/wx9kw0UyhJAnV8aU45ws/NLZVa8RE+1Kl0C6kdhihkGoqyarCWc+z4OdwfF9FDxx6INi+z90LkuLKDp+yi86Ue3Bop9FJvSjJlKoEjZttwdHmUIbcrEHqIVnupDm7UFMHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740635498; c=relaxed/relaxed;
	bh=JmLQWzRGi1eC7gBtzxRGyCMM2upjUogEp+lE9PF3tVE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g8dJhmL22YMF1OL/4+t5i7Y9bmf41TrIdnb8KkD4V+1k+OEu/+JvHapMr/t+J5vFIrumB2CPS22bZlRHjVmFIRlZ68EsqzFigzh8H9eNZLgK2zk9cCN7Rh4graWNlO804oQYX6hQQyzhI/fI5Fm1B3zPM44haWRVIcuF0yiQ9JJiZtkhAONM5ePTyFNW4eHCV1ADfc/z/5JZYHT2tpF5TerN7ZTiYMBovy+4yT+o6JZWjgX//nzfpyGHKwQjQnn3B8CgtgVR/YXF9enSjx6o+OFjP+ZtfVKVRIG6DBzxpaLOwMOieSxyLCJx6KY09N/R9dRnU1QgHvCemv2lcbvTPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MBb7emgh; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MBb7emgh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3L7X1lSnz308M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 16:51:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740635496; x=1772171496;
  h=date:from:to:cc:subject:message-id;
  bh=wXanCcG/I78HiZtvA7wUfulDNlnBzyTHe3X4CKAUzyA=;
  b=MBb7emghQ+271fmmOx4CGoWtacIiaIq/Lw4ZnR6S5EOzyLAM8v7aMBHP
   99IQQ0+20jo5Hz0rhY8X1xlvNti9J6RRrZ/c24ZZOX3/nafow7VfOtWTm
   /1lA2Qbbg16dWecMq+DzLW8Bk0NY1269u6KQWh2XJliR32T64YIBRhDfC
   LKXbbH976pjP9SEK8vEEgFfipEcw4+6I2St8Gr54G73Ot07+V6ZSNKfCp
   T/I23y1rsdFv7GadsXXJu1/L60FJ036F35j9qdHL8zRBpun4RxWIw2ZoG
   2AZvs0SInTyCsWXNkiRKLbbjUwRF7J6jLR0XLuokLp3OaKYHQrUcIW39Y
   Q==;
X-CSE-ConnectionGUID: bUYfeBS9TZ2nbug66Ojskw==
X-CSE-MsgGUID: NPT7aA9DTLqa84a38uGILQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="59045989"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="59045989"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:51:31 -0800
X-CSE-ConnectionGUID: TxfB2IFET0WP3Y00swAwdA==
X-CSE-MsgGUID: /NS8YtDzSS2eU5InV1VOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="122036100"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2025 21:51:30 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnWnw-000CvC-20;
	Thu, 27 Feb 2025 05:51:28 +0000
Date: Thu, 27 Feb 2025 13:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 09a81ff40389097f77adca9788309080ba91178e
Message-ID: <202502271327.xLPXYPQ1-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 09a81ff40389097f77adca9788309080ba91178e  Automatic merge of 'next' into merge (2025-02-26 10:09)

elapsed time: 1449m

configs tested: 83
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-14.2.0
alpha                           allyesconfig    gcc-14.2.0
arc                             alldefconfig    gcc-13.2.0
arc                             allmodconfig    gcc-13.2.0
arc                              allnoconfig    gcc-13.2.0
arc                             allyesconfig    gcc-13.2.0
arc                  randconfig-001-20250226    gcc-13.2.0
arc                  randconfig-002-20250226    gcc-13.2.0
arm                             allmodconfig    gcc-14.2.0
arm                              allnoconfig    clang-17
arm                             allyesconfig    gcc-14.2.0
arm                  randconfig-001-20250226    gcc-14.2.0
arm                  randconfig-002-20250226    clang-21
arm                  randconfig-003-20250226    gcc-14.2.0
arm                  randconfig-004-20250226    gcc-14.2.0
arm64                            allnoconfig    gcc-14.2.0
arm64                randconfig-001-20250226    gcc-14.2.0
arm64                randconfig-002-20250226    gcc-14.2.0
arm64                randconfig-003-20250226    clang-21
arm64                randconfig-004-20250226    gcc-14.2.0
csky                             allnoconfig    gcc-14.2.0
csky                 randconfig-001-20250226    gcc-14.2.0
csky                 randconfig-002-20250226    gcc-14.2.0
hexagon                         allmodconfig    clang-21
hexagon                          allnoconfig    clang-21
hexagon                         allyesconfig    clang-18
hexagon              randconfig-001-20250226    clang-21
hexagon              randconfig-002-20250226    clang-21
i386       buildonly-randconfig-001-20250226    gcc-12
i386       buildonly-randconfig-002-20250226    gcc-12
i386       buildonly-randconfig-003-20250226    gcc-12
i386       buildonly-randconfig-004-20250226    clang-19
i386       buildonly-randconfig-005-20250226    gcc-12
i386       buildonly-randconfig-006-20250226    gcc-12
loongarch                       allmodconfig    gcc-14.2.0
loongarch                        allnoconfig    gcc-14.2.0
loongarch            randconfig-001-20250226    gcc-14.2.0
loongarch            randconfig-002-20250226    gcc-14.2.0
m68k                            allmodconfig    gcc-14.2.0
m68k                            allyesconfig    gcc-14.2.0
nios2                randconfig-001-20250226    gcc-14.2.0
nios2                randconfig-002-20250226    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20250226    gcc-14.2.0
parisc               randconfig-002-20250226    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20250226    gcc-14.2.0
powerpc              randconfig-002-20250226    clang-18
powerpc              randconfig-003-20250226    clang-21
powerpc64            randconfig-001-20250226    clang-18
powerpc64            randconfig-002-20250226    gcc-14.2.0
powerpc64            randconfig-003-20250226    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20250226    clang-18
riscv                randconfig-002-20250226    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-15
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20250226    gcc-14.2.0
s390                 randconfig-002-20250226    clang-15
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20250226    gcc-14.2.0
sh                   randconfig-002-20250226    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20250226    gcc-14.2.0
sparc                randconfig-002-20250226    gcc-14.2.0
sparc64              randconfig-001-20250226    gcc-14.2.0
sparc64              randconfig-002-20250226    gcc-14.2.0
um                              allmodconfig    clang-21
um                               allnoconfig    clang-18
um                              allyesconfig    gcc-12
um                   randconfig-001-20250226    clang-18
um                   randconfig-002-20250226    gcc-12
x86_64     buildonly-randconfig-001-20250226    clang-19
x86_64     buildonly-randconfig-002-20250226    clang-19
x86_64     buildonly-randconfig-003-20250226    gcc-12
x86_64     buildonly-randconfig-004-20250226    clang-19
x86_64     buildonly-randconfig-005-20250226    gcc-12
x86_64     buildonly-randconfig-006-20250226    gcc-12
xtensa               randconfig-001-20250226    gcc-14.2.0
xtensa               randconfig-002-20250226    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

