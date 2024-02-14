Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5227685468F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 10:53:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZYRk1zhpz3vXq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 20:53:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 307 seconds by postgrey-1.37 at boromir; Wed, 14 Feb 2024 20:53:17 AEDT
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZYRK0HPtz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 20:53:16 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-123-NIfzbVeEN7a3ZZr9tPCsfQ-1; Wed, 14 Feb 2024 09:46:55 +0000
X-MC-Unique: NIfzbVeEN7a3ZZr9tPCsfQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 14 Feb
 2024 09:46:33 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 14 Feb 2024 09:46:33 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Arnd Bergmann
	<arnd@kernel.org>
Subject: RE: [PATCH] tty: hvc-iucv: fix function pointer casts
Thread-Topic: [PATCH] tty: hvc-iucv: fix function pointer casts
Thread-Index: AQHaXrGUxAtD30hgkEO/PHRuEZrHGLEJlp9g
Date: Wed, 14 Feb 2024 09:46:33 +0000
Message-ID: <57d72e2ccc8245fe99982613a11c461c@AcuMS.aculab.com>
References: <20240213101756.461701-1-arnd@kernel.org>
 <20240213191254.GA19790@gate.crashing.org>
In-Reply-To: <20240213191254.GA19790@gate.crashing.org>
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
Cc: Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, Bill
 Wendling <morbo@google.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Justin Stitt <justinstitt@google.com>, Jiri
 Slaby <jirislaby@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 13 February 2024 19:13
>=20
> On Tue, Feb 13, 2024 at 11:17:49AM +0100, Arnd Bergmann wrote:
> > clang warns about explicitly casting between incompatible function
> > pointers:
> >
> > drivers/tty/hvc/hvc_iucv.c:1100:23: error: cast from 'void (*)(const vo=
id *)' to 'void (*)(struct
> device *)' converts to incompatible function type [-Werror,-Wcast-functio=
n-type-strict]
> >  1100 |         priv->dev->release =3D (void (*)(struct device *)) kfre=
e;
> >       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Such a cast of course is explicitly allowed by 6.3.2.3/8, only calling a
> function using a non-compatible type is UB.  This warning message is
> quite misleading.  Doubly so because of the -Werror, as always.

But it will get called using the wrong type.
And (is it) fine-ibt will reject the incorrect call.

Has clang/gcc added an attribute to 'seed' the ibt hash yet?
So that functions that are void (*)(void) can be separated?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

