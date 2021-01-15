Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB12F71A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 05:40:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH7l60P4fzDsYs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 15:40:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=MAVWj3Hv; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DH7j725VszDrRV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 15:38:15 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id n25so5246874pgb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 20:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aa11h6SMSUHlZCNvbAh0s6JAvs5o9WgBslrvkOi6ZZA=;
 b=MAVWj3HvMXr7oDsuGZECPZL/mMBN0z4iYFFWZu1JCxBoP6xkx9d7ekAummIhgPk6Rf
 ZLh8Zn8OpAMrny0jHhl3nQq+3/SnHd8ELsUUBu0gshmmTPpS0aeFkbaiCgYB0kRME/+I
 cqYLvjUliMhLASnUCo1AgHPSgzeBSLl7GuagCgUTqpzigsnS7JMBbgaQ1ME68VEBQLz7
 uTGZUoH6EEzRf8kvgB2AimlGQ1YrPUV3r8IskdSei48m/uCxm3yCX38+m95yKdcwnrZ5
 kkAz2LiyyUZD5jlwaoRbbllWBMyRE6lypYCa+HbZ+3vtY8B7hR1lO3y8yM8YhfYvWbNs
 tIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aa11h6SMSUHlZCNvbAh0s6JAvs5o9WgBslrvkOi6ZZA=;
 b=aH4Z1gaWw9XwJBs3yIbnz6xXajLfP5v2hRy7f2rapahJ3vAlsYPMaTMT4cN9ReGz9T
 ccfDUBRCQRWUe9R2VS8zDL7n7L9URg6XFFmrTc3rFssu2FG/F7ofukeNU1zO3tBKmT98
 FqYuygqMpcaABNqRbEnh/VWAv7OJ3sdG+SmJg44K6rY6PR1YfOTur9HaM7VN1QfG55Wy
 io2xN2egN7EL7oRMFDuuJ0K83wspZGOhSKxA/lENXQwnE5oD0vTmyMOWuiwlbyQ2yh9a
 y6iEKal+GePiH72dYL0utuJE98p2kdSnEq7H3Mi+0dGLC5zCTl7YBfTfG2Hke2Js50cZ
 2i6w==
X-Gm-Message-State: AOAM530naejui2Fg/JLwWAehutSMRjFWFrqlrKGo2/y1bs3xBEgaefag
 EESyNnd2k0uL+NInrGO2U77+C1aG57XuoQ==
X-Google-Smtp-Source: ABdhPJw5+MoaIUv88G7fTA+ZfuqfSmJ0GSr4QZf2qkM1I8ZT5OEMtfPM7kaYknUpBYJf3OB6cROWoA==
X-Received: by 2002:a65:690e:: with SMTP id s14mr10769973pgq.302.1610685493613; 
 Thu, 14 Jan 2021 20:38:13 -0800 (PST)
Received: from [192.168.10.23] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id j1sm6399401pfd.181.2021.01.14.20.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 20:38:12 -0800 (PST)
Subject: Re: [PATCH 6/6] powerpc/rtas: constrain user region allocation to RMA
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210114220004.1138993-1-nathanl@linux.ibm.com>
 <20210114220004.1138993-7-nathanl@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <5276937f-b72a-89ba-d0d8-19e4be55ae35@ozlabs.ru>
Date: Fri, 15 Jan 2021 15:38:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210114220004.1138993-7-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> Memory locations passed as arguments from the OS to RTAS usually need
> to be addressable in 32-bit mode and must reside in the Real Mode
> Area. On PAPR guests, the RMA starts at logical address 0 and is the
> first logical memory block reported in the LPAR’s device tree.
> 
> On powerpc targets with RTAS, Linux makes available to user space a
> region of memory suitable for arguments to be passed to RTAS via
> sys_rtas(). This region (rtas_rmo_buf) is allocated via the memblock
> API during boot in order to ensure that it satisfies the requirements
> described above.
> 
> With radix MMU, the upper limit supplied to the memblock allocation
> can exceed the bounds of the first logical memory block, since
> ppc64_rma_size is ULONG_MAX and RTAS_INSTANTIATE_MAX is 1GB. (512MB is
> a common size of the first memory block according to a small sample of
> LPARs I have checked.) This leads to failures when user space invokes
> an RTAS function that uses a work area, such as
> ibm,configure-connector.
> 
> Alter the determination of the upper limit for rtas_rmo_buf's
> allocation to consult the device tree directly, ensuring placement
> within the RMA regardless of the MMU in use.

