Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B042D3087
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 18:08:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr6840hNtzDqJf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 04:08:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr66d1gwkzDqBS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 04:07:00 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DDEF1726AD1F;
 Tue,  8 Dec 2020 18:06:54 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 8 Dec 2020
 18:06:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00502583912-18d4-4fa1-b70e-d6cbabeb6bd8,
 17D40A658B0D6C300559F39EE9B5E954A2DF46D1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 8 Dec 2020 18:06:52 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 03/13] powerpc/xive: Introduce XIVE_IPI_HW_IRQ
Message-ID: <20201208180652.3cf6f76d@bahia.lan>
In-Reply-To: <20201208151124.1329942-4-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-4-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 35b90798-8baf-42dc-907b-239becc412f9
X-Ovh-Tracer-Id: 12875228385525799322
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejiedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 16:11:14 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The XIVE driver deals with CPU IPIs in a peculiar way. Each CPU has
> its own XIVE IPI interrupt allocated at the HW level, for PowerNV, or
> at the hypervisor level for pSeries. In practice, these interrupts are
> not always used. pSeries/PowerVM prefers local doorbells for local
> threads since they are faster. On PowerNV, global doorbells are also
> preferred for the same reason.
>=20
> The mapping in the Linux is reduced to a single interrupt using HW
> interrupt number 0 and a custom irq_chip to handle EOI. This can cause
> performance issues in some benchmark (ipistorm) on multichip systems.
>=20
> Clarify the use of the 0 value, it will help in improving multichip
> support.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/xive-internal.h |  2 ++
>  arch/powerpc/sysdev/xive/common.c        | 10 +++++-----
>  2 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
> index b7b901da2168..d701af7fb48c 100644
> --- a/arch/powerpc/sysdev/xive/xive-internal.h
> +++ b/arch/powerpc/sysdev/xive/xive-internal.h
> @@ -5,6 +5,8 @@
>  #ifndef __XIVE_INTERNAL_H
>  #define __XIVE_INTERNAL_H
> =20
> +#define XIVE_IPI_HW_IRQ		0 /* interrupt source # for IPIs */
> +
>  /*
>   * A "disabled" interrupt should never fire, to catch problems
>   * we set its logical number to this
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 65af34ac1fa2..ee375daf8114 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1142,7 +1142,7 @@ static void __init xive_request_ipi(void)
>  		return;
> =20
>  	/* Initialize it */
> -	virq =3D irq_create_mapping(xive_irq_domain, 0);
> +	virq =3D irq_create_mapping(xive_irq_domain, XIVE_IPI_HW_IRQ);
>  	xive_ipi_irq =3D virq;
> =20
>  	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
> @@ -1242,7 +1242,7 @@ static int xive_irq_domain_map(struct irq_domain *h=
, unsigned int virq,
> =20
>  #ifdef CONFIG_SMP
>  	/* IPIs are special and come up with HW number 0 */
> -	if (hw =3D=3D 0) {
> +	if (hw =3D=3D XIVE_IPI_HW_IRQ) {
>  		/*
>  		 * IPIs are marked per-cpu. We use separate HW interrupts under
>  		 * the hood but associated with the same "linux" interrupt
> @@ -1271,7 +1271,7 @@ static void xive_irq_domain_unmap(struct irq_domain=
 *d, unsigned int virq)
>  	if (!data)
>  		return;
>  	hw_irq =3D (unsigned int)irqd_to_hwirq(data);
> -	if (hw_irq)
> +	if (hw_irq !=3D XIVE_IPI_HW_IRQ)
>  		xive_irq_free_data(virq);
>  }
> =20
> @@ -1421,7 +1421,7 @@ static void xive_flush_cpu_queue(unsigned int cpu, =
struct xive_cpu *xc)
>  		 * Ignore anything that isn't a XIVE irq and ignore
>  		 * IPIs, so can just be dropped.
>  		 */
> -		if (d->domain !=3D xive_irq_domain || hw_irq =3D=3D 0)
> +		if (d->domain !=3D xive_irq_domain || hw_irq =3D=3D XIVE_IPI_HW_IRQ)
>  			continue;
> =20
>  		/*
> @@ -1655,7 +1655,7 @@ static int xive_core_debug_show(struct seq_file *m,=
 void *private)
>  		hw_irq =3D (unsigned int)irqd_to_hwirq(d);
> =20
>  		/* IPIs are special (HW number 0) */
> -		if (hw_irq)
> +		if (hw_irq !=3D XIVE_IPI_HW_IRQ)
>  			xive_debug_show_irq(m, hw_irq, d);
>  	}
>  	return 0;

