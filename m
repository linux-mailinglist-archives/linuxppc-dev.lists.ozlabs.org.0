Return-Path: <linuxppc-dev+bounces-1700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E316798B090
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 00:58:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHc214dqPz2xFr;
	Tue,  1 Oct 2024 08:58:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727737128;
	cv=none; b=SDCSD3JCjQWAPyozWWZafGeDDCFLG190JKqEEo4sN+f2eEliS8a6exIt+yFUxR1jfkAKR1p7KNrR7GBllnsR+Q2cNe0pIYhCfMd8UNqyNF9BrDoHGD0DAmmA8t7XvN/Dh02RUAnzCUsFZsvda7J27QmUbm3CR48qO3w6yEiP9U9es57LePif0xt8Vctz68cO8IJ3xo6XTEIx8stoTwaVbTv/TrVyHsivdpuaC1YLSu2uO5HtA1x8NGOFU1TdEWDS1ODssBtAStKEGYDO9p9GHtEi5s1qOu7j+3W9wpk+kcoYOe2nCWTZBumWKZY5PnbHuG9ZVRbmTCbLC58kQIjy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727737128; c=relaxed/relaxed;
	bh=gz9QjimzhSxjwgOk1NVB/pXBBRpQjZ6HapOEfF947eo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eare0Hqz2m9f+yDMHWTJivmyAgT5t5dVLrXjImVkHffA0GOMcqA0MPqPej7UEF9bKPkNf35sYW2F+aLLXMdFNK9h+qq2OrUOiHzTze/JmgfBGccqUdUnz2xkCN0SexgeBDiMe54hNQOym5x/Ph9H9gvb4OOJ/PjOKQHDXIa0npeOizJOzTU7Nv+Z+3VWmZ59C+Jmhi2bfR+urnOcCIXx+SHU5WlxHu+v8ZweKzsdp0THsg+EtCWF6CPoPi7DZAsSxiT4zlrRSeCcwdBTxZay1MH6Wc0RCmNV93cP9Dohn6WzFDV5TOUwKr6SgsDGVLMXOdDYfG7v6KS3RhxtFin6zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S6tcsBH+; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S6tcsBH+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHc1y6JMbz2xCW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 08:58:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727737127; x=1759273127;
  h=date:from:to:cc:subject:message-id;
  bh=oFRGR37CGGS87A4iwjI0CbZu1vP9nRcPfpAdo2L+LFQ=;
  b=S6tcsBH+FY/iXaqKbNRocOVvoJf+h8R195SlavIDVUXRCngfkRWyPVxT
   eFlnhOh8+E64dcdUs42HSirkSc6hNHVPQM1PH7SNBl3QQyOOwQaLlgkXl
   5qklyMSOcImlCFcNnaBWD50g5aLRrffM616kCeDa85rOlOlJj+XX0GAwQ
   tOvipMR7Pq95ZRJV5tw93AsiqEfF37pr0+BeCaLnOhvDfKjcOZJdjbaJq
   x2HyjRozI4WYc50QwlPUwOu3cVlQguS6qwkWbhpkOWE5qWZ++YpS6Ik6n
   bhOW2Cw7i51h/wvdqPMqHXnkGJDzWrNp6RFUW5zcy9xEdtSftlDiHlKSN
   g==;
X-CSE-ConnectionGUID: FlcUHMpnSceVqKnJEKhgwA==
X-CSE-MsgGUID: fFl1PNFRQPasVBVlD9Fr7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37523901"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="37523901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 15:58:41 -0700
X-CSE-ConnectionGUID: 6bH5zFquT6KThUiAFLOXEA==
X-CSE-MsgGUID: 8kSw7+FcRNSAKcVuev7bOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73720239"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2024 15:58:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svPLi-000Q0L-0d;
	Mon, 30 Sep 2024 22:58:38 +0000
Date: Tue, 01 Oct 2024 06:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 4b058c9f281f5b100efbf665dd5a1a05e1654d6d
Message-ID: <202410010654.hmC0nzdE-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-0.3 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 4b058c9f281f5b100efbf665dd5a1a05e1654d6d  powerpc/vdso: allow r30 in vDSO code generation of getrandom

elapsed time: 774m

configs tested: 83
configs skipped: 137

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arm                              allmodconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
i386                             allmodconfig    clang-18
i386                              allnoconfig    clang-18
i386                             allyesconfig    clang-18
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-002-20241001    clang-18
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-004-20241001    clang-18
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-006-20241001    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20241001    clang-18
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-004-20241001    clang-18
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-011-20241001    clang-18
i386                  randconfig-012-20241001    clang-18
i386                  randconfig-013-20241001    clang-18
i386                  randconfig-014-20241001    clang-18
i386                  randconfig-015-20241001    clang-18
i386                  randconfig-016-20241001    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    gcc-14.1.0
s390                              allnoconfig    clang-20
s390                             allyesconfig    gcc-14.1.0
s390                                defconfig    gcc-12
sh                               allmodconfig    gcc-14.1.0
sh                                allnoconfig    gcc-14.1.0
sh                               allyesconfig    gcc-14.1.0
sh                                  defconfig    gcc-12
sparc                            allmodconfig    gcc-14.1.0
sparc64                             defconfig    gcc-12
um                               allmodconfig    clang-20
um                                allnoconfig    clang-17
um                               allyesconfig    clang-20
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

