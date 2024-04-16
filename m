Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285AC8A6968
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 13:10:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJhCj6Yklz3vZm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 21:10:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJhCH04Qxz3vZg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 21:10:01 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-255-LPfE2IzbO0utuOqpskCb8A-1; Tue, 16 Apr 2024 12:09:55 +0100
X-MC-Unique: LPfE2IzbO0utuOqpskCb8A-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 16 Apr
 2024 12:09:27 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 16 Apr 2024 12:09:27 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Naresh Kamboju
	<naresh.kamboju@linaro.org>
Subject: RE: powerpc: io-defs.h:43:1: error: performing pointer arithmetic on
 a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
Thread-Topic: powerpc: io-defs.h:43:1: error: performing pointer arithmetic on
 a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
Thread-Index: AQHaj+s965G0tAMqzUOctdh7rJqb8rFqvAFg
Date: Tue, 16 Apr 2024 11:09:26 +0000
Message-ID: <1d0de2bee67643bfa5a561e70133db75@AcuMS.aculab.com>
References: <CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com>
 <20240416103819.GQ19790@gate.crashing.org>
In-Reply-To: <20240416103819.GQ19790@gate.crashing.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Linux Regressions <regressions@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>, clang-built-linux <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, open list <linux-kernel@vger.kernel.org>, "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>, Nathan Chancellor <nathan@kernel.org>, Jeff Xu <jeffxu@chromium.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 16 April 2024 11:38
>=20
> On Tue, Apr 16, 2024 at 03:02:52PM +0530, Naresh Kamboju wrote:
> > In file included from arch/powerpc/include/asm/io.h:672:
> > arch/powerpc/include/asm/io-defs.h:43:1: error: performing pointer
> > arithmetic on a null pointer has undefined behavior
> > [-Werror,-Wnull-pointer-arithmetic]
>=20
> It is not UB, but just undefined: the program is meaningless.
>=20
> It is not a null pointer but even a null pointer constant here.  It
> matters in places, including here.
>=20
> It would help if the warnings were more correct :-(

Isn't it only a problem because the NULL pointer isn't required to
be the all-zero bit pattern?

So when do we get a warning from using memset() on a structure
that contains pointers? Since it is equally buggy.

Has anyone ever seen a system where NULL wasn't 'all zeros'?
I've used a system where the 'native' invalid pointer was 'all ones',
but even there the C code used 'all zeros'.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

