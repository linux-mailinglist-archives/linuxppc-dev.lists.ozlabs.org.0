Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16162D122
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:35:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCPCl1zdgz3dvk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 13:35:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vu+A5WWd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vu+A5WWd;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCPBm2n8sz3cLJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 13:34:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668652480; x=1700188480;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AFcnh6noJ4UIizgvbdTN3xgoJAnG5qKnBZKTv463V1o=;
  b=Vu+A5WWdBgJObXS7pGT/ONu+17IewE/QLCngg9qS2E2mhjUTZsQ2RlsU
   9m2umuqNHDRJ+Pm35o/zZzYy7WKp9R5k+Gwd0BdhbmyssckLtRdV9tNI1
   rqzACszwjz9OtWRrxoOhSs8aWHU+5XXPohSIxRbKCEttHnbZJz5InpuBq
   e51wDUhZrbIzdCrAXIJpsF2Hu3dvI6QP87NNt7j5ItZagm0rUK1I8pCrL
   F/evPNbgEfwuOzpsSHsX03asWsMMkEdJiZdgUKkMCA4e7Mdwgo/w3t0ME
   XT1w3aCFe0R9cooR/Z/z9zDeM2kSTPEaeD4jCg9IVyXY+/SJ/Btyw/Rc0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="296096990"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="296096990"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 18:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="617425608"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="617425608"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 16 Nov 2022 18:34:29 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovUjV-0002zL-0H;
	Thu, 17 Nov 2022 02:34:29 +0000
Date: Thu, 17 Nov 2022 10:34:20 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 b9b83072dc2b0a262b201eac66ed2cafd202a93e
Message-ID: <63759dac.C6/Iz1oVwGfWDxIA%lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: b9b83072dc2b0a262b201eac66ed2cafd202a93e  Automatic merge of 'master' into merge (2022-11-14 14:07)

elapsed time: 724m

configs tested: 54
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
ia64                             allmodconfig
s390                             allyesconfig
x86_64                        randconfig-a011
x86_64                              defconfig
i386                          randconfig-a001
x86_64                        randconfig-a015
i386                                defconfig
i386                          randconfig-a003
m68k                             allmodconfig
powerpc                           allnoconfig
arc                              allyesconfig
powerpc                          allmodconfig
x86_64                        randconfig-a013
sh                               allmodconfig
i386                          randconfig-a005
mips                             allyesconfig
x86_64                          rhel-8.3-func
alpha                            allyesconfig
x86_64                               rhel-8.3
x86_64                    rhel-8.3-kselftests
i386                          randconfig-a012
x86_64                           allyesconfig
arc                  randconfig-r043-20221116
i386                             allyesconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
m68k                             allyesconfig
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig

clang tested configs:
x86_64                        randconfig-a012
i386                          randconfig-a013
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a011
x86_64                        randconfig-a016
i386                          randconfig-a006
i386                          randconfig-a004
hexagon              randconfig-r041-20221116
riscv                randconfig-r042-20221116
hexagon              randconfig-r045-20221116
x86_64                        randconfig-a005
s390                 randconfig-r044-20221116
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
