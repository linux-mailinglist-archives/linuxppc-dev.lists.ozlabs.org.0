Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 770006E8913
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 06:24:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q24L82LPrz3fVK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 14:24:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMbr5Wvs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JMbr5Wvs;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q24KH6mW2z3cBX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 14:23:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681964612; x=1713500612;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XukRQffyaLcurPj0MIxT2KBrbiwJQ4mOpE0STVWyGKg=;
  b=JMbr5Wvs8SEJ5Gvfy1k8zqCOjMhlPg5mhKYrUNd48vZw+RIBiF9qyMbN
   tpUu3YgRq1R06rCVxDCmjeRzUNKNDuhzEYp5kfC+deGDMyqphN3pSYr0R
   G8Nkx6/9IxggL0MQnf/+qh/Bi6+0DNXm2l9ieGvNAgFYcf9BgEZ0jp1R7
   wCBmo/X3jjEvy4OILBJ68hz8nCDsAXNu+iT3xFDjrWFvniP0SK0nL7CE2
   wOpF7Z35nHTeTbAE19O7SyV8a1cWxxHjbtR3pSK1VCMLMXU98TYz/eI9n
   IN0O6BBGv4R2e8m8KrROTfcCAw44sglNBJRlraMI2Jww3SfyOfBgclqGO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345630240"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="345630240"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 21:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="781099157"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="781099157"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127]) ([10.239.159.127])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Apr 2023 21:23:15 -0700
Message-ID: <da60a120-e1dd-3b61-d6c4-ba0d955e2339@linux.intel.com>
Date: Thu, 20 Apr 2023 12:23:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/11] iommu: Always destroy the iommu_group during
 iommu_release_device()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
References: <8-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/23 12:11 AM, Jason Gunthorpe wrote:
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index dbaf3ed9012c45..a82516c8ea87ad 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -569,7 +569,6 @@ static void __iommu_group_remove_device(struct device *dev)
>   			dev->iommu_group = NULL;
>   		goto out;

Nit, given that below line has been removed, can above simply be a
loop break?

>   	}
> -	WARN(true, "Corrupted iommu_group device_list");
>   out:
>   	mutex_unlock(&group->mutex);

Best regards,
baolu

