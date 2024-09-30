Return-Path: <linuxppc-dev+bounces-1701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13698B0D3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 01:27:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHcfV2TjSz2y92;
	Tue,  1 Oct 2024 09:26:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727738817;
	cv=none; b=ei63X97wCX09YwTqdB4y0/9stB2/VNdaRobDfrqNIBtP08+yErfFYZl3iKs3MdBentZdp/DDHt8s5o/eXCYIMehTHdDloxs60CZqaiMH8knxVBRA0jguR6aFNHdcS9V2zC88eONpLnW+o7gUBoSpBSNDYKdXNDC83wgUREZhO/xPwfDZTUwzhmGTYtWR5wv5pbYtaQ9OHzhXJEB6DlvTieEdGEcp3mYcQ4Dn73Sn31XWYNoSHhJzBzyg76QuA0Apufgsz2uUmJO0hOO4FOPTUecSv4on2HEUh6B9KNm6XzyH3TZyYuKxdN0BTj+FdQoJr0S+YAKCv7yrpAedF08eVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727738817; c=relaxed/relaxed;
	bh=APTF9g64eJC0tz/a5cF/UKtwks6Y3hH/poDyv0jVqZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cXJmQcp7ly/mKHrDucYey77du6npu82OTkYmWvI978SY1dEA1r5sjZtU56ca6RpMZdp/gF8yh/BTPQVCLPXacUmEa12vQcWQi/JYnrmy0YHCOvdB+i3t6JBZwCs2T2Oi4al1M7KMSRIKUh5r0GLIqDwpODkMjbQAHDtcyFDa+yqfrljRxENyeLSV2UwgG0Sy55tDuI4GZmIXuQPheaWTMhAN9fHQSAOi24jwcN0RW7VdINEOcYGR3imqDrlQnnNxzUZtjBtpU7yQo7AQgoWmTGfEmw7UO/WSOj7UvnFHJwpbT0PIAFGfuivwBofNdBXBgfzfyeTHGTDQnFbtSdIQkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nVTLm8Cs; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nVTLm8Cs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHcfR5dhCz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2024 09:26:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727738816; x=1759274816;
  h=date:from:to:cc:subject:message-id;
  bh=rasd5rbGOQfUCxrmR86Fe/MAZFDNkF9/Kpq62PBuN0g=;
  b=nVTLm8CsGceXAdm91BkswNvZ9sGwg6XatI7UZankRj/9uTQenidycFaG
   /4O62QH62pbTcboOQ7ApShbvEyuJCogRi6aFGRswUgdSgM195DDwISiiK
   C1aTGN9R4taXzU05S8uutOsxadXLYfhQuc3apxvKGzUNwlx9XIvJFQ35n
   n7CGH2Xa9EErtVbGqidkPYVFTionc1duCr9FeetEoJFtEWB5OnqhSkNNp
   T1u0XLqwzOe8FRkS/OysSWgqrwX3IfgYnMm0nwALFY2NfMvd2K/OAZuvr
   2q5iIURPpG3nzWmfrbEdnYdMH22EWfNzHv0ZwGQUlL5fKM/hOUVeflQKx
   Q==;
X-CSE-ConnectionGUID: EBAduwq1QNCNyB01h+8uQw==
X-CSE-MsgGUID: Ka4wNA3iTnidb1zRC7Hckw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="14476348"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="14476348"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:26:44 -0700
X-CSE-ConnectionGUID: +xprdiOaQnyDI4IISoPHOQ==
X-CSE-MsgGUID: ulrt3dv2Rx+C3yeOKAkpqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73724031"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2024 16:26:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svPmq-000Q21-23;
	Mon, 30 Sep 2024 23:26:40 +0000
Date: Tue, 01 Oct 2024 07:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:merge] BUILD SUCCESS
 7beb771cbef7d4d37555e2d6f56de1fe9d276983
Message-ID: <202410010715.HKLG2qW6-lkp@intel.com>
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git merge
branch HEAD: 7beb771cbef7d4d37555e2d6f56de1fe9d276983  Automatic merge of 'master' into merge (2024-09-30 19:21)

elapsed time: 802m

