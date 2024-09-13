Return-Path: <linuxppc-dev+bounces-1358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 327A3978BA8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:05:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X58z90dwNz301Y;
	Sat, 14 Sep 2024 09:05:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726264526;
	cv=none; b=Wsn67DQlLGRpc0ZlFUMCKwOH5Z38olUMEWLN0xCV5Im9bqcUOUHsi3qg9j18SsKHMRnZoDf6OHcBposkcm7i/lfmM6kCCQQK5GyXX/UusAkYWIcmsCtmMOMcG+01/WYjGeKnkPIl4/sp8koqjp8rx3fHOegYiZuwkLM5xEOfUFFgdUxH5HyGjIiAuKH45AxxK2SQx8YVRqncJUeqVJe3XT62J/B306pxoBJzi/EgAMod0UMfP0gp4Sli5r7Mc0K5q5hySi4NM9WajOEBZFBBFq6KQwJGnwMb85OP5+y3vU1upTicTUARnLzuPFltQtjzt5D9ACiFrYgW4xr54YFxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726264526; c=relaxed/relaxed;
	bh=c4PTjS5fX5Q389WHB/etaU28p0uL2TY5wkUk4Exja9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCK8EIRqBRh3YCma3I9Mv9XXZwzU1OOjbl0IDMUuFhmEhKloE7Va3PgYEb5bmMkabCPtzt5/d0ZfRAWt01qaKEVwN34Uq45ZhmAkZ6JWzTT3xsYVMFbi8bD0fSdd7hdQt4Ep4DcjUgc9bGlvAXy4MXWij6alswgQrk4YHTmnGPq1dyDfZfrYUiu2cGtWIRX89fCWQIU0ZHoYN5o8gLnVg/mdZw/hcR/A2foCwThRCL/xVboFjoWc7jrm2T2ptHv09gUA1+6U/E5hmMdsyLt6ekordOWsTdcfKSENWKh0TE6S41omyam3mF+x2d09MHiJnI9f5g0ltcomP8keGk1NfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IVod8zfF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=stfomichev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IVod8zfF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=stfomichev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X57Qj14b4z2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 07:55:23 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-201d5af11a4so29633045ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 14:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726264520; x=1726869320; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c4PTjS5fX5Q389WHB/etaU28p0uL2TY5wkUk4Exja9I=;
        b=IVod8zfFM69gHQJI5iuZVnM/+0CToU/yBTTOEhuOkx2ndglgLtm/uz1EAWRb8qVQF1
         oDN+pKjy4NQ2g2jx8Jklo2vYXVk2kS1c2GV4sgvFtdIVkDe9G566rjuBr9Bn3cG0Jhxc
         0e5Fv4HVUT5bhP2Hpuxepuopj14qNC9RH5A66osp++6t1AnI/a22VPFV33b8GLqFt/m7
         ZWmGnpAgPymZisxrcmUW48UsfpO4r8tVNnFmRbkLKHkz3B2CvCQat6kPahtJFd3OZojk
         jh0+QzE1gTcbHXI9BrqKZ9NT9u744qRSxKDafB1qsk+LYAo/NAoYJqznMOmr/WwRdvZ9
         NNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726264520; x=1726869320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4PTjS5fX5Q389WHB/etaU28p0uL2TY5wkUk4Exja9I=;
        b=p7Acl0zfhp+lLCrIxu/VVAjYB2SdfpK+f9OMPPdMyJF36RG9KTfH2tUKuz1Ed4SqfY
         ga50+llW3Dw/JkRTim+Y7MTTY9xAM6SjbCXX+KnrUu6NhLcDMKhoB9SKQ8oIEfa0Aqeg
         C9lH2/6f9SaeVp0P5SQTkyvay3NeHKHxjYrhjRuYVEq+2MZwynfecpNPIFWo1KiA+TKX
         qfMSjgXXTplDyecPIqjjxScEKAHkBBBmna7zICHse2qzgs5Wj1s+sGH753Fc0d3de4Lk
         ar3MtT5e5U9OBB5qa1CauQ6GcXYu7L5Rev3glUcFXQujgBLxkPn32T3y1bbyykKP1YJK
         yKTw==
