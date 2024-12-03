Return-Path: <linuxppc-dev+bounces-3748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 482D59E2BA8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 20:07:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2qsy63h2z2xs0;
	Wed,  4 Dec 2024 06:07:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733252870;
	cv=none; b=nVG1rkp5dH6kB5Tctpe+sj1b6/TwSO1RYVk1+9TocNMRSzT8IDzua2NwGl+Hrl/ah1Xh733rKwnTn73fpGMQTeWcKOILNlABaGQzJksL9vDDlTTlY1ZnRrVXUcyLhR1aYCGM1XCgNdUQ/xRxvOj1NQl+sWUl7fBd0IfbaM0eyYv2pBfP9KwVFsPqsgy+j/PCBzguGk+VDtfS3l+Fi206nbAHBhHfe1UQZlKF1j8W+2jsErocv9NfEEWrtlfmCl2ziBQ7efuBippgcmPCC95uBXVCcoWFt1S7nxRMYHII2XZ73uGgs4btGUW4JItZpaVkZ6LEcl+pGWWWw6VKDPDzow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733252870; c=relaxed/relaxed;
	bh=qp8qIC8+SbNjtJ/vD3Mc/pgGXMGuySIroHQBH4DmWNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3CW6RUL8Y/s4wD3WE+0cr1uKnO2RpXzhIPOUtmbPQuvl/LNou8uCKX+BemscuJ6ugFYNy3oJkdKs7xsFIFlv+3ZOZxYPf5I2oWjVvHcJDpcleWDkewlIvXh29BN9u6QpZvAMot9Dj2YL6PNmaZCqmAupMB0uA/E+5rfuaZzX1Gc3iYJ4Ng5jOMjvaqb4MIi8mapG2viMQkMME3KQSDVevmNT6joo4kijaX+siuM29X603NnVIExsZKSK5LEtG7wc7v32teHk+4z9HNboIhUbKQMftiUYXtiT58iRw3CDZe2l9CWdv8LSDqhIrGDabfFtEOUWIGV1vKZLjZ3/7dvrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGkwayjG; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U381YqVZ; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LGkwayjG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U381YqVZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2qsx2Lj9z2xBx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 06:07:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733252862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qp8qIC8+SbNjtJ/vD3Mc/pgGXMGuySIroHQBH4DmWNM=;
	b=LGkwayjGuOg2Z2NoHueqgt/bKvx3QSLrlRvrStVDQ/cNb+dKReSOmKv9NHmWTBF+mGo1g9
	EE5kQvaj2fq4kQKHy67YNB6j4v9hqQ63C5A50S+jAqSGFiWnZiITXCanwT8QuTEznTthvX
	JwnRee4G8ardhxfUm0//TiAomVUZvco=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733252863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qp8qIC8+SbNjtJ/vD3Mc/pgGXMGuySIroHQBH4DmWNM=;
	b=U381YqVZrJmSoQDYoOHwy2tuiZj0biMr1m2K1OTAogoMsKf+XrSHuRAEOYHc4WC8JHXw0F
	bwihBm9Tpr+XhEa3586eZVsRSp295QU7+MU/+HKmemDp6MvhsXRByGzTBIfIy8Fhq8g8Vo
	2q/d+go1JLvHSdTTD6GmXd9yx00rf3k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-2tfT-6vTMIa9ZDKfXBDOLw-1; Tue, 03 Dec 2024 14:07:41 -0500
