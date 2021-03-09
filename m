Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0453322E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 11:23:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvrsK47ryz3cV7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 21:23:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.121.110; helo=1.mo51.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Received: from 1.mo51.mail-out.ovh.net (1.mo51.mail-out.ovh.net
 [178.32.121.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvrs164dbz30Kv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 21:23:32 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.206])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 3CEB425F18E;
 Tue,  9 Mar 2021 11:23:28 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 11:23:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003f27ff26d-f500-42e0-ac23-557abc60056a,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 11:23:25 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 7/8] powerpc/xive: Fix xmon command "dxi"
Message-ID: <20210309112325.7b161cc7@bahia.lan>
In-Reply-To: <20210303174857.1760393-8-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-8-clg@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 0ea67159-ad42-4e74-8f4f-0de1382fc99b
X-Ovh-Tracer-Id: 5521413143258110371
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

On Wed, 3 Mar 2021 18:48:56 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> When under xmon, the "dxi" command dumps the state of the XIVE
> interrupts. If an interrupt number is specified, only the state of
> the associated XIVE interrupt is dumped. This form of the command
> lacks an irq_data parameter which is nevertheless used by
> xmon_xive_get_irq_config(), leading to an xmon crash.
>=20
> Fix that by doing a lookup in the system IRQ mapping to query the IRQ
> descriptor data. Invalid interrupt numbers, or not belonging to the
> XIVE IRQ domain, OPAL event interrupt number for instance, should be
> caught by the previous query done at the firmware level.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 97ef27507793 ("powerpc/xive: Fix xmon support on the PowerNV platf=
orm")
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

I've tested this in a KVM guest and it seems to do the job.

6:mon> dxi 1201
IRQ 0x00001201 : target=3D0xfffffc00 prio=3Dff lirq=3D0x0 flags=3D LH PQ=3D=
-Q

Bad HW irq numbers are filtered by the hypervisor:

6:mon> dxi bad
[  696.390577] xive: H_INT_GET_SOURCE_CONFIG lisn=3D2989 failed -55
IRQ 0x00000bad : no config rc=3D-6

Note that this also allows to show IPIs:

6:mon> dxi 0
IRQ 0x00000000 : target=3D0x0 prio=3D06 lirq=3D0x10=20

This is a bit inconsistent with output of the 0-argument form of "dxi",
which filters them out for a reason that isn't obvious to me. No big
deal though, this should be addressed in another patch anyway.

Reviewed-and-tested-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/sysdev/xive/common.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
> index f6b7b15bbb3a..8eefd152b947 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -255,17 +255,20 @@ notrace void xmon_xive_do_dump(int cpu)
>  	xmon_printf("\n");
>  }
> =20
> +static struct irq_data *xive_get_irq_data(u32 hw_irq)
> +{
> +	unsigned int irq =3D irq_find_mapping(xive_irq_domain, hw_irq);
> +
> +	return irq ? irq_get_irq_data(irq) : NULL;
> +}
> +
>  int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d)
>  {
> -	struct irq_chip *chip =3D irq_data_get_irq_chip(d);
>  	int rc;
>  	u32 target;
>  	u8 prio;
>  	u32 lirq;
> =20
> -	if (!is_xive_irq(chip))
> -		return -EINVAL;
> -
>  	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
>  	if (rc) {
>  		xmon_printf("IRQ 0x%08x : no config rc=3D%d\n", hw_irq, rc);
> @@ -275,6 +278,9 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_d=
ata *d)
>  	xmon_printf("IRQ 0x%08x : target=3D0x%x prio=3D%02x lirq=3D0x%x ",
>  		    hw_irq, target, prio, lirq);
> =20
> +	if (!d)
> +		d =3D xive_get_irq_data(hw_irq);
> +
>  	if (d) {
>  		struct xive_irq_data *xd =3D irq_data_get_irq_handler_data(d);
>  		u64 val =3D xive_esb_read(xd, XIVE_ESB_GET);

