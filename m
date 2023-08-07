Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40664772DF5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 20:36:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RqXG6oh1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RqXG6oh1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKQ5b2qMsz302F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 04:36:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RqXG6oh1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RqXG6oh1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKQ4Z5jbsz2xr6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 04:35:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691433354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSzDv346kgN2CfjlYQS29gdaOShLy0rGapky8ZA9EFo=;
	b=RqXG6oh1iw1wl8ZuGlORkwAW55giXCdjV59biVxhKZolMDsWtJo/qC5myRlljKfW6ou601
	JMH6VZa5iqPXm5Hv8oEGQibO66xnqbyfN9dSPG+8OQDTIZ1I6SLbmFGTJy0vrR0V22TnQ4
	IMpD6wJVqDMpgDCKr/NZeoZ2Laq2pJM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691433354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSzDv346kgN2CfjlYQS29gdaOShLy0rGapky8ZA9EFo=;
	b=RqXG6oh1iw1wl8ZuGlORkwAW55giXCdjV59biVxhKZolMDsWtJo/qC5myRlljKfW6ou601
	JMH6VZa5iqPXm5Hv8oEGQibO66xnqbyfN9dSPG+8OQDTIZ1I6SLbmFGTJy0vrR0V22TnQ4
	IMpD6wJVqDMpgDCKr/NZeoZ2Laq2pJM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-oL9WYn6LNn2Zl3GN4pnCmw-1; Mon, 07 Aug 2023 14:35:52 -0400
X-MC-Unique: oL9WYn6LNn2Zl3GN4pnCmw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3176c4de5bbso2154759f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 11:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691433351; x=1692038151;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:from:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSzDv346kgN2CfjlYQS29gdaOShLy0rGapky8ZA9EFo=;
        b=ir/yGaWtROhpEAlE3DOvO5AzNO5k/utAhTNK6FtxnQe4I/+NGaVrG8r8Cv//hhtAtI
         nR+RhKBsDXWq/bbS6I16oKsPq2W/+bDxkDGqrEqymJfICzxG28yKUFbVP1rMWPRUH4Hu
         RinqNupdYHJKuSR4fxlPKY2gwG5rOtYZmCXUOZtSx2MYEAfXBEbkAKfAHkNgHI8qqu1Q
         i+3yAvE4n4s/XpwqE4FWp92I09ERPydmFDunp55UF85QyZzpN0k3bMSyAVXAacyvTeV+
         v8Dgd25KbHMebb3atTTAu43ZM9j2409YQX1qu5X7s1kzpTKmcJZKKWqwzQ/xle5QHcsj
         BWTw==
X-Gm-Message-State: AOJu0YyAekqQccaU+erpKNDKpexAtQJ8jqmvFcrN4C3yGmwaxSz/7wY/
	39jtAoSSVUqLJyFC6uHtS87Rdg4hRP10iMzr3X3PRZYQLxj2LR3oUzM2y0MQo37vgs48v/FoR34
	dCM9242uVR7wgRjp8bfhm1UFb5w==
X-Received: by 2002:adf:ef8e:0:b0:317:54de:7315 with SMTP id d14-20020adfef8e000000b0031754de7315mr6464147wro.61.1691433351433;
        Mon, 07 Aug 2023 11:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4AgrI9SjrzPcGzpTnCQBzDx5r18Q61Uok0+tcU8/asAI8Gn40tuost0P4KHvDEDEzvNL1QA==
X-Received: by 2002:adf:ef8e:0:b0:317:54de:7315 with SMTP id d14-20020adfef8e000000b0031754de7315mr6464137wro.61.1691433351055;
        Mon, 07 Aug 2023 11:35:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:5d00:5143:1cd2:a300:ceff? (p200300cbc7405d0051431cd2a300ceff.dip0.t-ipconnect.de. [2003:cb:c740:5d00:5143:1cd2:a300:ceff])
        by smtp.gmail.com with ESMTPSA id m9-20020adfe0c9000000b003145559a691sm11454099wri.41.2023.08.07.11.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 11:35:50 -0700 (PDT)
Message-ID: <b6753402-2de9-25b2-36e9-eacd49752b19@redhat.com>
Date: Mon, 7 Aug 2023 20:35:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: David Hildenbrand <david@redhat.com>
To: Michal Hocko <mhocko@suse.com>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
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
Organization: Red Hat
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
In-Reply-To: <a32a9e7f-1e24-bab1-cb73-8058fed3b59c@redhat.com>
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
Cc: linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07.08.23 14:41, David Hildenbrand wrote:
> On 07.08.23 14:27, Michal Hocko wrote:
>> On Sat 05-08-23 19:54:23, Aneesh Kumar K V wrote:
>> [...]
>>> Do you see a need for firmware-managed memory to be hotplugged in with
>>> different memory block sizes?
>>
>> In short. Yes. Slightly longer, a fixed size memory block semantic is
>> just standing in the way and I would even argue it is actively harmful.
>> Just have a look at ridicously small memory blocks on ppc. I do
>> understand that it makes some sense to be aligned to the memory model
>> (so sparsmem section aligned). In an ideal world, memory hotplug v2
>> interface (if we ever go that path) should be physical memory range based.
> 
> Yes, we discussed that a couple of times already (and so far nobody
> cared to implement any of that).
> 
> Small memory block sizes are very beneficial for use cases like PPC
> dlar, virtio-mem, hyperv-balloon, ... essentially in most virtual
> environments where you might want to add/remove memory in very small
> granularity. I don't see that changing any time soon. Rather the opposite.
> 
> Small memory block sizes are suboptimal for large machines where you
> might never end up removing such memory (boot memory), or when dealing
> with devices that can only be removed in one piece (DIMM/kmem). We
> already have memory groups in place to model that.
> 
> For the latter it might be beneficial to have memory blocks of larger
> size that correspond to the physical memory ranges. That might also make
> a memmap (re-)configuration easier.
> 
> Not sure if that is standing in any way or is harmful, though.
> 

Just because I thought of something right now, I'll share it, maybe it 
makes sense.

Assume when we get add_memory*(MHP_MEMMAP_ON_MEMORY) and it is enabled 
by the admin:

1) We create a single altmap at the beginning of the memory

2) We create the existing fixed-size memory block devices, but flag them
    to be part of a single "altmap" unit.

3) Whenever we trigger offlining of a single such memory block, we
    offline *all* memory blocks belonging to that altmap, essentially
    using a single offline_pages() call and updating all memory block
    states accordingly.

4) Whenever we trigger onlining of a single such memory block, we
    online *all* memory blocks belonging to that altmap, using a single
    online_pages() call.

5) We fail remove_memory() if it doesn't cover the same (altmap) range.

So we can avoid having a memory block v2 (and all that comes with that 
...) for now and still get that altmap stuff sorted out. As that altmap 
behavior can be controlled by the admin, we should be fine for now.

I think all memory notifiers should already be able to handle bigger 
granularity, but it would be easy to check. Some internal things might 
require a bit of tweaking.

Just a thought.

-- 
Cheers,

David / dhildenb

