Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2618F2D4558
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 16:27:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Crgrl5Jl0zDqgL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 02:27:03 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrgpC6G3tzDqfN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 02:24:51 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B188F72B524D;
 Wed,  9 Dec 2020 16:24:37 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 16:24:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0058db35bb0-d8b2-4273-90c2-ff3b6c1b7f36,
 661A724A132DD26A84B163D3BB90DC3732340046) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Wed, 9 Dec 2020 16:24:35 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 11/13] powerpc/xive: Remove P9 DD1 flag
 XIVE_IRQ_FLAG_EOI_FW
Message-ID: <20201209162435.679564d7@bahia.lan>
In-Reply-To: <20201208151124.1329942-12-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-12-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 3e937519-782f-4090-9ecb-0dcd8c16aca4
X-Ovh-Tracer-Id: 17020510369855216026
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefftedvgeduuefgheeltddtieegheejhfekleduuddtffejffeuleffgfevtdeknecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

On Tue, 8 Dec 2020 16:11:22 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This flag was used to support the P9 DD1 and we have stopped
> supporting this CPU when DD2 came out. See skiboot commit:
>=20
>   https://github.com/open-power/skiboot/commit/0b0d15e3c170
>=20
> Also, remove eoi handler which is now unused.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

Same suggestion as with previous patch.

