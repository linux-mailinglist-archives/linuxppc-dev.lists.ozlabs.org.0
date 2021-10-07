Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2278424E59
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 09:53:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ3V65KG5z306D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 18:53:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ3Td4SqNz2yKJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 18:53:08 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-38-fz1CuUWYNx6QMVBcOLTHFg-1; Thu, 07 Oct 2021 08:53:02 +0100
X-MC-Unique: fz1CuUWYNx6QMVBcOLTHFg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 7 Oct 2021 08:53:01 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 7 Oct 2021 08:53:01 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Stafford Horne
 <shorne@gmail.com>
Subject: RE: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Thread-Topic: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Thread-Index: AQHXuvrQ2rKkD2ly1kazB6yB6/HdHavHKFTA
Date: Thu, 7 Oct 2021 07:53:01 +0000
Message-ID: <c81b9c01650e487785b02f6562791556@AcuMS.aculab.com>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
 <20211006212728.GM10333@gate.crashing.org>
In-Reply-To: <20211006212728.GM10333@gate.crashing.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "x86@kernel.org" <x86@kernel.org>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Will
 Deacon <will@kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Ray Jui <rjui@broadcom.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Yoshinori Sato <ysato@users.osdn.me>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul
 Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 06 October 2021 22:27
>=20
> On Thu, Oct 07, 2021 at 05:44:00AM +0900, Stafford Horne wrote:
> > You have defined of_get_cpu_hwid to return u64, will this create compil=
er
> > warnings when since we are storing a u64 into a u32?
> >
> > It seems only if we make with W=3D3.
>=20
> Yes.  This is done by -Wconversion, "Warn for implicit conversions that
> may alter a value."
>=20
> > I thought we usually warned on this.

The microsoft compiler does - best to turn all those warnings off.

> This warning is not in -Wall or -Wextra either, it suffers too much from
> false positives.  It is very natural to just ignore the high bits of
> modulo types (which is what "unsigned" types *are*).  Or the bits that
> "fall off" on a conversion.  The C standard makes this required
> behaviour, it is useful, and it is the only convenient way of getting
> this!

I've also seen a compiler convert:
=09struct->char_member =3D (char)(int_val & 0xff);
into:
=09reg =3D int_val;
=09reg &=3D 0xff; // for the & 0xff
=09reg &=3D 0xff; // for the cast
=09struct->char_member =3D low_8bits(reg);

You really don't want the extra noise.

I'll bet that (char)int_val is actually an arithmetic expression.
So its type will be 'int'.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

