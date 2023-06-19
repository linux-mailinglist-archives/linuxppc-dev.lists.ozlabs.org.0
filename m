Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D571E735286
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 12:36:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aPMz2eR3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eYLauzga;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ql5lN1Mclz30Mc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 20:36:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aPMz2eR3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eYLauzga;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql5kR0gw3z2yx0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 20:35:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687170905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kzRWvnW08C3j+K9Vi5MjKEYmDrDN5xHolZBplvhXmY=;
	b=aPMz2eR3vbNM/5l9yCVa9dZ2mDz8a7gDzXluPA5yT3NfEyjGeMgywL4Curx92haF8WpkCd
	D6Tfh7Lb4z1C+XqZYGZfm+iLF8PKWosmRUKuAiQcwaJ4dCVgYUrOldbZQQyXsk5qPXU9Kp
	OWIpTQKfGXZgvIO1j9Njr6AfnGA2fGQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687170906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8kzRWvnW08C3j+K9Vi5MjKEYmDrDN5xHolZBplvhXmY=;
	b=eYLauzgaWyEu1kK6XN0LFugxowI+Tuki1SUh7567utNl07LQteP9K8OBBnFltZZJ+TnQgB
	ljA+fzJKdRy8LKoTgH9rc+OICm6B/envXxLIT634TRotY/3eu2EiJGJRxxpLinmqSpeOEe
	Yt1+8D4SpH1iNVEALlDmrACmh6N15fU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-Pk_rceVmOmedp7ay3zmYew-1; Mon, 19 Jun 2023 06:35:04 -0400
X-MC-Unique: Pk_rceVmOmedp7ay3zmYew-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-31118de9a69so1133291f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jun 2023 03:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687170903; x=1689762903;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8kzRWvnW08C3j+K9Vi5MjKEYmDrDN5xHolZBplvhXmY=;
        b=jvs/NNkPclE/xfBdeti64BdWy3ffZOZcjc+5K9aOf3Wv6hyvT4Au48mjqsiISg0+HB
         u4t/NaY+YsuzmsWptVev+tDD7w1LZlwiwh42Lz3HHU6mWl63vQDmXKN92VrN6bIFKAm4
         G5/0mpXmiFq6x/ivrLoC/lvs+NvzAzJS6UZAu4HUAxUsUU7KNJGbkTV/p0DEVugIqE5O
         ztrgfjRWvIOFJdt7ttqCsScQZ7ktqNfs+QUA9XOO4v5Iqc83WBFD2XGulEcNRR+JuDhQ
         55wTnr1ZUlWIjUWCfwtC7liJuc+xobVqNxz7cEV+mSxoTA2kR/+Q3zOYK9FWIewr6OyI
         FXZw==
X-Gm-Message-State: AC+VfDyUr9RVxy0bjhQDHv8uNylrBAN1/30nxrdONkNCmv/IjpuYOc7i
	7105U4qk1JUPckUuTzTsGXMzt0qJtI8U5uDiA2sb/XHPiC6sxQPZEwk9nuOZJ2wBaqdqXernKZ+
	heV1fIl+T77jCSR7Y38AJkP8fow==
X-Received: by 2002:adf:f08b:0:b0:311:1ce2:ee1b with SMTP id n11-20020adff08b000000b003111ce2ee1bmr6137145wro.66.1687170903287;
        Mon, 19 Jun 2023 03:35:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7UlXqyx79AZbg7cQKKw3/FukF7BwIL7pS8JScrUi2KCcalrl35OKswwnX/DBdodQxokoKs5w==
X-Received: by 2002:adf:f08b:0:b0:311:1ce2:ee1b with SMTP id n11-20020adff08b000000b003111ce2ee1bmr6137126wro.66.1687170902871;
        Mon, 19 Jun 2023 03:35:02 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:7100:cede:6433:a77b:41e9? (p200300cbc72f7100cede6433a77b41e9.dip0.t-ipconnect.de. [2003:cb:c72f:7100:cede:6433:a77b:41e9])
        by smtp.gmail.com with ESMTPSA id w15-20020a5d404f000000b0030fcf3d75c4sm17148919wrp.45.2023.06.19.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 03:35:02 -0700 (PDT)
Message-ID: <853eae60-b92b-9284-e24d-564429aba8c1@redhat.com>
Date: Mon, 19 Jun 2023 12:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
References: <20230609060851.329406-1-aneesh.kumar@linux.ibm.com>
 <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 2/2] powerpc/mm: Add memory_block_size as a kernel
 parameter
