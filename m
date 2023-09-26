Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D947AF441
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 21:42:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rw9BQ41RBz3ccS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 05:42:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 410 seconds by postgrey-1.37 at boromir; Wed, 27 Sep 2023 05:42:07 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rw99q62fGz3c50
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 05:42:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A51DDA7;
	Tue, 26 Sep 2023 12:42:13 -0700 (PDT)
Received: from [10.57.1.70] (unknown [10.57.1.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C9243F59C;
	Tue, 26 Sep 2023 12:41:32 -0700 (PDT)
Message-ID: <61aea9de-6bb1-5859-fcc6-b631bc829e3b@arm.com>
Date: Tue, 26 Sep 2023 20:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/8] iommu/dart: Move the blocked domain support to a
 global static
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
To: Janne Grunau <j@jannau.net>, Jason Gunthorpe <jgg@nvidia.com>
References: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
 <6-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com> <ZRMrZJ1HgpULWeyv@robin>
 <a9e937e8-4cc9-631a-af31-407d974ed3ec@arm.com>
In-Reply-To: <a9e937e8-4cc9-631a-af31-407d974ed3ec@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, Sven Peter <sven@svenpeter.dev>, linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>, Hector Martin <marcan@marcan.st>, Nicholas Piggin <npiggin@gmail.com>, iommu@lists.linux.dev, asahi@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-09-26 20:34, Robin Murphy wrote:
> On 2023-09-26 20:05, Janne Grunau wrote:
>> Hej,
>>
>> On Fri, Sep 22, 2023 at 02:07:57PM -0300, Jason Gunthorpe wrote:
>>> Move to the new static global for blocked domains. Move the blocked
>>> specific code to apple_dart_attach_dev_blocked().
>>>
>>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>> ---
>>>   drivers/iommu/apple-dart.c | 36 ++++++++++++++++++++++++++----------
>>>   1 file changed, 26 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
>>> index 424f779ccc34df..376f4c5461e8f7 100644
>>> --- a/drivers/iommu/apple-dart.c
>>> +++ b/drivers/iommu/apple-dart.c
>>> @@ -675,10 +675,6 @@ static int apple_dart_attach_dev(struct 
>>> iommu_domain *domain,
>>>           for_each_stream_map(i, cfg, stream_map)
>>>               apple_dart_setup_translation(dart_domain, stream_map);
>>>           break;
>>> -    case IOMMU_DOMAIN_BLOCKED:
>>> -        for_each_stream_map(i, cfg, stream_map)
>>> -            apple_dart_hw_disable_dma(stream_map);
>>> -        break;
>>>       default:
>>>           return -EINVAL;
>>>       }
>>> @@ -710,6 +706,30 @@ static struct iommu_domain 
>>> apple_dart_identity_domain = {
>>>       .ops = &apple_dart_identity_ops,
>>>   };
>>> +static int apple_dart_attach_dev_blocked(struct iommu_domain *domain,
>>> +                     struct device *dev)
>>> +{
>>> +    struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
>>> +    struct apple_dart_stream_map *stream_map;
>>> +    int i;
>>> +
>>> +    if (cfg->stream_maps[0].dart->force_bypass)
>>> +        return -EINVAL;
>>
>> unrelated to this change as this keeps the current behavior but I think
>> force_bypass should not override IOMMU_DOMAIN_BLOCKED. It is set if the
>> CPU page size is smaller than dart's page size. Obviously dart can't
>> translate in that situation but it should be still possible to block it
>> completely.
>>
>> How do we manage this? I can write a patch either to the current state
>> or based on this series.
> 
> The series is queued already, so best to send a patch based on 
> iommu/core (I guess just removing these lines?).

Um, what? This isn't the domain_alloc_paging series itself, Robin you 
fool. Clearly it's time to close the computer and try again tomorrow...

Cheers,
Robin.

> It won't be 
> super-useful in practice since the blocking domain is normally only used 
> to transition to an unmanaged domain which in the force_bypass situation 
> can't be used anyway, but it's still nice on principle not to have 
> unnecessary reasons for attach to fail.
> 
> Thanks,
> Robin.
> 
>>
>>> +
>>> +    for_each_stream_map(i, cfg, stream_map)
>>> +        apple_dart_hw_disable_dma(stream_map);
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct iommu_domain_ops apple_dart_blocked_ops = {
>>> +    .attach_dev = apple_dart_attach_dev_blocked,
>>> +};
>>> +
>>> +static struct iommu_domain apple_dart_blocked_domain = {
>>> +    .type = IOMMU_DOMAIN_BLOCKED,
>>> +    .ops = &apple_dart_blocked_ops,
>>> +};
>>> +
>>>   static struct iommu_device *apple_dart_probe_device(struct device 
>>> *dev)
>>>   {
>>>       struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
>>> @@ -739,8 +759,7 @@ static struct iommu_domain 
>>> *apple_dart_domain_alloc(unsigned int type)
>>>   {
>>>       struct apple_dart_domain *dart_domain;
>>> -    if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED &&
>>> -        type != IOMMU_DOMAIN_BLOCKED)
>>> +    if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
>>>           return NULL;
>>>       dart_domain = kzalloc(sizeof(*dart_domain), GFP_KERNEL);
>>> @@ -749,10 +768,6 @@ static struct iommu_domain 
>>> *apple_dart_domain_alloc(unsigned int type)
>>>       mutex_init(&dart_domain->init_lock);
>>> -    /* no need to allocate pgtbl_ops or do any other finalization 
>>> steps */
>>> -    if (type == IOMMU_DOMAIN_BLOCKED)
>>> -        dart_domain->finalized = true;
>>> -
>>>       return &dart_domain->domain;
>>>   }
>>> @@ -966,6 +981,7 @@ static void apple_dart_get_resv_regions(struct 
>>> device *dev,
>>>   static const struct iommu_ops apple_dart_iommu_ops = {
>>>       .identity_domain = &apple_dart_identity_domain,
>>> +    .blocked_domain = &apple_dart_blocked_domain,
>>>       .domain_alloc = apple_dart_domain_alloc,
>>>       .probe_device = apple_dart_probe_device,
>>>       .release_device = apple_dart_release_device,
>>> -- 
>>> 2.42.0
>>
>> Reviewed-by: Janne Grunau <j@jannau.net>
>>
>> best regards
>> Janne
>>
>> ps: I sent the reply to [Patch 4/8] accidentally with an incorrect from
>> address but the correct Reviewed-by:. I can resend if necessary.
> 
