Return-Path: <linuxppc-dev+bounces-9583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC4AE1842
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 11:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNt5C5086z2yf3;
	Fri, 20 Jun 2025 19:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750413039;
	cv=none; b=jzx39c34PAzQ/Kofrq9ASg8zHdk0OsWIgH1ItzSKWpapor4Fzgdb1JEP8SO7SG8TIRw9SWcVChsKUDseirumuaWhoQoCjNXGWzbeT8QEre/tD74e7ejreC9YlIDRgmJM+gDyRMjxZLi3UATwkAoS2x7xF2feeat8jM5JqhaA3i64xRsKMvl/r3icZqsw6Vn3QMFAduZ/n1LfqY/vNZ390AKYx33fvr2cjrWIOqLbhfjn48PR0Cdud5m344lI9D8hVEmbIykzmZI0Hu7tf6OL7v2hCfwO1f/FLf+pztcQq1/zcAhM5181BrdPaZVSF+YwE4EbwtehAINwCzo0xqiVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750413039; c=relaxed/relaxed;
	bh=TzYJ5t2GNBRpWVOXtOf85un4JSvK5GMnNYeCxEJE40o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=E5fIZ1PuHJ0L+JMXVsEANh9Dr+dA/cJ2Bzn23dqM0yC78fLvQDtt8XIEkS9lU+BqP+XTMg/14bv8qcoceKvjPDpneO7eQrmOwn4S8gTQ/QN9f8Zkzlo7bINf/03YggmF7/R0VnBuhrUxEz62miOT++l9BiHwAQ3GPji05X24JhKtAQTV4GLk/2Ul+ZEM54CKla6jQwnlMj6coqPtVfdotb87e7F93ydNIHnOV8dl9xNlRgQmKoieCYcfwPiSVgcTzoxb95b1qv/7stUUpCnCzU5D2c+rK81aoyDAcj6Yj7scSCcLiJn3wevU2R88yZllxG8+gPPmlaVq/iwu0SuzGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNt5B73zbz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 19:50:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bNqbG1LWXz9sXD;
	Fri, 20 Jun 2025 09:58:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7-jiY9UMb34; Fri, 20 Jun 2025 09:58:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bNqbF6z05z9sB2;
	Fri, 20 Jun 2025 09:58:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA9AF8B7AB;
	Fri, 20 Jun 2025 09:58:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DbI3ugSJkLSZ; Fri, 20 Jun 2025 09:58:01 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B36DA8B78C;
	Fri, 20 Jun 2025 09:58:01 +0200 (CEST)
Message-ID: <430ad145-33f7-45b5-8fbd-4b0e2e0a2398@csgroup.eu>
Date: Fri, 20 Jun 2025 09:58:01 +0200
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: floppy: Add missing checks after DMA map
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250620075602.12575-1-fourier.thomas@gmail.com>
Content-Language: fr-FR
In-Reply-To: <20250620075602.12575-1-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 20/06/2025 à 09:55, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> The DMA map functions can fail and should be tested for errors.
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/include/asm/floppy.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
> index f8ce178b43b7..34abf8bea2cc 100644
> --- a/arch/powerpc/include/asm/floppy.h
> +++ b/arch/powerpc/include/asm/floppy.h
> @@ -144,9 +144,12 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
>                  bus_addr = 0;
>          }
> 
> -       if (!bus_addr)  /* need to map it */
> +       if (!bus_addr) {        /* need to map it */
>                  bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
>                                            dir);
> +               if (dma_mapping_error(&isa_bridge_pcidev->dev, bus_addr))
> +                       return -ENOMEM;
> +       }
> 
>          /* remember this one as prev */
>          prev_addr = addr;
> --
> 2.43.0
> 


