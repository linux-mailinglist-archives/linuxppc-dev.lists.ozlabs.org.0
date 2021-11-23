Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E0459B6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 06:15:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HysmD36GTz2yQL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 16:15:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c0ynBMXd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=c0ynBMXd; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyslT6ZQHz2yNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 16:14:59 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so1376798pjj.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 21:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=AcfcS5kgVJZbY+iN3SiDoVYsjYAbgMdYxLdTpHYoQZI=;
 b=c0ynBMXdRvkRjZRRc2x9gCbGxVFp6xV/IY6jy+MpXt5Dq4NFy2vDRHEtWVvLf4V/1t
 Fdq5CqVOPM0FsOHQtpoDMIp8lrul1S9tyqhTJns9mT59fHZ4a6YAPnxgaujjRYcQBYKF
 U3hQYBpayFOJ1Yzir1Z/x5TtT730ULdPLv7ZXGVE0MJk9mYJFg7P26oAC6ZBrDWKU6v/
 B4GobDgXqpTwktu8yFMUHHD9UI40OSedbhpnW/LRrC6WPo7jzm4tPNVsVivYfelFZa+t
 e5+SK67leLOn8wIRkKYSYuoDPQIhZ2DMoFvDqeMAn2RGMB0DaSsZBqPlHrOZNsuQ3P35
 0fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=AcfcS5kgVJZbY+iN3SiDoVYsjYAbgMdYxLdTpHYoQZI=;
 b=TreCqlHftV7yKP9lMGnNZHk2iN9tSc0BkCrrqEsmMd1TExrHhsn8uYi/hWJ7RT1ksn
 a2IdcROy9jy8AtFnxjIdbJxSQUMhlO0S4ql9vsNqVbS7SogNjM1IqXOiojsuSg2ERl1W
 81blxkVm3W60/sZi2/O6F88qzvI9swLSlot7Kius94hcXabb1HJvZ4KhOtcJ1i71kD1M
 YYun2ar+khAK7H9ot8on/DBLEco9C74lujj6MkNzir1c0fO+MI/wnRCaCo2uZ/078bhr
 WiKwhi9UyX4I7z2nhVmzkuq4Yb6nEi8LWoO5Njmmp5co339qPs1JuyzXrVoHk7fEVcFN
 xeGA==
X-Gm-Message-State: AOAM5318C/KySMdb8wypW0Et0jLJTxuvWUFdDSZ4QbV+VGkLu/CHc0/P
 hWGWLBOzsLei2qhMAB8bcmw=
X-Google-Smtp-Source: ABdhPJyHQ3baYiILgQYqvKJVupbGKP6mqX516pOc6Q910tvYsRRwJOxry1Au97LUjCoZQMdWOrKlzQ==
X-Received: by 2002:a17:902:db0e:b0:142:13e4:b456 with SMTP id
 m14-20020a170902db0e00b0014213e4b456mr3785969plx.43.1637644495426; 
 Mon, 22 Nov 2021 21:14:55 -0800 (PST)
Received: from localhost (220-244-84-117.tpgi.com.au. [220.244.84.117])
 by smtp.gmail.com with ESMTPSA id k1sm11150332pfu.31.2021.11.22.21.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 21:14:55 -0800 (PST)
Date: Tue, 23 Nov 2021 15:14:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64s: introduce CONFIG_MAXSMP to test very
 large SMP
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20211109065131.2041720-1-npiggin@gmail.com>
 <c363e53c-cba5-5711-e8c4-6d74c44f99be@csgroup.eu>
 <87ilwzm18j.fsf@mpe.ellerman.id.au> <87czmrr8hb.fsf@mpe.ellerman.id.au>
