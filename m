Return-Path: <linuxppc-dev+bounces-14122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD69C52147
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 12:50:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d61tm1MsHz2yvJ;
	Wed, 12 Nov 2025 22:50:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762948240;
	cv=none; b=WS9iQTN+KqZV4wLWNzZgn9olwel1xUDB2fbZqMCDbpokSovPYvYK0VdG3nv+3aBv4ZlAUZvQbwYTc5cEwa0zR8KhRfmIyj6ehEhAjS46KsE+XDT4HIprF0u3kCzHqXD8HUUS8VQfO0UE4RPH4eFngQfEENREKjwSs2dw2R6cgof3bVvgPG7zMNDm9yZMaZP+jVl7dGbJr49CWXqXeHu9/qgut9LhoqTVn2C36x3DMPE32VmFxamsKY6q0WSyJG8S6KnXLUHGsEw/5b/BHNQSNvppwUkwjDiFL6e+ZUZDWjYIoFOwqRoaWQasxTdR4YSzDKolh6awtbOdElQzpcRm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762948240; c=relaxed/relaxed;
	bh=H0Tq1iUotRHqEFPqSLA/jUPiK1QKG7kUEyazu6tON3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ac2yz5f8fgPjtGEKrqEAne421ifvUcfYk4yX7PPoLsTL8n2p4yzlSx8z3aA8KFXSuMK3VRAG33h+NXO/3hR1SXzcq0ZmvP/vX1bg6xwCEi4orL2nu+Z6IGL71R6Jh/e4tVxHb69yNc6pyXb8cAdAe8LMJblpReYSQMlnxPCxBKKCiynL7UgvzlPDeMq9yh7uIkvdo8N06O8P+ZFSWQUnhrg/IY9UfXr+KNfEEfhLsT72gAuC5jKWMzJYX3BwboGUHC1DSBC+cSVS6RbQYEbwW2iJLZy5nuWAAE8KJ5fiSjduOsyoKphJeCRE6KiNJrKepyTMCxlRgcnRGmGZdrbkdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d61tl1LLxz2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 22:50:37 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d61cs3rYsz9sSq;
	Wed, 12 Nov 2025 12:38:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voSrOTdFTJ_x; Wed, 12 Nov 2025 12:38:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d61cs2xwkz9sSj;
	Wed, 12 Nov 2025 12:38:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 50FA38B76E;
	Wed, 12 Nov 2025 12:38:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WkvsJ7_-3Y7V; Wed, 12 Nov 2025 12:38:37 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AD9A08B764;
	Wed, 12 Nov 2025 12:38:36 +0100 (CET)
Message-ID: <697723f8-ab0b-4cc4-9e83-ea710f62951a@csgroup.eu>
Date: Wed, 12 Nov 2025 12:38:36 +0100
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
Subject: Re: [PATCH v2] powerpc: Add reloc_offset() to font bitmap pointer
 used for bootx_printf()
To: Finn Thain <fthain@linux-m68k.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Cedar Maxwell <cedarmaxwell@mac.com>, Stan Johnson <userm57@yahoo.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <22b3b247425a052b079ab84da926706b3702c2c7.1762731022.git.fthain@linux-m68k.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <22b3b247425a052b079ab84da926706b3702c2c7.1762731022.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 10/11/2025 à 00:30, Finn Thain a écrit :
> Since Linux v6.7, booting using BootX on an Old World PowerMac produces
> an early crash. Stan Johnson writes, "the symptoms are that the screen
> goes blank and the backlight stays on, and the system freezes (Linux
> doesn't boot)."
> 
> Further testing revealed that the failure can be avoided by disabling
> CONFIG_BOOTX_TEXT. Bisection revealed that the regression was caused by
> a change to the font bitmap pointer that's used when btext_init() begins
> painting characters on the display, early in the boot process.
> 
> Christophe Leroy explains, "before kernel text is relocated to its final
> location ... data is addressed with an offset which is added to the
> Global Offset Table (GOT) entries at the start of bootx_init()
> by function reloc_got2(). But the pointers that are located inside a
> structure are not referenced in the GOT and are therefore not updated by
> reloc_got2(). It is therefore needed to apply the offset manually by using
> PTRRELOC() macro."
> 
> Cc: Cedar Maxwell <cedarmaxwell@mac.com>
> Cc: Stan Johnson <userm57@yahoo.com>
> Cc: "Dr. David Alan Gilbert" <linux@treblig.org>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: stable@vger.kernel.org
> Link: https://lists.debian.org/debian-powerpc/2025/10/msg00111.html
> Link: https://lore.kernel.org/linuxppc-dev/d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com/
> Reported-by: Cedar Maxwell <cedarmaxwell@mac.com>
> Closes: https://lists.debian.org/debian-powerpc/2025/09/msg00031.html
> Bisected-by: Stan Johnson <userm57@yahoo.com>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Fixes: 0ebc7feae79a ("powerpc: Use shared font data")
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> Changed since v1:
>   - Improved commit log entry to better explain the need for PTRRELOC().
> ---
>   arch/powerpc/kernel/btext.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
> index 7f63f1cdc6c3..ca00c4824e31 100644
> --- a/arch/powerpc/kernel/btext.c
> +++ b/arch/powerpc/kernel/btext.c
> @@ -20,6 +20,7 @@
>   #include <asm/io.h>
>   #include <asm/processor.h>
>   #include <asm/udbg.h>
> +#include <asm/setup.h>
>   
>   #define NO_SCROLL
>   
> @@ -463,7 +464,7 @@ static noinline void draw_byte(unsigned char c, long locX, long locY)
>   {
>   	unsigned char *base	= calc_base(locX << 3, locY << 4);
>   	unsigned int font_index = c * 16;
> -	const unsigned char *font	= font_sun_8x16.data + font_index;
> +	const unsigned char *font = PTRRELOC(font_sun_8x16.data) + font_index;
>   	int rb			= dispDeviceRowBytes;
>   
>   	rmci_maybe_on();


