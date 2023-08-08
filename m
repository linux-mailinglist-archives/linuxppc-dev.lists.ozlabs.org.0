Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF937738B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:47:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZaJ2M2E4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZaJ2M2E4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKlds15Dcz3bVG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 17:47:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZaJ2M2E4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZaJ2M2E4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKlcv3GT9z2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 17:46:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691480795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxcO2hp4ISlhj4awg+YfQ24RiCWGYK36hAYVGCfHMR0=;
	b=ZaJ2M2E4wWlsExRN1WEx2oCx/NDS7frcNwq5cp/ILb44BTaCC2Pub4k75k8EhMVGtXCiIO
	MfQI2yoNgGkHdmin6TuW7eHgvjR1x2lbu3d6WCBdpeJ5/Si92vRZEZkBYKWWacFYnx5zDB
	DTawfEao/kabdOAvpdwZA64IOgTHnHo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691480795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxcO2hp4ISlhj4awg+YfQ24RiCWGYK36hAYVGCfHMR0=;
	b=ZaJ2M2E4wWlsExRN1WEx2oCx/NDS7frcNwq5cp/ILb44BTaCC2Pub4k75k8EhMVGtXCiIO
	MfQI2yoNgGkHdmin6TuW7eHgvjR1x2lbu3d6WCBdpeJ5/Si92vRZEZkBYKWWacFYnx5zDB
	DTawfEao/kabdOAvpdwZA64IOgTHnHo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-qgDXgxcnNFqzhToP4qm_bQ-1; Tue, 08 Aug 2023 03:46:34 -0400
X-MC-Unique: qgDXgxcnNFqzhToP4qm_bQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-317c8fbbd4fso2678592f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Aug 2023 00:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691480793; x=1692085593;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxcO2hp4ISlhj4awg+YfQ24RiCWGYK36hAYVGCfHMR0=;
        b=RGluavcBqyf4ZvwMAWmhFHzmlzv1iNUklTf4UIBudlDJhtE+Epf5nbG2i4rhhTiBbA
         yuOl3MUKYwCjBkfOvekay0uzoKPMOHmOvy3DmFyJwxFnKSr2dZuLwWZWFIu/hAiZ09B+
         rea0gbKB1PiojaF48mKTnYjn7ApHsxDM3B/HbEjm7G9t0NlYIlcipz7oAOvhQg4OdMQ7
         F9UWU4Wbbj+JIB5mn5TqYP9ianAKkKPepSOKqV1C6lM2duUA52+FGVCPCwdk6pytGxYE
         ul/T31HGAIW/1QMpzF4mwS+CvoyHyrYIwDNFstk8u6WIAvW3WrYdlApfS4cvXqLsDiA6
         BAfg==
X-Gm-Message-State: AOJu0Yw3G7RmVWQ6BoD+6d4nrBXLGQse7UdLfeUpqcx3UrJvPu4OK5Gk
	dUsbh0LS67UcyuQPm+DyeCCsLxNsnbhYBpxgZPDnkwxJy3OGZCsUxhDEQXjs3mfKi/zONIkKW9+
	4VxCt0evLhBpfD2vsgCCTRvomMw==
X-Received: by 2002:adf:fa08:0:b0:314:377:5e43 with SMTP id m8-20020adffa08000000b0031403775e43mr7932150wrr.48.1691480793084;
        Tue, 08 Aug 2023 00:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdAj3jm5YE6KVgdXoAD3dQThPI5Wqxv0sWP+q0KAedTJF6SJij2w1vD/ucSHXJwxwe2upENw==
X-Received: by 2002:adf:fa08:0:b0:314:377:5e43 with SMTP id m8-20020adffa08000000b0031403775e43mr7932134wrr.48.1691480792644;
        Tue, 08 Aug 2023 00:46:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74c:4500:a7dd:abc0:e4c2:4b31? (p200300cbc74c4500a7ddabc0e4c24b31.dip0.t-ipconnect.de. [2003:cb:c74c:4500:a7dd:abc0:e4c2:4b31])
        by smtp.gmail.com with ESMTPSA id k14-20020adfd84e000000b003177e9b2e64sm12709859wrl.90.2023.08.08.00.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 00:46:32 -0700 (PDT)
