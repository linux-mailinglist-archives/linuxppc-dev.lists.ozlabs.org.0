Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B5E45C9A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 17:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzmKP6mCpz3c61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 03:14:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eRVgasqq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eRVgasqq; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzmJf3x9Xz2x9X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 03:13:20 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id a2so3076143qtx.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 08:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EdnE85lbGOd7P/DF+DGys9IAToiAQL44gKSR64iso4Y=;
 b=eRVgasqq2qg2u8AT0Dc69pDAg8yAvBns950peG4dWQOy/gtFReDGPCzTgzr7afaAD1
 kT7GGFP/m/VPNZJO6zVbOi/SwlhySm4rvrbb1HHWKqaOHlpkQv2CdHA8RNYyt1I4piMD
 NOr9LCNlkvGc15GjDy5wvyrAKqVBLB5qX8ySAgaU9Xhex0+vIOlF9n6wJZUTTnm5HAsH
 lnch024tYhVLw0mCjqkP+2OaUEsFBucjKd/X1yNqCUcd5Fiq/03/t2CMTUS1lcp//V1L
 RFSepxsMu81xnGHPI4rT4FS2FYqongI2jVPVpxddzcYfe7JagYwFiMVH8suMDkrYnULx
 BIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EdnE85lbGOd7P/DF+DGys9IAToiAQL44gKSR64iso4Y=;
 b=JsKHi3gcsHincc2KbZNDS4r1tgiyXtuIJZKP6wVL0X+J+NvjOOywx1JRei9vHaMImZ
 73+HiF6mK1PlYaurvQLnfNcAi2Ds6gXhJDkW3gxPoquUUoCoSCv+SXSWRQHeuv1SQkAv
 8XX1Xox9eJDXipPRu4Yl9y+p+4D7pksol+PNgG4rnU1dhhKdJ2yKUwqDgWoxnHIhiFAk
 G4MV2amSB/PWUI6evILPkbju4/Sdej0pfIEdw6ozW6ULwlwM8O4q/EhNPXsgazEQ7J9O
 sAsRuWCbvM4tawNJqQIt8TO0pzh7AwFEX25USHc+FaDbxnunic675GNLsuwGYaEEgAM+
 1iLA==
X-Gm-Message-State: AOAM532u15OURRJEc9YHGTgL9qB5l2qWarBg1C7DvIUs3AngKnU2Mtxy
 Uqyvc3BfNl27I21cdKxLMxY=
X-Google-Smtp-Source: ABdhPJyGIueVv654Zex4VnED272Dkw9+w6IgVRNuB9h3je6d/KFCSmTilvBZT1+y0D5oqfGozC4TaQ==
X-Received: by 2002:ac8:20a:: with SMTP id k10mr8823562qtg.280.1637770395512; 
 Wed, 24 Nov 2021 08:13:15 -0800 (PST)
Received: from [192.168.1.140] ([65.35.200.237])
 by smtp.gmail.com with ESMTPSA id v2sm79124qkp.72.2021.11.24.08.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:13:15 -0800 (PST)
Subject: Re: [PATCH 1/3] of/fdt: Rework early_init_dt_scan_chosen() to call
 directly
To: Rob Herring <robh@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 John Crispin <john@phrozen.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20211118181213.1433346-1-robh@kernel.org>
 <20211118181213.1433346-2-robh@kernel.org>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <8de94c58-ff4c-c896-13d1-016914042068@gmail.com>
