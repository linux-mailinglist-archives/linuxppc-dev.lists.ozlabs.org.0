Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1F7AE432
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 05:33:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CyuwDAqN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvlh05gpJz3ck5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 13:33:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CyuwDAqN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.136; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvlg34N6Lz3c4R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 13:32:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695699152; x=1727235152;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=j5sV+dy3BVav18WZOciO3rS/x/PvG9EXKQ8HyMFJTGc=;
  b=CyuwDAqN/lQ47yVsv8Y+UoniRAC0BPRlO9+1QxrEV/utHA/faKHmWVRT
   daoDPgVnz1lfQ8xVHzVwxEN1zBed5YbtaxanGAxB89jifvpt3OHs1o4vl
   HotA6xD72+8Jbz+YLUMEmlWjiE+MDewXbMg52z2DzWaJ/XkoVkDe1yyB3
   11YDtOpskAKlqNz43f+zAAmX8ej3VjPCL783pveBzphyKfIRylNA454Wx
   AnLbAtexEStXFraRhxhjhtHMceOKgi+s8sRVRgF8jFIUe66xmzuXVlj4B
   Siallm4jA+9D8N8uGtsyd2JycX8q0TtG1C2lT6odu+hX30GT4QChqykj0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360849979"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="360849979"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 20:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079535961"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="1079535961"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127]) ([10.239.159.127])
  by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2023 20:32:14 -0700
Message-ID: <c43a44bc-1134-d420-459d-1a99a485e333@linux.intel.com>
Date: Tue, 26 Sep 2023 11:28:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/8] iommu/vt-d: Use ops->blocked_domain
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <3-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
 <ad9644a2-e8a6-d0fa-ad55-f4e0564c39a0@linux.intel.com>
 <20230925114142.GU13733@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20230925114142.GU13733@nvidia.com>
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
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>, linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/25/23 7:41 PM, Jason Gunthorpe wrote:
> On Mon, Sep 25, 2023 at 10:29:52AM +0800, Baolu Lu wrote:
>> On 9/23/23 1:07 AM, Jason Gunthorpe wrote:
>>> Trivially migrate to the ops->blocked_domain for the existing global
>>> static.
>>>
>>> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
>>> ---
>>>    drivers/iommu/intel/iommu.c | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
>>
>> P.S. We can further do the same thing to the identity domain. I will
>> clean it up after all patches are landed.
> 
> I looked at that, and it is not trivial..
> 
> Both the Intel and virtio-iommu drivers create an "identity" domain
> out of a paging domain and pass that off as a true "identity"
> domain. So neither can set the global static since the determination
> is at runtime..

Emm, yes. The early hardware requires a real 1:1 mapped page table. The
recent implementations are no longer needed.

> 
> What I was thinking about doing is consolidating that code so that the
> core logic is the thing turning a paging domain into an identity
> domain.

Yes. It's not trivial. Needs a separated series with some refactoring
efforts.

Best regards,
baolu
