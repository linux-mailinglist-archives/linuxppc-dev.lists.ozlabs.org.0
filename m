Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C498645997A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 02:01:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hym7G5fZcz30JT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 12:01:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MllJYT0H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hym6b0tb3z2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 12:01:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=MllJYT0H; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hym6X1BZ3z4xbH;
 Tue, 23 Nov 2021 12:01:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637629268;
 bh=0pXip2X4/rhomDp2EtioIyam9C3Ynkvn90zXQQKqlFA=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=MllJYT0Hfi30+Lj9s0Xi9U+/TRajXlC0TN3F5HAoOK2g4Fe8g56qrvjKc4zK5zDvM
 GlPXyTVDBYbVo0ULDK7gg9Eg48hUOBDO8jtPnK7HIKkpmhiRFHHQZ0S49UMNuGt8Lk
 CZjxEjUd6/3xtOwWDmkXRB9n7Yb1m8kNKyOfdyV7roxgt7VBDvkGLwuiNoBYtRIqxc
 dKWk+OjW4Ew20xguXW8cskSEML0a1XLBvS007Kw0GrhsOSXadjGqIyb3tTPkOof1+6
 1XjOVj5z6WSa2KVuniKgKfnCPurOKt1bEGiafL8Sr4QnoyDDEpLU6fmzddliY5g84X
 Gq1bU5HAQJ5hQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/64s: introduce CONFIG_MAXSMP to test very
 large SMP
In-Reply-To: <87ilwzm18j.fsf@mpe.ellerman.id.au>
References: <20211109065131.2041720-1-npiggin@gmail.com>
 <c363e53c-cba5-5711-e8c4-6d74c44f99be@csgroup.eu>
 <87ilwzm18j.fsf@mpe.ellerman.id.au>
Date: Tue, 23 Nov 2021 12:01:04 +1100
Message-ID: <87czmrr8hb.fsf@mpe.ellerman.id.au>
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

Michael Ellerman <mpe@ellerman.id.au> writes:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 09/11/2021 =C3=A0 07:51, Nicholas Piggin a =C3=A9crit=C2=A0:
> ...
>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/plat=
forms/Kconfig.cputype
>>> index a208997ade88..14c275e0ff93 100644
>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>> @@ -475,9 +475,14 @@ config SMP
>>>=20=20=20
>>>   	  If you don't know what to do here, say N.
>>>=20=20=20
>>> +# MAXSMP sets 8192 if COMPILE_TEST because that's what x86 has flushed=
 out.
>>> +# Exceeding that will cause a lot of compile errors. Have to deal with=
 those
>>> +# first.
>>>   config NR_CPUS
>>> -	int "Maximum number of CPUs (2-8192)" if SMP
>>> -	range 2 8192 if SMP
>>> +	int "Maximum number of CPUs (2-8192)" if SMP && !MAXSMP
>>> +	range 2 16384 if SMP
>>> +	default 16384 if MAXSMP && !COMPILE_TEST
>>> +	default 8192 if MAXSMP && COMPILE_TEST
>>
>> You can do less complex. First hit becomes the default, so you can do:
>>
>> 	default 8192 if MAXSMP && COMPILE_TEST
>> 	default 16384 if MAXSMP
>
> I did that when applying.

But I'll have to drop it, it breaks the allyesconfig build:

  In file included from /home/michael/linux/arch/powerpc/include/asm/paravi=
rt.h:15,
                   from /home/michael/linux/arch/powerpc/include/asm/qspinl=
ock.h:6,
                   from /home/michael/linux/arch/powerpc/include/asm/spinlo=
ck.h:7,
                   from /home/michael/linux/include/linux/spinlock.h:93,
                   from /home/michael/linux/include/linux/mmzone.h:8,
                   from /home/michael/linux/include/linux/gfp.h:6,
                   from /home/michael/linux/include/linux/mm.h:10,
                   from /home/michael/linux/arch/powerpc/platforms/powernv/=
idle.c:9:
  /home/michael/linux/arch/powerpc/include/asm/cputhreads.h: In function =
=E2=80=98cpu_thread_mask_to_cores.constprop=E2=80=99:
  /home/michael/linux/arch/powerpc/include/asm/cputhreads.h:61:1: error: th=
e frame size of 2064 bytes is larger than 2048 bytes [-Werror=3Dframe-large=
r-than=3D]
     61 | }
        | ^
  /home/michael/linux/arch/powerpc/platforms/powernv/idle.c: In function =
=E2=80=98store_fastsleep_workaround_applyonce=E2=80=99:
  /home/michael/linux/arch/powerpc/platforms/powernv/idle.c:220:1: error: t=
he frame size of 2080 bytes is larger than 2048 bytes [-Werror=3Dframe-larg=
er-than=3D]
    220 | }
        | ^
  cc1: all warnings being treated as errors
  make[4]: *** [/home/michael/linux/scripts/Makefile.build:287: arch/powerp=
c/platforms/powernv/idle.o] Error 1
  make[4]: *** Waiting for unfinished jobs....
  make[3]: *** [/home/michael/linux/scripts/Makefile.build:549: arch/powerp=
c/platforms/powernv] Error 2
  make[3]: *** Waiting for unfinished jobs....
  /home/michael/linux/arch/powerpc/kvm/book3s_hv_interrupts.S: Assembler me=
ssages:
  /home/michael/linux/arch/powerpc/kvm/book3s_hv_interrupts.S:66: Error: op=
erand out of range (0x0000000000010440 is not between 0xffffffffffff8000 an=
d 0x0000000000007ffc)
  make[3]: *** [/home/michael/linux/scripts/Makefile.build:388: arch/powerp=
c/kvm/book3s_hv_interrupts.o] Error 1
  make[3]: *** Waiting for unfinished jobs....
  make[2]: *** [/home/michael/linux/scripts/Makefile.build:549: arch/powerp=
c/platforms] Error 2
  make[2]: *** Waiting for unfinished jobs....
  make[2]: *** [/home/michael/linux/scripts/Makefile.build:549: arch/powerp=
c/kvm] Error 2
  make[1]: *** [/home/michael/linux/Makefile:1846: arch/powerpc] Error 2
  make[1]: *** Waiting for unfinished jobs....
  make: *** [Makefile:219: __sub-make] Error 2

cheers
