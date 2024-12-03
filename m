Return-Path: <linuxppc-dev+bounces-3728-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C359E1EBF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 15:12:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2jK21TT0z307f;
	Wed,  4 Dec 2024 01:12:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733235142;
	cv=none; b=TKkSA41aYV2KAy6pIRSwMnRfRQ3RE0ay65Z6l5K3GzqMdQnpKgEGxits1VI3Ve6qyxgCTEtmYUayOe3z74BhUuNqlc7W2BU4DTcGxrC0YHj0+E0LlqqwWDc9mbqmcvQ7m9V5eo9RFgC+D7mVkdXLDjvmnHmj/OpeHph4blcdFc1O7zq7vii3PJmQ69Z/Oh8fqXRrRGKOT5XupQW6yWHEQpDH4hD5H9rEDs6io+EXWZ844/iH7FYCH3w+3YE0m3lhM72VEiTS8omScB7uv4x3dJssKUZLQsO+euZFB7u9Ay/Zsck50qm3qwokyCetuhNeO00v7XvykJBlXIT9PHXM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733235142; c=relaxed/relaxed;
	bh=DfmOmAYsWzbzU97D/IfZswWynVBYus13MGWPWCnnhmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8yG28K6j8yii3p0pUVBY0e71nDuShhNMQjIGFqDYeW3zbP15wVMq8iKp2YM/Am2sk0zw8F1kV2ShdC79gVE5fGP+38ssno7gVh7DI6h1ZaGn9x7JPV6NUdeXl1bmfmNsRBSKSk5HrK6E5nqmiNIr7uKQGqlp4PvHJHeG1FS9Qr5SSzdSsZVP4r6shcwBWi3IBw0ixBluXn8//anrxnKw4cDdetDm1SEnjahM4BqXZcFQMAsn4oZLcNIf7mJRuj90VyhprPoZSjGQ8DTyf3TUgdFp2zQJ1LkvPoH63azIlBj6jf1OVHlGMf01smCZAQVAGa2SbD6pXrfU2407Rgw/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dZXtDwpq; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eY34oSWP; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dZXtDwpq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eY34oSWP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2jK04rGxz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 01:12:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733235133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DfmOmAYsWzbzU97D/IfZswWynVBYus13MGWPWCnnhmw=;
	b=dZXtDwpqTaeGbGIGxMEnV4mPTGvv4x650myaeeC2KDEx6HLfxqfwchIU1utP5k8nSW4CaJ
	MEEkVdnFGJh+8v8xtpnrh9kHb75yxZgNeYI2nEqrd6tuOVVhqiL+BR4v0Mi+AnN1d+OwMN
	nhRs1TQV8FZ5VjvHEFK7I0jOOY08f7w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733235134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DfmOmAYsWzbzU97D/IfZswWynVBYus13MGWPWCnnhmw=;
	b=eY34oSWP3s5BDd++NErSxK1qxX94Ikcgo4PTuycP85IO+QmVSyAhWyDRqM4OTIxjNuna0j
	tMznYUpsf6NwXc9TgJell3xxuCY5/kAYim6uDryZnHlRgL0mmUXnm6EkY8gBpqoh1E21b/
	KIGSkJrmcq3MuPjthppxDZ9e7kSQh9s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-cDib2xPWPE-rG5OgWZUdjw-1; Tue, 03 Dec 2024 09:12:11 -0500
X-MC-Unique: cDib2xPWPE-rG5OgWZUdjw-1
X-Mimecast-MFC-AGG-ID: cDib2xPWPE-rG5OgWZUdjw
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385df115288so1951389f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Dec 2024 06:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733235130; x=1733839930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DfmOmAYsWzbzU97D/IfZswWynVBYus13MGWPWCnnhmw=;
        b=CnXrHCmrvTI+N7JKz4dkWJOSWy0F36vlq5Y46Aj6Wdnj2gn+QpUGXnwH2AscB5SWfy
         kclsHkRqQszkJdrt3SO3J+acPg6fhw5l4H5CCyUZlJgC0z6PNwm1KvDYoHqTh8ZHGM7G
         R3ijqJfu8KsjaY6cY0VU0GhN38Zzr0sUDxJi2E+FuQIyFVQw0uTg7lIOuhpCcjLhHmVV
         J9PfY0qioVDJtORYuZd0DBmMJoOAEsWmV596Fz/YCpK0QHw1yD3amRn6qjnjz7ShExSr
         nGiIw/aJrnywomogL5VzECbBXSpEBjt4oE9VH0RLnxz43XisiYxzLFZZ4zrPuIGvFF+X
         oS+g==
