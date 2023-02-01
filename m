Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D882685C2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 01:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P62sG6lTNz3f2x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:31:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ro0UNMmx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ro0UNMmx;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P62pM1vY0z3bfp
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 11:28:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675211323; x=1706747323;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1UWSUeISC1DXvCcFW2MaFt6uneTS2UuU6t96cXd/wTM=;
  b=Ro0UNMmxNVHqunDqrYCF7CiGFK5beO1BC6nUOsDh3Qj5ZeTOZ9dK4ws2
   xO0qiFnCvyYyVqUMNizQQOtNH89jugZhtN2mvf7GwUSudR+Q926TO+W6Q
   dwUbhgBlr0bHjxruRGmlrAPZWynE6DxlcrSOCAoYSMYPf8q491IYuEiBH
   CPpEhQJHo9OKnLDcRTRT7IeQuPPfZhtXF//mVxjW3az4kaOk6bzohFG+w
   m+tKkp77D/LtVw8DuwOytLPqQ2aKSr76R8QdQbE4mUmERutOd0f2cqWlT
   VJb+/smIJHhgOio9uetJpIKhDScdsMtK1MDDuVuT8NTPz4ITXPAu2B9fM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="355330309"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="355330309"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 16:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="664689758"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="664689758"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2023 16:28:33 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN0zJ-0004qO-0u;
	Wed, 01 Feb 2023 00:28:33 +0000
Date: Wed, 01 Feb 2023 08:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:fixes] BUILD SUCCESS
 111bcb37385353f0510e5847d5abcd1c613dba23
Message-ID: <63d9b225.WZM8/IghCinXucLF%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
branch HEAD: 111bcb37385353f0510e5847d5abcd1c613dba23  powerpc/64s/radix: Fix RWX mapping with relocated kernel

elapsed time: 745m

configs tested: 61
configs skipped: 101

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                 randconfig-a003-20230130
i386                 randconfig-a001-20230130
i386                 randconfig-a004-20230130
i386                 randconfig-a006-20230130
i386                 randconfig-a002-20230130
i386                 randconfig-a005-20230130
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                             allyesconfig
i386                                defconfig
x86_64                            allnoconfig
ia64                             allmodconfig
sh                               allmodconfig
x86_64               randconfig-a006-20230130
x86_64               randconfig-a004-20230130
x86_64               randconfig-a005-20230130
x86_64               randconfig-a002-20230130
x86_64               randconfig-a001-20230130
x86_64               randconfig-a003-20230130
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
arm                                 defconfig
x86_64                          rhel-8.3-func
i386                          debian-10.3-kvm
i386                        debian-10.3-kunit
i386                         debian-10.3-func
i386                          randconfig-c001

clang tested configs:
hexagon              randconfig-r045-20230130
s390                 randconfig-r044-20230130
riscv                randconfig-r042-20230129
hexagon              randconfig-r041-20230129
hexagon              randconfig-r045-20230129
hexagon              randconfig-r041-20230130
riscv                randconfig-r042-20230130
s390                 randconfig-r044-20230129
x86_64               randconfig-a014-20230130
x86_64               randconfig-a015-20230130
x86_64               randconfig-a016-20230130
x86_64               randconfig-a013-20230130
x86_64               randconfig-a011-20230130
x86_64               randconfig-a012-20230130
i386                 randconfig-a014-20230130
i386                 randconfig-a013-20230130
i386                 randconfig-a015-20230130
i386                 randconfig-a016-20230130
i386                 randconfig-a012-20230130
i386                 randconfig-a011-20230130
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
