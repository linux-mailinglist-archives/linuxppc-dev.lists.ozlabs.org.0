Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE452F71A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 05:44:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH7r353cLzDsZN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 15:44:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dz+HX1Y4; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH7jM5CtlzDrRV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 15:38:31 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id x126so4708808pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g03IL+e2mkBhToS3VlMiGHreBPKZ/Tx21d1bSF0Yuic=;
 b=dz+HX1Y4W6ig8uDw3JCLk0bt6pMGkoR/gOgTLNoTFbhIEHUwPVzTERAOioElyx51+n
 a8YLbZ1Deg7XHGz7klOyPrTsyp8XBxuEHY7yNYhb0KpQWqSvxb/BMVbIufF/44bc1pF9
 MPiUht49DYVr/APKVk3IIt/VADnNKgCpG38UlB5Yx060pj/BErVQVae8VcWxA604BdAz
 +i/IgyAUUmMh0FV5kGb2YQJ+zN0Vxr02U5LRgK275K2Fq6P9oaAZ2AmO5KiEe+WN/LIJ
 WWxdzEw9w9WhTrpQoWviM5i/1WW7AU45iH1CYiFE62Z8MgBOp1kaMH3iYPOqRu5DXG6Z
 tp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g03IL+e2mkBhToS3VlMiGHreBPKZ/Tx21d1bSF0Yuic=;
 b=WHIdUNtfzFpMx+2M0nzpvPbL2iI7mliRchnU1CVrQKleHbBMkaGNmez2WeyIA2SRCe
 WkSzH1zxwY5deguP3OSA6j88X0jfgOJN72/v+MPDJMV8DGbsa1LH+jGGQFjlj1rx4vmQ
 TFO/5y65BuiFkw86hWQsyj2mg6KjgkfmbSzI83BxynQkQf7APzEv4fSprRFsURlH48eI
 f+TQN0DQ3yMiM5z0+1UzU31X7UyMaq71siWEFFDqagGM4piF1JbQno4Z0frOgjjY1t1p
 7lGabI+xxe2iP4u6huQqvaig4FxrElb6bCDTjtLoJBqXEYtC9yyfjRokGXj09dmZtJ3u
 ggtg==
X-Gm-Message-State: AOAM5309G4SmJvdlz8GuTAnn57r3JwSIk05Guke5VqOLhBf8Q3rl780P
 JqhdXlHA1uho1/bYhTjsP6wMcg==
X-Google-Smtp-Source: ABdhPJx5lbPGZizwtjTOP5jFqz3zplkBsILNEBKYqC+Nw0rz4Y+IZ4z8b6E4yu9Y2co2oglzuMX2Hg==
X-Received: by 2002:a63:cf43:: with SMTP id b3mr10562064pgj.387.1610685508398; 
 Thu, 14 Jan 2021 20:38:28 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id md7sm6821782pjb.52.2021.01.14.20.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 20:38:27 -0800 (PST)
Subject: Re: [PATCH 5/6] powerpc/rtas: rename RTAS_RMOBUF_MAX to
 RTAS_USER_REGION_SIZE
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-6-nathanl@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <d91c5b15-7c3d-a332-45ac-1b865341e962@ozlabs.ru>
Date: Fri, 15 Jan 2021 15:38:23 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-6-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: tyreld@linux.ibm.com, brking@linux.ibm.com, ajd@linux.ibm.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 15/01/2021 09:00, Nathan Lynch wrote:
> RTAS_RMOBUF_MAX doesn't actually describe a "maximum" value in any
> sense. It represents the size of an area of memory set aside for user
> space to use as work areas for certain RTAS calls.
> 
> Rename it to RTAS_USER_REGION, and express the value in terms of the
> number of work areas allocated.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> 
> squash! powerpc/rtas: rename RTAS_RMOBUF_MAX to RTAS_USER_REGION_SIZE
> ---
>   arch/powerpc/include/asm/rtas.h | 9 ++++++---
>   arch/powerpc/kernel/rtas-proc.c | 2 +-
>   arch/powerpc/kernel/rtas.c      | 2 +-
>   3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 332e1000ca0f..1aa7ab1cbc84 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -19,8 +19,11 @@
>   #define RTAS_UNKNOWN_SERVICE (-1)
>   #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
>   
> -/* Buffer size for ppc_rtas system call. */
> -#define RTAS_RMOBUF_MAX (64 * 1024)
> +/* Work areas shared with RTAS must be 4K, naturally aligned. */

Why exactly 4K and not (for example) PAGE_SIZE?

> +#define RTAS_WORK_AREA_SIZE   4096
> +
> +/* Work areas allocated for user space access. */
> +#define RTAS_USER_REGION_SIZE (RTAS_WORK_AREA_SIZE * 16)

This is still 64K but no clarity why. There is 16 of something, what is it?


>   
>   /* RTAS return status codes */
>   #define RTAS_BUSY		-2    /* RTAS Busy */
> @@ -357,7 +360,7 @@ extern void rtas_take_timebase(void);
>   static inline int page_is_rtas_user_buf(unsigned long pfn)
>   {
>   	unsigned long paddr = (pfn << PAGE_SHIFT);
> -	if (paddr >= rtas_rmo_buf && paddr < (rtas_rmo_buf + RTAS_RMOBUF_MAX))
> +	if (paddr >= rtas_rmo_buf && paddr < (rtas_rmo_buf + RTAS_USER_REGION_SIZE))
>   		return 1;
>   	return 0;
>   }
> diff --git a/arch/powerpc/kernel/rtas-proc.c b/arch/powerpc/kernel/rtas-proc.c
> index d2b0d99824a4..6857a5b0a1c3 100644
> --- a/arch/powerpc/kernel/rtas-proc.c
> +++ b/arch/powerpc/kernel/rtas-proc.c
> @@ -767,6 +767,6 @@ static int ppc_rtas_tone_volume_show(struct seq_file *m, void *v)
>    */
>   static int ppc_rtas_rmo_buf_show(struct seq_file *m, void *v)
>   {
> -	seq_printf(m, "%016lx %x\n", rtas_rmo_buf, RTAS_RMOBUF_MAX);
> +	seq_printf(m, "%016lx %x\n", rtas_rmo_buf, RTAS_USER_REGION_SIZE);
>   	return 0;
>   }
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 55f6aa170e57..da65faadbbb2 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1204,7 +1204,7 @@ void __init rtas_initialize(void)
>   	if (firmware_has_feature(FW_FEATURE_LPAR))
>   		rtas_region = min(ppc64_rma_size, RTAS_INSTANTIATE_MAX);
>   #endif
> -	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_RMOBUF_MAX, PAGE_SIZE,
> +	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_USER_REGION_SIZE, PAGE_SIZE,
>   						 0, rtas_region);
>   	if (!rtas_rmo_buf)
>   		panic("ERROR: RTAS: Failed to allocate %lx bytes below %pa\n",
> 

-- 
Alexey
