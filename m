Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3156B4C27A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:09:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46YK2yv6z3f4V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:09:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46JN4GQvz3cHN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:58:27 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-216-yFNLSyvJPDmN2lh--r6gzg-1; Thu, 24 Feb 2022 08:58:21 +0000
X-MC-Unique: yFNLSyvJPDmN2lh--r6gzg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 24 Feb 2022 08:58:20 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 24 Feb 2022 08:58:20 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Kees Cook' <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>
Subject: RE: [PATCH v2] usercopy: Check valid lifetime via stack depth
Thread-Topic: [PATCH v2] usercopy: Check valid lifetime via stack depth
Thread-Index: AQHYKUROaYEZJJ15GkKlMpPMpHZgQKyiZK3w
Date: Thu, 24 Feb 2022 08:58:20 +0000
Message-ID: <85d42900efaa4fdb8c20de2147d938c7@AcuMS.aculab.com>
References: <20220224060342.1855457-1-keescook@chromium.org>
In-Reply-To: <20220224060342.1855457-1-keescook@chromium.org>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kees Cook
> Sent: 24 February 2022 06:04
>=20
> Under CONFIG_HARDENED_USERCOPY=3Dy, when exact stack frame boundary check=
ing
> is not available (i.e. everything except x86 with FRAME_POINTER), check
> a stack object as being at least "current depth valid", in the sense
> that any object within the stack region but not between start-of-stack
> and current_stack_pointer should be considered unavailable (i.e. its
> lifetime is from a call no longer present on the stack).
>=20
...
> diff --git a/mm/usercopy.c b/mm/usercopy.c
> index d0d268135d96..5d28725af95f 100644
> --- a/mm/usercopy.c
> +++ b/mm/usercopy.c
> @@ -22,6 +22,30 @@
>  #include <asm/sections.h>
>  #include "slab.h"
>=20
> +/*
> + * Only called if obj is within stack/stackend bounds. Determine if with=
in
> + * current stack depth.
> + */
> +static inline int check_stack_object_depth(const void *obj,
> +=09=09=09=09=09   unsigned long len)
> +{
> +#ifdef CONFIG_ARCH_HAS_CURRENT_STACK_POINTER
> +#ifndef CONFIG_STACK_GROWSUP

Pointless negation

> +=09const void * const high =3D stackend;
> +=09const void * const low =3D (void *)current_stack_pointer;
> +#else
> +=09const void * const high =3D (void *)current_stack_pointer;
> +=09const void * const low =3D stack;
> +#endif
> +
> +=09/* Reject: object not within current stack depth. */
> +=09if (obj < low || high < obj + len)
> +=09=09return BAD_STACK;
> +
> +#endif
> +=09return GOOD_STACK;
> +}

If the comment at the top of the function is correct then
only a single test for the correct end of the buffer against
the current stack pointer is needed.
Something like:
#ifdef CONFIG_STACK_GROWSUP
=09if ((void *)current_stack_pointer < obj + len)
=09=09return BAD_STACK;
#else
=09if (obj < (void *)current_stack_pointer)
=09=09return BAD_STACK;
#endif
=09return GOOD_STACK;

Although it may depend on exactly where the stack pointer
points to - especially for GROWSUP.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

