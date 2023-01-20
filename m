Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 429FC67538B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 12:43:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyyLH03m2z3fJr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 22:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyyKk1csrz3c69
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 22:42:48 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-129-4gsduPDlOrGmwEjdKMB1gA-1; Fri, 20 Jan 2023 11:42:44 +0000
X-MC-Unique: 4gsduPDlOrGmwEjdKMB1gA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Jan
 2023 11:42:42 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Fri, 20 Jan 2023 11:42:42 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Rob Landley
	<rob@landley.net>
Subject: RE: Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
Thread-Topic: Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
Thread-Index: AQHZLL5SlbpKhYJiU02AbZRDtfTmb66nLCYA
Date: Fri, 20 Jan 2023 11:42:42 +0000
Message-ID: <931141d03e8748cebad42aff1a508d7f@AcuMS.aculab.com>
References: <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
 <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
 <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
 <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
 <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
 <0f51dac4-836b-0ff2-38c6-5521745c1c88@landley.net>
 <20230120105341.GI25951@gate.crashing.org>
In-Reply-To: <20230120105341.GI25951@gate.crashing.org>
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Arnd
 Bergmann <arnd@arndb.de>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "Michael.Karcher" <Michael.Karcher@fu-berlin.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, "linux-f2fs-devel@lists.sourceforge.net" <linux-f2fs-devel@lists.sourceforge.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 20 January 2023 10:54
...
> > > I suggest to file a bug against gcc complaining about a "spurious
> > > warning", and using "-Werror -Wno-error-sizeof-pointer-div" until gcc=
 is
> > > adapted to not emit the warning about the pointer division if the res=
ult
> > > is not used.
>=20
> Yeah.  If the first operand of a conditional operator is non-zero, the
> second operand is not evaluated, and if the first is zero, the third
> operand is not evaluated.  It is better if we do not warn about
> something we do not evaluate.  In cases like here where it is clear at
> compile time which branch is taken, that shouldn't be too hard.
>=20
> Can someone please file a GCC PR?  With reduced testcase preferably.

It's not a bug.
All the operands of the conditional operator have to be valid.
It might be that the optimiser can discard one, but that happens
much later on.
Even the operands of choose_expr() have to be valid - but can
have different types.

I'm not sure what the code is trying to do or why it is failing.
Was it a fail in userspace - where the option to allow sizeof (void)
isn't allowed.

FWIW you can check for a compile-time NULL (or 0) with:
#define is_null(x) (sizeof *(0 : (void *)(x) ? (int *)0) !=3D 1)

Although that is a compile-time error for non-NULL unless
'void *' arithmetic is allowed.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

