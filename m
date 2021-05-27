Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CDA39307B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 16:10:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrV8x3jd2z309g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 00:10:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrV8W2qVNz2yZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 00:10:32 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-140-jheLYrfmNJS7VYboBqC6Hg-1; Thu, 27 May 2021 15:10:23 +0100
X-MC-Unique: jheLYrfmNJS7VYboBqC6Hg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 27 May 2021 15:10:21 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 27 May 2021 15:10:21 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chen Huang' <chenhuang5@huawei.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "Paul Mackerras" <paulus@samba.org>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Mark Fasheh <mark@fasheh.com>, Joel
 Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Nathan
 Lynch <nathanl@linux.ibm.com>, "Andrew Donnellan" <ajd@linux.ibm.com>, Alexey
 Kardashevskiy <aik@ozlabs.ru>, "Andrew Morton" <akpm@linux-foundation.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>, Yang
 Yingliang <yangyingliang@huawei.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [PATCH -next 2/3] xen: balloon: Replaced simple_strtoull() with
 kstrtoull()
Thread-Topic: [PATCH -next 2/3] xen: balloon: Replaced simple_strtoull() with
 kstrtoull()
Thread-Index: AQHXUg74rK/OAxNe1kmGDaODmfSqv6r3X4NA
Date: Thu, 27 May 2021 14:10:21 +0000
Message-ID: <0f03f9b9ff41460db2935e077f7f80c7@AcuMS.aculab.com>
References: <20210526092020.554341-1-chenhuang5@huawei.com>
 <20210526092020.554341-2-chenhuang5@huawei.com>
In-Reply-To: <20210526092020.554341-2-chenhuang5@huawei.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Chen Huang
> Sent: 26 May 2021 10:20
>=20
> The simple_strtoull() function is deprecated in some situation, since
> it does not check for the range overflow, use kstrtoull() instead.
>=20
...
> -=09target_bytes =3D simple_strtoull(buf, &endchar, 0) * 1024;
> +=09ret =3D kstrtoull(buf, 0, &target_bytes);
> +=09if (ret)
> +=09=09return ret;
> +=09target_bytes *=3D 1024;

I'd have thought it was more important to check *endchar
than overflow.
If you are worried about overflow you need a range check
before the multiply.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

