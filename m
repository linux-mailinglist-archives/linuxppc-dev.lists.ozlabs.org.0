Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA3A180266
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 16:50:27 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cKL91cmXzDqWZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 02:50:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.52.162; helo=2.mo68.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2330 seconds by postgrey-1.36 at bilbo;
 Wed, 11 Mar 2020 02:48:28 AEDT
Received: from 2.mo68.mail-out.ovh.net (2.mo68.mail-out.ovh.net
 [46.105.52.162])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cKHw19KMzDqQC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 02:48:27 +1100 (AEDT)
Received: from player778.ha.ovh.net (unknown [10.108.42.102])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 2301715DF3A
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 16:09:25 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id C440B1048A9AF;
 Tue, 10 Mar 2020 15:09:18 +0000 (UTC)
Date: Tue, 10 Mar 2020 16:09:16 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 1/4] powerpc/xive: Use XIVE_BAD_IRQ instead of zero to
 catch non configured IPIs
Message-ID: <20200310160916.37de59c2@bahia.home>
In-Reply-To: <20200306150143.5551-2-clg@kaod.org>
References: <20200306150143.5551-1-clg@kaod.org>
 <20200306150143.5551-2-clg@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 12512407139747600779
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddvtddgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejjeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri,  6 Mar 2020 16:01:40 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> When a CPU is brought up, an IPI number is allocated and recorded
> under the XIVE CPU structure. Invalid IPI numbers are tracked with
> interrupt number 0x0.
>=20
> On the PowerNV platform, the interrupt number space starts at 0x10 and
> this works fine. However, on the sPAPR platform, it is possible to
> allocate the interrupt number 0x0 and this raises an issue when CPU 0
> is unplugged. The XIVE spapr driver tracks allocated interrupt numbers
> in a bitmask and it is not correctly updated when interrupt number 0x0
> is freed. It stays allocated and it is then impossible to reallocate.
>=20
> Fix by using the XIVE_BAD_IRQ value instead of zero on both platforms.
>=20
> Reported-by: David Gibson <david@gibson.dropbear.id.au>
> Fixes: eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interr=
upt controller")
> Cc: stable@vger.kernel.org # v4.14+
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

This looks mostly good. I'm juste wondering about potential overlooks:

