Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331FC64519D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 02:57:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRgQg2YD6z3bh6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 12:57:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdXzCiFN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdXzCiFN;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRgPj2NZSz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 12:56:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670378201; x=1701914201;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fDd07MsmV/z0w9Fkk/aVEFJbIoq/lKLIEmqLw4lmqGU=;
  b=IdXzCiFN3aj61W2aMLCG+frg9KMe4z7u3UuPfq+8fpueLkkWwnX9LNBH
   KbLLJ3Tph011ZcoM3AILWrQaf3rvtyc1YZ3cFrPjSXH1LzqQTHRCdtoa2
   JKIR6x891JaQXPaoGcqU7/JwN5fXMhW8+blYf5KpwxdESCXZCS8ILCoGa
   K23whnQB53nyL6JUXuVsgnMasuNCZA8TFSlIjVBjMtSxm5uV97k0A2pPK
   zocrEflSLUXkrIELK8pUtBoRI8ITgtIb5PYNhkEUHljs1cglvd/x7JwP7
   6TTHynYHvC78etsZLP+bjlgoBJpYpenKZMOmWwX+CfZWNVSl+Fl2XAQR5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="343809842"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="343809842"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 17:56:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="820791624"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="820791624"
Received: from lkp-server01.sh.intel.com (HELO b3c45e08cbc1) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2022 17:56:29 -0800
Received: from kbuild by b3c45e08cbc1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2jfg-0001RR-2B;
	Wed, 07 Dec 2022 01:56:28 +0000
Date: Wed, 07 Dec 2022 09:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next] BUILD SUCCESS
 5ddcc03a07ae1ab5062f89a946d9495f1fd8eaa4
Message-ID: <638ff2a6.PJR1DRd5paSlW59i%lkp@intel.com>
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
branch HEAD: 5ddcc03a07ae1ab5062f89a946d9495f1fd8eaa4  powerpc/cpuidle: Set CPUIDLE_FLAG_POLLING for snooze state

elapsed time: 728m

configs tested: 60
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
s390                                defconfig
x86_64                           rhel-8.3-syz
sh                               allmodconfig
s390                             allyesconfig
i386                                defconfig
powerpc                          allmodconfig
mips                             allyesconfig
arm                                 defconfig
x86_64                          rhel-8.3-rust
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
x86_64                          rhel-8.3-func
arm                  randconfig-r046-20221206
i386                          randconfig-a014
arc                  randconfig-r043-20221206
i386                          randconfig-a012
i386                          randconfig-a016
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a013
i386                          randconfig-a001
x86_64                        randconfig-a011
x86_64                        randconfig-a004
i386                          randconfig-a003
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                               rhel-8.3
x86_64                        randconfig-a015
x86_64                        randconfig-a006
x86_64                           allyesconfig
i386                          randconfig-a005
m68k                             allyesconfig
m68k                             allmodconfig
ia64                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221206
i386                          randconfig-a013
hexagon              randconfig-r045-20221206
s390                 randconfig-r044-20221206
riscv                randconfig-r042-20221206
i386                          randconfig-a011
i386                          randconfig-a015
i386                          randconfig-a002
x86_64                        randconfig-a012
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a005
i386                          randconfig-a006

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