Date: Wed, 24 Nov 2021 11:13:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118181213.1433346-2-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/18/21 1:12 PM, Rob Herring wrote:
> Use of the of_scan_flat_dt() function predates libfdt and is discouraged
> as libfdt provides a nicer set of APIs. Rework
> early_init_dt_scan_chosen() to be called directly and use libfdt.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/powerpc/kernel/prom.c           |  2 +-
>  arch/powerpc/mm/nohash/kaslr_booke.c |  4 +--
>  drivers/of/fdt.c                     | 39 ++++++++++++++--------------
>  include/linux/of_fdt.h               |  3 +--
>  4 files changed, 22 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 2e67588f6f6e..c6c398ccd98a 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -402,7 +402,7 @@ static int __init early_init_dt_scan_chosen_ppc(unsigned long node,
>  	const unsigned long *lprop; /* All these set by kernel, so no need to convert endian */
>  
>  	/* Use common scan routine to determine if this is the chosen node */
> -	if (early_init_dt_scan_chosen(node, uname, depth, data) == 0)
> +	if (early_init_dt_scan_chosen(data) < 0)
>  		return 0;
>  
>  #ifdef CONFIG_PPC64
> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
> index 8fc49b1b4a91..90debe19ab4c 100644
> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
> @@ -44,9 +44,7 @@ struct regions __initdata regions;
>  
>  static __init void kaslr_get_cmdline(void *fdt)
>  {
> -	int node = fdt_path_offset(fdt, "/chosen");
> -
> -	early_init_dt_scan_chosen(node, "chosen", 1, boot_command_line);
> +	early_init_dt_scan_chosen(boot_command_line);
>  }
>  
>  static unsigned long __init rotate_xor(unsigned long hash, const void *area,
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index bdca35284ceb..1f1705f76263 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1124,18 +1124,18 @@ int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
>  	return 0;
>  }
>  
> -int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> -				     int depth, void *data)
> +int __init early_init_dt_scan_chosen(char *cmdline)
>  {
> -	int l;
> +	int l, node;
>  	const char *p;
>  	const void *rng_seed;
> +	const void *fdt = initial_boot_params;
>  
> -	pr_debug("search \"chosen\", depth: %d, uname: %s\n", depth, uname);
> -
> -	if (depth != 1 || !data ||
> -	    (strcmp(uname, "chosen") != 0 && strcmp(uname, "chosen@0") != 0))
> -		return 0;
> +	node = fdt_path_offset(fdt, "/chosen");
> +	if (node < 0)
> +		node = fdt_path_offset(fdt, "/chosen@0");
> +	if (node < 0)
> +		return -ENOENT;
>  
>  	early_init_dt_check_for_initrd(node);
>  	early_init_dt_check_for_elfcorehdr(node);
> @@ -1144,7 +1144,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	/* Retrieve command line */
>  	p = of_get_flat_dt_prop(node, "bootargs", &l);
>  	if (p != NULL && l > 0)
> -		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
> +		strlcpy(cmdline, p, min(l, COMMAND_LINE_SIZE));
>  
>  	/*
>  	 * CONFIG_CMDLINE is meant to be a default in case nothing else
> @@ -1153,18 +1153,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  	 */
>  #ifdef CONFIG_CMDLINE
>  #if defined(CONFIG_CMDLINE_EXTEND)
> -	strlcat(data, " ", COMMAND_LINE_SIZE);
> -	strlcat(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +	strlcat(cmdline, " ", COMMAND_LINE_SIZE);
> +	strlcat(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #elif defined(CONFIG_CMDLINE_FORCE)
> -	strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +	strlcpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #else
>  	/* No arguments from boot loader, use kernel's  cmdl*/
> -	if (!((char *)data)[0])
> -		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +	if (!((char *)cmdline)[0])
> +		strlcpy(cmdline, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  #endif
>  #endif /* CONFIG_CMDLINE */
>  
> -	pr_debug("Command line is: %s\n", (char *)data);
> +	pr_debug("Command line is: %s\n", (char *)cmdline);
>  
>  	rng_seed = of_get_flat_dt_prop(node, "rng-seed", &l);
>  	if (rng_seed && l > 0) {
> @@ -1178,8 +1178,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>  				fdt_totalsize(initial_boot_params));
>  	}
>  
> -	/* break now */
> -	return 1;
> +	return 0;
>  }
>  
>  #ifndef MIN_MEMBLOCK_ADDR
> @@ -1261,14 +1260,14 @@ bool __init early_init_dt_verify(void *params)
>  
>  void __init early_init_dt_scan_nodes(void)
>  {
> -	int rc = 0;
> +	int rc;
>  
>  	/* Initialize {size,address}-cells info */
>  	of_scan_flat_dt(early_init_dt_scan_root, NULL);
>  
>  	/* Retrieve various information from the /chosen node */
> -	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
> -	if (!rc)
> +	rc = early_init_dt_scan_chosen(boot_command_line);
> +	if (rc)
>  		pr_warn("No chosen node found, continuing without\n");
>  
>  	/* Setup memory, calling early_init_dt_add_memory_arch */
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index cf48983d3c86..654722235df6 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -58,8 +58,7 @@ extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
>  extern unsigned long of_get_flat_dt_root(void);
>  extern uint32_t of_get_flat_dt_phandle(unsigned long node);
>  
> -extern int early_init_dt_scan_chosen(unsigned long node, const char *uname,
> -				     int depth, void *data);
> +extern int early_init_dt_scan_chosen(char *cmdline);
>  extern int early_init_dt_scan_memory(unsigned long node, const char *uname,
>  				     int depth, void *data);
>  extern int early_init_dt_scan_chosen_stdout(void);
> 

patch 1/3

Reviewed-by: Frank Rowand <frank.rowand@sony.com>

