Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85113FEE9E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 15:25:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0hWL4mB0z2ywh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 23:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Thu, 02 Sep 2021 23:25:06 AEST
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0hVp6Qttz2xr7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 23:25:06 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-179-p9qiScvWMG6-RCRrz6y5Wg-1; Thu, 02 Sep 2021 14:23:52 +0100
X-MC-Unique: p9qiScvWMG6-RCRrz6y5Wg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 2 Sep 2021 14:23:51 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 2 Sep 2021 14:23:51 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Fabiano Rosas' <farosas@linux.ibm.com>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH kernel] KVM: PPC: Book3S: Suppress warnings when
 allocating too big memory slots
Thread-Topic: [PATCH kernel] KVM: PPC: Book3S: Suppress warnings when
 allocating too big memory slots
Thread-Index: AQHXn/uuqy9zH8mqjEavl+BakB/R26uQuo6Q
Date: Thu, 2 Sep 2021 13:23:51 +0000
Message-ID: <58cdff0ef02346f2990bddd526f08f34@AcuMS.aculab.com>
References: <20210901084512.1658628-1-aik@ozlabs.ru>
 <87fsuouysc.fsf@linux.ibm.com>
 <a72edcd2-a990-a549-2f31-dab134bef6a6@ozlabs.ru>
 <878s0funuy.fsf@linux.ibm.com>
In-Reply-To: <878s0funuy.fsf@linux.ibm.com>
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
Cc: "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

...
> > This is from my deep Windows past :)
> >
> > https://docs.microsoft.com/en-us/windows/win32/stg/coding-style-convent=
ions
>=20
> =3DD How interesting! And according to that link 'sz' means "Zero termina=
ted
> String". Imagine the confusion.. haha

Is that document responsible for some of the general unreadability
of windows code?
(I'm not going to addle by brain by trying to read it.)

Types like DWORD_PTR really shouldn't exist.
You won't guess what it is...

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

