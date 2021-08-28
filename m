Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD03FA4C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 11:35:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GxWdp2G93z3c4q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 19:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GxWdM4hrLz2xsd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 19:34:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GxWd82X9zz9sVx;
 Sat, 28 Aug 2021 11:34:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epkXE21tj-In; Sat, 28 Aug 2021 11:34:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GxWd81P7Yz9sVv;
 Sat, 28 Aug 2021 11:34:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 042598B76D;
 Sat, 28 Aug 2021 11:34:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9mizTOnhlUn1; Sat, 28 Aug 2021 11:34:35 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C00488B763;
 Sat, 28 Aug 2021 11:34:35 +0200 (CEST)
Subject: Re: [RFC PATCH 4/6] powerpc/64s: Make hash MMU code build configurable
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210827163410.1177154-1-npiggin@gmail.com>
 <20210827163410.1177154-5-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3b419b53-02b8-1a52-2f22-7b8ca49c4460@csgroup.eu>
Date: Sat, 28 Aug 2021 11:34:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827163410.1177154-5-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/08/2021 à 18:34, Nicholas Piggin a écrit :
> Introduce a new option CONFIG_PPC_64S_HASH_MMU which allows the 64s hash
> MMU code to be compiled out if radix is selected and the minimum
> supported CPU type is POWER9 or higher, and KVM is not selected.
> 
> This saves 128kB kernel image size (90kB text) on powernv_defconfig
> minus KVM, 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

...

> @@ -324,6 +330,7 @@ static inline void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
>   }
>   #endif /* !CONFIG_DEBUG_VM */
>   
> +#if defined(CONFIG_PPC_RADIX_MMU) && defined(CONFIG_PPC_64S_HASH_MMU)
>   static inline bool radix_enabled(void)
>   {
>   	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
> @@ -333,6 +340,27 @@ static inline bool early_radix_enabled(void)
>   {
>   	return early_mmu_has_feature(MMU_FTR_TYPE_RADIX);
>   }
> +#elif defined(CONFIG_PPC_64S_HASH_MMU)
> +static inline bool radix_enabled(void)
> +{
> +	return false;
> +}
> +
> +static inline bool early_radix_enabled(void)
> +{
> +	return false;
> +}
> +#else
> +static inline bool radix_enabled(void)
> +{
> +	return true;
> +}
> +
> +static inline bool early_radix_enabled(void)
> +{
> +	return true;
> +}
> +#endif

You don't need something that complex. You don't need to change that at all indeed, just have to 
ensure that when CONFIG_PPC_64S_HASH_MMU is not selected you have MMU_FTR_TYPE_RADIX included in 
MMU_FTRS_ALWAYS and voila.

>   
>   #ifdef CONFIG_STRICT_KERNEL_RWX
>   static inline bool strict_kernel_rwx_enabled(void)
