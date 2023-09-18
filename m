Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D22647A3F57
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 03:56:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m/do8KBb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rpnvt5FNyz3cNv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 11:56:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m/do8KBb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpnsB5ym4z3c3c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 11:54:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695002047; x=1726538047;
  h=date:from:to:cc:subject:message-id;
  bh=EqgTzXD+C+iyJJ3jKWqKE/cXJqYgH6vN4q1ukDJ2kzY=;
  b=m/do8KBbu9tLjBjQbIVQIQEI4UJtDz2phrPxH0Lfr6K/ZYOJnR8e7Z7m
   VpcR+Au9x2J+y/ntw5Jf6GtlL0AEiNjWQBt0OsUbZqyFSS0S72wPXQzkm
   mghMxShlV6y3kSBpVHf1FQBMd0xXK1ySeLzYGS+fb/qRd8pB1M4i/rYZo
   PPInYZSLuaKZC8Xj3e7g0I+WC1vFTYmPJn/yoX5srHOgaZpwMoyxBEdeB
   R+dWQoZnSXWoJ5FNyOOI++mX15qbCbii64/HDRm2J5QcCFxB11Fc7eELl
   IN6QGVRD2wsWl7ehjC3ZpgcvlIQlTP86n2oNovyHUkIjiRhh+LbIeSJvG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="376866259"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="376866259"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2023 18:53:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="780727842"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; 
   d="scan'208";a="780727842"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Sep 2023 18:53:56 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qi3SU-0005cy-2V;
	Mon, 18 Sep 2023 01:53:54 +0000
Date: Mon, 18 Sep 2023 09:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes-test] BUILD SUCCESS
 1174ea047a350ba2e1294131aa14046675ab45fd
Message-ID: <202309180955.z8UyxkhB-lkp@intel.com>
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
branch HEAD: 1174ea047a350ba2e1294131aa14046675ab45fd  powerpc/dexcr: Move HASHCHK trap handler

elapsed time: 724m

configs tested: 32
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm                              alldefconfig   clang
arm                           imxrt_defconfig   gcc  
arm                         orion5x_defconfig   clang
arm                             pxa_defconfig   gcc  
arm                        spear6xx_defconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5307c3_defconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                      maltaaprp_defconfig   clang
parisc                           allyesconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
powerpc                       ebony_defconfig   clang
powerpc                  mpc885_ads_defconfig   clang
riscv                            allmodconfig   gcc  
sh                           se7751_defconfig   gcc  
sh                        sh7757lcr_defconfig   gcc  
um                                  defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-ltp   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  
xtensa                           allyesconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
