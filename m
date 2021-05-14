Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EA381210
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 22:52:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhgh24BVfz30Bq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 06:52:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OUnuK95D;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=bPU2yGzS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=OUnuK95D; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=bPU2yGzS; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhggZ0WNCz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 06:51:54 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1621025511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x24V9d0PpiUIyUwPjo7G+YqukfzUq9ldeYVq3IiRBAQ=;
 b=OUnuK95DK4cX9Vz7igSIrESiPOl75Vk4Sd4deo5S6PcYgLwEnD8X0u+2MrU/v22d3VNeXY
 8tHVOaUZL8weSTGqCG9MrOoTQoSV2irRADauIrMp7KTnYPtAalZXXO7wftvK2oyhFj4KDM
 dDxNCN2HbiGqZlBjIIHqPteRdDKtITMgKcHa/N0lX23+RvFk4GHNeGMoi3yI8SyTRrevyJ
 11QbUvD4cgWodOBjMgodEawpGR/DTV9SCZCP937TqxVQV0xrBBFus2qh15FHzqCB10YoOm
 YhTyb2+zudMDleRjBXIR//J4pz2Kww4DK4nyQ6NzKyudG30lrfaJFwQSyuzrhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1621025511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x24V9d0PpiUIyUwPjo7G+YqukfzUq9ldeYVq3IiRBAQ=;
 b=bPU2yGzS75RSEHrGzxcw4Oia8yFJknu6T5MQBNp85GurlGChW7FIagFpMdxOudJy08WaH3
 tFN/D4HZpYImiFBQ==
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 15/31] KVM: PPC: Book3S HV: XIVE: Fix mapping of
 passthrough interrupts
In-Reply-To: <20210430080407.4030767-16-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
 <20210430080407.4030767-16-clg@kaod.org>
Date: Fri, 14 May 2021 22:51:51 +0200
Message-ID: <87im3l2g48.ffs@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Marc Zyngier <maz@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 30 2021 at 10:03, C=C3=A9dric Le Goater wrote:

CC: +Marc

> PCI MSI interrupt numbers are now mapped in a PCI-MSI domain but the
> underlying calls handling the passthrough of the interrupt in the
> guest need a number in the XIVE IRQ domain.
>
> Use the IRQ data mapped in the XIVE IRQ domain and not the one in the
> PCI-MSI domain.
>
> Exporting irq_get_default_host() might not be the best solution.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/kvm/book3s_xive.c | 3 ++-
>  kernel/irq/irqdomain.c         | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xiv=
e.c
> index 3a7da42bed57..81b9f4fc3978 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -861,7 +861,8 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned =
long guest_irq,
>  	struct kvmppc_xive *xive =3D kvm->arch.xive;
>  	struct kvmppc_xive_src_block *sb;
>  	struct kvmppc_xive_irq_state *state;
> -	struct irq_data *host_data =3D irq_get_irq_data(host_irq);
> +	struct irq_data *host_data =3D
> +		irq_domain_get_irq_data(irq_get_default_host(), host_irq);
>  	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(host_data);
>  	u16 idx;
>  	u8 prio;
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index d10ab1d689d5..8a073d1ce611 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -481,6 +481,7 @@ struct irq_domain *irq_get_default_host(void)
>  {
>  	return irq_default_domain;
>  }
> +EXPORT_SYMBOL_GPL(irq_get_default_host);
>=20=20
>  static void irq_domain_clear_mapping(struct irq_domain *domain,
>  				     irq_hw_number_t hwirq)
