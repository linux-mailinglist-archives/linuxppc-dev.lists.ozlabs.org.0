Return-Path: <linuxppc-dev+bounces-4851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA30A05F5E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 15:53:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSrX46RtMz30Tm;
	Thu,  9 Jan 2025 01:53:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736348020;
	cv=none; b=ChJCBZQ5OAZMGU196VNvOIJTjbxYW0VYxCfFDrXm9KmDn4ZtZZQf4Oa9bMb0I1PNWK+ZN+6SbDWdh5g0oY+0ikGwAVYBl4Jjos31ziYKCNIBfB3h2XQ2S7e4gtRIx8BM4r+e1oH6TSswNFZoci4ggBH/wp6cVpMeAIqZZ9dnT6SLI/qEp4dCObPyqof+dzdFsFfScwWTcfS8XfVq3oVnHu9Gwr/X4z67TQDhutUM28/A2QcZFAiQtHP1kASgGBpwqs71UKM0o9O8WtmVEd8ALV4BhXcgxLUR65rtVhgpRgYDDemxu6Arcmu6vhMV8PzeGBKGT3Vgy+Y9i0lDY8BquA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736348020; c=relaxed/relaxed;
	bh=CmZeVg4paUqZXHBA1Hyf9TodgrR7l1lwRSqll3f7GMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bstQT7QXqNheRi9SMAYrqJhePTHHHCq4HzxgTzUBEzMJBLdJsrsQ4xfdtCGxUvqZhaAFzwum2TAZ5Ye2ABq0cs+gdXfskO1lT8wHZhBTIAOaTqS0sbJP6EBZS1u3/YzEs726QvY9mrpGSJL7l9YJrMJesiw7P5+u+VCtepTkNAvTIKiReil4u7+pTE4iGxouS5q8iwxClkecezbSzvdDDqkkYHlHgnHTxETp3+f+VgbFOnqpBVxdiHyzhY0cT64HF2bTqMVAK8deZ/Usk9cALkRZ0xqW3pnzAnC2gjiFxbf1ufAfxUJtwRvor5l40AMkeKI26feB//uWXkTeYIhDzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d6iG+uf4; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d6iG+uf4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSrX349nwz30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 01:53:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D31F05C490A;
	Wed,  8 Jan 2025 14:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131F0C4CEDD;
	Wed,  8 Jan 2025 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736348014;
	bh=Wc5NJJgSLmBbDtDATC3/rAfSv7csY6/S8IjZjpkVFY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6iG+uf4HD0hHIn8yoaeCaAg58A2M84CQ202sAQJx4yyinOEEgMMIh420h+t5BZCp
	 ZpDSQeRM9e5RYXIVjWoZ4CTh8IqoY2EqIjsKPD4BHwwYuxiI0nU9RsmlB3qCCF2O8I
	 M/xPGQmJtJ+KbDcSZApuNjDHdu0nKzMSCcREJP4qQfY8f7wSkzFqtlp4p78+GtKfx/
	 RyZxm+wE7c7S2lqNwivcFQuRbrNwXL1MKqXG7E7Ni+NhB61Ojw/ruf+0kVwjeEbf7k
	 BpZrZviQHaVEeMHYgxsRQsA3zBWbjGnQCIHC7+nMv+1qvfkIrDVr9c9r6FzEfhWquC
	 CpgGCQJO5KFXQ==
Date: Wed, 8 Jan 2025 11:53:31 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [PATCH v2] perf: Fix display of kernel symbols
Message-ID: <Z36Ra23US_zC3n2v@x1>
References: <2ea4501209d5363bac71a6757fe91c0747558a42.1736329923.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ea4501209d5363bac71a6757fe91c0747558a42.1736329923.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 10:54:20AM +0100, Christophe Leroy wrote:
> Since commit 659ad3492b91 ("perf maps: Switch from rbtree to lazily
> sorted array for addresses"), perf doesn't display anymore kernel
> symbols on powerpc, allthough it still detects them as kernel addresses.
> 
> 	# Overhead  Command     Shared Object  Symbol
> 	# ........  ..........  ............. ......................................
> 	#
> 	    80.49%  Coeur main  [unknown]      [k] 0xc005f0f8
> 	     3.91%  Coeur main  gau            [.] engine_loop.constprop.0.isra.0
> 	     1.72%  Coeur main  [unknown]      [k] 0xc005f11c
> 	     1.09%  Coeur main  [unknown]      [k] 0xc01f82c8
> 	     0.44%  Coeur main  libc.so.6      [.] epoll_wait
> 	     0.38%  Coeur main  [unknown]      [k] 0xc0011718
> 	     0.36%  Coeur main  [unknown]      [k] 0xc01f45c0
> 
> This is because function maps__find_next_entry() now returns current
> entry instead of next entry, leading to kernel map end address
> getting mis-configured with its own start address instead of the
> start address of the following map.
> 
> Fix it by really taking the next entry, also make sure that entry
> follows current one by making sure entries are sorted.
> 
> Fixes: 659ad3492b91 ("perf maps: Switch from rbtree to lazily sorted array for addresses")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
> v2: Make sure the entries are sorted, if not sort them.

Since you have changed what I reviewed I'll have to re-review :-) Will
try to do it after some calls.

- Arnaldo

> ---
>  tools/perf/util/maps.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
> index 432399cbe5dd..09c9cc326c08 100644
> --- a/tools/perf/util/maps.c
> +++ b/tools/perf/util/maps.c
> @@ -1136,8 +1136,13 @@ struct map *maps__find_next_entry(struct maps *maps, struct map *map)
>  	struct map *result = NULL;
>  
>  	down_read(maps__lock(maps));
> +	while (!maps__maps_by_address_sorted(maps)) {
> +		up_read(maps__lock(maps));
> +		maps__sort_by_address(maps);
> +		down_read(maps__lock(maps));
> +	}
>  	i = maps__by_address_index(maps, map);
> -	if (i < maps__nr_maps(maps))
> +	if (++i < maps__nr_maps(maps))
>  		result = map__get(maps__maps_by_address(maps)[i]);
>  
>  	up_read(maps__lock(maps));
> -- 
> 2.47.0

