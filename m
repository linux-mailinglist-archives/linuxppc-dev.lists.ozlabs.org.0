Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E94765E9CCE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 11:02:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbcGf6VxTz3c5w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 19:02:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
X-Greylist: delayed 307 seconds by postgrey-1.36 at boromir; Mon, 26 Sep 2022 19:02:26 AEST
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbcGB0lWjz2xGS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 19:02:24 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-123-wDdDusd0NTG4vDH9ByOzYA-1; Mon, 26 Sep 2022 09:56:04 +0100
X-MC-Unique: wDdDusd0NTG4vDH9ByOzYA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Mon, 26 Sep
 2022 09:56:00 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Mon, 26 Sep 2022 09:56:00 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nicholas Piggin' <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: RE: [RFC PATCH 2/2] powerpc: nop trap instruction after WARN_ONCE
 fires
Thread-Topic: [RFC PATCH 2/2] powerpc: nop trap instruction after WARN_ONCE
 fires
Thread-Index: AQHYz2M0TZdjr4Cd10Ss2btR2GgWaK3xa6OA
Date: Mon, 26 Sep 2022 08:56:00 +0000
Message-ID: <347d89ae6b7d452b8d8d417857476b7b@AcuMS.aculab.com>
References: <20220923154143.1115645-1-npiggin@gmail.com>
 <20220923154143.1115645-2-npiggin@gmail.com>
In-Reply-To: <20220923154143.1115645-2-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin
> Sent: 23 September 2022 16:42
>
> WARN_ONCE and similar are often used in frequently executed code, and
> should not crash the system. The program check interrupt caused by
> WARN_ON_ONCE can be a significant overhead even when nothing is being
> printed. This can cause performance to become unacceptable, having the
> same effective impact to the user as a BUG_ON().
>=20
> Avoid this overhead by patching the trap with a nop instruction after a
> "once" trap fires. Conditional warnings that return a result must have
> equivalent compare and branch instructions after the trap, so when it is
> nopped the statement will behave the same way. It's possible the asm
> goto should be removed entirely and this comparison just done in C now.
>=20
> XXX: possibly this should schedule the patching to run in a different
> context than the program check.

I'm pretty sure WARN_ON_ONCE() is valid everywhere printk() is allowed.
In many cases this means you can't call mutex_enter().

So you need a different scheme.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

