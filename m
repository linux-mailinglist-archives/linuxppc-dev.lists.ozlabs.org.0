Return-Path: <linuxppc-dev+bounces-7976-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31562A9BFF7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 09:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkPwn683Pz2yWK;
	Fri, 25 Apr 2025 17:43:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745567033;
	cv=none; b=Y/WkL9Wvn1+KsLqHcmzTUrZ6L/xb1WgyGzIcKAGOkeBhRIwfTgh1ZqEbXvGFeVz5722CBZGWcD+32takn8BtI7fGYdwKEBqtfaX8wdmnCkEjlukxMuazyoEwxL3MFVERbdlCTFPxm2Mggm0JLIqce19oYdfAC17Vwn1RUaRI3Z9wwptdnkPIy0qWl7u+EOKTATlxMD9K21nm3pIxJOhqpJYGO+qywAoqygAP3SnRiHUYUyTnQdp4SWStd7tp7uIzu1qyFiWPeS/KA8yZnyjJWN+fVlsajvtsqrLa9XEe2Zh1rI/XKofTzMQjiZVvGumPImB+mm8KOhbjf2xglpqAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745567033; c=relaxed/relaxed;
	bh=3Yu3WFxvW/xJfBk//eBVE6djQCyx5lyxR4u3bmEPSSE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F7/ogKQVIWxd10mUQOIFhsmbRTZDVwOitVqLmZJ/RVCIvDpsuPw9xpzeltf2+4INIDGCdv3QLZxaLpWfrIPbSyFrkNJIh5GAnbm3j2Bi9KFGXH8Pp2lGBVzLzeygE9UmFHAXcK4W6iEjyGRcDN5+1eGlWWqn6PjoABDp5gySpZ0l1TqR275uD8NAs1U0kDa1Ldnk++Av/ggz2AD+8uWZxwcnqMgLzQ/6mkivn6cw27Nt3lnc9tdoTQWEOXf3p5sZGxC4mlp0sqF/G1n9Rlk/hgowJCTt+6rXir4xlboUyXPgcpIhi7XMqU6zHj6Lvv/TvQYRJfRoCkDxmwFsy73x1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mr730tSP; dkim-atps=neutral; spf=pass (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mr730tSP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.7; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkPwl55ccz2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 17:43:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745567032; x=1777103032;
  h=date:from:to:cc:subject:message-id;
  bh=C0tS95HbCpi0GWpZ1KuJydhBzJy9WsSsdEquQ9/+Qx4=;
  b=mr730tSPIn0tTzVrt2/sZqPd2Brto3iE71ZT9zKvcSzw7fpkBwWgzvh0
   /9MshN5Q0bMsxY8jZyVxWzgSv/RmVRhkgGO34Dne/2+r70se5P/KMwtK6
   u4DJsZSNZE9X5jZP1bejJjXnTGehouNMm16wqM5h9w3wtmb6F022Xvn3E
   //fOJ/UCB88D77EdlkRs4/xzcXKarskmo27Fj4GbcZmN+WzyeJxaID28o
   bbZaSp8bJj1fZBNO4IQmIJxCf1vMbwAeNtJrUmOFkRWFMmTKOdZuf+Hvw
   it0fnanmBlDXcJmikVZjKyLBBjyL6r+6NmwblQsII6ofKZDluCNKqGKyg
   Q==;
X-CSE-ConnectionGUID: Ar7JpzqwQLSgUbcPJSTIcg==
X-CSE-MsgGUID: K9M+xKEDQJGPrJcr3tnYkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="72591978"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="72591978"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:43:47 -0700
X-CSE-ConnectionGUID: CLLdOr83RduwF0FWHDqoYQ==
X-CSE-MsgGUID: GJf4VpMaRKG4290dgHQl7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="156067735"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2025 00:43:46 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Dip-0004vZ-2y;
	Fri, 25 Apr 2025 07:43:43 +0000
Date: Fri, 25 Apr 2025 15:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 e3f506b78d921e48a00d005bea5c45ec36a99240
Message-ID: <202504251521.bXXpZC6z-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
branch HEAD: e3f506b78d921e48a00d005bea5c45ec36a99240  powerpc/boot: Fix dash warning

elapsed time: 1458m

configs tested: 11
configs skipped: 152

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc               allmodconfig    gcc-14.2.0
powerpc                allnoconfig    gcc-14.2.0
powerpc               allyesconfig    clang-21
powerpc    randconfig-001-20250424    clang-21
powerpc    randconfig-002-20250424    clang-17
powerpc    randconfig-002-20250425    gcc-9.3.0
powerpc    randconfig-003-20250424    clang-21
powerpc    randconfig-003-20250425    gcc-9.3.0
powerpc64  randconfig-001-20250424    clang-21
powerpc64  randconfig-002-20250424    clang-21
powerpc64  randconfig-003-20250424    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

