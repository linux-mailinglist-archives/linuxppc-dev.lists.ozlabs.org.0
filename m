Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E634B3927
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 04:01:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxBw43C3Jz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 14:01:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxBvc4xssz30Lp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 14:01:31 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-230-aZDGCbkKMKmOLXdRHLKgCw-1; Sun, 13 Feb 2022 03:01:25 +0000
X-MC-Unique: aZDGCbkKMKmOLXdRHLKgCw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sun, 13 Feb 2022 03:01:24 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sun, 13 Feb 2022 03:01:24 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: RE: [PATCH 2/2] powerpc/32: Implement csum_sub
Thread-Topic: [PATCH 2/2] powerpc/32: Implement csum_sub
Thread-Index: AQHYHzGljVa6S8GqcUW0lv81TntuEayQyZKA
Date: Sun, 13 Feb 2022 03:01:24 +0000
Message-ID: <a87eb9e5bb6d483f8352ccb4b7374286@AcuMS.aculab.com>
References: <0c8eaab8f0685d2a70d125cf876238c70afd4fb6.1644574987.git.christophe.leroy@csgroup.eu>
 <c2a3f87d97f0903fdef3bbcb84661f75619301bf.1644574987.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c2a3f87d97f0903fdef3bbcb84661f75619301bf.1644574987.git.christophe.leroy@csgroup.eu>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy
> Sent: 11 February 2022 10:25
>=20
> When building kernel with CONFIG_CC_OPTIMISE_FOR_SIZE, several
> copies of csum_sub() are generated, with the following code:
>=20
> =0900000170 <csum_sub>:
> =09     170:=097c 84 20 f8 =09not     r4,r4
> =09     174:=097c 63 20 14 =09addc    r3,r3,r4
> =09     178:=097c 63 01 94 =09addze   r3,r3
> =09     17c:=094e 80 00 20 =09blr
>=20
> Let's define a PPC32 version with subc/addme, and for it's inlining.
>=20
> It will return 0 instead of 0xffffffff when subtracting 0x80000000 to its=
elf,
> this is not an issue as 0 and ~0 are equivalent, refer to RFC 1624.

They are not always equivalent.
In particular in the UDP checksum field one of them is (0?) 'checksum not c=
alculated'.

I think all the Linux functions have to return a non-zero value (for non-ze=
ro input).

If the csum is going to be converted to 16 bit, inverted, and put into a pa=
cket
the code usually has to have a check that changes 0 to 0xffff.
However if the csum functions guarantee never to return zero they can feed
an extra 1 into the first csum_partial() then just invert and add 1 at the =
end.
Because (~csum_partion(buffer, 1) + 1) is the same as ~csum_partial(buffer,=
 0)
except when the buffer's csum is 0xffffffff.

I did do some experiments and the 64bit value can be reduced directly to
16bits using '% 0xffff'.
This is different because it returns 0 not 0xffff.
However gcc 'randomly' picks between the fast 'multiply by reciprocal'
and slow divide instruction paths.
The former is (probably) faster than reducing using shifts and adc.
The latter definitely slower.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