X-MC-Unique: 2tfT-6vTMIa9ZDKfXBDOLw-1
X-Mimecast-MFC-AGG-ID: 2tfT-6vTMIa9ZDKfXBDOLw
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385dfa9b758so1857940f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 11:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733252860; x=1733857660;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qp8qIC8+SbNjtJ/vD3Mc/pgGXMGuySIroHQBH4DmWNM=;
        b=MmXZ1KZsa2mc+fRAdoTimWtYeNkqZsEmZPT6Y1dox73fHMRKAgg51iY3xBkR58cwKo
         bzDVGtfwXJgFlvV57XwtBw43bDdCd9zWH/3us97JWnDaQH7b+B93wKN1PdIyoq6kv7JN
         nOn9ae1haivR+16ZQ22pvm/zqO1si74ohcTGjiEcu/dEBlu9ZejyveETGjLxIrKfwnWx
         ZBnMk4+3bl01WcGttPLipMiak73Ty7F0pX13XNx6P0pxJTTOABEj7V+DguM6+DIIeYOU
         VpY3u/X8yQRRk7wPpaFljvVkcvDYZyPLNS0OHE8YD0YiQoZ5kBtNbtQh+KzZcF6fcH8Z
         d2dA==
X-Forwarded-Encrypted: i=1; AJvYcCVVCJmVl/LwlpLVP3U7FDi4AecCKh45/0+v1KyArxexD/tEa7Qc7PZZjPYlg1QMwHmuGyn9s6B2UsyV6Iw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyF0BSj5ReQ2zqgmqjjgmHfGpukfXhmXqAc32AVgmD2aiW8Njdx
	JEyjWzGx7CCe47X4aNfwmoWo9tDDBLWN6zFZFRqeO/rkAZKv56f2x3k4V3leZQGxXcF7VG06f5V
	zjDgIYjvjFR58wwyO+BkGDh6QEGOxv9bWS8uD3sa+3Xh4Fb2Bj+pXF6b293pxs3g=
X-Gm-Gg: ASbGnctVCnT7hrUohME9XRQlm5JvVvoVHbgkvTzHUfMWsxAZ/N/snmoDYby4rI2u63d
	7WB8iFvMvjtJMeYOdyhQizAIZXln5h9FQjZSzywm/fpkllQXqo/51L01cybA4hgWbpkz0Cih6nB
	B80Likw8VWHGErwF6DT2nZIdCsRW+jIWWA0eBEpsBYwCThYVzkTqIAiKej7CWsmrdl4f+4mfb5D
	XY5iaPZmAjUTys1N9eusjQCKD1Qids9l+hAElHKnX9Ry60oAIL4d7O7meFx8TVL5P/eAb5zWmiF
	iuRbWsUHX510AcXVn6dPW+rrsWcARb1ROI9pcGY1TL1JWvXgEwVCl3hod6QvcufSQ4fiN/Wwjm5
	Hew==
X-Received: by 2002:a05:600c:1c1d:b0:434:932b:a44c with SMTP id 5b1f17b1804b1-434d3fe339emr12878705e9.27.1733252860314;
        Tue, 03 Dec 2024 11:07:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzqV5rcPa1XB7yoDaMRtuRh1kpD7s5D32r4FS5ciVaVbd7QdQZuGmrecP2reRzXahF4Ztg4g==
