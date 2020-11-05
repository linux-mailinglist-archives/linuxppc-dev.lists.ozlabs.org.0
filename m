Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C85C52A7881
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 09:02:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRbbh61bZzDqsW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 19:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.242;
 helo=mslow2.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=bootlin.com
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRbYr65ZQzDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 19:01:01 +1100 (AEDT)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 9DFAD3A4833
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 07:50:24 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9B8ADC0005;
 Thu,  5 Nov 2020 07:49:40 +0000 (UTC)
Date: Thu, 5 Nov 2020 08:49:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Kernel 5.10-rc1 not mounting NAND flash (Bisected to
 d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing
 bits"))
Message-ID: <20201105084939.72ea6bfd@xps13>
In-Reply-To: <a04de8a0-4e3b-d9c6-139e-c25d9d5423d1@csgroup.eu>
References: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
 <20201104183859.590f0806@xps13>
 <a04de8a0-4e3b-d9c6-139e-c25d9d5423d1@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Christophe Leroy <christophe.leroy@csgroup.eu> wrote on Wed, 4 Nov 2020
19:37:57 +0100:

> Hi Miquel,
>=20
> Le 04/11/2020 =C3=A0 18:38, Miquel Raynal a =C3=A9crit=C2=A0:
> > Hi Christophe,
> >=20
> > Christophe Leroy <christophe.leroy@csgroup.eu> wrote on Wed, 04 Nov
> > 2020 18:33:53 +0100:
> >  =20
> >> Hi Miquel,
> >>
> >> I'm unable to boot 5.10-rc1 on my boards. I get the following error:
> >>
> >> [    4.125811] nand: device found, Manufacturer ID: 0xad, Chip ID: 0x76
> >> [    4.131992] nand: Hynix NAND 64MiB 3,3V 8-bit
> >> [    4.136173] nand: 64 MiB, SLC, erase size: 16 KiB, page size: 512, =
OOB size: 16
> >> [    4.143534] ------------[ cut here ]------------
> >> [    4.147934] Unsupported ECC algorithm!
> >> [    4.152142] WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/nand_bas=
e.c:5244 nand_scan_with_ids+0x1260/0x1640
> >> ...
> >> [    4.332052] ---[ end trace e3a36f62cae4ac56 ]---
> >> [    4.336882] gpio-nand: probe of c0000000.nand failed with error -22
> >>
> >> Bisected to commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework =
user input parsing bits")
> >>
> >> My first impression is that with that change, the value set in chip->e=
cc.algo
> >> by gpio_nand_probe() in drivers/mtd/nand/raw/gpio.c gets overwritten i=
n rawnand_dt_init()
> >>
> >> The following change fixes the problem, though I'm not sure it is the =
right fix. Can you have a look ?
> >>
> >> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/n=
and_base.c
> >> index 1f0d542d5923..aa74797cf2da 100644
> >> --- a/drivers/mtd/nand/raw/nand_base.c
> >> +++ b/drivers/mtd/nand/raw/nand_base.c
> >> @@ -5032,7 +5032,8 @@ static int rawnand_dt_init(struct nand_chip *chi=
p)
> >>    		chip->ecc.engine_type =3D nand->ecc.defaults.engine_type;
> >>
> >>    	chip->ecc.placement =3D nand->ecc.user_conf.placement;
> >> -	chip->ecc.algo =3D nand->ecc.user_conf.algo;
> >> +	if (chip->ecc.algo =3D=3D NAND_ECC_ALGO_UNKNOWN)
> >> +		chip->ecc.algo =3D nand->ecc.user_conf.algo;
> >>    	chip->ecc.strength =3D nand->ecc.user_conf.strength;
> >>    	chip->ecc.size =3D nand->ecc.user_conf.step_size;
> >>
> >> ---
> >>
> >> Thanks
> >> Christophe =20
> >=20
> > Sorry for introducing this issue, I didn't had the time to send the
> > Fixes PR yet but I think this issue has been solved already. Could
> > you please try with a recent linux-next?
> >  =20
>=20
> Sorry, same problem with "Linux version 5.10.0-rc2-next-20201104"

Can you please give this patch a try, please?

---8<---

Author: Miquel Raynal <miquel.raynal@bootlin.com>
Date:   Thu Nov 5 08:44:48 2020 +0100

    mtd: rawnand: gpio: Move the ECC initialization to ->attach_chip()
   =20
    While forcing a Hamming software ECC looks clearly wrong, let's just
    fix the situation for now and move these lines to the ->attach_chip()
    hook which gets executed after the user input parsing and NAND chip
    discovery.
   =20
    Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input pa=
rsing bits")
    Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 3bd847ccc3f3..6feab847f5e0 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -161,8 +161,15 @@ static int gpio_nand_exec_op(struct nand_chip *chip,
        return ret;
 }
=20
+static int gpio_nand_attach_chip(struct nand_chip *chip)
+{
+       chip->ecc.mode =3D NAND_ECC_SOFT;
+       chip->ecc.algo =3D NAND_ECC_HAMMING;
+}
+
 static const struct nand_controller_ops gpio_nand_ops =3D {
        .exec_op =3D gpio_nand_exec_op,
+       .attach_chip =3D gpio_nand_attach_chip,
 };
=20
 #ifdef CONFIG_OF
@@ -342,8 +349,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
        gpiomtd->base.ops =3D &gpio_nand_ops;
=20
        nand_set_flash_node(chip, pdev->dev.of_node);
-       chip->ecc.mode          =3D NAND_ECC_SOFT;
-       chip->ecc.algo          =3D NAND_ECC_HAMMING;
        chip->options           =3D gpiomtd->plat.options;
        chip->controller        =3D &gpiomtd->base;
=20
