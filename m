Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085543F425
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 02:50:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgP4D2TVDz3cB1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 11:50:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hlExK7Sk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hlExK7Sk; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgP3T183dz2xY8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 11:50:10 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id t184so7672006pfd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 17:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=YcTlktrHZZvc93KaveXciZr5vaAWtDKdLxI2bbAFlRQ=;
 b=hlExK7SkVxXGzZUfQjTFlkwZ8uiy4Zpyc5bbOcPnduypx85mwZi0QAcPBFXYIEq7Z0
 /FRpPmiLE3xtqHSXKHc9B8TOy424mi83lVoEN0OofLxnv+1PLOfb4H8zjZ/g5ZvUcSHd
 MYDUurNN4VRxNPvv3UlJd98wnskVhok1mGmt/Ccyyh2uLLsx84M3rH+Cagz6xnLsLBlP
 he7eEzPFsALPMIv86a7QQ2+lv5D+YevjTfE3iXEkPtteZun8ryIVpO8VG+O+hUAbjsma
 MrihY/WT2UEBchsyhyQZiHGnbC9GFgX18aAv4Dk/0F9jXB5hzJLC5bi/HN6EmfRk4Ywo
 X5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=YcTlktrHZZvc93KaveXciZr5vaAWtDKdLxI2bbAFlRQ=;
 b=yXotMC0dU9ocqRz2wJY8QU9mj/Ipam6qnidAJKnBjzbAX4th9omeHxmVCXIutxD5JF
 PlYanbUnoAVzD2ZgiNLoT7FPjWq3uuiBm+2gHnzfSNI4y1GVTEwQKH9FGEYSewvVYIkv
 E+SCSBTiH/UPTlu2CIkrRmL3XJ74BEBdzTuYZrJHToK/muXOnq0gul2JI9KFdHVwaL5o
 tOZHhDQknqBQCW6CpDAZYzEYfyZMYc/3KiXEbd3/GxqFR7kM/3oSEIWorFXH4pbn5rxp
 xvCD8cLzrBU8+kRdGIudUmp9+AYtTonglc5gO8+Xu1cbZk3MqB460SAxy7GsntPwqNLU
 5pJg==
X-Gm-Message-State: AOAM533dTAzAUwNxyzV3FdKUm3QeXGjKfnCO2n6+SihcMRGoZHa38hFk
 rlQUJ6YvOQAtVhTHl0KXmzMAIls+ums=
X-Google-Smtp-Source: ABdhPJxEhL1mi0X35+VbQJqg5n9VL7ATy6g3P+F7ld1ceW37p0qLtN2/xg61a7AlKdp1VvxTHe7K3w==
X-Received: by 2002:a63:914a:: with SMTP id l71mr5818760pge.444.1635468607817; 
 Thu, 28 Oct 2021 17:50:07 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id x26sm4560867pff.25.2021.10.28.17.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 17:50:07 -0700 (PDT)
Date: Fri, 29 Oct 2021 10:50:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/32e: Ignore ESR in instruction storage interrupt
 handler
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20211028133043.4159501-1-npiggin@gmail.com>
 <87ee84g5mx.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87ee84g5mx.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Message-Id: <1635468192.xjpwhrgv66.astroid@bobo.none>
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
Cc: Jacques de Laval <jacques.delaval@protonmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Daniel Axtens's message of October 29, 2021 8:13 am:
> Hi Nick,
>=20
>> A e5500 machine running a 32-bit kernel sometimes hangs at boot,
>> seemingly going into an infinite loop of instruction storage interrupts.
>> The ESR SPR has a value of 0x800000 (store) when this happens, which is
>> likely set by a previous store. An instruction TLB miss interrupt would
>> then leave ESR unchanged, and if no PTE exists it calls directly to the
>> instruction storage interrupt handler without changing ESR.
>=20
> I hadn't heard of the ESR before and your patch just uses the acronym:
> apparently it is the Exception Syndrome Register. In ISA 2.07 it's in
> Section 7.2.13 of Book III-E. (e5500 implements 2.06 but I assume it's
> roughly the same there.)
>=20
> The ISA says that ESR_ST is set for the following types of exception:
>  - Alignment
>  - Data Storage
>  - Data TLB
>  - LRAT Error
>=20
> So it makes sense to assume that it was not set by the instruction
> storage exception. (I see you have a discussion as to how that might
> occur in
> https://lore.kernel.org/linuxppc-dev/1635413197.83rhc4s3fc.astroid@bobo.n=
one/#t
> and you concluded that in the comment you add that we arrive here via
> the TLB handler jumping to the ISI.)

I think that's most likely. I don't know book E arch very well, *maybe*=20
you could have an ISI which does not change ESR without violating the
letter of the architecture, but not sure. Either way, this fix should=20
take care of both.

