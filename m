Return-Path: <linuxppc-dev+bounces-3146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D69C6CB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 11:20:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpK740vRDz2yNv;
	Wed, 13 Nov 2024 21:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731493248;
	cv=none; b=ALCuPfizdExy5QFFq0XXBdm4ubvyjcP88SzugUnYz1rWosV4WW2abrckV4jQUXbIqyT0cg1lrUgdEjW5E6PbDrY/pIdf2dG9v74/ilF1stpN9AXaFgtTX+mvLXe6nlsZbTwR2sSRKPiycY6/mS4jcuMYdL97K/jrP0NMr9vczZL6XVQZiaA1eqLV1CB9CP1mmn/tG8r8dh3DGsfT6pi83Q23lhI9VcAx0EcrOr0allz+r/OJo7FmNn8zwmYXEDbF8ptK2W5TFyzDckLa4/9xW7yHH37ktiOEutthMiVMMyYznmkM+kX4iQKg/Rt+6bDqjMa8mqJrrbMnrTrUUz3UQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731493248; c=relaxed/relaxed;
	bh=vUGg883Vi8JqLYcW4L6semwKxPTWsEWg7W/GES8IQF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1MtJah4k/zlk3BDfUA0TqUAIlziujnqDhUg5mFIh6405UBraURj2rGuDcHGtguWf54c5sCyC0LH8RODXtKUXwzRg3wR5BXba6p7N/1wj51V/KgBSZd6OOOUuRq7ykra7zw5GLs4bSZZvNVPn4Aob+AZ4h+yY3lquXinKS2PJS9LiIWrneU5dMhAjVpG7ML6/DK5DPQg62w50wYnOIKwFRq2x6BFlUKKAvn3F6a1wRak/Se9wvHwaUPh1ilBAOwsCLCHrReUiNLu2REgRIZVikWbMdNR+OOSsUK2Bc7O7p2pII8XHB7NDqYBpSR9aW0lI8Nn/MICejAdOCE4fKvafQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpK721mQ0z2xBx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 21:20:45 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XpK6w47Zvz9sSX;
	Wed, 13 Nov 2024 11:20:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNBYsjjOOxZq; Wed, 13 Nov 2024 11:20:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XpK6w3MQmz9sSV;
	Wed, 13 Nov 2024 11:20:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 618348B79F;
	Wed, 13 Nov 2024 11:20:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4OzcVFT7nyHT; Wed, 13 Nov 2024 11:20:40 +0100 (CET)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A15F8B763;
	Wed, 13 Nov 2024 11:20:40 +0100 (CET)
Message-ID: <b4d3084c-aa26-4d35-a330-8ba55589b89e@csgroup.eu>
Date: Wed, 13 Nov 2024 11:20:40 +0100
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
Subject: Re: [PATCH] powerpc/vdso: Remove unused clockmode asm offsets
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241113-vdso-powerpc-asm-offsets-v1-1-3f7e589f090d@linutronix.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241113-vdso-powerpc-asm-offsets-v1-1-3f7e589f090d@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/11/2024 à 09:06, Thomas Weißschuh a écrit :
> These offsets are not used anymore, delete them.
> 
> Fixes: c39b1dcf055d ("powerpc/vdso: Add a page for non-time data")
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> This is based on powerpc/topic/vdso.
> Feel free to fold this change into the original commit.
> ---
>   arch/powerpc/kernel/asm-offsets.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
> index 7b3feb6bc2103bc89ea14fbaac6937f1c97d4ff8..23733282de4d9f975aa9450b26c1049688e6663e 100644
> --- a/arch/powerpc/kernel/asm-offsets.c
> +++ b/arch/powerpc/kernel/asm-offsets.c
> @@ -346,8 +346,6 @@ int main(void)
>   #else
>   	OFFSET(CFG_SYSCALL_MAP32, vdso_arch_data, syscall_map);
>   #endif
> -	OFFSET(VDSO_CLOCKMODE_OFFSET, vdso_arch_data, data[0].clock_mode);
> -	DEFINE(VDSO_CLOCKMODE_TIMENS, VDSO_CLOCKMODE_TIMENS);
>   
>   #ifdef CONFIG_BUG
>   	DEFINE(BUG_ENTRY_SIZE, sizeof(struct bug_entry));
> 
> ---
> base-commit: 0161bd38c24312853ed5ae9a425a1c41c4ac674a
> change-id: 20241113-vdso-powerpc-asm-offsets-056016f80174
> 
> Best regards,