X-Forwarded-Encrypted: i=1; AJvYcCVNRDc8IaXrUvPV8mF04u+LFT6Dl5bP8AF69WmnQwXMEgwjIIplC3x4MaBBHbjY2aWX92bZATS6+u0eFKc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHil+XRAg6mwO2mPvO93g9ju2ZrWUmW5DsVT7XkrtVltUHxxJB
	LC6Pd9cusIYxPFLTnmtGhZzV/b2Z4pIpoISPC4p1ItqmxNDFOJM=
X-Google-Smtp-Source: AGHT+IH5BwiPmrclx07PBc1QAqEq+dk1qo/Lw7Ssd5LW8hV09kF4E4owLL0iuRHRj3mllCztINhnDQ==
X-Received: by 2002:a17:902:d510:b0:206:b4cf:3107 with SMTP id d9443c01a7336-2076e422055mr128280685ad.49.1726264520410;
        Fri, 13 Sep 2024 14:55:20 -0700 (PDT)
Received: from localhost ([2601:646:9e00:f56e:2844:3d8f:bf3e:12cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d668bsm845185ad.141.2024.09.13.14.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 14:55:20 -0700 (PDT)
Date: Fri, 13 Sep 2024 14:55:19 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <ZuS0x5ZRCGyzvTBg@mini-arch>
References: <20240913213351.3537411-1-almasrymina@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913213351.3537411-1-almasrymina@google.com>

On 09/13, Mina Almasry wrote:
> Building net-next with powerpc with GCC 14 compiler results in this
> build error:
> 
> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> not a multiple of 4)
> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> net/core/page_pool.o] Error 1
> 
> Root caused in this thread:
> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/
> 
> We try to access offset 40 in the pointer returned by this function:
> 
> static inline unsigned long _compound_head(const struct page *page)
> {
>         unsigned long head = READ_ONCE(page->compound_head);
> 
>         if (unlikely(head & 1))
>                 return head - 1;
>         return (unsigned long)page_fixed_fake_head(page);
> }
> 
> The GCC 14 (but not 11) compiler optimizes this by doing:
> 
> ld page + 39
> 
> Rather than:
> 
> ld (page - 1) + 40
> 
> And causing an unaligned load. Get around this by issuing a READ_ONCE as
> we convert the page to netmem.  That disables the compiler optimizing the
> load in this way.
> 
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Networking <netdev@vger.kernel.org>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> v2: https://lore.kernel.org/netdev/20240913192036.3289003-1-almasrymina@google.com/
> 
> - Work around this issue as we convert the page to netmem, instead of
>   a generic change that affects compound_head().
> ---
>  net/core/page_pool.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index a813d30d2135..74ea491d0ab2 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -859,12 +859,25 @@ void page_pool_put_page_bulk(struct page_pool *pool, void **data,
>  {
>  	int i, bulk_len = 0;
>  	bool allow_direct;
> +	netmem_ref netmem;
> +	struct page *page;
>  	bool in_softirq;
>  
>  	allow_direct = page_pool_napi_local(pool);
>  
>  	for (i = 0; i < count; i++) {
> -		netmem_ref netmem = page_to_netmem(virt_to_head_page(data[i]));
> +		page = virt_to_head_page(data[i]);
> +
> +		/* GCC 14 powerpc compiler will optimize reads into the
> +		 * resulting netmem_ref into unaligned reads as it sees address
> +		 * arithmetic in _compound_head() call that the page has come
> +		 * from.
> +		 *
> +		 * The READ_ONCE here gets around that by breaking the
> +		 * optimization chain between the address arithmetic and later
> +		 * indexing.
> +		 */
> +		netmem = page_to_netmem(READ_ONCE(page));
>  
>  		/* It is not the last user for the page frag case */
>  		if (!page_pool_is_last_ref(netmem))

Are we sure this is the only place where we can hit by this?
Any reason not to hide this inside page_to_netmem?

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 8a6e20be4b9d..46bc362acec4 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -100,7 +100,7 @@ static inline netmem_ref net_iov_to_netmem(struct net_iov *niov)

 static inline netmem_ref page_to_netmem(struct page *page)
 {
-       return (__force netmem_ref)page;
+       return (__force netmem_ref)READ_ONCE(page);
 }

 static inline int netmem_ref_count(netmem_ref netmem)

Is it gonna generate slower code elsewhere?

