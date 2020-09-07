Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0146E25F23F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 06:04:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlF5z5yknzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 14:04:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j9RowUrL; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlF4D63NNzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 14:02:51 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id b16so6024395pjp.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 06 Sep 2020 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Kc9NA+nC6CcqwdV4Yo7oAOJpDnp4wUXaXcV2Zn/ZSVA=;
 b=j9RowUrLKOqjsuexQnTT5JxuXgpuue25FsIvba7irbM2cDh7yg2eJdCNfPYErbLBmQ
 rTYwJVodw66wmbexZt5/2kE29NTi+eQLoWm0yvwZn04PeJO8xYuspFCg/zB9tFUUUocN
 0qI27SUjq/LhB7tdSwMbAp2SfwMarcZcRQNsVLfgTNx1v/KaJh1st1sFsMgSkGj8LMUy
 nIdXucmO5jmaViG4+zUsKC25S8zh9NWBnKkTOUiAWfBGIjDMGilSf6IfaRSJ1f/M7BNu
 dlp0bWj+Vm7nJHvSGYHmGUYCRhsJHjm9M8SPUM+g7EC5JlX5sKn+uzJ+ilY13LZOoI9Q
 JXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Kc9NA+nC6CcqwdV4Yo7oAOJpDnp4wUXaXcV2Zn/ZSVA=;
 b=eZnLmh6DcS7z7B46Ngt2ZcR+5s4G9OqdVQpBrZynCnTYpnIC34B8Mg6tm6Rp1mIkRZ
 QwxhZav/Ikjg3FfBz+UO1SWZCLMmvAo0j238ZZw1D7N7vtGr8g/o0AlERqtM72kq+7Z8
 J9jLvmujXX0asl5lAI92fuQRI3ga2uNMhkc+jLs+x+uKOae4Gvqf65t0HZ6R51cH8Otq
 Fbs2UqFsNgcxLed4zoEz6GbVAyARQvgfL2EMHmH/lRfvLkBczcJbZ58g+I1B9pDMEi7k
 vwHdkwJHCz4Vzai0SftuhTod1h3tej+l15eJ8F041reQgMOMJrU5gJ/LU8mOl1w/9Pvk
 YgZw==
X-Gm-Message-State: AOAM5335sAprZSqXQKcbxy2ViiUoZWTHkSNHWXM3/tK7xie1rf6nPcxc
 nDx3SrnhwgvcHgtu/YkxoIIiq/R0Hzc=
X-Google-Smtp-Source: ABdhPJxFAXxJd+BM35nZtR9pfaByiLVgzou+cKhg7LFkBj5pI4DXmOykKxIY1EhsPI6hxx2c5LXiVw==
X-Received: by 2002:a17:902:9347:: with SMTP id
 g7mr18273990plp.200.1599451368353; 
 Sun, 06 Sep 2020 21:02:48 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id e27sm7251969pfj.62.2020.09.06.21.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 21:02:47 -0700 (PDT)
Date: Mon, 07 Sep 2020 14:02:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 12/12] powerpc/64s: power4 nap fixup in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-13-npiggin@gmail.com>
 <53f5fa9b-03d4-150e-199b-7ffa75d91666@csgroup.eu>
