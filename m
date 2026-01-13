Return-Path: <linuxppc-dev+bounces-15626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26571D18B38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:28:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr7ng4vbNz2xjK;
	Tue, 13 Jan 2026 23:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768307303;
	cv=none; b=fygkaEvWDmKnwyMwevfBJs6svRFXxQQjbkRX7LE1FsKUQK9kCBbPrCdDQ3bo0CJ1LDZMM8+AOpeR3TxzxhHO9FhMEYYEiND5K2aqZ7fWc1u9HTiOfk5l7S4gdfPfT3YFu9eBDkkGXhVKaC+mQ3rEwsfqOGyoEDWI6LhSSH4iiXHN/mQiDYqP52J7O8PUH/fKaDGLnqN8juu+VWhCShkT8qoU9oDeGQBp3UydMhToZTh97lp2Y1T3eHAL1duKxDeXUAUECECl4X6OiqMut4sw+BEkQAlASlYLT3FVwny4JJL7ZZD7CNeAqddQmid3e8oUi0f4hF4Bm9oROq9Og9XtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768307303; c=relaxed/relaxed;
	bh=guD8ZDnRvesT5KvXlXi5P5IpxaFCA5kIle2X5/2VdEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=liXfeMdT9C8d6WAw9uMp6s0cP/qoJntLt0GHKMw2YAZIgM0VcMlakWpWd9KKBGiU/+Ebzo15k8DeJs/lrMOiUQ7r/L8ltyUnjtaUQDpqoJ4lO/qleRPMNQGy6gt27ARobCSP+3I2i2VtSDfbfvnonO802hcPnPc0uPK0s2TBjPP87LqiVJ+0EFES2vp5RdPnJ7Vc5PG2sCX7NSAVtEEC+AT/lXP0p3Y6Ic5ZMGKvr9FRPGarqB5Ug51QlBMN9jYeSfmT/Joog7ea0HUTlwRXbgFYfvrF4GM+FQYJHhrb7CaNudtvLVatXRBp5ByuOHbiYn4G+DEQgGnE9RV0rSWyew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=NC76RtxI reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=NC76RtxI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr7nc440Yz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:28:18 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4dr7nT4yQ4z1FDXl;
	Tue, 13 Jan 2026 13:28:13 +0100 (CET)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4dr7nQ25vMz1DDgf;
	Tue, 13 Jan 2026 13:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1768307293;
	bh=guD8ZDnRvesT5KvXlXi5P5IpxaFCA5kIle2X5/2VdEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NC76RtxIq9CvKMBZ8e8fqDdeh4TXwyvNkvf30sHXNOLOnEVZmRBj+bHCDi8FufU/c
	 kWfZWHOIxSWOKL03enthax76m8YsczdRizVAQDjKjHPFRaRl/L5Y0iqK2UA8boHs2h
	 YUuM9qT6Ba/QEyyAn4GTFzIGpGi10RKIEp9TlTeLGd8zC+Hr/coq6gBL6LosZXZTF1
	 gt8Mie1XHzB/bpnFnld9TZavLmhYmlgBWFsXaCVZw4vobFyvtSEkURaEmNJU94ewFm
	 w3pY4SkxqHFB/QXGBXfUllqNu8tQIWuZ/XTNBQs4TvEhLsgrM+Wzf2b59+1+UOXxo8
	 bJQ987lvmGGqA==
Message-ID: <7566eef3-bce4-4100-8a11-d88ef1e887a9@gaisler.com>
Date: Tue, 13 Jan 2026 13:28:09 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/29] sparc: introduce arch_zone_limits_init()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-20-rppt@kernel.org>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20260111082105.290734-20-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-11 09:20, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
> 
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/sparc/mm/init_64.c |  6 ++++++
>  arch/sparc/mm/srmmu.c   | 12 ++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)

Hi Mike,

Thanks for this nice cleanup series.


> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index df9f7c444c39..fbaad449dfc9 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2279,6 +2279,11 @@ static void __init reduce_memory(phys_addr_t limit_ram)
>  	memblock_enforce_memory_limit(limit_ram);
>  }
>  
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> +{
> +	max_zone_pfns[ZONE_NORMAL] = last_valid_pfn;
> +}
> +
>  void __init paging_init(void)
>  {
>  	unsigned long end_pfn, shift, phys_base;
> @@ -2461,6 +2466,7 @@ void __init paging_init(void)
>  
>  		max_zone_pfns[ZONE_NORMAL] = end_pfn;

This old initialization of max_zone_pfns[ZONE_NORMAL] should also be
removed, right? With that removed it makes the local end_pfn variable
set but unused, so could you please also remove that one?

I know that this whole code block gets removed later, but the cleanup
max_zone_pfns[ZONE_NORMAL] and the removal of end_pfn (that is not done
later in this version of the series) fits logically in this patch.

>  
> +		arch_zone_limits_init(max_zone_pfns);
>  		free_area_init(max_zone_pfns);
>  	}
>  
> diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> index f8fb4911d360..81e90151db90 100644
> --- a/arch/sparc/mm/srmmu.c
> +++ b/arch/sparc/mm/srmmu.c
> @@ -884,6 +884,13 @@ static void __init map_kernel(void)
>  
>  void (*poke_srmmu)(void) = NULL;
>  
> +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> +{
> +	max_zone_pfns[ZONE_DMA] = max_low_pfn;
> +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> +	max_zone_pfns[ZONE_HIGHMEM] = highend_pfn;
> +}
> +
>  void __init srmmu_paging_init(void)
>  {
>  	int i;
> @@ -967,10 +974,7 @@ void __init srmmu_paging_init(void)
>  	{
>  		unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  
> -		max_zone_pfn[ZONE_DMA] = max_low_pfn;
> -		max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
> -		max_zone_pfn[ZONE_HIGHMEM] = highend_pfn;
> -
> +		arch_zone_limits_init(max_zone_pfn);
>  		free_area_init(max_zone_pfn);
>  	}
>  }

With the feedback for arch/sparc/mm/init_64.c addressed:

Acked-by: Andreas Larsson <andreas@gaisler.com>

Cheers,
Andreas


