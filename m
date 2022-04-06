Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D75074F6975
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 20:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYYd66Z08z3bdP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 04:56:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XSHD7Rr+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=XSHD7Rr+; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYYcR5862z2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 04:55:33 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id f10so2768892plr.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Apr 2022 11:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dQMyBdrJI0TKqS6iJJZhTQ6K9ZLVlK71bX36qsCyaOc=;
 b=XSHD7Rr+AHKSeq3C9olRSWGO+rDcFjM5qx3pbQd10xyj4JC4dTQTtAkjBViXdvkrmK
 rq4zPR2lloAkd/XLzgm0GqKjIwwxwAJBJAXzk6uXrP3+aCoO5MlBp/SakON+NFdIPwgH
 H6xX1CLQiO5xRg753Qq1NncjUsZX1WuFyMisk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dQMyBdrJI0TKqS6iJJZhTQ6K9ZLVlK71bX36qsCyaOc=;
 b=o/ysuAjJtyDE4R+hlgKwghSa8FrV8E4uPlwabJvf5i94KfjBfoWjiA3I5MEFqtnG7K
 Upr4LlcMP4s+W7ARnNRRRitn3epYGS1i07bth6uF5jlgAKOzuBM88KwQcedYsJV5odHx
 qq+BVQUqQBaNb/XnwB8gB/POGITtGaNhxA0E+evfUfQHeFVleHDx+9lvlIjRFFLCg8+d
 2FfdNdWnS1jk74AdlCh4/KhiBTGT28e7ULcMS9C6jXghXOUThDE9JZ7wS/XRpmp7M0vx
 hP0B289blQXDsS57MIJ8q5i0+PEysh73Ij1LyN9wMWZTNw8mb+sTnJ+kW2WNLrUEv0X7
 E4wg==
X-Gm-Message-State: AOAM533jbbH/q6nQLQZuh3N8b2dSbZUFrXiMgsE/pkhS8xmkdM2FLcaW
 L+OvWjuqqqnWZhilxXtZiuti4w==
X-Google-Smtp-Source: ABdhPJwShpXOnPbCB31pSiDlliiYiOpD6jplXs80WT404Afay0P/HhCi4TaRShIn/ulCCbHYmicOuw==
X-Received: by 2002:a17:902:f0ca:b0:156:caa9:4221 with SMTP id
 v10-20020a170902f0ca00b00156caa94221mr9790838pla.107.1649271328349; 
 Wed, 06 Apr 2022 11:55:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a63370d000000b003810782e0cdsm16871427pga.56.2022.04.06.11.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:55:27 -0700 (PDT)
Date: Wed, 6 Apr 2022 11:55:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH v5 3/8] powerpc/mm/ptdump: debugfs handler for W+X checks
 at runtime
Message-ID: <202204061154.5A685C10D@keescook>
References: <20200226063551.65363-1-ruscur@russell.cc>
 <20200226063551.65363-4-ruscur@russell.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226063551.65363-4-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, npiggin@gmail.com, joel@jms.id.au,
 dja@axtens.net, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

*thread necromancy*

Is this patch still something folks are working on? It'd be nice to be
able to trigger this check at runtime.

-Kees

On Wed, Feb 26, 2020 at 05:35:46PM +1100, Russell Currey wrote:
> Very rudimentary, just
> 
> 	echo 1 > [debugfs]/check_wx_pages
> 
> and check the kernel log.  Useful for testing strict module RWX.
> 
> Updated the Kconfig entry to reflect this.
> 
> Also fixed a typo.
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>  arch/powerpc/Kconfig.debug      |  6 ++++--
>  arch/powerpc/mm/ptdump/ptdump.c | 21 ++++++++++++++++++++-
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
> index 0b063830eea8..e37960ef68c6 100644
> --- a/arch/powerpc/Kconfig.debug
> +++ b/arch/powerpc/Kconfig.debug
> @@ -370,7 +370,7 @@ config PPC_PTDUMP
>  	  If you are unsure, say N.
>  
>  config PPC_DEBUG_WX
> -	bool "Warn on W+X mappings at boot"
> +	bool "Warn on W+X mappings at boot & enable manual checks at runtime"
>  	depends on PPC_PTDUMP && STRICT_KERNEL_RWX
>  	help
>  	  Generate a warning if any W+X mappings are found at boot.
> @@ -384,7 +384,9 @@ config PPC_DEBUG_WX
>  	  of other unfixed kernel bugs easier.
>  
>  	  There is no runtime or memory usage effect of this option
> -	  once the kernel has booted up - it's a one time check.
> +	  once the kernel has booted up, it only automatically checks once.
> +
> +	  Enables the "check_wx_pages" debugfs entry for checking at runtime.
>  
>  	  If in doubt, say "Y".
>  
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index 206156255247..a15e19a3b14e 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -4,7 +4,7 @@
>   *
>   * This traverses the kernel pagetables and dumps the
>   * information about the used sections of memory to
> - * /sys/kernel/debug/kernel_pagetables.
> + * /sys/kernel/debug/kernel_page_tables.
>   *
>   * Derived from the arm64 implementation:
>   * Copyright (c) 2014, The Linux Foundation, Laura Abbott.
> @@ -413,6 +413,25 @@ void ptdump_check_wx(void)
>  	else
>  		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
>  }
> +
> +static int check_wx_debugfs_set(void *data, u64 val)
> +{
> +	if (val != 1ULL)
> +		return -EINVAL;
> +
> +	ptdump_check_wx();
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(check_wx_fops, NULL, check_wx_debugfs_set, "%llu\n");
> +
> +static int ptdump_check_wx_init(void)
> +{
> +	return debugfs_create_file("check_wx_pages", 0200, NULL,
> +				   NULL, &check_wx_fops) ? 0 : -ENOMEM;
> +}
> +device_initcall(ptdump_check_wx_init);
>  #endif
>  
>  static int ptdump_init(void)
> -- 
> 2.25.1
> 

-- 
Kees Cook