In-Reply-To: <53f5fa9b-03d4-150e-199b-7ffa75d91666@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1599450777.weoux16jk2.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of September 6, 2020 5:32 pm:
>=20
>=20
> Le 05/09/2020 =C3=A0 19:43, Nicholas Piggin a =C3=A9crit=C2=A0:
>> There is no need for this to be in asm, use the new intrrupt entry wrapp=
er.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/interrupt.h   | 14 ++++++++
>>   arch/powerpc/include/asm/processor.h   |  1 +
>>   arch/powerpc/include/asm/thread_info.h |  6 ++++
>>   arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
>>   arch/powerpc/kernel/idle_book3s.S      |  4 +++
>>   5 files changed, 25 insertions(+), 45 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index 3ae3d2f93b61..acfcc7d5779b 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -8,6 +8,16 @@
>>   #include <asm/ftrace.h>
>>   #include <asm/runlatch.h>
>>  =20
>> +static inline void nap_adjust_return(struct pt_regs *regs)
>> +{
>> +#ifdef CONFIG_PPC_970_NAP
>=20
> Avoid #ifdef, you can use IS_ENABLED(CONFIG_PPC_970_NAP) in the 'if' belo=
w

Yeah I guess.

>> +	if (test_thread_local_flags(_TLF_NAPPING)) {
>> +		clear_thread_local_flags(_TLF_NAPPING);
>> +		regs->nip =3D (unsigned long)power4_idle_nap_return;
>> +	}
>> +#endif
>> +}
>> +
>>   #ifdef CONFIG_PPC_BOOK3S_64
>>   static inline void interrupt_enter_prepare(struct pt_regs *regs)
>>   {
>> @@ -33,6 +43,8 @@ static inline void interrupt_async_enter_prepare(struc=
t pt_regs *regs)
>>   	if (cpu_has_feature(CPU_FTR_CTRL) &&
>>   	    !test_thread_local_flags(_TLF_RUNLATCH))
>>   		__ppc64_runlatch_on();
>> +
>> +	nap_adjust_return(regs);
>>   }
>>  =20
>>   #else /* CONFIG_PPC_BOOK3S_64 */
>> @@ -72,6 +84,8 @@ static inline void interrupt_nmi_enter_prepare(struct =
pt_regs *regs, struct inte
>>  =20
>>   	this_cpu_set_ftrace_enabled(0);
>>  =20
>> +	nap_adjust_return(regs);
>> +
>>   	nmi_enter();
>>   }
>>  =20
>> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include=
/asm/processor.h
>> index ed0d633ab5aa..3da1dba91386 100644
>> --- a/arch/powerpc/include/asm/processor.h
>> +++ b/arch/powerpc/include/asm/processor.h
>> @@ -424,6 +424,7 @@ extern unsigned long isa300_idle_stop_mayloss(unsign=
ed long psscr_val);
>>   extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
>>   #ifdef CONFIG_PPC_970_NAP
>>   extern void power4_idle_nap(void);
>> +extern void power4_idle_nap_return(void);
>=20
> Please please please, 'extern' keyword is pointless and deprecated for=20
> function prototypes. Don't add new ones.
>=20
> Also, put it outside the #ifdef, so that you can use IS_ENABLED()=20
> instead of #ifdef when using it.

