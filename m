Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9A76F8655
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 18:02:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCb7N2Csbz3fPJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 02:02:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCb6q5WbMz3cNJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 02:02:26 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-313-b_0hsLUQOnitoawNGLcfRA-1; Fri, 05 May 2023 17:02:19 +0100
X-MC-Unique: b_0hsLUQOnitoawNGLcfRA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 5 May
 2023 17:02:18 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 5 May 2023 17:02:18 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Michael Ellerman' <mpe@ellerman.id.au>, "glider@google.com"
	<glider@google.com>, "elver@google.com" <elver@google.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"zhangpeng.00@bytedance.com" <zhangpeng.00@bytedance.com>
Subject: RE: [PATCH] mm: kfence: Fix false positives on big endian
Thread-Topic: [PATCH] mm: kfence: Fix false positives on big endian
Thread-Index: AQHZfwT1fw2Bof1hQEOCEaNqiVuD7a9L1zDg
Date: Fri, 5 May 2023 16:02:17 +0000
Message-ID: <826f836f41db41eeb0fc32061994ac39@AcuMS.aculab.com>
References: <20230505035127.195387-1-mpe@ellerman.id.au>
In-Reply-To: <20230505035127.195387-1-mpe@ellerman.id.au>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman
> Sent: 05 May 2023 04:51
>=20
> Since commit 1ba3cbf3ec3b ("mm: kfence: improve the performance of
> __kfence_alloc() and __kfence_free()"), kfence reports failures in
> random places at boot on big endian machines.
>=20
> The problem is that the new KFENCE_CANARY_PATTERN_U64 encodes the
> address of each byte in its value, so it needs to be byte swapped on big
> endian machines.
>=20
> The compiler is smart enough to do the le64_to_cpu() at compile time, so
> there is no runtime overhead.
>=20
> Fixes: 1ba3cbf3ec3b ("mm: kfence: improve the performance of __kfence_all=
oc() and __kfence_free()")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  mm/kfence/kfence.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
> index 2aafc46a4aaf..392fb273e7bd 100644
> --- a/mm/kfence/kfence.h
> +++ b/mm/kfence/kfence.h
> @@ -29,7 +29,7 @@
>   * canary of every 8 bytes is the same. 64-bit memory can be filled and =
checked
>   * at a time instead of byte by byte to improve performance.
>   */
> -#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(0x070=
6050403020100))
> +#define KFENCE_CANARY_PATTERN_U64 ((u64)0xaaaaaaaaaaaaaaaa ^ (u64)(le64_=
to_cpu(0x0706050403020100)))

What at the (u64) casts for?
The constants should probably have a ul (or ull) suffix.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