X-Received: by 2002:a05:600c:1c1d:b0:434:932b:a44c with SMTP id 5b1f17b1804b1-434d3fe339emr12878455e9.27.1733252859940;
        Tue, 03 Dec 2024 11:07:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c746:1b00:fd9e:c26c:c552:1de7? (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e13e8eadsm12068257f8f.28.2024.12.03.11.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 11:07:38 -0800 (PST)
Message-ID: <ae0b70e7-bc7f-4f43-82af-0e0c1a02f735@redhat.com>
Date: Tue, 3 Dec 2024 20:07:36 +0100
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
To: Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-5-david@redhat.com>
 <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
 <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
 <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
 <498871B1-D26C-4934-8E89-C6C8ECE8872A@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <498871B1-D26C-4934-8E89-C6C8ECE8872A@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Yo4mV2cRJ_zBYQdzyGEJ1SKoaM5nRO3O2ZnN2vt31Y_1733252860
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03.12.24 16:49, Zi Yan wrote:
> On 3 Dec 2024, at 9:24, Vlastimil Babka wrote:
> 
>> On 12/3/24 15:12, David Hildenbrand wrote:
>>> On 03.12.24 14:55, Vlastimil Babka wrote:
>>>> On 12/3/24 10:47, David Hildenbrand wrote:
>>>>> It's all a bit complicated for alloc_contig_range(). For example, we don't
>>>>> support many flags, so let's start bailing out on unsupported
>>>>> ones -- ignoring the placement hints, as we are already given the range
>>>>> to allocate.
>>>>>
>>>>> While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() we
>>>>> simply create yet another GFP mask whereby we ignore the reclaim flags
>>>>> specify by the caller. That looks very inconsistent.
>>>>>
>>>>> Let's clean it up, constructing the gfp flags used for
>>>>> compaction/migration exactly once. Update the documentation of the
>>>>> gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().
>>>>>
>>>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>>
>>>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>>>>
>>>>> +	/*
>>>>> +	 * Flags to control page compaction/migration/reclaim, to free up our
>>>>> +	 * page range. Migratable pages are movable, __GFP_MOVABLE is implied
>>>>> +	 * for them.
>>>>> +	 *
>>>>> +	 * Traditionally we always had __GFP_HARDWALL|__GFP_RETRY_MAYFAIL set,
>>>>> +	 * keep doing that to not degrade callers.
>>>>> +	 */
>>>>
>>>> Wonder if we could revisit that eventually. Why limit migration targets by
>>>> cpuset via __GFP_HARDWALL if we were not called with __GFP_HARDWALL? And why
>>>> weaken the attempts with __GFP_RETRY_MAYFAIL if we didn't specify it?
>>>
>>> See below.
>>>
>>>>
>>>> Unless I'm missing something, cc->gfp is only checked for __GFP_FS and
>>>> __GFP_NOWARN in few places, so it's mostly migration_target_control the
>>>> callers could meaningfully influence.
>>>
>>> Note the fist change in the file, where we now use the mask instead of coming up
>>> with another one out of the blue. :)
>>
>> I know. What I wanted to say - cc->gfp is on its own only checked in few
>> places, but now since we also translate it to migration_target_control's
>> gfp_mask, it's mostly that part the caller might influence with the passed
>> flags. But we still impose own additions to it, limiting that influence.
>>
>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>> index ce7589a4ec01..54594cc4f650 100644
>>> --- a/mm/page_alloc.c
>>> +++ b/mm/page_alloc.c
>>> @@ -6294,7 +6294,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
>>>    	int ret = 0;
>>>    	struct migration_target_control mtc = {
>>>    		.nid = zone_to_nid(cc->zone),
>>> -		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
>>> +		.gfp_mask = cc->gfp_mask,
>>>    		.reason = MR_CONTIG_RANGE,
>>>    	};
>>>
>>> GFP_USER contains __GFP_HARDWALL. I am not sure if that matters here, but
>>
>> Yeah wonder if GFP_USER was used specifically for that part, or just randomly :)
>>
>>> likely the thing we are assuming here is that we are migrating a page, and
>>> usually, these are user allocation (except maybe balloon and some other non-lru
>>> movable things).
>>
>> Yeah and user allocations obey cpuset and mempolicies etc. But these are
>> likely somebody elses allocations that were done according to their
>> policies. With our migration we might be actually violating those, which
>> probably can't be helped (is at least migration within the same node
>> preferred? hmm). But it doesn't seem to me that our caller's restrictions
>> (if those exist, would be enforced by __GFP_HARDWALL) are that relevant for
>> somebody else's pages?
> 
> Yeah, I was wondering why current_gfp_context() is used to adjust gfp_mask,
> since current context might not be relevant. But I see it is used in
> the original code, so I did not ask. If current context is irrelevant w.r.t
> the to-be-migrated pages, should current_gfp_context() part be removed?

Please see how current_gfp_context() is only concerned (excluding the 
__GFP_MOVABLE thing we unconditionally set ...) about reclaim flags. 
This part make absolute sense to respect here.

So that is something different than __GFP_HARDWALL that *we so far 
unconditionally set* and is not a "reclaim" flag.

-- 
Cheers,

David / dhildenb


