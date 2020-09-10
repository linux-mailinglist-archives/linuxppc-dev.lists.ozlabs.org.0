Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B445F2648CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 17:34:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnNGf63rqzDqjx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 01:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnND43dXbzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 01:32:02 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-276-Rr3yeOHPPMud0l-oIQnsyA-1; Thu, 10 Sep 2020 16:31:54 +0100
X-MC-Unique: Rr3yeOHPPMud0l-oIQnsyA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 10 Sep 2020 16:31:53 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 10 Sep 2020 16:31:53 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>
Subject: RE: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Thread-Topic: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Thread-Index: AQHWhvDyD2c/lZfV3kC0Ftay5UVebqlhgjnw///zuACAABnIEIAAOoMggAAi9ACAABJI8A==
Date: Thu, 10 Sep 2020 15:31:53 +0000
Message-ID: <18fdbaeacba349a0a8bf7568f709e991@AcuMS.aculab.com>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142803.GM1236603@ZenIV.linux.org.uk>
 <CAHk-=wgQNyeHxXfckd1WtiYnoDZP1Y_kD-tJKqWSksRoDZT=Aw@mail.gmail.com>
 <20200909184001.GB28786@gate.crashing.org>
 <CAHk-=whu19Du_rZ-zBtGsXAB-Qo7NtoJjQjd-Sa9OB5u1Cq_Zw@mail.gmail.com>
 <3beb8b019e4a4f7b81fdb1bc68bd1e2d@AcuMS.aculab.com>
 <186a62fc-042c-d6ab-e7dc-e61b18945498@csgroup.eu>
 <59a64e9a210847b59f70f9bd2d02b5c3@AcuMS.aculab.com>
 <5050b43687c84515a49b345174a98822@AcuMS.aculab.com>
 <20200910152030.GJ28786@gate.crashing.org>
In-Reply-To: <20200910152030.GJ28786@gate.crashing.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Luis
 Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Segher Boessenkool <segher@kernel.crashing.org>
> Sent: 10 September 2020 16:21
> To: David Laight <David.Laight@ACULAB.COM>
> Cc: 'Christophe Leroy' <christophe.leroy@csgroup.eu>; 'Linus Torvalds' <t=
orvalds@linux-
> foundation.org>; linux-arch <linux-arch@vger.kernel.org>; Kees Cook <kees=
cook@chromium.org>; the
> arch/x86 maintainers <x86@kernel.org>; Nick Desaulniers <ndesaulniers@goo=
gle.com>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Alexey Dobriyan <adobriyan@g=
mail.com>; Luis Chamberlain
> <mcgrof@kernel.org>; Al Viro <viro@zeniv.linux.org.uk>; linux-fsdevel <li=
nux-fsdevel@vger.kernel.org>;
> linuxppc-dev <linuxppc-dev@lists.ozlabs.org>; Christoph Hellwig <hch@lst.=
de>
> Subject: Re: remove the last set_fs() in common code, and remove it for x=
86 and powerpc v3
>=20
> On Thu, Sep 10, 2020 at 12:26:53PM +0000, David Laight wrote:
> > Actually this is pretty sound:
> > =09__label__ label;
> > =09register int eax asm ("eax");
> > =09// Ensure eax can't be reloaded from anywhere
> > =09// In particular it can't be reloaded after the asm goto line
> > =09asm volatile ("" : "=3Dr" (eax));
>=20
> This asm is fine.  It says it writes the "eax" variable, which lives in
> the eax register *in that asm* (so *not* guaranteed after it!).
>=20
> > =09// Provided gcc doesn't save eax here...
> > =09asm volatile goto ("xxxxx" ::: "eax" : label);
>=20
> So this is incorrect.

From the other email:

> It is neither input nor output operand here!  Only *then* is a local
> register asm guaranteed to be in the given reg: as input or output to an
> inline asm.

Ok, so adding '"r" (eax)' to the input section helps a bit.

> > =09// ... and reload the saved value here.
> > =09// The input value here will be that modified by the 'asm goto'.
> > =09// Since this modifies eax it can't be moved before the 'asm goto'.
> > =09asm volatile ("" : "+r" (eax));
> > =09// So here eax must contain the value set by the "xxxxx" instruction=
s.
>=20
> No, the register eax will contain the value of the eax variable.  In the
> asm; it might well be there before or after the asm as well, but none of
> that is guaranteed.

Perhaps not 'guaranteed', but very unlikely to be wrong.
It doesn't give gcc much scope for not generating the desired code.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

