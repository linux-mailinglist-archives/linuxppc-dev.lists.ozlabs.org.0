Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5996E8917
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 06:26:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q24NH47Ljz3fRH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 14:26:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lseaw+ue;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lseaw+ue;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q24MS3hnLz305g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 14:25:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681964724; x=1713500724;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uGkJDuCA5roZl+Gwls4r+YKtHGHUCchxEOme/jljAmg=;
  b=Lseaw+ueEKMviMvc5z4bIxGoZVi3dc0VTRcp6JhWAnFfpXqFlsd62QOQ
   t+HdI4BEa5AYRt4T/QEVqrh/a2iDGtbrixFvsUwb8AQ8mis2+VurbFzeN
   3ARWFkwxkE4p/xF7h12M5tCp5KfaaV20w3ei+Oth46iCPXNXGrAY+rwUj
   LqsoAUsgI6U1OeMnurjsgIP2X8hEWT2GGysXoVH5vyhd3fmnQlwHo69Wv
   kLK+q24GOkSmHgsjQmnwlHc2FCsDwtWbWIMd96UUjQ3WdOb+7S+KOeYDV
   /AM0P6m90t6TcY16/foqJfEBffC6Vzr/x9opMH+bBPb8ix8PXAFLfGnyS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347489835"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="347489835"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 21:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760994039"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="760994039"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127]) ([10.239.159.127])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 21:25:16 -0700
Message-ID: <132ceb1f-4559-5a99-af47-1a86a677eae7@linux.intel.com>
Date: Thu, 20 Apr 2023 12:25:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 10/11] iommu: Split iommu_group_add_device()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
References: <10-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <10-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
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
> @@ -451,16 +454,17 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
>   		goto out_unlock;
>   
>   	group = dev->iommu_group;
> -	ret = iommu_group_add_device(group, dev);
> +	gdev = iommu_group_alloc_device(group, dev);
>   	mutex_lock(&group->mutex);
> -	if (ret)
> +	if (IS_ERR(gdev)) {
> +		ret = PTR_ERR(gdev);
>   		goto err_put_group;
> +	}
>   
> +	list_add_tail(&gdev->list, &group->devices);

Do we need to put

	dev->iommu_group = group;

here?

>   	if (group_list && !group->default_domain && list_empty(&group->entry))
>   		list_add_tail(&group->entry, group_list);
>   	mutex_unlock(&group->mutex);
> -	iommu_group_put(group);
> -
>   	mutex_unlock(&iommu_probe_device_lock);
>   
>   	return 0;

Best regards,
baolu
