Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064AE437715
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 14:25:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbNpP2K6Dz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 23:25:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=1A/AmQB0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1A/AmQB0; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbNnj0FDzz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 23:24:23 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso2928744pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=bp9MjdORbTe84m2V9D+ipTsLHpr7fFIP9V7cCVqmPiw=;
 b=1A/AmQB02Hx20dW+8/liVzZ88Q3S9WK8ryRY5nvApJA26eseLqnGWUtg1aJgcTAzjK
 JKM24w5Z316C7lySb6omggLXRhJQtJ3GvxkGwC3kPuptTEFDP7FG9ASHEBXoFem3e+Eg
 XIjbpcu+zBHbXiskfUZsoXw6qniUjzmiqWBZYsMdwVHi/hAWNt05rU7NXgwluTaAN1BW
 orcqab2HWMzNmEHKdAyfO7Jh1mKNZySNBvKTTn6laFLslN0ehOguzNu7Gv2eNDl2ZDIg
 iCvED26cBOLqJOeLdmqPa7uYWkB9SSr700LLsdGYxZEcOEKt0TT4ElHs2KFlxZkS6Cab
 Ra2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bp9MjdORbTe84m2V9D+ipTsLHpr7fFIP9V7cCVqmPiw=;
 b=V0GZaodpPH+HqpPAIuwnovQ7TJK6ABZ11k9HbBlXDc35T8vlllz7gemIE+q9SCwVET
 qGCRdNLaWz/d9CxS2AxB8Ez9iX8JcOUxokI43n8LFagiAVKVCfAK7ZiehUaGWO1nWmTW
 JmOJ+rnCtuzeyJloSPX7wdYs5b5N6Y0PdEhEjf7gJFvdzIHNyeh6V5xj+xl+jNVqDCdO
 k5ZF8X4q8t4KdU6Rd2GDmRwHTHo+ydhUJHY0W584Qz9ks1SCOJUtiz2ydnv+HPBE5IFm
 UcmdHLrs30THwauaDTUhwLzSil7tfPc0paDP0C2aRDI32ZLpds8QrwXi54A9eKGmW6j/
 nhFw==
X-Gm-Message-State: AOAM531LDuCg260QJsRCLGU8B+b4uaEEcHKKpw0ay1HFvKMCLF37J+dV
 1rV5ldM/qw1QiO2rEBjJ0mLajv9E9q1FhA==
X-Google-Smtp-Source: ABdhPJwuI/GzzrUHJtIlUdYE7658HKljibHQWV7Ep9nmZs01w2fsmD0eYPK39AXSmmSYv8UPEqZrFA==
X-Received: by 2002:a17:90b:1e01:: with SMTP id
 pg1mr14067498pjb.81.1634905460352; 
 Fri, 22 Oct 2021 05:24:20 -0700 (PDT)
Received: from [192.168.10.153] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id x184sm9391002pfc.44.2021.10.22.05.24.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 05:24:19 -0700 (PDT)
Message-ID: <84b82d2b-1263-39bb-d966-b432af530ca8@ozlabs.ru>
Date: Fri, 22 Oct 2021 23:24:15 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0
Subject: Re: [PATCH] powerpc: Enhance pmem DMA bypass handling
Content-Language: en-US
To: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211021174449.120875-1-brking@linux.vnet.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20211021174449.120875-1-brking@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/10/2021 04:44, Brian King wrote:
> If ibm,pmemory is installed in the system, it can appear anywhere
> in the address space. This patch enhances how we handle DMA for devices when
> ibm,pmemory is present. In the case where we have enough DMA space to
> direct map all of RAM, but not ibm,pmemory, we use direct DMA for
> I/O to RAM and use the default window to dynamically map ibm,pmemory.
> In the case where we only have a single DMA window, this won't work, > so if the window is not big enough to map the entire address range,
> we cannot direct map.

but we want the pmem range to be mapped into the huge DMA window too if 
we can, why skip it?


> 
> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 269f61d519c2..d9ae985d10a4 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1092,15 +1092,6 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>   	phys_addr_t max_addr = memory_hotplug_max();
>   	struct device_node *memory;
>   
> -	/*
> -	 * The "ibm,pmemory" can appear anywhere in the address space.
> -	 * Assuming it is still backed by page structs, set the upper limit
> -	 * for the huge DMA window as MAX_PHYSMEM_BITS.
> -	 */
> -	if (of_find_node_by_type(NULL, "ibm,pmemory"))
> -		return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
> -			(phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
> -
>   	for_each_node_by_type(memory, "memory") {
>   		unsigned long start, size;
>   		int n_mem_addr_cells, n_mem_size_cells, len;
> @@ -1341,6 +1332,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	 */
>   	len = max_ram_len;
>   	if (pmem_present) {
> +		if (default_win_removed) {
> +			/*
> +			 * If we only have one DMA window and have pmem present,
> +			 * then we need to be able to map the entire address
> +			 * range in order to be able to do direct DMA to RAM.
> +			 */
> +			len = order_base_2((sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
> +					(phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS));
> +		}
> +
>   		if (query.largest_available_block >=
>   		    (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
>   			len = MAX_PHYSMEM_BITS;
> 

-- 
Alexey
