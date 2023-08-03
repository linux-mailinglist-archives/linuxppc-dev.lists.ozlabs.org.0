Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EBD76E44A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 11:25:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AGIl5hWo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWJxFnZC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGk2n26P0z3cLV
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 19:25:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AGIl5hWo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fWJxFnZC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGk1t0KzLz30gP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 19:24:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691054652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3WIFpcDecyPBPZDJa2C/HSA+GqxTetHp56fbdGINRyM=;
	b=AGIl5hWoiIE3IjzbBY0o7q9DeXF6xvkc1n3RF1r0tMbXKA2xyc/ydPFTtqwksGOqA9HN8A
	9ZsTPG1KOC8Rdg1YX5dlF0gVFPOBqVFwSslSAU+twm88GN/j98BBnvYxuplvAA3fJyeHB5
	sN4uyD3CHtaOdwLUV89lUVhVKJUw0gk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691054653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3WIFpcDecyPBPZDJa2C/HSA+GqxTetHp56fbdGINRyM=;
	b=fWJxFnZCnALcnjDISn1duvw7f0zj/NA3XXsAqZigUocRyFJ3kfnTeMcFB9Ah+IMsRpEb28
	u8Zeh/C4Gg++hdSp9ls3CmQEg3MuFXY0FM9MO3+zyKJWdnkbISDHh1CPWfirgQpMfRncI1
	OZU0UBT7IiQuecdQ2n5NBJ8pA7w/pPE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-FpHO6nXgPRKBPz8jkQ4qOg-1; Thu, 03 Aug 2023 05:24:11 -0400
X-MC-Unique: FpHO6nXgPRKBPz8jkQ4qOg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3fe19cf2796so5104745e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Aug 2023 02:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691054650; x=1691659450;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WIFpcDecyPBPZDJa2C/HSA+GqxTetHp56fbdGINRyM=;
        b=AQFFAGX4j5bSxdabAdIIj5uc2CwDjllQmcbMKwXFh418GfSveYxxiaPLxJ2/nhbh25
         FdPjzxw7sWat2D7AEl9rSPAY0v7J47tIIN+u0g7aDNQ6AOisJJG7JZ/ofTDgrX5rLz3J
         fThXlnH3ZCgEIS60yCm2WoeVK8z8UEztZPy0j4iUpSpGY/oBvS7T91dQssvRuiSKmyUe
         3mDlDikerVLhJmVgTUdcxUgkgP+KyHdhAxmwC6G9VQ7z5U51xfuuIUVc88y1/3IDqs/Q
         VSweeO04Y7f4Hd0itmNl3rPI6gn1GJ7SoRgsFIBKbGKNuUfTmxmMoZ0JiqVVbB7/mTZ9
         hVyw==
X-Gm-Message-State: ABy/qLavl69ms5WuEQEbS9grX6dzUs9G3sdPlKytfpOBen940vuBnkki
	ws5UkIJksD3CreeWcCJKUxewJg7u1Nruj92ie8qkGb7A0BIXOstwiCBoqtW9bsPoN3RFR/9+DE7
	2dOEZ0yP5CgMssgavBzNYj8s3AQ==
X-Received: by 2002:a5d:4847:0:b0:313:eb29:4436 with SMTP id n7-20020a5d4847000000b00313eb294436mr7133222wrs.67.1691054650401;
        Thu, 03 Aug 2023 02:24:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFjX9fBwtEKHvbthMHsENAzcm9c2T2DJFmneGeXmLu4/R/dytL9uj33Y0dSxRui3+JSN4Xrog==
X-Received: by 2002:a5d:4847:0:b0:313:eb29:4436 with SMTP id n7-20020a5d4847000000b00313eb294436mr7133199wrs.67.1691054649977;
        Thu, 03 Aug 2023 02:24:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c718:9a00:a5f5:5315:b9fa:64df? (p200300cbc7189a00a5f55315b9fa64df.dip0.t-ipconnect.de. [2003:cb:c718:9a00:a5f5:5315:b9fa:64df])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b003145559a691sm21291061wrs.41.2023.08.03.02.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 02:24:09 -0700 (PDT)
Message-ID: <1c6a74f0-85e9-5299-1520-9068e842b1a5@redhat.com>
Date: Thu, 3 Aug 2023 11:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Michal Hocko <mhocko@suse.com>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
 <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
 <ZMqLV2S6vY0cZxbp@dhcp22.suse.cz> <ZMtqu76Tgh9jj+AI@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
