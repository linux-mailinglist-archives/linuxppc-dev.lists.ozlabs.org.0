Return-Path: <linuxppc-dev+bounces-123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 121BA95486B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 14:00:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y6Bl4Zp0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlgXp4Mc8z2ymb;
	Fri, 16 Aug 2024 22:00:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y6Bl4Zp0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlgXp47kSz2ym1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 22:00:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1723809610;
	bh=Dg2wmoLuWszE/sMEij+vnB0qKCaWQ2c/mcsfnaVGnx4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y6Bl4Zp03A1u2ELNcUy/JbhEIpmchOH5L/yBokEYh3F8JO6TZBJFixrw6L00BEfKu
	 GHwOkTkSQC0Tx4tpowRvp0YSx98UyBtvFMEsqqPAZLN/Opad/foh5gcjatnMgc8KNe
	 nrFg9hvL2aughm+Q/CwDFshL7H/pSZcIvW78hU2Nb1U/lxWtDHgKIcsuW7UtqdzSzD
	 ymv2CGjJk/H4CdqzDGbjULiM8NMvDkuRKi7MZRmWz5lv9vACQFqD5QEC4MsHwUs6MY
	 ca+vjlOTeJ+SURUiLH1hJ/OjxFHIbu2UIIRjAiwh3GPDXRn3hML1KZiakRJrRIi8Xh
	 a2FrIlUnamupw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlgXp0761z4wcl;
	Fri, 16 Aug 2024 22:00:09 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ivan Orlov <ivan.orlov0322@gmail.com>, Erhard Furtner
 <erhard_f@mailbox.org>, Kees Cook <kees@kernel.org>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, David Gow
 <davidgow@google.com>, kunit-dev@googlegroups.com
Subject: Re: OVERFLOW_KUNIT_TEST fails with BUG: KASAN: stack-out-of-bounds
 in string_nocheck+0x168/0x1c8 (kernel 6.11-rc2, PowerMac G4 DP)
In-Reply-To: <e40749be-5f0c-458f-8baa-c32f76491605@gmail.com>
References: <20240809231537.7c9ee7ea@yea> <202408121146.1D02EB6E@keescook>
 <20240814223813.7b301ad4@yea>
 <81303aa9-40a4-42ec-8e48-4a460398d469@gmail.com>
 <e40749be-5f0c-458f-8baa-c32f76491605@gmail.com>
Date: Fri, 16 Aug 2024 22:00:09 +1000
Message-ID: <87sev43cfq.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ivan Orlov <ivan.orlov0322@gmail.com> writes:
> On 8/15/24 00:26, Ivan Orlov wrote:
>>=20
>> As you can see, the device name is defined as a local variable, which=20
>> means that it doesn't exist out of the 'overflow_allocation_test'=20
>> function scope. This patch:
>>=20
>> diff --git a/lib/overflow_kunit.c b/lib/overflow_kunit.c
>> index f314a0c15a6d..fa7ca8c94eee 100644
>> --- a/lib/overflow_kunit.c
>> +++ b/lib/overflow_kunit.c
>> @@ -668,7 +668,7 @@ DEFINE_TEST_ALLOC(devm_kzalloc,=C2=A0 devm_kfree, 1,=
 1, 0);
>>=20
>>  =C2=A0static void overflow_allocation_test(struct kunit *test)
>>  =C2=A0{
>> -=C2=A0=C2=A0=C2=A0 const char device_name[] =3D "overflow-test";
>> +=C2=A0=C2=A0=C2=A0 static const char device_name[] =3D "overflow-test";
>>  =C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev;
>>  =C2=A0=C2=A0=C2=A0=C2=A0 int count =3D 0;
>>=20
>>=20
>> Seems to fix the problem and it is not reproducable anymore.
>>=20
>> I will send the proper patch tomorrow.
>>=20
>> Good night!
>>=20
>
> Forgot to mention that the problem is intermittently reproducible on=20
> QEMU x86_64, and this is the only architecture I tested the solution on.
>
> However, it looks like the initial report points us to=20
> 'module_remove_driver' function, which presumably calls the following=20
> kasprintf as a part of 'make_driver_name' function which also operates=20
> on driver name. If driver name points to invalid memory range (because=20
> it is out of scope), it is going to cause a KASAN bug kernel panic.

Nice catch.

I notice there's at least one other case that looks similar in=20
lib/fortify_kunit.c

cheers

