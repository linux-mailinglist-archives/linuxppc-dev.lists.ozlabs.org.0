Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9677F2AD151
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:31:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVh0v24GwzDqkT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 19:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XjBjCfHr; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVgyy4YWRzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 19:29:58 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id z24so9545341pgk.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 00:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=8YX/gYbNTY3KX8xKiqj1zOKt9kLjkwSiSGb/cEbvHgA=;
 b=XjBjCfHrANeL4PVqhBqh+EOLAmdq39nFdKmveG8+oc47aIHnIDP1Na/smwK252Ejmi
 MqXeKbZYYzWqplEesTzQHZ6aFhbFicFUeecgUv6qTVgIEi49KBri4+6p785865IQnNm+
 PkpC3OK56vsTS7+tyHmCOFoVvh1C3Qawy1Q+SMgpHMrECd5wozwxNWa2Az6YmGKkIKPD
 Tl59WtDvj7uALtwJViaNwUQFOnaqe0jBzscwouGTcePHpytTYIiXMVCWYBVC+K6W6uxa
 v5ULKQLm1hc+NqTIOLHUZ6UlgOY6KsgpxFPRmm22NlWUc8pKNw+KmldxAz8FekIKkfbU
 DMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8YX/gYbNTY3KX8xKiqj1zOKt9kLjkwSiSGb/cEbvHgA=;
 b=ioaflKI65X7ZriSmv0OopJaI57QwO6ldbAaRket+v2rurQeF2RGYf3XM5dkC6zN6mq
 G4/LwQWTRDClBcvxpGqBeWN3kESW71kuTEYqnT2VaPxmTZ8C7tYyDbrjol+GbynfLqGZ
 E+88LFteO+HyzasjJZiZc96YBKYpMaJxXOVAAkzktQFpevCTQ44Dx9szVbEWraqnuXU5
 ejSpEjbOzE/X8FkODa7546gkBcSoaVBap1AEdxlU3ts8XAAoQYAfBvMF8Rt/fr3ADDkC
 kBYSl0P+nG7K/1EGbj30sFKmlaL9tDFNsIGLy+0vMV7A6d+91HEeg6nSRfxymCCHiJQH
 8M4A==
X-Gm-Message-State: AOAM531WW4sIJuxmYdYYbWr6QHGX7sMo3asGZvXf765dV9AJvy+NoHkF
 aCA22kSw+bChNgFTE89va08=
X-Google-Smtp-Source: ABdhPJwKrIvEwDfkl7cSNg9SGMBm3AXQkUqNBdVNTCputjNHKA2IzzjtjteSsHCv62yeEXYj0dHX9A==
X-Received: by 2002:a17:90a:648b:: with SMTP id
 h11mr1654363pjj.221.1604996994454; 
 Tue, 10 Nov 2020 00:29:54 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id s4sm1991577pjp.17.2020.11.10.00.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 00:29:54 -0800 (PST)
Date: Tue, 10 Nov 2020 18:29:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 02/18] powerpc: remove arguments from fault handler
 functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201105143431.1874789-1-npiggin@gmail.com>
 <20201105143431.1874789-3-npiggin@gmail.com>
 <6af9a488-3816-9744-db4b-5a3bceb1f0f0@csgroup.eu>
In-Reply-To: <6af9a488-3816-9744-db4b-5a3bceb1f0f0@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1604996406.ltcjkqarcr.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of November 6, 2020 5:59 pm:
>=20
>=20
> Le 05/11/2020 =C3=A0 15:34, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Make mm fault handlers all just take the pt_regs * argument and load
>> DAR/DSISR from that. Make those that return a value return long.
>>=20
>> This is done to make the function signatures match other handlers, which
>> will help with a future patch to add wrappers. Explicit arguments could
>> be added for performance but that would require more wrapper macro
>> variants.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/asm-prototypes.h |  4 ++--
>>   arch/powerpc/include/asm/bug.h            |  4 ++--
>>   arch/powerpc/kernel/exceptions-64e.S      |  2 --
>>   arch/powerpc/kernel/exceptions-64s.S      | 14 ++------------
>>   arch/powerpc/kernel/head_40x.S            | 10 +++++-----
>>   arch/powerpc/kernel/head_8xx.S            |  6 +++---
>>   arch/powerpc/kernel/head_book3s_32.S      |  6 ++----
>>   arch/powerpc/kernel/head_booke.h          |  4 +---
>>   arch/powerpc/mm/book3s64/hash_utils.c     |  8 +++++---
>>   arch/powerpc/mm/book3s64/slb.c            | 11 +++++++----
>>   arch/powerpc/mm/fault.c                   | 16 +++++++++-------
>>   11 files changed, 38 insertions(+), 47 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/in=
clude/asm/asm-prototypes.h
>> index d0b832cbbec8..22c9d08fa3a4 100644
>> --- a/arch/powerpc/include/asm/asm-prototypes.h
>> +++ b/arch/powerpc/include/asm/asm-prototypes.h
>> @@ -82,8 +82,8 @@ void kernel_bad_stack(struct pt_regs *regs);
>>   void system_reset_exception(struct pt_regs *regs);
>>   void machine_check_exception(struct pt_regs *regs);
>>   void emulation_assist_interrupt(struct pt_regs *regs);
>> -long do_slb_fault(struct pt_regs *regs, unsigned long ea);
>> -void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err)=
;
>> +long do_slb_fault(struct pt_regs *regs);
>> +void do_bad_slb_fault(struct pt_regs *regs);
>>  =20
>>   /* signals, syscalls and interrupts */
>>   long sys_swapcontext(struct ucontext __user *old_ctx,
>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/b=
ug.h
>> index d714d83bbc7c..2fa0cf6c6011 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -111,8 +111,8 @@
>>   #ifndef __ASSEMBLY__
>>  =20
>>   struct pt_regs;
>> -extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long=
);
>> -extern int hash__do_page_fault(struct pt_regs *, unsigned long, unsigne=
d long);
>> +extern long do_page_fault(struct pt_regs *);
>> +extern long hash__do_page_fault(struct pt_regs *);
>=20
> extern is pointless

