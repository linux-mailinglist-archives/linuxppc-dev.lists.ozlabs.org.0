Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 167AE6B648
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 08:07:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pRdC5dsrzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 16:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="xqjUUR/T"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pRbW2wtszDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2019 16:06:15 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id c73so10272544pfb.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 23:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hjSRJ4YFCU0lYiLqwmRkJofNaFJUzFbZrYaG3+MIzz0=;
 b=xqjUUR/TnIzPra5VVDK6t/XlkiIRdr8u3x5c3Sc/by7d5XEwnyENR8KkNyXsM1Lc9M
 Kbt5439jOhA0HsD4kINfvjFNzZu26jZauuMo+NAjPhJDKxHAy+sMIwwyojD/oBG2mq+6
 c2vS+EhsphsGNav7eUX5LJx+lTq8qJIW4SFsPF4ZAOR4bN74mwQuRbUczrrELe65Zist
 CCvoB3HW2NAwC4tcyqG4aGWVsbhHhcqGxi/HR+dWkuOhbM1/NSUD52Z1jze/34jm4OXO
 +KAI3jLaXO8jxyv4CktPIyPjWVQAheSkCDdESChQOn7zjycebyCeXMMku5v7LIhIQuMg
 +kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hjSRJ4YFCU0lYiLqwmRkJofNaFJUzFbZrYaG3+MIzz0=;
 b=c+oAYka1PXO0zbNWWhv+jy1JMEtqi4w354tgYYdFUC81b2k49Djk3r1rtQ5WnTquST
 dfKDgJxeO6aMR4cfuKCWK5/1/OfX0ByPF8F4h3b5Rmz3Go9ZTt9x0BQwOf9hiRk74x4f
 p2HzzN6wDp3xfxTSZHunK9Qh7KSyUUOlVNHOaiCtyPK2tfWM+Pz5IjWiRzFfi7fk/j9b
 NOQ4KmZOrskiCkErI4ctET2vDPsKsyTfA+NZsHkFMrgA7bWdIyM4wZ4r08wGsdCb4tF0
 okWUn8tYAHEsv5OUgAzTOqtUo4RHd3KN6T2K4+dcS3s81Y3M0MH9NIZ3Oct5S1RGWp83
 zlOg==
X-Gm-Message-State: APjAAAUFr+VVylPQlqaNbZ4gpb3J1BuXjekTuJIdCZt0rky2hYjPnIh9
 KM0BjYz4dvEUDxV5Wx1GREE=
X-Google-Smtp-Source: APXvYqxD3ptjV2+047E6gnKu7klYdG/CfO8QbUFcV0UjBis0geyqVqWF/Dt0Mi2+47sbEeF0I1pNWQ==
X-Received: by 2002:a63:2606:: with SMTP id m6mr38882494pgm.436.1563343572118; 
 Tue, 16 Jul 2019 23:06:12 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f64sm24121901pfa.115.2019.07.16.23.06.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 23:06:11 -0700 (PDT)
Subject: Re: [PATCH kernel v3] powerpc/xive: Drop deregistered irqs
To: linuxppc-dev@lists.ozlabs.org
References: <20190717050028.85926-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <299e14d3-0820-7a11-7111-423093cc3e50@ozlabs.ru>
Date: Wed, 17 Jul 2019 16:06:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717050028.85926-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Popple <alistair@popple.id.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/07/2019 15:00, Alexey Kardashevskiy wrote:
> There is a race between releasing an irq on one cpu and fetching it
> from XIVE on another cpu as there does not seem to be any locking between
> these, probably because xive_irq_chip::irq_shutdown() is supposed to
> remove the irq from all queues in the system which it does not do.
> 
> As a result, when such released irq appears in a queue, we take it
> from the queue but we do not change the current priority on that cpu and
> since there is no handler for the irq, EOI is never called and the cpu
> current priority remains elevated (7 vs. 0xff==unmasked). If another irq
> is assigned to the same cpu, then that device stops working until irq
> is moved to another cpu or the device is reset.
> 
> This adds a new ppc_md.orphan_irq callback which is called if no irq
> descriptor is found. The XIVE implementation drops the current priority
> to 0xff which effectively unmasks interrupts in a current CPU.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Of course I missed this:


Fixes: 243e25112d06 ("powerpc/xive: Native exploitation of the XIVE 
interrupt controller")




> ---
> Changes:
> v3:
> * added a comment above xive_orphan_irq()
> 
> v2:
> * added ppc_md.orphan_irq
> ---
>   arch/powerpc/include/asm/machdep.h |  3 +++
>   arch/powerpc/kernel/irq.c          |  9 ++++++---
>   arch/powerpc/sysdev/xive/common.c  | 18 ++++++++++++++++++
>   3 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
> index c43d6eca9edd..6cc14e28e89a 100644
> --- a/arch/powerpc/include/asm/machdep.h
> +++ b/arch/powerpc/include/asm/machdep.h
> @@ -59,6 +59,9 @@ struct machdep_calls {
>   	/* Return an irq, or 0 to indicate there are none pending. */
>   	unsigned int	(*get_irq)(void);
>   
> +	/* Drops irq if it does not have a valid descriptor */
> +	void		(*orphan_irq)(unsigned int irq);
> +
>   	/* PCI stuff */
>   	/* Called after allocating resources */
>   	void		(*pcibios_fixup)(void);
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index bc68c53af67c..b4e06d05bdba 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -632,10 +632,13 @@ void __do_irq(struct pt_regs *regs)
>   	may_hard_irq_enable();
>   
>   	/* And finally process it */
> -	if (unlikely(!irq))
> +	if (unlikely(!irq)) {
>   		__this_cpu_inc(irq_stat.spurious_irqs);
> -	else
> -		generic_handle_irq(irq);
> +	} else if (generic_handle_irq(irq)) {
> +		if (ppc_md.orphan_irq)
> +			ppc_md.orphan_irq(irq);
> +		__this_cpu_inc(irq_stat.spurious_irqs);
> +	}
>   
>   	trace_irq_exit(regs);
>   
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index 082c7e1c20f0..17e696b2d71b 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -283,6 +283,23 @@ static unsigned int xive_get_irq(void)
>   	return irq;
>   }
>   
> +/*
> + * Handles the case when a target CPU catches an interrupt which is being shut
> + * down on another CPU. generic_handle_irq() returns an error in such case
> + * and then the orphan_irq() handler restores the CPPR to reenable interrupts.
> + *
> + * Without orphan_irq() and valid irq_desc, there is no other way to restore
> + * the CPPR. This executes on a CPU which caught the interrupt.
> + */
> +static void xive_orphan_irq(unsigned int irq)
> +{
> +	struct xive_cpu *xc = __this_cpu_read(xive_cpu);
> +
> +	xc->cppr = 0xff;
> +	out_8(xive_tima + xive_tima_offset + TM_CPPR, 0xff);
> +	DBG_VERBOSE("orphan_irq: irq %d, adjusting CPPR to 0xff\n", irq);
> +}
> +
>   /*
>    * After EOI'ing an interrupt, we need to re-check the queue
>    * to see if another interrupt is pending since multiple
> @@ -1419,6 +1436,7 @@ bool __init xive_core_init(const struct xive_ops *ops, void __iomem *area, u32 o
>   	xive_irq_priority = max_prio;
>   
>   	ppc_md.get_irq = xive_get_irq;
> +	ppc_md.orphan_irq = xive_orphan_irq;
>   	__xive_enabled = true;
>   
>   	pr_devel("Initializing host..\n");
> 

-- 
Alexey
