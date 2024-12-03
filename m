Return-Path: <linuxppc-dev+bounces-3726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 000509E1E54
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 14:56:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2hy82gRJz301x;
	Wed,  4 Dec 2024 00:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733234160;
	cv=none; b=SHcA9iWgzqvT/BlNHJV+jL5K4Pex5qFHucOxRgba9IqKVyMjF7ibvrwfRbKkSO4og4bczjCXjIU3ZF4Werf7VgG3tvLb5IIWMgjvjppxlLvGpWZwmhPHpdQvCOMjq0wlx+hHQhkb4Lf+WJI0IT/7SpEuKGOJPMLeTAQ6RsyfWcRyy40Hq3rSFYgI6fPda4bDRXloT1YUH0fNNhp/Esvj3eqmWE+00e2PhkTEaXKZ6KkEv9d9Dw1gPbBespL+huUW9RAk7QvVgI+1Ihpyg10va7SKZdNAwQuwwOqJFlSnTKGYZq0M4gTcFVmFJwOr8nfE62YpmUsFEeErytrnZK+6rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733234160; c=relaxed/relaxed;
	bh=4KynxMQIIsg9lKBo+Malf4czBIJ4XCORrknIGenaWYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCf3MBNgUe9knocv1cH++J2yGfnirVidbNuTPMQQ2Wa/tx338hMDEgK3WgpoP6ABRZjgurN7pKAHE+LepbQHp2JxAZx1hYpGP118nZ6pYPRRdAlxI3UuvoJAwIMylk/d42BnaLDUZzXlsh6xrRIFbZve+1Z1axbAj2tbEhBxrE9cDsQJRlQyAs9bOJ2+V52NY5PhBUwpFiNCh/pK9fgXrufbINMvitCM4un23PLBa2qGrMyCtL1qtNw7fuotqBeV1TdIiqyGh4NFMMhWSZFWt136PCCPp2zpDxryjxhy3FmIOuq9Z8RUqZvtgtQ6XMrcmIsoSW7ayCop0dJVpqkcEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2hy66J7lz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 00:55:57 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C7DE21166;
	Tue,  3 Dec 2024 13:55:54 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 206F513A15;
	Tue,  3 Dec 2024 13:55:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +NefB+oNT2dGKQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 03 Dec 2024 13:55:54 +0000
Message-ID: <feffbbe8-4176-48e8-b503-ef53d7914197@suse.cz>
Date: Tue, 3 Dec 2024 14:55:53 +0100
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
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20241203094732.200195-5-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 3C7DE21166
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/3/24 10:47, David Hildenbrand wrote:
> It's all a bit complicated for alloc_contig_range(). For example, we don't
> support many flags, so let's start bailing out on unsupported
> ones -- ignoring the placement hints, as we are already given the range
> to allocate.
> 
> While we currently set cc.gfp_mask, in __alloc_contig_migrate_range() we
> simply create yet another GFP mask whereby we ignore the reclaim flags
> specify by the caller. That looks very inconsistent.
> 
> Let's clean it up, constructing the gfp flags used for
> compaction/migration exactly once. Update the documentation of the
> gfp_mask parameter for alloc_contig_range() and alloc_contig_pages().
> 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> +	/*
> +	 * Flags to control page compaction/migration/reclaim, to free up our
> +	 * page range. Migratable pages are movable, __GFP_MOVABLE is implied
> +	 * for them.
> +	 *
> +	 * Traditionally we always had __GFP_HARDWALL|__GFP_RETRY_MAYFAIL set,
> +	 * keep doing that to not degrade callers.
> +	 */

Wonder if we could revisit that eventually. Why limit migration targets by
cpuset via __GFP_HARDWALL if we were not called with __GFP_HARDWALL? And why
weaken the attempts with __GFP_RETRY_MAYFAIL if we didn't specify it?

Unless I'm missing something, cc->gfp is only checked for __GFP_FS and
__GFP_NOWARN in few places, so it's mostly migration_target_control the
callers could meaningfully influence.

> +	*gfp_cc_mask = (gfp_mask & (reclaim_mask | cc_action_mask)) |
> +			__GFP_HARDWALL | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL;
> +	return 0;
> +}
> +
>  /**
>   * alloc_contig_range() -- tries to allocate given range of pages
>   * @start:	start PFN to allocate
> @@ -6398,7 +6431,9 @@ static void split_free_pages(struct list_head *list)
>   *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
>   *			in range must have the same migratetype and it must
>   *			be either of the two.
> - * @gfp_mask:	GFP mask to use during compaction
> + * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
> + *		action and reclaim modifiers are supported. Reclaim modifiers
> + *		control allocation behavior during compaction/migration/reclaim.
>   *
>   * The PFN range does not have to be pageblock aligned. The PFN range must
>   * belong to a single zone.
> @@ -6424,11 +6459,14 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
>  		.mode = MIGRATE_SYNC,
>  		.ignore_skip_hint = true,
>  		.no_set_skip_hint = true,
> -		.gfp_mask = current_gfp_context(gfp_mask),
>  		.alloc_contig = true,
>  	};
>  	INIT_LIST_HEAD(&cc.migratepages);
>  
> +	gfp_mask = current_gfp_context(gfp_mask);
> +	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
> +		return -EINVAL;
> +
>  	/*
>  	 * What we do here is we mark all pageblocks in range as
>  	 * MIGRATE_ISOLATE.  Because pageblock and max order pages may
> @@ -6571,7 +6609,9 @@ static bool zone_spans_last_pfn(const struct zone *zone,
>  /**
>   * alloc_contig_pages() -- tries to find and allocate contiguous range of pages
>   * @nr_pages:	Number of contiguous pages to allocate
> - * @gfp_mask:	GFP mask to limit search and used during compaction
> + * @gfp_mask:	GFP mask. Node/zone/placement hints limit the search; only some
> + *		action and reclaim modifiers are supported. Reclaim modifiers
> + *		control allocation behavior during compaction/migration/reclaim.
>   * @nid:	Target node
>   * @nodemask:	Mask for other possible nodes
>   *