>  arch/powerpc/include/asm/opal-api.h      |  2 +-
>  arch/powerpc/include/asm/xive.h          |  2 +-
>  arch/powerpc/sysdev/xive/xive-internal.h |  1 -
>  arch/powerpc/kvm/book3s_xive_template.c  |  2 --
>  arch/powerpc/sysdev/xive/common.c        | 13 +------------
>  arch/powerpc/sysdev/xive/native.c        | 12 ------------
>  arch/powerpc/sysdev/xive/spapr.c         |  6 ------
>  7 files changed, 3 insertions(+), 35 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/a=
sm/opal-api.h
> index 0455b679c050..0b63ba7d5917 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -1093,7 +1093,7 @@ enum {
>  	OPAL_XIVE_IRQ_LSI		=3D 0x00000004,
>  	OPAL_XIVE_IRQ_SHIFT_BUG		=3D 0x00000008, /* P9 DD1.0 workaround */
>  	OPAL_XIVE_IRQ_MASK_VIA_FW	=3D 0x00000010, /* P9 DD1.0 workaround */
> -	OPAL_XIVE_IRQ_EOI_VIA_FW	=3D 0x00000020,
> +	OPAL_XIVE_IRQ_EOI_VIA_FW	=3D 0x00000020, /* P9 DD1.0 workaround */
>  };
> =20
>  /* Flags for OPAL_XIVE_GET/SET_QUEUE_INFO */
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
> index d62368d0ba91..f6150d7a757a 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -62,7 +62,7 @@ struct xive_irq_data {
>  #define XIVE_IRQ_FLAG_LSI	0x02
>  #define XIVE_IRQ_FLAG_SHIFT_BUG	0x04 /* P9 DD1.0 workaround */
>  #define XIVE_IRQ_FLAG_MASK_FW	0x08 /* P9 DD1.0 workaround */
> -#define XIVE_IRQ_FLAG_EOI_FW	0x10
> +#define XIVE_IRQ_FLAG_EOI_FW	0x10 /* P9 DD1.0 workaround */
>  #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
> =20
>  /* Special flag set by KVM for excalation interrupts */
> diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
> index 066d6fe3dc1d..3b7dd2cba9db 100644
> --- a/arch/powerpc/sysdev/xive/xive-internal.h
> +++ b/arch/powerpc/sysdev/xive/xive-internal.h
> @@ -52,7 +52,6 @@ struct xive_ops {
>  	void	(*shutdown)(void);
> =20
>  	void	(*update_pending)(struct xive_cpu *xc);
> -	void	(*eoi)(u32 hw_irq);
>  	void	(*sync_source)(u32 hw_irq);
>  	u64	(*esb_rw)(u32 hw_irq, u32 offset, u64 data, bool write);
>  #ifdef CONFIG_SMP
> diff --git a/arch/powerpc/kvm/book3s_xive_template.c b/arch/powerpc/kvm/b=
ook3s_xive_template.c
> index ece36e024a8f..b0015e05d99a 100644
> --- a/arch/powerpc/kvm/book3s_xive_template.c
> +++ b/arch/powerpc/kvm/book3s_xive_template.c
> @@ -74,8 +74,6 @@ static void GLUE(X_PFX,source_eoi)(u32 hw_irq, struct x=
ive_irq_data *xd)
>  	/* If the XIVE supports the new "store EOI facility, use it */
>  	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
>  		__x_writeq(0, __x_eoi_page(xd) + XIVE_ESB_STORE_EOI);
> -	else if (hw_irq && xd->flags & XIVE_IRQ_FLAG_EOI_FW)
> -		opal_int_eoi(hw_irq);
>  	else if (xd->flags & XIVE_IRQ_FLAG_LSI) {
>  		/*
>  		 * For LSIs the HW EOI cycle is used rather than PQ bits,
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index a71412fefb65..fe6229dd3241 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -354,18 +354,7 @@ static void xive_do_source_eoi(u32 hw_irq, struct xi=
ve_irq_data *xd)
>  	/* If the XIVE supports the new "store EOI facility, use it */
>  	if (xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
>  		xive_esb_write(xd, XIVE_ESB_STORE_EOI, 0);
> -	else if (hw_irq && xd->flags & XIVE_IRQ_FLAG_EOI_FW) {
> -		/*
> -		 * The FW told us to call it. This happens for some
> -		 * interrupt sources that need additional HW whacking
> -		 * beyond the ESB manipulation. For example LPC interrupts
> -		 * on P9 DD1.0 needed a latch to be clared in the LPC bridge
> -		 * itself. The Firmware will take care of it.
> -		 */
> -		if (WARN_ON_ONCE(!xive_ops->eoi))
> -			return;
> -		xive_ops->eoi(hw_irq);
> -	} else {
> +	else {
>  		u8 eoi_val;
> =20
>  		/*
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
> index deb97ad25d62..4902d05ebbd1 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -64,8 +64,6 @@ int xive_native_populate_irq_data(u32 hw_irq, struct xi=
ve_irq_data *data)
>  		data->flags |=3D XIVE_IRQ_FLAG_STORE_EOI;
>  	if (opal_flags & OPAL_XIVE_IRQ_LSI)
>  		data->flags |=3D XIVE_IRQ_FLAG_LSI;
> -	if (opal_flags & OPAL_XIVE_IRQ_EOI_VIA_FW)
> -		data->flags |=3D XIVE_IRQ_FLAG_EOI_FW;
>  	data->eoi_page =3D be64_to_cpu(eoi_page);
>  	data->trig_page =3D be64_to_cpu(trig_page);
>  	data->esb_shift =3D be32_to_cpu(esb_shift);
> @@ -380,15 +378,6 @@ static void xive_native_update_pending(struct xive_c=
pu *xc)
>  	}
>  }
> =20
> -static void xive_native_eoi(u32 hw_irq)
> -{
> -	/*
> -	 * Not normally used except if specific interrupts need
> -	 * a workaround on EOI.
> -	 */
> -	opal_int_eoi(hw_irq);
> -}
> -
>  static void xive_native_setup_cpu(unsigned int cpu, struct xive_cpu *xc)
>  {
>  	s64 rc;
> @@ -471,7 +460,6 @@ static const struct xive_ops xive_native_ops =3D {
>  	.match			=3D xive_native_match,
>  	.shutdown		=3D xive_native_shutdown,
>  	.update_pending		=3D xive_native_update_pending,
> -	.eoi			=3D xive_native_eoi,
>  	.setup_cpu		=3D xive_native_setup_cpu,
>  	.teardown_cpu		=3D xive_native_teardown_cpu,
>  	.sync_source		=3D xive_native_sync_source,
> diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/=
spapr.c
> index 6610e5149d5a..01ccc0786ada 100644
> --- a/arch/powerpc/sysdev/xive/spapr.c
> +++ b/arch/powerpc/sysdev/xive/spapr.c
> @@ -628,11 +628,6 @@ static void xive_spapr_update_pending(struct xive_cp=
u *xc)
>  	}
>  }
> =20
> -static void xive_spapr_eoi(u32 hw_irq)
> -{
> -	/* Not used */;
> -}
> -
>  static void xive_spapr_setup_cpu(unsigned int cpu, struct xive_cpu *xc)
>  {
>  	/* Only some debug on the TIMA settings */
> @@ -677,7 +672,6 @@ static const struct xive_ops xive_spapr_ops =3D {
>  	.match			=3D xive_spapr_match,
>  	.shutdown		=3D xive_spapr_shutdown,
>  	.update_pending		=3D xive_spapr_update_pending,
> -	.eoi			=3D xive_spapr_eoi,
>  	.setup_cpu		=3D xive_spapr_setup_cpu,
>  	.teardown_cpu		=3D xive_spapr_teardown_cpu,
>  	.sync_source		=3D xive_spapr_sync_source,