In-Reply-To: <20230609060851.329406-2-aneesh.kumar@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: foraker1@llnl.gov
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09.06.23 08:08, Aneesh Kumar K.V wrote:
> Certain devices can possess non-standard memory capacities, not constrained
> to multiples of 1GB. Provide a kernel parameter so that we can map the
> device memory completely on memory hotplug.

So, the unfortunate thing is that these devices would have worked out of 
the box before the memory block size was increased from 256 MiB to 1 GiB 
in these setups. Now, one has to fine-tune the memory block size. The 
only other arch that I know, which supports setting the memory block 
size, is x86 for special (large) UV systems -- and at least in the past 
128 MiB vs. 2 GiB memory blocks made a performance difference during 
boot (maybe no longer today, who knows).


Obviously, less tunable and getting stuff simply working out of the box 
is preferable.

Two questions:

1) Isn't there a way to improve auto-detection to fallback to 256 MiB in 
these setups, to avoid specifying these parameters?

2) Is the 256 MiB -> 1 GiB memory block size switch really worth it? On 
x86-64, experiments (with direct map fragmentation) showed that the 
effective performance boost is pretty insignificant, so I wonder how big 
the 1 GiB direct map performance improvement is.


I guess the only real issue with 256 MiB memory blocks and 1 GiB direct 
mapping is memory unplug of boot memory: when unplugging a 256 MiB 
block, one would have to remap the 1 GiB range using 2 MiB ranges.

... I was wondering what would happen if you simply leave the direct 
mapping in this corner case in place instead of doing this remapping. 
IOW, remove the memory but keep the direct map pointing at the removed 
memory. Nobody should be touching it, or are there any cases where that 
could hurt?


Or is there any other reason why we really want 1 GiB memory blocks 
instead of to defaulting to 256 MiB the way it used to be?

Thanks!

> 
> Restrict memory_block_size value to a power of 2 value similar to LMB size.
> The memory block size should also be more than the section size.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  3 +++
>   arch/powerpc/kernel/setup_64.c                | 23 +++++++++++++++++++
>   arch/powerpc/mm/init_64.c                     | 17 ++++++++++----
>   3 files changed, 38 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 9e5bab29685f..833b8c5b4b4c 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3190,6 +3190,9 @@
>   			Note that even when enabled, there are a few cases where
>   			the feature is not effective.
>   
> +	memory_block_size=size [PPC]
> +			 Use this parameter to configure the memory block size value.
> +
>   	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV] Enable memtest
>   			Format: <integer>
>   			default : 0 <disable>
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 246201d0d879..cbdb924462c7 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -892,6 +892,29 @@ unsigned long memory_block_size_bytes(void)
>   
>   	return MIN_MEMORY_BLOCK_SIZE;
>   }
> +
> +/*
> + * Restrict to a power of 2 value for memblock which is larger than
> + * section size
> + */
> +static int __init parse_mem_block_size(char *ptr)
> +{
> +	unsigned int order;
> +	unsigned long size = memparse(ptr, NULL);
> +
> +	order = fls64(size);
> +	if (!order)
> +		return 0;
> +
> +	order--;
> +	if (order < SECTION_SIZE_BITS)
> +		return 0;
> +
> +	memory_block_size = 1UL << order;
> +
> +	return 0;
> +}
> +early_param("memory_block_size", parse_mem_block_size);
>   #endif
>   
>   #if defined(CONFIG_PPC_INDIRECT_PIO) || defined(CONFIG_PPC_INDIRECT_MMIO)
> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
> index 97a9163f1280..5e6dde593ea3 100644
> --- a/arch/powerpc/mm/init_64.c
> +++ b/arch/powerpc/mm/init_64.c
> @@ -549,13 +549,20 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
>   	return 0;
>   }
>   
> -/*
> - * start with 1G memory block size. Early init will
> - * fix this with correct value.
> - */
> -unsigned long memory_block_size __ro_after_init = 1UL << 30;
> +unsigned long memory_block_size __ro_after_init;
>   static void __init early_init_memory_block_size(void)
>   {
> +	/*
> +	 * if it is set via early param just return.
> +	 */
> +	if (memory_block_size)
> +		return;
> +
> +	/*
> +	 * start with 1G memory block size. update_memory_block_size()
> +	 * will derive the right value based on device tree details.
> +	 */
> +	memory_block_size = 1UL << 30;
>   	/*
>   	 * We need to do memory_block_size probe early so that
>   	 * radix__early_init_mmu() can use this as limit for

-- 
Cheers,

David / dhildenb

