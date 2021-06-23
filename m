Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5613B1B84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 15:48:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G94N93Z6Bz3bxW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 23:48:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bootlin.com (client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1549 seconds by postgrey-1.36 at boromir;
 Wed, 23 Jun 2021 23:47:51 AEST
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G94Mq2Yzgz2yXt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 23:47:48 +1000 (AEST)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 08E66D091E
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 13:17:12 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 33D8A1BF211;
 Wed, 23 Jun 2021 13:16:41 +0000 (UTC)
Date: Wed, 23 Jun 2021 15:16:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: nand: WARNING: a0000000.nand: the ECC used on your system
 (1b/256B) is too weak compared to the one required by the NAND chip
 (4b/512B)
Message-ID: <20210623151640.34b0fc3a@xps13>
In-Reply-To: <6eb7f394-7e0e-8ecf-e741-f6e6cc322689@csgroup.eu>
References: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
 <20210618084326.0a074fb7@xps13>
 <d37a8a7e-6181-9642-18fb-470d1d8cf006@csgroup.eu>
 <20210618225032.69cdc30c@xps13>
 <6eb7f394-7e0e-8ecf-e741-f6e6cc322689@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

Christophe Leroy <christophe.leroy@csgroup.eu> wrote on Wed, 23 Jun
2021 11:41:46 +0200:

> Le 19/06/2021 =C3=A0 20:40, Miquel Raynal a =C3=A9crit=C2=A0:
> > Hi Christophe,
> >  =20
> >>>> Now and then I'm using one of the latest kernels (Today is 5.13-rc6)=
, and sometime in one of the 5.x releases, I started to get errors like:
> >>>>
> >>>> [    5.098265] ecc_sw_hamming_correct: uncorrectable ECC error
> >>>> [    5.103859] ubi0 warning: ubi_io_read: error -74 (ECC error) whil=
e reading 60
> >>>>     bytes from PEB 99:59824, read only 60 bytes, retry
> >>>> [    5.525843] ecc_sw_hamming_correct: uncorrectable ECC error
> >>>> [    5.531571] ecc_sw_hamming_correct: uncorrectable ECC error
> >>>> [    5.537490] ubi0 warning: ubi_io_read: error -74 (ECC error) whil=
e reading 30
> >>>> 73 bytes from PEB 107:108976, read only 3073 bytes, retry
> >>>> [    5.691121] ecc_sw_hamming_correct: uncorrectable ECC error
> >>>> [    5.696709] ecc_sw_hamming_correct: uncorrectable ECC error
> >>>> [    5.702426] ecc_sw_hamming_correct: uncorrectable ECC error
> >>>> [    5.708141] ecc_sw_hamming_correct: uncorrectable ECC error
> >>>> [    5.714103] ubi0 warning: ubi_io_read: error -74 (ECC error) whil=
e reading 30
> >>>> 35 bytes from PEB 107:25144, read only 3035 bytes, retry
> >>>> [   20.523689] random: crng init done
> >>>> [   21.892130] ecc_sw_hamming_correct: uncorrectable ECC error
> >>>> [   21.897730] ubi0 warning: ubi_io_read: error -74 (ECC error) whil=
e reading 13
> >>>> 94 bytes from PEB 116:75776, read only 1394 bytes, retry
> >>>>
> >>>> Most of the time, when the reading of the file fails, I just have to=
 read it once more and it gets read without that error. =20
> >>>
> >>> It really looks like a regular bitflip happening "sometimes". Is this=
 a
> >>> board which already had a life? What are the usage counters (UBI shou=
ld
> >>> tell you this) compared to the official endurance of your chip (see t=
he
> >>> datasheet)? =20
> >>
> >> The board had a peacefull life:
> >>
> >> UBI reports "ubi0: max/mean erase counter: 49/20, WL threshold: 4096" =
=20
> >=20
> > Mmmh. Indeed.
> >  =20
> >>
> >> I have tried with half a dozen of boards and all have the issue.
> >> =20
> >>>    >>>> What am I supposed to do to avoid the ECC weakness warning at=
 startup and to fix that ECC error issue ? =20
> >>>
> >>> I honestly don't think the errors come from the 5.1x kernels given the
> >>> above logs. If you flash back your old 4.14 I am pretty sure you'll
> >>> have the same errors at some point. =20
> >>
> >> I don't have any problem like that with 4.14 with any of the board.
> >>
> >> When booting a 4.14 kernel I don't get any problem on the same board.
> >> =20
> >=20
> > If you can reliably show that when returning to a 4.14 kernel the ECC
> > weakness disappears, then there is certainly something new. What driver
> > are you using? Maybe you can do a bisection? =20
>=20
> Using the GPIO driver, and the NAND chip is a HYNIX.
>=20
> I can say that the ECC weakness doesn't exist until v5.5 included. The we=
akness appears with v5.6.
>=20
> I have tried bisection between those two versions and I couldn't end up t=
o a reliable result. The closer the v5.5 you go, the more difficult it is t=
o reproduce the issue.
>=20
> So I looked at what was done around the places, and in fact that's mainly=
 optimisation in the powerpc code. It seems that the more powerpc is optimi=
sed, the more the problem occurs.
>=20
> Looking at the GPIO nand driver, I saw that no-op gpio_nand_dosync() func=
tion. By adding a memory barrier in that function, the ECC weakness disappe=
ared completely.

I see that the 'fix' in gpio_nand_dosync() has only been designed for
ARM platforms, perhaps it would make sense to have a PPC variant here?

> Not sure what the final solution has to be.

Perhaps PowerPC maintainers can sched some light on these findings?

Thanks,
Miqu=C3=A8l
