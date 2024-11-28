Return-Path: <linuxppc-dev+bounces-3595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A528D9DB5D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 11:39:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XzXqX0mGzz2yHT;
	Thu, 28 Nov 2024 21:39:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732790360;
	cv=none; b=ioo0ld3ycUHXodP3Ue2ZHFtRaACzd+g9LmZ5SZzAi8ulc1Q8f5+OBoI0ER1WyHDVQauDXsKTn6zUqmpJJ7vSCvOLxtqeHD2v8q3ea5YgWCR0YQ11lcxuOmJULZeftWeQAsIuayHiQbKCf0AmmGclS1PACS1h1nw/C2zELb+hn08THkna7LM/6kFKL9cD6vAmw2IZjsldkP8N/HzkYtPg8aWePJsnwP9YLR561h7X4tPr7KefGWrVUFJDT/yGdUZGDcGDRI6EJpqmK3/nyqAWWalZEEmlEGxEgaZVOi3GAhwtlzQL1dwzGmxoPiuogBUps3OHIk06f3GWi9kmYmusWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732790360; c=relaxed/relaxed;
	bh=dYmxpAymuaS1BHhRzDYCr8r7Tzu8mgJe4gNvGTzASXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NYh40am+9bmpq7/MeV43RlYqMXrsGzL2s1NdbV9MYuVLHLYlosBpeZIMEAZ1A8eABrm3eXWk/A2ADn8y1Qo0pCqWJVjhXQmfwcfgmI/MZQ1DWRzwgmrQ4mWa3JtmR78fPDdn813/FWzR+oPrEAbFGKRa8ncZO7agHzqd2uXCUlfyzw7ZksL0aYZHHI0yYEmNv6MGDFhs3PUCk4TuJX0kX9RnkrG3OP2JSGPzxpMS+MTxd64GfiefzJWfHH5ZeoXKOarTmLZeMVDOfagbNpjmawYZn6kr0qwcANCuBkYyknEKk3Bt4L3a7k5hWzyOi7m8LL4TZigtM2PWHZvnZ9YvdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cyPZAtWA; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xo4AX0OZ; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cyPZAtWA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xo4AX0OZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XzXqV1Zszz2y8k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2024 21:39:18 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732790351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYmxpAymuaS1BHhRzDYCr8r7Tzu8mgJe4gNvGTzASXA=;
	b=cyPZAtWAGKbtlFWs9cEMvxPPbhEBsBnTgasmylViURLKCrFJZq4KUFb2hoQpVM+0Z9ZI1Z
	HO62GdcPQtLBS0emt0zgsqqt8D/KJgT9r+iriajxxywIfQ6InBLGnR/p2k6Co013cESbNE
	ZvqJB7jykaIt+TTjCTah9MpBi+fFiSzt5O6vnOLUxNefLPuZF0690cl1N4NcAIj9j3P05B
	i8Z31ZLczDPUPOurcPUxWuYufOzQVlkWXNONCH5XfzBTyT4KInz3+mkpb8kW0bPUR15U5W
	jeOXwEKawd/Jj0uU8epeY5AZbW0xLvajafN4AKc+/Cj7jduIIf0H8gha7FcrAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732790351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dYmxpAymuaS1BHhRzDYCr8r7Tzu8mgJe4gNvGTzASXA=;
	b=xo4AX0OZ4yOQ7vQ7VDws86dLP7aK72d31WgBVqTxbaNaz3x+dO9DcPO/XU471u3j9BZxhr
	jOpHg1fBovstYFCw==
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, bhe@redhat.com,
 farbere@amazon.com, hbathini@linux.ibm.com, adityag@linux.ibm.com,
 songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Cc: jonnyc@amazon.com
Subject: Re: [PATCH v2] arm64: kexec: Check if IRQ is already masked before
 masking
In-Reply-To: <20241127152236.26122-1-farbere@amazon.com>
References: <20241127152236.26122-1-farbere@amazon.com>
Date: Thu, 28 Nov 2024 11:39:11 +0100
Message-ID: <87o71zy75c.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 27 2024 at 15:22, Eliav Farber wrote:
> diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
> index 80ceb5bd2680..54d0bd1bd449 100644
> --- a/arch/arm/kernel/machine_kexec.c
> +++ b/arch/arm/kernel/machine_kexec.c
> @@ -142,11 +142,8 @@ static void machine_kexec_mask_interrupts(void)
>  		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
>  			chip->irq_eoi(&desc->irq_data);
>  
> -		if (chip->irq_mask)
> -			chip->irq_mask(&desc->irq_data);
> -
> -		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
> -			chip->irq_disable(&desc->irq_data);
> +		irq_set_status_flags(i, IRQ_DISABLE_UNLAZY);
> +		irq_disable(desc);

This is just wrong. If the interrupt was torn down, then its state is
deactivated and it was masked already. So the EOI handling and the
mask/disable dance are neither required nor make sense.

So this whole thing should be:

		chip = irq_desc_get_chip(desc);
-		if (!chip)
+		if (!chip || !irqd_is_started(&desc->irq_data))
                	continue;

But what's worse is that we have 4 almost identical variants of the same
code.

So instead of exposing core functionality and "fixing" up four variants,
can we please have a consolidated version of this function in the core
code:
                struct irq_chip *chip;
                int check_eoi = 1;

		chip = irq_desc_get_chip(desc);
		if (!chip || !irqd_is_started(&desc->irq_data))
                	continue;

                if (IS_ENABLED(CONFIG_.....)) {
                        /*
                         * Add a sensible comment which explains this.
                         */
                	check_eoi = irq_set_irqchip_state(....);
                }

		if (check_eoi && ....)
                	chip->irq_eoi(&desc->irq_data);

		irq_shutdown(desc);

No?

Thanks,

        tglx

