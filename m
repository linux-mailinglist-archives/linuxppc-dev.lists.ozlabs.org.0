Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6854A2A6C23
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 18:48:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRDfX4npFzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 04:48:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRDcj4q1lzDqVs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 04:47:14 +1100 (AEDT)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 284A93A88B2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 17:39:37 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 99DDE200008;
 Wed,  4 Nov 2020 17:39:00 +0000 (UTC)
Date: Wed, 4 Nov 2020 18:38:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Kernel 5.10-rc1 not mounting NAND flash (Bisected to
 d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing
 bits"))
Message-ID: <20201104183859.590f0806@xps13>
In-Reply-To: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
References: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
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

Christophe Leroy <christophe.leroy@csgroup.eu> wrote on Wed, 04 Nov
2020 18:33:53 +0100:

> Hi Miquel,
>=20
> I'm unable to boot 5.10-rc1 on my boards. I get the following error:
>=20
> [    4.125811] nand: device found, Manufacturer ID: 0xad, Chip ID: 0x76
> [    4.131992] nand: Hynix NAND 64MiB 3,3V 8-bit
> [    4.136173] nand: 64 MiB, SLC, erase size: 16 KiB, page size: 512, OOB=
 size: 16
> [    4.143534] ------------[ cut here ]------------
> [    4.147934] Unsupported ECC algorithm!
> [    4.152142] WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/nand_base.c=
:5244 nand_scan_with_ids+0x1260/0x1640
> ...
> [    4.332052] ---[ end trace e3a36f62cae4ac56 ]---
> [    4.336882] gpio-nand: probe of c0000000.nand failed with error -22
>=20
> Bisected to commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework use=
r input parsing bits")
>=20
> My first impression is that with that change, the value set in chip->ecc.=
algo
> by gpio_nand_probe() in drivers/mtd/nand/raw/gpio.c gets overwritten in r=
awnand_dt_init()
>=20
> The following change fixes the problem, though I'm not sure it is the rig=
ht fix. Can you have a look ?
>=20
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand=
_base.c
> index 1f0d542d5923..aa74797cf2da 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5032,7 +5032,8 @@ static int rawnand_dt_init(struct nand_chip *chip)
>   		chip->ecc.engine_type =3D nand->ecc.defaults.engine_type;
>=20
>   	chip->ecc.placement =3D nand->ecc.user_conf.placement;
> -	chip->ecc.algo =3D nand->ecc.user_conf.algo;
> +	if (chip->ecc.algo =3D=3D NAND_ECC_ALGO_UNKNOWN)
> +		chip->ecc.algo =3D nand->ecc.user_conf.algo;
>   	chip->ecc.strength =3D nand->ecc.user_conf.strength;
>   	chip->ecc.size =3D nand->ecc.user_conf.step_size;
>=20
> ---
>=20
> Thanks
> Christophe

Sorry for introducing this issue, I didn't had the time to send the
Fixes PR yet but I think this issue has been solved already. Could
you please try with a recent linux-next?

Thanks,
Miqu=C3=A8l
