Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359E3321ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:28:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvqdj1WtJz3cLL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 20:28:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.77.235; helo=10.mo51.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 574 seconds by postgrey-1.36 at boromir;
 Tue, 09 Mar 2021 20:28:24 AEDT
Received: from 10.mo51.mail-out.ovh.net (10.mo51.mail-out.ovh.net
 [46.105.77.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvqdN2y72z30Mg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 20:28:22 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 0381626AB2C;
 Tue,  9 Mar 2021 10:18:44 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 10:18:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003107742b9-2b6b-4617-a5f7-3e4702163a34,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 10:18:41 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 5/8] powerpc/xive: Drop check on irq_data in
 xive_core_debug_show()
Message-ID: <20210309101841.2117540f@bahia.lan>
In-Reply-To: <20210303174857.1760393-6-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-6-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 87401bf3-250a-4308-a15e-9b5f86c8f3a7
X-Ovh-Tracer-Id: 4428164336141834659
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Mar 2021 18:48:54 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> When looping on IRQ descriptor, irq_data is always valid.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 930914b7d528 ("powerpc/xive: Add a debugfs file to dump internal X=
IVE state")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/common.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index 7581cb12bb53..60ebd6f4b31d 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -1586,6 +1586,8 @@ static void xive_debug_show_irq(struct seq_file *m,=
 struct irq_data *d)
>  	u32 target;
>  	u8 prio;
>  	u32 lirq;
> +	struct xive_irq_data *xd;
> +	u64 val;
> =20
>  	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
>  	if (rc) {
> @@ -1596,17 +1598,14 @@ static void xive_debug_show_irq(struct seq_file *=
m, struct irq_data *d)
>  	seq_printf(m, "IRQ 0x%08x : target=3D0x%x prio=3D%02x lirq=3D0x%x ",
>  		   hw_irq, target, prio, lirq);
> =20
> -	if (d) {
> -		struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
> -		u64 val =3D xive_esb_read(xd, XIVE_ESB_GET);
> -
> -		seq_printf(m, "flags=3D%c%c%c PQ=3D%c%c",
> -			   xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
> -			   xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
> -			   xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
> -			   val & XIVE_ESB_VAL_P ? 'P' : '-',
> -			   val & XIVE_ESB_VAL_Q ? 'Q' : '-');
> -	}
> +	xd =3D irq_data_get_irq_handler_data(d);
> +	val =3D xive_esb_read(xd, XIVE_ESB_GET);
> +	seq_printf(m, "flags=3D%c%c%c PQ=3D%c%c",
> +		   xd->flags & XIVE_IRQ_FLAG_STORE_EOI ? 'S' : ' ',
> +		   xd->flags & XIVE_IRQ_FLAG_LSI ? 'L' : ' ',
> +		   xd->flags & XIVE_IRQ_FLAG_H_INT_ESB ? 'H' : ' ',
> +		   val & XIVE_ESB_VAL_P ? 'P' : '-',
> +		   val & XIVE_ESB_VAL_Q ? 'Q' : '-');
>  	seq_puts(m, "\n");
>  }
> =20

