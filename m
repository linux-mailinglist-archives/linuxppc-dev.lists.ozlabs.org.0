Return-Path: <linuxppc-dev+bounces-9576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA8AE153C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 09:50:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNqQh0qxNz30Sy;
	Fri, 20 Jun 2025 17:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750405836;
	cv=none; b=BquDRPhf3lGcCwYr9w8qF+nWZQPYuK8s9XV1LCLnnBP+A5tNH1IqLlWRQpn7nRJMct6nEcF/kA00bBhNcPI+E1FsyEc1zVCLCiOM95jap05mtcy/MCEfcDOLJy8ayDSFzmNBOauiW+smFhp3HDJQWrrMiO6SXSplFD8LJwP9xHBdM8hnIUP8OTzKasAehHaiM3KlTGdFknlF38AVgeA+ize7avV/qLp15OwQ/AHd6T3pSdYUUhYvBpyqm+lnYAniYtuapLBU4UhXII7EkgGqgukWxA3LZMjRyzmc6imz++T1wxsMmTXF1osweIdv+hoxbcDIckV8jnWqgqf2vZubiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750405836; c=relaxed/relaxed;
	bh=bRjg2iHjWnJyu86U7ZYSqW3deYAAOecN+FT/NOyDoiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ff+2D44LEsTEx7cp750L1/oucYQEodMx/aZ8xKl3pEwz9Pa37hIcglFyXQgNY9KHlvCtNPsizD64wUmIXXRxAnjl2Ke46onPvkaJ+z5ibC4orCPoLOIWY+6De/Eh0a5UJmluDwFlO78FJ2Fxchv+dzChXfn8qK3CG5eYSkySWwoufTA7zr0N/JereApWSFZxTWQIdgUCeyMYX/VmoxR6ZU6t69bOn/Qpxye+/9NVFxSlwOCwt3dF5wUnJHUCu3SDtBcONIBwm84hApZsPJOSpOfQanXRTniTTjxN6ybf69Un5TNUIljv2sZX1e7+JH/OgWIO0qEXu7+jn652zSQs6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNqQg2lCRz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 17:50:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bNqJ74FjMz9sXD;
	Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZdnK-QQBFf1P; Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bNqJ73VYhz9s28;
	Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 728D58B7AB;
	Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id K4i5McYStysj; Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B2E98B78C;
	Fri, 20 Jun 2025 09:44:55 +0200 (CEST)
Message-ID: <16e789a6-87f4-4f7a-9f13-edf47f9f401f@csgroup.eu>
Date: Fri, 20 Jun 2025 09:44:55 +0200
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
Subject: Re: [PATCH] powerpc: floppy: Add missing checks after DMA map
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250619110739.323202-2-fourier.thomas@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250619110739.323202-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Thomas,

Le 19/06/2025 à 13:07, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The DMA map functions can fail and should be tested for errors.
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>   arch/powerpc/include/asm/floppy.h | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
> index f8ce178b43b7..df8ce2ae636d 100644
> --- a/arch/powerpc/include/asm/floppy.h
> +++ b/arch/powerpc/include/asm/floppy.h
> @@ -144,9 +144,14 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
>                  bus_addr = 0;
>          }
> 
> -       if (!bus_addr)  /* need to map it */
> +       if (!bus_addr) {        /* need to map it */
>                  bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
>                                            dir);
> +               if (dma_mapping_error(&isa_bridge_pcidev->dev, bus_addr)) {
> +                       bus_addr = 0;

bus_addr is a local variable, there is no point in setting it to zero 
here. Just return -ENOMEM.

> +                       return -ENOMEM;
> +               }
> +       }
> 
>          /* remember this one as prev */
>          prev_addr = addr;
> --
> 2.43.0
> 


