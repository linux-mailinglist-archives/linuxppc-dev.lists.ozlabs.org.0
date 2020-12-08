Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE62D3149
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 18:41:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr6t319Q2zDqjp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 04:41:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout1.mo804.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo804.mail-out.ovh.net
 (smtpout1.mo804.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr6qq2ymhzDqX8
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 04:39:15 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 5B5AC78E041B;
 Tue,  8 Dec 2020 18:39:08 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 8 Dec 2020
 18:39:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0053a04e22a-e535-4500-9687-7b2267ad64f2,
 17D40A658B0D6C300559F39EE9B5E954A2DF46D1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Tue, 8 Dec 2020 18:39:06 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 09/13] powerpc/xive: Remove P9 DD1 flag
 XIVE_IRQ_FLAG_SHIFT_BUG
Message-ID: <20201208183906.1740c594@bahia.lan>
In-Reply-To: <20201208151124.1329942-10-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-10-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4eb79bd5-9c85-4184-b465-0bc559edc108
X-Ovh-Tracer-Id: 13419600990355954074
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejiedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffetvdegudeugfehledttdeigeehjefhkeeluddutdffjeffueelfffgvedtkeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

On Tue, 8 Dec 2020 16:11:20 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> This flag was used to support the PHB4 LSIs on P9 DD1 and we have
> stopped supporting this CPU when DD2 came out. See skiboot commit:
>=20
>   https://github.com/open-power/skiboot/commit/0b0d15e3c170
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

Just a minor suggestion in case you need to post a v2. See below.

>  arch/powerpc/include/asm/opal-api.h     | 2 +-
>  arch/powerpc/include/asm/xive.h         | 2 +-
>  arch/powerpc/kvm/book3s_xive_native.c   | 3 ---
>  arch/powerpc/kvm/book3s_xive_template.c | 3 ---
>  arch/powerpc/sysdev/xive/common.c       | 8 --------
>  arch/powerpc/sysdev/xive/native.c       | 2 --
>  6 files changed, 2 insertions(+), 18 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/a=
sm/opal-api.h
> index 1dffa3cb16ba..48ee604ca39a 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -1091,7 +1091,7 @@ enum {
>  	OPAL_XIVE_IRQ_TRIGGER_PAGE	=3D 0x00000001,
>  	OPAL_XIVE_IRQ_STORE_EOI		=3D 0x00000002,
>  	OPAL_XIVE_IRQ_LSI		=3D 0x00000004,
> -	OPAL_XIVE_IRQ_SHIFT_BUG		=3D 0x00000008,
> +	OPAL_XIVE_IRQ_SHIFT_BUG		=3D 0x00000008, /* P9 DD1.0 workaround */

Maybe you can even comment the entire line so that any future
tentative to use that flag breaks build ?

>  	OPAL_XIVE_IRQ_MASK_VIA_FW	=3D 0x00000010,
>  	OPAL_XIVE_IRQ_EOI_VIA_FW	=3D 0x00000020,
>  };
> diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
> index d332dd9a18de..ff805885a028 100644
> --- a/arch/powerpc/include/asm/xive.h
> +++ b/arch/powerpc/include/asm/xive.h
> @@ -60,7 +60,7 @@ struct xive_irq_data {
>  };
>  #define XIVE_IRQ_FLAG_STORE_EOI	0x01
>  #define XIVE_IRQ_FLAG_LSI	0x02
> -#define XIVE_IRQ_FLAG_SHIFT_BUG	0x04
> +#define XIVE_IRQ_FLAG_SHIFT_BUG	0x04 /* P9 DD1.0 workaround */

Same here, with an extra cleanup to stop using it when initializing=20
xive_irq_flags[] in common.c.

>  #define XIVE_IRQ_FLAG_MASK_FW	0x08
>  #define XIVE_IRQ_FLAG_EOI_FW	0x10
>  #define XIVE_IRQ_FLAG_H_INT_ESB	0x20
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/boo=
k3s_xive_native.c
> index 9b395381179d..170d1d04e1d1 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -37,9 +37,6 @@ static u8 xive_vm_esb_load(struct xive_irq_data *xd, u3=
2 offset)
>  	 * ordering.
>  	 */
> =20
> -	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
> -		offset |=3D offset << 4;
> -
>  	val =3D in_be64(xd->eoi_mmio + offset);
>  	return (u8)val;
>  }
> diff --git a/arch/powerpc/kvm/book3s_xive_template.c b/arch/powerpc/kvm/b=
ook3s_xive_template.c
> index 4ad3c0279458..ece36e024a8f 100644
> --- a/arch/powerpc/kvm/book3s_xive_template.c
> +++ b/arch/powerpc/kvm/book3s_xive_template.c
> @@ -61,9 +61,6 @@ static u8 GLUE(X_PFX,esb_load)(struct xive_irq_data *xd=
, u32 offset)
>  	if (offset =3D=3D XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE=
_EOI)
>  		offset |=3D XIVE_ESB_LD_ST_MO;
> =20
> -	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
> -		offset |=3D offset << 4;
> -
>  	val =3D__x_readq(__x_eoi_page(xd) + offset);
>  #ifdef __LITTLE_ENDIAN__
>  	val >>=3D 64-8;
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 411cba12d73b..a9259470bf9f 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -200,10 +200,6 @@ static notrace u8 xive_esb_read(struct xive_irq_data=
 *xd, u32 offset)
>  	if (offset =3D=3D XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE=
_EOI)
>  		offset |=3D XIVE_ESB_LD_ST_MO;
> =20
> -	/* Handle HW errata */
> -	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
> -		offset |=3D offset << 4;
> -
>  	if ((xd->flags & XIVE_IRQ_FLAG_H_INT_ESB) && xive_ops->esb_rw)
>  		val =3D xive_ops->esb_rw(xd->hw_irq, offset, 0, 0);
>  	else
> @@ -214,10 +210,6 @@ static notrace u8 xive_esb_read(struct xive_irq_data=
 *xd, u32 offset)
> =20
>  static void xive_esb_write(struct xive_irq_data *xd, u32 offset, u64 dat=
a)
>  {
> -	/* Handle HW errata */
> -	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
> -		offset |=3D offset << 4;
> -
>  	if ((xd->flags & XIVE_IRQ_FLAG_H_INT_ESB) && xive_ops->esb_rw)
>  		xive_ops->esb_rw(xd->hw_irq, offset, data, 1);
>  	else
> diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
> index 5f1e5aed8ab4..0310783241b5 100644
> --- a/arch/powerpc/sysdev/xive/native.c
> +++ b/arch/powerpc/sysdev/xive/native.c
> @@ -64,8 +64,6 @@ int xive_native_populate_irq_data(u32 hw_irq, struct xi=
ve_irq_data *data)
>  		data->flags |=3D XIVE_IRQ_FLAG_STORE_EOI;
>  	if (opal_flags & OPAL_XIVE_IRQ_LSI)
>  		data->flags |=3D XIVE_IRQ_FLAG_LSI;
> -	if (opal_flags & OPAL_XIVE_IRQ_SHIFT_BUG)
> -		data->flags |=3D XIVE_IRQ_FLAG_SHIFT_BUG;
>  	if (opal_flags & OPAL_XIVE_IRQ_MASK_VIA_FW)
>  		data->flags |=3D XIVE_IRQ_FLAG_MASK_FW;
>  	if (opal_flags & OPAL_XIVE_IRQ_EOI_VIA_FW)

