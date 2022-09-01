Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE45A8BCF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 05:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJ5jp5pNnz3c7N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:14:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DTr6B56m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DTr6B56m;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ5j74qnQz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 13:13:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662002011; x=1693538011;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3Q7L2DYXuj3XQ9RDuNWebAbrgh0r7lyGNm0NtqneEPs=;
  b=DTr6B56mdWx0onrRupRn+LNXK/YTicrThvrlpM5LFxwlhU1s/pWyhs8I
   OKRo6cEg/MpLrJv9rVlo4Kys9P0nr+zVeEk8fVmPtzD0qd30s3qPVciXC
   DmEA5iwCMU8lzy28l33ShIo/QQFEaSPsRwnWZpydGJyXJJo8GHjmj4MUO
   r9iYHtotHQJshxXKxVeMgE4/nvQ4VgNdgcoMd2KcpI9COj0fa2aukckRj
   1Kaen41PsD/m9Kro9Ew5s9Xnu/zWH6pEt8QsSn5Ktw5FFqcid8ghSf+5X
   enJjwZ0358qzzJ7Qfuqty3Vuit5Y5eutfOVxmPrObp1Uy185WTL7280rn
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="275351909"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="275351909"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 20:13:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="701582946"
Received: from lkp-server02.sh.intel.com (HELO 811e2ceaf0e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2022 20:13:26 -0700
Received: from kbuild by 811e2ceaf0e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTady-00012M-04;
	Thu, 01 Sep 2022 03:13:26 +0000
Date: Thu, 01 Sep 2022 11:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 d30b91b37ef543f5eca88f7335374404c78a07ab
Message-ID: <6310231d.xND4rftiZSZMvaee%lkp@intel.com>
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
branch HEAD: d30b91b37ef543f5eca88f7335374404c78a07ab  Automatic merge of 'next' into merge (2022-09-01 00:09)

elapsed time: 733m

configs tested: 55
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                  randconfig-r043-20220830
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                              defconfig
i386                                defconfig
x86_64                               rhel-8.3
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                           allyesconfig
i386                          randconfig-a005
arm                                 defconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                          randconfig-a014
x86_64                           rhel-8.3-kvm
i386                          randconfig-a012
arc                  randconfig-r043-20220831
m68k                             allmodconfig
x86_64                        randconfig-a006
x86_64                    rhel-8.3-kselftests
i386                             allyesconfig
x86_64                           rhel-8.3-syz
i386                          randconfig-a016
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20220831
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
s390                 randconfig-r044-20220831
alpha                            allyesconfig
m68k                             allyesconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
x86_64                        randconfig-a015
mips                             allyesconfig
powerpc                          allmodconfig
sh                               allmodconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a013

clang tested configs:
hexagon              randconfig-r045-20220830
hexagon              randconfig-r041-20220830
i386                          randconfig-a002
hexagon              randconfig-r041-20220831
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a015
i386                          randconfig-a004
x86_64                        randconfig-a005
i386                          randconfig-a011
x86_64                        randconfig-a001
hexagon              randconfig-r045-20220831
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
