Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 652354B3C9E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 18:48:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxZZx0DJ0z3cRF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:48:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxZZT3PrFz2xsS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 04:47:59 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-186-LeVe8n1APwumlclMeJaqYQ-1; Sun, 13 Feb 2022 17:47:54 +0000
X-MC-Unique: LeVe8n1APwumlclMeJaqYQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sun, 13 Feb 2022 17:47:52 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sun, 13 Feb 2022 17:47:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>
Subject: RE: [PATCH] net: Remove branch in csum_shift()
Thread-Topic: [PATCH] net: Remove branch in csum_shift()
Thread-Index: AQHYHyQqmTo4K/pb5UWdDmTfE7rfRayQxWFwgABxD4CAAIxicA==
Date: Sun, 13 Feb 2022 17:47:52 +0000
Message-ID: <476aa649389345db92f86e9103a848be@AcuMS.aculab.com>
References: <efeeb0b9979b0377cd313311ad29cf0ac060ae4b.1644569106.git.christophe.leroy@csgroup.eu>
 <7f16910a8f63475dae012ef5135f41d1@AcuMS.aculab.com>
 <20220213091619.GY614@gate.crashing.org>
In-Reply-To: <20220213091619.GY614@gate.crashing.org>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool=20
> Sent: 13 February 2022 09:16
....
>=20
> > What happens on x86-64?
> >
> > Trying to do the same in the x86 ipcsum code tended to make the code wo=
rse.
> > (Although that test is for an odd length fragment and can just be remov=
ed.)
>=20
> In an ideal world the compiler could choose the optimal code sequences
> everywhere.  But that won't ever happen, the search space is way too
> big.  So compilers just use heuristics, not exhaustive search like
> superopt does.  There is a middle way of course, something with directed
> searches, and maybe in a few decades systems will be fast enough.  Until
> then we will very often see code that is 10% slower and 30% bigger than
> necessary.  A single insn more than needed isn't so bad :-)

But it can be a lot more than that.

> Making things branch-free is very much worth it here though!

I tried to find out where 'here' is.

I can't get godbolt to generate anything like that object code
for a call to csum_shift().

I can't actually get it to issue a rotate (x86 of ppc).

I think it is only a single instruction because the compiler
has saved 'offset & 1' much earlier instead of doing testing
'offset & 1' just prior to the conditional.
It certainly has a nasty habit of doing that pessimisation.

So while it helps a specific call site it may be much
worse in general.

I also suspect that the addc/addze pair could be removed
by passing the old checksum into csum_partial.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

