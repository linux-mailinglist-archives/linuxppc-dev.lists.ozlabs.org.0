Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB123A8C4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 16:45:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BL0zs2XZpzDqTP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 00:45:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BL0wf1yB9zDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 00:42:41 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-106-KJ_ZqZ_BMJa-la9zEBILew-1; Mon, 03 Aug 2020 15:42:29 +0100
X-MC-Unique: KJ_ZqZ_BMJa-la9zEBILew-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 3 Aug 2020 15:42:28 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 3 Aug 2020 15:42:28 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Michael Ellerman' <mpe@ellerman.id.au>, Sandipan Das
 <sandipan@linux.ibm.com>
Subject: RE: [PATCH v2] selftests/powerpc: Fix pkey syscall redefinitions
Thread-Topic: [PATCH v2] selftests/powerpc: Fix pkey syscall redefinitions
Thread-Index: AQHWaYYCOhNCfOwYKEO2Mi+a24qmuqkmdPrA
Date: Mon, 3 Aug 2020 14:42:28 +0000
Message-ID: <bf3af71622474f8fb379da28e05470b2@AcuMS.aculab.com>
References: <566dde119ce71f00f9642807ba30ceb7f54c9bfa.1596441105.git.sandipan@linux.ibm.com>
 <8736540z3w.fsf@mpe.ellerman.id.au>
In-Reply-To: <8736540z3w.fsf@mpe.ellerman.id.au>
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
Cc: "sachinp@linux.vnet.ibm.com" <sachinp@linux.vnet.ibm.com>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > +#undef SYS_pkey_mprotect
> >  #define SYS_pkey_mprotect=09386
>=20
> We shouldn't undef them.
>=20
> They should obviously never change, but if the system headers already
> have a definition then we should use that, so I think it should be:
>=20
> #ifndef SYS_pkey_mprotect
> #define SYS_pkey_mprotect=09386
> #endif

If the definitions are identical the compiler won't complain.
So you probably actually want a matching definition so that,
provided at least one compile picks up both headers, you know
that the definitions actually match.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

