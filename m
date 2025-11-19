Return-Path: <linuxppc-dev+bounces-14332-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B4C6D601
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 09:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBDvC3k71z3bYG;
	Wed, 19 Nov 2025 19:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763540439;
	cv=none; b=YD1shKFEbuwJZxBNUr/+K0p+VB0FxFwf+bNU284fj/wfZq29AUiUrDtWA+4+essLcm4e3K4+AtyR7ActvqoP8PeKYjShvdM9ZNaUdxFtZs8YmUSnq5rRxO+hSQ4wABoeE/ki3+bVP6u9D0pQyfKQ0SOHAkII3ALccq9tMV8TsdMi877z5RCg9Nlmjv5FPTtpMZqaHyyn35VVg8aCIJq3CY58hUh3AIJf6SpsPxwLLwMzTTUr7mNcHWMp6Mw7oRlSjLPYFzPq4updj5SE0rpoY0I15hDy3bHjWT30wZnFslKd0rrI9/xVsGR7nRsCXPAA+CsvRKmGQxsZqO2wxwYYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763540439; c=relaxed/relaxed;
	bh=yRn3kvz5CM9T4k7FxQb4bgx0SacagOx57vggjyq6WZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OExIB/0Mf8ChCNwK+5OFFRNcPVtXBI1kLKGHzo9li+jWgH4S2REEnJFeZPGJNAQ0FAsddjDe2Tq+MIj5hLTUPRsNoS6i3GmMZxBcfJ7HS77G/zyNUGEeHC7sJtMaT2Rbb9CCppPCqkQipX71OdpfXJSoS+iisfyG1nWkP/AVrjo5Z5henREKCTUHcVTlFSWyKArVbBCZO00ODnqWwctGOCYx+wKpQb4YvN0XjoaLRUuQOh++WmdgtHDw9HLvD0akII0PUwfXKBby/I5JHwSNUIMW+Ny9UE3CoSDENVxMxTg6QdPel2L1KjNnxD48gLYJLcTUSWdHa+TNWASFtXOY2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBDvB2xjfz30Vs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 19:20:37 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4dBDdJ59Zfz9sTS;
	Wed, 19 Nov 2025 09:08:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwbV8kbPMJZv; Wed, 19 Nov 2025 09:08:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4dBDdJ4Lkxz9sTQ;
	Wed, 19 Nov 2025 09:08:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 84B558B76D;
	Wed, 19 Nov 2025 09:08:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8wpvcrvsHyKh; Wed, 19 Nov 2025 09:08:36 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 34CD28B763;
	Wed, 19 Nov 2025 09:08:36 +0100 (CET)
Message-ID: <d6a8c0bc-c9d6-40e8-b2e0-559c7bae3b00@csgroup.eu>
Date: Wed, 19 Nov 2025 09:08:35 +0100
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
Subject: Re: [PATCH V2] ppc64/lv1call: Fix PS3 LV1 clobbering SRR
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 linuxppc-dev@lists.ozlabs.org
Cc: Geoff Levand <geoff@infradead.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20251118.184901.486820791149579338.rene@exactco.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251118.184901.486820791149579338.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 18/11/2025 à 18:49, René Rebe a écrit :
> For a while, likely since 6eaaf9de3599 ("powerpc/64s/interrupt: Check
> and fix srr_valid without crashing") booting a PS3 instantly yields:

Can you confirm the 'likely' ?

checkout 6eaaf9de3599 and confirm the bug is there.
checkout 6eaaf9de3599~ and confirm the bug is not there.

> 
> <4>SRR0 was: c0000000000971b4 should be: c0000000002d55c4
> <4>SRR1 was: 8000000000008032 should be: 8000000000008032
> 
> Fix LV1 HV clobbering SRR by srr_regs_clobbered() each lv1 call.
> Attribute srr_regs_clobbered __always_inline as used by modules.
> 
> Fixes: 6eaaf9de3599 ("powerpc/64s/interrupt: Check and fix srr_valid without crashing")
> Signed-off-by: René Rebe <rene@exactco.de>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> v2: use __always_inline, ppc64, Fixes:
> ---
>   arch/powerpc/include/asm/interrupt.h | 1 +
>   arch/powerpc/include/asm/lv1call.h   | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index eb0e4a20b818..783c6f32a395 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -106,6 +106,6 @@ static inline bool is_implicit_soft_masked(struct pt_regs *regs)
>   	return search_kernel_soft_mask_table(regs->nip);
>   }
>   
> -static inline void srr_regs_clobbered(void)
> +static __always_inline void srr_regs_clobbered(void)
>   {
>   	local_paca->srr_valid = 0;
>   	local_paca->hsrr_valid = 0;
> diff --git a/arch/powerpc/include/asm/lv1call.h b/arch/powerpc/include/asm/lv1call.h
> index ae70120953a8..48dd55a2b72e 100644
> --- a/arch/powerpc/include/asm/lv1call.h
> +++ b/arch/powerpc/include/asm/lv1call.h
> @@ -14,6 +14,7 @@
>   
>   #include <linux/types.h>
>   #include <linux/export.h>
> +#include <asm/interrupt.h>
>   
>   /* lv1 call declaration macros */
>   
> @@ -208,7 +209,7 @@
>   #define LV1_CALL(name, in, out, num)                               \
>     extern s64 _lv1_##name(LV1_##in##_IN_##out##_OUT_ARG_DECL);      \
>     static inline int lv1_##name(LV1_##in##_IN_##out##_OUT_ARG_DECL) \
> -    {return _lv1_##name(LV1_##in##_IN_##out##_OUT_ARGS);}
> +    {srr_regs_clobbered(); return _lv1_##name(LV1_##in##_IN_##out##_OUT_ARGS);}
>   #endif
>   
>   #endif /* !defined(__ASSEMBLER__) */


