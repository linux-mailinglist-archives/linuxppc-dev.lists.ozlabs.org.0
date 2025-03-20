Return-Path: <linuxppc-dev+bounces-7243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26408A6AD07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 19:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJYlW3dY5z3055;
	Fri, 21 Mar 2025 05:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742494807;
	cv=none; b=W3e0Pip6l+ehx8NmipA++/1fayrY7QBkGAWxvZocG1oz8AeZVgiJwwumBJ02kZXO2VChdyI0h3rK4/STAV+06LJP6UP9ipcIILa2FK0TrvF5MnaU+uptSjyd1U19xQEatHSXeb59ZBeb7shetmNrgLs/TOTZmRijNnEclFZQ7zB1r6dyGuApVHGQEHvPtjeGtyYLM5a29kLVg97SOf2FVEB4FI0fvoOmHc7TsoNgkC332N9nN3jF+EM5tgUa/BRQaljN8TaNCPXtuaJo1rt+m30axn/AWmEH6/hscjXYc9rhyrPDSqV2mvyuFb4Xn47syuOdpVuR58HJIRhwsh58hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742494807; c=relaxed/relaxed;
	bh=iBc1z3Vlc1Vza0zP4X9SiZVIhH1cbsvYozEnAi8k9tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m/axXBQs/1Q0Lt+8JUnQOJWV9mxHWcm5/LGnfMbzp20fD4N5PS/Vn2789WRS+pHi8XbxLMhdShZvmh3nruG1dE7YUHW8KeU0KIqE8D8y9L8Sk225okiKoJuf2WRrLQGjnuLIclbmnN6RLFgsK13kqHL/AJMj5OFGoVLqIu7us49LpBS/davwBNSEX5KnmNN/9M2f88mlELxh3RZFxj0F8p+abdrIXUHC4cPJ3jWOq+u0SfMXXWnWoPCAjxeKSp3BI3wnLeOJ8tAJBjZJbgxwsWO6phYM4qvw4XdaELhZXd7NiXC+D/PxF5c6G7D19yJ68FTpV1b7nqD4v70xBp2+6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJYlV0d5Lz2ydv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 05:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZJYcq2hVdz9sS8;
	Thu, 20 Mar 2025 19:14:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FIxIWHcGzLNY; Thu, 20 Mar 2025 19:14:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZJYcq0NGwz9sRr;
	Thu, 20 Mar 2025 19:14:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A9BC48B79C;
	Thu, 20 Mar 2025 19:14:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ChJ9MNcL_MA0; Thu, 20 Mar 2025 19:14:18 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 088EF8B763;
	Thu, 20 Mar 2025 19:14:17 +0100 (CET)
Message-ID: <f00cca9b-d9d3-41c1-b808-3cee858c06c4@csgroup.eu>
Date: Thu, 20 Mar 2025 19:14:17 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 41/57] irqdomain: ppc: Switch to irq_find_mapping()
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, tglx@linutronix.de
Cc: maz@kernel.org, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Anatolij Gustschin <agust@denx.de>,
 Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-42-jirislaby@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250319092951.37667-42-jirislaby@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/03/2025 à 10:29, Jiri Slaby (SUSE) a écrit :
> irq_linear_revmap() is deprecated, so remove all its uses and supersede
> them by an identical call to irq_find_mapping().
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Anatolij Gustschin <agust@denx.de>
> Cc: Scott Wood <oss@buserror.net>
> Cc: linuxppc-dev@lists.ozlabs.org

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu> # for 8xx

