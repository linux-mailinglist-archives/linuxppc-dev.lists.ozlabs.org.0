Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8817A81D0D5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 01:31:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gftYzIb3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxlTP1ZV7z3cVg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 11:31:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gftYzIb3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxlSW5f7yz2ytJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 11:30:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703291436; x=1734827436;
  h=date:from:to:cc:subject:message-id;
  bh=Y+bvg4XdqXF90/Lcgw0YAqMNJY5jhXFYp1WiS026Z2g=;
  b=gftYzIb3V+WMdHzscJpYZFwzyRk5jK37AYZbBdwNqRRVQIlqb7DX8moY
   UvdK/dS1YxcIOxA9c8X6pLk/BTlUz9P2e5vcLSWOVoiQFV60jH2ZNNz+E
   UIsvOYuinWl83+WjpPucyeHLKVOJyC+ie+C9OvKsmTCk0ARFcYIpvcJSC
   Ir0+Q0/INSzydg3ttWo8uibpV+aOqsUw48ZSC7JvA1z2dFFoaocnZvgXw
   SCFViuW0yWQK8vb0Fg6OPC+wohalIQnV7OO5NhMjzizv/Ou1ACBrKOzrG
   /cGfn8lnLs9deDIr0JQIwUXZ2Hlk1mDcoZnl4QYjglvv9zi9PZLCDfny4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="482351482"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="482351482"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 16:30:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="1024392220"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="1024392220"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Dec 2023 16:30:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGptD-000A30-3B;
	Sat, 23 Dec 2023 00:29:22 +0000
Date: Sat, 23 Dec 2023 08:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 9ec1d7486e2520b4898d7f8e1ec3acc7c13c8dc8
Message-ID: <202312230822.Ta640efY-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 9ec1d7486e2520b4898d7f8e1ec3acc7c13c8dc8  powerpc/fsl: Fix fsl,tmu-calibration to match the schema

elapsed time: 2204m

configs tested: 58
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   randconfig-001-20231223   gcc  
arc                   randconfig-002-20231223   gcc  
arm                   randconfig-001-20231223   clang
arm                   randconfig-002-20231223   clang
arm                   randconfig-003-20231223   clang
arm                   randconfig-004-20231223   clang
arm64                 randconfig-001-20231223   clang
arm64                 randconfig-002-20231223   clang
arm64                 randconfig-003-20231223   clang
arm64                 randconfig-004-20231223   clang
csky                  randconfig-001-20231223   gcc  
csky                  randconfig-002-20231223   gcc  
hexagon               randconfig-001-20231223   clang
hexagon               randconfig-002-20231223   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231223   clang
i386         buildonly-randconfig-002-20231223   clang
i386         buildonly-randconfig-003-20231223   clang
i386         buildonly-randconfig-004-20231223   clang
i386         buildonly-randconfig-005-20231223   clang
i386         buildonly-randconfig-006-20231223   clang
i386                                defconfig   gcc  
i386                  randconfig-001-20231223   clang
i386                  randconfig-002-20231223   clang
i386                  randconfig-003-20231223   clang
i386                  randconfig-004-20231223   clang
i386                  randconfig-005-20231223   clang
i386                  randconfig-006-20231223   clang
i386                  randconfig-011-20231223   gcc  
i386                  randconfig-012-20231223   gcc  
i386                  randconfig-013-20231223   gcc  
i386                  randconfig-014-20231223   gcc  
i386                  randconfig-015-20231223   gcc  
i386                  randconfig-016-20231223   gcc  
loongarch             randconfig-001-20231223   gcc  
loongarch             randconfig-002-20231223   gcc  
nios2                 randconfig-001-20231223   gcc  
nios2                 randconfig-002-20231223   gcc  
parisc                randconfig-001-20231223   gcc  
parisc                randconfig-002-20231223   gcc  
powerpc               randconfig-001-20231223   clang
powerpc               randconfig-002-20231223   clang
powerpc               randconfig-003-20231223   clang
powerpc64             randconfig-001-20231223   clang
powerpc64             randconfig-002-20231223   clang
powerpc64             randconfig-003-20231223   clang
riscv                 randconfig-001-20231223   clang
riscv                 randconfig-002-20231223   clang
s390                  randconfig-001-20231223   gcc  
s390                  randconfig-002-20231223   gcc  
sh                    randconfig-001-20231223   gcc  
sh                    randconfig-002-20231223   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64                              defconfig   gcc  
x86_64                          rhel-8.3-rust   clang

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
