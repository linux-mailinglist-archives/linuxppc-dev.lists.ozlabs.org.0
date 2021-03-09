Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A393332240
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 10:42:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvqxv6wxBz3cQS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 20:42:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvqxZ6N04z30Lr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 20:42:25 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 398148E07FF1;
 Tue,  9 Mar 2021 10:42:23 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 10:42:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00261f12ed3-cf67-4921-a2f4-da67285adf7d,
 5BB0FC21D60CBA87691D752E0F3295FDC8BC83A3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 9 Mar 2021 10:42:20 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 4/8] powerpc/xive: Simplify xive_core_debug_show()
Message-ID: <20210309104220.663840a2@bahia.lan>
In-Reply-To: <20210309101339.1b1e2d4e@bahia.lan>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-5-clg@kaod.org>
 <20210308190710.4dba0379@bahia.lan>
 <464b873b-b8d9-c656-fb72-365bfca9d8c6@kaod.org>
 <20210309101339.1b1e2d4e@bahia.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 4e2b8982-d5e7-43ed-9eb4-a46ed08c0b3c
X-Ovh-Tracer-Id: 4827577325782473114
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveelhfdtudffhfeiveehhfelgeellefgteffteekudegheejfffghefhfeeuudffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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

On Tue, 9 Mar 2021 10:13:39 +0100
Greg Kurz <groug@kaod.org> wrote:

> On Mon, 8 Mar 2021 19:11:11 +0100
> C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>=20
> > On 3/8/21 7:07 PM, Greg Kurz wrote:
> > > On Wed, 3 Mar 2021 18:48:53 +0100
> > > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> > >=20
> > >> Now that the IPI interrupt has its own domain, the checks on the HW
> > >> interrupt number XIVE_IPI_HW_IRQ and on the chip can be replaced by a
> > >> check on the domain.
> > >>
> > >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > >> ---
> > >=20
> > > Shouldn't this have the following tags ?
> > >=20
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Fixes: 930914b7d528 ("powerpc/xive: Add a debugfs file to dump intern=
al XIVE state")
> >=20
> > The next patch has because it removes the useless check on irq_data.
> > =20
>=20
> Ok I get it. This report isn't about an actual crash. Just a false
> positive because of the not needed check in the caller.
>=20

Hrm... I meant because of the check in xive_debug_show_irq(). On the
contrary, the check removed by this patch in xive_core_debug_show()
was rather an explicit hint that xive_debug_show_irq() couldn't be
called with d being NULL.

> > C.
> >=20
> > >=20
> > > Anyway,
> > >=20
> > > Reviewed-by: Greg Kurz <groug@kaod.org>
> > >=20
> > >>  arch/powerpc/sysdev/xive/common.c | 18 ++++--------------
> > >>  1 file changed, 4 insertions(+), 14 deletions(-)
> > >>
> > >> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev=
/xive/common.c
> > >> index 678680531d26..7581cb12bb53 100644
> > >> --- a/arch/powerpc/sysdev/xive/common.c
> > >> +++ b/arch/powerpc/sysdev/xive/common.c
> > >> @@ -1579,17 +1579,14 @@ static void xive_debug_show_cpu(struct seq_f=
ile *m, int cpu)
> > >>  	seq_puts(m, "\n");
> > >>  }
> > >> =20
> > >> -static void xive_debug_show_irq(struct seq_file *m, u32 hw_irq, str=
uct irq_data *d)
> > >> +static void xive_debug_show_irq(struct seq_file *m, struct irq_data=
 *d)
> > >>  {
> > >> -	struct irq_chip *chip =3D irq_data_get_irq_chip(d);
> > >> +	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
> > >>  	int rc;
> > >>  	u32 target;
> > >>  	u8 prio;
> > >>  	u32 lirq;
> > >> =20
> > >> -	if (!is_xive_irq(chip))
> > >> -		return;
> > >> -
> > >>  	rc =3D xive_ops->get_irq_config(hw_irq, &target, &prio, &lirq);
> > >>  	if (rc) {
> > >>  		seq_printf(m, "IRQ 0x%08x : no config rc=3D%d\n", hw_irq, rc);
> > >> @@ -1627,16 +1624,9 @@ static int xive_core_debug_show(struct seq_fi=
le *m, void *private)
> > >> =20
> > >>  	for_each_irq_desc(i, desc) {
> > >>  		struct irq_data *d =3D irq_desc_get_irq_data(desc);
> > >> -		unsigned int hw_irq;
> > >> -
> > >> -		if (!d)
> > >> -			continue;
> > >> -
> > >> -		hw_irq =3D (unsigned int)irqd_to_hwirq(d);
> > >> =20
> > >> -		/* IPIs are special (HW number 0) */
> > >> -		if (hw_irq !=3D XIVE_IPI_HW_IRQ)
> > >> -			xive_debug_show_irq(m, hw_irq, d);
> > >> +		if (d->domain =3D=3D xive_irq_domain)
> > >> +			xive_debug_show_irq(m, d);
> > >>  	}
> > >>  	return 0;
> > >>  }
> > >=20
> >=20
>=20

