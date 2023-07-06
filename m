Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF4A749A81
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 13:21:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QZpWqGyq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QZpWqGyq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxYxr3PyWz309t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 21:21:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QZpWqGyq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QZpWqGyq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxYwS2xKbz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:20:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688642404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3OZfpCf3nYVTSLsybs1N/nmixfoOU0Sp6CWVcqL0LM=;
	b=QZpWqGyq9RMAb088mdBIQIoCZ/go2A2MnaLkMMcoPd8hwbXiuxptYh6fKGNyimwo7w4G3k
	qL9sVZYmTXEFBOwsfpZoinBiaLZJtgpIqp31Jm6dAfmekJRtRZR0RKJrHyGNx49WIyVOMk
	8nGZCg3xlAuFG11u/hRWmFOo+7id4Bc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688642404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L3OZfpCf3nYVTSLsybs1N/nmixfoOU0Sp6CWVcqL0LM=;
	b=QZpWqGyq9RMAb088mdBIQIoCZ/go2A2MnaLkMMcoPd8hwbXiuxptYh6fKGNyimwo7w4G3k
	qL9sVZYmTXEFBOwsfpZoinBiaLZJtgpIqp31Jm6dAfmekJRtRZR0RKJrHyGNx49WIyVOMk
	8nGZCg3xlAuFG11u/hRWmFOo+7id4Bc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-5tbz78ZPOweT4-Ued6od9g-1; Thu, 06 Jul 2023 07:20:03 -0400
X-MC-Unique: 5tbz78ZPOweT4-Ued6od9g-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3144bf68a03so289241f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 04:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688642402; x=1691234402;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3OZfpCf3nYVTSLsybs1N/nmixfoOU0Sp6CWVcqL0LM=;
        b=fKxaQy1TxTaq4oEJA8Wgj02V2j2dAJxJToN3gx5UJwlNz36c6YYFmAb6WLWUH3IAPz
         qIeZb2I9ydE1c5IeiiFiZYWHzanJFSjqQVBgnpB+1jFAOIEwsR/nwkQ2lq68IsLHxx0B
         Ixy2vgauSM2Mr+usLXLhMLaKdq5s1ig4CsUgmE4upBKfHvbmYclJIOPtnEGrM4jTsVVf
         pMRO30i7G9qLRIgym8OnG9/deEn1ApA71zsSVgeqpgARsmsOgnZm9RYlDoUs+NkLQ5l5
         cBuvGmPleRFuYqtbPFxoV5Ugvl1XOnDBt1DbM1QYzV0ZxvIoi7F7bWvQeD0kI+XZOIIr
         G1bw==
X-Gm-Message-State: ABy/qLaC9yavLTol3U4ytngiN6psUudDYvkMKvFNFes+b05f35TCGkLo
	lccJPwkqdne5pfsMFH0hz7290d8V0yeg+AncR3KpUvEREe42d0hrKchow7Q3Hpr5CLk6EeoaVXK
	BooyK7YN6fAxXy12SjasKlih98w==
X-Received: by 2002:a05:6000:4c5:b0:314:1d7f:a69 with SMTP id h5-20020a05600004c500b003141d7f0a69mr1268488wri.67.1688642402171;
        Thu, 06 Jul 2023 04:20:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHZAwbHEr1vsEZtNgwKbCBgf4iFcTem81yQIzqgFRnJGnBeWSOU03YEUyZxhmM7G4P1M6qckg==
X-Received: by 2002:a05:6000:4c5:b0:314:1d7f:a69 with SMTP id h5-20020a05600004c500b003141d7f0a69mr1268467wri.67.1688642401752;
        Thu, 06 Jul 2023 04:20:01 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id x18-20020a5d60d2000000b0031435731dfasm1622848wrt.35.2023.07.06.04.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:20:01 -0700 (PDT)
Message-ID: <ae273266-0104-590a-fffd-7af95aedd8b3@redhat.com>
Date: Thu, 6 Jul 2023 13:20:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-4-aneesh.kumar@linux.ibm.com>
 <0efcd10b-dff8-d011-e192-5feaedc2ee2d@redhat.com>
 <8763c269-90da-4754-85a2-ef32d2540362@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 3/5] mm/hotplug: Simplify the handling of
 MHP_MEMMAP_ON_MEMORY flag
In-Reply-To: <8763c269-90da-4754-85a2-ef32d2540362@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.07.23 12:04, Aneesh Kumar K V wrote:
> On 7/6/23 2:54 PM, David Hildenbrand wrote:
>> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>>> Instead of checking for memmap on memory feature enablement within the
>>> functions checking for alignment, use the kernel parameter to control the
>>> memory hotplug flags. The generic kernel now enables memmap on memory
>>> feature if the hotplug flag request for the same.
>>>
>>> The ACPI code now can pass the flag unconditionally because the kernel will
>>> fallback to not using the feature if the alignment rules are not met.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>    drivers/acpi/acpi_memhotplug.c |  3 +--
>>>    include/linux/memory_hotplug.h | 14 ++++++++++++++
>>>    mm/memory_hotplug.c            | 35 +++++++++++-----------------------
>>>    3 files changed, 26 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
>>> index 24f662d8bd39..4d0096fc4cc2 100644
>>> --- a/drivers/acpi/acpi_memhotplug.c
>>> +++ b/drivers/acpi/acpi_memhotplug.c
>>> @@ -211,8 +211,7 @@ static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
>>>            if (!info->length)
>>>                continue;
>>>    -        if (mhp_supports_memmap_on_memory(info->length))
>>> -            mhp_flags |= MHP_MEMMAP_ON_MEMORY;
>>> +        mhp_flags |= get_memmap_on_memory_flags();
>>>            result = __add_memory(mgid, info->start_addr, info->length,
>>>                          mhp_flags);
>>>    diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>>> index a769f44b8368..af7017122506 100644
>>> --- a/include/linux/memory_hotplug.h
>>> +++ b/include/linux/memory_hotplug.h
>>> @@ -358,4 +358,18 @@ bool mhp_supports_memmap_on_memory(unsigned long size);
>>>    bool __mhp_supports_memmap_on_memory(unsigned long size);
>>>    #endif /* CONFIG_MEMORY_HOTPLUG */
>>>    +#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
>>> +extern bool memmap_on_memory;
>>> +static inline unsigned long get_memmap_on_memory_flags(void)
>>> +{
>>> +    if (memmap_on_memory)
>>> +        return MHP_MEMMAP_ON_MEMORY;
>>> +    return 0;
>>> +}
>>> +#else
>>> +static inline unsigned long get_memmap_on_memory_flags(void)
>>> +{
>>> +    return 0;
>>> +}
>>> +#endif
>>
>> That's kind-of ugly TBH.
>>
>>
>> Why do we need this change?
>>
> 
> I was trying to avoid rest of the kernel doing
> 
> if (mhp_supports_memmap_on_memory(info->length))
>           mhp_flags |= MHP_MEMMAP_ON_MEMORY;

It would look much cleaner if you would simply have:

mhp_flags |= MHP_MEMMAP_ON_MEMORY;
result = __add_memory(mgid, info->start_addr, info->length, mhp_flags);

And modify the semantics of MHP_MEMMAP_ON_MEMORY to mean "allocate the 
memmap from hotplugged memory if supported and enabled globally".

Then, we can simply ignore the flag in __add_memory() if either the 
global toggle is off or if it's not supported for the range / by the arch.

Maybe, in the future we want more fine-grained control (as asked by 
dax/kmem) and maybe not have the global toggle. But for now, that should 
be good enough I guess.

-- 
Cheers,

David / dhildenb

