Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F308A604F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 03:31:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nURENfO2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJRMd0VpKz3cSL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 11:31:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nURENfO2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJRLw63b8z2xPZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 11:30:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713231049; x=1744767049;
  h=date:from:to:cc:subject:message-id;
  bh=KWt01wYI76y2qt4ce7pEUxpAOohklsPn6yVonKTlSug=;
  b=nURENfO2dqSe/E8IGDIjpu6wB6Z/ZkFh7HUI7bDwvpC2vN8OAUT7AnHk
   EA4jAtb9uetNsfi62lrYRLZN2jKlL6G2Qy2yWhF5H9S9WE/I5cM6AZi+A
   T6L6hJp/xbTBQgvlOLGSpRcsHPoNXYvX/ZHDlEjdpZGQf7RSMFnyPA1G8
   TnGpM6RbzC5e/7Dzq5tCIOLETj5Ih1U7KYBpKYWucuA07mfvOim+9+qpg
   A3OnnmF6hxl38LCcxKXAJYR9Z9eG9GZ9WjTbKxHmjGdhDVSTixd6wuCez
   rNKkJ0bGdefZH2eejzD+B0VpyNgN0NZZJvyfVtpIJYmsw1JKF+Gyw9L2r
   A==;
X-CSE-ConnectionGUID: IKz0J4DVT0+KJBRR/DOaPg==
X-CSE-MsgGUID: sbEN2DRjTFK05D1gYc96RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="11591819"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="11591819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 18:30:47 -0700
X-CSE-ConnectionGUID: txT54yKeTeSCTGjuK9FODg==
X-CSE-MsgGUID: 1KNWo1h3TEK2rOn63PKz5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26896426"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2024 18:30:46 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwXej-0004oU-0r;
	Tue, 16 Apr 2024 01:30:42 +0000
Date: Tue, 16 Apr 2024 09:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 0db880fc865ffb522141ced4bfa66c12ab1fbb70
Message-ID: <202404160920.WJqEVD1r-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
branch HEAD: 0db880fc865ffb522141ced4bfa66c12ab1fbb70  powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.

elapsed time: 728m

configs tested: 50
configs skipped: 157

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allyesconfig   gcc  
arm                            mmp2_defconfig   gcc  
arm                           omap1_defconfig   gcc  
arm                             pxa_defconfig   gcc  
arm64                            allmodconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-003-20240416   clang
i386         buildonly-randconfig-004-20240416   clang
i386         buildonly-randconfig-005-20240416   clang
i386                  randconfig-001-20240416   clang
i386                  randconfig-002-20240416   clang
i386                  randconfig-004-20240416   clang
i386                  randconfig-011-20240416   clang
i386                  randconfig-013-20240416   clang
i386                  randconfig-015-20240416   clang
i386                  randconfig-016-20240416   clang
loongarch                        allmodconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                             allyesconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                       allyesconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                            allyesconfig   gcc  
powerpc                    adder875_defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                     ep8248e_defconfig   gcc  
powerpc               randconfig-001-20240416   clang
powerpc               randconfig-002-20240416   gcc  
powerpc               randconfig-003-20240416   clang
powerpc                  storcenter_defconfig   gcc  
powerpc                     tqm5200_defconfig   gcc  
powerpc64             randconfig-001-20240416   gcc  
powerpc64             randconfig-002-20240416   gcc  
powerpc64             randconfig-003-20240416   gcc  
s390                             allyesconfig   gcc  
sh                               allmodconfig   gcc  
sh                               allyesconfig   gcc  
sh                          r7785rp_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
um                               allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                               rhel-8.3   gcc  
xtensa                       common_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
