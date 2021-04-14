Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5113435F7B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 17:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL60w1GjZz3c0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 01:32:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL60b1hZ3z2yRD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 01:32:13 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-260-2ItaeQAlMXO4xATmhgmnXw-1; Wed, 14 Apr 2021 16:32:05 +0100
X-MC-Unique: 2ItaeQAlMXO4xATmhgmnXw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 16:32:05 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 16:32:04 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: RE: [PATCH v1 1/2] powerpc/bitops: Use immediate operand when possible
Thread-Topic: [PATCH v1 1/2] powerpc/bitops: Use immediate operand when
 possible
Thread-Index: AQHXMUHmVAfluj7FfEq84rYmesOs4qq0IuPA
Date: Wed, 14 Apr 2021 15:32:04 +0000
Message-ID: <efcabc9410cf4d03b203749a02e5a935@AcuMS.aculab.com>
References: <09da6fec57792d6559d1ea64e00be9870b02dab4.1617896018.git.christophe.leroy@csgroup.eu>
 <20210412215428.GM26583@gate.crashing.org>
 <ecb1b1a5-ae92-e8a3-6490-26341edfbccb@csgroup.eu>
 <20210413215803.GT26583@gate.crashing.org>
 <1618365589.67fxh7cot9.astroid@bobo.none>
 <20210414122409.GV26583@gate.crashing.org>
 <daacce9f-1900-1034-980b-be5a58d6be09@csgroup.eu>
 <20210414151921.GW26583@gate.crashing.org>
In-Reply-To: <20210414151921.GW26583@gate.crashing.org>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 14 April 2021 16:19
...
> > Could the kernel use GCC builtin atomic functions instead ?
> >
> > https://gcc.gnu.org/onlinedocs/gcc/_005f_005fatomic-Builtins.html
>=20
> Certainly that should work fine for the simpler cases that the atomic
> operations are meant to provide.  But esp. for not-so-simple cases the
> kernel may require some behaviour provided by the existing assembler
> implementation, and not by the atomic builtins.
>=20
> I'm not saying this cannot work, just that some serious testing will be
> needed.  If it works it should be the best of all worlds, so then it is
> a really good idea yes :-)

I suspect they just add an extra layer of abstraction that makes it
even more difficult to verify and could easily get broken by a compiler
update (etc).

The other issue is that the code needs to be correct with compiled
with (for example) -O0.
That could very easily break anything except the asm implementation
if additional memory accesses and/or increased code size cause grief.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

