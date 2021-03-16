Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9994233D0E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 10:35:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F07Sn43Q8z30JY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 20:35:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F07SR1pvPz2xYh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 20:35:32 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-235-IBslWWs2N5Cmqi95XwcuXQ-1; Tue, 16 Mar 2021 09:35:27 +0000
X-MC-Unique: IBslWWs2N5Cmqi95XwcuXQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 16 Mar 2021 09:35:26 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 16 Mar 2021 09:35:26 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>
Subject: RE: [PATCH] powerpc/vdso32: Add missing _restgpr_31_x to fix build
 failure
Thread-Topic: [PATCH] powerpc/vdso32: Add missing _restgpr_31_x to fix build
 failure
Thread-Index: AQHXGbeqwOTgfnOElE2I7+OcNDHUgqqFPWMAgAB9u4CAAJjNQA==
Date: Tue, 16 Mar 2021 09:35:26 +0000
Message-ID: <e2493e6aaa454604a10dd811a369d104@AcuMS.aculab.com>
References: <a7aa198a88bcd33c6e35e99f70f86c7b7f2f9440.1615270757.git.christophe.leroy@csgroup.eu>
 <20210312022940.GO29191@gate.crashing.org>
 <023afd0c-dc61-5891-5145-5bcdce8227be@prevas.dk>
 <14e2cfb8c3f141aaba8fe0fb2d8f1885@AcuMS.aculab.com>
 <20210315235947.GD16691@gate.crashing.org>
In-Reply-To: <20210315235947.GD16691@gate.crashing.org>
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
Cc: Paul Mackerras <paulus@samba.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 'Rasmus Villemoes' <rasmus.villemoes@prevas.dk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 16 March 2021 00:00
...
> > Although you may need to disable loop unrolling (often dubious at best)
> > and either force or disable some function inlining.
>=20
> The cases where GCC does loop unrolling at -O2 always help quite a lot.
> Or, do you have a counter-example?  We'd love to see one.

The real problem with loop unrolling is that quite often a modern
out-of-order superscaler processor actually has 'spare' execution
cycles where the loop control can be done 'for free'.
Sometimes you do need to unroll (or interleave) a couple of
times to get enough spare execution cycles.

But the unrolled loop has to read a lot more code into cache
- so unless the code is 'hot cache' (that is usually arranged
for benchmarking) those delays apply as well.
The larger code footprint also displaces other code.

My real annoyance with gcc is unrolling (and vectorizing)
loops that I know are never executed as many times as even one
copy of the unrolled loop.

As an example intel (ivy bridge onwards) cpu execute the
following code (the middle of the ip checksum) at 8 bytes/clock.
(Limited by the carry flag.)
It just doesn't need any further unrolling.

+               "10:    jecxz 20f\n"
+               "       adc   (%[buff], %[len]), %[sum_0]\n"
+               "       adc   8(%[buff], %[len]), %[sum_1]\n"
+               "       lea   32(%[len]), %[len_tmp]\n"
+               "       adc   16(%[buff], %[len]), %[sum_0]\n"
+               "       adc   24(%[buff], %[len]), %[sum_1]\n"
+               "       mov   %[len_tmp], %[len]\n"
+               "       jmp   10b\n"

Annoyingly that loop is slow on my 8-core atom.=20
The existing code only does 4 bytes/clock on intel cpu prior
to either broadwell or haswell (forgotten which) in spite
of much more unroling.


> And yup, inlining is hard.  GCC's heuristics there are very good
> nowadays, but any single decision has big effects.  Doing the important
> spots manually (always_inline or noinline) has good payoff.

Latest inline gripe was a function replicated about 20 times
when the non-inline version was a register load and 'tail call'.
The inlining is just bloat.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

