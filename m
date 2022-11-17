Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37462E77C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 22:59:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCv2W5XCLz3f3w
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 08:59:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k2i7Pob2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=k2i7Pob2;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCv1d4JXFz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 08:58:29 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id z26so3098420pff.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 13:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r2vqsefxvlQpm7YoDJQXEXeeHIkQ6S5JMCMQ5S8aLio=;
        b=k2i7Pob22XCdE3eYvjx4pPufwTb8mTPjukR1UCSAv0kmL6U29qZrcajtJc3GiwR25C
         GxngyGxuAOe8R1u2fG07FDvUurbqbhzNNAvQ0bvvdjotWAgaJxTe1J6rbJlEzDLOD/Zm
         f5ROj4ZQvL1a3wZkcDpdW1XiI4mqzUly58q/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2vqsefxvlQpm7YoDJQXEXeeHIkQ6S5JMCMQ5S8aLio=;
        b=kmyl+K3zWmiWXW3GJsaYxckYybgoT1BUNwDuAUEY8vtDaHLQVlM76LOKXpXbet7Wll
         9gEPSFgXlg9CeK15/o2vqqN9pDomVSsLdRIe4LR4E+FhTIOXvHxWd2zM4zBV2mAQ1z9w
         AZyHAjJWc1ffkE0zdNLqhWmffREtZvjcvl/r/GKqBNE6gFLLwCMLzA/3xg0VIt1FSDsB
         AjJcF77S1rAO9ARXaklpw9UzLrdUH8ug0WRQ2lagkdzRtwlvy+JVJ7Wfr+9q4dPs8tCu
         EAqOcyiN8+ucvbaj8gfpIA8JpBZR9nzuLUWGEKY7mWG9tgjUuDuVaFLvE26qoTwQo3WQ
         AblQ==
X-Gm-Message-State: ANoB5pkD9eYgwrJuqvYQpqV4fB1wclzVFxnO4Tf3xt6cpyWfC6giiXSZ
	9WEiOpbcSmKZu/TQW21Nu62zyw==
X-Google-Smtp-Source: AA0mqf6OLZEOM+uadHNHyZ4glxVpWyLO25QJV2wWHbf4ZbABty2OM80CQ8wN7Ibt7qgRI014DYHeJw==
X-Received: by 2002:a63:5c0f:0:b0:470:8e8a:8e11 with SMTP id q15-20020a635c0f000000b004708e8a8e11mr3843188pgb.490.1668722306503;
        Thu, 17 Nov 2022 13:58:26 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090a3cc300b00200461cfa99sm3966446pjd.11.2022.11.17.13.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:58:25 -0800 (PST)
Date: Thu, 17 Nov 2022 13:58:25 -0800
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v3 2/3] treewide: use get_random_u32_{above,below}()
 instead of manual loop
Message-ID: <202211171358.4B4E0E2F17@keescook>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221117202906.2312482-1-Jason@zx2c4.com>
 <20221117202906.2312482-3-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117202906.2312482-3-Jason@zx2c4.com>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, patches@lists.linux.dev, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Chr
 istoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 17, 2022 at 09:29:05PM +0100, Jason A. Donenfeld wrote:
> These cases were done with this Coccinelle:
> 
> @@
> expression E;
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I > E);
> +   I = get_random_u32_below(E + 1);
> 
> @@
> expression E;
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I >= E);
> +   I = get_random_u32_below(E);
> 
> @@
> expression E;
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I < E);
> +   I = get_random_u32_above(E - 1);
> 
> @@
> expression E;
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I <= E);
> +   I = get_random_u32_above(E);
> 
> @@
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (!I);
> +   I = get_random_u32_above(0);
> 
> @@
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I == 0);
> +   I = get_random_u32_above(0);
> 
> @@
> expression E;
> @@
> - E + 1 + get_random_u32_below(U32_MAX - E)
> + get_random_u32_above(E)
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
