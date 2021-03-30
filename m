Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A779134E8DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:20:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8qn64wPNz3c5V
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 00:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F8qml0NNhz3bpD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 00:19:48 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5560C31B;
 Tue, 30 Mar 2021 06:19:45 -0700 (PDT)
Received: from [10.57.27.121] (unknown [10.57.27.121])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F11D03F694;
 Tue, 30 Mar 2021 06:19:42 -0700 (PDT)
Subject: Re: [PATCH 16/18] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
To: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-17-hch@lst.de>
 <20210330131149.GP5908@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a6952aa7-4d7e-54f0-339e-e15f88596dcc@arm.com>
Date: Tue, 30 Mar 2021 14:19:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210330131149.GP5908@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, Li Yang <leoyang.li@nxp.com>,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-03-30 14:11, Will Deacon wrote:
> On Tue, Mar 16, 2021 at 04:38:22PM +0100, Christoph Hellwig wrote:
>> From: Robin Murphy <robin.murphy@arm.com>
>>
>> Instead make the global iommu_dma_strict paramete in iommu.c canonical by
>> exporting helpers to get and set it and use those directly in the drivers.
>>
>> This make sure that the iommu.strict parameter also works for the AMD and
>> Intel IOMMU drivers on x86.  As those default to lazy flushing a new
>> IOMMU_CMD_LINE_STRICT is used to turn the value into a tristate to
>> represent the default if not overriden by an explicit parameter.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>.
>> [ported on top of the other iommu_attr changes and added a few small
>>   missing bits]
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>   drivers/iommu/amd/iommu.c                   | 23 +-------
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 50 +---------------
>>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  1 -
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c       | 27 +--------
>>   drivers/iommu/dma-iommu.c                   |  9 +--
>>   drivers/iommu/intel/iommu.c                 | 64 ++++-----------------
>>   drivers/iommu/iommu.c                       | 27 ++++++---
>>   include/linux/iommu.h                       |  4 +-
>>   8 files changed, 40 insertions(+), 165 deletions(-)
> 
> I really like this cleanup, but I can't help wonder if it's going in the
> wrong direction. With SoCs often having multiple IOMMU instances and a
> distinction between "trusted" and "untrusted" devices, then having the
> flush-queue enabled on a per-IOMMU or per-domain basis doesn't sound
> unreasonable to me, but this change makes it a global property.

The intent here was just to streamline the existing behaviour of 
stuffing a global property into a domain attribute then pulling it out 
again in the illusion that it was in any way per-domain. We're still 
checking dev_is_untrusted() before making an actual decision, and it's 
not like we can't add more factors at that point if we want to.

> For example, see the recent patch from Lu Baolu:
> 
> https://lore.kernel.org/r/20210225061454.2864009-1-baolu.lu@linux.intel.com

Erm, this patch is based on that one, it's right there in the context :/

Thanks,
Robin.
