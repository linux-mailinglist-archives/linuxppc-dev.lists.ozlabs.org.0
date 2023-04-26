Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7366EF01B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 10:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5sHJ1YVCz3cff
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 18:19:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5sGl0qLzz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 18:19:25 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-81-f59XHfplO1GBTvvR8VoUKw-1; Wed, 26 Apr 2023 09:19:18 +0100
X-MC-Unique: f59XHfplO1GBTvvR8VoUKw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 26 Apr
 2023 09:19:17 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 26 Apr 2023 09:19:17 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Danny Tsen' <dtsen@linux.ibm.com>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>
Subject: RE: [PATCH 1/5] An optimized Chacha20 implementation with 8-way
 unrolling for ppc64le.
Thread-Topic: [PATCH 1/5] An optimized Chacha20 implementation with 8-way
 unrolling for ppc64le.
Thread-Index: AQHZdt1hkavbjt5YJ0uOPniHUxI1nq89P9VQ
Date: Wed, 26 Apr 2023 08:19:17 +0000
Message-ID: <0bb5f98165c3408fb191488f3cf0f76c@AcuMS.aculab.com>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
 <20230424184726.2091-2-dtsen@linux.ibm.com>
In-Reply-To: <20230424184726.2091-2-dtsen@linux.ibm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
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
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "dtsen@us.ibm.com" <dtsen@us.ibm.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "appro@cryptogams.org" <appro@cryptogams.org>, "ltcgcw@linux.vnet.ibm.com" <ltcgcw@linux.vnet.ibm.com>, "leitao@debian.org" <leitao@debian.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Danny Tsen
> Sent: 24 April 2023 19:47
>=20
> Improve overall performance of chacha20 encrypt and decrypt operations
> for Power10 or later CPU.
>=20
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  arch/powerpc/crypto/chacha-p10le-8x.S | 842 ++++++++++++++++++++++++++
>  1 file changed, 842 insertions(+)
>  create mode 100644 arch/powerpc/crypto/chacha-p10le-8x.S
...
> +.macro QT_loop_8x
> +=09# QR(v0, v4,  v8, v12, v1, v5,  v9, v13, v2, v6, v10, v14, v3, v7, v1=
1, v15)
> +=09xxlor=090, 32+25, 32+25
> +=09xxlor=0932+25, 20, 20
> +=09vadduwm 0, 0, 4
> +=09vadduwm 1, 1, 5
> +=09vadduwm 2, 2, 6
> +=09vadduwm 3, 3, 7
> +=09  vadduwm 16, 16, 20
> +=09  vadduwm 17, 17, 21
> +=09  vadduwm 18, 18, 22
> +=09  vadduwm 19, 19, 23
> +
> +=09  vpermxor 12, 12, 0, 25
> +=09  vpermxor 13, 13, 1, 25
> +=09  vpermxor 14, 14, 2, 25
> +=09  vpermxor 15, 15, 3, 25
> +=09  vpermxor 28, 28, 16, 25
> +=09  vpermxor 29, 29, 17, 25
> +=09  vpermxor 30, 30, 18, 25
> +=09  vpermxor 31, 31, 19, 25
> +=09xxlor=0932+25, 0, 0
> +=09vadduwm 8, 8, 12
> +=09vadduwm 9, 9, 13
> +=09vadduwm 10, 10, 14
> +=09vadduwm 11, 11, 15
...

Is it just me or is all this code just complete jibberish?

There really ought to be enough comments so that it is possible
to check that the code is doing something that looks like chacha20
without spending all day tracking register numbers through
hundreds of lines of assembler.

I also wonder how much faster the 8-way unroll is?
On modern cpu with 'out of order' execute (etc) it is
not impossible to get the loop operations 'for free'
because they use execution units that are otherwise idle.

Massive loop unrolling is so 1980's.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

