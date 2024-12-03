Return-Path: <linuxppc-dev+bounces-3749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1519F9E2BDE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:19:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2r776tjbz2yk6;
	Wed,  4 Dec 2024 06:19:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733253555;
	cv=none; b=KOSoV+1lraoqFY00D/SDeA5otlxm1mGFOk1BTq1EKE8k5t1CbWv/1T6FKJwoOJpG2QmxegapXETjdVRxiJC+XLG76hhcfoOaImX6rNvuHOo+YtkEk5n2/z/pKCAPM3JRCqlpIlVMfPy9PQTCKYVAkbR1weO2kmR8D98J9r9zICKK36inGS6Yyd4xlyylJpQoA/tJ1YF0PnlO1lc8bWKeQ6u1qBdQTFv4s22cBtCCL5GdTWMNiSfNvt5L8iZDP7mnzNFqB3icCo7wN2IOOfG0HheYuJIN4LbSMwUp18YiLfghx6qIfpF1c+Sq32PEGSe5Ov/nYSfB6Hs/NpkByKJAkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733253555; c=relaxed/relaxed;
	bh=4HYWX4lY+1zgmP6GYTzg/DCn9ab+q4upkCeyneBu0NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDN4B8+oK8UuAili6RIQulEDZPnpfD6j5OLVjVS8RDb5GsE9sh16yc5Gq9babxMOPyhyHiOkTCf5BocjJViFriARAJ1Q7itO2yV4NGqJ5x522G/beMooTwYfuPZsttVf2J3In3IBvtxvRjMoaPjf64bHnqBhWCo+hDqz1Z8GUKP4VdjhVyNxS1rk2H2vfQts0YAFWvF74xvz2IgQeenJduRbbbWNsQui/gG8YqjKKuX/R7hqEuGDoZneu2992+q2YqCp7sn0PAqi9PnUPrSzKVrde4cbdZAWRBvKisvkl6prPgDu1Orjd+wGAqfhWnOBikiodwmF4NXTY0Da4bGr2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SnmbFfEP; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F4d5NbO+; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SnmbFfEP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F4d5NbO+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2r743VtCz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:19:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733253548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4HYWX4lY+1zgmP6GYTzg/DCn9ab+q4upkCeyneBu0NI=;
	b=SnmbFfEPaltcmYu9k6nbL+NAQz+tu5y5IGNv2K6eMSR27jQ/UHU37FhGFT0o30neDRngOn
	j1jZZWjrzA91dUJJbz45aFXysnGRjq5KIQXi45BPQCJWKWkfuAqY656uw11eW9wrUeNLIL
	cFIElICbAIUclkFKm8jiJg8EWMUiUx0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733253549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4HYWX4lY+1zgmP6GYTzg/DCn9ab+q4upkCeyneBu0NI=;
	b=F4d5NbO+JpmQTuJuVUomPVf6kQ+vmZ0ewLYkckPU46vG7+reMRhjzop4Q1p0ayTHbtW0Bm
	2HEtvImqhAsXV/GhEIQhofcUStF2s31y9TaxEO3o9JsgYjbDQYokKyavLc6TaN83c9V4TY
	U5j4l4Ht7G4Oux5l/E54LfxvIckR3uo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-TNB7YYSRNZulNVh5QALxQA-1; Tue, 03 Dec 2024 14:19:07 -0500
X-MC-Unique: TNB7YYSRNZulNVh5QALxQA-1
X-Mimecast-MFC-AGG-ID: TNB7YYSRNZulNVh5QALxQA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-434a04437cdso43537015e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 11:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733253546; x=1733858346;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4HYWX4lY+1zgmP6GYTzg/DCn9ab+q4upkCeyneBu0NI=;
        b=ZdXYjdu/w+9RnBJrYTh83AN93cnhg1G8hG4XV31OyAhMR/6EPT5c+/RSZjunsrR8Ip
         hTevw/KKqoAdslD/Lsoo7DK0DZV5RwcISLp9xa43SO6IFwehT37dH0dq/G/eEJ6041Q0
         /rsDt53ahTi1lnExdrEHf56ge3SVPjj9e3Q5MFM7RaT4Hb1kx2WFKWYcpg7EoLQ9ENAG
         1dMqUDvzobjW3K5mWg+2Z+rP+niMa7ucRC/dN50133ZL9EkAgBC8Weblxu4Z9l13sJPs
         RUFfC9QqCVnPW3Wp7YHRlkUlE12gVVEjCtm8z0s7flV2BTjbrEJZSr47t7EMn2/TPs4i
         ODuA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ2CastgEixt9mhLPYeZsveKsbB/GQcGWFZCiqtmno8keNSTPwRm2FvBYlN/q1JcNP8ttT0L/1yLTZYhk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmdwTwNMXnAvsHAusMwSc+rsrA6wP56ta6t2CT1Bagk+8wcIHA
	5SDIV1tWs5bNks19E8Lsu2KT4S8X4ahgTqzY2B7zHftDItlQzEFTvgMPKZeM4FhtvhmndTZWx5V
	/54erkwpv21ztEAgDfee3j6ok98xjnvujJRVcRWNwH7MmJk5On+EWAhISg32cHZE=
