Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E05C4B38F5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 03:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxBQW3XzDz3cQx
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 13:39:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxBPy75RDz2yLK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 13:39:15 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-267-jz20NOQ6P6ya1sjHH6f2FQ-1; Sun, 13 Feb 2022 02:39:08 +0000
X-MC-Unique: jz20NOQ6P6ya1sjHH6f2FQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Sun, 13 Feb 2022 02:39:06 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Sun, 13 Feb 2022 02:39:06 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: RE: [PATCH] net: Remove branch in csum_shift()
Thread-Topic: [PATCH] net: Remove branch in csum_shift()
Thread-Index: AQHYHyQqmTo4K/pb5UWdDmTfE7rfRayQxWFw
Date: Sun, 13 Feb 2022 02:39:06 +0000
Message-ID: <7f16910a8f63475dae012ef5135f41d1@AcuMS.aculab.com>
References: <efeeb0b9979b0377cd313311ad29cf0ac060ae4b.1644569106.git.christophe.leroy@csgroup.eu>
In-Reply-To: <efeeb0b9979b0377cd313311ad29cf0ac060ae4b.1644569106.git.christophe.leroy@csgroup.eu>
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
> Sent: 11 February 2022 08:48
>=20
> Today's implementation of csum_shift() leads to branching based on
> parity of 'offset'
>=20
> =09000002f8 <csum_block_add>:
> =09     2f8:=0970 a5 00 01 =09andi.   r5,r5,1
> =09     2fc:=0941 a2 00 08 =09beq     304 <csum_block_add+0xc>
> =09     300:=0954 84 c0 3e =09rotlwi  r4,r4,24
> =09     304:=097c 63 20 14 =09addc    r3,r3,r4
> =09     308:=097c 63 01 94 =09addze   r3,r3
> =09     30c:=094e 80 00 20 =09blr
>=20
> Use first bit of 'offset' directly as input of the rotation instead of
> branching.
>=20
> =09000002f8 <csum_block_add>:
> =09     2f8:=0954 a5 1f 38 =09rlwinm  r5,r5,3,28,28
> =09     2fc:=0920 a5 00 20 =09subfic  r5,r5,32
> =09     300:=095c 84 28 3e =09rotlw   r4,r4,r5
> =09     304:=097c 63 20 14 =09addc    r3,r3,r4
> =09     308:=097c 63 01 94 =09addze   r3,r3
> =09     30c:=094e 80 00 20 =09blr
>=20
> And change to left shift instead of right shift to skip one more
> instruction. This has no impact on the final sum.
>=20
> =09000002f8 <csum_block_add>:
> =09     2f8:=0954 a5 1f 38 =09rlwinm  r5,r5,3,28,28
> =09     2fc:=095c 84 28 3e =09rotlw   r4,r4,r5
> =09     300:=097c 63 20 14 =09addc    r3,r3,r4
> =09     304:=097c 63 01 94 =09addze   r3,r3
> =09     308:=094e 80 00 20 =09blr

That is ppc64.
What happens on x86-64?

Trying to do the same in the x86 ipcsum code tended to make the code worse.
(Although that test is for an odd length fragment and can just be removed.)

=09David

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/net/checksum.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/include/net/checksum.h b/include/net/checksum.h
> index 5218041e5c8f..9badcd5532ef 100644
> --- a/include/net/checksum.h
> +++ b/include/net/checksum.h
> @@ -83,9 +83,7 @@ static inline __sum16 csum16_sub(__sum16 csum, __be16 a=
ddend)
>  static inline __wsum csum_shift(__wsum sum, int offset)
>  {
>  =09/* rotate sum to align it with a 16b boundary */
> -=09if (offset & 1)
> -=09=09return (__force __wsum)ror32((__force u32)sum, 8);
> -=09return sum;
> +=09return (__force __wsum)rol32((__force u32)sum, (offset & 1) << 3);
>  }
>=20
>  static inline __wsum
> --
> 2.34.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

