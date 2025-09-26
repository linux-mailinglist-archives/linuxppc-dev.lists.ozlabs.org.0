Return-Path: <linuxppc-dev+bounces-12589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38608BA302F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Sep 2025 10:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cY46p2HdTz3cYP;
	Fri, 26 Sep 2025 18:50:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758876642;
	cv=none; b=dM2UXhYT5+2mvmmfZWWjsp7l70iGFxUUYFSGl8lR1bBsMcbShQ10jCxyDD2VfuCXem2PiWqkygPQ+Z5VGNVEmgXS1KuRXq0q6iQB5o+waLASvkXGufcmdnxDsDLuy6kZ0XM5nzSZB3Hlb/oEB5QZuNddwKkec9iRBz7lHKRTwX8TdvhU+njsxlxcwQRD2bu5KUhuGP7nJN5U7QWSZKyVy08lq7KHxct6Igy/tGljrLJ+9aRhXOoEIJbTaG3qeEeXa958HFkeQ6NQ5CulnaS/A8+N2+o/vE+2h97Xn2OzFNbS2gv2JFjzz7ZXzAGPUDLnXDAFePeAC1Xj9z9C3dydow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758876642; c=relaxed/relaxed;
	bh=f3O+Q4E0Zuldt2f3pzW4lgAPXT0RSmgGBsq+ZQ8X9vI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZHKxqOgmcun8IHl/j/RpjJYwRJNtzhNdYE6ftpyJOCx+ZZfWukoUdvGnhGJvfiwwLYwCFSC0hHPpDK1u5VVt9XeIgkOhBLfRrlq/XVs1YbJXAQhc5lS89pbEORfQWlYoWaJU6RWevgG68hV4goVV6IFZFxZxCLeYJvphg/9v/NtdpmGR22SMnmU1rV3fEYnxctT37Tx+D2lrBC8bQSKSI3TJ7RyG3rw0vAVblHiZbGbdh0SknIZHI6BQmlELVod935qXcC+spW2pA3YTd4Coc55YwsIEsuKYI01jLivjKkYAxnLGtQlcWQmRjH0PVEZMbv5IB/iY1d4FDpHkk48ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cY46n5fWcz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 18:50:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cY3d01yVxz9sS7;
	Fri, 26 Sep 2025 10:28:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FW7tiURCBRKs; Fri, 26 Sep 2025 10:28:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cY3d01DRwz9sRy;
	Fri, 26 Sep 2025 10:28:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 174F98B779;
	Fri, 26 Sep 2025 10:28:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FTyBMc6SdSsM; Fri, 26 Sep 2025 10:28:20 +0200 (CEST)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 964128B768;
	Fri, 26 Sep 2025 10:28:18 +0200 (CEST)
Message-ID: <e9e538bd-644b-4c02-bf14-6f5d397554c1@csgroup.eu>
Date: Fri, 26 Sep 2025 10:28:17 +0200
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
Subject: Re: [PATCH 1/2] powerpc/powermac: Include linux/of.h in backlight.c
To: Nathan Chancellor <nathan@kernel.org>, Lee Jones <lee@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Thompson <danielt@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, linuxppc-dev@lists.ozlabs.org,
 patches@lists.linux.dev
References: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-0-d256858d86a6@kernel.org>
 <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-1-d256858d86a6@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250925-ppc-fixes-for-backlight-fb-h-removal-v1-1-d256858d86a6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 26/09/2025 à 01:46, Nathan Chancellor a écrit :
> After the recent removal of the fb.h include from backlight.h, which
> transitively included of.h, there are several errors in the powermac backlight
> driver:
> 
>    arch/powerpc/platforms/powermac/backlight.c: In function 'pmac_has_backlight_type':
>    arch/powerpc/platforms/powermac/backlight.c:59:39: error: implicit declaration of function 'of_find_node_by_name'; did you mean 'bus_find_device_by_name'? [-Wimplicit-function-declaration]
>       59 |         struct device_node* bk_node = of_find_node_by_name(NULL, "backlight");
>          |                                       ^~~~~~~~~~~~~~~~~~~~
>          |                                       bus_find_device_by_name
>    arch/powerpc/platforms/powermac/backlight.c:59:39: error: initialization of 'struct device_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>    arch/powerpc/platforms/powermac/backlight.c:60:17: error: implicit declaration of function 'of_property_match_string' [-Wimplicit-function-declaration]
>       60 |         int i = of_property_match_string(bk_node, "backlight-control", type);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>    arch/powerpc/platforms/powermac/backlight.c:62:9: error: implicit declaration of function 'of_node_put' [-Wimplicit-function-declaration]
>       62 |         of_node_put(bk_node);
>          |         ^~~~~~~~~~~
> 
> Explicitly include of.h to resolve the errors.
> 
> Fixes: 9f218f9bb9d2 ("backlight: Do not include <linux/fb.h> in header file")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/platforms/powermac/backlight.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
> index 79741370c40c..9afb64723649 100644
> --- a/arch/powerpc/platforms/powermac/backlight.c
> +++ b/arch/powerpc/platforms/powermac/backlight.c
> @@ -14,6 +14,7 @@
>   #include <linux/pmu.h>
>   #include <linux/atomic.h>
>   #include <linux/export.h>
> +#include <linux/of.h>
>   #include <asm/backlight.h>
>   
>   #define OLD_BACKLIGHT_MAX 15
> 


