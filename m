Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7E37724C0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 14:55:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQ/OFaeG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQ/OFaeG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKGWj4826z30gF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 22:55:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQ/OFaeG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQ/OFaeG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKGVk47Qgz2xsY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 22:54:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691412874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCK2Kc5K8//48HPb6j2Zuk7krQFGIq9bbLCCbtRqtQI=;
	b=dQ/OFaeGmwefevTARI685jtcI9vOvTTuab5yByvp9sQ1akYZ2TASxGZK9HAq52l6TD6LkN
	e/ckuIGhu3FC1n+1pRVpNONejQc6qk3HOFogen8KVr56Rwva8puEn2QJTp4dEXJTkaDjOt
	hPlY3q/pqt87D7sTKVBmi3cf91YUP2U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691412874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCK2Kc5K8//48HPb6j2Zuk7krQFGIq9bbLCCbtRqtQI=;
	b=dQ/OFaeGmwefevTARI685jtcI9vOvTTuab5yByvp9sQ1akYZ2TASxGZK9HAq52l6TD6LkN
	e/ckuIGhu3FC1n+1pRVpNONejQc6qk3HOFogen8KVr56Rwva8puEn2QJTp4dEXJTkaDjOt
	hPlY3q/pqt87D7sTKVBmi3cf91YUP2U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-O41Uug1lMyK7yqe8nsq-UA-1; Mon, 07 Aug 2023 08:54:32 -0400
X-MC-Unique: O41Uug1lMyK7yqe8nsq-UA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fe2477947eso25298965e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 05:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691412871; x=1692017671;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCK2Kc5K8//48HPb6j2Zuk7krQFGIq9bbLCCbtRqtQI=;
        b=SrseRnuhw4tjz7qYKPisXdH99gRgARWIsR6BLhddVoXyKxYR0s80h98h/Es2S5a42n
         arfoovdGeHIiHKUFLtod1XQ3IcHc8euGPssLdCuPEtrH+Jmd/H46l4myNdJ29Ng/zY07
         qQXSK3JN0oSao3OKgecAppxNBTEgyTRwUSVckqro8mb/vNaDMibGpzpEf4DY2CUeHWae
         jodk2Eaq1wuXiat/yVEq4n5thAMfgJ0x2FiqWauncH483j0vx6clX0cWXERxOxGXx+5R
         tOsRVu6Pjm/V+/0ArU07cKdjljNXT8q3TARwbFdn+eSQFqcbWIL9oI/BwRawo21tlIRv
         Ca5Q==
X-Gm-Message-State: AOJu0YxJa0ivWump6SY6UVqim0xNM+0awIn1IXm0IKZl9F82J/nc1OfP
	8kf2L/OTbAfZ0O3Xi3Ot48tHTTseW6lwRFjTPNo+DV/JyJiVPlLtLWYvVuT5nkm6vna971SrcXj
	EiIbHOevq5r5K5lYPSknYOzc+kg==
X-Received: by 2002:a7b:ca57:0:b0:3fe:22a9:907 with SMTP id m23-20020a7bca57000000b003fe22a90907mr6296715wml.20.1691412871241;
        Mon, 07 Aug 2023 05:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2p6bElB81fLtBGLMpPL8D33y3Kt1HNiDiXSk4gNnZS0+LuTjrajzd1catXTo0HKmV7rH7Iw==
X-Received: by 2002:a7b:ca57:0:b0:3fe:22a9:907 with SMTP id m23-20020a7bca57000000b003fe22a90907mr6296699wml.20.1691412870851;
        Mon, 07 Aug 2023 05:54:30 -0700 (PDT)
Received: from ?IPV6:2003:cb:c740:5d00:5143:1cd2:a300:ceff? (p200300cbc7405d0051431cd2a300ceff.dip0.t-ipconnect.de. [2003:cb:c740:5d00:5143:1cd2:a300:ceff])
        by smtp.gmail.com with ESMTPSA id x23-20020a1c7c17000000b003fe539b83f2sm6729393wmc.42.2023.08.07.05.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 05:54:30 -0700 (PDT)
Message-ID: <a3919cb3-0725-eb41-073a-000301fc473a@redhat.com>
Date: Mon, 7 Aug 2023 14:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Michal Hocko <mhocko@suse.com>
References: <20230801044116.10674-8-aneesh.kumar@linux.ibm.com>
 <ZMjJPFcXlt+aeCUB@dhcp22.suse.cz>
 <a32fe748-fa18-bd92-3a10-5da8dbad96e6@linux.ibm.com>
 <ZMjjbKnxZXSNcJL5@dhcp22.suse.cz>
 <c1e6e3f6-2e3a-c098-ae78-0d86de8a3a95@linux.ibm.com>
 <ZMp7Vr8PbfoADQw0@dhcp22.suse.cz>
 <31305ab7-1e65-80aa-ee91-9190c8f67430@redhat.com>
 <ZMqLV2S6vY0cZxbp@dhcp22.suse.cz> <ZMtqu76Tgh9jj+AI@dhcp22.suse.cz>
 <1c6a74f0-85e9-5299-1520-9068e842b1a5@redhat.com>
 <ZMuP7gsxQzAmRpNX@dhcp22.suse.cz>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v7 7/7] mm/memory_hotplug: Enable runtime update of
 memmap_on_memory parameter
In-Reply-To: <ZMuP7gsxQzAmRpNX@dhcp22.suse.cz>
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

On 03.08.23 13:30, Michal Hocko wrote:
> On Thu 03-08-23 11:24:08, David Hildenbrand wrote:
> [...]
>>> would be readable only when the block is offline and it would reallocate
>>> vmemmap on the change. Makes sense? Are there any risks? Maybe pfn
>>> walkers?
>>
>> The question is: is it of any real value such that it would be worth the
>> cost and risk?
>>
>>
>> One of the primary reasons for memmap_on_memory is that *memory hotplug*
>> succeeds even in low-memory situations (including, low on ZONE_NORMAL
>> situations).

Sorry for the late reply, I'm busy with 100 other things.

> 
> One usecase I would have in mind is a mix of smaller and larger memory
> blocks. For larger ones you want to have memmap_on_memory in general
> because they do not eat memory from outside but small(er) ones might be
> more tricky because now you can add a lot of blocks that would be
> internally fragmented to prevent larger allocations to form.

Okay, I see what you mean.

The internal fragmentation might become an issue at some point: for 
x86-64 with 128 MiB blocks / 2 MiB THP it's not a real issue right now. 
For a arm64 64k with 512 MiB blocks and 512 MiB THP / hugelb it could be 
one.

I recall discussing that with Oscar back when he added memmap_on_memory, 
where we also discussed the variable-sized memory blocks to avoid such 
internal fragmentation.

For small ones you probably want to only use memmap_on_memory when 
unavoidable: for example, when adding without memmap_on_memory would 
fail / already failed. Possibly some later memmap relocation might make 
sense in some scenarios.

> 
>> So you want that behavior already when hotplugging such
>> devices. While there might be value to relocate it later, I'm not sure if
>> that is really worth it, and it does not solve the main use case.
> 
> Is it worth it? TBH I am not sure same as I am not sure the global
> default should be writable after boot. If we want to make it more
> dynamic we should however talk about the proper layer this is
> implemented on.

Agreed.

-- 
Cheers,

David / dhildenb

