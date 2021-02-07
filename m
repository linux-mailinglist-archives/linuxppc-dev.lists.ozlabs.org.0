Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB80B31246C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 14:00:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYTlm4k2LzDrQW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 00:00:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E0XZu/Zz; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYTgq2J0QzDvbh
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 23:56:53 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id s15so6377041plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Feb 2021 04:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=4J8vjVTAmF7qVybMolxtFfqy7wBstph1SrcMt5nRL5Y=;
 b=E0XZu/Zzp1qXqLs5po1MpmGCUnliX0usknfGN9lnMoKQ3OJhxbArFqVk7gDUp8KAIp
 sFTXTOxExmA59TsJ8L8r7ELMXaP0Xj0gZmEEf9nTzz/RzWfUnNi+hrr4AiC+6MGaGWZn
 p4s1Gn4qQ36TsOv9OAO4/uOSxS1pX7sJ+YEq4+CmhosYCt1FuqOP5V2hk2XasdzS8OX2
 FiKcHSRBEM3xgbz3iAwoG+isQknTb6HxN4njqYvx8FHLb6dVe6evMS02J5kpyasG3trq
 wUNZYIk1+iQcK4j3L73gf+lAWMjzcc6XXDutkhcnN1gFS/lAp5l/uMi61JhGVnjQWkKT
 SF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=4J8vjVTAmF7qVybMolxtFfqy7wBstph1SrcMt5nRL5Y=;
 b=EgtDjFhZgzeiV8HCAxr0TqxRbbKspneXCxT2cvedGlEzZAq3HD56Fm9C6NyNjJWZq0
 lNv9LjglvNvX7mt+lvNpDY4ceASxAkOrxzlnWLWAXGTnqHKQoSKaAPPoOoOEROxh73Fe
 PBx0B2sVSjAa0uJUbZtiq0kR37bv0WczAZZ7bNiM3ic1ZlWRdtzjl1WyQfiqUzPqxjdr
 wz4DIPcrdU/WD/cAArgTynsYz1GWxK/51WMwQiC6HO9NITc3kxVWK5s6wSGysdw5EfUb
 QPVY0a04LutxdOBp6TvIIh6Q37azWvg07rWYzlC3UaC0YY0Jc6hasqNcjQzQebeDksZM
 K7UA==
X-Gm-Message-State: AOAM530GiKfQw/YGAzlUht0Yfrh9W/JrpQZ1VX961mOUd8RGkfGz4fXv
 GIou7KHc4SPjFL+HPKIftnOCMriu68g=
X-Google-Smtp-Source: ABdhPJx6Sr2evUuUMtJbMpsRF+Wnvcf4mTcH/eiYGU1EsfPqpSW5gD3KExlLbw5uFLrlBKeKzpla8g==
X-Received: by 2002:a17:90b:148f:: with SMTP id
 js15mr2426084pjb.189.1612702609409; 
 Sun, 07 Feb 2021 04:56:49 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id d18sm11689933pjz.40.2021.02.07.04.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 04:56:48 -0800 (PST)
Date: Sun, 07 Feb 2021 22:56:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 28/42] powerpc: convert interrupt handlers to use
 wrappers
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-29-npiggin@gmail.com>
 <0e319d85-9fa0-ff97-03b2-93637ad89a99@csgroup.eu>
