Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BAD7C729A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 18:30:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cOqoNdRH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5w8v6GsBz3vZR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 03:30:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cOqoNdRH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5w7z3TbXz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 03:29:17 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68bed2c786eso882221b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697128152; x=1697732952; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WE3Jo0Q6R2eDhOXLPAn5fI6nLqGl+yopyVyIxuKQuCM=;
        b=cOqoNdRHG47AflkDwkXbAPNkmCy6MapAI2q5hUrd35gjsEpGu8XXpnR1TGMF36agkk
         cOlbEOU2cc/S3klNOPIKzV4yJwxd5Tmrft3daSkkYq2BvKlN6OTzd5u/RCVz2Bb4Lnfc
         lE9QRfCA9MLGknbxF6zZqlF9vcdmTaMjYSAbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697128152; x=1697732952;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WE3Jo0Q6R2eDhOXLPAn5fI6nLqGl+yopyVyIxuKQuCM=;
        b=Yge24KD5huYTa0eDL6+Cle3pIvlMZV7k0woPgt73zT57gXvbpn3gWVDfpqwxxKZBhP
         kYiWI+WwkGip1GQU11Pc6BnUb4mmU/3m9Dx14STJPZ4hDYEvByjy83Tv1/kxXVHK2zTJ
         j7b5mlOBYl6rUNYWmvyV87FMmfrI5KospOCgBjD16OTPH9wCCkvKZaXbzl5p88s7Za6q
         Y/REuDoDUWFyfFJuLY+87WYaI9EnkUosfrFwbJVBnZtUiPkICi9soJFJ2Gy3Ec0mitaw
         gq7Lt8PMotzU2S35qHLt5FU96HqwIWSH6+7dsNJV0PXliFCEi1h41980hO+1bhwt0x3o
         SLrw==
X-Gm-Message-State: AOJu0Yzw9U5ccESc01yHNpDklLQ2t1zOekHkkmSNYGDcrLVagW7WzWrx
	0TtvyoWEcXONMwuGy3krIYbuRA==
X-Google-Smtp-Source: AGHT+IGA3dYnTX2gx4tRNTqDSyaFZvdLD9jQ0uv4zzCA9gC04oYWVXvQWjDByBX7oKKZvymQRliLuA==
X-Received: by 2002:a05:6a00:451b:b0:691:2d4:238e with SMTP id cw27-20020a056a00451b00b0069102d4238emr22840850pfb.6.1697128152366;
        Thu, 12 Oct 2023 09:29:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z23-20020aa785d7000000b00690d64a0cb6sm11942071pfn.72.2023.10.12.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 09:29:11 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:29:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [Bisected] [1b4fa28a8b07] Build failure "net/core/gso_test.c"
Message-ID: <202310120928.398BF883A8@keescook>
References: <79fbe35c-4dd1-4f27-acb2-7a60794bc348@linux.vnet.ibm.com>
 <20231012095746.GA26871@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012095746.GA26871@breakpoint.cc>
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
Cc: willemb@google.com, netdev@vger.kernel.org, Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, sachinp@linux.vnet.com, abdhalee@linux.vnet.ibm.com, edumazet@google.com, mputtash@linux.vnet.com, kuba@kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 12, 2023 at 11:57:46AM +0200, Florian Westphal wrote:
> Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com> wrote:
> > Greetings,
> > 
> > [net-next] [6.6-rc4] Build failure "net/core/gso_test.c"
> > 
> > --- Traces ---
> > 
> > make -j 33 -s && make modules_install && make install
> > net/core/gso_test.c:58:48: error: initializer element is not constant
> >    58 |                 .segs = (const unsigned int[]) { gso_size },
> >       |                                                ^
> 
> Ouch, I can reproduce this with: gcc --version
> gcc (Debian 12.2.0-14) 12.2.0
> Copyright (C) 2022 Free Software Foundation, Inc.
> 
> gcc 13.2.1 and clang-16.0.6 are ok.
> 
> Whats the preference here?  We could use simple preprocessor constant
> or we could require much more recent compiler version for the net
> kunit tests via kconfig.
> 
> gcc-12.2.0 can compile it after this simple s//g "fix":
> 
> diff --git a/net/core/gso_test.c b/net/core/gso_test.c
> --- a/net/core/gso_test.c
> +++ b/net/core/gso_test.c
> @@ -4,7 +4,7 @@
>  #include <linux/skbuff.h>
>  
>  static const char hdr[] = "abcdefgh";
> -static const int gso_size = 1000;
> +#define GSO_TEST_SIZE 1000

This fixes the build for me too.

Tested-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

