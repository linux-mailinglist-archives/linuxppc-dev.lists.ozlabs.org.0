Return-Path: <linuxppc-dev+bounces-614-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E9B960DD1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 16:42:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtVcZ385Vz2yGl;
	Wed, 28 Aug 2024 00:42:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724769726;
	cv=none; b=liwIY4fCEkURoRNwdy8gEZJjbF8ALLDNgx3u31M3oWnTzVd+tgcq5BuPKskzcIej8E6TMy/NUgg0QRYnnhk9huP3rslCJQrkH2hIl1wsUIWty5f5z7ZSIoLLNIwblPcDt1YuuKR1qgme2uz3WAeHwcLUwjo1nQev6SiawZ4MIrXG4UJWPvU6MwjWn7NyWlGlUFVuQuagsBGCelspSjP8CyD69hEB3sxeKVAXJNru2ptWgQjLEB82AkFUZhTE4nzb9tv+5Z+uOXlUiyUJGC6YL5S1Vtenv6xfLBynIHP4cWPvJi9AAz9voc8F9/XdgoGC1oNSbzYj04EnDMSUsdVFdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724769726; c=relaxed/relaxed;
	bh=NZQ0WMHaSTc1iLD0onSzH6EKOf9SqD/iSJ4dOZRC+gU=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=GPAQTRaAcyJ31Cs8dXVwI+hH6PzefXRJmSTUbtS5Py6lPzFLM8ftT3MhX/mTRX8b49tDWas4jWfOXJZ9Tp33YKhVlRPnExXr0xdrLtCwCNR+wAZrL/pTSBAU75fuyckDpJw6LxAs47B6ELLdxjaca6cwRVs2Xec60cj+X/KJ67XT/owxhgOZGHAklKpeEYurgudhAVUz/sm0oyxjtuZUM1zfn8pNBZU+YgR2CiDCOIX45Vfasz5cmaNZg8eoCZ34vxXkwyaOJX8t5JolCqmHCweJe1IPUUJAKwSBUNn4g0CN1qnHJzU96RvVeGxUi5hPq6nZu6nbR8V8VS3bFD3ccg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtVcZ0bFdz2xf2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 00:42:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WtVcS5397z9sRs;
	Tue, 27 Aug 2024 16:42:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pyq3pxAlDZdH; Tue, 27 Aug 2024 16:42:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WtVcS4H0Lz9sPd;
	Tue, 27 Aug 2024 16:42:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 81D6B8B78B;
	Tue, 27 Aug 2024 16:42:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tqk1wcVf39yh; Tue, 27 Aug 2024 16:42:00 +0200 (CEST)
Received: from [192.168.233.149] (unknown [192.168.233.149])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3397F8B77C;
	Tue, 27 Aug 2024 16:42:00 +0200 (CEST)
Message-ID: <a09687b8-184c-40bf-bf5f-b9639dd6d136@csgroup.eu>
Date: Tue, 27 Aug 2024 16:41:59 +0200
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
Subject: Re: [PATCH] powerpc: Use printk instead of WARN in change_memory_attr
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
References: <e2fcabe78795552264f045bd224f83609903708f.1724749026.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <e2fcabe78795552264f045bd224f83609903708f.1724749026.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 27/08/2024 à 11:12, Ritesh Harjani (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Use pr_warn_once instead of WARN_ON_ONCE as discussed here [1]
> for printing possible use of set_memory_* on linear map on Hash.
> 
> [1]: https://lore.kernel.org/all/877cc2fpi2.fsf@mail.lhotse/#t
> 
> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> ---
>   arch/powerpc/mm/pageattr.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index ac22bf28086f..c8c2d664c6f3 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -94,8 +94,11 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>          if (!radix_enabled()) {
>                  int region = get_region_id(addr);
> 
> -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> +               if (region != VMALLOC_REGION_ID && region != IO_REGION_ID) {
> +                       pr_warn_once("%s: possible use of set_memory_* on linear map on Hash from (%ps)\n",
> +                                       __func__, __builtin_return_address(0));

Is it really only linear map ?

What about "possible user of set_memory_* outside of vmalloc or io region.

Maybe a show_stack() would also be worth it ?


But in principle I think it would be better to keep the WARN_ONCE until 
we can add __must_check to set_memory_xxx() functions to be sure all 
callers check the result, as mandated by 
https://github.com/KSPP/linux/issues/7

Christophe

