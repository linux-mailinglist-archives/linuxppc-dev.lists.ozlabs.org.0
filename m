Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 740522B3B3A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 02:53:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZBtz3KQrzDqNN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 12:53:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=t2sc22YY; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZBsF5WdMzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 12:52:13 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id s2so7537390plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Nov 2020 17:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=BNbpX8Q+lmX6NKawFQ8OdU5kruf3iKi2fTCnzNtROZc=;
 b=t2sc22YY0x9+Q0m/7rtWbCioDEMRVXoL5bQjqHn+CTmHMlSmNiGtzm0GsK6HZ7HFU9
 ZWvQX6qsZBgtmGbwgQPwrPIB9ThIIBY/Lbjeh5BK1KFek/PX/XrOKOUlBbWJ2Ao1h9fh
 BOsipDnRHO/iHcurS1kQga6ZeXUcw7b4H06fFvxH/cm6Amj1CDVIos/SzBZRQdZ38jdE
 GTvuSSTuuEkVaUQRaOvKWk5Mqfzp/ORrzZmUeshMhmupXz2+kAv+IkIwIcz7qMT8Gw8F
 06YiER6AG17Z3E9t49P8Ny/cqhnQug+TEacHoYVFWhyK3h7OR8YcYSXw9pGpDIsQ3pph
 LoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=BNbpX8Q+lmX6NKawFQ8OdU5kruf3iKi2fTCnzNtROZc=;
 b=es4FASh0NM04hQq6rW44tdjrmEMWx5pfXRGa9JnZfDGqGWixjLaFPyxFNQxwdYWW+b
 lpbU+8O29agCwkvg+jWpLrNK/jbFADpQuQJj5PW9KcujAPcF8tigjWaE1mS/NEwdCaRO
 eyKZbyP//srLc+7CuTfhm0mWgXo4Y5ipTGNqVhFvG4sciWIxv2HiI7Uagypo7RQzK0Ci
 0Wx3IV0PoCTB+KwaekWuVaGSXmjwNgYJmF8IwtTyAPG0cAYgjMMuxUDFihFHVoo7+FYH
 2PkiRCeCe9wNyW9NeZlDLd3QUUOBPZ5JC6UUigCaFmJPQWMji3kXKSIqARqjky9qysZZ
 JZ6Q==
X-Gm-Message-State: AOAM530CWUkMQz+dEV63MHsb8JItQzJ1ed2kltt97hS2MarCAR4D9B/S
 qGIdF5a3kcL3qRAOHqnGwlDPYYD2Gjo=
X-Google-Smtp-Source: ABdhPJzk/w4fVhUpohh27dSWjgO+F779QIS7EMbnuH3mbQfNrk4IXrgkpRvtOKJ8m3ILLAbYHytApw==
X-Received: by 2002:a17:902:7c12:b029:d6:ed57:fe13 with SMTP id
 x18-20020a1709027c12b02900d6ed57fe13mr10996731pll.59.1605491531964; 
 Sun, 15 Nov 2020 17:52:11 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id e31sm1698860pgb.16.2020.11.15.17.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 17:52:11 -0800 (PST)
Date: Mon, 16 Nov 2020 11:52:05 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 03/19] powerpc: bad_page_fault, do_break get registers
 from regs
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20201111094410.3038123-1-npiggin@gmail.com>
 <20201111094410.3038123-4-npiggin@gmail.com>
 <20201114200700.Horde.mC7ctDwjEwuYYJJgK2pO9A4@messagerie.c-s.fr>
In-Reply-To: <20201114200700.Horde.mC7ctDwjEwuYYJJgK2pO9A4@messagerie.c-s.fr>
MIME-Version: 1.0
Message-Id: <1605491401.ebhditq8qp.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 15, 2020 5:07 am:
> Hi,
>=20
> Quoting Nicholas Piggin <npiggin@gmail.com>:
>=20
>> This also moves the 32s DABR match to C.
>=20
> I'm still not happy with that. What about the following instead ?

This seems quite clean. I'll pull it into the series and see how it looks.

Thanks,
Nick

