Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A55A331867
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 21:24:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvVDW2xQ2z3cXv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 07:24:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.96.117; helo=1.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 7801 seconds by postgrey-1.36 at boromir;
 Tue, 09 Mar 2021 07:23:53 AEDT
Received: from 1.mo52.mail-out.ovh.net (1.mo52.mail-out.ovh.net
 [178.32.96.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvVD95Qddz30Qw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 07:23:51 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.244])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 5F1B3247107;
 Mon,  8 Mar 2021 18:55:30 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 8 Mar 2021
 18:55:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004143809b3-bb0b-4744-9177-8fb645acf3e2,
 BFE3C84E2CAB42A1CEB5BA3519A80D4AF8E6727E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 8 Mar 2021 18:55:29 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 2/8] powerpc/xive: Introduce an IPI interrupt domain
Message-ID: <20210308185529.71588590@bahia.lan>
In-Reply-To: <20210303174857.1760393-3-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-3-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 5d27dce1-0926-4207-a8dd-27f2420d878c
X-Ovh-Tracer-Id: 7282883549283785181
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddugedggeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqfedtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleeuteehgeehfeetveevledvhfeuuedugedugeetudefuedtkeekueegjefgtedvnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

On Wed, 3 Mar 2021 18:48:51 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> The IPI interrupt is a special case of the XIVE IRQ domain. When
> mapping and unmapping the interrupts in the Linux interrupt number
> space, the HW interrupt number 0 (XIVE_IPI_HW_IRQ) is checked to
> distinguish the IPI interrupt from other interrupts of the system.
>=20
> Simplify the XIVE interrupt domain by introducing a specific domain
> for the IPI.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Nice !

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/common.c | 51 +++++++++++++------------------
>  1 file changed, 22 insertions(+), 29 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index b8e456da28aa..e7783760d278 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -63,6 +63,8 @@ static const struct xive_ops *xive_ops;
>  static struct irq_domain *xive_irq_domain;
> =20
>  #ifdef CONFIG_SMP
> +static struct irq_domain *xive_ipi_irq_domain;
> +
>  /* The IPIs all use the same logical irq number */
>  static u32 xive_ipi_irq;
>  #endif
> @@ -1067,20 +1069,32 @@ static struct irq_chip xive_ipi_chip =3D {
>  	.irq_unmask =3D xive_ipi_do_nothing,
>  };
> =20
> +/*
> + * IPIs are marked per-cpu. We use separate HW interrupts under the
> + * hood but associated with the same "linux" interrupt
> + */
> +static int xive_ipi_irq_domain_map(struct irq_domain *h, unsigned int vi=
rq,
> +				   irq_hw_number_t hw)
> +{
> +	irq_set_chip_and_handler(virq, &xive_ipi_chip, handle_percpu_irq);
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops xive_ipi_irq_domain_ops =3D {
> +	.map =3D xive_ipi_irq_domain_map,
> +};
> +
>  static void __init xive_request_ipi(void)
>  {
>  	unsigned int virq;
> =20
> -	/*
> -	 * Initialization failed, move on, we might manage to
> -	 * reach the point where we display our errors before
> -	 * the system falls appart
> -	 */
> -	if (!xive_irq_domain)
> +	xive_ipi_irq_domain =3D irq_domain_add_linear(NULL, 1,
> +						    &xive_ipi_irq_domain_ops, NULL);
> +	if (WARN_ON(xive_ipi_irq_domain =3D=3D NULL))
>  		return;
> =20
>  	/* Initialize it */
> -	virq =3D irq_create_mapping(xive_irq_domain, XIVE_IPI_HW_IRQ);
> +	virq =3D irq_create_mapping(xive_ipi_irq_domain, XIVE_IPI_HW_IRQ);
>  	xive_ipi_irq =3D virq;
> =20
>  	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
> @@ -1178,19 +1192,6 @@ static int xive_irq_domain_map(struct irq_domain *=
h, unsigned int virq,
>  	 */
>  	irq_clear_status_flags(virq, IRQ_LEVEL);
> =20
> -#ifdef CONFIG_SMP
> -	/* IPIs are special and come up with HW number 0 */
> -	if (hw =3D=3D XIVE_IPI_HW_IRQ) {
> -		/*
> -		 * IPIs are marked per-cpu. We use separate HW interrupts under
> -		 * the hood but associated with the same "linux" interrupt
> -		 */
> -		irq_set_chip_and_handler(virq, &xive_ipi_chip,
> -					 handle_percpu_irq);
> -		return 0;
> -	}
> -#endif
> -
>  	rc =3D xive_irq_alloc_data(virq, hw);
>  	if (rc)
>  		return rc;
> @@ -1202,15 +1203,7 @@ static int xive_irq_domain_map(struct irq_domain *=
h, unsigned int virq,
> =20
>  static void xive_irq_domain_unmap(struct irq_domain *d, unsigned int vir=
q)
>  {
> -	struct irq_data *data =3D irq_get_irq_data(virq);
> -	unsigned int hw_irq;
> -
> -	/* XXX Assign BAD number */
> -	if (!data)
> -		return;
> -	hw_irq =3D (unsigned int)irqd_to_hwirq(data);
> -	if (hw_irq !=3D XIVE_IPI_HW_IRQ)
> -		xive_irq_free_data(virq);
> +	xive_irq_free_data(virq);
>  }
> =20
>  static int xive_irq_domain_xlate(struct irq_domain *h, struct device_nod=
e *ct,

