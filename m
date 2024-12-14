Return-Path: <linuxppc-dev+bounces-4123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8049F1C87
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2024 05:23:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y9Ck86hXGz2yJL;
	Sat, 14 Dec 2024 15:23:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734150192;
	cv=none; b=YoFTYSMmN1HBnp2HCVUNuZxcfZ2LGDC8gN8sI4r0odV9SbFptZsJmwh1/EvA7m4tsivnyznO0RRO24IGDufWS60+12q78FJg+tLT+WANSKeVeC+ov8z3H3DyUGYE63bAtID7+reqmBUXXyjC/ng2AYHYrXQdPaqxYFagV8Gp5ywI+AtRC9BvIG0Nu4Diwc68WK0V2OBmWH5joFX5OudX3/903HkJJMSCigPotOyjRzZhIH2K20EBATkV6xqyW9/1EaA1mDmVmcki9A2EPVdTrecDFN6uTvxTBjD+MF+sgd0lp093nxZw6exeSOTMyFLDAJaAX265FMFZfisuc3yZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734150192; c=relaxed/relaxed;
	bh=sgjuB5YugUGltVh1EJnJ71TvbFx+EOjM1IWadF+CPt0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cJzIlbLUQssdt/k/6Z7DHN091cIwrbEWBpUiicJ7zYH1mSc2hykIjY1i79iwyiOGecaHYDs/iC95l7LjGjhZNWsLmZCmyeusqMF1Z0BbUQdPmEKvzUPwJvQv1w2YVqf8BxTkNz/gQ5t9SOWkXlnhF2/MPcBalCqNkouxTYT/1Wm//P57Y+KMOZL4aQsV2ZttAp9qYZMdR2EtfK2HutMRAJz+5MI2cm0rjqlJmnRkg6+rQBLPDyZzUJKumFnIFD+rsPHzAIAegJx1v1E5zsq2rFv+oB2/dRexUnzoXJurcNzyGvZOobgVBjhx9C6eQGXghBP/No9+AEAxUF9ShMqGYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQcugs6p; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZQcugs6p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y9Ck60mtSz2yF7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2024 15:23:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734150190; x=1765686190;
  h=date:from:to:cc:subject:message-id;
  bh=noBPeor3JUFi+P3aAj9Bfp0bl92fh8I04bFMJnUw/RU=;
  b=ZQcugs6peObcdiUeAiXW8HEDd8u976kzODIfDGjCfDFGAqMYpwLdOFDS
   XNrcVeNTtipLT+M94uphM7JtBK16K5lIyjmfCugDcOJFmUiPPB3qqVECr
   BBklkPdIJTjfLK6KwITlEYc8RESI2hpwhmgG1fX/cQGVj2NC940rVKndK
   Ca0234JCIEuchuN8xkWiwosPTBLIpw0QD9zWQt9ut8uTjYOg+W/QAmH5O
   uUQP/twuY+3b7nge/qE3PKgWUA/nSZ6cWmU9FWvS8laInPagxfjiI8GNV
   GKzLamh0QaOPhCimSCJGYW3goGLOaCfvbTeXetxLoLowhejaJZf7cmGOw
   Q==;
X-CSE-ConnectionGUID: lq1a5fITQiSuF7HMqKVmFg==
X-CSE-MsgGUID: CSxOn9KtQcegz3lC1g1cWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45300898"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="45300898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 20:23:04 -0800
X-CSE-ConnectionGUID: QJKM94RpTXqgkscIVtKQEw==
X-CSE-MsgGUID: 15GV3JT7S1+u/P6YSWYRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134060084"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2024 20:23:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMJgC-000ChT-2H;
	Sat, 14 Dec 2024 04:23:00 +0000
Date: Sat, 14 Dec 2024 12:22:10 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 2dd095785f045588cadc8451f6ff594e2cbf60c9
Message-ID: <202412141205.F18baZqo-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 2dd095785f045588cadc8451f6ff594e2cbf60c9  Automatic merge of 'next' into merge (2024-12-13 09:03)

