Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 811023FE821
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 05:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0Rdk2t0pz2yJS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 13:45:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RBVYmLXy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RBVYmLXy; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0Rd23W3Mz2xXS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 13:44:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630554272;
 bh=kyC4P43jTqdCXlepq9Qq0VFKDAg7rIYohtTsxd8bJnA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RBVYmLXyXx+XEvmBnwR+fFdIE33VfmZRCYa2duRWeEolkf0mTHfxcAYVNMNsyx0ut
 RyqkZmAllAme9WPCKo2L9JQR1+Etxvl539QCg/i6nIPv1CXjK3HOXiZsx0qxe7phhG
 nVPSEwEwId64OY5qSV67SvtwzID4l8sCWXHsiBV7gg+eNq41ksKHJvoq653ZuQ8cdY
 SV/sII/DsuS2uRnJZGffiD1NBrqyeWThTCem7z0X13IvRIRwbV/diF3e6fABKwcWhR
 IAe5MIfSQoRQMkLRKlaeaRonfn07kbAMUx1WOX3X6+gD8avpzRi+gPK+L4IRYoDxxo
 vlwHuCIj3W31g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H0Rcv2qSzz9sXk;
 Thu,  2 Sep 2021 13:44:31 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/2] selftests/powerpc: Add scv versions of the basic
 TM syscall tests
In-Reply-To: <1630553190.fkqnk0by89.astroid@bobo.none>
References: <20210901165418.1412891-1-npiggin@gmail.com>
 <20210901165418.1412891-2-npiggin@gmail.com>
 <f99fa6c6-cebe-c261-0971-0f485cbcea2d@csgroup.eu>
 <1630553190.fkqnk0by89.astroid@bobo.none>
Date: Thu, 02 Sep 2021 13:44:29 +1000
Message-ID: <87o89b3ale.fsf@mpe.ellerman.id.au>
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
Cc: Eirik Fuller <efuller@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Excerpts from Christophe Leroy's message of September 2, 2021 3:15 am:
>> Le 01/09/2021 =C3=A0 18:54, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> The basic TM vs syscall test code hard codes an sc instruction for the
>>> system call, which fails to cover scv even when the userspace libc has
>>> support for it.
>>>=20
>>> Duplicate the tests with hard coded scv variants so both are tested
>>> when possible.
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   .../selftests/powerpc/tm/tm-syscall-asm.S     | 46 +++++++++++++++++++
>>>   .../testing/selftests/powerpc/tm/tm-syscall.c | 36 ++++++++++++---
>>>   2 files changed, 75 insertions(+), 7 deletions(-)
>>>=20
>>> diff --git a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S b/tool=
s/testing/selftests/powerpc/tm/tm-syscall-asm.S
>>> index bd1ca25febe4..849316831e6a 100644
>>> --- a/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
>>> +++ b/tools/testing/selftests/powerpc/tm/tm-syscall-asm.S
>>> @@ -2,6 +2,10 @@
>>>   #include <ppc-asm.h>
>>>   #include <asm/unistd.h>
>>>=20=20=20
>>> +/* ppc-asm.h does not define r0 or r1 */
>>> +#define r0 0
>>> +#define r1 1
>>> +
>>=20
>> See https://github.com/gcc-mirror/gcc/blob/master/gcc/config/rs6000/ppc-=
asm.h
>>=20
>> It doesn't not define r1 but it defines r0.
>
> Oops, I'll fix that.
>
>> And it defines 'sp' as register 1.
>
> Does userspace code typically use that? Kernel code AFAIKS does not.

Some does, but it's not used consistently IME.

I'd prefer you just use %r1.

cheers
