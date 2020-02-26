Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93456170AE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 22:53:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SV1b3nfxzDqkg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:53:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=WyBaIgGC; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48STzn0jYHzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 08:52:20 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id ay11so248796plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 13:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J0Egg9sFa3mWWC6z1XqltuWj5LdGN/8GpNEWbWGXDQk=;
 b=WyBaIgGCTruemq7rHIeOFFKkSmZFey/y79zq+yX3DPMj/hLTJemZB776zVWmseAoPk
 n4h+kFZSc7lg2ndIlXiXpwOs7NV1fjPDzQ+33L6hQsCrs96NecB9uK4pRd+/ngd7we7v
 EPkCA9TR3YIPZOUKvAryhgjOD+1sVhs7AHBPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J0Egg9sFa3mWWC6z1XqltuWj5LdGN/8GpNEWbWGXDQk=;
 b=HhYIAvI6SqNcFPOFDfK1y4T/4gs+YoeXJcW/XrHjTI6zWhWMc03xsSvQNFzRd9rYgC
 aqBsmjqatfeJsM6BlsIGeLXl4WYnWqQLKjAdGb27QVSB7rwtIQ6OpW1z3mAGaDmZaSJ/
 uvQn82qOYbzODlm2GM9n9IweIg21x03OriAWE8W5ecWNzmps+cUANRmlN2I2lSSIL2Qe
 pLZx/qOaLSuXAjRprKm8euM+PeQCTjbmQSHwoHgF85MoBXIjw+tvg+xFOfFBVeVpVfoG
 79A5yMblO/ajw4kIETGMVAIZ7HDmio3F/yzfaYvWfRgkg3kWs/s0BN7cYJ95wVywYeOj
 8fng==
X-Gm-Message-State: APjAAAXemg4njoMGfPD8wHn/02G02gUIiMZK7GIEKQqpMaq5OMIrncl3
 VxJRrqMY1WB/Ma+lYUweTUm5Wg==
X-Google-Smtp-Source: APXvYqxEaK1Cv4oaPm0J/tFDjSfHee2s2mNobGOfYf+MXqkoFKyVBxJTTPEDCuSEP1qbuYVtz/v6DA==
X-Received: by 2002:a17:902:b498:: with SMTP id
 y24mr1280527plr.343.1582753936716; 
 Wed, 26 Feb 2020 13:52:16 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z13sm3917279pge.29.2020.02.26.13.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 13:52:15 -0800 (PST)
Date: Wed, 26 Feb 2020 13:52:14 -0800
From: Kees Cook <keescook@chromium.org>
To: Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH v5 3/8] powerpc/mm/ptdump: debugfs handler for W+X checks
 at runtime
Message-ID: <202002261348.8957F0E8D@keescook>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, jniethe5@gmail.com,
 npiggin@gmail.com, joel@jms.id.au, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 26, 2020 at 05:35:46PM +1100, Russell Currey wrote:
> Very rudimentary, just
> 
> 	echo 1 > [debugfs]/check_wx_pages
> 
> and check the kernel log.  Useful for testing strict module RWX.
> 
> Updated the Kconfig entry to reflect this.

Oh, I like this! This would be handy to have on all architectures.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

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