elapsed time: 1456m

configs tested: 63
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                  randconfig-001-20241213    gcc-13.2.0
arc                  randconfig-002-20241213    gcc-13.2.0
arm                  randconfig-001-20241213    clang-16
arm                  randconfig-002-20241213    clang-18
arm                  randconfig-003-20241213    gcc-14.2.0
arm                  randconfig-004-20241213    clang-18
arm64                randconfig-001-20241213    gcc-14.2.0
arm64                randconfig-002-20241213    gcc-14.2.0
arm64                randconfig-003-20241213    clang-18
arm64                randconfig-004-20241213    gcc-14.2.0
csky                 randconfig-001-20241213    gcc-14.2.0
csky                 randconfig-002-20241213    gcc-14.2.0
hexagon              randconfig-001-20241213    clang-20
hexagon              randconfig-002-20241213    clang-20
i386       buildonly-randconfig-001-20241213    clang-19
i386       buildonly-randconfig-002-20241213    gcc-12
i386       buildonly-randconfig-003-20241213    gcc-12
i386       buildonly-randconfig-004-20241213    clang-19
i386       buildonly-randconfig-005-20241213    gcc-12
i386       buildonly-randconfig-006-20241213    gcc-12
loongarch            randconfig-001-20241213    gcc-14.2.0
loongarch            randconfig-002-20241213    gcc-14.2.0
nios2                randconfig-001-20241213    gcc-14.2.0
nios2                randconfig-002-20241213    gcc-14.2.0
openrisc                         allnoconfig    gcc-14.2.0
parisc                           allnoconfig    gcc-14.2.0
parisc               randconfig-001-20241213    gcc-14.2.0
parisc               randconfig-002-20241213    gcc-14.2.0
powerpc                          allnoconfig    gcc-14.2.0
powerpc              randconfig-001-20241213    gcc-14.2.0
powerpc              randconfig-002-20241213    clang-20
powerpc              randconfig-003-20241213    gcc-14.2.0
powerpc64            randconfig-001-20241213    gcc-14.2.0
powerpc64            randconfig-002-20241213    gcc-14.2.0
powerpc64            randconfig-003-20241213    gcc-14.2.0
riscv                            allnoconfig    gcc-14.2.0
riscv                randconfig-001-20241213    gcc-14.2.0
riscv                randconfig-002-20241213    gcc-14.2.0
s390                            allmodconfig    clang-19
s390                             allnoconfig    clang-20
s390                            allyesconfig    gcc-14.2.0
s390                 randconfig-001-20241213    gcc-14.2.0
s390                 randconfig-002-20241213    clang-19
sh                              allmodconfig    gcc-14.2.0
sh                              allyesconfig    gcc-14.2.0
sh                   randconfig-001-20241213    gcc-14.2.0
sh                   randconfig-002-20241213    gcc-14.2.0
sparc                           allmodconfig    gcc-14.2.0
sparc                randconfig-001-20241213    gcc-14.2.0
sparc                randconfig-002-20241213    gcc-14.2.0
sparc64              randconfig-001-20241213    gcc-14.2.0
sparc64              randconfig-002-20241213    gcc-14.2.0
um                               allnoconfig    clang-18
um                   randconfig-001-20241213    gcc-12
um                   randconfig-002-20241213    clang-16
x86_64     buildonly-randconfig-001-20241213    gcc-12
x86_64     buildonly-randconfig-002-20241213    gcc-12
x86_64     buildonly-randconfig-003-20241213    gcc-12
x86_64     buildonly-randconfig-004-20241213    gcc-12
x86_64     buildonly-randconfig-005-20241213    gcc-12
x86_64     buildonly-randconfig-006-20241213    clang-19
xtensa               randconfig-001-20241213    gcc-14.2.0
xtensa               randconfig-002-20241213    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