configs tested: 125
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-13.3.0
alpha                             allnoconfig    gcc-14.1.0
alpha                            allyesconfig    clang-20
alpha                            allyesconfig    gcc-13.3.0
alpha                               defconfig    gcc-14.1.0
arc                              allmodconfig    clang-20
arc                               allnoconfig    gcc-13.2.0
arc                               allnoconfig    gcc-14.1.0
arc                              allyesconfig    clang-20
arc                                 defconfig    gcc-14.1.0
arm                              allmodconfig    clang-20
arm                               allnoconfig    clang-20
arm                               allnoconfig    gcc-14.1.0
arm                              allyesconfig    clang-20
arm                                 defconfig    gcc-14.1.0
arm64                            allmodconfig    clang-20
arm64                             allnoconfig    gcc-14.1.0
arm64                               defconfig    gcc-14.1.0
csky                              allnoconfig    gcc-14.1.0
csky                                defconfig    gcc-14.1.0
hexagon                          allmodconfig    clang-20
hexagon                           allnoconfig    clang-20
hexagon                           allnoconfig    gcc-14.1.0
hexagon                          allyesconfig    clang-20
hexagon                             defconfig    gcc-14.1.0
i386                             allmodconfig    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    clang-18
i386                              allnoconfig    gcc-12
i386                             allyesconfig    clang-18
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20240930    gcc-12
i386        buildonly-randconfig-001-20241001    clang-18
i386        buildonly-randconfig-002-20240930    clang-18
i386        buildonly-randconfig-002-20241001    clang-18
i386        buildonly-randconfig-003-20240930    clang-18
i386        buildonly-randconfig-003-20241001    clang-18
i386        buildonly-randconfig-004-20240930    gcc-12
i386        buildonly-randconfig-004-20241001    clang-18
i386        buildonly-randconfig-005-20240930    clang-18
i386        buildonly-randconfig-005-20241001    clang-18
i386        buildonly-randconfig-006-20240930    clang-18
i386        buildonly-randconfig-006-20241001    clang-18
i386                                defconfig    clang-18
i386                  randconfig-001-20240930    clang-18
i386                  randconfig-001-20241001    clang-18
i386                  randconfig-002-20240930    clang-18
i386                  randconfig-002-20241001    clang-18
i386                  randconfig-003-20240930    gcc-12
i386                  randconfig-003-20241001    clang-18
i386                  randconfig-004-20240930    clang-18
i386                  randconfig-004-20241001    clang-18
i386                  randconfig-005-20240930    clang-18
i386                  randconfig-005-20241001    clang-18
i386                  randconfig-006-20240930    clang-18
i386                  randconfig-006-20241001    clang-18
i386                  randconfig-011-20240930    clang-18
i386                  randconfig-011-20241001    clang-18
i386                  randconfig-012-20240930    clang-18
i386                  randconfig-012-20241001    clang-18
i386                  randconfig-013-20240930    gcc-12
i386                  randconfig-013-20241001    clang-18
i386                  randconfig-014-20240930    gcc-12
i386                  randconfig-014-20241001    clang-18
i386                  randconfig-015-20240930    clang-18
i386                  randconfig-015-20241001    clang-18
i386                  randconfig-016-20240930    gcc-12
i386                  randconfig-016-20241001    clang-18
loongarch                        allmodconfig    gcc-14.1.0
loongarch                         allnoconfig    gcc-14.1.0
loongarch                           defconfig    gcc-14.1.0
m68k                             allmodconfig    gcc-14.1.0
m68k                              allnoconfig    gcc-14.1.0
m68k                             allyesconfig    gcc-14.1.0
m68k                                defconfig    gcc-14.1.0
microblaze                       allmodconfig    gcc-14.1.0
microblaze                        allnoconfig    gcc-14.1.0
microblaze                       allyesconfig    gcc-14.1.0
microblaze                          defconfig    gcc-14.1.0
mips                              allnoconfig    gcc-14.1.0
nios2                             allnoconfig    gcc-14.1.0
nios2                               defconfig    gcc-14.1.0
openrisc                          allnoconfig    gcc-14.1.0
openrisc                         allyesconfig    gcc-14.1.0
openrisc                            defconfig    gcc-12
parisc                           allmodconfig    gcc-14.1.0
parisc                            allnoconfig    gcc-14.1.0
parisc                           allyesconfig    gcc-14.1.0
parisc                              defconfig    gcc-12
parisc64                            defconfig    gcc-14.1.0
powerpc                          allmodconfig    gcc-14.1.0
powerpc                           allnoconfig    gcc-14.1.0
powerpc                          allyesconfig    gcc-14.1.0
riscv                            allmodconfig    gcc-14.1.0
riscv                             allnoconfig    gcc-14.1.0
riscv                            allyesconfig    gcc-14.1.0
riscv                               defconfig    gcc-12
s390                             allmodconfig    clang-20
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
um                               allyesconfig    gcc-12
um                                  defconfig    gcc-12
um                             i386_defconfig    gcc-12
um                           x86_64_defconfig    gcc-12
x86_64                            allnoconfig    clang-18
x86_64                           allyesconfig    clang-18
x86_64                              defconfig    clang-18
x86_64                              defconfig    gcc-11
x86_64                                  kexec    clang-18
x86_64                                  kexec    gcc-12
x86_64                               rhel-8.3    gcc-12
x86_64                          rhel-8.3-func    gcc-12
x86_64                          rhel-8.3-rust    clang-18
xtensa                            allnoconfig    gcc-14.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

