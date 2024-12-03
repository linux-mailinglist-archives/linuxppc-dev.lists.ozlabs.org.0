Return-Path: <linuxppc-dev+bounces-3729-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166A9E1EFA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 15:24:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2jZb4fC1z309n;
	Wed,  4 Dec 2024 01:24:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733235847;
	cv=none; b=iRNZ34s/+p4tr2fG0L87aiEQQrXfwOhOuPrbN+E/RZteXQ1TfaxEdKhiQP9p2gmvTz1hk6+qHT4NHAyi9bGM5Qxh2YblGuZH+F62FbThPlZBHpHSWsyx+9pXcDdeU0KIYdqJ3njbngjURG4GOKSARiZwOVOwDj8SvXiQLFfEeMlmNxlOF1JkyG83TEnRE7oXNLmlyOcnxhvGWZrZ2QIoZJ720sp6/iZ9OX/BqCjd91VS+8+VZWZzQr8RvYf3Pwjx0UoPMyU9y+mjtKrfE/0wJ6khVBq2nqi1AtFd1Z+lUcV6shApW8vUgacpMPTU1fPw4dPKmvkQq0N6W/llQc6IFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733235847; c=relaxed/relaxed;
	bh=FHkL2249fzmDatUIGMAizAA5fswy2PLAfdBQjzG7uO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIXmWAtznZt+4+zod/PysLw7QfluHBALk83C0b7VihNMQpwDep3iZqlbAxn76Mr9S2fl7EpIoQua4S4CmiyCUGjG3B5hY62C2X13exoGTllUFKy+iwO0IgvCK5afWWSGaWrcy9TtMaJ34BPJKOUijGnz1q7CRfwpyUPOUVDlA70Fld/k0LeHU6Ka/FT+514yUMRYijCuH0BL8erjpeUN77qiPLgQugdjFpTVyEz44hwDdlRxGBbuLbVkkAR1SRSw7F16Ygtgb2H0ToflbOsLZnFxgoCw47PUYPg+0R2cGQh4Yv7VmFdEvkFCEdHnD8zv8SZDbPkJw+vcQ9PRfcz9cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RjvkpFfO; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hmGbxWSw; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RjvkpFfO; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hmGbxWSw; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RjvkpFfO;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hmGbxWSw;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RjvkpFfO;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hmGbxWSw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2jZZ1HDPz302D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 01:24:03 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F91121160;
	Tue,  3 Dec 2024 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733235840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FHkL2249fzmDatUIGMAizAA5fswy2PLAfdBQjzG7uO8=;
	b=RjvkpFfO3E7hnN6rvlmAzMsOvBXl09qj8efilOvlxHkOVkTA0SJZ3+JYT7mCXE5MDbfowe
	p6dlF0H3mILWSVWC0/u9Kgzz/SFTK7Lb2Uoj3mI5STiJ/nEbFPdjJst57WLnJBiyFGZVwi
	JN6D48OVP9X2r8bRpwwoVbR4xlef8tU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733235840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FHkL2249fzmDatUIGMAizAA5fswy2PLAfdBQjzG7uO8=;
	b=hmGbxWSwEOOwU1nWFCoxCEbFqSGBCLEjdWIRAWilRw2wt1LmF15sBfswWolY7dTVhygaZO
	xvzrynMrUJrsJPBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733235840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FHkL2249fzmDatUIGMAizAA5fswy2PLAfdBQjzG7uO8=;
	b=RjvkpFfO3E7hnN6rvlmAzMsOvBXl09qj8efilOvlxHkOVkTA0SJZ3+JYT7mCXE5MDbfowe
	p6dlF0H3mILWSVWC0/u9Kgzz/SFTK7Lb2Uoj3mI5STiJ/nEbFPdjJst57WLnJBiyFGZVwi
	JN6D48OVP9X2r8bRpwwoVbR4xlef8tU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733235840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FHkL2249fzmDatUIGMAizAA5fswy2PLAfdBQjzG7uO8=;
	b=hmGbxWSwEOOwU1nWFCoxCEbFqSGBCLEjdWIRAWilRw2wt1LmF15sBfswWolY7dTVhygaZO
	xvzrynMrUJrsJPBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 605B0139C2;
	Tue,  3 Dec 2024 14:24:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jA2AFoAUT2doMgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 03 Dec 2024 14:24:00 +0000
