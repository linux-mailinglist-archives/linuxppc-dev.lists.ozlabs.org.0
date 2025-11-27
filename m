Return-Path: <linuxppc-dev+bounces-14523-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47DC8E40F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 13:29:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHG2z0Fmsz2yvQ;
	Thu, 27 Nov 2025 23:29:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764246586;
	cv=none; b=l0VgtcQf8gXKtCOK9jIWj1qw6e6/8qH2uGpHuF1ao9zvEbLIYg3hVQBm7iOwf+EGtw3R3lwS+oYh4nPZw1pAaX9kS1QznVMC5v9GqQcwi2RK1WyE6d/HBjh5TydvMVDZVUN7s6gQ3jfla/xuTg6ZBOL5uPQiOzYjuKfx2R0iAsDX30wcIqA+bx31/NG7HV7b5IiCP2SsS2m4IpxIxFq0aCDJa/qmxmwEUioQoxnLSHqMGlksEslTJHPbHf33rdO0tmNba1Ye2K3+U0wPhViRfHtuCYMqqdkxMjwbCT5h/Pdf9+mvtRl90L3fKh9SnOdUOz6ruBiR+si+4ilvkisoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764246586; c=relaxed/relaxed;
	bh=eXD2cwlAtYeDmB9Ya9od8jMbCoC885HlZofFoFv5haQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yq02K1l3ry1oeTmpgiHVAZ0s/M2ZUX+Tv3YIA33D5nZh/dc3CO8m7wZDGe3K6CE1vPg3NF5Fk59eS7cpKSVzaIPNoPv15Y6uA1ITPQI7W+qB+2xuh2kK+08YsvCNrZZuh/FBgt+KjE6bRKbD0veMw6xIGIoGoyFITS5/frm5RzBoEIWcTE9s+B2xtLr0WmapZo/2ks2L2KUW/YR3eupfoEiysiY1MToLcYVZDmQYMYM5oVGUXtNJSFFXLrewP+g6wKDd6HlWhRlx1vM6Tz39WcsNNaZ9K05Vme5w0HBxAHh5Lc9b6UDqEn8gcPOK3JEBxj7sOdDoujoV9lSkZqQbdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HH9DIgoX; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HH9DIgoX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHG2v6X6lz2xQq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 23:29:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764246584; x=1795782584;
  h=date:from:to:cc:subject:message-id;
  bh=pLHJvLVptiDOagxqQ9mPCjf4Zis6/W7gt7g78XW7Xww=;
  b=HH9DIgoX8pyv4WeMmAeT1A0GLut0XfIdM/2RUS2mQtUeS0kHH20pc86R
   FasHaH3NJ2rkb0f/m16FdrpiOiytowKxEXownmlAKONEOR8+1JQdWFYpk
   9YWphrWSFzUh0/2eyTATTmxDtwNW8g9LRFDYoZVJRXWndzdOjWmWvAoKW
   fWwNqV6/xg7qbd7qhdcc6bIZLrBL+j4xDAzd4F6aBhtkD2Ebqvz+b1B9o
   DMU1fSr5bc/oX1sRibMv/9TCRVifCy8bbjwczljE1JXHBX52qka5hgO7E
   QiODDhsjZqEo3L5vPz02gD03q6pj0ZrF9x6QK/CXGHyJaNN8rPugID4Um
   w==;
X-CSE-ConnectionGUID: 1Jeg0HWlSVytlUp/4VgZJg==
X-CSE-MsgGUID: sLXgUvOhTeGC5q4OlmnVDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83685827"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="83685827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 04:29:38 -0800
X-CSE-ConnectionGUID: Ak79aRbdRHGJ9bKcZsMUXw==
X-CSE-MsgGUID: mcyWZubvQjavYFYmQYcO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="192475573"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2025 04:29:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOb7t-000000004kR-3ieO;
	Thu, 27 Nov 2025 12:29:33 +0000
Date: Thu, 27 Nov 2025 20:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 333e781b0037e912109f0a879dffe0ecdbbaf0d6
Message-ID: <202511272002.3hv6VncS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 333e781b0037e912109f0a879dffe0ecdbbaf0d6  Automatic merge of 'next' into merge (2025-11-22 15:22)

elapsed time: 7322m

configs tested: 60
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-15.1.0
alpha                  allyesconfig    gcc-15.1.0
arc                    allmodconfig    gcc-15.1.0
arc                     allnoconfig    gcc-15.1.0
arc                    allyesconfig    gcc-15.1.0
arc         randconfig-001-20251123    gcc-15.1.0
arc         randconfig-002-20251123    gcc-12.5.0
arm                     allnoconfig    clang-22
arm         randconfig-001-20251123    clang-22
arm         randconfig-002-20251123    clang-22
arm         randconfig-003-20251123    gcc-10.5.0
arm         randconfig-004-20251123    clang-22
arm64                   allnoconfig    gcc-15.1.0
arm64       randconfig-001-20251123    gcc-8.5.0
arm64       randconfig-002-20251123    gcc-11.5.0
arm64       randconfig-003-20251123    clang-22
arm64       randconfig-004-20251123    clang-22
csky                   allmodconfig    gcc-15.1.0
csky                    allnoconfig    gcc-15.1.0
csky        randconfig-001-20251123    gcc-15.1.0
csky        randconfig-002-20251123    gcc-15.1.0
hexagon                allmodconfig    clang-17
hexagon                 allnoconfig    clang-22
hexagon     randconfig-001-20251122    clang-22
hexagon     randconfig-002-20251122    clang-17
i386                    allnoconfig    gcc-14
loongarch              allmodconfig    clang-19
loongarch               allnoconfig    clang-22
loongarch   randconfig-001-20251122    gcc-12.5.0
loongarch   randconfig-002-20251122    gcc-14.3.0
m68k                   allmodconfig    gcc-15.1.0
m68k                    allnoconfig    gcc-15.1.0
m68k                   allyesconfig    gcc-15.1.0
microblaze              allnoconfig    gcc-15.1.0
mips                    allnoconfig    gcc-15.1.0
nios2                   allnoconfig    gcc-11.5.0
nios2       randconfig-001-20251122    gcc-11.5.0
nios2       randconfig-002-20251122    gcc-8.5.0
openrisc                allnoconfig    gcc-15.1.0
parisc                 allmodconfig    gcc-15.1.0
parisc                  allnoconfig    gcc-15.1.0
powerpc                 allnoconfig    gcc-15.1.0
riscv                   allnoconfig    gcc-15.1.0
riscv       randconfig-001-20251123    clang-20
riscv       randconfig-002-20251123    gcc-8.5.0
s390                   allmodconfig    clang-18
s390                    allnoconfig    clang-22
s390                   allyesconfig    gcc-15.1.0
s390        randconfig-001-20251123    gcc-8.5.0
s390        randconfig-002-20251123    clang-22
sh                     allmodconfig    gcc-15.1.0
sh                      allnoconfig    gcc-15.1.0
sh                     allyesconfig    gcc-15.1.0
sh          randconfig-001-20251123    gcc-12.5.0
sh          randconfig-002-20251123    gcc-14.3.0
sparc                   allnoconfig    gcc-15.1.0
um                      allnoconfig    clang-22
um                     allyesconfig    gcc-14
x86_64                  allnoconfig    clang-20
xtensa                  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

