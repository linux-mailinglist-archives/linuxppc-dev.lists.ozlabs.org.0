Return-Path: <linuxppc-dev+bounces-92-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC449952548
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2024 00:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wkj9t4xNVz2xY0;
	Thu, 15 Aug 2024 08:10:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkZdR0mNxz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 03:15:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WkZdM4Cmmz9sRy;
	Wed, 14 Aug 2024 19:15:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRzRwR-ehCKy; Wed, 14 Aug 2024 19:15:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WkZdM2ys3z9sRs;
	Wed, 14 Aug 2024 19:15:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 555368B775;
	Wed, 14 Aug 2024 19:15:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kUoyearDPFXd; Wed, 14 Aug 2024 19:15:19 +0200 (CEST)
Received: from [192.168.232.91] (unknown [192.168.232.91])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D4DB78B764;
	Wed, 14 Aug 2024 19:15:18 +0200 (CEST)
Message-ID: <f37526c7-a608-426c-b23b-2681139868db@csgroup.eu>
Date: Wed, 14 Aug 2024 19:15:18 +0200
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
Subject: Re: [RFC v1 09/10] book3s64/radix: Refactoring common kfence related
 functions
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Hari Bathini
 <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Donet Tom <donettom@linux.vnet.ibm.com>,
 Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
References: <cover.1722408881.git.ritesh.list@gmail.com>
 <292790d676ed9e31507a0ba4b11800cbc6670e44.1722408881.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <292790d676ed9e31507a0ba4b11800cbc6670e44.1722408881.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 31/07/2024 à 09:56, Ritesh Harjani (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Both radix and hash on book3s requires to detect if kfence
> early init is enabled or not. Hash needs to disable kfence
> if early init is not enabled because with kfence the linear map is
> mapped using PAGE_SIZE rather than 16M mapping.
> We don't support multiple page sizes for slb entry used for kernel
> linear map in book3s64.
> 
> This patch refactors out the common functions required to detect kfence
> early init is enabled or not.
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/include/asm/kfence.h        |  2 ++
>   arch/powerpc/mm/book3s64/radix_pgtable.c | 12 ------------
>   arch/powerpc/mm/init-common.c            | 12 ++++++++++++
>   3 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
> index fab124ada1c7..5975688d8de1 100644
> --- a/arch/powerpc/include/asm/kfence.h
> +++ b/arch/powerpc/include/asm/kfence.h
> @@ -15,6 +15,8 @@
>   #define ARCH_FUNC_PREFIX "."
>   #endif
> 
> +extern bool kfence_early_init;
> +
>   #ifdef CONFIG_KFENCE
>   extern bool kfence_disabled;
> 
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index b0d927009af8..311e2112d782 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -363,18 +363,6 @@ static int __meminit create_physical_mapping(unsigned long start,
>   }
> 
>   #ifdef CONFIG_KFENCE
> -static bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
> -
> -static int __init parse_kfence_early_init(char *arg)
> -{
> -       int val;
> -
> -       if (get_option(&arg, &val))
> -               kfence_early_init = !!val;
> -       return 0;
> -}
> -early_param("kfence.sample_interval", parse_kfence_early_init);
> -
>   static inline phys_addr_t alloc_kfence_pool(void)
>   {
>          phys_addr_t kfence_pool;
> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
> index 21131b96d209..259821a4db62 100644
> --- a/arch/powerpc/mm/init-common.c
> +++ b/arch/powerpc/mm/init-common.c
> @@ -33,6 +33,18 @@ bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
>   bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
>   #ifdef CONFIG_KFENCE
>   bool __ro_after_init kfence_disabled;
> +bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
> +static int __init parse_kfence_early_init(char *arg)

If I understand correctly, previously it was only for radix, now it is 
for every platform including PPC32 ?

> +{
> +       int val;
> +
> +       if (get_option(&arg, &val))
> +               kfence_early_init = !!val;
> +       return 0;
> +}
> +early_param("kfence.sample_interval", parse_kfence_early_init);
> +#else
> +bool __ro_after_init kfence_early_init;

I don't understand, why do you need that in the #else case ?

>   #endif
> 
>   static int __init parse_nosmep(char *p)
> --
> 2.45.2
> 

