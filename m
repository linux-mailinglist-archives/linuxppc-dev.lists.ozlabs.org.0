Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A9221E19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 10:20:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6nHs0rpYzDqwh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 18:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6nG32w2YzDqs3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 18:18:50 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-49-8A3qEGEvNG-fIwJc6vWVRQ-1; Thu, 16 Jul 2020 09:18:43 +0100
X-MC-Unique: 8A3qEGEvNG-fIwJc6vWVRQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 16 Jul 2020 09:18:41 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 16 Jul 2020 09:18:41 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bjorn Helgaas' <helgaas@kernel.org>
Subject: RE: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Topic: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Index: AQHWWnPXll7fc/pDfESpF9qKWOuIcakIsKIAgABwtYCAALseUA==
Date: Thu, 16 Jul 2020 08:18:41 +0000
Message-ID: <f8022e41f3384d57a3802aafe8187e9a@AcuMS.aculab.com>
References: <4c994d9a804b4a2c8555c50b63e20772@AcuMS.aculab.com>
 <20200715220135.GA563272@bjorn-Precision-5520>
In-Reply-To: <20200715220135.GA563272@bjorn-Precision-5520>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
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
Cc: Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Kjetil Oftedal <oftedal@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Christoph Hellwig <hch@lst.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-pci <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matt Turner <mattst88@gmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, 'Arnd Bergmann' <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Jens Axboe <axboe@fb.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Shuah
 Khan <skhan@linuxfoundation.org>, "bjorn@helgaas.com" <bjorn@helgaas.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Richard
 Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas
> Sent: 15 July 2020 23:02
>=20
> On Wed, Jul 15, 2020 at 02:24:21PM +0000, David Laight wrote:
> > From: Arnd Bergmann
> > > Sent: 15 July 2020 07:47
> > > On Wed, Jul 15, 2020 at 1:46 AM Bjorn Helgaas <helgaas@kernel.org> wr=
ote:
> > >
> > >  So something like:
> > > >
> > > >   void pci_read_config_word(struct pci_dev *dev, int where, u16 *va=
l)
> > > >
> > > > and where we used to return anything non-zero, we just set *val =3D=
 ~0
> > > > instead?  I think we do that already in most, maybe all, cases.
> > >
> > > Right, this is what I had in mind. If we start by removing the handli=
ng
> > > of the return code in all files that clearly don't need it, looking a=
t
> > > whatever remains will give a much better idea of what a good interfac=
e
> > > should be.
> >
> > It would be best to get rid of that nasty 'u16 *' parameter.
>=20
> Do you mean nasty because it's basically a return value, but not
> returned as the *function's* return value?  I agree that if we were
> starting from scratch it would nicer to have:
>=20
>   u16 pci_read_config_word(struct pci_dev *dev, int where)
>=20
> but I don't think it's worth changing the thousands of callers just
> for that.

It'll shrink the kernel text size somewhat.
It could also be 'fixed' with a static inline.

Actually you don't even want the result to be u16.
Even though the domain of the value is 0..65535 keeping
the type as int (or unsigned int) will save the compiler
having to generate lots of masking instructions.

Code performance here will be overwhelmed by the time taken
for the config space access.
But more generally all local variables should really be
the size of cpu registers.

On x86-64 you need to use 'unsigned int' for anything used
as array subscripts to avoid the 'sign extend' instructions.
In some code paths it may matter...

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