I just copy paste and forget to remove it. I expect someone will do a=20
"cleanup" patch to get rid of them in one go, I find a random assortment
of extern and not extern to be even uglier :(

>>   #endif
>>  =20
>>   extern unsigned long cpuidle_disable;
>> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/inclu=
de/asm/thread_info.h
>> index ca6c97025704..9b15f7edb0cb 100644
>> --- a/arch/powerpc/include/asm/thread_info.h
>> +++ b/arch/powerpc/include/asm/thread_info.h
>> @@ -156,6 +156,12 @@ void arch_setup_new_exec(void);
>>  =20
>>   #ifndef __ASSEMBLY__
>>  =20
>> +static inline void clear_thread_local_flags(unsigned int flags)
>> +{
>> +	struct thread_info *ti =3D current_thread_info();
>> +	ti->local_flags &=3D ~flags;
>> +}
>> +
>>   static inline bool test_thread_local_flags(unsigned int flags)
>>   {
>>   	struct thread_info *ti =3D current_thread_info();
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index 227bad3a586d..1db6b3438c88 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -692,25 +692,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>>   	ld	r1,GPR1(r1)
>>   .endm
>>  =20
>> -/*
>> - * When the idle code in power4_idle puts the CPU into NAP mode,
>> - * it has to do so in a loop, and relies on the external interrupt
>> - * and decrementer interrupt entry code to get it out of the loop.
>> - * It sets the _TLF_NAPPING bit in current_thread_info()->local_flags
>> - * to signal that it is in the loop and needs help to get out.
>> - */
>> -#ifdef CONFIG_PPC_970_NAP
>> -#define FINISH_NAP				\
>> -BEGIN_FTR_SECTION				\
>> -	ld	r11, PACA_THREAD_INFO(r13);	\
>> -	ld	r9,TI_LOCAL_FLAGS(r11);		\
>> -	andi.	r10,r9,_TLF_NAPPING;		\
>> -	bnel	power4_fixup_nap;		\
>> -END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
>> -#else
>> -#define FINISH_NAP
>> -#endif
>> -
>>   /*
>>    * There are a few constraints to be concerned with.
>>    * - Real mode exceptions code/data must be located at their physical =
location.
>> @@ -1250,7 +1231,6 @@ EXC_COMMON_BEGIN(machine_check_common)
>>   	 */
>>   	GEN_COMMON machine_check
>>  =20
>> -	FINISH_NAP
>>   	/* Enable MSR_RI when finished with PACA_EXMC */
>>   	li	r10,MSR_RI
>>   	mtmsrd 	r10,1
>> @@ -1572,7 +1552,6 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
>>   EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
>>   EXC_COMMON_BEGIN(hardware_interrupt_common)
>>   	GEN_COMMON hardware_interrupt
>> -	FINISH_NAP
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   	bl	do_IRQ
>>   	b	interrupt_return
>> @@ -1757,7 +1736,6 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
>>   EXC_VIRT_END(decrementer, 0x4900, 0x80)
>>   EXC_COMMON_BEGIN(decrementer_common)
>>   	GEN_COMMON decrementer
>> -	FINISH_NAP
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   	bl	timer_interrupt
>>   	b	interrupt_return
>> @@ -1842,7 +1820,6 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
>>   EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
>>   EXC_COMMON_BEGIN(doorbell_super_common)
>>   	GEN_COMMON doorbell_super
>> -	FINISH_NAP
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   #ifdef CONFIG_PPC_DOORBELL
>>   	bl	doorbell_exception
>> @@ -2196,7 +2173,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
>>  =20
>>   EXC_COMMON_BEGIN(hmi_exception_common)
>>   	GEN_COMMON hmi_exception
>> -	FINISH_NAP
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   	bl	handle_hmi_exception
>>   	b	interrupt_return
>> @@ -2225,7 +2201,6 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
>>   EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
>>   EXC_COMMON_BEGIN(h_doorbell_common)
>>   	GEN_COMMON h_doorbell
>> -	FINISH_NAP
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   #ifdef CONFIG_PPC_DOORBELL
>>   	bl	doorbell_exception
>> @@ -2258,7 +2233,6 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
>>   EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
>>   EXC_COMMON_BEGIN(h_virt_irq_common)
>>   	GEN_COMMON h_virt_irq
>> -	FINISH_NAP
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   	bl	do_IRQ
>>   	b	interrupt_return
>> @@ -2304,7 +2278,6 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
>>   EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
>>   EXC_COMMON_BEGIN(performance_monitor_common)
>>   	GEN_COMMON performance_monitor
>> -	FINISH_NAP
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   	bl	performance_monitor_exception
>>   	b	interrupt_return
>> @@ -3032,24 +3005,6 @@ USE_FIXED_SECTION(virt_trampolines)
>>   __end_interrupts:
>>   DEFINE_FIXED_SYMBOL(__end_interrupts)
>>  =20
>> -#ifdef CONFIG_PPC_970_NAP
>> -	/*
>> -	 * Called by exception entry code if _TLF_NAPPING was set, this clears
>> -	 * the NAPPING flag, and redirects the exception exit to
>> -	 * power4_fixup_nap_return.
>> -	 */
>> -	.globl power4_fixup_nap
>> -EXC_COMMON_BEGIN(power4_fixup_nap)
>> -	andc	r9,r9,r10
>> -	std	r9,TI_LOCAL_FLAGS(r11)
>> -	LOAD_REG_ADDR(r10, power4_idle_nap_return)
>> -	std	r10,_NIP(r1)
>> -	blr
>> -
>> -power4_idle_nap_return:
>> -	blr
>> -#endif
>> -
>>   CLOSE_FIXED_SECTION(real_vectors);
>>   CLOSE_FIXED_SECTION(real_trampolines);
>>   CLOSE_FIXED_SECTION(virt_vectors);
>> diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idl=
e_book3s.S
>> index 22f249b6f58d..27d2e6a72ec9 100644
>> --- a/arch/powerpc/kernel/idle_book3s.S
>> +++ b/arch/powerpc/kernel/idle_book3s.S
>> @@ -201,4 +201,8 @@ _GLOBAL(power4_idle_nap)
>>   	mtmsrd	r7
>>   	isync
>>   	b	1b
>> +
>> +	.globl power4_idle_nap_return
>> +power4_idle_nap_return:
>> +	blr
>=20
> Can't this be written in C somewhere ?

Yes I think so if you did the entire power4_idle_nap function in C and=20
used inline asm for the mtmsrd and fixup label (basically the same way
as copy user exceptions return to a fixup location).

You have to return to the same C function of course because you can't
control the stack otherwise. But I don't care too much about avoiding
an extra function call/return here, all the important stuff is in C now.=20

Thanks,
Nick