In-Reply-To: <ZMtqu76Tgh9jj+AI@dhcp22.suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com, linux-mm@kvack.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03.08.23 10:52, Michal Hocko wrote:
> On Wed 02-08-23 18:59:04, Michal Hocko wrote:
>> On Wed 02-08-23 17:54:04, David Hildenbrand wrote:
>>> On 02.08.23 17:50, Michal Hocko wrote:
>>>> On Wed 02-08-23 10:15:04, Aneesh Kumar K V wrote:
>>>>> On 8/1/23 4:20 PM, Michal Hocko wrote:
>>>>>> On Tue 01-08-23 14:58:29, Aneesh Kumar K V wrote:
>>>>>>> On 8/1/23 2:28 PM, Michal Hocko wrote:
>>>>>>>> On Tue 01-08-23 10:11:16, Aneesh Kumar K.V wrote:
>>>>>>>>> Allow updating memmap_on_memory mode after the kernel boot. Memory
>>>>>>>>> hotplug done after the mode update will use the new mmemap_on_memory
>>>>>>>>> value.
>>>>>>>>
>>>>>>>> Well, this is a user space kABI extension and as such you should spend
>>>>>>>> more words about the usecase. Why we could live with this static and now
>>>>>>>> need dynamic?
>>>>>>>>
>>>>>>>
>>>>>>> This enables easy testing of memmap_on_memory feature without a kernel reboot.
>>>>>>
>>>>>> Testing alone is rather weak argument to be honest.
>>>>>>
>>>>>>> I also expect people wanting to use that when they find dax kmem memory online
>>>>>>> failing because of struct page allocation failures[1]. User could reboot back with
>>>>>>> memmap_on_memory=y kernel parameter. But being able to enable it via sysfs makes
>>>>>>> the feature much more useful.
>>>>>>
>>>>>> Sure it can be useful but that holds for any feature, right. The main
>>>>>> question is whether this is worth maintaing. The current implementation
>>>>>> seems rather trivial which is an argument to have it but are there any
>>>>>> risks long term? Have you evaluated a potential long term maintenance
>>>>>> cost? There is no easy way to go back and disable it later on without
>>>>>> breaking some userspace.
>>>>>>
>>>>>> All that should be in the changelog!
>>>>>
>>>>> I updated it as below.
>>>>>
>>>>> mm/memory_hotplug: Enable runtime update of memmap_on_memory parameter
>>>>>
>>>>> Allow updating memmap_on_memory mode after the kernel boot. Memory
>>>>> hotplug done after the mode update will use the new mmemap_on_memory
>>>>> value.
>>>>>
>>>>> It is now possible to test the memmap_on_memory feature easily without
>>>>> the need for a kernel reboot. Additionally, for those encountering
>>>>> struct page allocation failures while using dax kmem memory online, this
>>>>> feature may prove useful. Instead of rebooting with the
>>>>> memmap_on_memory=y kernel parameter, users can now enable it via sysfs,
>>>>> which greatly enhances its usefulness.
>>>>
>>>>
>>>> I do not really see a solid argument why rebooting is really a problem
>>>> TBH. Also is the global policy knob really the right fit for existing
>>>> hotplug usecases? In other words, if we really want to make
>>>> memmap_on_memory more flexible would it make more sense to have it per
>>>> memory block property instead (the global knob being the default if
>>>> admin doesn't specify it differently).
>>>
>>> Per memory block isn't possible, due to the creation order.
>>
>> I am not sure I follow. Could you elaborate more?
> 
> Must have been a tired brain. Now I see what you mean of course. vmemmap
> is allocated at the time the range is registered and therefore memory
> block sysfs created. So you are right that it is too late in some sense
> but I still believe that this would be doable. The memmap_on_memory file

Exactly.

> would be readable only when the block is offline and it would reallocate
> vmemmap on the change. Makes sense? Are there any risks? Maybe pfn
> walkers?

The question is: is it of any real value such that it would be worth the 
cost and risk?


One of the primary reasons for memmap_on_memory is that *memory hotplug* 
succeeds even in low-memory situations (including, low on ZONE_NORMAL 
situations). So you want that behavior already when hotplugging such 
devices. While there might be value to relocate it later, I'm not sure 
if that is really worth it, and it does not solve the main use case.

For dax/kmem memory hotplug this is controlled by user space, so user 
space can easily configure it. For DIMMs it's just a hotplug event that 
triggers all that in the kernel, and one has to plan ahead (e.g., set 
the global kernel parameter).

Besides, devices like virtio-mem really cannot universally support 
memmap_on_memory.

-- 
Cheers,

David / dhildenb

