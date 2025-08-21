Return-Path: <linuxppc-dev+bounces-11170-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A83B2E967
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 02:29:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c6kjY73B5z2yGf;
	Thu, 21 Aug 2025 10:29:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755736193;
	cv=none; b=JtGaeYtBgHy9Ij5bI9QAjdcwCNCWTWnk87s4E2Kyoo3ubaHp7MEspoccsp6IZ+4wf+GMF8BtktFD/vdUp9lzS2d7FxUtBpe7LPquF9NtLbZ0U7coM6ZWwcSj6zmGu5TiNoe1qGrMO3eRmGLTv6nMwEffXGppT+jhUx7S4ecmHJtYpIp+4woFugMcUV5h0Lc/u0Ro5uhambJrXon753slf7TOcbY1JYYuTOo3kFFYBKJYwdBkkgzj1fx2LBLCofkJkHwxIcUpxSjo5iIkLP+FpKKoewO/PsSbjx0BMy9ffjla6K5w6X++iF8tOiEehHHO6kOsAypsb9muVrkdlJFzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755736193; c=relaxed/relaxed;
	bh=ZrIMAIu5+9jitl6CCETp7NQdf1XJK38sD3GIibv/AOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ABvHxxsmYJRW/dwL3S6rvBNCF8nO49huSsqecJ0Tti5eMbVriRLiIv9NXkK944VF38HlvgAwngXA7n701P788qlwqDmgfTdXANwZBLBOQyJ4vpUitQjU/ZR09IdZS9Myb51rjYgl+v674kT/AXB9SRA9BnVLravOsBEY6gKpd/nJW+Im7+6Ih8yTKNd0UsPdN9xF4GoaetNzKI87osiCbp9LrEV3mc25xTXylI9rsR1xQ3+g4c3yz/AANqwbN7FKwlDBrwENNlI/HtPyiQTrJPZaOT3CG4rrjxBiepxeUV0YlPYbrfLpx0IvnPGM0P+hjKoBUGo6lWgYP7jQym+5DA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ngZQH/z7; dkim-atps=neutral; spf=pass (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ngZQH/z7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.12; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c6kjW6BPyz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Aug 2025 10:29:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755736192; x=1787272192;
  h=date:from:to:cc:subject:message-id;
  bh=AAhaEhKikfUxKIzAoemNSKrHICWXiCDt/mX+KOa+tkA=;
  b=ngZQH/z77eVP6VHMAV9AvFZsG9l5wqMyYJR6Shz9FRoi52sSYH4+oqFk
   BxfLsGsoSHE20k85/e2kgaIob28K+Ub+V9rzmvFCBZFVF6rOeHayPnz4c
   0cWptzBI+xPwZ4HKVEZDlVDKnIo+HfCKzIfM8bfLfq7mGAOpvQLOGrk2w
   9Aiul/cMt2WxHSMRAndp5E5RdktgHhcGeFmv8V0sy0SVDtWCrE3jJMht1
   avDjEmYsf/LTXejv/lCNBFcCsvTmv5Yr04d0Hxdeq5kudha5NNJOYdVIf
   UrBbAl4yCpOMl6TXqOgUjAQQZsQiT7nNH0uqbf4UK/tHxDhsQnD5ARi9I
   g==;
X-CSE-ConnectionGUID: Vyy9E2QiQ2G2Mp5IChf3ZQ==
X-CSE-MsgGUID: 9pK2DuxfSE+zMt/0OmDCFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61828157"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61828157"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:29:47 -0700
X-CSE-ConnectionGUID: G0E9p433RiqR/91H7+dfLw==
X-CSE-MsgGUID: CPAb5i7pRD69el2cuT6LPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168202979"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Aug 2025 17:29:46 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uotBX-000JlJ-2r;
	Thu, 21 Aug 2025 00:29:43 +0000
Date: Thu, 21 Aug 2025 08:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 8763d2257f5231cfdfd8a53594647927dbf8bb06
Message-ID: <202508210822.bX3LH8m0-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: 8763d2257f5231cfdfd8a53594647927dbf8bb06  powerpc/boot/install.sh: Fix shellcheck warnings

elapsed time: 870m

configs tested: 143
configs skipped: 118

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                         haps_hs_defconfig    gcc-15.1.0
arc                   randconfig-001-20250821    clang-22
arc                   randconfig-002-20250821    clang-22
arm                   randconfig-001-20250821    clang-22
arm                   randconfig-002-20250821    clang-22
arm                   randconfig-003-20250821    clang-22
arm                   randconfig-004-20250821    clang-22
arm                           u8500_defconfig    gcc-15.1.0
arm64                 randconfig-001-20250821    clang-22
arm64                 randconfig-002-20250821    clang-22
arm64                 randconfig-003-20250821    clang-22
arm64                 randconfig-004-20250821    clang-22
csky                  randconfig-001-20250821    clang-22
csky                  randconfig-002-20250821    clang-22
hexagon               randconfig-001-20250821    clang-22
hexagon               randconfig-002-20250821    clang-22
i386        buildonly-randconfig-001-20250821    gcc-12
i386        buildonly-randconfig-002-20250821    gcc-12
i386        buildonly-randconfig-003-20250821    gcc-12
i386        buildonly-randconfig-004-20250821    gcc-12
i386        buildonly-randconfig-005-20250821    gcc-12
i386        buildonly-randconfig-006-20250821    gcc-12
i386                  randconfig-001-20250821    gcc-11
i386                  randconfig-002-20250821    gcc-11
i386                  randconfig-003-20250821    gcc-11
i386                  randconfig-004-20250821    gcc-11
i386                  randconfig-005-20250821    gcc-11
i386                  randconfig-006-20250821    gcc-11
i386                  randconfig-007-20250821    gcc-11
i386                  randconfig-011-20250821    gcc-12
i386                  randconfig-012-20250821    gcc-12
i386                  randconfig-013-20250821    gcc-12
i386                  randconfig-014-20250821    gcc-12
i386                  randconfig-015-20250821    gcc-12
i386                  randconfig-016-20250821    gcc-12
i386                  randconfig-017-20250821    gcc-12
loongarch                        allmodconfig    clang-19
loongarch             randconfig-001-20250821    clang-22
loongarch             randconfig-002-20250821    clang-22
m68k                             allmodconfig    clang-19
m68k                              allnoconfig    gcc-15.1.0
m68k                             allyesconfig    clang-19
m68k                        mvme16x_defconfig    gcc-15.1.0
microblaze                       allmodconfig    clang-19
microblaze                        allnoconfig    gcc-15.1.0
microblaze                       allyesconfig    clang-19
microblaze                          defconfig    gcc-15.1.0
mips                              allnoconfig    gcc-15.1.0
nios2                             allnoconfig    gcc-15.1.0
nios2                               defconfig    gcc-15.1.0
nios2                 randconfig-001-20250821    clang-22
nios2                 randconfig-002-20250821    clang-22
openrisc                          allnoconfig    clang-22
openrisc                         allyesconfig    gcc-15.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-15.1.0
parisc                            allnoconfig    clang-22
parisc                           allyesconfig    gcc-15.1.0
parisc                              defconfig    gcc-15.1.0
parisc                randconfig-001-20250821    clang-22
parisc                randconfig-002-20250821    clang-22
parisc64                            defconfig    gcc-15.1.0
powerpc                          allmodconfig    gcc-15.1.0
powerpc                           allnoconfig    clang-22
powerpc                           allnoconfig    gcc-15.1.0
powerpc                          allyesconfig    gcc-15.1.0
powerpc                    mvme5100_defconfig    gcc-15.1.0
powerpc                         ps3_defconfig    gcc-15.1.0
powerpc               randconfig-001-20250820    gcc-12.5.0
powerpc               randconfig-001-20250821    clang-22
powerpc               randconfig-002-20250820    gcc-8.5.0
powerpc               randconfig-002-20250821    clang-22
powerpc               randconfig-003-20250820    gcc-13.4.0
powerpc               randconfig-003-20250821    clang-22
powerpc                     skiroot_defconfig    gcc-15.1.0
powerpc64             randconfig-001-20250820    clang-22
powerpc64             randconfig-002-20250820    clang-22
powerpc64             randconfig-002-20250821    clang-22
powerpc64             randconfig-003-20250820    gcc-15.1.0
powerpc64             randconfig-003-20250821    clang-22
riscv                            allmodconfig    gcc-15.1.0
riscv                             allnoconfig    clang-22
riscv                            allyesconfig    gcc-15.1.0
riscv                               defconfig    gcc-12
riscv                 randconfig-001-20250821    clang-18
riscv                 randconfig-002-20250821    clang-18
s390                             allmodconfig    gcc-15.1.0
s390                              allnoconfig    clang-22
s390                             allyesconfig    gcc-15.1.0
s390                                defconfig    gcc-12
s390                  randconfig-001-20250821    clang-18
s390                  randconfig-002-20250821    clang-18
sh                               allmodconfig    gcc-15.1.0
sh                                allnoconfig    gcc-15.1.0
sh                               allyesconfig    gcc-15.1.0
sh                                  defconfig    gcc-12
sh                    randconfig-001-20250821    clang-18
sh                    randconfig-002-20250821    clang-18
sh                     sh7710voipgw_defconfig    gcc-15.1.0
sparc                            allmodconfig    gcc-15.1.0
sparc                             allnoconfig    gcc-15.1.0
sparc                               defconfig    gcc-15.1.0
sparc                 randconfig-001-20250821    clang-18
sparc                 randconfig-002-20250821    clang-18
sparc64                             defconfig    gcc-12
sparc64               randconfig-001-20250821    clang-18
sparc64               randconfig-002-20250821    clang-18
um                                allnoconfig    clang-22
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                    randconfig-001-20250821    clang-18
um                    randconfig-002-20250821    clang-18
um                           x86_64_defconfig    gcc-12
x86_64      buildonly-randconfig-001-20250821    clang-20
x86_64      buildonly-randconfig-002-20250821    clang-20
x86_64      buildonly-randconfig-003-20250821    clang-20
x86_64      buildonly-randconfig-004-20250821    clang-20
x86_64      buildonly-randconfig-005-20250821    clang-20
x86_64      buildonly-randconfig-006-20250821    clang-20
x86_64                                  kexec    clang-20
x86_64                randconfig-001-20250821    clang-20
x86_64                randconfig-002-20250821    clang-20
x86_64                randconfig-003-20250821    clang-20
x86_64                randconfig-004-20250821    clang-20
x86_64                randconfig-005-20250821    clang-20
x86_64                randconfig-006-20250821    clang-20
x86_64                randconfig-007-20250821    clang-20
x86_64                randconfig-008-20250821    clang-20
x86_64                randconfig-071-20250821    clang-20
x86_64                randconfig-072-20250821    clang-20
x86_64                randconfig-073-20250821    clang-20
x86_64                randconfig-074-20250821    clang-20
x86_64                randconfig-075-20250821    clang-20
x86_64                randconfig-076-20250821    clang-20
x86_64                randconfig-077-20250821    clang-20
x86_64                randconfig-078-20250821    clang-20
x86_64                               rhel-9.4    clang-20
x86_64                          rhel-9.4-func    clang-20
x86_64                    rhel-9.4-kselftests    clang-20
xtensa                            allnoconfig    gcc-15.1.0
xtensa                generic_kc705_defconfig    gcc-15.1.0
xtensa                randconfig-001-20250821    clang-18
xtensa                randconfig-002-20250821    clang-18

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

