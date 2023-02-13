Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2379969435C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 11:46:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PFgx70DG0z3c6m
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Feb 2023 21:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fG7cAGIV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PFgwB5wG8z30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 21:45:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fG7cAGIV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PFgw51NN8z4x7j;
	Mon, 13 Feb 2023 21:45:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676285109;
	bh=8AFgNtOW3ZA6Km8g4poh1h/kNHDHJjZ+emzcHe+CaKU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fG7cAGIVCte7K9VCMlHRKE2GVh0/+a/fi/2xPJtwb32E/bYASsq5UolXgwm3sBJ1+
	 dkO/ubnYvinicAqRRjuL1+metWlm0vazYOdAtqw5/OEWBOpas/Bw7mhiUieqB5Khks
	 zaChkmDY+svgaH1EKR1IPedIXLd+olsi1+1Xo8RGZstGdxTCf0pdmhWgsU8/wyjA7D
	 LuA5tkl6hunfF/8R7KRikrCLKfPwcBKGUyOKdt376x9L3pMGQGSONHhXY55vvAdw0K
	 EdJ2gHQBJK4htciloYOzsJ8letZ6LCxjdyYgwt5OtD9G4iQFuIT30AHUiTrO5gHcam
	 5d/dd8dL20vjw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "nathanl@linux.ibm.com"
 <nathanl@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/machdep: warn when machine_is() used too early
In-Reply-To: <53a1e4be-e41a-8cb7-c617-b473a2a01b9d@csgroup.eu>
References: <20230210-warn-on-machine-is-before-probe-machine-v1-1-f0cba57125fb@linux.ibm.com>
 <53a1e4be-e41a-8cb7-c617-b473a2a01b9d@csgroup.eu>
Date: Mon, 13 Feb 2023 21:45:04 +1100
Message-ID: <87sff9vo7j.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 11/02/2023 =C3=A0 00:56, Nathan Lynch via B4 Submission Endpoint a =C3=
=A9crit=C2=A0:
>> From: Nathan Lynch <nathanl@linux.ibm.com>
>>=20
>> machine_is() can't provide correct results before probe_machine() has
>> run. Warn when it's used too early in boot.
>>=20
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>> Prompted by my attempts to do some pseries-specific setup during
>> rtas_initialize() and being puzzled for a while that it wasn't
>> working.
>> ---
>>   arch/powerpc/include/asm/machdep.h | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/a=
sm/machdep.h
>> index 378b8d5836a7..8c0a799d18cd 100644
>> --- a/arch/powerpc/include/asm/machdep.h
>> +++ b/arch/powerpc/include/asm/machdep.h
>> @@ -220,11 +220,13 @@ extern struct machdep_calls *machine_id;
>>   	EXPORT_SYMBOL(mach_##name);				\
>>   	struct machdep_calls mach_##name __machine_desc =3D
>>=20=20=20
>> -#define machine_is(name) \
>> -	({ \
>> -		extern struct machdep_calls mach_##name \
>> -			__attribute__((weak));		 \
>> -		machine_id =3D=3D &mach_##name; \
>> +#define machine_is(name)                                            \
>> +	({                                                          \
>> +		extern struct machdep_calls mach_##name             \
>> +			__attribute__((weak));                      \
>> +		WARN(!machine_id,                                   \
>> +		     "machine_is() called before probe_machine()"); \
>
> Is a WARN() really necessary ? WARN() is less optimised than WARN_ON(),=20
> especially on PPC64.
>
> This should never ever happen so a WARN_ON(!machine_id) should be=20
> enough, the developper that hits it is able to go to the given file:line=
=20
> and understand what happened.

Yeah I agree, WARN_ON() should be sufficient here, and should generate
slightly better code. We have > 100 uses of machine_is(), so keeping
each small is desirable.

cheers