In-Reply-To: <0e319d85-9fa0-ff97-03b2-93637ad89a99@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612702475.d6qyt6qtfy.astroid@bobo.none>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 5, 2021 6:09 pm:
>=20
>=20
> Le 30/01/2021 =C3=A0 14:08, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>=20
>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>> index f70d3f6174c8..7ff915aae8ec 100644
>> --- a/arch/powerpc/kernel/traps.c
>> +++ b/arch/powerpc/kernel/traps.c
>=20
>> @@ -1462,7 +1474,7 @@ static int emulate_math(struct pt_regs *regs)
>>   static inline int emulate_math(struct pt_regs *regs) { return -1; }
>>   #endif
>>  =20
>> -void program_check_exception(struct pt_regs *regs)
>> +DEFINE_INTERRUPT_HANDLER(program_check_exception)
>>   {
>>   	enum ctx_state prev_state =3D exception_enter();
>>   	unsigned int reason =3D get_reason(regs);
>> @@ -1587,14 +1599,14 @@ NOKPROBE_SYMBOL(program_check_exception);
>>    * This occurs when running in hypervisor mode on POWER6 or later
>>    * and an illegal instruction is encountered.
>>    */
>> -void emulation_assist_interrupt(struct pt_regs *regs)
>> +DEFINE_INTERRUPT_HANDLER(emulation_assist_interrupt)
>>   {
>>   	regs->msr |=3D REASON_ILLEGAL;
>>   	program_check_exception(regs);
>=20
> Is it correct that an INTERRUPT_HANDLER calls another INTERRUPT_HANDLER ?

No, here is a patch for it, should go any time before the interrupt=20
wrappers are introduced. It causes some conflicts later but are not
too complex. I can resend the series if necessary.

Thanks,
Nick

---
powerpc/traps: factor common code from program check and emulation assist

Move the program check handling into a function called by both, rather
than have the emulation assist handler call the program check handler.

This allows each of these handlers to be implemented with "interrupt
wrappers" in a later change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/traps.c | 38 +++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f70d3f6174c8..2c5986109412 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1462,9 +1462,8 @@ static int emulate_math(struct pt_regs *regs)
 static inline int emulate_math(struct pt_regs *regs) { return -1; }
 #endif
=20
-void program_check_exception(struct pt_regs *regs)
+static void do_program_check(struct pt_regs *regs)
 {
-	enum ctx_state prev_state =3D exception_enter();
 	unsigned int reason =3D get_reason(regs);
=20
 	/* We can now get here via a FP Unavailable exception if the core
@@ -1473,22 +1472,22 @@ void program_check_exception(struct pt_regs *regs)
 	if (reason & REASON_FP) {
 		/* IEEE FP exception */
 		parse_fpe(regs);
-		goto bail;
+		return;
 	}
 	if (reason & REASON_TRAP) {
 		unsigned long bugaddr;
 		/* Debugger is first in line to stop recursive faults in
 		 * rcu_lock, notify_die, or atomic_notifier_call_chain */
 		if (debugger_bpt(regs))
-			goto bail;
+			return;
=20
 		if (kprobe_handler(regs))
-			goto bail;
+			return;
=20
 		/* trap exception */
 		if (notify_die(DIE_BPT, "breakpoint", regs, 5, 5, SIGTRAP)
 				=3D=3D NOTIFY_STOP)
-			goto bail;
+			return;
=20
 		bugaddr =3D regs->nip;
 		/*
@@ -1500,10 +1499,10 @@ void program_check_exception(struct pt_regs *regs)
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) =3D=3D BUG_TRAP_TYPE_WARN) {
 			regs->nip +=3D 4;
-			goto bail;
+			return;
 		}
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
-		goto bail;
+		return;
 	}
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (reason & REASON_TM) {
@@ -1524,7 +1523,7 @@ void program_check_exception(struct pt_regs *regs)
 		 */
 		if (user_mode(regs)) {
 			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
-			goto bail;
+			return;
 		} else {
 			printk(KERN_EMERG "Unexpected TM Bad Thing exception "
 			       "at %lx (msr 0x%lx) tm_scratch=3D%llx\n",
@@ -1557,7 +1556,7 @@ void program_check_exception(struct pt_regs *regs)
 	 * pattern to occurrences etc. -dgibson 31/Mar/2003
 	 */
 	if (!emulate_math(regs))
-		goto bail;
+		return;
=20
 	/* Try to emulate it if we should. */
 	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
@@ -1565,10 +1564,10 @@ void program_check_exception(struct pt_regs *regs)
 		case 0:
 			regs->nip +=3D 4;
 			emulate_single_step(regs);
-			goto bail;
+			return;
 		case -EFAULT:
 			_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
-			goto bail;
+			return;
 		}
 	}
=20
@@ -1578,7 +1577,14 @@ void program_check_exception(struct pt_regs *regs)
 	else
 		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
=20
-bail:
+}
+
+void program_check_exception(struct pt_regs *regs)
+{
+	enum ctx_state prev_state =3D exception_enter();
+
+	do_program_check(regs);
+
 	exception_exit(prev_state);
 }
 NOKPROBE_SYMBOL(program_check_exception);
@@ -1589,8 +1595,12 @@ NOKPROBE_SYMBOL(program_check_exception);
  */
 void emulation_assist_interrupt(struct pt_regs *regs)
 {
+	enum ctx_state prev_state =3D exception_enter();
+
 	regs->msr |=3D REASON_ILLEGAL;
-	program_check_exception(regs);
+	do_program_check(regs);
+
+	exception_exit(prev_state);
 }
 NOKPROBE_SYMBOL(emulation_assist_interrupt);
=20
--=20
2.23.0


