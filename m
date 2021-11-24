Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB41245C9CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 17:21:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzmTb5djSz305j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 03:21:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fwKIDI2K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fwKIDI2K; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzmSx065tz2yP7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 03:20:31 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id j17so3148734qtx.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 08:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dKSHcD2L7MEpKjgBx687tkeDg+zn24Hg4tSJQGNG32g=;
 b=fwKIDI2Kl+1QpA9/1afom/fGaUxF0aCa6ADGmjUT6fMJ4H+PC8WyVE/Bz3wEtNuzFC
 UpRMd/sQZ+EK7pOFDrXehxxQ/vZviU12FwQe+WxntBKGFZWse4Dc0kWM4xt+nkAfAYPV
 A/xoDLI7PGkxQuE2Vym4jzCw/lPWul4TkvOqXaFLbYvnvGS1aLyUokpqW35l2qt/yWIn
 0AOZRJxHJLVfAy2nY+n/TzBE9H2SMThMJkvXQ8x4jHZ4cWqQv+02LI8IOHXVQ4wIBwn5
 OQHC+CX7xgcB+zDdrAbNTMd/59M9EE3yTqwgz9NRVoS8jSHBdguTxZAl9JKhyDz6v11G
 QvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dKSHcD2L7MEpKjgBx687tkeDg+zn24Hg4tSJQGNG32g=;
 b=f9wWFXlrSMEPDQt4G8MsrTPEkED3k0AKwdq1oS8QauUlwvW0IdW8f+1nmOIlVuQgG0
 eCUXYcyWnKmGyUODswoYSLD9cpxMUyFT7rw3Ufw9xUbMpB8kMOMVQXN9hDc0LfOF4h3V
 UTyyrbVxccNmOcpXfLnVp8L5br4NZEKygtvBaqsqrvvcGPdr1M3LZJiEUbFxK6X9gIer
 dNU3Jozohq6m5CeC9MfJm9haiu6uMZvSzyRAsVQdXw5XjtY9AWRgjTVJmvF4uE2PLwfF
 pkAPg+d6pj9DWk/Izqd2o8CbkFB+k+Qbs/i8SC9TisNZOI2BldDbH0Xf2h+Sn4LAfppM
 TOVg==
X-Gm-Message-State: AOAM530gZGB6hKRm8F1/KVyBizpNbHfOtDgSNF7zJzOD4WCc116x254w
 g/eDLS3Ktikt2JWGvB2dIAsMD/i+/Zc=
X-Google-Smtp-Source: ABdhPJxR53g3ek4r/8Dto6m4CgA9TyEXSP+yOeqxlgmWy3LvWS0UWGQJzLkxpaLPJixl3iWzsyygqQ==
X-Received: by 2002:ac8:5e12:: with SMTP id h18mr8718523qtx.143.1637770827734; 
 Wed, 24 Nov 2021 08:20:27 -0800 (PST)
Received: from [192.168.1.140] ([65.35.200.237])
 by smtp.gmail.com with ESMTPSA id g123sm71088qkf.108.2021.11.24.08.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 08:20:27 -0800 (PST)
Subject: Re: [PATCH 2/3] of/fdt: Rework early_init_dt_scan_root() to call
 directly
To: Rob Herring <robh@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 John Crispin <john@phrozen.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20211118181213.1433346-1-robh@kernel.org>
 <20211118181213.1433346-3-robh@kernel.org>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <13f402bb-933d-a5e0-4f45-24e5f5b3b1f1@gmail.com>
Date: Wed, 24 Nov 2021 11:20:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118181213.1433346-3-robh@kernel.org>
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
> as libfdt provides a nicer set of APIs. Rework early_init_dt_scan_root()
> to be called directly and use libfdt.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/powerpc/kernel/prom.c |  4 ++--
>  drivers/of/fdt.c           | 14 +++++++-------
>  include/linux/of_fdt.h     |  3 +--
>  3 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index c6c398ccd98a..6e1a106f02eb 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -748,7 +748,7 @@ void __init early_init_devtree(void *params)
>  	of_scan_flat_dt(early_init_dt_scan_chosen_ppc, boot_command_line);
>  
>  	/* Scan memory nodes and rebuild MEMBLOCKs */
> -	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +	early_init_dt_scan_root();
>  	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
>  
>  	parse_early_param();
> @@ -857,7 +857,7 @@ void __init early_get_first_memblock_info(void *params, phys_addr_t *size)
>  	 * mess the memblock.
>  	 */
>  	add_mem_to_memblock = 0;
> -	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +	early_init_dt_scan_root();
>  	of_scan_flat_dt(early_init_dt_scan_memory_ppc, NULL);
>  	add_mem_to_memblock = 1;
>  
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 1f1705f76263..5e216555fe4f 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -1042,13 +1042,14 @@ int __init early_init_dt_scan_chosen_stdout(void)
>  /*
>   * early_init_dt_scan_root - fetch the top level address and size cells
>   */
> -int __init early_init_dt_scan_root(unsigned long node, const char *uname,
> -				   int depth, void *data)
> +int __init early_init_dt_scan_root(void)
>  {
>  	const __be32 *prop;
> +	const void *fdt = initial_boot_params;
> +	int node = fdt_path_offset(fdt, "/");
>  
> -	if (depth != 0)
> -		return 0;
> +	if (node < 0)
> +		return -ENODEV;
>  
>  	dt_root_size_cells = OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
>  	dt_root_addr_cells = OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
> @@ -1063,8 +1064,7 @@ int __init early_init_dt_scan_root(unsigned long node, const char *uname,
>  		dt_root_addr_cells = be32_to_cpup(prop);
>  	pr_debug("dt_root_addr_cells = %x\n", dt_root_addr_cells);
>  
> -	/* break now */
> -	return 1;
> +	return 0;
>  }
>  
>  u64 __init dt_mem_next_cell(int s, const __be32 **cellp)
> @@ -1263,7 +1263,7 @@ void __init early_init_dt_scan_nodes(void)
>  	int rc;
>  
>  	/* Initialize {size,address}-cells info */
> -	of_scan_flat_dt(early_init_dt_scan_root, NULL);
> +	early_init_dt_scan_root();
>  
>  	/* Retrieve various information from the /chosen node */
>  	rc = early_init_dt_scan_chosen(boot_command_line);
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 654722235df6..df3d31926c3c 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -68,8 +68,7 @@ extern void early_init_dt_add_memory_arch(u64 base, u64 size);
>  extern u64 dt_mem_next_cell(int s, const __be32 **cellp);
>  
>  /* Early flat tree scan hooks */
> -extern int early_init_dt_scan_root(unsigned long node, const char *uname,
> -				   int depth, void *data);
> +extern int early_init_dt_scan_root(void);
>  
>  extern bool early_init_dt_scan(void *params);
>  extern bool early_init_dt_verify(void *params);
> 

Reviewed-by: Frank Rowand <frank.rowand@sony.com>
