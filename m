Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF00354234
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 14:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDVzl73mqz3btL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 22:57:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hBAf0+2S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hBAf0+2S; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDVzH3tTJz2yR2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 22:56:42 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so5791478pjg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Apr 2021 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0YtiwbqYkLccMG3bnBO8iydlOkwUwIDqxrr5g0NKREA=;
 b=hBAf0+2SE57nss5ko+9PrjrknSpih0HUAEm0NTheV2/MPMG3CJtmyPFN7Uru80PHCv
 QKERiOdKcnL6PQElrp8zs1cBM//r6bfC61oVVn300Nu0jyhShL0khyjFrpCBpgdLkc3V
 dVWkcNrBkU0AasGZLw6SqrFt4QqtjG/mtvY6flaMw6Y6Ao3yXnEdXekgEM5TmiHnAplK
 ZdnOXc1ldYp+V5Q9Atgj5jqyehWGdCecyEsk8r25deMj2RlvTOQ5DKr7GDtNy0dJ3sbx
 0/AAIcvdnGW+3YmfVEvJ5JJgDzeRM7XUajB9+UBTG+IOUA1TzMQOjoBee7IHl1m9uyPI
 Xbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0YtiwbqYkLccMG3bnBO8iydlOkwUwIDqxrr5g0NKREA=;
 b=cA34mRCcsu4axDIR/1TdZpxrWhCmvZyDKeGhXIQgEVGtPuL3HPdydu8MxZ0OJ3q2kC
 yfmFxDPKmXE32Cypk0CnX4+5WvTQ7gDrJj2QpiH+BcSFCGM/I4JEfZdoInQcNy9q5lNX
 GScvyKGYcK0CK6pIOiiQGmFKCI19bfrpi9HgEXR2H942lAaWpn9yE7y6xtlMRkc9IXFn
 XQUsBDn400RJjbpYivdfTGW4hHwgoc9Z/NMAxl7CiwrLTtyJZu7NqHhgELq9qA7IpJ5r
 ahGeQwVOqElNOfbysOgZI3PF5UUbBogf6G89aocfvkUkJcRIZzzTatTxXnVYObk2CQ09
 ZWng==
X-Gm-Message-State: AOAM531a6l51UKu0vhYw2oQSur2mpBUTX5jkcArI+MZ5Vm6TY/zvlawf
 h94/GZXiPO9UsWc/ci+PlXk6SKcqxGzcHw==
X-Google-Smtp-Source: ABdhPJyu3AnZltVVeHnkQpP0oUTJ2Flc3XYpyOjO0F8yYFqgINPHP6ba44nI8s2T87HN1bP/eRUmpg==
X-Received: by 2002:a17:902:165:b029:e7:3753:65e1 with SMTP id
 92-20020a1709020165b02900e7375365e1mr24314128plb.10.1617627397894; 
 Mon, 05 Apr 2021 05:56:37 -0700 (PDT)
Received: from localhost ([1.132.212.67])
 by smtp.gmail.com with ESMTPSA id g5sm17020258pfb.77.2021.04.05.05.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 05:56:37 -0700 (PDT)
Date: Mon, 05 Apr 2021 22:56:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
To: Michael Ellerman <mpe@ellerman.id.au>, Andreas Schwab
 <schwab@linux-m68k.org>
References: <20210312012044.3660743-1-npiggin@gmail.com>
 <87y2e6fu7v.fsf__9754.75274478725$1616992871$gmane$org@mpe.ellerman.id.au>
 <87v99aj7tr.fsf__47134.2879392736$1617031867$gmane$org@igel.home>
 <87r1jyj5e1.fsf@igel.home> <1617262357.w4yq2kiecw.astroid@bobo.none>
