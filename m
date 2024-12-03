Return-Path: <linuxppc-dev+bounces-3730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 995869E1F78
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 15:37:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2jsW6Ny3z30B5;
	Wed,  4 Dec 2024 01:37:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733236623;
	cv=none; b=mDu3Ep2Nu0R2vuXgJ8CVbTkmlq4pdv6SFgo2GXHtT6S5UB+7EqvnIXUCkbzXyS4O7O6/b6sp2M9iWQyTUPN3FCq8xT1yiiCU0smSTgarmB/L3sAJK7GDyIa1ydMjo2N3KSfa4jGyY9BYH76BKrRGp5AZfGDSJhX8IV94cpdLggnHZii5RMlirfYJ2kWNxa9w+aMGfR/mubgcOPGuxzvJfuLZLhwyw5AIaP/X3zFwprtivUglttx4dFCpM+qy5B8ZNL2UVFyFXMPEDZkuK5oiY7WvPVAnyEIvF/8lLKMzLmXQNYovHDTUk2kUbFlillmwpIgmtr20o18RZeysChlhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733236623; c=relaxed/relaxed;
	bh=blsq4WzsUPf8s8FM67uXWrb8aFubNujefzu173v3mZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VR31/3ihP/mAaoIX8xa+xD99BJPkgIrrcYRzLnKQB/xri1/LjRYMAp9rosfahpzNiwasUFNRW3AuXH5y75JPuasUAy2RA1+AhNb6Qk8XGaKSUCRl1i52hr6xJzRWc/yrYVAausHXs3PWXQlIO8H7wp4AB/RLN9lopBu6dGg6Qbm1LfnRT5OedxQXk1BbfztRqmz5JBYFZpYYRkpsLQF6MB57tRKPhjHeGV6dMp8YavWZ9heaJoDe92reb5HzRWOL+rBNkkc9XNkGjOVPEEoG37+cfDNCBtndFjPHhx/FwoiKTMP+5Ir1L+uY5+tk6i123n3l/MvN9oxzvEpIHxyZNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mpYsqH6y; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IBmWl1Gx; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=N+J5mDmR; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=14YzFBcv; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mpYsqH6y;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IBmWl1Gx;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=N+J5mDmR;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=14YzFBcv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2jsV3tytz302D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 01:37:00 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 122301F445;
	Tue,  3 Dec 2024 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733236617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blsq4WzsUPf8s8FM67uXWrb8aFubNujefzu173v3mZ4=;
	b=mpYsqH6yIoNfTupFM7f2/4kU8SWGu0tFNTXUpwJjOYlOTeXXlJcpTG1ycS687Aw+ydThLk
	q4APJEhp469/cqEJD1jVM0UVtuHUVc+5T8sllJ6Gw791HbgoUBKGjmru0148K12Y0ua/yl
	w+8sOpY1KaKVYESa0U/DiXt7DA6AdBA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733236617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blsq4WzsUPf8s8FM67uXWrb8aFubNujefzu173v3mZ4=;
	b=IBmWl1GxBX6K6GsUtZitbbHRP5HiiNYhQz/TUIo6sDgDOn/MiGFA+tlnF7azFVSLAc8+p2
	rTU7iUs/5o6wIYCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733236616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blsq4WzsUPf8s8FM67uXWrb8aFubNujefzu173v3mZ4=;
	b=N+J5mDmRu94/sssudMp4OIK6GoDuJxtMzqft9IofAy9qrNWERFu8xkHgsxT6S5CgQ8ohDm
	pXufJTxkjhuuGcJDywOJU3hHKEOOxFZ7ycWtlL7Twp7DQOGDkCOxDnyvOHTyuG0jin8Tg2
	IPJ0/so4t1aY3SvE/jNtMgaTucO9s1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733236616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blsq4WzsUPf8s8FM67uXWrb8aFubNujefzu173v3mZ4=;
	b=14YzFBcvuMO+7fVU4/qUGzO+tZqAko9YOrBIjfeG5mb/TPMK7dhJiA9j9XjVv7Bc8U1bZI
	yxna4vnyaSPrGRBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E63B1139C2;
	Tue,  3 Dec 2024 14:36:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /kCiN4cXT2eTNgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 03 Dec 2024 14:36:55 +0000
Message-ID: <d7b7a5c7-ef3f-44f2-9eb6-817b21ffc00e@suse.cz>
Date: Tue, 3 Dec 2024 15:36:55 +0100
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
Subject: Re: [PATCH RESEND v2 5/6] mm/page_alloc: forward the gfp flags from
 alloc_contig_range() to post_alloc_hook()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-6-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20241203094732.200195-6-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,lists.ozlabs.org,linux-foundation.org,suse.de,nvidia.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -8.30
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/3/24 10:47, David Hildenbrand wrote:
> In the __GFP_COMP case, we already pass the gfp_flags to
> prep_new_page()->post_alloc_hook(). However, in the !__GFP_COMP case, we
> essentially pass only hardcoded __GFP_MOVABLE to post_alloc_hook(),
> preventing some action modifiers from being effective..
> 
> Let's pass our now properly adjusted gfp flags there as well.
> 
> This way, we can now support __GFP_ZERO for alloc_contig_*().
> 
> As a side effect, we now also support __GFP_SKIP_ZERO and__GFP_ZEROTAGS;
> but we'll keep the more special stuff (KASAN, NOLOCKDEP) disabled for
> now.
> 
> It's worth noting that with __GFP_ZERO, we might unnecessarily zero pages
> when we have to release part of our range using free_contig_range() again.
> This can be optimized in the future, if ever required; the caller we'll
> be converting (powernv/memtrace) next won't trigger this.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/page_alloc.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 54594cc4f650..71d70bc0ad79 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6364,7 +6364,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
>  	return (ret < 0) ? ret : 0;
>  }
>  
> -static void split_free_pages(struct list_head *list)
> +static void split_free_pages(struct list_head *list, gfp_t gfp_mask)
>  {
>  	int order;
>  
> @@ -6375,7 +6375,7 @@ static void split_free_pages(struct list_head *list)
>  		list_for_each_entry_safe(page, next, &list[order], lru) {
>  			int i;
>  
> -			post_alloc_hook(page, order, __GFP_MOVABLE);
> +			post_alloc_hook(page, order, gfp_mask);
>  			set_page_refcounted(page);
>  			if (!order)
>  				continue;
> @@ -6393,7 +6393,8 @@ static void split_free_pages(struct list_head *list)
>  static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
>  {
>  	const gfp_t reclaim_mask = __GFP_IO | __GFP_FS | __GFP_RECLAIM;
> -	const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> +	const gfp_t action_mask = __GFP_COMP | __GFP_RETRY_MAYFAIL | __GFP_NOWARN |
> +				  __GFP_ZERO | __GFP_ZEROTAGS | __GFP_SKIP_ZERO;
>  	const gfp_t cc_action_mask = __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
>  
>  	/*
> @@ -6541,7 +6542,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
>  	}
>  
>  	if (!(gfp_mask & __GFP_COMP)) {
> -		split_free_pages(cc.freepages);
> +		split_free_pages(cc.freepages, gfp_mask);
>  
>  		/* Free head and tail (if any) */
>  		if (start != outer_start)