$ git grep 'if.*hw_i' arch/powerpc/ | egrep -v 'xics|XIVE_BAD_IRQ'
arch/powerpc/kvm/book3s_xive.h:         if (out_hw_irq)
arch/powerpc/kvm/book3s_xive.h:         if (out_hw_irq)
arch/powerpc/kvm/book3s_xive_template.c:        else if (hw_irq && xd->flag=
s & XIVE_IRQ_FLAG_EOI_FW)
arch/powerpc/sysdev/xive/common.c:      else if (hw_irq && xd->flags & XIVE=
_IRQ_FLAG_EOI_FW) {

This hw_irq check in xive_do_source_eoi() for example is related to:

	/*
	 * Note: We pass "0" to the hw_irq argument in order to
	 * avoid calling into the backend EOI code which we don't
	 * want to do in the case of a re-trigger. Backends typically
	 * only do EOI for LSIs anyway.
	 */
	xive_do_source_eoi(0, xd);

but it can get hw_irq from:

	xive_do_source_eoi(xc->hw_ipi, &xc->ipi_data);

It seems that these should use XIVE_BAD_IRQ as well or I'm missing
something ?

arch/powerpc/sysdev/xive/common.c:      if (hw_irq)
arch/powerpc/sysdev/xive/common.c:              if (d->domain !=3D xive_irq=
_domain || hw_irq =3D=3D 0)



>  arch/powerpc/sysdev/xive/xive-internal.h |  7 +++++++
>  arch/powerpc/sysdev/xive/common.c        | 12 +++---------
>  arch/powerpc/sysdev/xive/native.c        |  4 ++--
>  arch/powerpc/sysdev/xive/spapr.c         |  4 ++--
>  4 files changed, 14 insertions(+), 13 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
> index 59cd366e7933..382980f4de2d 100644
> --- a/arch/powerpc/sysdev/xive/xive-internal.h
> +++ b/arch/powerpc/sysdev/xive/xive-internal.h
> @@ -5,6 +5,13 @@
>  #ifndef __XIVE_INTERNAL_H
>  #define __XIVE_INTERNAL_H
> =20
> +/*
> + * A "disabled" interrupt should never fire, to catch problems
> + * we set its logical number to this
> + */
> +#define XIVE_BAD_IRQ		0x7fffffff
> +#define XIVE_MAX_IRQ		(XIVE_BAD_IRQ - 1)
> +
>  /* Each CPU carry one of these with various per-CPU state */
>  struct xive_cpu {
>  #ifdef CONFIG_SMP
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index fa49193206b6..550baba98ec9 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -68,13 +68,6 @@ static u32 xive_ipi_irq;
>  /* Xive state for each CPU */
>  static DEFINE_PER_CPU(struct xive_cpu *, xive_cpu);
> =20
> -/*
> - * A "disabled" interrupt should never fire, to catch problems
> - * we set its logical number to this
> - */
> -#define XIVE_BAD_IRQ		0x7fffffff
> -#define XIVE_MAX_IRQ		(XIVE_BAD_IRQ - 1)
> -
>  /* An invalid CPU target */
>  #define XIVE_INVALID_TARGET	(-1)
> =20
> @@ -1153,7 +1146,7 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
>  	xc =3D per_cpu(xive_cpu, cpu);
> =20
>  	/* Check if we are already setup */
> -	if (xc->hw_ipi !=3D 0)
> +	if (xc->hw_ipi !=3D XIVE_BAD_IRQ)
>  		return 0;
> =20
>  	/* Grab an IPI from the backend, this will populate xc->hw_ipi */
> @@ -1190,7 +1183,7 @@ static void xive_cleanup_cpu_ipi(unsigned int cpu, =
struct xive_cpu *xc)
>  	/* Disable the IPI and free the IRQ data */
> =20
>  	/* Already cleaned up ? */
> -	if (xc->hw_ipi =3D=3D 0)
> +	if (xc->hw_ipi =3D=3D XIVE_BAD_IRQ)
>  		return;
> =20
>  	/* Mask the IPI */
> @@ -1346,6 +1339,7 @@ static int xive_prepare_cpu(unsigned int cpu)
>  		if (np)
>  			xc->chip_id =3D of_get_ibm_chip_id(np);
>  		of_node_put(np);
> +		xc->hw_ipi =3D XIVE_BAD_IRQ;
> =20
>  		per_cpu(xive_cpu, cpu) =3D xc;
>  	}
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
> index 0ff6b739052c..50e1a8e02497 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -312,7 +312,7 @@ static void xive_native_put_ipi(unsigned int cpu, str=
uct xive_cpu *xc)
>  	s64 rc;
> =20
>  	/* Free the IPI */
> -	if (!xc->hw_ipi)
> +	if (xc->hw_ipi =3D=3D XIVE_BAD_IRQ)
>  		return;
>  	for (;;) {
>  		rc =3D opal_xive_free_irq(xc->hw_ipi);
> @@ -320,7 +320,7 @@ static void xive_native_put_ipi(unsigned int cpu, str=
uct xive_cpu *xc)
>  			msleep(OPAL_BUSY_DELAY_MS);
>  			continue;
>  		}
> -		xc->hw_ipi =3D 0;
> +		xc->hw_ipi =3D XIVE_BAD_IRQ;
>  		break;
>  	}
>  }
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/=
spapr.c
> index 55dc61cb4867..3f15615712b5 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -560,11 +560,11 @@ static int xive_spapr_get_ipi(unsigned int cpu, str=
uct xive_cpu *xc)
> =20
>  static void xive_spapr_put_ipi(unsigned int cpu, struct xive_cpu *xc)
>  {
> -	if (!xc->hw_ipi)
> +	if (xc->hw_ipi =3D=3D XIVE_BAD_IRQ)
>  		return;
> =20
>  	xive_irq_bitmap_free(xc->hw_ipi);
> -	xc->hw_ipi =3D 0;
> +	xc->hw_ipi =3D XIVE_BAD_IRQ;
>  }
>  #endif /* CONFIG_SMP */
> =20