> ---
>   arch/powerpc/platforms/44x/uic.c                 | 2 +-
>   arch/powerpc/platforms/52xx/mpc52xx_gpt.c        | 2 +-
>   arch/powerpc/platforms/52xx/mpc52xx_pic.c        | 2 +-
>   arch/powerpc/platforms/85xx/socrates_fpga_pic.c  | 2 +-
>   arch/powerpc/platforms/8xx/cpm1-ic.c             | 2 +-
>   arch/powerpc/platforms/8xx/pic.c                 | 2 +-
>   arch/powerpc/platforms/embedded6xx/flipper-pic.c | 2 +-
>   arch/powerpc/platforms/embedded6xx/hlwd-pic.c    | 2 +-
>   arch/powerpc/platforms/powermac/pic.c            | 2 +-
>   arch/powerpc/sysdev/cpm2_pic.c                   | 2 +-
>   arch/powerpc/sysdev/ehv_pic.c                    | 2 +-
>   arch/powerpc/sysdev/ge/ge_pic.c                  | 2 +-
>   arch/powerpc/sysdev/ipic.c                       | 2 +-
>   arch/powerpc/sysdev/mpic.c                       | 4 ++--
>   14 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/44x/uic.c b/arch/powerpc/platforms/44x/uic.c
> index 481ec25ce78f..85daf841fd3f 100644
> --- a/arch/powerpc/platforms/44x/uic.c
> +++ b/arch/powerpc/platforms/44x/uic.c
> @@ -328,5 +328,5 @@ unsigned int uic_get_irq(void)
>   	msr = mfdcr(primary_uic->dcrbase + UIC_MSR);
>   	src = 32 - ffs(msr);
>   
> -	return irq_linear_revmap(primary_uic->irqhost, src);
> +	return irq_find_mapping(primary_uic->irqhost, src);
>   }
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> index f042b21b2b73..3dbe5a5e5d1f 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
> @@ -369,7 +369,7 @@ struct mpc52xx_gpt_priv *mpc52xx_gpt_from_irq(int irq)
>   	mutex_lock(&mpc52xx_gpt_list_mutex);
>   	list_for_each(pos, &mpc52xx_gpt_list) {
>   		gpt = container_of(pos, struct mpc52xx_gpt_priv, list);
> -		if (gpt->irqhost && irq == irq_linear_revmap(gpt->irqhost, 0)) {
> +		if (gpt->irqhost && irq == irq_find_mapping(gpt->irqhost, 0)) {
>   			mutex_unlock(&mpc52xx_gpt_list_mutex);
>   			return gpt;
>   		}
> diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pic.c b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
> index 7ec56d3788a9..eb6a4e745c08 100644
> --- a/arch/powerpc/platforms/52xx/mpc52xx_pic.c
> +++ b/arch/powerpc/platforms/52xx/mpc52xx_pic.c
> @@ -515,5 +515,5 @@ unsigned int mpc52xx_get_irq(void)
>   		return 0;
>   	}
>   
> -	return irq_linear_revmap(mpc52xx_irqhost, irq);
> +	return irq_find_mapping(mpc52xx_irqhost, irq);
>   }
> diff --git a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
> index b4f6360830b1..4b69fb321a68 100644
> --- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
> +++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
> @@ -83,7 +83,7 @@ static inline unsigned int socrates_fpga_pic_get_irq(unsigned int irq)
>   		if (cause >> (i + 16))
>   			break;
>   	}
> -	return irq_linear_revmap(socrates_fpga_pic_irq_host,
> +	return irq_find_mapping(socrates_fpga_pic_irq_host,
>   			(irq_hw_number_t)i);
>   }
>   
> diff --git a/arch/powerpc/platforms/8xx/cpm1-ic.c b/arch/powerpc/platforms/8xx/cpm1-ic.c
> index 1549f6cd29f4..a49d4a9ab3bc 100644
> --- a/arch/powerpc/platforms/8xx/cpm1-ic.c
> +++ b/arch/powerpc/platforms/8xx/cpm1-ic.c
> @@ -59,7 +59,7 @@ static int cpm_get_irq(struct irq_desc *desc)
>   	cpm_vec = in_be16(&data->reg->cpic_civr);
>   	cpm_vec >>= 11;
>   
> -	return irq_linear_revmap(data->host, cpm_vec);
> +	return irq_find_mapping(data->host, cpm_vec);
>   }
>   
>   static void cpm_cascade(struct irq_desc *desc)
> diff --git a/arch/powerpc/platforms/8xx/pic.c b/arch/powerpc/platforms/8xx/pic.c
> index 7639f28172be..933d6ab7f512 100644
> --- a/arch/powerpc/platforms/8xx/pic.c
> +++ b/arch/powerpc/platforms/8xx/pic.c
> @@ -80,7 +80,7 @@ unsigned int mpc8xx_get_irq(void)
>   	if (irq == PIC_VEC_SPURRIOUS)
>   		return 0;
>   
> -        return irq_linear_revmap(mpc8xx_pic_host, irq);
> +        return irq_find_mapping(mpc8xx_pic_host, irq);
>   
>   }
>   
> diff --git a/arch/powerpc/platforms/embedded6xx/flipper-pic.c b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> index a41649bf0cb8..91a8f0a7086e 100644
> --- a/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> +++ b/arch/powerpc/platforms/embedded6xx/flipper-pic.c
> @@ -173,7 +173,7 @@ unsigned int flipper_pic_get_irq(void)
>   		return 0;	/* no more IRQs pending */
>   
>   	irq = __ffs(irq_status);
> -	return irq_linear_revmap(flipper_irq_host, irq);
> +	return irq_find_mapping(flipper_irq_host, irq);
>   }
>   
>   /*
> diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> index 9abb3da36ba5..b57e87b0b3ce 100644
> --- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> +++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
> @@ -190,7 +190,7 @@ static struct irq_domain *__init hlwd_pic_init(struct device_node *np)
>   unsigned int hlwd_pic_get_irq(void)
>   {
>   	unsigned int hwirq = __hlwd_pic_get_irq(hlwd_irq_host);
> -	return hwirq ? irq_linear_revmap(hlwd_irq_host, hwirq) : 0;
> +	return hwirq ? irq_find_mapping(hlwd_irq_host, hwirq) : 0;
>   }
>   
>   /*
> diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
> index 2eddc8bff7ab..c37783a03d25 100644
> --- a/arch/powerpc/platforms/powermac/pic.c
> +++ b/arch/powerpc/platforms/powermac/pic.c
> @@ -250,7 +250,7 @@ static unsigned int pmac_pic_get_irq(void)
>   	raw_spin_unlock_irqrestore(&pmac_pic_lock, flags);
>   	if (unlikely(irq < 0))
>   		return 0;
> -	return irq_linear_revmap(pmac_pic_host, irq);
> +	return irq_find_mapping(pmac_pic_host, irq);
>   }
>   
>   static int pmac_pic_host_match(struct irq_domain *h, struct device_node *node,
> diff --git a/arch/powerpc/sysdev/cpm2_pic.c b/arch/powerpc/sysdev/cpm2_pic.c
> index c63d72f17a3e..4a59ed1d62ce 100644
> --- a/arch/powerpc/sysdev/cpm2_pic.c
> +++ b/arch/powerpc/sysdev/cpm2_pic.c
> @@ -207,7 +207,7 @@ unsigned int cpm2_get_irq(void)
>   
>   	if (irq == 0)
>   		return(-1);
> -	return irq_linear_revmap(cpm2_pic_host, irq);
> +	return irq_find_mapping(cpm2_pic_host, irq);
>   }
>   
>   static int cpm2_pic_host_map(struct irq_domain *h, unsigned int virq,
> diff --git a/arch/powerpc/sysdev/ehv_pic.c b/arch/powerpc/sysdev/ehv_pic.c
> index 4ee8d36ca647..b6f9774038e1 100644
> --- a/arch/powerpc/sysdev/ehv_pic.c
> +++ b/arch/powerpc/sysdev/ehv_pic.c
> @@ -175,7 +175,7 @@ unsigned int ehv_pic_get_irq(void)
>   	 * this will also setup revmap[] in the slow path for the first
>   	 * time, next calls will always use fast path by indexing revmap
>   	 */
> -	return irq_linear_revmap(global_ehv_pic->irqhost, irq);
> +	return irq_find_mapping(global_ehv_pic->irqhost, irq);
>   }
>   
>   static int ehv_pic_host_match(struct irq_domain *h, struct device_node *node,
> diff --git a/arch/powerpc/sysdev/ge/ge_pic.c b/arch/powerpc/sysdev/ge/ge_pic.c
> index 5b1f8dc3c960..0bc3f0b36528 100644
> --- a/arch/powerpc/sysdev/ge/ge_pic.c
> +++ b/arch/powerpc/sysdev/ge/ge_pic.c
> @@ -245,7 +245,7 @@ unsigned int gef_pic_get_irq(void)
>   			if (active & (0x1 << hwirq))
>   				break;
>   		}
> -		virq = irq_linear_revmap(gef_pic_irq_host,
> +		virq = irq_find_mapping(gef_pic_irq_host,
>   			(irq_hw_number_t)hwirq);
>   	}
>   
> diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
> index f7b415ebb71c..70be2105865d 100644
> --- a/arch/powerpc/sysdev/ipic.c
> +++ b/arch/powerpc/sysdev/ipic.c
> @@ -801,7 +801,7 @@ unsigned int ipic_get_irq(void)
>   	if (irq == 0)    /* 0 --> no irq is pending */
>   		return 0;
>   
> -	return irq_linear_revmap(primary_ipic->irqhost, irq);
> +	return irq_find_mapping(primary_ipic->irqhost, irq);
>   }
>   
>   #ifdef CONFIG_SUSPEND
> diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
> index 3de090159a1b..787a88efdb35 100644
> --- a/arch/powerpc/sysdev/mpic.c
> +++ b/arch/powerpc/sysdev/mpic.c
> @@ -1785,7 +1785,7 @@ static unsigned int _mpic_get_one_irq(struct mpic *mpic, int reg)
>   		return 0;
>   	}
>   
> -	return irq_linear_revmap(mpic->irqhost, src);
> +	return irq_find_mapping(mpic->irqhost, src);
>   }
>   
>   unsigned int mpic_get_one_irq(struct mpic *mpic)
> @@ -1823,7 +1823,7 @@ unsigned int mpic_get_coreint_irq(void)
>   		return 0;
>   	}
>   
> -	return irq_linear_revmap(mpic->irqhost, src);
> +	return irq_find_mapping(mpic->irqhost, src);
>   #else
>   	return 0;
>   #endif


