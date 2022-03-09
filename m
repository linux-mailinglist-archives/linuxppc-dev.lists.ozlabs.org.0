Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E767C4D2A99
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 09:25:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD4yr5496z3bdy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 19:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD4yR5YM6z2yww
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 19:25:33 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KD4yM6K55z9sSV;
 Wed,  9 Mar 2022 09:25:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQNT7_NFttTh; Wed,  9 Mar 2022 09:25:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KD4yM5b9wz9sSR;
 Wed,  9 Mar 2022 09:25:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AEFBC8B77D;
 Wed,  9 Mar 2022 09:25:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9ukuPKsedaja; Wed,  9 Mar 2022 09:25:31 +0100 (CET)
Received: from [192.168.202.3] (unknown [192.168.202.3])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 378BB8B763;
 Wed,  9 Mar 2022 09:25:31 +0100 (CET)
Message-ID: <4c76a361-09a6-3c91-4ee8-36e035437496@csgroup.eu>
Date: Wed, 9 Mar 2022 09:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/7] powerpc/dt_cpu_ftrs: Set current thread fscr bits
Content-Language: fr-FR
To: Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200521014341.29095-1-alistair@popple.id.au>
 <20200521014341.29095-5-alistair@popple.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20200521014341.29095-5-alistair@popple.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: aneesh.kumar@linux.ibm.com, mikey@neuling.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 21/05/2020 à 03:43, Alistair Popple a écrit :
> Setting the FSCR bit directly in the SPR only sets it during the initial
> boot and early init of the kernel but not for the init process or any
> subsequent kthreads. This is because the thread_struct for those is
> copied from the current thread_struct setup at boot which doesn't
> reflect any changes made to the FSCR during cpu feature detection. This
> patch ensures the current thread state is updated to match once feature
> detection is complete.
> 
> Signed-off-by: Alistair Popple <alistair@popple.id.au>

I see that the series has been merged but this patch was left over.

Has it been forgotten or is it rejected ?

Thanks
Christophe


> ---
>   arch/powerpc/kernel/dt_cpu_ftrs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index b5e21264d168..677190f70cac 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -170,6 +170,7 @@ static int __init feat_try_enable_unknown(struct dt_cpu_feature *f)
>   		u64 fscr = mfspr(SPRN_FSCR);
>   		fscr |= 1UL << f->fscr_bit_nr;
>   		mtspr(SPRN_FSCR, fscr);
> +		current->thread.fscr |= 1UL << f->fscr_bit_nr;
>   	} else {
>   		/* Does not have a known recipe */
>   		return 0;
> @@ -205,6 +206,7 @@ static int __init feat_enable(struct dt_cpu_feature *f)
>   			u64 fscr = mfspr(SPRN_FSCR);
>   			fscr |= 1UL << f->fscr_bit_nr;
>   			mtspr(SPRN_FSCR, fscr);
> +			current->thread.fscr |= 1UL << f->fscr_bit_nr;
>   		}
>   	}
>   
