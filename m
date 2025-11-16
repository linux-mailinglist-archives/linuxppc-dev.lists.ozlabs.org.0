Return-Path: <linuxppc-dev+bounces-14201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 936E0C6155B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Nov 2025 14:10:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8WSR6TMBz2xqs;
	Mon, 17 Nov 2025 00:09:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763298599;
	cv=none; b=WvNXEwhsNTSSo9OuMm0F7532/5yva4J8gMDHA1pT28aOJQoQh2vh95F8AjPoqbxZoHRRRFtQiU8y5awXIkvnF9zj2lTcz1RuKSt/pcdlJtbcAXUzpxKC8LKEvZTG0ebFa9ZhUBVr0YNz3zbPQNHTTbJGpbSRIvTEVl9D2ePOE/93ItzBxXcBcLuEdCTRmdpTfKJvI9FNuC9e4ZFBFSAbb5f8JvBtome4JgJ5eCQZfYC7sYQp9qHxP4bTd7Cm7yGWdTMuajrMbKPzADtcqrSMJe3yFrq3uU/P+oYDOZCGTHQJhPg0UDVVkHe+5OilFcHLUw8chENpC6H2wpLqjYoceA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763298599; c=relaxed/relaxed;
	bh=pCK/+CqJuGWe9FGxL8in5FU0MwEWCVPhVfi0Pb627N4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bWh+eS9D+y7XzC9imR+bJXILg3w5fiY1HptQ5LZ4TLu89SXOxrJsUBq1F+VKX02yMWZj6XCkewQL+UNlOK14JiS8rimSuOAltBYmkzQgdX958bLYNCkiqM33cycfOU1F2Dr2GoIVvrgV/Y58ai1MnusYLXY+TOtjWCZT1NT1MJUJPANLrSuiHcHxaIijVY/jEUsLDW7OItYc/Y8Dy3YSD3ioXhSJRKc+YVicIh4cXkspXHE2WT1AxWI2sWBJ38DdAKKYAWsRNA7LsAF+/FdTlhhuQNMkB/Kd4w8Nqhg2MxjxxmmwwLwsSs6ROpxXAH3bjryvIJVD+U+XdeXRppDiyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AI+DWwQ0; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AI+DWwQ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8WSP00qdz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Nov 2025 00:09:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763298597; x=1794834597;
  h=date:from:to:cc:subject:message-id;
  bh=Yo4c4WqzvDG/x+x+WmJLrBhe7SdDln2mfJW1c8ihwQc=;
  b=AI+DWwQ0zinvfugpcp5fPgQrt+tWFzBGjwHN3QQqJLa+cLllP0s1T8tC
   c4FpoHSDpo1CgKGpzD+odLd4hphgTNWl79ATEzsi9M2XQVammNfrEngFU
   ZMsFz8Phghtu4q6zBXp36Iq8zAOrPv9hvsr58qgeeTQNOIlt0Sg741BVb
   IZ3RIV7KhrFVmT752LEPILpzPrLwDXXP+mScJWpHNCdukx1s4Yr6V9h6F
   HgTxU0brL1R4x6bglWCI3y1XKtKYM076RVDRmmv/S3ZJLMfpWiLGpHp+2
   dwathoQ03MAQScmOpH7o+vR6pDjhzcO2EIRiUwSG8QsX3HSBUA1AvaRYD
   g==;
X-CSE-ConnectionGUID: f4S3NDEbRJWSBFGXOI2c6g==
X-CSE-MsgGUID: DzUM1xbUSJOZjQab6Es29w==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="65415258"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="65415258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 05:09:53 -0800
X-CSE-ConnectionGUID: 3V8fy6l5SsiLyHqmuO199w==
X-CSE-MsgGUID: O6oZuaXGTJi2NyS14vvZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="213626341"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2025 05:09:51 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKcVp-0008m7-1j;
	Sun, 16 Nov 2025 13:09:49 +0000
Date: Sun, 16 Nov 2025 21:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 88ca3496be4b0b449016a750de1a79331ac5ca05
Message-ID: <202511162148.wWvGWbLL-lkp@intel.com>
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
branch HEAD: 88ca3496be4b0b449016a750de1a79331ac5ca05  Automatic merge of 'next' into merge (2025-11-11 09:08)

elapsed time: 7751m

configs tested: 66
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-15.1.0
alpha              allyesconfig    gcc-15.1.0
arc                allmodconfig    gcc-15.1.0
arc                 allnoconfig    gcc-15.1.0
arc                allyesconfig    gcc-15.1.0
arm                 allnoconfig    clang-22
arm64               allnoconfig    gcc-15.1.0
arm64              allyesconfig    clang-22
csky               allmodconfig    gcc-15.1.0
csky                allnoconfig    gcc-15.1.0
csky               allyesconfig    gcc-15.1.0
hexagon            allmodconfig    clang-17
hexagon             allnoconfig    clang-22
hexagon            allyesconfig    clang-22
i386                allnoconfig    gcc-14
loongarch          allmodconfig    clang-19
loongarch           allnoconfig    clang-22
loongarch          allyesconfig    clang-22
m68k               allmodconfig    gcc-15.1.0
m68k                allnoconfig    gcc-15.1.0
m68k               allyesconfig    gcc-15.1.0
microblaze         allmodconfig    gcc-15.1.0
microblaze          allnoconfig    gcc-15.1.0
microblaze         allyesconfig    gcc-15.1.0
mips               allmodconfig    gcc-15.1.0
mips                allnoconfig    gcc-15.1.0
mips               allyesconfig    gcc-15.1.0
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
nios2              allyesconfig    gcc-11.5.0
openrisc           allmodconfig    gcc-15.1.0
openrisc            allnoconfig    gcc-15.1.0
openrisc           allyesconfig    gcc-15.1.0
parisc             allmodconfig    gcc-15.1.0
parisc              allnoconfig    gcc-15.1.0
parisc             allyesconfig    gcc-15.1.0
powerpc            allmodconfig    gcc-15.1.0
powerpc             allnoconfig    gcc-15.1.0
powerpc            allyesconfig    clang-22
riscv              allmodconfig    clang-22
riscv               allnoconfig    gcc-15.1.0
riscv              allyesconfig    clang-16
s390               allmodconfig    clang-18
s390                allnoconfig    clang-22
s390               allyesconfig    gcc-15.1.0
sh                 allmodconfig    gcc-15.1.0
sh                  allnoconfig    gcc-15.1.0
sh                 allyesconfig    gcc-15.1.0
sparc              allmodconfig    gcc-15.1.0
sparc               allnoconfig    gcc-15.1.0
sparc              allyesconfig    gcc-15.1.0
sparc64            allmodconfig    clang-22
sparc64            allyesconfig    gcc-15.1.0
um                 allmodconfig    clang-19
um                  allnoconfig    clang-22
um                 allyesconfig    gcc-14
x86_64              allnoconfig    clang-20
x86_64                    kexec    clang-20
x86_64                 rhel-9.4    clang-20
x86_64             rhel-9.4-bpf    gcc-14
x86_64            rhel-9.4-func    clang-20
x86_64      rhel-9.4-kselftests    clang-20
x86_64           rhel-9.4-kunit    gcc-14
x86_64             rhel-9.4-ltp    gcc-14
x86_64            rhel-9.4-rust    clang-20
xtensa              allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

