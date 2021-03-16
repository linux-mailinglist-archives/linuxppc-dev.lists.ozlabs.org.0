Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB1333CE63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F04H45tvqz30JS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bsjLgUGd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bsjLgUGd; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F04Gf2MvNz302Y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:11:52 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so3173374pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=fPpLCaVVu2yparocfkv3Xm+zW98kKfJjNxPALjDON7c=;
 b=bsjLgUGdq1PfRpy1yfR5W+PIy+jCLJ4+5fmoIS1vLSX4WxJd47Td5WY3Cz9Awx0O0g
 lUbvWG3Qg4+So179GhQpRbT/XIYUdSRyXTBA04iqCa0y3ev73cJDoBSLfbsu135MN2AY
 oB4XV67cney3aEDeqXpnc4XnkA1gG5DPrDfeg/uq2AVNZPK4rpVP+S8KqbgqadnJlIpe
 1UUcSAgY31uFOzfChk6kUVpjIgOV/MaZnbD7btNRWZfUmCNBjV1VzOs3Uj46wKUdYKE/
 RHWpQOLheM3zzkRJLiIqProYJgmclM50wPoSoHMqhdYqEE9GbtEo+GoY9k0g+6BP89TW
 oj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=fPpLCaVVu2yparocfkv3Xm+zW98kKfJjNxPALjDON7c=;
 b=YYW8uSBfijaMsgf24OpfhxoXOAOcONsRzXE9t9REKctRU0V1xTD+4EJfI64DxUxE1I
 Lh6qTCLAVJFSH2kNPq3O/NbkwXoyS99eDTBgTGHUJXUiRa+xedS0R+2vdFZc6qe+limT
 xdQGXhhQydWiqux/eqGpjMrFMb95wWyE1ULmU96S5QEiz1X+Xm2+92fpELzJLTFEk859
 of9DV3OzVtwpRCX5/gaAjL8DPdfGbri8GfMs9mk029o9xCiXv/KDmLMNeZpilNs+x8AA
 8x68SAVkLv+bTfC7GZo4lWUwD4oqIy5LTHLjn0Wt1OaSn+HRko5ZGWv9qQlKZHwqpmqW
 XPEw==
X-Gm-Message-State: AOAM532I/Lu5peq8IXCz3cOqrI4xS6vmPpI41PWPJquu4pkuoGmXYIEf
 fxxeTKrMGVRfKBZda9u8VanTlG9Emm8=
X-Google-Smtp-Source: ABdhPJyYuR3rLfXUzLaPQVEsBskjtlslvNwgOivjLg1xMuH7TVR3PapEcY2pIkfJ+FSI3R9gZXVUNA==
X-Received: by 2002:a17:90b:20c:: with SMTP id
 fy12mr3362897pjb.41.1615878709750; 
 Tue, 16 Mar 2021 00:11:49 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id gm10sm1834749pjb.4.2021.03.16.00.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 00:11:49 -0700 (PDT)
Date: Tue, 16 Mar 2021 17:11:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 10/10] powerpc: move norestart trap flag to bit 0
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-11-npiggin@gmail.com>
 <99f15df0-dc86-4601-066f-a6c067ece8bf@csgroup.eu>
In-Reply-To: <99f15df0-dc86-4601-066f-a6c067ece8bf@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615878424.0gp943h7l3.astroid@bobo.none>
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of March 15, 2021 6:14 pm:
>=20
>=20
> Le 15/03/2021 =C3=A0 04:17, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Compact the trap flags down to use the low 4 bits of regs.trap.
>>=20
>> A few 64e interrupt trap numbers set bit 4. Although they tended to be
>> trivial so it wasn't a real problem[1], it is not the right thing to do,
>> and confusing.
>>=20
>> [*] E.g., 0x310 hypercall goes to unknown_exception, which prints
>>      regs->trap directly so 0x310 will appear fine, and only the syscall
>>      interrupt will test norestart, so it won't be confused by 0x310.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/ptrace.h | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/as=
m/ptrace.h
>> index 91194fdd5d01..6a04abfe5eb6 100644
>> --- a/arch/powerpc/include/asm/ptrace.h
>> +++ b/arch/powerpc/include/asm/ptrace.h
>> @@ -185,15 +185,21 @@ static inline void regs_set_return_value(struct pt=
_regs *regs, unsigned long rc)
>>   #define current_pt_regs() \
>>   	((struct pt_regs *)((unsigned long)task_stack_page(current) + THREAD_=
SIZE) - 1)
>>  =20
>> +/*
>> + * The 4 low bits (0xf) are available as flags to overload the trap wor=
d,
>> + * because interrupt vectors have minimum alignment of 0x10. TRAP_FLAGS=
_MASK
>> + * must cover the bits used as flags, including bit 0 which is used as =
the
>> + * "norestart" bit.
>> + */
>>   #ifdef __powerpc64__
>> -#define TRAP_FLAGS_MASK		0x10
>> +#define TRAP_FLAGS_MASK		0x1
>>   #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
>>   #else
>>   /*
>>    * On 4xx we use bit 1 in the trap word to indicate whether the except=
ion
>>    * is a critical exception (1 means it is).
>>    */
>> -#define TRAP_FLAGS_MASK		0x1E
>> +#define TRAP_FLAGS_MASK		0xf
>=20
> Could we set 0xf for all and remove the ifdef __powerpc64__ ?

I like that it documents the bit number allocation so I prefer to leave=20
it, but TRAP() does not have to be defined twice at least.

>=20
>>   #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
>>   #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) !=3D 0)
>>   #define IS_MCHECK_EXC(regs)	(((regs)->trap & 4) !=3D 0)
>> @@ -222,12 +228,12 @@ static inline bool trap_is_syscall(struct pt_regs =
*regs)
>>  =20
>>   static inline bool trap_norestart(struct pt_regs *regs)
>>   {
>> -	return regs->trap & 0x10;
>> +	return regs->trap & 0x1;
>>   }
>>  =20
>>   static inline void set_trap_norestart(struct pt_regs *regs)
>>   {
>> -	regs->trap |=3D 0x10;
>> +	regs->trap |=3D 0x1;
>>   }
>>  =20
>>   #define arch_has_single_step()	(1)
>>=20
>=20
> While we are playing with ->trap, in mm/book3s64/hash_utils.c there is an=
 if (regs->trap =3D=3D 0x400).=20
> Should be TRAP(regs) =3D=3D 0x400 ?

Yes I would say so, if you want to do a patch you can add
Acked-by: Nicholas Piggin <npiggin@gmail.com>

Otherwise I can do it.

Thanks,
Nick
