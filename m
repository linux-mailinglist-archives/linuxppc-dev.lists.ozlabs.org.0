Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB605EBBDC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 09:47:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McBXv66npz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYif0pzF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NYif0pzF;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McBXH02bfz3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 17:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664264799; x=1695800799;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mzZ4H32uvB9eMm/SzQ9zTmVGv7LI8dfTZEU0wmvFiPU=;
  b=NYif0pzF6+dJCKB2PbhF4jQvNWN6sXTcBvrhYluT0NZxKI1Ad9A1Lchd
   /AJVTHciLquIe4iIntPDlk3EKcsMWgfdeS+QYs9ZBxfHphQmHpMd55EaH
   JiGmS0g08BrUIxZ0GRJ7+kF0hdSx12/z+KoWCp+DeRCSLwIBsfeVU0Dnn
   s8gKCNHkVp4+BnxnRmbyif1Hvw8i9Ivl0VAHQkpc+1uIRceusaBhnxX22
   ebt+yt/qBd71xDVIIPsiZFWbjMNc3Haxj5XGQ4etShGWrO2OvEX39WPg8
   tjnnsX/jq+Uq0+f942IuMTf/rMH0FIV2TxNOH9bRz3YaxtmlknTx18dfD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="298846334"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="298846334"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2022 00:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="689896721"
X-IronPort-AV: E=Sophos;i="5.93,348,1654585200"; 
   d="scan'208";a="689896721"
Received: from lkp-server02.sh.intel.com (HELO dfa2c9fcd321) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2022 00:46:29 -0700
Received: from kbuild by dfa2c9fcd321 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1od5IS-0000m8-1l;
	Tue, 27 Sep 2022 07:46:28 +0000
Date: Tue, 27 Sep 2022 15:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 725963f3e89679894d3f33ce73f2d5b8eca3ec7c
Message-ID: <6332aa21.O+fvuAgmUq6q922K%lkp@intel.com>
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
branch HEAD: 725963f3e89679894d3f33ce73f2d5b8eca3ec7c  powerpc/64e: provide an addressing macro for use with TOC in alternate register

elapsed time: 944m

configs tested: 63
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
arc                                 defconfig
s390                             allmodconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
s390                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                              defconfig
s390                             allyesconfig
sh                               allmodconfig
mips                             allyesconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
arm                                 defconfig
i386                             allyesconfig
arm                              allyesconfig
arm64                            allyesconfig
arc                  randconfig-r043-20220925
x86_64               randconfig-a002-20220926
x86_64               randconfig-a004-20220926
x86_64               randconfig-a001-20220926
x86_64               randconfig-a003-20220926
x86_64               randconfig-a005-20220926
x86_64               randconfig-a006-20220926
arc                  randconfig-r043-20220926
i386                 randconfig-a001-20220926
riscv                randconfig-r042-20220925
i386                 randconfig-a002-20220926
i386                 randconfig-a003-20220926
s390                 randconfig-r044-20220925
i386                 randconfig-a006-20220926
i386                 randconfig-a004-20220926
i386                 randconfig-a005-20220926
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
ia64                             allmodconfig
powerpc                          allmodconfig

clang tested configs:
hexagon              randconfig-r045-20220925
i386                 randconfig-a011-20220926
i386                 randconfig-a013-20220926
hexagon              randconfig-r041-20220926
i386                 randconfig-a012-20220926
hexagon              randconfig-r045-20220926
i386                 randconfig-a015-20220926
i386                 randconfig-a014-20220926
hexagon              randconfig-r041-20220925
i386                 randconfig-a016-20220926
riscv                randconfig-r042-20220926
s390                 randconfig-r044-20220926
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
