Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E3E647D0D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 05:49:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSz8h6yRtz3cGT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 15:49:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CXCQ6g3r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CXCQ6g3r;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSz6h3HwTz3bP6
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 15:48:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670561292; x=1702097292;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qxZ72E001tHTwWgb4jQGIxxiSxVEpc5K5bzOf7nSv8Y=;
  b=CXCQ6g3rUfL3JoubMK9wbRQeiMoC4TTNQYE+EpB6K/LedpP1bikMvd+0
   gdBHgG6DTUQDYrNUMG4Cenx9OxW2qGERPSa/JOlVLANZeixVAfcl0BX2K
   KdjSejzKyS0881AeUhKAUbY91M2IB3ow6ZHAY5bFvt/KgCNC02zUEHn4J
   WP+7seFJD79mbQhGlgZTJpzaCMvz7vSBejjCrESo71ZBqWHSGISRj8ypu
   l5efoBT1Pioxk0CVNO9sOOs3xksMEpuFj2HfCZg1XWQLOkRbJoBmCyoDz
   oX1WMLArjW847npXCQJJcMkvBD55m+3AaMsgJ4xTXDz6N7YFuS0QUODMe
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="319240503"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="319240503"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 20:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="640901295"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="640901295"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Dec 2022 20:48:04 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3VIp-0001d2-0I;
	Fri, 09 Dec 2022 04:48:03 +0000
Date: Fri, 09 Dec 2022 12:47:13 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 f2636eaac7dee1d7d096cc115ff4f5111b0c508c
Message-ID: <6392bdd1.3myMWvGKxfs3Y5tG%lkp@intel.com>
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
branch HEAD: f2636eaac7dee1d7d096cc115ff4f5111b0c508c  powerpc/64: Set default CPU in Kconfig

elapsed time: 728m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
s390                                defconfig
arc                  randconfig-r043-20221207
m68k                             allyesconfig
m68k                             allmodconfig
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
riscv                randconfig-r042-20221207
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
i386                                defconfig
s390                 randconfig-r044-20221207
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                          rhel-8.3-rust
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                        randconfig-a006
ia64                             allmodconfig
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a013
i386                          randconfig-a014
x86_64                        randconfig-a011
i386                          randconfig-a012
i386                          randconfig-a016
arm                                 defconfig
x86_64                           allyesconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
arm                  randconfig-r046-20221207
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a013
i386                          randconfig-a002
x86_64                        randconfig-a005
i386                          randconfig-a004
i386                          randconfig-a015
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a011
x86_64                        randconfig-a012
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
