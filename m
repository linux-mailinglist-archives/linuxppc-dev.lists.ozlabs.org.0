Return-Path: <linuxppc-dev+bounces-9251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41641AD3F76
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 18:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGvtP5GqBz3bkP;
	Wed, 11 Jun 2025 02:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749574237;
	cv=none; b=R6NriW/tsCZl2bIyNsv5v2vIDNn69WquiwZuMVn4h5ljx4e8qQtR+usb2O/9TGoryBluz9Gkiyea7zvgDKhqVBCqkPG0S07x91oLUWTruux4X+kWJ09kKg9ALwFTYWmMQDp6QJ+F0Fjjfe8WN+He9hkSadN7FG6y6ErNQlNdYu64vmbmke+PMXe/DcRCjSUou3s+ca0Z/GysH93BVxtxQ0BfX9odfEN0Kpon7Ykupzaw4dL42m06Myfjxc4nSeAU/1gUP3bbUsoSD1dWoR9/SMclTy23sHtEAK3ikLgYsbBIXmjWguyxwEKd2lCzP+YynjmCjxRngxO7zedtgqryCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749574237; c=relaxed/relaxed;
	bh=DyS8bJK4btO+9OSMHPAKg0OT7SbP4SjjxUvQ7Jb1rhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW4LlktSi3uYEI2+RnGC5qaKWtaL6qzQLtJl43cNrnOvxcMsccaSUbgj5w6G0vM+YhWKkIVgYrhxtVlq2Y/423H80iSkW+zDjJgwxz64FodNKT5SGzzu1awyAit3U07nPPQCtAAbDs9rlric/B1qkTJxgoN+AeA1aeawmsdK07HG8E2mvOQhLPohb2/rEgYhIf8aeOsz1cZon1sIwBoKaxGByllP1R9ZPGZ/qcYdiawM3s5WnQv1jOQA4Gf1gg+ZbBXM3un6bZ84OM2ZxDiOFfr++U2corFsIrqwpPg1UDDKaLFLpQKx302nmY1RFgobJR3myL0fkS6YHq98ulMV9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGvtN6wZZz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 02:50:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bGvb74yjgz9sZ2;
	Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpvMo2iatbtY; Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bGvb74DX0z9sYQ;
	Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 89E758B77A;
	Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7X_NwQXE2xj6; Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D4458B76D;
	Tue, 10 Jun 2025 18:37:23 +0200 (CEST)
Message-ID: <88be9850-fa2e-4470-b54c-55b6b8e2dd29@csgroup.eu>
Date: Tue, 10 Jun 2025 18:37:22 +0200
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
Subject: Re: [PATCH v2] (powerpc/512) Fix possible `dma_unmap_single()` on
 uninitialized pointer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Anatolij Gustschin <agust@denx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "open list:LINUX FOR POWERPC EMBEDDED MPC5XXX"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
References: <20250610142918.169540-2-fourier.thomas@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250610142918.169540-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 10/06/2025 à 16:29, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> If the device configuration fails (if `dma_dev->device_config()`),
> `sg_dma_address(&sg)` is not initialized and the jump to `err_dma_prep`
> leads to calling `dma_unmap_single()` on `sg_dma_address(&sg)`.
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> index 9668b052cd4b..f251e0f68262 100644
> --- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> +++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> @@ -240,10 +240,8 @@ static int mpc512x_lpbfifo_kick(void)
>          dma_conf.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> 
>          /* Make DMA channel work with LPB FIFO data register */
> -       if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
> -               ret = -EINVAL;
> -               goto err_dma_prep;
> -       }
> +       if (dma_dev->device_config(lpbfifo.chan, &dma_conf))
> +               return -EINVAL;
> 
>          sg_init_table(&sg, 1);
> 
> --
> 2.43.0
> 