>=20
>> access_error() does not cause a segfault due to a store to a read-only
>> vma because is_exec is true. Most subsequent fault handling does not
>> check for a write fault on a read-only vma, and might do strange things
>> like create a writeable PTE or call page_mkwrite on a read only vma or
>> file. It's not clear what happens here to cause the infinite faulting in
>> this case, a fault handler failure or low level PTE or TLB handling.
>=20
> I'm just trying to unpick this:
>=20
>  - INSTRUCTION_STORAGE_EXCEPTION ends up branching to do_page_fault ->
>    __do_page_fault -> ___do_page_fault
>=20
>  - ___do_page_fault has is_exec =3D true because the exception is a
>    instruction storage interrupt
>=20
>  - ___do_page_fault also decides that is_write =3D true because the
>    ESR_DST bit is set.
>=20
> This puts us in a bad position because we're taking some information
> from the current exception and some information from a previous
> exception, so it makes sense that things would go wrong from here!

Yeah, we miss the store into read-only vma check because is_exec which=20
causes us to go into write path of the core handle_mm_fault. Although=20
even if we caught it and segfaulted obviously that's still not the right=20
thing to do.

>=20
>> In any case this can be fixed by having the instruction storage
>> interrupt zero regs->dsisr rather than storing the ESR value to it.
>=20
> Is it valid to just ignore the contents of ESR for an Instruction
> Storage exception?
>=20
> The 2.07 ISA at least says that the following ESR bits can be set by an
> Instruction Storage exception:
>  - Byte Ordering
>  - TLB Inelligible
>  - Page Table
>=20
> It sounds from
>=20
>> + * In any case, do_page_fault for BOOK3E does not use ESR and always ex=
pects
>> + * dsisr to be 0. ESR_DST from a prior store in particular would confus=
e fault
>> + * handling.
>=20
> that we don't actually ever check any of those three bits in the
> do_page_fault path. reg_booke.h defines ESR_BO but the definition is
> never used, and there is no ESR_TLBI or ESR_PT constant defined.

Yeah that's right. I don't quite know what we would do with the other
exception types. Possibly just check them in page_fault_is_bad and cause=20
a sigbus. Maybe there is some low level fixup that would be possible.
But nothing is implemented.

> So much as it seems a bit dodgy to me, I guess it is right to say that
> we're not changing behaviour by setting dsisr to 0 and just ignoring
> those 3 bits? Should we document that in the comment?

The comment does say do_page_fault expects it to be 0. Did you have more=20
in mind? I can tweak the comment.

> I probably would have masked ESR_DST but I guess extra bit-twiddling in
> an interrupt path when zeroing would do is probably not worth it for
> theoretical correctness?

Well the ESR is completely un-set so none of the bits make sense at this
point. Reading it is jsut overhead.

If we wanted to do it really "cleanly", the TLB error interrupt handler
might set ESR before calling here, or it might call a few instructions
later with the register already set to a sane ESR value. But that would
really only matter if do_page_fault started doing anything useful with
the other bits.

Thanks,
Nick

>=20
> Kind regards,
> Daniel
>=20
>> Link: https://lore.kernel.org/linuxppc-dev/1635306738.0z8wt7619v.astroid=
@bobo.none/
>> Fixes: a01a3f2ddbcd ("powerpc: remove arguments from fault handler funct=
ions")
>> Reported-by: Jacques de Laval <jacques.delaval@protonmail.com>
>> Tested-by: Jacques de Laval <jacques.delaval@protonmail.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kernel/head_booke.h | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head=
_booke.h
>> index e5503420b6c6..ef8d1b1c234e 100644
>> --- a/arch/powerpc/kernel/head_booke.h
>> +++ b/arch/powerpc/kernel/head_booke.h
>> @@ -465,12 +465,21 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>>  	bl	do_page_fault;						      \
>>  	b	interrupt_return
>> =20
>> +/*
>> + * Instruction TLB Error interrupt handlers may call InstructionStorage
>> + * directly without clearing ESR, so the ESR at this point may be left =
over
>> + * from a prior interrupt.
>> + *
>> + * In any case, do_page_fault for BOOK3E does not use ESR and always ex=
pects
>> + * dsisr to be 0. ESR_DST from a prior store in particular would confus=
e fault
>> + * handling.
>> + */
>>  #define INSTRUCTION_STORAGE_EXCEPTION					      \
>>  	START_EXCEPTION(InstructionStorage)				      \
>> -	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);		      \
>> -	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
>> +	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);			      \
>> +	li	r5,0;			/* Store 0 in regs->esr (dsisr) */    \
>>  	stw	r5,_ESR(r11);						      \
>> -	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
>> +	stw	r12, _DEAR(r11);	/* Set regs->dear (dar) to SRR0 */    \
>>  	prepare_transfer_to_handler;					      \
>>  	bl	do_page_fault;						      \
>>  	b	interrupt_return
>> --=20
>> 2.23.0
>=20
