Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AAB647262
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 16:02:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NScpC107Cz3c7t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 02:02:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AqUPtlrw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AqUPtlrw;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NScnC1NNNz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 02:01:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670511711; x=1702047711;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hB/iO59Mbe2pu3DRPJyy1kqJ3va8uHVkYmYf3Y0xITc=;
  b=AqUPtlrweTg2CdJwYQvvX9rDBGKiBTTV372mhgF1hLoM7vu/B4Cr/Xlx
   8sNwPBBC8q+uia2eQg8NURpKp5vIfLndepRvte2ilVKkkbA8iAWJvtVGA
   092r17H/cEPd+k8xcy5dg7ulsB6Kl8po+RfTFVclIpkP19kxSMXUKqdVe
   CR3M3/TrXDZaMeVeCxi3yUNvoQv+ufH2UAWorcQFdJNM+GE2po9pZ5fMl
   6P38E5+AUug2s+IIriarm5yVXtxDgfTvln+SuD7NTdJNDEWp5F9gFwLih
   8DavIovnQe9r9kdIo/WT57mO3VHGI8+uqP7i6uu5sFZQ0fsfgSdf5Yf5J
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="304835969"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="304835969"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 06:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="647016754"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; 
   d="scan'208";a="647016754"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Dec 2022 06:26:46 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3HrJ-0001CO-2B;
	Thu, 08 Dec 2022 14:26:45 +0000
Date: Thu, 08 Dec 2022 22:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 64fdcbcc064966bbf261bb455876dffa58858d32
Message-ID: <6391f3ec.4k/MA5Ny6fa6J972%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
branch HEAD: 64fdcbcc064966bbf261bb455876dffa58858d32  powerpc/prom: Fix 32-bit build

elapsed time: 721m

configs tested: 61
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
s390                                defconfig
s390                             allyesconfig
x86_64                        randconfig-a002
x86_64                        randconfig-a004
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
x86_64                           rhel-8.3-syz
i386                                defconfig
i386                          randconfig-a003
x86_64                              defconfig
x86_64                           rhel-8.3-kvm
i386                          randconfig-a014
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a016
x86_64                           allyesconfig
x86_64                          rhel-8.3-rust
ia64                             allmodconfig
arc                  randconfig-r043-20221207
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20221207
s390                 randconfig-r044-20221207
arm                                 defconfig
powerpc                           allnoconfig
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                            allnoconfig

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a011
arm                  randconfig-r046-20221207
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
hexagon              randconfig-r041-20221207
hexagon              randconfig-r045-20221207

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