X-Gm-Gg: ASbGnctPiidILyrjpii7DcifieMDM6zlG9G8VQs/YkWVHZlLlcPZilNkZ2ANwHeSNyU
	7oo3zvfD0VvbOYRyckwSr2Ag6y7D2t3Zq4wV3yUGawNm+oBx8gQeU2N5KXGgQAnoG/eI8B6bKXJ
	vN8Uo/my85iVInNGQKNx1IAL99H9kvveCXxAD0HIapxOlwv4v8WYgcQ1mKE1taPl17n30TMKF9l
	38R+gehG/dqspj2ycxeq1iUU9B+HSLGdO0zgmE3r2W9WN8pBKeTNtkW98fMMTOXFOXRGYMPhHTl
	fUPVYzaOMyLnjqVnp77nHVK30mtIDNHPwokR2CnzPTUZ/Jx5Vx+L6dkJRB6Gmf+Vg8WqdT0UXoa
	azw==
X-Received: by 2002:a05:600c:5125:b0:434:9da3:602b with SMTP id 5b1f17b1804b1-434d09affa9mr33331615e9.5.1733253546235;
        Tue, 03 Dec 2024 11:19:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhIUyp7FwdbibPnEWnU4E3YEQlfcnkhoAFOBhvJUKIYdte1NbCV16fBdAJsfpJijLKWBL2IA==
X-Received: by 2002:a05:600c:5125:b0:434:9da3:602b with SMTP id 5b1f17b1804b1-434d09affa9mr33331445e9.5.1733253545832;
        Tue, 03 Dec 2024 11:19:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c746:1b00:fd9e:c26c:c552:1de7? (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa76b52bsm230954065e9.18.2024.12.03.11.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 11:19:04 -0800 (PST)
Message-ID: <d736f1c0-343e-4031-88ba-3b33b73dbeba@redhat.com>
Date: Tue, 3 Dec 2024 20:19:02 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 4/6] mm/page_alloc: sort out the
 alloc_contig_range() gfp flags mess
To: Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-5-david@redhat.com>
 <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
 <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
 <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8nMBVR5RQ5LP4Wd3eykwFGoiYBoJ-kSFb7HGkll2rho_1733253546
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03.12.24 15:24, Vlastimil Babka wrote:
> On 12/3/24 15:12, David Hildenbrand wrote:
>> On 03.12.24 14:55, Vlastimil Babka wrote:
>>> On 12/3/24 10:47, David Hildenbrand wrote:
>>>> It's all a bit complicated for alloc_contig_range(). For example, we don't
>>>> support many flags, so let's start bailing out on unsupported
>>>> ones -- ignoring the placement hints, as we are already given the range
>>>> to allocate.
>>>>
>>>> While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() we
>>>> simply create yet another GFP mask whereby we ignore the reclaim flags
>>>> specify by the caller. That looks very inconsistent.
>>>>
>>>> Let's clean it up, constructing the gfp flags used for
>>>> compaction/migration exactly once. Update the documentation of the
>>>> gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().
>>>>
>>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>
>>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>>>
>>>> +	/*
>>>> +	 * Flags to control page compaction/migration/reclaim, to free up our
>>>> +	 * page range. Migratable pages are movable, __GFP_MOVABLE is implied
>>>> +	 * for them.
>>>> +	 *
>>>> +	 * Traditionally we always had __GFP_HARDWALL|__GFP_RETRY_MAYFAIL set,
>>>> +	 * keep doing that to not degrade callers.
>>>> +	 */
>>>
>>> Wonder if we could revisit that eventually. Why limit migration targets by
>>> cpuset via __GFP_HARDWALL if we were not called with __GFP_HARDWALL? And why
>>> weaken the attempts with __GFP_RETRY_MAYFAIL if we didn't specify it?
>>
>> See below.
>>
>>>
>>> Unless I'm missing something, cc->gfp is only checked for __GFP_FS and
>>> __GFP_NOWARN in few places, so it's mostly migration_target_control the
>>> callers could meaningfully influence.
>>
>> Note the fist change in the file, where we now use the mask instead of coming up
>> with another one out of the blue. :)
> 
> I know. What I wanted to say - cc->gfp is on its own only checked in few
> places, but now since we also translate it to migration_target_control's
> gfp_mask, it's mostly that part the caller might influence with the passed
> flags. But we still impose own additions to it, limiting that influence.
> 
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index ce7589a4ec01..54594cc4f650 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -6294,7 +6294,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
>>    	int ret = 0;
>>    	struct migration_target_control mtc = {
>>    		.nid = zone_to_nid(cc->zone),
>> -		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
>> +		.gfp_mask = cc->gfp_mask,
>>    		.reason = MR_CONTIG_RANGE,
>>    	};
>>
>> GFP_USER contains __GFP_HARDWALL. I am not sure if that matters here, but
> 
> Yeah wonder if GFP_USER was used specifically for that part, or just randomly :)
> 
>> likely the thing we are assuming here is that we are migrating a page, and
>> usually, these are user allocation (except maybe balloon and some other non-lru
>> movable things).
> 
> Yeah and user allocations obey cpuset and mempolicies etc. But these are
> likely somebody elses allocations that were done according to their
> policies. With our migration we might be actually violating those, which
> probably can't be helped (is at least migration within the same node
> preferred? hmm).

I would hope that we handle memory policies somehow (via VMAs? not 
sure). cpuset? I have no idea.

But it doesn't seem to me that our caller's restrictions
> (if those exist, would be enforced by __GFP_HARDWALL) are that relevant for
> somebody else's pages?

It was always set using "GFP_USER | __GFP_MOVABLE | 
__GFP_RETRY_MAYFAIL", and I removed the same flag combination in #2 from 
memory offline code, and we do have the exact same thing in 
do_migrate_range() in mm/memory_hotplug.c.

We should investigate if__GFP_HARDWALL is the right thing to use here, 
and if we can get rid of that by switching to GFP_KERNEL in all these 
places.

I can look into it + send a follow-up patch.

Thanks!

-- 
Cheers,

David / dhildenb