Can we tie this with RTAS (which also needs to be in RMA) and simply add 
extra 64K in prom_instantiate_rtas() and advertise this address 
(ALIGH_UP(rtas-base + rtas-size, PAGE_SIZE)) to the user space? We do 
not need this RMO area before that point.

And probably do the same with per-cpu RTAS argument structures mentioned 
in the cover letter?



> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/kernel/rtas.c | 80 +++++++++++++++++++++++++++++++-------
>   1 file changed, 65 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index da65faadbbb2..98dfb112f4df 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1166,6 +1166,70 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>   	return 0;
>   }
>   
> +/*
> + * Memory locations passed to RTAS must be in the RMA as described by
> + * the range in /memory@0.
> + */
> +static phys_addr_t rtas_arg_addr_limit(void)
> +{
> +	unsigned int addr_cells;
> +	unsigned int size_cells;
> +	struct device_node *np;
> +	const __be32 *prop;
> +	u64 limit;
> +	u64 base;
> +
> +	/* RTAS is instantiated in 32-bit mode. */
> +	limit = 1ULL << 32;
> +
> +	/* Account for mem=. */
> +	if (memory_limit != 0)
> +		limit = min(limit, memory_limit);
> +
> +	np = of_find_node_by_path("/memory@0");
> +	if (!np)
> +		goto out;
> +
> +	prop = of_get_property(np, "reg", NULL);
> +	if (!prop)
> +		goto put;
> +
> +	addr_cells = of_n_addr_cells(np);
> +	base = of_read_number(prop, addr_cells);
> +	prop += addr_cells;
> +	size_cells = of_n_size_cells(np);
> +	limit = min(limit, of_read_number(prop, size_cells));
> +put:
> +	of_node_put(np);
> +out:
> +	pr_debug("%s: base = %#llx limit = %#llx", __func__, base, limit);
> +
> +	return limit;
> +}
> +
> +static void __init rtas_user_region_setup(void)
> +{
> +	phys_addr_t limit, align, size;
> +
> +	limit = rtas_arg_addr_limit();
> +	size = RTAS_USER_REGION_SIZE;
> +
> +	/*
> +	 * Although work areas need only 4KB alignment, user space
> +	 * accesses this region via mmap so it must be placed on a
> +	 * page boundary.
> +	 */
> +	align = PAGE_SIZE;
> +
> +	rtas_rmo_buf = memblock_phys_alloc_range(size, align, 0, limit);
> +	if (rtas_rmo_buf == 0) {
> +		panic("Failed to allocate %llu bytes for user region below %pa\n",
> +		      size, &limit);
> +	}
> +
> +	pr_debug("RTAS user region allocated at %pa\n", &rtas_rmo_buf);
> +}
> +
>   /*
>    * Call early during boot, before mem init, to retrieve the RTAS
>    * information from the device-tree and allocate the RMO buffer for userland
> @@ -1173,7 +1237,6 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>    */
>   void __init rtas_initialize(void)
>   {
> -	unsigned long rtas_region = RTAS_INSTANTIATE_MAX;
>   	u32 base, size, entry;
>   	int no_base, no_size, no_entry;
>   
> @@ -1197,23 +1260,10 @@ void __init rtas_initialize(void)
>   	no_entry = of_property_read_u32(rtas.dev, "linux,rtas-entry", &entry);
>   	rtas.entry = no_entry ? rtas.base : entry;
>   
> -	/* If RTAS was found, allocate the RMO buffer for it and look for
> -	 * the stop-self token if any
> -	 */
> -#ifdef CONFIG_PPC64
> -	if (firmware_has_feature(FW_FEATURE_LPAR))
> -		rtas_region = min(ppc64_rma_size, RTAS_INSTANTIATE_MAX);
> -#endif
> -	rtas_rmo_buf = memblock_phys_alloc_range(RTAS_USER_REGION_SIZE, PAGE_SIZE,
> -						 0, rtas_region);
> -	if (!rtas_rmo_buf)
> -		panic("ERROR: RTAS: Failed to allocate %lx bytes below %pa\n",
> -		      PAGE_SIZE, &rtas_region);
> -
>   #ifdef CONFIG_RTAS_ERROR_LOGGING
>   	rtas_last_error_token = rtas_token("rtas-last-error");
>   #endif
> -
> +	rtas_user_region_setup();
>   	rtas_syscall_filter_init();
>   }
>   
> 

-- 
Alexey
