Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E196E9DAC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 15:36:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4739xG122NzF3Mc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 01:36:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=urezki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="h0t2hUb4"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4739pT6N10zF25r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 01:30:05 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id v24so2938596ljj.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UDQi5D+Jni0obEk/hrjnnpFb3HIzP7e6/KmAnzzfUzA=;
 b=h0t2hUb4oT0r62g/cYibJjD1Fyqyoyjgd8JaJBdp8oUdJ7aXI+MoelJSuvU31m5zTW
 9t5FudXDw80Z5My1dBKKXgsCu/7Gu9eh73ATRKB2rhIAv7GMWeavnW21688kuF9jpZpY
 pHRE1y4vCKpMV/jmFLcEaX5CZ/9VFgXcarK09YTh+zaJmfM7uLK0aEDFGASxF1tJ/bLC
 tx/2yWUM7YlMaRGD+S8pU+7cwTcuigP80RQ993kbcqqxly7AyKZctejgg3d+T2w44YUK
 p6GXHGwn+arn3+YBZCrYhbJpGGVM8j9kad/eRmovTQxPTGy3BsJpRhEHIrSABScQ8Wsn
 et0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UDQi5D+Jni0obEk/hrjnnpFb3HIzP7e6/KmAnzzfUzA=;
 b=nNOrEHeyVQAqOXbU52Z3MKKxQN2r6y0Ayi5W/rxL3EQwXH6n/ORYniv6+nhZkC79QE
 mygaV69mefBc5FgL4XUCDLYLBjhKFIA88Y8vylNA7p/Fg3geSN5jk9opwkyRgVwoj5QW
 BwmUWU9XJoBSoN8LG+qmr4iq+1fdnS0psHrbN/zs+vHvpL4LKdfJggfQ8yZpq3A5LdSY
 OOCxizbpQQ36d8/2IqCDSAlnTZaEzyBZ1OXs9yuTJRtjjoMw55ZLqcQTROT7UucNKv38
 2YneF8Eh1cIb6FRVUS30RlgkNqJjaKqg26e0R5Y6sYIQ98Z0tf6WjdUjPJ+P4HOfhNQS
 bDEg==
X-Gm-Message-State: APjAAAX1W1lQRjLBfama+5YiMbshQkC0xwDKy/4XfGSNK1wx9dToAixg
 UDbI57jhRhsKiM9HzsvrTNY=
X-Google-Smtp-Source: APXvYqx/6ls83NprcmJjVqcPOseDGmZ24WPegNnd0fqzJOSCj4K/d9bGCTxDyewu+1FbJJXi3uqHXg==
X-Received: by 2002:a2e:8545:: with SMTP id u5mr7565ljj.213.1572445800371;
 Wed, 30 Oct 2019 07:30:00 -0700 (PDT)
Received: from pc636 ([37.139.158.167])
 by smtp.gmail.com with ESMTPSA id s7sm32320ljo.98.2019.10.30.07.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 07:29:59 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 30 Oct 2019 15:29:51 +0100
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v10 1/5] kasan: support backing vmalloc space with real
 shadow memory
Message-ID: <20191030142951.GA24958@pc636>
References: <20191029042059.28541-1-dja@axtens.net>
 <20191029042059.28541-2-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029042059.28541-2-dja@axtens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mark.rutland@arm.com, gor@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 glider@google.com, luto@kernel.org, aryabinin@virtuozzo.com,
 linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello, Daniel

>  
> @@ -1294,14 +1299,19 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end)
>  	spin_lock(&free_vmap_area_lock);
>  	llist_for_each_entry_safe(va, n_va, valist, purge_list) {
>  		unsigned long nr = (va->va_end - va->va_start) >> PAGE_SHIFT;
> +		unsigned long orig_start = va->va_start;
> +		unsigned long orig_end = va->va_end;
>  
>  		/*
>  		 * Finally insert or merge lazily-freed area. It is
>  		 * detached and there is no need to "unlink" it from
>  		 * anything.
>  		 */
> -		merge_or_add_vmap_area(va,
> -			&free_vmap_area_root, &free_vmap_area_list);
> +		va = merge_or_add_vmap_area(va, &free_vmap_area_root,
> +					    &free_vmap_area_list);
> +
> +		kasan_release_vmalloc(orig_start, orig_end,
> +				      va->va_start, va->va_end);
>  
I have some questions here. I have not analyzed kasan_releace_vmalloc()
logic in detail, sorry for that if i miss something. __purge_vmap_area_lazy()
deals with big address space, so not only vmalloc addresses it frees here,
basically it can be any, starting from 1 until ULONG_MAX, whereas vmalloc
space spans from VMALLOC_START - VMALLOC_END:

1) Should it be checked that vmalloc only address is freed or you handle
it somewhere else?

if (is_vmalloc_addr(va->va_start))
    kasan_release_vmalloc(...)

2) Have you run any bencmarking just to see how much overhead it adds?
I am asking, because probably it make sense to add those figures to the
backlog(commit message). For example you can run:

<snip>
sudo ./test_vmalloc.sh performance
and
sudo ./test_vmalloc.sh sequential_test_order=1
<snip>

Thanks!

--
Vlad Rezki
