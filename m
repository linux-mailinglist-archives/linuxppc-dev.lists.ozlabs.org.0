Return-Path: <linuxppc-dev+bounces-9216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F4219AD194E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 09:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bG3xr3P8Sz2yMD;
	Mon,  9 Jun 2025 17:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749455440;
	cv=none; b=TzFmbf3e7kcAsf6qpIjTNdBzja50FFe3bWEAtLC4Ncy6BdgRS9M8W13jUUe26U2gidWN4BRguV9TTr9/Ufvob4WI5Cy91AWAHgC2Er0Rir69akIbxEaPPNqyHmBbBeaByir0KjiUh6qmA75CBTO9XMiWSb/Pfcg7Wca0Aqi2AkJlLii56mhTb90vpRiySofz1871TlQ1pl7h0VvTBcL4y0f2VZQVxskeOlSO2Ew5UnkLXhn74pG+vhPso77DkKJU+adA2rhsgIfTVGlCoxQpIQY+opHXsVmtZYlH42Q0SExgAG/va2mXQelmIStIRSNbwxY1VWDmkP4OhkpcjDDhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749455440; c=relaxed/relaxed;
	bh=HTKIsX4fwpM/qobHSf4fct7ttz/CxF7GQZ3O/jRI6JY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVLgt1Ah1vV0Fdit0oe2d8EukRmIldVXBC860PqvnCprj2AF1nCha5O7sv4DnmT1bzKpN4n+7OxEaHN44PA4lc/SQIDCfDMwJMCIzU3ItV2cy9jQv5ulVcHGqNqcz9tUGdwX+5CZBalCNgF26WkByzf0VheUDlUfDqNJGcVTcsMHnZMmfzU1dueJUCkZjYyj2orCkta6GPZcJR1whxwfYRQbkTLidDvzJK6WmKATU5wDUGaB/8s/7gBBflRMI/kJz5hwfMmpZi2KEW2nM7GPa8EcsPs0vvC/Dk32cuzOK3kaEXtynNuaNOABeF3/SmQPVjGcKLDKJCEDDipAQf8odA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bG3xq0wnGz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 17:50:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bG3kR1Rjxz9sTD;
	Mon,  9 Jun 2025 09:40:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id StlkMA7BaDrA; Mon,  9 Jun 2025 09:40:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bG3kR0ZZyz9sN6;
	Mon,  9 Jun 2025 09:40:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E72A8B764;
	Mon,  9 Jun 2025 09:40:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id nvfTNSoQtYcj; Mon,  9 Jun 2025 09:40:46 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 92C398B763;
	Mon,  9 Jun 2025 09:40:46 +0200 (CEST)
Message-ID: <fbe9378a-f3f0-4398-b91b-dd3713c0be5e@csgroup.eu>
Date: Mon, 9 Jun 2025 09:40:46 +0200
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
Subject: Re: [PATCH] (powerpc/512) Fix possible `dma_unmap_single()` on
 uninitialized pointer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Anatolij Gustschin <agust@denx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "open list:LINUX FOR POWERPC EMBEDDED MPC5XXX"
 <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
References: <20250605163717.18020-1-fourier.thomas@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250605163717.18020-1-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/06/2025 à 18:37, Thomas Fourier a écrit :
> [Vous ne recevez pas souvent de courriers de fourier.thomas@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> If the device configuration fails (if `dma_dev->device_config()`),
> `sg_dma_address(&sg)` is not initialized and the jump to `err_dma_prep`
> leads to calling `dma_unmap_single()` on `sg_dma_address(&sg)`.
> 
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>   arch/powerpc/platforms/512x/mpc512x_lpbfifo.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> index 9668b052cd4b..ef3be438f914 100644
> --- a/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> +++ b/arch/powerpc/platforms/512x/mpc512x_lpbfifo.c
> @@ -241,8 +241,7 @@ static int mpc512x_lpbfifo_kick(void)
> 
>          /* Make DMA channel work with LPB FIFO data register */
>          if (dma_dev->device_config(lpbfifo.chan, &dma_conf)) {
> -               ret = -EINVAL;
> -               goto err_dma_prep;
> +               return -EINVAL;
>          }

You should remove the { } as it is now a single line.

> 
>          sg_init_table(&sg, 1);
> --
> 2.43.0
> 


