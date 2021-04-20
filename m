Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4541E365329
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 09:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPZr64qHLz30Bl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 17:21:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=JDcuGmSn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=JDcuGmSn; 
 dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPZqf3zQLz2xZt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 17:21:31 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id mh2so35162263ejb.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 00:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fdo4mE/+cjJuC72UnytwwUxZcVyYzOvI58iBPYYyS4o=;
 b=JDcuGmSnwgEFOWi0Hol09StsvZpHTO8W+O/Gz5MCGTk1hrnPT23hDPfAyBVwJSNZpt
 czBoQS5EsqxfrGVAbix+Te7AGsP7UXhIx8YFBmygfQto+b48SP2efSg7JWmJOpyukexr
 FTsu8EMSbjXVSgncFtnRCeoktgRoY0XVLaFrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fdo4mE/+cjJuC72UnytwwUxZcVyYzOvI58iBPYYyS4o=;
 b=fQ9CDtHvjDipveTeXMW93oaeP5EzzDiGj92tpI96yqFe/Hm8FOAdjvSIXdga8crxUC
 Hxgyf2hZXs7ZLCx4pvJmlNpPgJtQ2Z95QDKRf/73sxQAq1RBMD2DqzVESaMM1ZeAdWmA
 7RhiQizMy7DC5cA6iZKJg+55TLpqQ5sQikb/0hYYJRfVMg2YsRfdrsm6cHaEYsauFLk5
 GsTYfaT237mdXN/kW3uKrtBuTIybUvZIqj7sblGCLL6WG3FZ/z1IkQNPv2AP3DTCt1cS
 NRokSFEvfTA6+gI7yBhw85/X4OmDiEA4PTTXP1LGkrPTyK1cTfk/RuSX7lwNgbT3rPMb
 F1tg==
X-Gm-Message-State: AOAM531ajn/fj4l8uRZj6d7Fqfo6oxmT/Pkx3Crpllw+5CZDP+z4g+s7
 uzoO/ArgzhKV8X+AEn4RgChssg==
X-Google-Smtp-Source: ABdhPJwk6gzZ2A5irFuyneT8BrQdebb3nmjVkes+GHHyVGt7Uear5nG59XVGsiWotx3n47m/ELrbzA==
X-Received: by 2002:a17:906:4d10:: with SMTP id
 r16mr25604487eju.169.1618903284093; 
 Tue, 20 Apr 2021 00:21:24 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.248])
 by smtp.gmail.com with ESMTPSA id p3sm11836507ejd.65.2021.04.20.00.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 00:21:23 -0700 (PDT)
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, brouer@redhat.com
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d0c32751-0a12-1f7f-4f6a-b1f6535a6b6e@rasmusvillemoes.dk>
Date: Tue, 20 Apr 2021 09:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416230724.2519198-2-willy@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: arnd@kernel.org, grygorii.strashko@ti.com, netdev@vger.kernel.org,
 ilias.apalodimas@linaro.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, mhocko@kernel.org, linux-mm@kvack.org,
 mgorman@suse.de, mcroce@linux.microsoft.com,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/04/2021 01.07, Matthew Wilcox (Oracle) wrote:
> 32-bit architectures which expect 8-byte alignment for 8-byte integers
> and need 64-bit DMA addresses (arc, arm, mips, ppc) had their struct
> page inadvertently expanded in 2019.  When the dma_addr_t was added,
> it forced the alignment of the union to 8 bytes, which inserted a 4 byte
> gap between 'flags' and the union.
> 
> Fix this by storing the dma_addr_t in one or two adjacent unsigned longs.
> This restores the alignment to that of an unsigned long, and also fixes a
> potential problem where (on a big endian platform), the bit used to denote
> PageTail could inadvertently get set, and a racing get_user_pages_fast()
> could dereference a bogus compound_head().
> 
> Fixes: c25fff7171be ("mm: add dma_addr_t to struct page")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  include/linux/mm_types.h |  4 ++--
>  include/net/page_pool.h  | 12 +++++++++++-
>  net/core/page_pool.c     | 12 +++++++-----
>  3 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 6613b26a8894..5aacc1c10a45 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -97,10 +97,10 @@ struct page {
>  		};
>  		struct {	/* page_pool used by netstack */
>  			/**
> -			 * @dma_addr: might require a 64-bit value even on
> +			 * @dma_addr: might require a 64-bit value on
>  			 * 32-bit architectures.
>  			 */
> -			dma_addr_t dma_addr;
> +			unsigned long dma_addr[2];

Shouldn't that member get another name (_dma_addr?) to be sure the
buildbots catch every possible (ab)user and get them turned into the new
accessors? Sure, page->dma_addr is now "pointer to unsigned long"
instead of "dma_addr_t", but who knows if there's a
"(long)page->dma_addr" somewhere?

Rasmus