Message-ID: <04c1d28e-bbea-4499-9a6d-770f9ca53ba9@suse.cz>
Date: Tue, 3 Dec 2024 15:24:00 +0100
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
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
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
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <96c92857-4850-4f85-9474-ac193c5ea48c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,lists.ozlabs.org,linux-foundation.org,suse.de,nvidia.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/3/24 15:12, David Hildenbrand wrote:
> On 03.12.24 14:55, Vlastimil Babka wrote:
>> On 12/3/24 10:47, David Hildenbrand wrote:
>>> It's all a bit complicated for alloc_contig_range(). For example, we don't
>>> support many flags, so let's start bailing out on unsupported
>>> ones -- ignoring the placement hints, as we are already given the range
>>> to allocate.
>>>
>>> While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() we
>>> simply create yet another GFP mask whereby we ignore the reclaim flags
>>> specify by the caller. That looks very inconsistent.
>>>
>>> Let's clean it up, constructing the gfp flags used for
>>> compaction/migration exactly once. Update the documentation of the
>>> gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().
>>>
>>> Acked-by: Zi Yan <ziy@nvidia.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> 
>> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>> 
>>> +	/*
>>> +	 * Flags to control page compaction/migration/reclaim, to free up our
>>> +	 * page range. Migratable pages are movable, __GFP_MOVABLE is implied
>>> +	 * for them.
>>> +	 *
>>> +	 * Traditionally we always had __GFP_HARDWALL|__GFP_RETRY_MAYFAIL set,
>>> +	 * keep doing that to not degrade callers.
>>> +	 */
>> 
>> Wonder if we could revisit that eventually. Why limit migration targets by
>> cpuset via __GFP_HARDWALL if we were not called with __GFP_HARDWALL? And why
>> weaken the attempts with __GFP_RETRY_MAYFAIL if we didn't specify it?
> 
> See below.
> 
>> 
>> Unless I'm missing something, cc->gfp is only checked for __GFP_FS and
>> __GFP_NOWARN in few places, so it's mostly migration_target_control the
>> callers could meaningfully influence.
> 
> Note the fist change in the file, where we now use the mask instead of coming up
> with another one out of the blue. :)

I know. What I wanted to say - cc->gfp is on its own only checked in few
places, but now since we also translate it to migration_target_control's
gfp_mask, it's mostly that part the caller might influence with the passed
flags. But we still impose own additions to it, limiting that influence.

> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index ce7589a4ec01..54594cc4f650 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6294,7 +6294,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
>   	int ret = 0;
>   	struct migration_target_control mtc = {
>   		.nid = zone_to_nid(cc->zone),
> -		.gfp_mask = GFP_USER | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
> +		.gfp_mask = cc->gfp_mask,
>   		.reason = MR_CONTIG_RANGE,
>   	};
> 
> GFP_USER contains __GFP_HARDWALL. I am not sure if that matters here, but

Yeah wonder if GFP_USER was used specifically for that part, or just randomly :)

> likely the thing we are assuming here is that we are migrating a page, and
> usually, these are user allocation (except maybe balloon and some other non-lru
> movable things).

Yeah and user allocations obey cpuset and mempolicies etc. But these are
likely somebody elses allocations that were done according to their
policies. With our migration we might be actually violating those, which
probably can't be helped (is at least migration within the same node
preferred? hmm). But it doesn't seem to me that our caller's restrictions
(if those exist, would be enforced by __GFP_HARDWALL) are that relevant for
somebody else's pages?

> The __GFP_RETRY_MAYFAIL should be moved to relevant callers a some point,
> __GFP_HARDWALL, I really don't know ...
> 
> Thanks!
> 


