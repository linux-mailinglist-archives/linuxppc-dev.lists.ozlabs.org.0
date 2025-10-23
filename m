Return-Path: <linuxppc-dev+bounces-13215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F3C021EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 17:30:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csqk61Lhgz3bfF;
	Fri, 24 Oct 2025 02:30:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761233454;
	cv=none; b=fGysuCQPsgo/MUXGho6iP7dOJA/+6yQSuCpGvi8JBe8+Qms8/Mn7M4tXsMyfPdhPN8tpb4k15zcqKmj7iijB/GUt9BuNCjg9AWvlzGFazjFoCRb1USfmVUv+ZcgZx4yVm+sGqGAa26WMUM6yrgFKbZsQuie+SBAKwXpzX6YZqKT7zs/8oY0NPahFuTo2d6WQdgdbNNxEH4pzAKO0iXVx7dxDBfIN74OjCYKFC5wpkUfaEu1cEy+eWDxVCYsHeWz9ZPMubAIWYrPwfo/+BaJoxJs4xHshRdPmTZhskRJRpbTgsGHFXliZJWcw5xVfMsJNJDmYnAa1RM+2o1er4cBKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761233454; c=relaxed/relaxed;
	bh=Tr76UWkBmhbzeJoAKpnHprT1sOTnO5bbrqUUa+4UTp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m87ipKUw0A2rKSI9AKii6MMcf0fwTOKNN1OhYSQmdmIz2S1RGwAMhtIskCUZ/nM0FnuWr3uaFiJ68GSEPOc5YS5T96C7ISq1nl2HxZo/Tr5/IIeVdHlbnznOHL7CJhDL2xyTDjgG2ZKYW18xVAvGRNxWYnTN9zwLXX4DjxGSoCttzwJ2zGn56HzMxP9rtmPtbDl1lbAmhl/DRwIJR9EsJ55EVa6BIzIp4Q8ARq4GFfAN+S4Mft3EwAdTebreZ/EWPX0QKJOsmASmT6dMCHnApIBLIETo34+9ioCau/qdie+HJvqDQDuIPRcfWecj9iOvF6dDzT/xPbfl0hJ6RCRARA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RiCVhwNq; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MYWMFF3K; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=MtZuXCaQ; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qJHzm0Yx; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jbohac@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RiCVhwNq;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MYWMFF3K;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=MtZuXCaQ;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qJHzm0Yx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jbohac@suse.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 427 seconds by postgrey-1.37 at boromir; Fri, 24 Oct 2025 02:30:51 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csqk36hdPz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 02:30:51 +1100 (AEDT)
Received: from localhost (unknown [10.100.12.32])
	by smtp-out1.suse.de (Postfix) with ESMTP id C947521223;
	Thu, 23 Oct 2025 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761233017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tr76UWkBmhbzeJoAKpnHprT1sOTnO5bbrqUUa+4UTp8=;
	b=RiCVhwNqnXXf/1v2CLdvxtRp1IJrfqPAivJ6sht+Q6PG0Q6HyHnMPdal9bMu83FjydFZ1K
	th0hlH1trWpZZIN6dCT5PbePcZZFn5wnF2n8ZOb7bhgJJxADd4VInkQzPyLcuW9GyYp2IR
	m9cTkpaZmZ/rxrCum76jWqbu6nUwZ4g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761233017;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tr76UWkBmhbzeJoAKpnHprT1sOTnO5bbrqUUa+4UTp8=;
	b=MYWMFF3KrxM10W1+hkCtSbph/xdzMXsIWcsPqyOzeyk6wqTiG+vNLtyzXGs3ivk/mhL9Ly
	UBstXNvc2H+8lQDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1761233012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tr76UWkBmhbzeJoAKpnHprT1sOTnO5bbrqUUa+4UTp8=;
	b=MtZuXCaQvgvwETWJvuyRtXTmedvj2Gj07e1YFK3UyH63WW4MmMpVdLVolh5XZ41RDU7zUK
	MfpBG16nK3G/N9yhlKCgU7xsB4lTkEsFUiXXTki+VJkOAbfLzgH8G/0z6fnFQqV8Tsup1h
	qVsqmA8YU23slw/+ZGq5UMNP7aTsqaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1761233012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tr76UWkBmhbzeJoAKpnHprT1sOTnO5bbrqUUa+4UTp8=;
	b=qJHzm0YxqJCMh5UENrgVqRbxQyg8aJRDR6az2mOvrFEBOUVwLLjOkZ3UIR7Hpi3KwiKpaP
	jYdKUyi+JBej7nAQ==
Date: Thu, 23 Oct 2025 17:23:32 +0200
From: Jiri Bohac <jbohac@suse.cz>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/kdump: Add support for crashkernel CMA
 reservation
Message-ID: <aPpIdHMnSHRq8M6B@dwarf.suse.cz>
References: <20251023121413.56963-1-sourabhjain@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023121413.56963-1-sourabhjain@linux.ibm.com>
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,localhost:helo]
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 05:44:12PM +0530, Sourabh Jain wrote:
> @@ -595,6 +602,13 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>  	if (ret)
>  		goto out;
>  
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range(tmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			goto out;
> +	}
> +

I think the loop needs to check if tmem->nr_ranges == tmem->max_nr_ranges and
reallocate in each iteration, just like it's done when excluding the crashk_res
region above:

        /* Reallocate memory ranges if there is no space to split ranges */
        tmem = *mem_ranges;
        if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
                tmem = realloc_mem_ranges(mem_ranges);
                if (!tmem)
                        goto out;
        }

        /* Exclude crashkernel region */
        ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
        if (ret)
                goto out;



-- 
Jiri Bohac <jbohac@suse.cz>
SUSE Labs, Prague, Czechia