In-Reply-To: <87czmrr8hb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1637644417.rd9apgh5k7.astroid@bobo.none>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of November 23, 2021 11:01 am:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> Le 09/11/2021 =C3=A0 07:51, Nicholas Piggin a =C3=A9crit=C2=A0:
>> ...
>>>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/pla=
tforms/Kconfig.cputype
>>>> index a208997ade88..14c275e0ff93 100644
>>>> --- a/arch/powerpc/platforms/Kconfig.cputype
>>>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>>>> @@ -475,9 +475,14 @@ config SMP
>>>>  =20
>>>>   	  If you don't know what to do here, say N.
>>>>  =20
>>>> +# MAXSMP sets 8192 if COMPILE_TEST because that's what x86 has flushe=
d out.
>>>> +# Exceeding that will cause a lot of compile errors. Have to deal wit=
h those
>>>> +# first.
>>>>   config NR_CPUS
>>>> -	int "Maximum number of CPUs (2-8192)" if SMP
>>>> -	range 2 8192 if SMP
>>>> +	int "Maximum number of CPUs (2-8192)" if SMP && !MAXSMP
>>>> +	range 2 16384 if SMP
>>>> +	default 16384 if MAXSMP && !COMPILE_TEST
>>>> +	default 8192 if MAXSMP && COMPILE_TEST
>>>
>>> You can do less complex. First hit becomes the default, so you can do:
>>>
>>> 	default 8192 if MAXSMP && COMPILE_TEST
>>> 	default 16384 if MAXSMP
>>
>> I did that when applying.
>=20
> But I'll have to drop it, it breaks the allyesconfig build:

Ah, you still need patch 1/2 sorry I confused things by only re-sending=20
this one.

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211105035042.1398=
309-1-npiggin@gmail.com/

Thanks,
Nick

>=20
>   In file included from /home/michael/linux/arch/powerpc/include/asm/para=
virt.h:15,
>                    from /home/michael/linux/arch/powerpc/include/asm/qspi=
nlock.h:6,
>                    from /home/michael/linux/arch/powerpc/include/asm/spin=
lock.h:7,
>                    from /home/michael/linux/include/linux/spinlock.h:93,
>                    from /home/michael/linux/include/linux/mmzone.h:8,
>                    from /home/michael/linux/include/linux/gfp.h:6,
>                    from /home/michael/linux/include/linux/mm.h:10,
>                    from /home/michael/linux/arch/powerpc/platforms/powern=
v/idle.c:9:
>   /home/michael/linux/arch/powerpc/include/asm/cputhreads.h: In function =
=E2=80=98cpu_thread_mask_to_cores.constprop=E2=80=99:
>   /home/michael/linux/arch/powerpc/include/asm/cputhreads.h:61:1: error: =
the frame size of 2064 bytes is larger than 2048 bytes [-Werror=3Dframe-lar=
ger-than=3D]
>      61 | }
>         | ^
>   /home/michael/linux/arch/powerpc/platforms/powernv/idle.c: In function =
=E2=80=98store_fastsleep_workaround_applyonce=E2=80=99:
>   /home/michael/linux/arch/powerpc/platforms/powernv/idle.c:220:1: error:=
 the frame size of 2080 bytes is larger than 2048 bytes [-Werror=3Dframe-la=
rger-than=3D]
>     220 | }
>         | ^
>   cc1: all warnings being treated as errors
>   make[4]: *** [/home/michael/linux/scripts/Makefile.build:287: arch/powe=
rpc/platforms/powernv/idle.o] Error 1
>   make[4]: *** Waiting for unfinished jobs....
>   make[3]: *** [/home/michael/linux/scripts/Makefile.build:549: arch/powe=
rpc/platforms/powernv] Error 2
>   make[3]: *** Waiting for unfinished jobs....
>   /home/michael/linux/arch/powerpc/kvm/book3s_hv_interrupts.S: Assembler =
messages:
>   /home/michael/linux/arch/powerpc/kvm/book3s_hv_interrupts.S:66: Error: =
operand out of range (0x0000000000010440 is not between 0xffffffffffff8000 =
and 0x0000000000007ffc)
>   make[3]: *** [/home/michael/linux/scripts/Makefile.build:388: arch/powe=
rpc/kvm/book3s_hv_interrupts.o] Error 1
>   make[3]: *** Waiting for unfinished jobs....
>   make[2]: *** [/home/michael/linux/scripts/Makefile.build:549: arch/powe=
rpc/platforms] Error 2
>   make[2]: *** Waiting for unfinished jobs....
>   make[2]: *** [/home/michael/linux/scripts/Makefile.build:549: arch/powe=
rpc/kvm] Error 2
>   make[1]: *** [/home/michael/linux/Makefile:1846: arch/powerpc] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>   make: *** [Makefile:219: __sub-make] Error 2
>=20
> cheers
>=20
