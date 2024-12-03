Return-Path: <linuxppc-dev+bounces-3725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D70149E1DBF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 14:38:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2hYR3lgnz301T;
	Wed,  4 Dec 2024 00:38:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733233083;
	cv=none; b=R6n3RBgkeghgdsbMYgERU/7eERTjnbYbh4lrmi8h3bsVXcKvUAWy9/11WeCXk83Cis4Fs7uy8Q6X2EvFoZmxM/zRU0w1GqlcoS3XdlyV2/j2fZ1heQ34QCOVVa1yG+7qoyrnoadSLlfeXqPUj1t0mLup1OeV+RCNrMOxNi4L+fFjrXMqIwVN+mfmgQxBM1A/ohkP2Y77IL5aeW5Q1PaEKdhAE8pIr6wt5LK8ZMzr2B+SLRTL8TiIaQ1bYLmd3W+OsGE5uJ8R5tVFj9ziSemUql+KQlpV4jmjhxVxcx88l4QG+mZxFl2LLhtPs95NLJ2EjZ05yB0Ev/vdw6iV1hLzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733233083; c=relaxed/relaxed;
	bh=21Tj0Vtrl++WyZ6wV5+oyun0i/cIREtxJghpq0bEQk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qv8HAhrhZefsR7cCCIVVsoemPrKzliG2sWIjhP1AJ3LVN6eyYP2bJ7Dlghze0jJNWZn5CngxTQnUkh4cR89fQ3dGNX0A+isYbsWERpON50ecjATvXFg2bnSWtKe+x3ixdu/eKtlVZI00+AHQG/3fsNutq+GXloFPCDqACrZto/kZBe1p+bQSuPpPq9RbR/QFa2XVZSNigeayqxRDFjCNUVviwfQ5LCLtFuZw4sAko+feFEBGhZffBQyaBaZSu7dhFIS+qbOKAGrOX+3kdVPue0N2YtHQNlH2Feodn+XxWqh/4ZMNpDDcLZHc0MFyDMTVze8tcODqJuiqIEcb2LRpdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 409 seconds by postgrey-1.37 at boromir; Wed, 04 Dec 2024 00:38:02 AEDT
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2hYQ1w9Qz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 00:38:01 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93A0D1F445;
	Tue,  3 Dec 2024 13:31:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 781F513A15;
	Tue,  3 Dec 2024 13:31:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HGbLHBcIT2cYIQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 03 Dec 2024 13:31:03 +0000
Message-ID: <2e66a245-30d3-4765-95df-13d300de5d13@suse.cz>
Date: Tue, 3 Dec 2024 14:31:03 +0100
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
Subject: Re: [PATCH RESEND v2 1/6] mm/page_isolation: don't pass gfp flags to
 isolate_single_pageblock()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador
 <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
References: <20241203094732.200195-1-david@redhat.com>
 <20241203094732.200195-2-david@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20241203094732.200195-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 93A0D1F445
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 12/3/24 10:47, David Hildenbrand wrote:
> The flags are no longer used, we can stop passing them to
> isolate_single_pageblock().
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

> ---
>  mm/page_isolation.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index 7e04047977cf..e680d40d96de 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -286,7 +286,6 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>   * within a free or in-use page.
>   * @boundary_pfn:		pageblock-aligned pfn that a page might cross
>   * @flags:			isolation flags
> - * @gfp_flags:			GFP flags used for migrating pages
>   * @isolate_before:	isolate the pageblock before the boundary_pfn
>   * @skip_isolation:	the flag to skip the pageblock isolation in second
>   *			isolate_single_pageblock()
> @@ -306,8 +305,7 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
>   * the in-use page then splitting the free page.
>   */
>  static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
> -			gfp_t gfp_flags, bool isolate_before, bool skip_isolation,
> -			int migratetype)
> +		bool isolate_before, bool skip_isolation, int migratetype)
>  {
>  	unsigned long start_pfn;
>  	unsigned long isolate_pageblock;
> @@ -489,7 +487,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>  	bool skip_isolation = false;
>  
>  	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
> -	ret = isolate_single_pageblock(isolate_start, flags, gfp_flags, false,
> +	ret = isolate_single_pageblock(isolate_start, flags, false,
>  			skip_isolation, migratetype);
>  	if (ret)
>  		return ret;
> @@ -498,7 +496,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
>  		skip_isolation = true;
>  
>  	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
> -	ret = isolate_single_pageblock(isolate_end, flags, gfp_flags, true,
> +	ret = isolate_single_pageblock(isolate_end, flags, true,
>  			skip_isolation, migratetype);
>  	if (ret) {
>  		unset_migratetype_isolate(pfn_to_page(isolate_start), migratetype);


