Return-Path: <linuxppc-dev+bounces-6852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307CA59762
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 15:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBJvD5fXXz2yVv;
	Tue, 11 Mar 2025 01:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741616408;
	cv=none; b=htfkP2c8FcljXhUy1tFQ3i0ZBxcrgcmAifK/qV0ZwLMKG8c1sOEtthKvMV8lQdOcgPUHH8h5n/lMHsHKPkRVX7qkUTspWMdYsA7NfbO9IREaS2A8f8P8SmmTf1YsMaeIlpF7qkbuWogUImA1Gr4Hyd+Lq/a1K3lKwQq5E5ogUiCaa9rf/h+il4eLaFe6uka4ij2FpNcD6d3r5HLPpy+JzkJLnR+lG85T5kwK8A1tTd2eXMb6ELhG+ftXyvGxrNWOFPad5i0A2wieX0HMVdlNsm7WRBASxiywUCViGbqRsc8oog2RNka16gBH96O36KR4daJ5V5FQlDc4NLwJE84B4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741616408; c=relaxed/relaxed;
	bh=mPku+0gIY5u/4rpfZdIT/B7ZwWhJRL/M4WwNUaRODTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/827a8sw+3Cy08vEhPlwbLavTr1jiPFMCR3NaHzmuyMqgVqnbgv+U0Jm4eAgKoIF0+Y6Ov7ENkFA3XMqwqjKttwE92T6FglXunPOVwH97VE/AwGky7CieYoc6xBb9+yLSpmopVfVrtOYT64GPumFw+TohYyJaFm+IpJiD0nOriS3XObzcDQcafTuoX3cylF07BVWzaUvvU0ILlIOUWJ1cVOOfzzaA/UCoHbaUuX8HaE70YOPzxnJEhPTpuxCDCZqq+244n9FiDD79Ljc7gtlD0t9/2rUNVA7pplnucE4WYqcZyK5Gn9VLxn3L7wOE+73+iwJvpfK9P20gI1ZzyQwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBJvB68fqz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 01:20:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZBJYQ5JP4z9sSK;
	Mon, 10 Mar 2025 15:04:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwKVKDqKDKnu; Mon, 10 Mar 2025 15:04:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZBJYQ4SpSz9sRy;
	Mon, 10 Mar 2025 15:04:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 86A518B768;
	Mon, 10 Mar 2025 15:04:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AImm03q6-b62; Mon, 10 Mar 2025 15:04:42 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 53E418B764;
	Mon, 10 Mar 2025 15:04:42 +0100 (CET)
Message-ID: <0a885183-0e83-458b-b2a7-94c7386fed99@csgroup.eu>
Date: Mon, 10 Mar 2025 15:04:42 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] book3s64/radix: Fix compile errors when
 CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
To: Donet Tom <donettom@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <8231763344223c193e3452eab0ae8ea966aff466.1741609795.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 10/03/2025 à 13:44, Donet Tom a écrit :
> From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> 
> Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n

I don't understand your patch.

As far as I can see, CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP is selected 
when CONFIG_PPC_RADIX_MMU is selected, and radix_pgtable.o is built only 
when CONFIG_PPC_RADIX_MMU is selected. So when radix_pgtable.o is built 
CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP will always be selected.

Can you clarify what the problem is ?

Christophe

> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>   arch/powerpc/mm/book3s64/radix_pgtable.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 311e2112d782..bd6916419472 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -976,7 +976,7 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
>   	return 0;
>   }
>   
> -
> +#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
>   bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
>   {
>   	if (radix_enabled())
> @@ -984,6 +984,7 @@ bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
>   
>   	return false;
>   }
> +#endif
>   
>   int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
>   				unsigned long addr, unsigned long next)


