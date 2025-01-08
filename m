Return-Path: <linuxppc-dev+bounces-4868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A330A065A2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 20:56:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSzF26lbJz30Tk;
	Thu,  9 Jan 2025 06:56:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736366166;
	cv=none; b=MnkNhcyEJXUmpmQsXJaWot2LZauTxLa6QmleT35cpsdOrS//4vw0BN5vd76HOGgAP6QmBLPKlvNcxgdx+qaGpn0+i0A0UPyi0kgLU6HEdnHzE3QbaP0y6tkfsMT4/s/dkkpMoeTv7aXlimIlpilcmH1JEslnw/d8M0EDNoj1/+e7yAIVY28TyroIrLjwLkt8vXg1P/1Y2yQibMz5vVttujpizll8CBQ5N2JASPwiBeFVNvbnAidHSQPOi0ao0usSeOZJTLGm93A78y0C9RKFjXgWLPtLSOiD66mlM+o7pk8ZYpizp1ptWLYg17eur4bJcmFIZUg70sh9zyHptJlQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736366166; c=relaxed/relaxed;
	bh=DLoj7F2XuhLzbYcZG1StIPmnR6qXvg+yrwpMBesALIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu+8tCjg/oTR0DH2VAEoJy1pf3qmxdX2fnbZGkpx9V35Mf8tREYxKdsf1l+7Yrz+1rzrSCw5tYO/Y9sZ48SpUI1B5m5MepVWp+YgsJAnyy6vIgTSjY1KmTu4KtuleXS5c83pqI0SMy0nuei4JJTeZTI1QX/gaGtiy0hC/H1jJMpc3cS6VtUeUUjlVKziVBsye6+qhNzdBHLbd1ggv4eEmC12alIP/taAS3GJKIrX2E3JkffwhajDwvFanlTeiEvc6MDhMbpflDou0K3kpeYldKSrYpY34zHHnI8CBIz1neVTnlnR1SzrPp0+iuzyAhQaDaIDfKwR+r8Jeheca9qc2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OH+Lj21X; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OH+Lj21X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSzDx5kslz30Tc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 06:56:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8D30A418E8;
	Wed,  8 Jan 2025 19:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9E3C4CED3;
	Wed,  8 Jan 2025 19:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736366156;
	bh=d+BjqX6a64TsT7Fi6gIQ6p4XPXOWjDadBxtZpjjVovA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OH+Lj21XHbgPnC5NYzAOBn+0XFmBdOYGW+2uq7Q05QfZsIGko1fVrqdXRXROpO+eW
	 IBIPB60MrsrRF9UN+stOzAQwvS0WXGcN1gOhl0Y0j/LpOwaas02s0NPB4LrsbCwii6
	 ty4yaa7SAg/PvDevQ30LStkmfSZYhbkQyFBHOY3dlmokGXyIh5B73LwbVBVnslFQZz
	 8NZkKDibtwZ9zzkrVTY6OQUsngSI3BbbLiLZntA5Kq+ffvBZEzhv75Nh32KGi+EohB
	 ZX69upswPUNBiHZsw6WIIFMQSbWIPB+AvgNzUUC6rJqDvm7mKv4w0pmyH6mkPV21QG
	 HWT3KPgejjQHg==
Date: Wed, 8 Jan 2025 16:55:53 -0300
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
Message-ID: <Z37YSfVMabaJ3A8z@x1>
References: <2ea4501209d5363bac71a6757fe91c0747558a42.1736329923.git.christophe.leroy@csgroup.eu>
 <Z36Ra23US_zC3n2v@x1>
 <590b2f02-f7f0-48b2-b45e-8a31bbadef2a@csgroup.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <590b2f02-f7f0-48b2-b45e-8a31bbadef2a@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 06:06:03PM +0100, Christophe Leroy wrote:
> 
> 
> Le 08/01/2025 à 15:53, Arnaldo Carvalho de Melo a écrit :
> > On Wed, Jan 08, 2025 at 10:54:20AM +0100, Christophe Leroy wrote:
> > > Since commit 659ad3492b91 ("perf maps: Switch from rbtree to lazily
> > > sorted array for addresses"), perf doesn't display anymore kernel
> > > symbols on powerpc, allthough it still detects them as kernel addresses.
> > > 
> > > 	# Overhead  Command     Shared Object  Symbol
> > > 	# ........  ..........  ............. ......................................
> > > 	#
> > > 	    80.49%  Coeur main  [unknown]      [k] 0xc005f0f8
> > > 	     3.91%  Coeur main  gau            [.] engine_loop.constprop.0.isra.0
> > > 	     1.72%  Coeur main  [unknown]      [k] 0xc005f11c
> > > 	     1.09%  Coeur main  [unknown]      [k] 0xc01f82c8
> > > 	     0.44%  Coeur main  libc.so.6      [.] epoll_wait
> > > 	     0.38%  Coeur main  [unknown]      [k] 0xc0011718
> > > 	     0.36%  Coeur main  [unknown]      [k] 0xc01f45c0
> > > 
> > > This is because function maps__find_next_entry() now returns current
> > > entry instead of next entry, leading to kernel map end address
> > > getting mis-configured with its own start address instead of the
> > > start address of the following map.
> > > 
> > > Fix it by really taking the next entry, also make sure that entry
> > > follows current one by making sure entries are sorted.
> > > 
> > > Fixes: 659ad3492b91 ("perf maps: Switch from rbtree to lazily sorted array for addresses")
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > > ---
> > > v2: Make sure the entries are sorted, if not sort them.
> > 
> > Since you have changed what I reviewed I'll have to re-review :-) Will
> > try to do it after some calls.
> 
> Ah yes sorry, should have removed your Reviewed-by.
> 
> Based on Ian's feedback "Using the next entry in this way won't work if the
> entries aren't sorted", I added the following block in front of the initial
> change:
> 
> +	while (!maps__maps_by_address_sorted(maps)) {
> +		up_read(maps__lock(maps));
> +		maps__sort_by_address(maps);
> +		down_read(maps__lock(maps));
> +	}

Its ok, I'll keep it now that I looked at it.

Thanks!

- Arnaldo