X-Forwarded-Encrypted: i=1; AJvYcCXmNjnVkkaRnsZqOI69Uw3pdUAlmrKkYGHe4n9z++Rxu8EB+8Z9OekkOaaprJJ6j8ehHDd9fEV3d5Uhhk4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzddUQSlvS52hbTGrxa1vd8LXnTNGofE1GRpGgokyxqRQ3PWvL3
	xemv6Hu88HaC3d6e1I/BjArL3Q/6uS9q6qY5MAAUQ3Tbs6dbn9Kym5LkM7mVK+84hMqtKMkBM8l
	/Mzbu7khafe24FJTVdP/hWKE+MmyrQ8UIzaFinvWbGknnK5xRJhCS5AxAl9bMAPkpAOblb2RTpA
	==
X-Gm-Gg: ASbGncuktiFiqT3b6K/VoJ6Lgtrlb6oJZAsvv8GPgYq1OCiOm2mPFSCh1b53upL/HRj
	KNevFhI5R7dMSgH53yIvHYjpy2lNuebpaHJ8MlxfdtwwS4yNsC25PFjQgTi4vKABDZv8FE/jg/c
	SSFOsC4j6AB/utNWU0IAL7d5DYb8lL+Z/j7hOJxPlOT1/r/k8z4PNokUTM5CUssriwWTvbAs+Yj
	II36Y2vH94sV3siz8rJwAEU1Q5OvzUjikWN0aVNuH20pjG7qg73+eQntgooy8WRrqaXXK4ugk6L
	i5ppO3C/5z33/G7g18iaHzjhrQ3j90wtDdcTbNZ94Fpki8Z8iH96y5M19NN5VZfTGCmWPX6nbbt
	kmQ==
X-Received: by 2002:a5d:6dae:0:b0:385:e013:73f6 with SMTP id ffacd0b85a97d-385fd4358aemr2081364f8f.50.1733235130375;
        Tue, 03 Dec 2024 06:12:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcy+idlIWvQSkgkkanBxL+r+HUHonkY6filCiyNJa2RVw7yISuYzu4QI0/PKYJnAmni+KX1w==
X-Received: by 2002:a5d:6dae:0:b0:385:e013:73f6 with SMTP id ffacd0b85a97d-385fd4358aemr2081341f8f.50.1733235129950;
        Tue, 03 Dec 2024 06:12:09 -0800 (PST)
Received: from ?IPV6:2003:cb:c746:1b00:fd9e:c26c:c552:1de7? (p200300cbc7461b00fd9ec26cc5521de7.dip0.t-ipconnect.de. [2003:cb:c746:1b00:fd9e:c26c:c552:1de7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ea9c5952sm8447173f8f.67.2024.12.03.06.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 06:12:07 -0800 (PST)
Message-ID: <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
Date: Tue, 3 Dec 2024 15:12:06 +0100
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uf06Kbhl8Z2Mt0HXjkydwMabp6RwADGGnhzQDwVVo2E_1733235130
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03.12.24 14:55, Vlastimil Babka wrote:
> On 12/3/24 10:47, David Hildenbrand wrote:
>> It's all a bit complicated for alloc_contig_range(). For example, we don't
>> support many flags, so let's start bailing out on unsupported
>> ones -- ignoring the placement hints, as we are already given the range
>> to allocate.
>>
>> While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() we
>> simply create yet another GFP mask whereby we ignore the reclaim flags
>> specify by the caller. That looks very inconsistent.
>>
>> Let's clean it up, constructing the gfp flags used for
>> compaction/migration exactly once. Update the documentation of the
>> gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().
>>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> 
>> +	/*
>> +	 * Flags to control page compaction/migration/reclaim, to free up our
>> +	 * page range. Migratable pages are movable, __GFP_MOVABLE is implied
>> +	 * for them.
>> +	 *
>> +	 * Traditionally we always had __GFP_HARDWALL|__GFP_RETRY_MAYFAIL set,
>> +	 * keep doing that to not degrade callers.
>> +	 */
> 
> Wonder if we could revisit that eventually. Why limit migration targets by
> cpuset via __GFP_HARDWALL if we were not called with __GFP_HARDWALL? And why
> weaken the attempts with __GFP_RETRY_MAYFAIL if we didn't specify it?

See below.

> 
> Unless I'm missing something, cc->gfp is only checked for __GFP_FS and
> __GFP_NOWARN in few places, so it's mostly migration_target_control the
> callers could meaningfully influence.

Note the fist change in the file, where we now use the mask instead of coming up
with another one out of the blue. :)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ce7589a4ec01..54594cc4f650 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6294,7 +6294,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
  	int ret = 0;
  	struct migration_target_control mtc = {
  		.nid = zone_to_nid(cc->zone),
-		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
+		.gfp_mask = cc->gfp_mask,
  		.reason = MR_CONTIG_RANGE,
  	};

GFP_USER contains __GFP_HARDWALL. I am not sure if that matters here, but
likely the thing we are assuming here is that we are migrating a page, and
usually, these are user allocation (except maybe balloon and some other non-lru
movable things).

The __GFP_RETRY_MAYFAIL should be moved to relevant callers a some point,
__GFP_HARDWALL, I really don't know ...

Thanks!

-- 
Cheers,

David / dhildenb


