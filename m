Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6640B3149CC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 08:58:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZZyL4hDWzDsTN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 18:58:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SkBJdGJE; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZZwg1704zDqrF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 18:56:50 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id y10so9291630plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Feb 2021 23:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=IKtDbkpTW92/CPv0ahP5JLmJlZUSWpczGDc7m2oxTH8=;
 b=SkBJdGJEHT4IkA/vrqy4/eKEYfeLuq/49hO/9zSk+FVJ6OD/YMaAB4WQN4PQ6peKc0
 3bDvkqZUBcAFFyX8yOUA2LMWqC/TW8xf7aXYms8/f06DUCsXNQPu0GUK4O1SXMg5ADJj
 JTE5WPvK75VljUjWJ6asLKqFsIHvTWCC79oZMznWD+9DWQTOnvTp2CAny4RKqiyXruCI
 a0ZT4QJ+Juyj6EVXvL1V0AwUMfUBOObCwjaxVp8PXmJ69hHKSFU3oLwLa8jc6F5QGQ12
 70Lj7so1IBFWLE4zNLdG8rH+M3E6DtsaLXj8vc/hJIsJfMT2INqEZdOTVFeVE4noosF/
 ZDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=IKtDbkpTW92/CPv0ahP5JLmJlZUSWpczGDc7m2oxTH8=;
 b=F6K5ExIKpVEic2lXmBwAxAEvLZxL5Kn8QGZ7P+aS6z0B3Y/8wReZsx/mcJQXlvxKxl
 3yne+ZXpNYNK9BW0lAnwdAkKuyAy9LMWt0Nr/hgMrbShter6rrqEpcKYc3hqUwRpVQLF
 PYeakSmLGEXuzqHkdcWxXYK9Sb2lhusxJ/2tEVvah9HBcFsrK+mYSSYRVjvHH7vauHHs
 gwC1vynD9j8JUfQftrOx7jw+jUo3btstI7NARO3KgYZpQEvDeImkNj9UCe1ChPD4OsJ0
 9Yt1Kcnl6ykk54Z7FConDj5Z1OxJCiIuxoVhth3E9qjFSeVklST45AuqSiaMHKEpZQTa
 V/qA==
X-Gm-Message-State: AOAM532+Ti0O2mSf7x8lnKRZc2JnLDiktsAB9YAz+2zTHt26EscHUSJE
 m1Zy/xBKp9Rk2ZYR6cequWg=
X-Google-Smtp-Source: ABdhPJy6bPsgDzpDCTtda60Dzrws2lQ5LtiRaH1BA44OInHnVZ7+E+K3x9BMnzOXI2tDN049ftktNw==
X-Received: by 2002:a17:90a:6588:: with SMTP id
 k8mr2792812pjj.43.1612857405439; 
 Mon, 08 Feb 2021 23:56:45 -0800 (PST)
Received: from localhost ([1.132.144.180])
 by smtp.gmail.com with ESMTPSA id n1sm6641098pgn.94.2021.02.08.23.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 23:56:44 -0800 (PST)
Date: Tue, 09 Feb 2021 17:56:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 17/22] powerpc/syscall: Do not check unsupported scv
 vector on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <fc3afe1870f943b2010805fcb045b718a638b3c6.1612796617.git.christophe.leroy@csgroup.eu>
 <1612835741.qmlhg8iwmj.astroid@bobo.none>
 <82c4abb1-cb52-e856-b2dd-d7c7d48bd292@csgroup.eu>
In-Reply-To: <82c4abb1-cb52-e856-b2dd-d7c7d48bd292@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612857042.f9qpgkdvz6.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 9, 2021 4:13 pm:
>=20
>=20
> Le 09/02/2021 =C3=A0 03:00, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>>> Only PPC64 has scv. No need to check the 0x7ff0 trap on PPC32.
>>> For that, add a helper trap_is_unsupported_scv() similar to
>>> trap_is_scv().
>>>
>>> And ignore the scv parameter in syscall_exit_prepare (Save 14 cycles
>>> 346 =3D> 332 cycles)
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> v5: Added a helper trap_is_unsupported_scv()
>>> ---
>>>   arch/powerpc/include/asm/ptrace.h | 5 +++++
>>>   arch/powerpc/kernel/entry_32.S    | 1 -
>>>   arch/powerpc/kernel/interrupt.c   | 7 +++++--
>>>   3 files changed, 10 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/a=
sm/ptrace.h
>>> index 58f9dc060a7b..2c842b11a924 100644
>>> --- a/arch/powerpc/include/asm/ptrace.h
>>> +++ b/arch/powerpc/include/asm/ptrace.h
>>> @@ -229,6 +229,11 @@ static inline bool trap_is_scv(struct pt_regs *reg=
s)
>>>   	return (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) =3D=3D 0x3000=
);
>>>   }
>>>  =20
>>> +static inline bool trap_is_unsupported_scv(struct pt_regs *regs)
>>> +{
>>> +	return (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && TRAP(regs) =3D=3D 0x7ff0)=
;
>>> +}
>>=20
>> This change is good.
>>=20
>>> +
>>>   static inline bool trap_is_syscall(struct pt_regs *regs)
>>>   {
>>>   	return (trap_is_scv(regs) || TRAP(regs) =3D=3D 0xc00);
>>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry=
_32.S
>>> index cffe58e63356..7c824e8928d0 100644
>>> --- a/arch/powerpc/kernel/entry_32.S
>>> +++ b/arch/powerpc/kernel/entry_32.S
>>> @@ -344,7 +344,6 @@ transfer_to_syscall:
>>>  =20
>>>   ret_from_syscall:
>>>   	addi    r4,r1,STACK_FRAME_OVERHEAD
>>> -	li	r5,0
>>>   	bl	syscall_exit_prepare
>>=20
>> For this one, I think it would be nice to do the "right" thing and make
>> the function prototypes different on !64S. They could then declare a
>> local const bool scv =3D 0.
>>=20
>> We could have syscall_exit_prepare and syscall_exit_prepare_maybe_scv
>> or something like that, 64s can use the latter one and the former can be
>> a wrapper that passes constant 0 for scv. Then we don't have different
>> prototypes for the same function, but you just have to make the 32-bit
>> version static inline and the 64-bit version exported to asm.
>=20
> You can't call a static inline function from ASM, I don't understand you.

I mean

#ifdef CONFIG_PPC_BOOK3S_64
notrace unsigned long syscall_exit_prepare_scv(unsigned long r3,
                                           struct pt_regs *regs,
                                           long scv)
#else
static inline long syscall_exit_prepare_scv(unsigned long r3,
                                           struct pt_regs *regs,
                                           long scv)
#endif

#ifndef CONFIG_PPC_BOOK3S_64
notrace unsigned long syscall_exit_prepare(unsigned long r3,
                                           struct pt_regs *regs)
{
	return syscall_exit_prepare_scv(r3, regs, 0);
}
#endif


>=20
> What is wrong for you really here ? Is that the fact we leave scv random,=
 or is that the below=20
> IS_ENABLED() ?

That scv arg is random. I know generated code essentially would be no=20
different and no possibility of tracing, but would just prefer to call=20
the C "correctly" if possible.

> I don't mind keeping the 'li r5,0' before calling the function if you fin=
d it cleaner, the real=20
> performance gain is with setting scv to 0 below for PPC32 (and maybe it s=
hould be set to zero for=20
> book3e/64 too ?).

Yes 64e would like this optimisation.

Thanks,
Nick
