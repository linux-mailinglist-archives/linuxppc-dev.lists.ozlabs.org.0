Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA092956B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 05:25:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGt63290TzDqSl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 14:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CGt4X09nBzDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 14:23:55 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 67D7A2287E;
 Wed, 21 Oct 2020 23:23:49 -0400 (EDT)
Date: Thu, 22 Oct 2020 14:23:57 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] serial: pmac_zilog: don't init if zilog is not available
In-Reply-To: <311d17ed-75fa-a7fe-6c70-177a6eec4519@vivier.eu>
Message-ID: <alpine.LNX.2.23.453.2010221347000.6@nippy.intranet>
References: <20201020162303.1730562-1-laurent@vivier.eu>
 <20201020162844.GA865546@kroah.com>
 <468bbbef-4745-3b16-b6f4-30b46ebcdc33@vivier.eu>
 <20201020173745.GA882703@kroah.com>
 <387fd2aa-b181-c41f-0581-0a7e79a44e41@vivier.eu>
 <20201020183246.GA912431@kroah.com>
 <b52e7fde-8874-3c53-ca13-7709656b69fb@vivier.eu>
 <20201020224446.GA15066@allandria.com>
 <alpine.LNX.2.23.453.2010211038390.6@nippy.intranet>
 <311d17ed-75fa-a7fe-6c70-177a6eec4519@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463811774-718802136-1603337037=:6"
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
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-serial@vger.kernel.org, Brad Boyer <brad@allandria.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463811774-718802136-1603337037=:6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 21 Oct 2020, Laurent Vivier wrote:

> Le 21/10/2020 =C3=A0 01:43, Finn Thain a =C3=A9crit=C2=A0:
>=20
> > Laurent, can we avoid the irq =3D=3D 0 warning splat like this?
> >=20
> > diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_=
zilog.c
> > index 96e7aa479961..7db600cd8cc7 100644
> > --- a/drivers/tty/serial/pmac_zilog.c
> > +++ b/drivers/tty/serial/pmac_zilog.c
> > @@ -1701,8 +1701,10 @@ static int __init pmz_init_port(struct uart_pmac=
_port *uap)
> >  =09int irq;
> > =20
> >  =09r_ports =3D platform_get_resource(uap->pdev, IORESOURCE_MEM, 0);
> > +=09if (!r_ports)
> > +=09=09return -ENODEV;
> >  =09irq =3D platform_get_irq(uap->pdev, 0);
> > -=09if (!r_ports || irq <=3D 0)
> > +=09if (irq <=3D 0)
> >  =09=09return -ENODEV;
> > =20
> >  =09uap->port.mapbase  =3D r_ports->start;
> >=20
>=20
> No, this doesn't fix the problem.
>=20

Then I had better stop guessing and start up Aranym...

The patch below seems to fix the problem for me. Does it work on your=20
system(s)?

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index a621fcc1a576..4e802f70333d 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -776,16 +776,12 @@ static struct resource scc_b_rsrcs[] =3D {
 struct platform_device scc_a_pdev =3D {
 =09.name           =3D "scc",
 =09.id             =3D 0,
-=09.num_resources  =3D ARRAY_SIZE(scc_a_rsrcs),
-=09.resource       =3D scc_a_rsrcs,
 };
 EXPORT_SYMBOL(scc_a_pdev);
=20
 struct platform_device scc_b_pdev =3D {
 =09.name           =3D "scc",
 =09.id             =3D 1,
-=09.num_resources  =3D ARRAY_SIZE(scc_b_rsrcs),
-=09.resource       =3D scc_b_rsrcs,
 };
 EXPORT_SYMBOL(scc_b_pdev);
=20
@@ -812,10 +808,15 @@ static void __init mac_identify(void)
=20
 =09/* Set up serial port resources for the console initcall. */
=20
-=09scc_a_rsrcs[0].start =3D (resource_size_t) mac_bi_data.sccbase + 2;
-=09scc_a_rsrcs[0].end   =3D scc_a_rsrcs[0].start;
-=09scc_b_rsrcs[0].start =3D (resource_size_t) mac_bi_data.sccbase;
-=09scc_b_rsrcs[0].end   =3D scc_b_rsrcs[0].start;
+=09scc_a_rsrcs[0].start     =3D (resource_size_t)mac_bi_data.sccbase + 2;
+=09scc_a_rsrcs[0].end       =3D scc_a_rsrcs[0].start;
+=09scc_a_pdev.num_resources =3D ARRAY_SIZE(scc_a_rsrcs);
+=09scc_a_pdev.resource      =3D scc_a_rsrcs;
+
+=09scc_b_rsrcs[0].start     =3D (resource_size_t)mac_bi_data.sccbase;
+=09scc_b_rsrcs[0].end       =3D scc_b_rsrcs[0].start;
+=09scc_b_pdev.num_resources =3D ARRAY_SIZE(scc_b_rsrcs);
+=09scc_b_pdev.resource      =3D scc_b_rsrcs;
=20
 =09switch (macintosh_config->scc_type) {
 =09case MAC_SCC_PSC:
diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilo=
g.c
index 96e7aa479961..95abdb305d67 100644
--- a/drivers/tty/serial/pmac_zilog.c
+++ b/drivers/tty/serial/pmac_zilog.c
@@ -1697,18 +1697,17 @@ extern struct platform_device scc_a_pdev, scc_b_pde=
v;
=20
 static int __init pmz_init_port(struct uart_pmac_port *uap)
 {
-=09struct resource *r_ports;
-=09int irq;
+=09struct resource *r_ports, *r_irq;
=20
 =09r_ports =3D platform_get_resource(uap->pdev, IORESOURCE_MEM, 0);
-=09irq =3D platform_get_irq(uap->pdev, 0);
-=09if (!r_ports || irq <=3D 0)
+=09r_irq =3D platform_get_resource(uap->pdev, IORESOURCE_IRQ, 0);
+=09if (!r_ports || !r_irq)
 =09=09return -ENODEV;
=20
 =09uap->port.mapbase  =3D r_ports->start;
 =09uap->port.membase  =3D (unsigned char __iomem *) r_ports->start;
 =09uap->port.iotype   =3D UPIO_MEM;
-=09uap->port.irq      =3D irq;
+=09uap->port.irq      =3D r_irq->start;
 =09uap->port.uartclk  =3D ZS_CLOCK;
 =09uap->port.fifosize =3D 1;
 =09uap->port.ops      =3D &pmz_pops;
---1463811774-718802136-1603337037=:6--
