Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB796600612
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 06:58:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrPsY5rngz3cjY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 15:58:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lN4dizy4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lN4dizy4;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrPrc20mCz2y28
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 15:58:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665982688; x=1697518688;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=7wNTwQtGsEnf9DbR6zNyMPhFOyHzjPaVBEiXZ7Rd7Gs=;
  b=lN4dizy4ejB/bQIsjhmuvEesUBvt7PDgqDkd+3PWndHyhcvgYmvtrCGH
   cf/YiXHTHIjBubuXJF5AnD2nOtXCrPSA0BCHwbYv8PejivJgaVLOqQO1P
   SK/mjgswUALKYqCAhuh7KnATS4Bkl+/3T4aQPRLKuaTOIKc4dlwaPHYti
   PrsXN0MkNLbws+VqUergRH81NqTBrf4gAeMpdGEotHWJKeACNhuiNoCKL
   qDHA1Z9lTYs24WHHsUSUZaRDgx+J5M60VHBDYOGLocYd5kwU6XUJeJlPw
   AoiTmz6kEcB09hBnoABlyKebZoG8pOKWWVQX3TXmlAb9L0+YnygLnCGVc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="285430704"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; 
   d="scan'208";a="285430704"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2022 21:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="957198639"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; 
   d="scan'208";a="957198639"
Received: from lkp-server01.sh.intel.com (HELO 8381f64adc98) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Oct 2022 21:57:47 -0700
Received: from kbuild by 8381f64adc98 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1okICA-00004R-38;
	Mon, 17 Oct 2022 04:57:46 +0000
Date: Mon, 17 Oct 2022 12:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:merge] BUILD SUCCESS
 7e89a53013dab868aa99d69749745be3b626e4f8
Message-ID: <634ce0a4.hjHwDWtPI3+UIqhk%lkp@intel.com>
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
branch HEAD: 7e89a53013dab868aa99d69749745be3b626e4f8  Automatic merge of 'fixes' into merge (2022-10-14 11:02)

elapsed time: 4539m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
powerpc                           allnoconfig
um                           x86_64_defconfig
mips                             allyesconfig
arc                                 defconfig
sh                               allmodconfig
m68k                             allyesconfig
alpha                               defconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20221012
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
s390                 randconfig-r044-20221012
s390                                defconfig
s390                             allmodconfig
arc                  randconfig-r043-20221012
s390                             allyesconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
i386                          randconfig-a014
i386                          randconfig-a012
x86_64                        randconfig-a013
i386                          randconfig-a016
x86_64                        randconfig-a011
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
x86_64                        randconfig-a006
i386                             allyesconfig
arm                                 defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a014

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