>  
>  static void __init_skb(struct sk_buff *skb)
>  {
> @@ -18,7 +18,7 @@ static void __init_skb(struct sk_buff *skb)
>  
>  	/* proto is arbitrary, as long as not ETH_P_TEB or vlan */
>  	skb->protocol = htons(ETH_P_ATALK);
> -	skb_shinfo(skb)->gso_size = gso_size;
> +	skb_shinfo(skb)->gso_size = GSO_TEST_SIZE;
>  }
>  
>  enum gso_test_nr {
> @@ -53,70 +53,70 @@ static struct gso_test_case cases[] = {
>  	{
>  		.id = GSO_TEST_NO_GSO,
>  		.name = "no_gso",
> -		.linear_len = gso_size,
> +		.linear_len = GSO_TEST_SIZE,
>  		.nr_segs = 1,
> -		.segs = (const unsigned int[]) { gso_size },
> +		.segs = (const unsigned int[]) { GSO_TEST_SIZE },
>  	},
>  	{
>  		.id = GSO_TEST_LINEAR,
>  		.name = "linear",
> -		.linear_len = gso_size + gso_size + 1,
> +		.linear_len = GSO_TEST_SIZE + GSO_TEST_SIZE + 1,
>  		.nr_segs = 3,
> -		.segs = (const unsigned int[]) { gso_size, gso_size, 1 },
> +		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, 1 },
>  	},
>  	{
>  		.id = GSO_TEST_FRAGS,
>  		.name = "frags",
> -		.linear_len = gso_size,
> +		.linear_len = GSO_TEST_SIZE,
>  		.nr_frags = 2,
> -		.frags = (const unsigned int[]) { gso_size, 1 },
> +		.frags = (const unsigned int[]) { GSO_TEST_SIZE, 1 },
>  		.nr_segs = 3,
> -		.segs = (const unsigned int[]) { gso_size, gso_size, 1 },
> +		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, 1 },
>  	},
>  	{
>  		.id = GSO_TEST_FRAGS_PURE,
>  		.name = "frags_pure",
>  		.nr_frags = 3,
> -		.frags = (const unsigned int[]) { gso_size, gso_size, 2 },
> +		.frags = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, 2 },
>  		.nr_segs = 3,
> -		.segs = (const unsigned int[]) { gso_size, gso_size, 2 },
> +		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, 2 },
>  	},
>  	{
>  		.id = GSO_TEST_GSO_PARTIAL,
>  		.name = "gso_partial",
> -		.linear_len = gso_size,
> +		.linear_len = GSO_TEST_SIZE,
>  		.nr_frags = 2,
> -		.frags = (const unsigned int[]) { gso_size, 3 },
> +		.frags = (const unsigned int[]) { GSO_TEST_SIZE, 3 },
>  		.nr_segs = 2,
> -		.segs = (const unsigned int[]) { 2 * gso_size, 3 },
> +		.segs = (const unsigned int[]) { 2 * GSO_TEST_SIZE, 3 },
>  	},
>  	{
>  		/* commit 89319d3801d1: frag_list on mss boundaries */
>  		.id = GSO_TEST_FRAG_LIST,
>  		.name = "frag_list",
> -		.linear_len = gso_size,
> +		.linear_len = GSO_TEST_SIZE,
>  		.nr_frag_skbs = 2,
> -		.frag_skbs = (const unsigned int[]) { gso_size, gso_size },
> +		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
>  		.nr_segs = 3,
> -		.segs = (const unsigned int[]) { gso_size, gso_size, gso_size },
> +		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, GSO_TEST_SIZE },
>  	},
>  	{
>  		.id = GSO_TEST_FRAG_LIST_PURE,
>  		.name = "frag_list_pure",
>  		.nr_frag_skbs = 2,
> -		.frag_skbs = (const unsigned int[]) { gso_size, gso_size },
> +		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
>  		.nr_segs = 2,
> -		.segs = (const unsigned int[]) { gso_size, gso_size },
> +		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE },
>  	},
>  	{
>  		/* commit 43170c4e0ba7: GRO of frag_list trains */
>  		.id = GSO_TEST_FRAG_LIST_NON_UNIFORM,
>  		.name = "frag_list_non_uniform",
> -		.linear_len = gso_size,
> +		.linear_len = GSO_TEST_SIZE,
>  		.nr_frag_skbs = 4,
> -		.frag_skbs = (const unsigned int[]) { gso_size, 1, gso_size, 2 },
> +		.frag_skbs = (const unsigned int[]) { GSO_TEST_SIZE, 1, GSO_TEST_SIZE, 2 },
>  		.nr_segs = 4,
> -		.segs = (const unsigned int[]) { gso_size, gso_size, gso_size, 3 },
> +		.segs = (const unsigned int[]) { GSO_TEST_SIZE, GSO_TEST_SIZE, GSO_TEST_SIZE, 3 },
>  	},
>  	{
>  		/* commit 3953c46c3ac7 ("sk_buff: allow segmenting based on frag sizes") and

-- 
Kees Cook
