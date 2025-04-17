Return-Path: <linuxppc-dev+bounces-7735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD6BA91BB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 14:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdcGK3m9Fz2yfy;
	Thu, 17 Apr 2025 22:12:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744891945;
	cv=none; b=lFXOylDkFZyCXZy9LtSHFdykJjPbfWIddpk5fB8wt9/09h5RxMFJtPYRWmfqivmMnyPd9W1bPWs/aUrbtMD6MYGT8CqmzN6fzZnGh5KDwnkLxYLKAvHm0vZ4VSL1kvPzfv3Nod0aPGC+01lzj42db6iXDu2UKuf2Fj8AdjMJbp6R/m3btnYX5WU+REs0trf7ZYkd8nzRGIGXdlByMOdn/tGY1pNbpEiD5O0WWoN13c3G9jqNF+3Yw5i0cJAUP6lJC7eZDw+qQqDygvD95dVXUqZ9zIGD9QozCDQPFeD+ZW135pfwKH/TwOo2w3lPQYGiv1Vgeq/ure5VXTLXtZOduw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744891945; c=relaxed/relaxed;
	bh=gtsAOZy57LWy4UaoZm1z1UU5EW3pPUKm6U1ht6AGNlQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yh2nCNdFwOcaNvzYzUOr1EXOHVI/yEdmHuNGxK58Hj1gcQO+GfP6T26KIooWCVQYeBVp8QdiLsyFL2MSRoqTEsnrMa4IcVs0aqGoKscIRnsQFx6BCXCnLebLLQntwKykhuGjGEBFI3UakeiOu3lunj0LNWpYoKRhyHa+uLy5hUVJO4K+f601RZ//8f5n/7BXRHDHC4F7pOc/S2ALZWPvcXXcZvnrmQWYd0Ltf/aQ90qDHBqJgCVsUEw2+zEPfQSqdT+JJVo/h9aMtsSszE26Hr3G8QJKxHUszyOYPnP68YHADGmskEhsRTYTVmsxwG2g6SrezADubXRR96EX2VOT2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIqjmfO4; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIqjmfO4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdcGG1v0lz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 22:12:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744891943; x=1776427943;
  h=date:from:to:cc:subject:message-id;
  bh=D0JC/+EPLMqewQ5IxiOkDwYslKt+SMTGKLNYwmTCLGw=;
  b=iIqjmfO47PJqWWa9XZJCqG5fwFHoSrmKcUxl/F3XDb5ydQuMWn2OoQKA
   y4bpjOB1ZPaKspmDPHAusTiDt6bO7EZ25ykqAq/qmse+FVZJXmB/PuYzA
   MtoQdzj3MLhNyTeb5rhd9Exr+DAgOXGuGME1PaE4Fj1qE4RaRoLMSOmFr
   3z4pn3qIiCCdqvlx8xKYWnBnRgZcEePVHiEiEuqE1JDCJGS6NibX+0AeN
   VkKgYfZM1SlFTn2gOdXu/GuHpQsqPiwEQShPljH/gOMG/lvibK7WmGzIe
   mGzLhU6BEshbnCGalo4TAM1xj9zUapLvIvaapE838yGTMXt561+UWQIC3
   g==;
X-CSE-ConnectionGUID: gFb3/Xk4QQG3K3FUDE9WdQ==
X-CSE-MsgGUID: umMQUMXtS82HpGv2IfO5ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46564462"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46564462"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 05:12:18 -0700
X-CSE-ConnectionGUID: eN99WtXCScG1DDBkPIRCwg==
X-CSE-MsgGUID: lpB8mIiARNOqCnSW8+FYSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135893632"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Apr 2025 05:12:16 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5O6I-000MeQ-00;
	Thu, 17 Apr 2025 12:12:14 +0000
Date: Thu, 17 Apr 2025 20:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 b2accfe7ca5bc9f9af28e603b79bdd5ad8df5c0b
Message-ID: <202504172053.r8T8UQmS-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
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
branch HEAD: b2accfe7ca5bc9f9af28e603b79bdd5ad8df5c0b  powerpc/boot: Check for ld-option support

elapsed time: 1447m

configs tested: 7
configs skipped: 135

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc                allnoconfig    gcc-14.2.0
powerpc    randconfig-001-20250417    clang-21
powerpc    randconfig-002-20250417    gcc-9.3.0
powerpc    randconfig-003-20250417    gcc-9.3.0
powerpc64  randconfig-001-20250417    clang-21
powerpc64  randconfig-002-20250417    clang-21
powerpc64  randconfig-003-20250417    gcc-5.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

