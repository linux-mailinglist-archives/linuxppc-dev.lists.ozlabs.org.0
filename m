Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5033321BA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvqJq5fmVz3cLY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 20:14:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=groug@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvqJV3cJ5z30LP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 20:13:45 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9462A8E05C56;
 Tue,  9 Mar 2021 10:13:41 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 10:13:40 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004591d6a76-2c49-4261-b780-3ace89d0a383,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 10:13:39 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 4/8] powerpc/xive: Simplify xive_core_debug_show()
Message-ID: <20210309101339.1b1e2d4e@bahia.lan>
In-Reply-To: <464b873b-b8d9-c656-fb72-365bfca9d8c6@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-5-clg@kaod.org>
 <20210308190710.4dba0379@bahia.lan>
 <464b873b-b8d9-c656-fb72-365bfca9d8c6@kaod.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: f8ceb63e-81ee-46cd-9ef6-bb8ab692b4e5
X-Ovh-Tracer-Id: 4342877418063501789
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduhedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

On Mon, 8 Mar 2021 19:11:11 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 3/8/21 7:07 PM, Greg Kurz wrote:
> > On Wed, 3 Mar 2021 18:48:53 +0100
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >=20
> >> Now that the IPI interrupt has its own domain, the checks on the HW
> >> interrupt number XIVE_IPI_HW_IRQ and on the chip can be replaced by a
> >> check on the domain.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> ---
> >=20
> > Shouldn't this have the following tags ?
> >=20
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Fixes: 930914b7d528 ("powerpc/xive: Add a debugfs file to dump internal=
 XIVE state")
>=20
> The next patch has because it removes the useless check on irq_data.
> =20

Ok I get it. This report isn't about an actual crash. Just a false
positive because of the not needed check in the caller.

> C.
>=20
> >=20
> > Anyway,
> >=20
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> >=20
> >>  arch/powerpc/sysdev/xive/common.c | 18 ++++--------------
> >>  1 file changed, 4 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/x=
ive/common.c
> >> index 678680531d26..7581cb12bb53 100644
> >> --- a/arch/powerpc/sysdev/xive/common.c
> >> +++ b/arch/powerpc/sysdev/xive/common.c
> >> @@ -1579,17 +1579,14 @@ static void xive_debug_show_cpu(struct seq_fil=
e *m, int cpu)
> >>  	seq_puts(m, "\n");
> >>  }
> >> =20
> >> -static void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, struc=
t irq_data *d)
> >> +static void xive_debug_show_irq(struct seq_file *m, struct irq_data *=
d)
> >>  {
> >> -	struct irq_chip *chip =3D irq_data_get_irq_chip(d);
> >> +	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
> >>  	int rc;
> >>  	u32 target;
> >>  	u8 prio;
> >>  	u32 lirq;
> >> =20
> >> -	if (!is_xive_irq(chip))
> >> -		return;
> >> -
> >>  	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
> >>  	if (rc) {
> >>  		seq_printf(m, "IRQ 0x%08x : no config rc=3D%d\n", hw_irq, rc);
> >> @@ -1627,16 +1624,9 @@ static int xive_core_debug_show(struct seq_file=
 *m, void *private)
> >> =20
> >>  	for_each_irq_desc(i, desc) {
> >>  		struct irq_data *d =3D irq_desc_get_irq_data(desc);
> >> -		unsigned int hw_irq;
> >> -
> >> -		if (!d)
> >> -			continue;
> >> -
> >> -		hw_irq =3D (unsigned int)irqd_to_hwirq(d);
> >> =20
> >> -		/* IPIs are special (HW number 0) */
> >> -		if (hw_irq !=3D XIVE_IPI_HW_IRQ)
> >> -			xive_debug_show_irq(m, hw_irq, d);
> >> +		if (d->domain =3D=3D xive_irq_domain)
> >> +			xive_debug_show_irq(m, d);
> >>  	}
> >>  	return 0;
> >>  }
> >=20
>=20