Message-ID: <e0261191-f586-4b2a-9864-568773a78053@redhat.com>
Date: Tue, 8 Aug 2023 09:46:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 Michal Hocko <mhocko@suse.com>
References: <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
 <ZMqLV2S6vY0cZxbp@dhcp22.suse.cz> <ZMtqu76Tgh9jj+AI@dhcp22.suse.cz>
 <1c6a74f0-85e9-5299-1520-9068e842b1a5@redhat.com>
 <ZMuP7gsxQzAmRpNX@dhcp22.suse.cz>
 <d71a85b1-c0ea-6451-d65c-d7c5040caf77@linux.ibm.com>
 <ZNDjHbtm3jaWS8h8@dhcp22.suse.cz>
 <a32a9e7f-1e24-bab1-cb73-8058fed3b59c@redhat.com>
 <b6753402-2de9-25b2-36e9-eacd49752b19@redhat.com>
 <41ffec19-775a-534b-b217-438d3bd8b94e@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <41ffec19-775a-534b-b217-438d3bd8b94e@linux.ibm.com>
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
Cc: linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08.08.23 08:29, Aneesh Kumar K V wrote:
> On 8/8/23 12:05 AM, David Hildenbrand wrote:
>> On 07.08.23 14:41, David Hildenbrand wrote:
>>> On 07.08.23 14:27, Michal Hocko wrote:
>>>> On Sat 05-08-23 19:54:23, Aneesh Kumar K V wrote:
>>>> [...]
>>>>> Do you see a need for firmware-managed memory to be hotplugged in with
>>>>> different memory block sizes?
>>>>
>>>> In short. Yes. Slightly longer, a fixed size memory block semantic is
>>>> just standing in the way and I would even argue it is actively harmful.
>>>> Just have a look at ridicously small memory blocks on ppc. I do
>>>> understand that it makes some sense to be aligned to the memory model
>>>> (so sparsmem section aligned). In an ideal world, memory hotplug v2
>>>> interface (if we ever go that path) should be physical memory range based.
>>>
>>> Yes, we discussed that a couple of times already (and so far nobody
>>> cared to implement any of that).
>>>
>>> Small memory block sizes are very beneficial for use cases like PPC
>>> dlar, virtio-mem, hyperv-balloon, ... essentially in most virtual
>>> environments where you might want to add/remove memory in very small
>>> granularity. I don't see that changing any time soon. Rather the opposite.
>>>
>>> Small memory block sizes are suboptimal for large machines where you
>>> might never end up removing such memory (boot memory), or when dealing
>>> with devices that can only be removed in one piece (DIMM/kmem). We
>>> already have memory groups in place to model that.
>>>
>>> For the latter it might be beneficial to have memory blocks of larger
>>> size that correspond to the physical memory ranges. That might also make
>>> a memmap (re-)configuration easier.
>>>
>>> Not sure if that is standing in any way or is harmful, though.
>>>
>>
>> Just because I thought of something right now, I'll share it, maybe it makes sense.
>>
>> Assume when we get add_memory*(MHP_MEMMAP_ON_MEMORY) and it is enabled by the admin:
>>
>> 1) We create a single altmap at the beginning of the memory
>>
>> 2) We create the existing fixed-size memory block devices, but flag them
>>     to be part of a single "altmap" unit.
>>
>> 3) Whenever we trigger offlining of a single such memory block, we
>>     offline *all* memory blocks belonging to that altmap, essentially
>>     using a single offline_pages() call and updating all memory block
>>     states accordingly.
>>
>> 4) Whenever we trigger onlining of a single such memory block, we
>>     online *all* memory blocks belonging to that altmap, using a single
>>     online_pages() call.
>>
>> 5) We fail remove_memory() if it doesn't cover the same (altmap) range.
>>
>> So we can avoid having a memory block v2 (and all that comes with that ...) for now and still get that altmap stuff sorted out. As that altmap behavior can be controlled by the admin, we should be fine for now.
>>
>> I think all memory notifiers should already be able to handle bigger granularity, but it would be easy to check. Some internal things might require a bit of tweaking.
>>
> 
> We can look at the possibility of using the altmap space reserved for a namespace (via option -M dev) for allocating struct page memory even with dax/kmem.

Right, an alternative would also be for the caller to pass in the 
altmap. Individual memory blocks can then get onlined/offlined as is.

One issue might be, how to get that altmap considered online memory 
(e.g., pfn_to_online_page(), kdump, ...). Right now, the altmap always 
falls into an online section once the memory block is online, so 
pfn_to_online_page() and especially online_section() holds as soon as 
the altmap has reasonable content -- when the memory block is online and 
initialized the memmap. Maybe that can be worked around, just pointing 
it out.

-- 
Cheers,

David / dhildenb

