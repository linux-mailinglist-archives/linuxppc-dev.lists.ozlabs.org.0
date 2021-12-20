Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401847A7B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 11:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHbKL1Xb6z3bXP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 21:23:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHbJt1DTLz2ymg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 21:23:24 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-1-5ELj3wkrPNSGHHm-pqNVkA-1; Mon, 20 Dec 2021 10:23:17 +0000
X-MC-Unique: 5ELj3wkrPNSGHHm-pqNVkA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 10:23:16 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Mon, 20 Dec 2021 10:23:16 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jason Wang' <wangborong@cdjrlc.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>
Subject: RE: [PATCH] powerpc: use strscpy to copy strings
Thread-Topic: [PATCH] powerpc: use strscpy to copy strings
Thread-Index: AQHX9VEUZ6FjgeLc1kWSeYk5lSMsIaw7KVuQ
Date: Mon, 20 Dec 2021 10:23:16 +0000
Message-ID: <c82f01143a174c8281930158e4804a4b@AcuMS.aculab.com>
References: <20211220032402.630240-1-wangborong@cdjrlc.com>
In-Reply-To: <20211220032402.630240-1-wangborong@cdjrlc.com>
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
Cc: "paulus@samba.org" <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jason Wang
> Sent: 20 December 2021 03:24
>=20
> The strlcpy should not be used because it doesn't limit the source
> length. So that it will lead some potential bugs.
>=20
> But the strscpy doesn't require reading memory from the src string
> beyond the specified "count" bytes, and since the return value is
> easier to error-check than strlcpy()'s. In addition, the implementation
> is robust to the string changing out from underneath it, unlike the
> current strlcpy() implementation.
>=20
> Thus, replace strlcpy with strscpy.
>=20
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> ---
>  arch/powerpc/platforms/pasemi/misc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/pasemi/misc.c b/arch/powerpc/platform=
s/pasemi/misc.c
> index 1bf65d02d3ba..06a1ffd43bfe 100644
> --- a/arch/powerpc/platforms/pasemi/misc.c
> +++ b/arch/powerpc/platforms/pasemi/misc.c
> @@ -35,7 +35,7 @@ static int __init find_i2c_driver(struct device_node *n=
ode,
>  =09for (i =3D 0; i < ARRAY_SIZE(i2c_devices); i++) {
>  =09=09if (!of_device_is_compatible(node, i2c_devices[i].of_device))
>  =09=09=09continue;
> -=09=09if (strlcpy(info->type, i2c_devices[i].i2c_type,
> +=09=09if (strscpy(info->type, i2c_devices[i].i2c_type,
>  =09=09=09    I2C_NAME_SIZE) >=3D I2C_NAME_SIZE)
>  =09=09=09return -ENOMEM;

Isn't that the wrong overflow check?
Doesn't strscpy() return a -ve errno value on failure
(just to cause a different buffer overflow issue?)

Not that any kind of overflow is actually possible in that over-engineered
code fragment.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

