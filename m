Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C13693E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 15:42:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRb7L2bs6z302g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 23:42:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nMR63KQ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nMR63KQ6; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRb6x11v2z2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 23:41:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRb6s4FK3z9sWc;
 Fri, 23 Apr 2021 23:41:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1619185303;
 bh=xscDS3zmPdEEDKyvP0DL/tNXfdme/0WkA7LPHuZrTMs=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=nMR63KQ6ehdkv04REDsumgQtqAa52dJBu+vpYFehHpUWu5O7dFqJeLkXV0EQp2VFj
 IMM7yv/E6tQNue1knBqldjHxAdeKWHubOGzsTIn4CNMbrdiE17Kc7fdgxfNO7XyGl5
 yxG9qaohC5QCJHYwWgs33bnvtviM2YEEZBoBobqFeF9tIBJKoPyvaouHsoytS5wOMO
 891jm1VZual8yv9BU0nLfrtk/Mt1t/xTDEdQfR92n8u6q9iDCtIhWP15LnJK0Qe1pi
 0dRTp0BLJ3lbExNacOcFdNX76ZbzJC5hUJIu0sCxFik6tKDhs702tVkrAMFICmG19m
 HzRRoMaZMdfKg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Daniel Axtens
 <dja@axtens.net>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
In-Reply-To: <593f0a59-c91e-573a-e37c-b710ca7891f8@csgroup.eu>
References: <20210422092737.895392-1-aik@ozlabs.ru>
 <87mttqylho.fsf@dja-thinkpad.axtens.net>
 <593f0a59-c91e-573a-e37c-b710ca7891f8@csgroup.eu>
Date: Fri, 23 Apr 2021 23:41:39 +1000
Message-ID: <878s59azjg.fsf@mpe.ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 23/04/2021 =C3=A0 00:58, Daniel Axtens a =C3=A9crit=C2=A0:
>>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>>> index c9d2c7825cd6..3a2f2001c62b 100644
>>> --- a/arch/powerpc/Makefile
>>> +++ b/arch/powerpc/Makefile
>>> @@ -214,7 +214,6 @@ KBUILD_CPPFLAGS	+=3D -I $(srctree)/arch/$(ARCH) $(a=
sinstr)
>>>   KBUILD_AFLAGS	+=3D $(AFLAGS-y)
>>>   KBUILD_CFLAGS	+=3D $(call cc-option,-msoft-float)
>>>   KBUILD_CFLAGS	+=3D -pipe $(CFLAGS-y)
>>> -CPP		=3D $(CC) -E $(KBUILD_CFLAGS)
>>=20
>> I was trying to check the history to see why powerpc has its own
>> definition. It seems to date back at least as far as merging the two
>> powerpc platforms into one, maybe it was helpful then. I agree it
>> doesn't seem to be needed now.
>>=20
>
> I digged a bit deaper. It has been there since the introduction of arch/p=
pc/ in Linux 1.3.45
> At the time, there was the exact same CPP definition in arch/mips/Makefile
>
> The CPP definition in mips disappeared is Linux 2.1.44pre3.
> Since that version, ppc has been the only one with such CPP re-definition.
>
>> Snowpatch claims that this breaks the build, but I haven't been able to
>> reproduce the issue in either pmac32 or ppc64 defconfig. I have sent it
>> off to a fork of mpe's linux-ci repo to see if any of those builds hit
>> any issues: https://github.com/daxtens/linux-ci/actions
>>=20
>
> By the way, I find snowpatch quite useless these days. It seems to delete=
 the reports a few minutes=20
> after the test. We are less than one day after the patch was submitted an=
d the report of the build=20
> failures are already gone.

Yeah, it's pretty annoying. It needs to send emails to the list with its
results, with a link to a location that retains the logs for some
reasonable period.

cheers
