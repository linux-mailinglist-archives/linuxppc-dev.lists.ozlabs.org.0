Return-Path: <linuxppc-dev+bounces-3611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2E39DE792
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 14:31:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y0Db10HtNz2yLJ;
	Sat, 30 Nov 2024 00:30:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732887052;
	cv=none; b=FV6JBmBSitmnub9StLikEMn8vBpw/b0w7jcDTzR4zqRJkmGLLzz84048L/vlxYmjmSec/huNYxRnvPl0kNFgiNExRU7C2qd1Y+JR/Qpmj3qlE2QipIsUY50pWwRnqb0vnGYmh/9Hz2BD7tnt4KYxC1IXjhs4Z3snJCD0bgI9HujVqvF8b3+v73/xIPaJk91Jqsgx3ABX6gt1CoJ9DGK20c7S7AmwEhNPsiDmt/n6O/mqLDV5mR/6k8mJzwvwI9WKekuQCvL2OWj4mhw0Z0SYYWcRO61SbgOKYSrCiAegkQzesZQxXs+Y9dWJ55xpBF5aw+hLhxfwBru2cm21PdE6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732887052; c=relaxed/relaxed;
	bh=icaSftmPoFs3oPqGohm7R/vQ0cSrUMEsdq65mpHvRVA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vh6GLbFRXVy8YR/IyUn/sP23PL6HU1Jkb/GLsmvqZ1vSRvnqQAfGVni3M99+AZ0Ap3CX6SagsJ8R/jG3VdZc1Vb6i5dS9DwSI8hsr/lglQF45aSSdusCKcAnhCYL+N3HyVoQUFZsaYyXPuc3fY+J/Y5c7k8qNg7hYs696+jzfZ4WYjIUdif8C9ypeYD9knpvgR/EuFSp61p7nlAi4DL2Im39yH6oeCBSOfiSjefKcRFu0wgOfgQ24R+6dkW7XDfJuDIYO1SBLpa8kIXO4jbw9LmEBBWQrkLv7fixqt0W8/HFCRGzFinD/3BYwJxzmG8jVfoCC2wGy+XjxgWq/hU2KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YZd0bUlE; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wrWncmeL; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YZd0bUlE;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wrWncmeL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0DZw5WrLz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2024 00:30:48 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732887041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icaSftmPoFs3oPqGohm7R/vQ0cSrUMEsdq65mpHvRVA=;
	b=YZd0bUlE0xZWKejtIH/8b1Xqio5SfbdWK/5fXWh1rcU+HTZHZqztwv5kJcUBmq52ppdrJy
	1Ep4+fruQcQWa6mXw/p8/wsLzsNObq5sVcv+kWT0aSkor/PqAIo/AF1SvX8kussOXip9jW
	H6sdGyfghjxb6Y3ZPxDxq2Zsq4wbPAx6Rg7A9IX3NMquMO61hFmKPU+wHyFSZHsGZB4706
	parfYH3VpxhtyxyRSUbXKOzFpsOPMQbyXJeDVpuYL/lQkIA/k1Nw2c5rfjJznTWNfjY1ca
	JSyIKNKyfdTbY8dtmOcn45qcazynk3AfLKl/TLDh1aj50MMzlJU/wBAxGVRaEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732887041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icaSftmPoFs3oPqGohm7R/vQ0cSrUMEsdq65mpHvRVA=;
	b=wrWncmeLIabkTOlhwz7jViyBBp/tltQNLjqOmhFxdSu/hqrEOzPSlAZ4Wcir7LF0WMDQzx
	JiqHMj25fRo9EECQ==
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ebiederm@xmission.com, akpm@linux-foundation.org,
 bhe@redhat.com, farbere@amazon.com, hbathini@linux.ibm.com,
 sourabhjain@linux.ibm.com, adityag@linux.ibm.com,
 songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, Marc Zyngier <maz@kernel.org>
Cc: jonnyc@amazon.com
Subject: Re: [PATCH v4 1/2] kexec: Consolidate
 machine_kexec_mask_interrupts() implementation
In-Reply-To: <20241129113119.26669-2-farbere@amazon.com>
References: <20241129113119.26669-1-farbere@amazon.com>
 <20241129113119.26669-2-farbere@amazon.com>
Date: Fri, 29 Nov 2024 14:30:41 +0100
Message-ID: <87zfliw4ji.ffs@tglx>
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

On Fri, Nov 29 2024 at 11:31, Eliav Farber wrote:
> Move the machine_kexec_mask_interrupts function to a common location in
> kernel/kexec_core.c, removing duplicate implementations from architecture
> specific files (arch/arm, arch/arm64, arch/powerpc, and arch/riscv).

Can you please move this into kernel/irq/kexec.c?

It's pure interrupt core internal code and there is no point to make
core internal functions visible to random other code just because.

> +void machine_kexec_mask_interrupts(void)
> +{
> +	unsigned int i;
> +	struct irq_desc *desc;

	struct irq_desc *desc;
        unsigned int i;

please

> +	for_each_irq_desc(i, desc) {
> +		struct irq_chip *chip;
> +		int check_eoi = 1;
> +
> +		chip = irq_desc_get_chip(desc);
> +		if (!chip)
> +			continue;
> +
> +		if (IS_ENABLED(CONFIG_ARM64)) {

This should not be CONFIG_ARM64. Add something like:

config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
	bool

and select this from ARM64?

> +			/*
> +			 * First try to remove the active state. If this fails, try to EOI the
> +			 * interrupt.

This comment does not really explain what this is about. I know you
copied it from the ARM64 implementation, but it should explain what this
actually means. Something like:

         First try to remove the active state from an interrupt which is
         forwarded to a VM. If the interrupt is not forwarded, try to
         EOI the interrupt.

or something like that.

> +			 */
> +			check_eoi = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);

Looking deeper. This function actually cannot be called from this
context. It does:

          irq_get_desc_buslock(irq, &flags, 0);

which means for any interrupt which has an actual buslock implementation
it will end up in a sleepable function and deadlock in the worst case.

Marc?

> +		}
> +
> +		if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
> +			chip->irq_eoi(&desc->irq_data);

Thanks,

        tglx