In-Reply-To: <1617262357.w4yq2kiecw.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1617627247.3cjpyzcob4.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of April 1, 2021 5:36 pm:
> Excerpts from Andreas Schwab's message of March 30, 2021 2:23 am:
>> On M=C3=A4r 29 2021, Andreas Schwab wrote:
>>=20
>>> On M=C3=A4r 29 2021, Michael Ellerman wrote:
>>>
>>>> Nicholas Piggin <npiggin@gmail.com> writes:
>>>>> There is no need for this to be in asm, use the new intrrupt entry wr=
apper.
>>>>>
>>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>>> ---
>>>>> Hopefully this works on a real G5 now, but I couldn't reproduce the
>>>>> problem with QEMU.
>>>>
>>>> It still prevents my G5 from booting.
>>>
>>> I see differing failures.  What's common is that there is a pause of
>>> about 60 seconds before the crash occurs.  It looks like the crash
>>> occurs in power4_idle_nap+0x30/0x34.  Unfortuately, the BootX console i=
s
>>> too small to see enough.
>>=20
>> I was now able to see the messages on the VGA console, and the problem
>> is actually that the cpus are starting to stall.
>=20
> This is strange, I haven't been able to figure out what is wrong.
>=20
> I've been looking at QEMU code and now I'll have to try find a POWER4/5
> or PPC970 manual to see what exactly this MSR[POW] thing does and make=20
> sure QEMU matches it.

I worked it out. There was a window where it could take another=20
interrupt before the first one adjusts the nip.

I managed to trigger it in qemu and this version fixed it.

---
 arch/powerpc/include/asm/interrupt.h   | 24 ++++++++++++++
 arch/powerpc/include/asm/processor.h   |  1 +
 arch/powerpc/include/asm/thread_info.h |  6 ++++
 arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
 arch/powerpc/kernel/idle_book3s.S      |  4 +++
 5 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/as=