Thanks. Sorry I'll get it right one day.

>> @@ -191,9 +191,9 @@ _ENTRY(saved_ksp_limit)
>>    */
>>   	START_EXCEPTION(0x0400, InstructionAccess)
>>   	EXCEPTION_PROLOG
>> -	mr	r4,r12			/* Pass SRR0 as arg2 */
>> -	stw	r4, _DEAR(r11)
>> -	li	r5,0			/* Pass zero as arg3 */
>> +	li	r5,0
>> +	stw	r5, _ESR(r11)		/* Zero ESR */
>> +	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */
>=20
> I think we should avoid this, see below
>=20
>> @@ -356,14 +356,14 @@ DataStoreTLBMiss:
>>   	. =3D 0x1300
>>   InstructionTLBError:
>>   	EXCEPTION_PROLOG
>> -	mr	r4,r12
>>   	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
>=20
> Could avoid this, see below
>=20
>>   	andis.	r10,r9,SRR1_ISI_NOPT@h
>>   	beq+	.Litlbie
>> -	tlbie	r4
>> +	tlbie	r12
>>   	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() *=
/
>>   .Litlbie:
>> -	stw	r4, _DAR(r11)
>> +	stw	r12, _DAR(r11)
>> +	stw	r5, _DSISR(r11)
>=20
> And this

>> @@ -369,9 +369,9 @@ BEGIN_MMU_FTR_SECTION
>>   	bl	hash_page
>>   END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
>>   #endif	/* CONFIG_VMAP_STACK */
>> -1:	mr	r4,r12
>>   	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
>> -	stw	r4, _DAR(r11)
>> +	stw	r5, _DSISR(r11)
>> +	stw	r12, _DAR(r11)
>=20
> And this including the andis.
>=20

>> @@ -477,9 +477,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>>   	NORMAL_EXCEPTION_PROLOG(INST_STORAGE);		      \
>>   	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
>>   	stw	r5,_ESR(r11);						      \
>> -	mr      r4,r12;                 /* Pass SRR0 as arg2 */		      \
>> -	stw	r4, _DEAR(r11);						      \
>> -	li      r5,0;                   /* Pass zero as arg3 */		      \
>> +	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
>=20
> And this
>=20

[...]

>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index e65a49f246ef..390a296b16a3 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -549,11 +549,12 @@ static int __do_page_fault(struct pt_regs *regs, u=
nsigned long address,
>>   }
>>   NOKPROBE_SYMBOL(__do_page_fault);
>>  =20
>> -int do_page_fault(struct pt_regs *regs, unsigned long address,
>> -		  unsigned long error_code)
>> +long do_page_fault(struct pt_regs *regs)
>>   {
>>   	enum ctx_state prev_state =3D exception_enter();
>> -	int err;
>> +	unsigned long address =3D regs->dar;
>> +	unsigned long error_code =3D regs->dsisr;
>> +	long err;
>=20
> By doing something more or less like this (need to be tuned for bookE as =
well):
>=20
> +	int is_exec =3D TRAP(regs) =3D=3D 0x400;
> +	unsigned long address =3D is_exec ? regs->ssr0 : regs->dar;
> +	unsigned long error_code =3D is_exec ? (regs->ssr1 & DSISR_SRR1_MATCH_3=
2S) : regs->dsisr;

Ah, I didn't see that you saved these in srr0/1 already. Hmm, not in=20
pt_regs though. thread_struct (VMAP_STACK only)? exception_regs (booke
only)? Doesn't seem so easy.

In general I don't have a problem with some processor specific things
like this in do page_fault though if it speeds things up. If it gets
a bit more complicated then we can have some accsssor function

  get_fault_details(regs, &address, &error_code, &is_exec);

>> @@ -580,11 +581,12 @@ int do_page_fault(struct pt_regs *regs, unsigned l=
ong address,
>>   NOKPROBE_SYMBOL(do_page_fault);
>>  =20
>>   #ifdef CONFIG_PPC_BOOK3S_64
>> -/* Same as do_page_fault but interrupt entry has already run in do_hash=
_fault */
>> -int hash__do_page_fault(struct pt_regs *regs, unsigned long address,
>> -		  unsigned long error_code)
>> +/* Same as do_page_fault but no interrupt entry */
>> +long hash__do_page_fault(struct pt_regs *regs)
>>   {
>> -	int err;
>> +	unsigned long address =3D regs->dar;
>> +	unsigned long error_code =3D regs->dsisr;
>> +	long err;
>>  =20
>>   	err =3D __do_page_fault(regs, address, error_code);
>>   	if (unlikely(err)) {
>>=20
>=20
> There is probably also something we can simplify around get_and_save_dar_=
dsisr_on_stack() macro in=20
> head_32.h, no need to reload DAR, at least for 8xx. Maybe as a followup p=
atch later.

Admittedly my 32-bit knowledge or test environments are not great :(

Thanks,
Nick
