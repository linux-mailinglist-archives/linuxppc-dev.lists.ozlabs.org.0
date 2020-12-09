Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE92D4656
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 17:08:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crhmw4plDzDqvD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 03:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.105.233; helo=2.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 1196 seconds by postgrey-1.36 at bilbo;
 Thu, 10 Dec 2020 03:07:13 AEDT
Received: from 2.mo52.mail-out.ovh.net (2.mo52.mail-out.ovh.net
 [178.33.105.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Crhl53YP9zDqgB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 03:07:12 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 5083D221088;
 Wed,  9 Dec 2020 16:28:14 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 16:28:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0020d1df89b-fc08-428a-9fa1-3d0a449a8bba,
 661A724A132DD26A84B163D3BB90DC3732340046) smtp.auth=groug@kaod.org
Date: Wed, 9 Dec 2020 16:28:08 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 12/13] powerpc/xive: Simplify xive_do_source_eoi()
Message-ID: <20201209162808.0a4bfaf0@bahia.lan>
In-Reply-To: <20201208151124.1329942-13-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-13-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0317fbae-4973-4951-9409-37c1daa4785a
X-Ovh-Tracer-Id: 17081590439105042842
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

On Tue, 8 Dec 2020 16:11:23 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Previous patches removed the need of the first argument which was a
> hack for Firwmware EOI. Remove it and flatten the routine which has
> became simpler.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Much nicer indeed.

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/common.c | 72 ++++++++++++++-----------------
>  1 file changed, 33 insertions(+), 39 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index fe6229dd3241..fb438203d5ee 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -348,39 +348,40 @@ static void xive_do_queue_eoi(struct xive_cpu *xc)
>   * EOI an interrupt at the source. There are several methods
>   * to do this depending on the HW version and source type
>   */
> -static void xive_do_source_eoi(u32 hw_irq, struct xive_irq_data *xd)
> +static void xive_do_source_eoi(struct xive_irq_data *xd)
>  {
> +	u8 eoi_val;
> +
>  	xd->stale_p =3D false;
> +
>  	/* If the XIVE supports the new "store EOI facility, use it */
> -	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
> +	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI) {
>  		xive_esb_write(xd, XIVE_ESB_STORE_EOI, 0);
> -	else {
> -		u8 eoi_val;
> +		return;
> +	}
> =20
> -		/*
> -		 * Otherwise for EOI, we use the special MMIO that does
> -		 * a clear of both P and Q and returns the old Q,
> -		 * except for LSIs where we use the "EOI cycle" special
> -		 * load.
> -		 *
> -		 * This allows us to then do a re-trigger if Q was set
> -		 * rather than synthesizing an interrupt in software
> -		 *
> -		 * For LSIs the HW EOI cycle is used rather than PQ bits,
> -		 * as they are automatically re-triggred in HW when still
> -		 * pending.
> -		 */
> -		if (xd->flags & XIVE_IRQ_FLAG_LSI)
> -			xive_esb_read(xd, XIVE_ESB_LOAD_EOI);
> -		else {
> -			eoi_val =3D xive_esb_read(xd, XIVE_ESB_SET_PQ_00);
> -			DBG_VERBOSE("eoi_val=3D%x\n", eoi_val);
> -
> -			/* Re-trigger if needed */
> -			if ((eoi_val & XIVE_ESB_VAL_Q) && xd->trig_mmio)
> -				out_be64(xd->trig_mmio, 0);
> -		}
> +	/*
> +	 * For LSIs, we use the "EOI cycle" special load rather than
> +	 * PQ bits, as they are automatically re-triggered in HW when
> +	 * still pending.
> +	 */
> +	if (xd->flags & XIVE_IRQ_FLAG_LSI) {
> +		xive_esb_read(xd, XIVE_ESB_LOAD_EOI);
> +		return;
>  	}
> +
> +	/*
> +	 * Otherwise, we use the special MMIO that does a clear of
> +	 * both P and Q and returns the old Q. This allows us to then
> +	 * do a re-trigger if Q was set rather than synthesizing an
> +	 * interrupt in software
> +	 */
> +	eoi_val =3D xive_esb_read(xd, XIVE_ESB_SET_PQ_00);
> +	DBG_VERBOSE("eoi_val=3D%x\n", eoi_val);
> +
> +	/* Re-trigger if needed */
> +	if ((eoi_val & XIVE_ESB_VAL_Q) && xd->trig_mmio)
> +		out_be64(xd->trig_mmio, 0);
>  }
> =20
>  /* irq_chip eoi callback, called with irq descriptor lock held */
> @@ -398,7 +399,7 @@ static void xive_irq_eoi(struct irq_data *d)
>  	 */
>  	if (!irqd_irq_disabled(d) && !irqd_is_forwarded_to_vcpu(d) &&
>  	    !(xd->flags & XIVE_IRQ_FLAG_NO_EOI))
> -		xive_do_source_eoi(irqd_to_hwirq(d), xd);
> +		xive_do_source_eoi(xd);
>  	else
>  		xd->stale_p =3D true;
> =20
> @@ -788,14 +789,7 @@ static int xive_irq_retrigger(struct irq_data *d)
>  	 * 11, then perform an EOI.
>  	 */
>  	xive_esb_read(xd, XIVE_ESB_SET_PQ_11);
> -
> -	/*
> -	 * Note: We pass "0" to the hw_irq argument in order to
> -	 * avoid calling into the backend EOI code which we don't
> -	 * want to do in the case of a re-trigger. Backends typically
> -	 * only do EOI for LSIs anyway.
> -	 */
> -	xive_do_source_eoi(0, xd);
> +	xive_do_source_eoi(xd);
> =20
>  	return 1;
>  }
> @@ -910,7 +904,7 @@ static int xive_irq_set_vcpu_affinity(struct irq_data=
 *d, void *state)
>  		 * while masked, the generic code will re-mask it anyway.
>  		 */
>  		if (!xd->saved_p)
> -			xive_do_source_eoi(hw_irq, xd);
> +			xive_do_source_eoi(xd);
> =20
>  	}
>  	return 0;
> @@ -1054,7 +1048,7 @@ static void xive_ipi_eoi(struct irq_data *d)
>  	DBG_VERBOSE("IPI eoi: irq=3D%d [0x%lx] (HW IRQ 0x%x) pending=3D%02x\n",
>  		    d->irq, irqd_to_hwirq(d), xc->hw_ipi, xc->pending_prio);
> =20
> -	xive_do_source_eoi(xc->hw_ipi, &xc->ipi_data);
> +	xive_do_source_eoi(&xc->ipi_data);
>  	xive_do_queue_eoi(xc);
>  }
> =20
> @@ -1443,7 +1437,7 @@ static void xive_flush_cpu_queue(unsigned int cpu, =
struct xive_cpu *xc)
>  		 * still asserted. Otherwise do an MSI retrigger.
>  		 */
>  		if (xd->flags & XIVE_IRQ_FLAG_LSI)
> -			xive_do_source_eoi(irqd_to_hwirq(d), xd);
> +			xive_do_source_eoi(xd);
>  		else
>  			xive_irq_retrigger(d);
> =20

