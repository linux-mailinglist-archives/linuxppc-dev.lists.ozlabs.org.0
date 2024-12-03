Return-Path: <linuxppc-dev+bounces-3724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFAF9E1DA0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 14:33:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2hRq4Nmxz302c;
	Wed,  4 Dec 2024 00:33:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733232791;
	cv=none; b=e2SmxcjCX26I41pbYxLVNQtepqc6tFWFTtoKFwVacfhbaLkr5f33f4xu7RPZq2l6KqgjLeZS/q5b0IhobZWmse6TNnlPwr0cFxlEVwtx6znh7gedzCv7DAkQB85wyQfHGdLhomNEj2K8lGfmNtTBl6mXxMbAylQ0LqL+3TbkSiuPzJcNBec2LArokIPAlit/CAlg0iwTIFV5NjHBieASqYy1rtXw6i/r5TAG8uuh8o0Tf8VUQ6TLgdVI00ofamIGPI+5w+tiYAAh3gj/uVlNmT9OTTKE1fA43ziltddzLrXIWh+Vxfe5CFHsAj3ZHyr4qMaJ9yCTT3JVKCVQzXDUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733232791; c=relaxed/relaxed;
	bh=jdmQf9A9c3+pcii2FDFPbM18TTsEtfAMO3Iwr/KW5xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0XutQuDoM7fkfzErOZUkr82FPmr6JdUob+3FzHSqKNQfcRTJgNl0eJYTMSGYHlO7cA8JAJ4klE+cGgRIAvXo9gBc7a5jLYOVvetCDaxZTMTnXRu12j+8Vvw9fub/CMfJhRlLLPnu5zJFBNFxKxyT90hyQPUkn2BYl/5zpFgCxOz9oWp9RAmRdQHkx5oiO7n/06hnW1clyjbFqIhkhHsLWduiTOD374LKnN1Fsh60L0zApYL/Zg1+4ZPfz+5nY+BhnCckJyfU1jdzVTWX/4BXNzrnr86TXJ0HFo8Vjv/pJ0ClbYL6owO7oGmcERiSNNUIoEYAHRcbYJujY6tK3mEbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=3BI+y1Zx; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1mYxALwo; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=3BI+y1Zx; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1mYxALwo; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=3BI+y1Zx;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1mYxALwo;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=3BI+y1Zx;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1mYxALwo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2hRp4zgqz301T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 00:33:10 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F3E371F453;
	Tue,  3 Dec 2024 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733232788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jdmQf9A9c3+pcii2FDFPbM18TTsEtfAMO3Iwr/KW5xk=;
	b=3BI+y1Zx5pK8pEkAYDlNNxGsUYH79LE8hNS6sv4umXISbA+A35iKYgNl+Dyt3gCIBlBGwt
	49BTNXSBUEcqH/7XNxo7D39GflzLxqqJwHSULnpJt7N81ZOwE9quzF/7sT9lI2F0mwH1c6
	iO+g9CwJpG4hY8eZbo0TYDahIiB6UgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733232788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jdmQf9A9c3+pcii2FDFPbM18TTsEtfAMO3Iwr/KW5xk=;
	b=1mYxALwof+5OJlVTprquUJGOpEGw4EFe6sgO/3cVSflyf5paULj9ngRZTi+XPYMJDNthIn
	wZlkTI7GYlCwyrAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1733232788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jdmQf9A9c3+pcii2FDFPbM18TTsEtfAMO3Iwr/KW5xk=;
	b=3BI+y1Zx5pK8pEkAYDlNNxGsUYH79LE8hNS6sv4umXISbA+A35iKYgNl+Dyt3gCIBlBGwt
	49BTNXSBUEcqH/7XNxo7D39GflzLxqqJwHSULnpJt7N81ZOwE9quzF/7sT9lI2F0mwH1c6
	iO+g9CwJpG4hY8eZbo0TYDahIiB6UgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1733232788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jdmQf9A9c3+pcii2FDFPbM18TTsEtfAMO3Iwr/KW5xk=;
	b=1mYxALwof+5OJlVTprquUJGOpEGw4EFe6sgO/3cVSflyf5paULj9ngRZTi+XPYMJDNthIn
	wZlkTI7GYlCwyrAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D833313A15;
	Tue,  3 Dec 2024 13:33:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XsJfNJMIT2e6IQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 03 Dec 2024 13:33:07 +0000
Message-ID: <93808ae8-4607-41b1-ba6c-20c78279d6f7@suse.cz>
Date: Tue, 3 Dec 2024 14:33:07 +0100
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
Subject: Re: [PATCH RESEND v2 3/6] mm/page_alloc: make
 __alloc_contig_migrate_range() static
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-4-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20241203094732.200195-4-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:mid]
X-Spam-Score: -8.30
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/3/24 10:47, David Hildenbrand wrote:
> The single user is in page_alloc.c.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/internal.h   | 4 ----
>  mm/page_alloc.c | 5 ++---
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 74713b44bedb..4bd3685c33ef 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -839,10 +839,6 @@ int
>  isolate_migratepages_range(struct compact_control *cc,
>  			   unsigned long low_pfn, unsigned long end_pfn);
>  
> -int __alloc_contig_migrate_range(struct compact_control *cc,
> -					unsigned long start, unsigned long end,
> -					int migratetype);
> -
>  /* Free whole pageblock and set its migration type to MIGRATE_CMA. */
>  void init_cma_reserved_pageblock(struct page *page);
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index f371fbf2145b..ce7589a4ec01 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6284,9 +6284,8 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
>   * @migratetype: using migratetype to filter the type of migration in
>   *		trace_mm_alloc_contig_migrate_range_info.
>   */
> -int __alloc_contig_migrate_range(struct compact_control *cc,
> -					unsigned long start, unsigned long end,
> -					int migratetype)
> +static int __alloc_contig_migrate_range(struct compact_control *cc,
> +		unsigned long start, unsigned long end, int migratetype)
>  {
>  	/* This function is based on compact_zone() from compaction.c. */
>  	unsigned int nr_reclaimed;


