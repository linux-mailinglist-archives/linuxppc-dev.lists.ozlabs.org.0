Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D818747D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 22:09:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h8701hwfzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 08:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=cyJ67de5; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48h85M26KTzDqWK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 08:07:34 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id h6so2716479wrs.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 14:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e4Js+GQN9i9BA17yb5cl9W991Ln3p6FSzvC77lFfomI=;
 b=cyJ67de5xFz1SvZEhRxwZqWrPgxn0OKkczBOTpCiEBdsUAfjmlrHcgf1ubnpaLBXXl
 UD5u/Kt8WmQHfVqeeZwIwbQsWv1ZpvyKHQlfV5p2w6GtUBmXIAiDdvOIJkOaQKuo2pzk
 kI90cqzwoP6aTh1YX0/1Kd7iFxdR3H1peXxw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e4Js+GQN9i9BA17yb5cl9W991Ln3p6FSzvC77lFfomI=;
 b=Liq/qz78WbS0wE0OUP5CnL7Xt0+mC5AlCO3OZ0SN2ErQNpTcGbf4fXSIxiAr2HvJQ1
 lBaT9swUdC+nUSyAmKgOPrJbhRX9yVZnN7pa6akbIWpT9sWHAzIiCQXRPncYJZKz9D2V
 34K9O6m4x7uaLmOQW55FSjamNNfz4VjxY7Lam3R+th5E9hu5ZwVItOErd+bWlL4NY2QB
 mOFyh4LuYuZrx2YumRnjc9HBfGEh5t+Fajvv8VHhYufD5gutOymWT7A+HkW2LBw9I1EO
 GQdyOupK4EHDqlaVaTtZsjMJ8VY88ib9TD2LivGPU646eTRTIhFywS93NbqTHUqv+IFQ
 QWzw==
X-Gm-Message-State: ANhLgQ2+NzkToYSF8fpdjMv1ZOWl6cOyI6cDs8w7VM21OZmZLYWD5VpR
 6kqo+ioCrHvyykB0ySP+s9PsjA==
X-Google-Smtp-Source: ADFU+vt5ctZNOHVsCYlZlRY1l6ofXMxdnVHIEAGpjfBZBJ9JDM+B9T++1/sSbSvJu1sP+6rFmFrJ0A==
X-Received: by 2002:adf:d1a9:: with SMTP id w9mr130439wrc.17.1584392847404;
 Mon, 16 Mar 2020 14:07:27 -0700 (PDT)
Received: from [192.168.1.149] (ip-5-186-114-43.cgn.fibianet.dk.
 [5.186.114.43])
 by smtp.gmail.com with ESMTPSA id q13sm1407210wrs.91.2020.03.16.14.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 14:07:26 -0700 (PDT)
Subject: Re: [PATCH 6/6] soc: fsl: qe: fix sparse warnings for ucc_slow.c
To: Li Yang <leoyang.li@nxp.com>, Timur Tabi <timur@kernel.org>,
 Zhao Qiang <qiang.zhao@nxp.com>
References: <20200312222827.17409-1-leoyang.li@nxp.com>
 <20200312222827.17409-7-leoyang.li@nxp.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <b9c5a514-18c1-e36c-1595-2b86c9bfcff1@rasmusvillemoes.dk>
Date: Mon, 16 Mar 2020 22:07:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312222827.17409-7-leoyang.li@nxp.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/03/2020 23.28, Li Yang wrote:
> Fixes the following sparse warnings:
> 
[snip]
> 
> Also removed the unneccessary clearing for kzalloc'ed structure.

Please don't mix that in the same patch, do it in a preparatory patch.
That makes reviewing much easier.

>  
>  	/* Get PRAM base */
>  	uccs->us_pram_offset =
> @@ -231,24 +224,24 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
>  		/* clear bd buffer */
>  		qe_iowrite32be(0, &bd->buf);
>  		/* set bd status and length */
> -		qe_iowrite32be(0, (u32 *)bd);
> +		qe_iowrite32be(0, (u32 __iomem *)bd);

It's cleaner to do two qe_iowrite16be to &bd->status and &bd->length,
that avoids the casting altogether.

>  		bd++;
>  	}
>  	/* for last BD set Wrap bit */
>  	qe_iowrite32be(0, &bd->buf);
> -	qe_iowrite32be(cpu_to_be32(T_W), (u32 *)bd);
> +	qe_iowrite32be(T_W, (u32 __iomem *)bd);

Yeah, and this is why. Who can actually keep track of where that bit
ends up being set with that casting going on. Please use
qe_iowrite16be() with an appropriately modified constant to the
appropriate field instead of these games.

And if the hardware doesn't support 16 bit writes, the definition of
struct qe_bd is wrong and should have a single __be32 status_length
field, with appropriate accessors defined.

>  	/* Init Rx bds */
>  	bd = uccs->rx_bd = qe_muram_addr(uccs->rx_base_offset);
>  	for (i = 0; i < us_info->rx_bd_ring_len - 1; i++) {
>  		/* set bd status and length */
> -		qe_iowrite32be(0, (u32 *)bd);
> +		qe_iowrite32be(0, (u32 __iomem *)bd);

Same.

>  		/* clear bd buffer */
>  		qe_iowrite32be(0, &bd->buf);
>  		bd++;
>  	}
>  	/* for last BD set Wrap bit */
> -	qe_iowrite32be(cpu_to_be32(R_W), (u32 *)bd);
> +	qe_iowrite32be(R_W, (u32 __iomem *)bd);

Same.

>  	qe_iowrite32be(0, &bd->buf);
>  
>  	/* Set GUMR (For more details see the hardware spec.). */
> @@ -273,8 +266,8 @@ int ucc_slow_init(struct ucc_slow_info * us_info, struct ucc_slow_private ** ucc
>  	qe_iowrite32be(gumr, &us_regs->gumr_h);
>  
>  	/* gumr_l */
> -	gumr = us_info->tdcr | us_info->rdcr | us_info->tenc | us_info->renc |
> -		us_info->diag | us_info->mode;
> +	gumr = (u32)us_info->tdcr | (u32)us_info->rdcr | (u32)us_info->tenc |
> +	       (u32)us_info->renc | (u32)us_info->diag | (u32)us_info->mode;

Are the tdcr, rdcr, tenc, renc fields actually set anywhere (the same
for the diag and mode, but word-grepping for those give way too many
false positives)? They seem to be a somewhat pointless split out of the
bitfields of gumr_l, and not populated anywhere?. That's not directly
related to this patch, of course, but getting rid of them first (if they
are indeed completely unused) might make the sparse cleanup a little
simpler.

Rasmus