m/interrupt.h
index e8d09a841373..2643028cf67a 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -9,6 +9,17 @@
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
=20
+static inline void nap_adjust_return(struct pt_regs *regs)
+{
+#ifdef CONFIG_PPC_970_NAP
+	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
+		/* Can avoid a test-and-clear because NMIs do not call this */
+		clear_thread_local_flags(_TLF_NAPPING);
+		regs->nip =3D (unsigned long)power4_idle_nap_return;
+	}
+#endif
+}
+
 struct interrupt_state {
 #ifdef CONFIG_PPC_BOOK3E_64
 	enum ctx_state ctx_state;
@@ -109,6 +120,14 @@ static inline void interrupt_async_enter_prepare(struc=
t pt_regs *regs, struct in
=20
 static inline void interrupt_async_exit_prepare(struct pt_regs *regs, stru=
ct interrupt_state *state)
 {
+	/*
+	 * Adjust at exit so the main handler sees the true NIA. This must
+	 * come before irq_exit() because irq_exit can enable interrupts, and
+	 * if another interrupt is taken before nap_adjust_return has run
+	 * here, then that interrupt would return directly to idle nap return.
+	 */
+	nap_adjust_return(regs);
+
 	irq_exit();
 	interrupt_exit_prepare(regs, state);
 }
@@ -164,6 +183,11 @@ static inline void interrupt_nmi_exit_prepare(struct p=
t_regs *regs, struct inter
 			radix_enabled() || (mfmsr() & MSR_DR))
 		nmi_exit();
=20
+	/*
+	 * nmi does not call nap_adjust_return because nmi should not create
+	 * new work to do (must use irq_work for that).
+	 */
+
 #ifdef CONFIG_PPC64
 	if (TRAP(regs) !=3D 0x900 && TRAP(regs) !=3D 0xf00 && TRAP(regs) !=3D 0x2=
60)
 		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/as=
m/processor.h
index 8acc3590c971..eedc3c775141 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -393,6 +393,7 @@ extern unsigned long isa300_idle_stop_mayloss(unsigned =
long psscr_val);
 extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
 #ifdef CONFIG_PPC_970_NAP
 extern void power4_idle_nap(void);
+void power4_idle_nap_return(void);
 #endif
=20
 extern unsigned long cpuidle_disable;
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/=
asm/thread_info.h
index 386d576673a1..bf137151100b 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -152,6 +152,12 @@ void arch_setup_new_exec(void);
=20
 #ifndef __ASSEMBLY__
=20
+static inline void clear_thread_local_flags(unsigned int flags)
+{
+	struct thread_info *ti =3D current_thread_info();
+	ti->local_flags &=3D ~flags;
+}
+
 static inline bool test_thread_local_flags(unsigned int flags)
 {
 	struct thread_info *ti =3D current_thread_info();
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exc=
eptions-64s.S
index 8082b690e874..0cdb59e8b577 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -692,25 +692,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r1,GPR1(r1)
 .endm
=20
-/*
- * When the idle code in power4_idle puts the CPU into NAP mode,
- * it has to do so in a loop, and relies on the external interrupt
- * and decrementer interrupt entry code to get it out of the loop.
- * It sets the _TLF_NAPPING bit in current_thread_info()->local_flags
- * to signal that it is in the loop and needs help to get out.
- */
-#ifdef CONFIG_PPC_970_NAP
-#define FINISH_NAP				\
-BEGIN_FTR_SECTION				\
-	ld	r11, PACA_THREAD_INFO(r13);	\
-	ld	r9,TI_LOCAL_FLAGS(r11);		\
-	andi.	r10,r9,_TLF_NAPPING;		\
-	bnel	power4_fixup_nap;		\
-END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
-#else
-#define FINISH_NAP
-#endif
-
 /*
  * There are a few constraints to be concerned with.
  * - Real mode exceptions code/data must be located at their physical loca=
tion.
@@ -1248,7 +1229,6 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 */
 	GEN_COMMON machine_check
=20
-	FINISH_NAP
 	/* Enable MSR_RI when finished with PACA_EXMC */
 	li	r10,MSR_RI
 	mtmsrd 	r10,1
@@ -1571,7 +1551,6 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
 EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -1801,7 +1780,6 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
 EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	timer_interrupt
 	b	interrupt_return
@@ -1886,7 +1864,6 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
 EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
 EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2237,7 +2214,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
=20
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	interrupt_return
@@ -2266,7 +2242,6 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
 EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
 EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
@@ -2299,7 +2274,6 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
 EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_IRQ
 	b	interrupt_return
@@ -2345,7 +2319,6 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
 EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
-	FINISH_NAP
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
 	b	interrupt_return
@@ -3096,24 +3069,6 @@ USE_FIXED_SECTION(virt_trampolines)
 __end_interrupts:
 DEFINE_FIXED_SYMBOL(__end_interrupts)
=20
-#ifdef CONFIG_PPC_970_NAP
-	/*
-	 * Called by exception entry code if _TLF_NAPPING was set, this clears
-	 * the NAPPING flag, and redirects the exception exit to
-	 * power4_fixup_nap_return.
-	 */
-	.globl power4_fixup_nap
-EXC_COMMON_BEGIN(power4_fixup_nap)
-	andc	r9,r9,r10
-	std	r9,TI_LOCAL_FLAGS(r11)
-	LOAD_REG_ADDR(r10, power4_idle_nap_return)
-	std	r10,_NIP(r1)
-	blr
-
-power4_idle_nap_return:
-	blr
-#endif
-
 CLOSE_FIXED_SECTION(real_vectors);
 CLOSE_FIXED_SECTION(real_trampolines);
 CLOSE_FIXED_SECTION(virt_vectors);
diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_b=
ook3s.S
index f9e6d83e6720..abb719b21cae 100644
--- a/arch/powerpc/kernel/idle_book3s.S
+++ b/arch/powerpc/kernel/idle_book3s.S
@@ -209,4 +209,8 @@ _GLOBAL(power4_idle_nap)
 	mtmsrd	r7
 	isync
 	b	1b
+
+	.globl power4_idle_nap_return
+power4_idle_nap_return:
+	blr
 #endif
--=20
2.23.0

