Return-Path: <linuxppc-dev+bounces-12588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7524BA302C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 10:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cY46k2XSGz303y;
	Fri, 26 Sep 2025 18:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758876638;
	cv=none; b=HtgvUYUifvNNt+734nfdnhDVWweMUYiyADhLRqcGO0ZQ0h6jMjEBNObRO9LwBJsG+5dqzQmz3s9jbnMsHQqzYg56ZQnMRSZjMLLRVNoTFA24fWfmp51wchvB/x8l43PYhhRiPVHOBIqk6F1AVcax4jZqX6pNe0Zb6us5lvFh32OHCeXcXSLLDbkY3AGTZ3imQaa+ZDBeNA/pWDX521tCYL1Hg7pZc074SGS7bmt2WZsEQ3XwMEuPsewfVZgV8+EillRNld4W6Dad5rPTHyMi6a5pHiDud5vk+Bg60fM7di5jZN+pSEYMlBj/W2ghccPCA6u6UJEN8MMY6QPjA8INMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758876638; c=relaxed/relaxed;
	bh=6G6V8vkM67BXSDC43Cu+XLCghX9NLZzHpjDLXG+kSEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXr1pXV2n8J0MwkqaF6ArLBnO5fxaPWurdGs9aX7dS+VGNgtp/KKZ4Uu1AiBA6o+iycCvncfle6IxM50ge3E+/vuQVkfILu02XMarIHCfyMUvDkcIdx5L0yaNpXPkz/FYryXUYhJwPf5qPmOBERBkUKT3W7To5cYJ1v3HK723ijBLruMpNHSJZ1rLgtEkfY6OxWpPJHj8Z7Y9+g2Dke2MxiONHoMDOpa8ZhryCLdogI0UuGjAJQbfLWhOoJlth2EGY9knsIk4buWU88IG1TTnXXnqBAzDJGYGx08L7UFOhT03sMyPhFbf9MyT2P+p0t7WTg85UHGrvEO15SZUjLGdQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cY46j3Mp2z2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 18:50:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cY3ds3pnFz9sSK;
	Fri, 26 Sep 2025 10:29:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpyn6YKZcwFS; Fri, 26 Sep 2025 10:29:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cY3ds370mz9sSH;
	Fri, 26 Sep 2025 10:29:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B93D8B77A;
	Fri, 26 Sep 2025 10:29:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id E9phddn9wLTH; Fri, 26 Sep 2025 10:29:05 +0200 (CEST)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DCC558B779;
	Fri, 26 Sep 2025 10:29:03 +0200 (CEST)
Message-ID: <8e49e321-f6bc-4cb8-9c71-5c6229e1dc5c@csgroup.eu>
Date: Fri, 26 Sep 2025 10:29:03 +0200
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
Subject: Re: [PATCH 2/2] macintosh/via-pmu-backlight: Include linux/of.h and
 uapi/linux/fb.h
To: Nathan Chancellor <nathan@kernel.org>, Lee Jones <lee@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Thompson <danielt@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, linuxppc-dev@lists.ozlabs.org,
 patches@lists.linux.dev
References: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
 <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-2-d256858d86a6@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-2-d256858d86a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 26/09/2025 à 01:46, Nathan Chancellor a écrit :
> After the recent removal of the fb.h include from backlight.h, which
> transitively included of.h, there are several errors from
> via-pmu-backlight.c (errors from bl_curve not being properly defined
> omitted):
> 
>    drivers/macintosh/via-pmu-backlight.c:22:20: error: 'FB_BACKLIGHT_LEVELS' undeclared here (not in a function)
>       22 | static u8 bl_curve[FB_BACKLIGHT_LEVELS];
>          |                    ^~~~~~~~~~~~~~~~~~~
>    drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_get_level_brightness':
>    drivers/macintosh/via-pmu-backlight.c:63:38: error: 'FB_BACKLIGHT_MAX' undeclared (first use in this function); did you mean 'BACKLIGHT_RAW'?
>       63 |         pmulevel = bl_curve[level] * FB_BACKLIGHT_MAX / MAX_PMU_LEVEL;
>          |                                      ^~~~~~~~~~~~~~~~
>          |                                      BACKLIGHT_RAW
>    drivers/macintosh/via-pmu-backlight.c: In function 'pmu_backlight_init':
>    drivers/macintosh/via-pmu-backlight.c:144:17: error: implicit declaration of function 'of_machine_is_compatible' [-Wimplicit-function-declaration]
>      144 |                 of_machine_is_compatible("AAPL,3400/2400") ||
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> FB_BACKLIGHT_{LEVELS,MAX} are available from the userspace API fb.h so
> just include that avoid dragging in the full fb.h header unnecessarily.
> Include linux/of.h for of_machine_is_compatible().
> 
> Fixes: 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header file")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/macintosh/via-pmu-backlight.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/macintosh/via-pmu-backlight.c b/drivers/macintosh/via-pmu-backlight.c
> index 26bd9ed5e664..f7b7853b3802 100644
> --- a/drivers/macintosh/via-pmu-backlight.c
> +++ b/drivers/macintosh/via-pmu-backlight.c
> @@ -11,7 +11,9 @@
>   #include <asm/ptrace.h>
>   #include <linux/adb.h>
>   #include <linux/backlight.h>
> +#include <linux/of.h>
>   #include <linux/pmu.h>
> +#include <uapi/linux/fb.h>
>   #include <asm/backlight.h>
>   
>   #define MAX_PMU_LEVEL 0xFF
> 


