Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E3D4D2C8E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 10:53:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD6w50r5Zz3bgS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:53:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD6vZ5qwGz2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 20:53:11 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-170-C9CSPsPAP3CiGXY-2Cczvg-1; Wed, 09 Mar 2022 09:53:06 +0000
X-MC-Unique: C9CSPsPAP3CiGXY-2Cczvg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Wed, 9 Mar 2022 09:53:04 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Wed, 9 Mar 2022 09:53:04 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
Subject: RE: [PATCH] powerpc: Use rol32() instead of opencoding in csum_fold()
Thread-Topic: [PATCH] powerpc: Use rol32() instead of opencoding in csum_fold()
Thread-Index: AQHYM4tAZCIa7HBaKU201H+8JgoYL6y2y/IA
Date: Wed, 9 Mar 2022 09:53:04 +0000
Message-ID: <d7840750e3694b30951540b4298da208@AcuMS.aculab.com>
References: <794337eff7bb803d2c4e67d9eee635390c4c48fe.1646812553.git.christophe.leroy@csgroup.eu>
In-Reply-To: <794337eff7bb803d2c4e67d9eee635390c4c48fe.1646812553.git.christophe.leroy@csgroup.eu>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy
> Sent: 09 March 2022 07:56
...
> diff --git a/arch/powerpc/include/asm/checksum.h b/arch/powerpc/include/a=
sm/checksum.h
> index 8321f6053a67..4b573a3b7e17 100644
> --- a/arch/powerpc/include/asm/checksum.h
> +++ b/arch/powerpc/include/asm/checksum.h
> @@ -38,14 +38,15 @@ extern __wsum csum_and_copy_to_user(const void *src, =
void __user *dst,
>   */
>  static inline __sum16 csum_fold(__wsum sum)
>  {
> +=09u32 tmp =3D (__force u32)sum;
> +
> +=09/*
> +=09 * swap the two 16-bit halves of sum
> +=09 * if there is a carry from adding the two 16-bit halves,
> +=09 * it will carry from the lower half into the upper half,
> +=09 * giving us the correct sum in the upper half.
> +=09 */
> +=09return (__force __sum16)(~(tmp + rol32(tmp, 16)) >> 16);
>  }
>=20
>  static inline u32 from64to32(u64 x)
> --
> 2.34.1

On the face of it that is pretty generic.
Two shifts and an add (plus the invert and mask).

I suspect it generates better code than the current x86 version
which is:

static inline __sum16 csum_fold(__wsum sum)
{
=09asm("addl %1, %0=09=09;\n"
=09    "adcl $0xffff, %0=09;\n"
=09    : "=3Dr" (sum)
=09    : "r" ((__force u32)sum << 16),
=09      "0" ((__force u32)sum & 0xffff0000));
=09return (__force __sum16)(~(__force u32)sum >> 16);
}

Which looks like 2 shifts, a mask, add, adc..
(Oh and the adc is two clocks on anything prior to Haswell.)
Quite why it doesn't use 16bit add and adc is anybodies guess.
Would still be shift, add, adc.
So shift, add, shift is no worse.

I wonder if any of the asm versions are actually better?
Some are the same algorithm, some are a lot worse.

Generic is:
static inline __sum16 csum_fold(__wsum csum)
{
=09u32 sum =3D (__force u32)csum;
=09sum =3D (sum & 0xffff) + (sum >> 16);
=09sum =3D (sum & 0xffff) + (sum >> 16);
=09return (__force __sum16)~sum;
}
Clearly can be improved.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

