Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B1787E221
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 03:26:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a761Umgv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tydym31JKz3brm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 13:26:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a761Umgv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tydy02nD6z2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Mar 2024 13:26:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710728756;
	bh=B5RRI0zjOjxcXu3wK3pu5N3WzxGpPvSWQk+iqTVSm1o=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=a761Umgv6i2uinpZyJnj7q/RIG9GDoXrSScN0+VmC4HbqdVwfsY3Ydo/+LW9fhThR
	 NgRzAd6/Vg1H46exJ15KlGeMaSJCz5sauB5d1lRpS2lDREyOaIKIBitsBDlvYrdUfH
	 UuGJWvsNV55mV4sapCNU2B4RcxqQquxjutHFsyCq9DjJAzb+6d30tJSRHCF1+YeqP7
	 m79rRoU8f1oPROC+/Zg6+LmB6yeEEDPGGSJX1PuD8SSIiyul6Wj+9oyZSrJsNwcsKr
	 PG8fWZr1+nVXxTmW0WQ6CH7OJFmo33IuBONm4DCG5OcEsJVvjM7TV2kdIMbt8XhuLz
	 JcOVOTq7qOKsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tydxw4F0xz4wcK;
	Mon, 18 Mar 2024 13:25:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v1 1/3] powerpc/code-patching: Test patch_instructions()
 during boot
In-Reply-To: <60d38487654911261c1d2f9f8952e0878ab7e071.camel@linux.ibm.com>
References: <20240315025736.404867-1-bgray@linux.ibm.com>
 <701ee036-c32e-4c75-98d1-a46582012eb1@csgroup.eu>
 <9673db665ac9243e931530bd14ef3d5487d846d6.camel@linux.ibm.com>
 <60d38487654911261c1d2f9f8952e0878ab7e071.camel@linux.ibm.com>
Date: Mon, 18 Mar 2024 13:25:56 +1100
Message-ID: <87wmq0z363.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Benjamin Gray <bgray@linux.ibm.com> writes:
> On Mon, 2024-03-18 at 08:38 +1100, Benjamin Gray wrote:
>> On Fri, 2024-03-15 at 07:14 +0000, Christophe Leroy wrote:
>> > Le 15/03/2024 =C3=A0 03:57, Benjamin Gray a =C3=A9crit=C2=A0:
>> > > diff --git a/arch/powerpc/lib/test-code-patching.c
>> > > b/arch/powerpc/lib/test-code-patching.c
>> > > index c44823292f73..35a3756272df 100644
>> > > --- a/arch/powerpc/lib/test-code-patching.c
>> > > +++ b/arch/powerpc/lib/test-code-patching.c
>> > > @@ -347,6 +347,97 @@ static void __init
>> > > test_prefixed_patching(void)
>> > > =C2=A0=C2=A0	check(!memcmp(iptr, expected, sizeof(expected)));
>> > > =C2=A0 }
>> > > =C2=A0=20
>> > > +static void __init test_multi_instruction_patching(void)
>> > > +{
>> > > +	u32 code[256];
>> >=20
>> > Build failure:
>> >=20
>> > =C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch/powerpc/lib/test-co=
de-patching.o
>> > arch/powerpc/lib/test-code-patching.c: In function=20
>> > 'test_multi_instruction_patching':
>> > arch/powerpc/lib/test-code-patching.c:439:1: error: the frame size
>> > of
>> > 1040 bytes is larger than 1024 bytes [-Werror=3Dframe-larger-than=3D]
>> > =C2=A0=C2=A0 439 | }
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | ^
>> > cc1: all warnings being treated as errors
>> > make[4]: *** [scripts/Makefile.build:243:=20
>> > arch/powerpc/lib/test-code-patching.o] Error 1
>> >=20
>> >=20
>> > I have to avoid big arrays on the stack.
>>=20
>> All good, I can do that.
>>=20
>> I do run my patches through a couple of 32-bit configs, but I didn't
>> see this error. Is this a standard config I should be testing with?
>
> Specifically pmac32_defconfig and ppc44x_defconfig

Both of those have CONFIG_FRAME_WARN=3D1024, so should have caught this.

But neither have CONFIG_CODE_PATCHING_SELFTEST=3Dy, so I suspect that's
why you didn't see it.

I recommend ppc32_allmodconfig.

cheers
