Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 961AD77A650
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Aug 2023 14:12:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIci73oJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RNxHX3rTXz3c1l
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Aug 2023 22:12:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kIci73oJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RNxGc3jM5z2xpd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Aug 2023 22:11:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691928712; x=1723464712;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EPKMap/YIslWzTcA4tjCBfC0/lQThAIgVXzQUtL7nv8=;
  b=kIci73oJNltxW/9ANv0Oh/yJTlj5jVjpviA41ErtyqXQauDvqjowwaHE
   2gf5gIcnLtdilORNHmaZzJFszUnAAW1HNdL1gwSMNIsZcYZn2uqCDyit3
   o6wiKdRqIBHgahXIh3PkkSspNMIBQDSIoRkXG15uxUsnj6gSpkpmNg6um
   VnKoHiDcMWhBX7i1zXSMkY/EckRagvJcpZLDueFryI5598IaWPvkh1209
   zoBpGKuXBVNTj4NWwPmLoY7X45hQXT5+iftdt6QK4qPSdDZvp81H/CdK5
   IwYkgUpvmIWIWvbnVAIU2m5GOLf7j/EI4ADDmbmScY1I89BU7fsgF+2oS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="356852447"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="356852447"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 05:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="906929981"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="906929981"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.249.169.238]) ([10.249.169.238])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 05:11:32 -0700
Message-ID: <a9651d96-dbfb-aece-0811-2b36c4eb0a07@linux.intel.com>
Date: Sun, 13 Aug 2023 20:11:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
To: Jason Gunthorpe <jgg@nvidia.com>
References: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <dde32ea5-2b1a-1148-c329-3c52ffcb71a7@linux.intel.com>
 <ZNds4kejneylOYBE@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNds4kejneylOYBE@nvidia.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas Schnelle
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/8/12 19:28, Jason Gunthorpe wrote:
> On Sat, Aug 12, 2023 at 09:36:33AM +0800, Baolu Lu wrote:
>>> @@ -290,6 +295,7 @@ struct iommu_ops {
>>>    	unsigned long pgsize_bitmap;
>>>    	struct module *owner;
>>>    	struct iommu_domain *identity_domain;
>>> +	struct iommu_domain *default_domain;
>>
>> I am imaging whether we can merge above two pointers into a single one.
>> It is either an IDENTITY or PLATFORM domain and the core will choose it
>> as the default domain of a group if iommu_group_alloc_default_domain()
>> fails to allocate one through the iommu dev_ops.
> 
> I think that would be the wrong direction..
> 
> identity_domain is a pointer that is always, ALWAYS an identity
> domain. It is the shortcut for drivers (and all drivers should do
> this) that implement a global static identity domain.

I see. I originally thought this was special for arm32.

> 
> default_domain is a shortcut to avoid implementing the entire flow
> around def_domain_type/domain_alloc for special cases. For this patch
> the specialc ase is the IOMMU_DOMAIN_PLATFORM.

I think this is special for drivers like s390. You don't want it to be
used beyond those special drivers, right?

If so, the naming of default_domain seems to be a bit generic. I can't
think of a better one, hence I am fine if you keep as it-is. After all,
the comment for this field has already explained it very clearly.

> We'll probably also get a blocking_domain pointer here too.

Yes.

> 
> All of this is removing the type multiplexor in alloc_domain so we can
> so  alloc_domain_paging()

Agreed with you. The dummy domains like identity and blocking could be
avoided from calling ops->domain_alloc.

>> Probably we could give it a more meaningful name? For example,
>> supplemental_domain or rescue_domain?
> 
> But that isn't what it is for, default_domain is the operational
> domain for attached drivers..

Best regards,
baolu
