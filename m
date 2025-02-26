Return-Path: <linuxppc-dev+bounces-6502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F5A45FB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 13:50:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2vSt4SjKz30TG;
	Wed, 26 Feb 2025 23:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740574206;
	cv=none; b=am37TXLODr3EfXTlzizTqB/wIExq/TZSuhPFWK/umOtA/6gU1jhuQVxcwu3H+jSVxQo+l1B6RQynpy/f6QpMSB8flqNa5LUc9YbBHACkaakFURC+dQHSgIVfRTHqyVB7sNB1K7PrChP661nWxuRu7p+y7Hpl/JsQvbg5Q8yQ9sPJIaGADqPNeS/LgK8WYCizvjfsSJa6w0P6mYEm7UF/sL1H5KC3Qrn4hbQKY0RCqnNcQ/iwqmwni3weOz6HMhIXMZrZJQkD/VdKAvfeALfDaG0uuSAxLdokOa9gn17wc2OWwOdJSoK/XMYzb/lIMf1TL5ItQDbsRJln13tzCM55cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740574206; c=relaxed/relaxed;
	bh=oRU7li37a1r2GsBKMLO6aQNn3T8XMPS8kHDTCD+o0+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFbpjUeWvb3S92f70AeAqZqqYSHoa5YzFeyvDTLbdzEE8XXFwp9jWiGeumjrAXB0m2bSYOF1E0RDM+W7QW9Zf8kkzPN2l3BGlwT0ZfxICzY+mWSr1tFRJ88ANPjp9apAj7FouT7ml0Gzzr3ZT0I5lCI6d/5+VqLTbAJODOw0SOCobJSMzriANe2biqBi7+/t1UTybCJz10gIZZXU7CR+ylK5onVsKAOgWJuf3zlYsTZLpyFUHQrb2NuhGe+UUH9m/Au/jVIyDza+G0xzge8uQIzQc6luRFuE+cdKwmrLd206HUyhmXeI12aew1ZaN0tJmYd75rd3O75iUl78dUVJsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2vSs5tz4z2yFP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 23:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z2v3t6vSKz9sSN;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPLDBYGk5ZSX; Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z2v3t62h2z9sSL;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BBC958B78B;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ep8JbNxoBOZU; Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 85E558B77C;
	Wed, 26 Feb 2025 13:31:54 +0100 (CET)
Message-ID: <c58f3fef-82a6-43a4-a222-1cc8ab62a93b@csgroup.eu>
Date: Wed, 26 Feb 2025 13:31:54 +0100
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
Subject: Re: [PATCH V3 4/5] mm: Make DEBUG_WX depdendent on GENERIC_PTDUMP
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Steven Price <steven.price@arm.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-5-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250226122404.1927473-5-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 26/02/2025 à 13:24, Anshuman Khandual a écrit :
> DEBUG_WX selects PTDUMP_CORE without even ensuring that the given platform
> implements GENERIC_PTDUMP. This problem has been latent until now, as all
> the platforms subscribing ARCH_HAS_DEBUG_WX also subscribe GENERIC_PTDUMP.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   mm/Kconfig.debug | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index 41a58536531d..a51a1149909a 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -186,6 +186,7 @@ config ARCH_HAS_DEBUG_WX
>   config DEBUG_WX
>   	bool "Warn on W+X mappings at boot"
>   	depends on ARCH_HAS_DEBUG_WX
> +	depends on GENERIC_PTDUMP
>   	depends on MMU
>   	select PTDUMP_CORE
>   	help


