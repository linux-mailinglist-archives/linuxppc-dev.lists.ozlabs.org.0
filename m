Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2057ACE20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 04:31:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOnk0rt0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv6Lg2K15z3cFt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 12:31:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MOnk0rt0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv6Kk3N5Gz3c28
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 12:30:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695609018; x=1727145018;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=38lEStwphX64OpE2A2DbRTLCtqjQh1vzpQGGTEpXLCk=;
  b=MOnk0rt0JozoieCVLTkKpdYgF8k5FvZO72Dnt/n4/RiPWuBO9do3zfsW
   5aA2g2AhyPpxJ7wfMdu4qf9oYwbdemcHEfTEefycLJs4aMKoV71ac8HlJ
   5VkxXMrjAVcRqPCLz5914BTPF0uzkLjWOWwzptE4LRWEu86N0OS/E01cA
   O7p94h9nTP1TOPBYCiaHKZqERlWB031RyRcA/Y6RYPCwDjhPIWQXCAH74
   oCrLd+5KOYrd9X2zjahRspe0l+Q1FjddE1vGSS54i1ogehGwffxuvvTUZ
   PAqu2VfCSzzNB3/ugzaezt0aOlTf1+nrgMb/tLfkbaoMtr6/PPA+r7R2G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="380026689"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="380026689"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 19:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="741746070"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="741746070"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127]) ([10.239.159.127])
  by orsmga007.jf.intel.com with ESMTP; 24 Sep 2023 19:30:08 -0700
Message-ID: <4c3bc724-e162-98d7-1ecd-0ed8950bbb34@linux.intel.com>
Date: Mon, 25 Sep 2023 10:26:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/8] iommu: Move IOMMU_DOMAIN_BLOCKED global statics to
 ops->blocked_domain
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Hector Martin <marcan@marcan.st>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Sven Peter <sven@svenpeter.dev>, Will Deacon <will@kernel.org>
References: <1-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <1-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/23/23 1:07 AM, Jason Gunthorpe wrote:
> Following the pattern of identity domains, just assign the BLOCKED domain
> global statics to a value in ops. Update the core code to use the global
> static directly.
> 
> Update powerpc to use the new scheme and remove its empty domain_alloc
> callback.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   arch/powerpc/kernel/iommu.c | 9 +--------
>   drivers/iommu/iommu.c       | 2 ++
>   include/linux/iommu.h       | 3 +++
>   3 files changed, 6 insertions(+), 8 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
