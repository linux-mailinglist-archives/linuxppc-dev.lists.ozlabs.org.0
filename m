Return-Path: <linuxppc-dev+bounces-13975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C9EC43B94
	for <lists+linuxppc-dev@lfdr.de>; Sun, 09 Nov 2025 11:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d482H2pRDz2yjr;
	Sun,  9 Nov 2025 21:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762683639;
	cv=none; b=c/aKk1fMg5NaagpzZTQEoos07MIpcmPCx9pGK9bYuo2x2qUFBZ9gT0fpSE+QF58PG/ByIHnf6nTWH/jJ4W1ei9U93jC7ek3PdlfxgSswjdz/TUn/825cTtpi3zgnPaKWYcSChI3GWAcGfkckLqy3KECYMY8z9dii4JTp4vQKTSLwAcX1nMOb+yFtwYEkhVI8FEpu3840JBEV9m2A4SKxYqFEnrGKgUNdGxZ+OhRQ0u06mLfO1nhy7yMAdL4h3m7i3iOC0RkrsMsqLWkRBZj/dDkH9FkjrIeiVAJxw7NJAFWDbU7Rhkn4dU2a034rMcMf+Ix4zNO8vdS8O6NBsiq5hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762683639; c=relaxed/relaxed;
	bh=EH6Ri/twJaKWm9tXRBm88oxRjrvHxqIC2sV+ciGM8VA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAFL1D5hz6eqmOa8kequ9KGKoRczZ6oQxZmbBQDFavHfAhH4eqSaIkcwuzkDivxKE/sT5R+BWzF1L/gjGtIUYkOrhpL5sno1mZ0uiHTkBXnUVTv86H6ZbDfKYGqmb8Ye229X1bPF4PGArCp4N1P3+btc3hIKO/kfYI2mCtWBjqODlzS9129nbEUOfJrgTIUNT67uhTJDDvvhqJVH9ZUYZsVmR+HNT2kyYCfTY1twhoTRfaHx0or45RU3+m7Er3vlwzVq+DBzH5kmS9XZTdNAay4G6Gu0pujRU0BYkjn88uycQ4WYWmOzOTeHaDOaQHoOtX1tv3rq66KeTpM3DpdbJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d482G26NSz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 21:20:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d47Jy2P0lz9sSH;
	Sun,  9 Nov 2025 10:48:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4g6UDkaIzWZF; Sun,  9 Nov 2025 10:48:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d47Jy1C6Vz9sS7;
	Sun,  9 Nov 2025 10:48:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 180918B764;
	Sun,  9 Nov 2025 10:48:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kQzC0qppv8Je; Sun,  9 Nov 2025 10:48:17 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F75F8B763;
	Sun,  9 Nov 2025 10:48:17 +0100 (CET)
Message-ID: <a7d9feaa-3a52-4c72-be56-6757e75af2ac@csgroup.eu>
Date: Sun, 9 Nov 2025 10:48:17 +0100
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
Subject: Re: [PATCH] powerpc: Use relocated font data pointer for
 btext_drawchar()
To: Finn Thain <fthain@linux-m68k.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: Cedar Maxwell <cedarmaxwell@mac.com>, Stan Johnson <userm57@yahoo.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <d941a3221695e836963c8f9cb5fbb61e202bad0c.1762648546.git.fthain@linux-m68k.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <d941a3221695e836963c8f9cb5fbb61e202bad0c.1762648546.git.fthain@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 09/11/2025 à 01:35, Finn Thain a écrit :
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Since Linux v6.7, booting using BootX on an Old World PowerMac produces
> an early crash. Stan Johnson writes, "the symptoms are that the screen
> goes blank and the backlight stays on, and the system freezes (Linux
> doesn't boot)."
> Further testing revealed that the failure can be avoided by disabling
> CONFIG_BOOTX_TEXT. Bisection revealed that the regression was caused by
> a patch which replaced the static btext font data with const data in a
> different compilation unit. To fix this, access the font data at its
> relocated address.

You can explain that characters start being displayed by bootx_init() 
which is call very early in the boot before kernel text is relocated to 
its final location. During that period, data is addressed with an offset 
which is added to the Global Offset Table (GOT) entries at the start of 
bootx_init() by fonction reloc_got2(). But the pointers that are located 
inside a structure are not referenced in the GOT and are therefore not 
updated by reloc_got2(). It is therefore needed to apply the offset 
manually by using PTRRELOC() macro.

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
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> 
> ---
> 
> Christophe, as you're the author of this patch, this submission will
> probably need your sign-off.

I only suggested it, you authored the patch. Add me as:

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> 
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


