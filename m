Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530768FCFB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 03:15:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PC0nc33QQz3f8Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 13:15:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SxaEqCFn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SxaEqCFn;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PC0lf3glcz302m
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 13:13:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675908814; x=1707444814;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=clz/i1w4zPvPofCN0nyFQvgKN3wm02uNPTqJ2qCAod8=;
  b=SxaEqCFnRVkgaVfOlpw0LgGXtg5MOIMeVgTgHGH9+OzT8oNLTfPLM5K6
   AIhwYw0r2c2lQqPPD8AWkkKm5j+i4mvTFEASJPTnF3BFC/6M/VnDuNeZO
   tnsx5voKFH1iallLVqpVHVTPT+FTgjVCzrfeTF2I0pOS9ieIZ4qzu/CYw
   gU0sA78cpf1OTBdCbfeYbLJGTrcKqn5v2DgPEcHYL/1KDyM1oSR9bRFEQ
   S9lbmHdtzcp47pgEBenPLJJCW28W1Qh7mm7SOVlDLv+YpvFQ2cbZfPJDm
   tAOkEriOatmCj8eCRb5cYY8yzl9VMzhGBqHHOZ/7N8TD1AFg+wBkcDZJa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416208845"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="416208845"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 18:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="699880772"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="699880772"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Feb 2023 18:13:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPwR6-0004ko-0d;
	Thu, 09 Feb 2023 02:13:20 +0000
Date: Thu, 09 Feb 2023 10:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:next-test] BUILD SUCCESS
 18e3525c5e7c6634f88857242a2e1997d5f065e8
Message-ID: <63e4569f.k0dOHHhSmjBBgEbw%lkp@intel.com>
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
branch HEAD: 18e3525c5e7c6634f88857242a2e1997d5f065e8  integrity/powerpc: Support loading keys from PLPKS

elapsed time: 722m

configs tested: 68
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
arc                                 defconfig
powerpc                           allnoconfig
alpha                               defconfig
x86_64                           rhel-8.3-bpf
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
arm                                 defconfig
x86_64                               rhel-8.3
s390                             allmodconfig
i386                 randconfig-a011-20230206
i386                 randconfig-a014-20230206
i386                 randconfig-a012-20230206
s390                                defconfig
i386                 randconfig-a013-20230206
x86_64                           allyesconfig
x86_64               randconfig-a014-20230206
x86_64               randconfig-a013-20230206
i386                 randconfig-a016-20230206
i386                 randconfig-a015-20230206
arm                              allyesconfig
sh                               allmodconfig
i386                                defconfig
s390                             allyesconfig
ia64                             allmodconfig
x86_64               randconfig-a011-20230206
arm64                            allyesconfig
x86_64               randconfig-a015-20230206
x86_64               randconfig-a012-20230206
mips                             allyesconfig
x86_64               randconfig-a016-20230206
powerpc                          allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
riscv                randconfig-r042-20230204
arc                  randconfig-r043-20230204
arc                  randconfig-r043-20230206
s390                 randconfig-r044-20230204
riscv                randconfig-r042-20230206
s390                 randconfig-r044-20230206
i386                             allyesconfig

clang tested configs:
i386                 randconfig-a002-20230206
i386                 randconfig-a004-20230206
i386                 randconfig-a003-20230206
x86_64               randconfig-a001-20230206
i386                 randconfig-a001-20230206
x86_64               randconfig-a002-20230206
x86_64               randconfig-a003-20230206
x86_64               randconfig-a004-20230206
i386                 randconfig-a005-20230206
i386                 randconfig-a006-20230206
x86_64                          rhel-8.3-rust
hexagon              randconfig-r045-20230206
hexagon              randconfig-r041-20230206
hexagon              randconfig-r041-20230204
arm                  randconfig-r046-20230204
arm                  randconfig-r046-20230206
hexagon              randconfig-r045-20230204
x86_64               randconfig-a005-20230206
x86_64               randconfig-a006-20230206

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
