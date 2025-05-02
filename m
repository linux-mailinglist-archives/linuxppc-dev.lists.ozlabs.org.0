Return-Path: <linuxppc-dev+bounces-8245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F4010AA6CED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 10:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpl4c4qRjz2xl6;
	Fri,  2 May 2025 18:50:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746175840;
	cv=none; b=mNFJh2Q+cwjFP9GeOAeLJapU9k1UIJF6ZKoRZC8TNJNruHfx0ZORdN/UejWeuwC1+NJWw0ejaheySa//Paz//Toh4Jc22YuDr/V6b3JepGScpEDOatJL7QYkp7O9aODXy/TRNU3nb0nx+gZONFzZbZOd+6IWZHAXhCkaeoRhx4cAxFb/cduw14lsKa/ZLvX3qBfzWcpl2VffT9oWO9WVCHFvjOC51wa17KGlXEG+gCOb4B3nxZxbmgUjdF/QH4Si35KY4UZR+BOJqZ8FYcXbyUrJs2iK1wy23+k+/Yzamqqvva71TbyBHKHtCHztSJPK5TjNETD9fuJrhvJs/5dErA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746175840; c=relaxed/relaxed;
	bh=XigdGA15M7v/LD4+EwqqXZwB7RNjvygbPDcVBfVkgbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbLUIqW5S87Bf0c8jUyKWIiJJYjN5IsX8t9yydh46YTxJtmdg9iOERAUB7UO4U+0Y7vOaDeJpAA+zTWJMb6OfQMpIHnpHYSr1Bl+Hv4E0d1pnv6JWE3ciOjx0eT5/hqtM4en0DWorN+0uHTwl5Y6h5+9oGJHcAaI/2dsBQX8Uwh5FLpafCp5fZQ68sHR65T+Qo+ApI47LWKodbwpMQhmHMqcyBKXaMpDMhoRq0CIG/E4CH0y7THZq6qcBTgrJwzgdgCDNnEwpC0vHMf5mM11UyTSZaApzhKKUJ0+iI6vYFQfIoNhebnRMvxqiZVTeGadNiNtmIG9Flx171sznIYXng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpl4b4q3Lz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 18:50:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zpkmt4f6Bz9sHR;
	Fri,  2 May 2025 10:37:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dqorby3kjTm; Fri,  2 May 2025 10:37:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zpkmt3wB0z9sFT;
	Fri,  2 May 2025 10:37:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 80DB28B765;
	Fri,  2 May 2025 10:37:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id irIy3YzPPw7A; Fri,  2 May 2025 10:37:02 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0AAAD8B763;
	Fri,  2 May 2025 10:37:02 +0200 (CEST)
Message-ID: <35d38a98-7f5c-413d-9c93-7d9ff783b8a7@csgroup.eu>
Date: Fri, 2 May 2025 10:37:01 +0200
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
Subject: Re: [PATCH] powerpc/powernv: Enable CPU idle state detection for
 POWER11
To: Aboorva Devarajan <aboorvad@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org
References: <20250421070718.162783-1-aboorvad@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250421070718.162783-1-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 21/04/2025 à 09:07, Aboorva Devarajan a écrit :
> [Vous ne recevez pas souvent de courriers de aboorvad@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Extend idle state detection to POWER11 by updating the PVR check.
> This ensures POWER11 correctly recognizes supported stop states,
> similar to POWER9 and POWER10.
> 
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> 
> ---
> 
> Without Patch: (Power11 - PowerNV systems)
> 
> CPUidle driver: powernv_idle
> CPUidle governor: menu
> analyzing CPU 927:
> 
> Number of idle states: 1
> Available idle states: snooze
> snooze:
> Flags/Description: snooze
> Latency: 0
> Usage: 251631
> Duration: 207497715900
> 
> With Patch: (Power11 - PowerNV systems)
> 
> CPUidle driver: powernv_idle
> CPUidle governor: menu
> analyzing CPU 959:
> 
> Number of idle states: 4
> Available idle states: snooze stop0_lite stop0 stop3
> snooze:
> Flags/Description: snooze
> Latency: 0
> Usage: 2
> Duration: 33
> stop0_lite:
> Flags/Description: stop0_lite
> Latency: 1
> Usage: 1
> Duration: 52
> stop0:
> Flags/Description: stop0
> Latency: 10
> Usage: 13
> Duration: 1920
> stop3:
> Flags/Description: stop3
> Latency: 45
> Usage: 381
> Duration: 21638478
> 
> 
>   arch/powerpc/platforms/powernv/idle.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index d98b933e4984..10f4d7d5eb44 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1171,8 +1171,8 @@ static void __init pnv_arch300_idle_init(void)
>          u64 max_residency_ns = 0;
>          int i;
> 
> -       /* stop is not really architected, we only have p9,p10 drivers */
> -       if (!pvr_version_is(PVR_POWER10) && !pvr_version_is(PVR_POWER9))
> +       /* stop is not really architected, we only have p9,p10 and p11 drivers */
> +       if (!(PVR_VER(mfspr(SPRN_PVR)) >= PVR_POWER9))

Isn't this test too permissive ?

#define PVR_POWER9	0x004E
#define PVR_POWER10	0x0080
#define PVR_POWER11	0x0082
#define PVR_BE		0x0070
#define PVR_PA6T	0x0090

#define PVR_VER_E500V1	0x8020
#define PVR_VER_E500V2	0x8021
#define PVR_VER_E500MC	0x8023
#define PVR_VER_E5500	0x8024
#define PVR_VER_E6500	0x8040
#define PVR_VER_7450	0x8000
#define PVR_VER_7455	0x8001
#define PVR_VER_7447	0x8002
#define PVR_VER_7447A	0x8003
#define PVR_VER_7448	0x8004

>                  return;
> 
>          /*
> @@ -1189,8 +1189,8 @@ static void __init pnv_arch300_idle_init(void)
>                  struct pnv_idle_states_t *state = &pnv_idle_states[i];
>                  u64 psscr_rl = state->psscr_val & PSSCR_RL_MASK;
> 
> -               /* No deep loss driver implemented for POWER10 yet */
> -               if (pvr_version_is(PVR_POWER10) &&
> +               /* No deep loss driver implemented for POWER10 and POWER11 yet */
> +               if ((PVR_VER(mfspr(SPRN_PVR)) >= PVR_POWER10) &&
>                                  state->flags & (OPAL_PM_TIMEBASE_STOP|OPAL_PM_LOSE_FULL_CONTEXT))
>                          continue;
> 
> --
> 2.49.0
> 


