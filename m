Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B82EB43F280
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 00:13:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgKb84lXVz3c4y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 09:13:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=L/mPDwtH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=L/mPDwtH; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgKZQ73hjz2yfn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 09:13:17 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id m26so7307499pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 15:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JY/JyRDyIX2LVwFej2/Bk3hlisTkPZwUj1V2NIryitk=;
 b=L/mPDwtH9beUldT7eJbyxxbplEf+hrQPQxP0W+/2y/pgNGH8zHsr38buofvs78ySIz
 AB0UlqIDx3bM3td/eaqlL3bkNgoO5m7OH4IQCyV+WdPGBDxvF2uEIJ2txttYZCn5XLXW
 1M0Ygk/afTknKc6GxU6sc8OAW1b7PjJ9KYN4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JY/JyRDyIX2LVwFej2/Bk3hlisTkPZwUj1V2NIryitk=;
 b=OBJtWvfj2GDa/fjxA2XhvlWjGkqtVaPGJOItPbmvQ1sLKzVtCSV/WXOBQOyD/URrwy
 MS/ozUGs35bQcznYbaHpkWTTmRqJhH1CrlgNkABMEd32PVC/j3tnuBW3ibIgSbG5r+eG
 IQLQllKq+BPQBWnUu1jNk1dlstB82iekvE1s6VVKXSY7+tkbaiwEA/UFERN4BMoZPGFb
 BOwHtQXDXqM0oNWsEsoOFO40SiQt6jZyStlh93tf4yQHtcDl1qQe1pQ+EFJM0/NrMtMB
 hBN9Su1JChY106TXZnkewlL4b1p/qoQVnQEKdn45G4A8p5HsL6pWc8Prg1AtaCc11nKK
 wVbQ==
X-Gm-Message-State: AOAM531i0JdcivBDhTYpCOgJaMiuqKAkoBHIV5+fccibRFj9dKC0GlbA
 7xY14RmW7+nZ5Nqxg0UHjMKpZA==
X-Google-Smtp-Source: ABdhPJw8dqTeDgguS3A5rbtFFAfXJN/hsg8s/ozO6HA5kbAPT5uPQ9W0CXeH41Dtih/HFKe6GKwhfg==
X-Received: by 2002:a63:1a0e:: with SMTP id a14mr5310626pga.195.1635459193808; 
 Thu, 28 Oct 2021 15:13:13 -0700 (PDT)
Received: from localhost ([2001:4479:e000:e400:d67a:2cc4:2c16:9b6])
 by smtp.gmail.com with ESMTPSA id z22sm4947606pfe.1.2021.10.28.15.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 15:13:13 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/32e: Ignore ESR in instruction storage
 interrupt handler
In-Reply-To: <20211028133043.4159501-1-npiggin@gmail.com>
References: <20211028133043.4159501-1-npiggin@gmail.com>
Date: Fri, 29 Oct 2021 09:13:10 +1100
Message-ID: <87ee84g5mx.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nicholas Piggin <npiggin@gmail.com>,
 Jacques de Laval <jacques.delaval@protonmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> A e5500 machine running a 32-bit kernel sometimes hangs at boot,
> seemingly going into an infinite loop of instruction storage interrupts.
> The ESR SPR has a value of 0x800000 (store) when this happens, which is
> likely set by a previous store. An instruction TLB miss interrupt would
> then leave ESR unchanged, and if no PTE exists it calls directly to the
> instruction storage interrupt handler without changing ESR.

I hadn't heard of the ESR before and your patch just uses the acronym:
apparently it is the Exception Syndrome Register. In ISA 2.07 it's in
Section 7.2.13 of Book III-E. (e5500 implements 2.06 but I assume it's
roughly the same there.)

The ISA says that ESR_ST is set for the following types of exception:
 - Alignment
 - Data Storage
 - Data TLB
 - LRAT Error

So it makes sense to assume that it was not set by the instruction
storage exception. (I see you have a discussion as to how that might
occur in
https://lore.kernel.org/linuxppc-dev/1635413197.83rhc4s3fc.astroid@bobo.none/#t
and you concluded that in the comment you add that we arrive here via
the TLB handler jumping to the ISI.)

> access_error() does not cause a segfault due to a store to a read-only
> vma because is_exec is true. Most subsequent fault handling does not
> check for a write fault on a read-only vma, and might do strange things
> like create a writeable PTE or call page_mkwrite on a read only vma or
> file. It's not clear what happens here to cause the infinite faulting in
> this case, a fault handler failure or low level PTE or TLB handling.

I'm just trying to unpick this:

 - INSTRUCTION_STORAGE_EXCEPTION ends up branching to do_page_fault ->
   __do_page_fault -> ___do_page_fault

 - ___do_page_fault has is_exec = true because the exception is a
   instruction storage interrupt

 - ___do_page_fault also decides that is_write = true because the
   ESR_DST bit is set.

This puts us in a bad position because we're taking some information
from the current exception and some information from a previous
exception, so it makes sense that things would go wrong from here!

> In any case this can be fixed by having the instruction storage
> interrupt zero regs->dsisr rather than storing the ESR value to it.

Is it valid to just ignore the contents of ESR for an Instruction
Storage exception?

The 2.07 ISA at least says that the following ESR bits can be set by an
Instruction Storage exception:
 - Byte Ordering
 - TLB Inelligible
 - Page Table

It sounds from

> + * In any case, do_page_fault for BOOK3E does not use ESR and always expects
> + * dsisr to be 0. ESR_DST from a prior store in particular would confuse fault
> + * handling.

that we don't actually ever check any of those three bits in the
do_page_fault path. reg_booke.h defines ESR_BO but the definition is
never used, and there is no ESR_TLBI or ESR_PT constant defined.

So much as it seems a bit dodgy to me, I guess it is right to say that
we're not changing behaviour by setting dsisr to 0 and just ignoring
those 3 bits? Should we document that in the comment?

I probably would have masked ESR_DST but I guess extra bit-twiddling in
an interrupt path when zeroing would do is probably not worth it for
theoretical correctness?

Kind regards,
Daniel

> Link: https://lore.kernel.org/linuxppc-dev/1635306738.0z8wt7619v.astroid@bobo.none/
> Fixes: a01a3f2ddbcd ("powerpc: remove arguments from fault handler functions")
> Reported-by: Jacques de Laval <jacques.delaval@protonmail.com>
> Tested-by: Jacques de Laval <jacques.delaval@protonmail.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/head_booke.h | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
> index e5503420b6c6..ef8d1b1c234e 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -465,12 +465,21 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
>  	bl	do_page_fault;						      \
>  	b	interrupt_return
>  
> +/*
> + * Instruction TLB Error interrupt handlers may call InstructionStorage
> + * directly without clearing ESR, so the ESR at this point may be left over
> + * from a prior interrupt.
> + *
> + * In any case, do_page_fault for BOOK3E does not use ESR and always expects
> + * dsisr to be 0. ESR_DST from a prior store in particular would confuse fault
> + * handling.
> + */
>  #define INSTRUCTION_STORAGE_EXCEPTION					      \
>  	START_EXCEPTION(InstructionStorage)				      \
> -	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);		      \
> -	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
> +	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);			      \
> +	li	r5,0;			/* Store 0 in regs->esr (dsisr) */    \
>  	stw	r5,_ESR(r11);						      \
> -	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
> +	stw	r12, _DEAR(r11);	/* Set regs->dear (dar) to SRR0 */    \
>  	prepare_transfer_to_handler;					      \
>  	bl	do_page_fault;						      \
>  	b	interrupt_return
> -- 
> 2.23.0
