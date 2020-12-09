Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A382D45CF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 16:53:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrhRJ1HbRzDqHL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 02:53:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.45.220; helo=5.mo52.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 5.mo52.mail-out.ovh.net (5.mo52.mail-out.ovh.net
 [188.165.45.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrhN261MmzDqkb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 02:50:42 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 0C69A221AC7;
 Wed,  9 Dec 2020 16:50:38 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 9 Dec 2020
 16:50:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0060419b24f-f79b-4594-b157-12c20c6a2375,
 661A724A132DD26A84B163D3BB90DC3732340046) smtp.auth=groug@kaod.org
Date: Wed, 9 Dec 2020 16:50:35 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 07/13] powerpc/xive: Add a debug_show handler to the
 XIVE irq_domain
Message-ID: <20201209165035.65c8a731@bahia.lan>
In-Reply-To: <20201208151124.1329942-8-clg@kaod.org>
References: <20201208151124.1329942-1-clg@kaod.org>
 <20201208151124.1329942-8-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 01299ab5-fe9e-40e0-9265-678c55997004
X-Ovh-Tracer-Id: 17459611332084210074
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudejkedgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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

On Tue, 8 Dec 2020 16:11:18 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Full state of the Linux interrupt descriptors can be dumped under
> debugfs when compiled with CONFIG_GENERIC_IRQ_DEBUGFS. Add support for
> the XIVE interrupt controller.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/sysdev/xive/common.c | 58 +++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 721617f0f854..411cba12d73b 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1303,11 +1303,69 @@ static int xive_irq_domain_match(struct irq_domai=
n *h, struct device_node *node,
>  	return xive_ops->match(node);
>  }
> =20
> +#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
> +static const char * const esb_names[] =3D { "RESET", "OFF", "PENDING", "=
QUEUED" };
> +
> +static const struct {
> +	u64  mask;
> +	char *name;
> +} xive_irq_flags[] =3D {
> +	{ XIVE_IRQ_FLAG_STORE_EOI, "STORE_EOI" },
> +	{ XIVE_IRQ_FLAG_LSI,       "LSI"       },

> +	{ XIVE_IRQ_FLAG_SHIFT_BUG, "SHIFT_BUG" },
> +	{ XIVE_IRQ_FLAG_MASK_FW,   "MASK_FW"   },
> +	{ XIVE_IRQ_FLAG_EOI_FW,    "EOI_FW"    },

If seems that you don't even need these ^^ if you move this patch after
patch 11 actually.

> +	{ XIVE_IRQ_FLAG_H_INT_ESB, "H_INT_ESB" },
> +	{ XIVE_IRQ_FLAG_NO_EOI,    "NO_EOI"    },
> +};
> +
> +static void xive_irq_domain_debug_show(struct seq_file *m, struct irq_do=
main *d,
> +				       struct irq_data *irqd, int ind)
> +{
> +	struct xive_irq_data *xd;
> +	u64 val;
> +	int i;
> +
> +	/* No IRQ domain level information. To be done */
> +	if (!irqd)
> +		return;
> +
> +	if (!is_xive_irq(irq_data_get_irq_chip(irqd)))

Wouldn't it be a bug to get anything else but the XIVE irqchip here ?

WARN_ON_ONCE() ?

> +		return;
> +
> +	seq_printf(m, "%*sXIVE:\n", ind, "");
> +	ind++;
> +
> +	xd =3D irq_data_get_irq_handler_data(irqd);
> +	if (!xd) {
> +		seq_printf(m, "%*snot assigned\n", ind, "");
> +		return;
> +	}
> +
> +	val =3D xive_esb_read(xd, XIVE_ESB_GET);
> +	seq_printf(m, "%*sESB:      %s\n", ind, "", esb_names[val & 0x3]);
> +	seq_printf(m, "%*sPstate:   %s %s\n", ind, "", xd->stale_p ? "stale" : =
"",
> +		   xd->saved_p ? "saved" : "");
> +	seq_printf(m, "%*sTarget:   %d\n", ind, "", xd->target);
> +	seq_printf(m, "%*sChip:     %d\n", ind, "", xd->src_chip);
> +	seq_printf(m, "%*sTrigger:  0x%016llx\n", ind, "", xd->trig_page);
> +	seq_printf(m, "%*sEOI:      0x%016llx\n", ind, "", xd->eoi_page);
> +	seq_printf(m, "%*sFlags:    0x%llx\n", ind, "", xd->flags);
> +	for (i =3D 0; i < ARRAY_SIZE(xive_irq_flags); i++) {
> +		if (xd->flags & xive_irq_flags[i].mask)
> +			seq_printf(m, "%*s%s\n", ind + 12, "", xive_irq_flags[i].name);
> +	}
> +}
> +#endif
> +
>  static const struct irq_domain_ops xive_irq_domain_ops =3D {
>  	.match =3D xive_irq_domain_match,
>  	.map =3D xive_irq_domain_map,
>  	.unmap =3D xive_irq_domain_unmap,
>  	.xlate =3D xive_irq_domain_xlate,
> +#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
> +	.debug_show =3D xive_irq_domain_debug_show,
> +#endif
>  };
> =20
>  static void __init xive_init_host(struct device_node *np)

