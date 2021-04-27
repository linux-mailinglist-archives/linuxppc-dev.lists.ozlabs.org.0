Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B441936C686
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 14:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV1xL5TfJz30D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 22:56:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Hy8OlSmG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hy8OlSmG; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV1wv0zCBz2xYY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 22:56:28 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id n184so33609756oia.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/XHlLEpNzjuI0S1WcxDA8cWcp8kFneZ/84y6W8LPunk=;
 b=Hy8OlSmGuQRhZolNM6RCVQiaeOmSs0cjSyaMjfbqrQ8bJfjW3myN8F0lf7x5839IKO
 I/QmmsQuTozpkwaqiNu7Ncm96IFz1KidBqimpMvo16pYZsHfb9gWOEdA4O17HX4emXns
 QfjOpXQcRoGnKmz67RKK5VCinlpTIAojXPJDn6kZ/k7HsBKY+JuBfGn1Un5KlbmGgjm4
 pwa9rNPZseKCaDMl+ciWhjfDQDHvavx7bDdYtsCPmWGzMLBbyHrBGCPHaymYpRNQr3Yd
 cXqzLBOFQpZJ+/Now90QfGyw7KZyE59EAqMNSwc6N7Q/wsB01m5ItcCRomFjSrb0np+q
 59mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/XHlLEpNzjuI0S1WcxDA8cWcp8kFneZ/84y6W8LPunk=;
 b=WfwQK8fAx4QkNWpcvdYFSO5eZfKgwg61j1Jx+ed8+3jEFkpR4KlDubV9SoFwNT0/AY
 Q/H0I0q4YATHWs1V9tIUnP8WolttEZwO4v/lOrN4ITnsl/vjcDgM6ljB/WHo9zkcl7iV
 zNfURE8pMDB4d8L4R06bH2wVPejYL/ib2ztgmb1ea3HVHRVbSQgTZB6+UvRV11iW5UqG
 d1yyXQaKrLwBnhcN+aiI3h1XS8ektX8+xiMsR5JBh4/zvtGPSqqAw/H+3mPtyQU+KzpG
 F81p2sEG3TTTUKj+4PI+nrOx5daZqujlfF6dvNEDcYZTPOX/H4uW7KtdxSmEz+riIulF
 KfOw==
X-Gm-Message-State: AOAM530GMmf07Q+N4O461Lca8ZJGRN0uurIZ9Ve0aXDDuAlnjDTQJIvb
 rDMA3VIewmOA0zHFl6kO64g=
X-Google-Smtp-Source: ABdhPJwv6yPj3k2iJ+m26/JwYoEhIcrcrGKxZXl/f6pcHYx9T5xVJUliPEFb3xsAiLbb+lAdaMgGHw==
X-Received: by 2002:aca:ed12:: with SMTP id l18mr3276455oih.24.1619528184323; 
 Tue, 27 Apr 2021 05:56:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q1sm4098236otm.26.2021.04.27.05.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 05:56:23 -0700 (PDT)
Subject: Re: [PATCH 2/9] ARM: PXA: Kill use of irq_create_strict_mappings()
To: Marc Zyngier <maz@kernel.org>
References: <20210406093557.1073423-1-maz@kernel.org>
 <20210406093557.1073423-3-maz@kernel.org>
 <20210426223942.GA213931@roeck-us.net> <87o8e0nn8u.wl-maz@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <4dfcc837-8474-0173-2de8-146e5cf1d142@roeck-us.net>
Date: Tue, 27 Apr 2021 05:56:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87o8e0nn8u.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-sh@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-mips@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/27/21 1:30 AM, Marc Zyngier wrote:
> Hi Guenter,
> 
> Thanks for the heads up.
> 
> On Mon, 26 Apr 2021 23:39:42 +0100,
> Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Tue, Apr 06, 2021 at 10:35:50AM +0100, Marc Zyngier wrote:
>>> irq_create_strict_mappings() is a poor way to allow the use of
>>> a linear IRQ domain as a legacy one. Let's be upfront about
>>> it and use a legacy domain when appropriate.
>>>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> ---
>>
>> When running the "mainstone" qemu emulation, this patch results
>> in many (32, actually) runtime warnings such as the following.
>>
>> [    0.528272] ------------[ cut here ]------------
>> [    0.528285] WARNING: CPU: 0 PID: 1 at kernel/irq/irqdomain.c:550 irq_domain_associate+0x194/0x1f0
>> [    0.528315] error: virq335 is not allocated
> 
> [...]
> 
> This looks like a case of CONFIG_SPARSE_IRQ, combined with a lack of
> brain engagement. I've come up with the following patch, which lets
> the kernel boot in QEMU without screaming (other than the lack of a
> rootfs...).
> 
> Please let me know if this helps.
> 

It does.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> Thanks,
> 
> 	M.
> 
> From 4d7f6ddbbfdff1c9f029bafca79020d3294dc32c Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Tue, 27 Apr 2021 09:00:28 +0100
> Subject: [PATCH] ARM: PXA: Fix cplds irqdesc allocation when using legacy mode
> 
> The Mainstone PXA platform uses CONFIG_SPARSE_IRQ, and thus we
> cannot rely on the irq descriptors to be readilly allocated
> before creating the irqdomain in legacy mode. The kernel then
> complains loudly about not being able to associate the interrupt
> in the domain -- can't blame it.
> 
> Fix it by allocating the irqdescs upfront in the legacy case.
> 
> Fixes: b68761da0111 ("ARM: PXA: Kill use of irq_create_strict_mappings()")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm/mach-pxa/pxa_cplds_irqs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-pxa/pxa_cplds_irqs.c b/arch/arm/mach-pxa/pxa_cplds_irqs.c
> index ec0d9b094744..bddfc7cd5d40 100644
> --- a/arch/arm/mach-pxa/pxa_cplds_irqs.c
> +++ b/arch/arm/mach-pxa/pxa_cplds_irqs.c
> @@ -121,8 +121,13 @@ static int cplds_probe(struct platform_device *pdev)
>  		return fpga->irq;
>  
>  	base_irq = platform_get_irq(pdev, 1);
> -	if (base_irq < 0)
> +	if (base_irq < 0) {
>  		base_irq = 0;
> +	} else {
> +		ret = devm_irq_alloc_descs(&pdev->dev, base_irq, base_irq, CPLDS_NB_IRQ, 0);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	fpga->base = devm_ioremap_resource(&pdev->dev, res);
> 