>=20
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index 8cdc8bcde703..6253c4acb46d 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -657,10 +657,6 @@ ppc_swapcontext:
>   	.globl	handle_page_fault
>   handle_page_fault:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -#ifdef CONFIG_PPC_BOOK3S_32
> -	andis.  r0,r5,DSISR_DABRMATCH@h
> -	bne-    handle_dabr_fault
> -#endif
>   	bl	do_page_fault
>   	cmpwi	r3,0
>   	beq+	ret_from_except
> @@ -674,17 +670,6 @@ handle_page_fault:
>   	bl	bad_page_fault
>   	b	ret_from_except_full
>=20
> -#ifdef CONFIG_PPC_BOOK3S_32
> -	/* We have a data breakpoint exception - handle it */
> -handle_dabr_fault:
> -	SAVE_NVGPRS(r1)
> -	lwz	r0,_TRAP(r1)
> -	clrrwi	r0,r0,1
> -	stw	r0,_TRAP(r1)
> -	bl      do_break
> -	b	ret_from_except_full
> -#endif
> -
>   /*
>    * This routine switches between two different tasks.  The process
>    * state of one is saved on its kernel stack.  Then the state
> diff --git a/arch/powerpc/kernel/head_book3s_32.S =20
> b/arch/powerpc/kernel/head_book3s_32.S
> index 9381aa867591..5cc71482b35f 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -684,7 +684,10 @@ handle_page_fault_tramp_1:
>   	lwz	r5, _DSISR(r11)
>   	/* fall through */
>   handle_page_fault_tramp_2:
> +	andis.  r0, r5, DSISR_DABRMATCH@h
> +	bne-	1f
>   	EXC_XFER_LITE(0x300, handle_page_fault)
> +1:	EXC_XFER_STD(0x300, do_break)
>=20
>   #ifdef CONFIG_VMAP_STACK
>   .macro save_regs_thread		thread
> ---
> Christophe
>=20
>>
>> Similar to the previous patch this makes interrupt handler function
>> types more regular so they can be wrapped with the next patch.
>>
>> bad_page_fault and do_break are not performance critical.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/bug.h             |  2 +-
>>  arch/powerpc/include/asm/debug.h           |  3 +--
>>  arch/powerpc/kernel/entry_32.S             | 14 ++++----------
>>  arch/powerpc/kernel/exceptions-64e.S       |  3 +--
>>  arch/powerpc/kernel/exceptions-64s.S       |  3 +--
>>  arch/powerpc/kernel/head_8xx.S             |  5 ++---
>>  arch/powerpc/kernel/process.c              |  7 +++----
>>  arch/powerpc/kernel/traps.c                |  2 +-
>>  arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
>>  arch/powerpc/mm/book3s64/slb.c             |  2 +-
>>  arch/powerpc/mm/fault.c                    | 14 +++++++-------
>>  arch/powerpc/platforms/8xx/machine_check.c |  2 +-
>>  12 files changed, 25 insertions(+), 36 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/b=
ug.h
>> index 897bad6b6bbb..49162faba33f 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -113,7 +113,7 @@
>>  struct pt_regs;
>>  long do_page_fault(struct pt_regs *);
>>  long hash__do_page_fault(struct pt_regs *);
>> -extern void bad_page_fault(struct pt_regs *, unsigned long, int);
>> +void bad_page_fault(struct pt_regs *, int);
>>  extern void _exception(int, struct pt_regs *, int, unsigned long);
>>  extern void _exception_pkey(struct pt_regs *, unsigned long, int);
>>  extern void die(const char *, struct pt_regs *, long);
>> diff --git a/arch/powerpc/include/asm/debug.h =20
>> b/arch/powerpc/include/asm/debug.h
>> index ec57daf87f40..0550eceab3ca 100644
>> --- a/arch/powerpc/include/asm/debug.h
>> +++ b/arch/powerpc/include/asm/debug.h
>> @@ -52,8 +52,7 @@ extern void do_send_trap(struct pt_regs *regs, =20
>> unsigned long address,
>>  			 unsigned long error_code, int brkpt);
>>  #else
>>
>> -extern void do_break(struct pt_regs *regs, unsigned long address,
>> -		     unsigned long error_code);
>> +void do_break(struct pt_regs *regs);
>>  #endif
>>
>>  #endif /* _ASM_POWERPC_DEBUG_H */
>> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_=
32.S
>> index 8cdc8bcde703..eb97df234a0c 100644
>> --- a/arch/powerpc/kernel/entry_32.S
>> +++ b/arch/powerpc/kernel/entry_32.S
>> @@ -657,10 +657,6 @@ ppc_swapcontext:
>>  	.globl	handle_page_fault
>>  handle_page_fault:
>>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>> -#ifdef CONFIG_PPC_BOOK3S_32
>> -	andis.  r0,r5,DSISR_DABRMATCH@h
>> -	bne-    handle_dabr_fault
>> -#endif
>>  	bl	do_page_fault
>>  	cmpwi	r3,0
>>  	beq+	ret_from_except
>> @@ -668,19 +664,17 @@ handle_page_fault:
>>  	lwz	r0,_TRAP(r1)
>>  	clrrwi	r0,r0,1
>>  	stw	r0,_TRAP(r1)
>> -	mr	r5,r3
>> +	mr	r4,r3		/* err arg for bad_page_fault */
>>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>> -	lwz	r4,_DAR(r1)
>> +#ifdef CONFIG_PPC_BOOK3S_32
>> +	blt	handle_dabr_fault
>> +#endif
>>  	bl	bad_page_fault
>>  	b	ret_from_except_full
>>
>>  #ifdef CONFIG_PPC_BOOK3S_32
>>  	/* We have a data breakpoint exception - handle it */
>>  handle_dabr_fault:
>> -	SAVE_NVGPRS(r1)
>> -	lwz	r0,_TRAP(r1)
>> -	clrrwi	r0,r0,1
>> -	stw	r0,_TRAP(r1)
>>  	bl      do_break
>>  	b	ret_from_except_full
>>  #endif
>> diff --git a/arch/powerpc/kernel/exceptions-64e.S =20
>> b/arch/powerpc/kernel/exceptions-64e.S
>> index 25fa7d5a643c..dc728bb1c89a 100644
>> --- a/arch/powerpc/kernel/exceptions-64e.S
>> +++ b/arch/powerpc/kernel/exceptions-64e.S
>> @@ -1018,9 +1018,8 @@ storage_fault_common:
>>  	bne-	1f
>>  	b	ret_from_except_lite
>>  1:	bl	save_nvgprs
>> -	mr	r5,r3
>> +	mr	r4,r3
>>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>> -	ld	r4,_DAR(r1)
>>  	bl	bad_page_fault
>>  	b	ret_from_except
>>
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S =20
>> b/arch/powerpc/kernel/exceptions-64s.S
>> index 1f34cfd1887c..e6558c4d3f81 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -2135,8 +2135,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
>>  	GEN_COMMON h_data_storage
>>  	addi    r3,r1,STACK_FRAME_OVERHEAD
>>  BEGIN_MMU_FTR_SECTION
>> -	ld	r4,_DAR(r1)
>> -	li	r5,SIGSEGV
>> +	li	r4,SIGSEGV
>>  	bl      bad_page_fault
>>  MMU_FTR_SECTION_ELSE
>>  	bl      unknown_exception
>> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8=
xx.S
>> index 0cd95b633e2b..13eda7154695 100644
>> --- a/arch/powerpc/kernel/head_8xx.S
>> +++ b/arch/powerpc/kernel/head_8xx.S
>> @@ -408,10 +408,9 @@ do_databreakpoint:
>>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>>  	mfspr	r4,SPRN_BAR
>>  	stw	r4,_DAR(r11)
>> -#ifdef CONFIG_VMAP_STACK
>> -	lwz	r5,_DSISR(r11)
>> -#else
>> +#ifndef CONFIG_VMAP_STACK
>>  	mfspr	r5,SPRN_DSISR
>> +	stw	r5,_DSISR(r11)
>>  #endif
>>  	EXC_XFER_STD(0x1c00, do_break)
>>
>> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process=
.c
>> index d421a2c7f822..0bdd3ed653df 100644
>> --- a/arch/powerpc/kernel/process.c
>> +++ b/arch/powerpc/kernel/process.c
>> @@ -660,11 +660,10 @@ static void do_break_handler(struct pt_regs *regs)
>>  	}
>>  }
>>
>> -void do_break (struct pt_regs *regs, unsigned long address,
>> -		    unsigned long error_code)
>> +void do_break(struct pt_regs *regs)
>>  {
>>  	current->thread.trap_nr =3D TRAP_HWBKPT;
>> -	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, error_code,
>> +	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, regs->dsisr,
>>  			11, SIGSEGV) =3D=3D NOTIFY_STOP)
>>  		return;
>>
>> @@ -682,7 +681,7 @@ void do_break (struct pt_regs *regs, unsigned =20
>> long address,
>>  		do_break_handler(regs);
>>
>>  	/* Deliver the signal to userspace */
>> -	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
>> +	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)regs->dar);
>>  }
>>  #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
>>
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index 5006dcbe1d9f..902fcbd1a778 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>> @@ -1641,7 +1641,7 @@ void alignment_exception(struct pt_regs *regs)
>>  	if (user_mode(regs))
>>  		_exception(sig, regs, code, regs->dar);
>>  	else
>> -		bad_page_fault(regs, regs->dar, sig);
>> +		bad_page_fault(regs, sig);
>>
>>  bail:
>>  	exception_exit(prev_state);
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c =20
>> b/arch/powerpc/mm/book3s64/hash_utils.c
>> index 0f0bd4af4b2d..731518e7d56f 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -1537,7 +1537,7 @@ long do_hash_fault(struct pt_regs *regs)
>>  	 * the access, or panic if there isn't a handler.
>>  	 */
>>  	if (unlikely(in_nmi())) {
>> -		bad_page_fault(regs, ea, SIGSEGV);
>> +		bad_page_fault(regs, SIGSEGV);
>>  		return 0;
>>  	}
>>
>> @@ -1576,7 +1576,7 @@ long do_hash_fault(struct pt_regs *regs)
>>  			else
>>  				_exception(SIGBUS, regs, BUS_ADRERR, ea);
>>  		} else {
>> -			bad_page_fault(regs, ea, SIGBUS);
>> +			bad_page_fault(regs, SIGBUS);
>>  		}
>>  		err =3D 0;
>>
>> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/s=
lb.c
>> index cc34d50874c1..ae89ad516247 100644
>> --- a/arch/powerpc/mm/book3s64/slb.c
>> +++ b/arch/powerpc/mm/book3s64/slb.c
>> @@ -898,7 +898,7 @@ void do_bad_slb_fault(struct pt_regs *regs)
>>  		if (user_mode(regs))
>>  			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>>  		else
>> -			bad_page_fault(regs, regs->dar, SIGSEGV);
>> +			bad_page_fault(regs, SIGSEGV);
>>  	} else if (err =3D=3D -EINVAL) {
>>  		unrecoverable_exception(regs);
>>  	} else {
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index 390a296b16a3..db73b373e76c 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -375,7 +375,7 @@ static void sanity_check_fault(bool is_write, =20
>> bool is_user,
>>  #elif defined(CONFIG_PPC_BOOK3E_64)
>>  #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
>>  #else
>> -#define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
>> +#define page_fault_is_bad(__err)	((__err) & (DSISR_BAD_FAULT_32S | =20
>> DSISR_DABRMATCH))
>>  #endif
>>  #endif
>>
>> @@ -408,7 +408,7 @@ static int __do_page_fault(struct pt_regs *regs, =20
>> unsigned long address,
>>  		return 0;
>>
>>  	if (unlikely(page_fault_is_bad(error_code))) {
>> -		if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && (error_code & DSISR_DABRMATCH=
))
>> +		if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (error_code & DSISR_DABRMATCH))
>>  			return -1;
>>
>>  		if (is_user) {
>> @@ -562,14 +562,14 @@ long do_page_fault(struct pt_regs *regs)
>>  	/* 32 and 64e handle errors in their asm code */
>>  	if (unlikely(err)) {
>>  		if (err > 0) {
>> -			bad_page_fault(regs, address, err);
>> +			bad_page_fault(regs, err);
>>  			err =3D 0;
>>  		} else {
>>  			/*
>>  			 * do_break() may change NV GPRS while handling the
>>  			 * breakpoint. Return -ve to caller to do that.
>>  			 */
>> -			do_break(regs, address, error_code);
>> +			do_break(regs);
>>  		}
>>  	}
>>  #endif
>> @@ -591,14 +591,14 @@ long hash__do_page_fault(struct pt_regs *regs)
>>  	err =3D __do_page_fault(regs, address, error_code);
>>  	if (unlikely(err)) {
>>  		if (err > 0) {
>> -			bad_page_fault(regs, address, err);
>> +			bad_page_fault(regs, err);
>>  			err =3D 0;
>>  		} else {
>>  			/*
>>  			 * do_break() may change NV GPRS while handling the
>>  			 * breakpoint. Return -ve to caller to do that.
>>  			 */
>> -			do_break(regs, address, error_code);
>> +			do_break(regs);
>>  		}
>>  	}
>>
>> @@ -612,7 +612,7 @@ NOKPROBE_SYMBOL(hash__do_page_fault);
>>   * It is called from the DSI and ISI handlers in head.S and from some
>>   * of the procedures in traps.c.
>>   */
>> -void bad_page_fault(struct pt_regs *regs, unsigned long address, int si=
g)
>> +void bad_page_fault(struct pt_regs *regs, int sig)
>>  {
>>  	const struct exception_table_entry *entry;
>>  	int is_write =3D page_fault_is_write(regs->dsisr);
>> diff --git a/arch/powerpc/platforms/8xx/machine_check.c =20
>> b/arch/powerpc/platforms/8xx/machine_check.c
>> index 88dedf38eccd..656365975895 100644
>> --- a/arch/powerpc/platforms/8xx/machine_check.c
>> +++ b/arch/powerpc/platforms/8xx/machine_check.c
>> @@ -26,7 +26,7 @@ int machine_check_8xx(struct pt_regs *regs)
>>  	 * to deal with that than having a wart in the mcheck handler.
>>  	 * -- BenH
>>  	 */
>> -	bad_page_fault(regs, regs->dar, SIGBUS);
>> +	bad_page_fault(regs, SIGBUS);
>>  	return 1;
>>  #else
>>  	return 0;
>> --
>> 2.23.0
>=20
>=20
>=20
