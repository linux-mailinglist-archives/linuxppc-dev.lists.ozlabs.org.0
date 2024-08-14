Return-Path: <linuxppc-dev+bounces-93-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D727952549
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 00:10:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkjB522rNz2xsN;
	Thu, 15 Aug 2024 08:10:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkZhh3m7mz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 03:18:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WkZhc2F1hz9sRy;
	Wed, 14 Aug 2024 19:18:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2c_GcUldxymO; Wed, 14 Aug 2024 19:18:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WkZhc1SFGz9sRs;
	Wed, 14 Aug 2024 19:18:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 235D48B775;
	Wed, 14 Aug 2024 19:18:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nROmEmi-hTH5; Wed, 14 Aug 2024 19:18:08 +0200 (CEST)
Received: from [192.168.232.91] (unknown [192.168.232.91])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A579E8B764;
	Wed, 14 Aug 2024 19:18:07 +0200 (CEST)
Message-ID: <8fc490bc-b0e6-4730-87ff-ee247fea887d@csgroup.eu>
Date: Wed, 14 Aug 2024 19:18:07 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 10/10] book3s64/hash: Disable kfence if not early init
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Hari Bathini
 <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Donet Tom <donettom@linux.vnet.ibm.com>,
 Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
References: <cover.1722408881.git.ritesh.list@gmail.com>
 <fd77730375a0ab6ae0a89f934385750b239d3113.1722408881.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <fd77730375a0ab6ae0a89f934385750b239d3113.1722408881.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 31/07/2024 à 09:56, Ritesh Harjani (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Enable kfence on book3s64 hash only when early init is enabled.
> This is because, kfence could cause the kernel linear map to be mapped
> at PAGE_SIZE level instead of 16M (which I guess we don't want).
> 
> Also currently there is no way to -
> 1. Make multiple page size entries for the SLB used for kernel linear
>     map.
> 2. No easy way of getting the hash slot details after the page table
>     mapping for kernel linear setup. So even if kfence allocate the
>     pool in late init, we won't be able to get the hash slot details in
>     kfence linear map.
> 
> Thus this patch disables kfence on hash if kfence early init is not
> enabled.
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/mm/book3s64/hash_utils.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index c66b9921fc7d..759dbcbf1483 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -410,6 +410,8 @@ static phys_addr_t kfence_pool;
> 
>   static inline void hash_kfence_alloc_pool(void)
>   {
> +       if (!kfence_early_init)
> +               goto err;
> 
>          // allocate linear map for kfence within RMA region
>          linear_map_kf_hash_count = KFENCE_POOL_SIZE >> PAGE_SHIFT;
> @@ -1074,7 +1076,8 @@ static void __init htab_init_page_sizes(void)
>          bool aligned = true;
>          init_hpte_page_sizes();
> 
> -       if (!debug_pagealloc_enabled_or_kfence()) {
> +       if (!debug_pagealloc_enabled() &&
> +           !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {

Looks complex, can we do simpler ?

>                  /*
>                   * Pick a size for the linear mapping. Currently, we only
>                   * support 16M, 1M and 4K which is the default
> --
> 2.45.2
> 

