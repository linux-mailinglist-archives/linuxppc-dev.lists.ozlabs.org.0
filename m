Return-Path: <linuxppc-dev+bounces-7681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F96A8B1D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 09:19:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcspN6sXzz3bnD;
	Wed, 16 Apr 2025 17:19:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744787948;
	cv=none; b=BY6+9mPlm5cx/SFk8q7vIKRpT2sdEfcHY4BFzjnUFtBJBggEt4dLLqDVRFkaHiF34lAXfEyMufcFsmvA8IAqHXL+CQckatwL+PQA+kFl0EDYHD7SaM38B0YUwmpUAOTtz0V9uQrFs8nJtPCA+ciiw8eoDzmMDU+fOKIPlaqDX9t7D8Vez45321MTkjlBhDLvLkB14oG6MyMscvY0Itzrumfse2o3JokTnUAzNfMLuAq+0Ymjb598kHyiN7HcDNeCVFAxfXW53NlsG73198Tq4jxdUSKsm33h4mVH0CIQoUPidhpjdiv6YdrP4cArtclPGW+IwEq0mjecHJQwtudGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744787948; c=relaxed/relaxed;
	bh=iZU4vUuydQ3tr8HsA42PhcwRHPi43BVnmkasgguswmI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mcj+RoyU4gK27JU7U1CekkC4Yf8rQEozhHXB4zdUgvHBFibsuAybae+ZM/dlG45EhTtdH9ELFaltB+ai9i94dAz0duCE9VRROilCxN06aD7nS3VSbXuIT5L49ZSeiB0som3lzUozYrHx4l+ijMPa4FkT/k1woEJAN44FHi21h+z8GYcABi8mRXmweQa0CrXcUkEcKn3L8yW+sVnmB9/UapplWRl7hKZzhdQ8dMzfF/86JfHA6LwVk/UF4h3xI5LP6IJv1IV5+JxfgodpaxmQfq23SSR+MWxpJ7pe/VIOadB1gforvSs9wfBZ77dhBnc5LVf4Fx3QU4ucW2D5d8fVRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VVGpsU1G; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VVGpsU1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcspL4fpyz2ym3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 17:19:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744787947; x=1776323947;
  h=date:from:to:cc:subject:message-id;
  bh=QY5pLNVQbkOC8rnQrAJ2xUeYNDP1HFpX1ZGbWNj5UiQ=;
  b=VVGpsU1GEP7MsWHqI66FyMfGs/GqdXVVbPvSAANlI4ONndu2/9/CM2vV
   XACR7JN1/GXDy4D7D72io01fq/YQ+LlI9XjKdfA2p1sOXyX/1GZ92IMac
   fTs3fZsaeP7aCCZgN4B6v9mvcdnzjZ1MADiu1VYeKKFKAHfxcyNCzsR4A
   fICXkML47PASxSEsDCMfXjg0bNMSBOECk1o97dQKmLmnTpEqDyfKfOrR2
   0jyLpL575/Uv03nexJvMjnYf3CMrm/AG21ef3QiIMhuq7Lb7s5bDXSiSp
   2IDPnM2cwyFwVzM5Qh/+87qJLmeGsFcUNOYP4LaYVm/i/Rmto4cm4xK0z
   Q==;
X-CSE-ConnectionGUID: Ym/d6BonQTu16bA86zpRVg==
X-CSE-MsgGUID: niiN/H3rQ4uwKB3fbZiVRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="33940616"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="33940616"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:19:02 -0700
X-CSE-ConnectionGUID: hh7D4ksGRLKPUO0+1hhBZQ==
X-CSE-MsgGUID: 0C5fm0MDTvWkgA0VHqvxwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130125892"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Apr 2025 00:19:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4x2w-000JF6-2y;
	Wed, 16 Apr 2025 07:18:58 +0000
Date: Wed, 16 Apr 2025 15:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: [powerpc:fixes-test] BUILD SUCCESS
 3700976f2ae8dfec4c17433f8a16c9e6c334cf89
Message-ID: <202504161549.hHkVBYh1-lkp@intel.com>
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
branch HEAD: 3700976f2ae8dfec4c17433f8a16c9e6c334cf89  powerpc: Add check to select PPC_RADIX_BROADCAST_TLBIE

elapsed time: 1441m

configs tested: 9
configs skipped: 144

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
powerpc               allmodconfig    gcc-14.2.0
powerpc                allnoconfig    gcc-14.2.0
powerpc               allyesconfig    clang-21
powerpc    randconfig-001-20250415    gcc-5.5.0
powerpc    randconfig-002-20250415    clang-17
powerpc    randconfig-003-20250415    gcc-7.5.0
powerpc64  randconfig-001-20250415    gcc-7.5.0
powerpc64  randconfig-002-20250415    clang-17
powerpc64  randconfig-003-20250415    gcc-10.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

