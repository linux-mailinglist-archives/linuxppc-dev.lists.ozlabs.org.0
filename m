Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0A5577CDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 09:52:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmZ1f3rCfz3cdP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 17:52:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmZ194Czjz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 17:51:54 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-252-gbDn5GdWMXeh8y7fCCM7XA-1; Mon, 18 Jul 2022 08:51:48 +0100
X-MC-Unique: gbDn5GdWMXeh8y7fCCM7XA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Mon, 18 Jul 2022 08:51:45 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Mon, 18 Jul 2022 08:51:45 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Michael Ellerman' <mpe@ellerman.id.au>, Sudip Mukherjee
	<sudipm.mukherjee@gmail.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Kees Cook
	<keescook@chromium.org>
Subject: RE: mainline build failure of powerpc allmodconfig for
 prom_init_check
Thread-Topic: mainline build failure of powerpc allmodconfig for
 prom_init_check
Thread-Index: AQHYmmCqgiI6vbQbKkWuMJXdAKKy2K2Dv4mw
Date: Mon, 18 Jul 2022 07:51:45 +0000
Message-ID: <72a95f0949d149d1b07bd161f3d59cc1@AcuMS.aculab.com>
References: <Ys/aDKZNhhsENH9S@debian>
 <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <87cze3docs.fsf@mpe.ellerman.id.au>
In-Reply-To: <87cze3docs.fsf@mpe.ellerman.id.au>
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
Cc: Linus
 Torvalds <torvalds@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman
> Sent: 18 July 2022 05:41
...
> So we're memsetting all of args to 254, not zero.
>=20
> That's happening because allmodconfig with gcc 12 enables
> CONFIG_INIT_STACK_ALL_PATTERN, whereas gcc 11 doesn't.

I can't help feeling it would be better if that generated
a call to a memset64() function.
Saving loads of tests at the top of the function,
and (most of?) the constant expansion to 64bit.

Although and explicit 'stack clear' function would be better
for the kernel - since it would give the option of patching
it away at startup.

I really can't help feeling that initialising on-stack
arrays will kill performance.
While kernel stack frames have to be relatively small,
in userspace very large on-stack arrays can be allocated
(and correctly bound checked) knowing that the cost is
minimal (maybe a TLB miss).

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

