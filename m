Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49466A1699
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 12:49:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jzqx4PrBzDqby
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 20:49:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D5wuqvCA"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jznq5WN8zDr6X
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 20:47:10 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id gn20so1403372plb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=BVFmwkaJCPl1yCf3RDVOt6AwmdnBTGpbXNYNllgzUtc=;
 b=D5wuqvCAryXtJdw2Cr9gssKhLJQ6b3e4C61VKcuG5N7HPeRpcPzh5HNJi2OYjy51K5
 OhuhKMs7oOSzT1CeUiy4jz3GbibcZLrnZ81otdfuF3mTjtk4PLM8XhrUpfJWoYPaBTKw
 GSrsQBISc54hAJg0rd+gKCjLHRXLT2M/HysJM6Pypqdrj7xVdf/ouq/jiNQzW75JSyxZ
 hIlkuM2P5FIUAHWyAsEAeeD2nqS5QlwjOPDi6GqsGL5PqfOBDDBHjiMTimBb2/rcdqha
 G/a3F1CQlSUaPlzr4i05OgtHRUqaAXxOQz7PiQV5HFsJJ2RLj5KPW1Mm3GG7qPTVCc3U
 LbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=BVFmwkaJCPl1yCf3RDVOt6AwmdnBTGpbXNYNllgzUtc=;
 b=fbeulUe4Gt7Zb6fV0NSNDqorDRwiJRS8F7Qu5b2PjL0ZTBaq86+M92cmcXI2CkQ6Ko
 DIvLwMzmYm6jWh2+s9QLTjaFFgxmOBo9hsQjttHsvYbAgGitR0TUByuGvSiOfe2ol6QP
 /RGaIW4qvc5bIZxX/Nyc8baGC5kahZjlYho4k1XIBYI2Wsrzf6tFzfIVmOsg6QdjV+jh
 ZSJh73Re52DuPMdG5/0jrxydWnSd+6Yo0WvVFxg5tlqORSgwVkymC1MkypTwoFUTJde/
 6p7zSH3FNuPHf4SxWlwEouUOqKA2lubnxYafTojWb/lKdcL3zKJC/HDM00DUyz8nVWPG
 5VqA==
X-Gm-Message-State: APjAAAUW4PONm7VjAaHSGWgoDSXmUA5426v7Dv2fLSUuarksNSuPnV+a
 MelwcNur3aefK0gzmxo8jFc=
X-Google-Smtp-Source: APXvYqygrfBYZZZxM6K4EHTAAFKoRgDyoKeAyWxHItLooG7p18kEq/wEOzscVdVS9CarQpEwYBk/ug==
X-Received: by 2002:a17:902:2bcb:: with SMTP id
 l69mr9380522plb.282.1567075628909; 
 Thu, 29 Aug 2019 03:47:08 -0700 (PDT)
Received: from localhost (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id u69sm1715151pgu.77.2019.08.29.03.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 03:47:08 -0700 (PDT)
Date: Thu, 29 Aug 2019 20:45:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] powerpc/64: syscalls in C
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827135548.21457-1-npiggin@gmail.com>
 <5ecd9d1a-d35e-dc8c-9ad4-a830a8b1a952@c-s.fr>
 <1566985278.ehbnos9t6c.astroid@bobo.none>
 <4d0359d8-0958-583f-7727-10a51bd3c7c6@c-s.fr>
 <1567070800.hlilai6sy6.astroid@bobo.none>
In-Reply-To: <1567070800.hlilai6sy6.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567075218.zetwgblt3a.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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

Nicholas Piggin's on August 29, 2019 7:38 pm:
> Christophe Leroy's on August 28, 2019 7:55 pm:
>>=20
>>=20
>> Le 28/08/2019 =C3=A0 11:49, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Christophe Leroy's on August 28, 2019 7:06 pm:
>>>>
>>>>
>>>> Le 27/08/2019 =C3=A0 15:55, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>>> Accounted for some feedback.
>>>>>
>>>>> Nicholas Piggin (4):
>>>>>     powerpc: convert to copy_thread_tls
>>>>>     powerpc/64: remove support for kernel-mode syscalls
>>>>>     powerpc/64: system call remove non-volatile GPR save optimisation
>>>>>     powerpc/64: system call implement the bulk of the logic in C
>>>>
>>>> Would it be possible to split in the following parts:
>>>>
>>>> 1/ Implement in C whatever can be implemented without removing
>>>> non-volatile GPR save optimisation
>>>> 2/ Remove non-volatile GPR save optimisation
>>>> 3/ Implement in C everything else
>>>=20
>>> Hmm. I'll have a look but I would rather not go back and add the
>>> intermediate state I was hoping to avoid. I'll think about it and
>>> if it's not too difficult I will try to add something. I have an
>>> idea.
>>>=20
>>> With your nvregs performance test on ppc32, are you doing the
>>> nvgpr restore? The fast path should be able to avoid that.
>>=20
>> I only added the SAVE_NVGPRS call in the syscall entry macro just after=20
>> the saving of volatile regs, and changed the trap from \trapno+1 to \tra=
pno
>=20
> So... this actually seems to work. Haven't booted it, but the compiler
> seems to do what we want.
>=20

Here's a really quick start for ppc32. The interrupt handling is
different enough it may be hard to merge entirely with ppc64, but
it's not really much code anyway.

Unfortunately can't restore full registers using the same method,
because we have some others like lr and cr, so the exit still must
return a code to asm.

---
 arch/powerpc/kernel/Makefile     |   2 +-
 arch/powerpc/kernel/syscall_32.c | 167 +++++++++++++++++++++++++++++++
 2 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/kernel/syscall_32.c

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 7f53cc07f933..83d5808654ec 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -107,7 +107,7 @@ extra-y				+=3D vmlinux.lds
=20
 obj-$(CONFIG_RELOCATABLE)	+=3D reloc_$(BITS).o
=20
-obj-$(CONFIG_PPC32)		+=3D entry_32.o setup_32.o early_32.o
+obj-$(CONFIG_PPC32)		+=3D entry_32.o setup_32.o early_32.o syscall_32.o
 obj-$(CONFIG_PPC64)		+=3D dma-iommu.o iommu.o
 obj-$(CONFIG_KGDB)		+=3D kgdb.o
 obj-$(CONFIG_BOOTX_TEXT)	+=3D btext.o
diff --git a/arch/powerpc/kernel/syscall_32.c b/arch/powerpc/kernel/syscall=
_32.c
new file mode 100644
index 000000000000..ff37edac76c8
--- /dev/null
+++ b/arch/powerpc/kernel/syscall_32.c
@@ -0,0 +1,167 @@
+#include <linux/err.h>
+#include <asm/cputime.h>
+#include <asm/hw_irq.h>
+#include <asm/ptrace.h>
+#include <asm/reg.h>
+#include <asm/signal.h>
+#include <asm/switch_to.h>
+#include <asm/syscall.h>
+#include <asm/time.h>
+
+typedef long (*syscall_fn)(long, long, long, long, long, long);
+
+register unsigned long r31 asm("r31");
+register unsigned long r30 asm("r30");
+register unsigned long r29 asm("r29");
+register unsigned long r28 asm("r28");
+register unsigned long r27 asm("r27");
+register unsigned long r26 asm("r26");
+register unsigned long r25 asm("r25");
+register unsigned long r24 asm("r24");
+register unsigned long r23 asm("r23");
+register unsigned long r22 asm("r22");
+register unsigned long r21 asm("r21");
+register unsigned long r20 asm("r20");
+register unsigned long r19 asm("r19");
+register unsigned long r18 asm("r18");
+register unsigned long r17 asm("r17");
+register unsigned long r16 asm("r16");
+register unsigned long r15 asm("r15");
+register unsigned long r14 asm("r14");
+register unsigned long r13 asm("r13");
+
+static void save_nvgprs(struct pt_regs *regs)
+{
+	if (!(regs->trap & 1))
+		return;
+	regs->trap &=3D ~0x1;
+
+	asm volatile("stmw	13, %0" : : "m"(regs->gpr[13]) : "memory");
+}
+
+long system_call_exception(long r3, long r4, long r5, long r6, long r7, lo=
ng r8, unsigned long r0, struct pt_regs *regs)
+{
+	unsigned long ti_flags;
+	syscall_fn f;
+
+	BUG_ON(irqs_disabled());
+	BUG_ON(!(regs->msr & MSR_PR));
+	BUG_ON(!(regs->msr & MSR_EE));
+
+	ti_flags =3D current_thread_info()->flags;
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		/*
+		 * We use the return value of do_syscall_trace_enter() as the
+		 * syscall number. If the syscall was rejected for any reason
+		 * do_syscall_trace_enter() returns an invalid syscall number
+		 * and the test below against NR_syscalls will fail.
+		 */
+		save_nvgprs(regs);
+		r0 =3D do_syscall_trace_enter(regs);
+	}
+
+	if (unlikely(r0 >=3D NR_syscalls))
+		return -ENOSYS;
+
+	/* May be faster to do array_index_nospec? */
+	barrier_nospec();
+
+	f =3D (void *)sys_call_table[r0];
+
+	return f(r3, r4, r5, r6, r7, r8);
+}
+
+static inline void load_dbcr0(void)
+{
+	/* blah */
+}
+
+unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs)
+{
+	unsigned long *ti_flagsp =3D &current_thread_info()->flags;
+	unsigned long ti_flags;
+	unsigned long ret =3D 0;
+
+	regs->result =3D r3;
+
+	/* Check whether the syscall is issued inside a restartable sequence */
+	rseq_syscall(regs);
+
+	ti_flags =3D *ti_flagsp;
+
+	if (unlikely(r3 >=3D (unsigned long)-MAX_ERRNO)) {
+		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
+			r3 =3D -r3;
+			regs->ccr |=3D 0x10000000; /* Set SO bit in CR */
+		}
+	}
+
+	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
+		if (ti_flags & _TIF_RESTOREALL)
+			ret =3D _TIF_RESTOREALL;
+		else
+			regs->gpr[3] =3D r3;
+		clear_bits(_TIF_PERSYSCALL_MASK, ti_flagsp);
+	} else {
+		regs->gpr[3] =3D r3;
+	}
+
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		save_nvgprs(regs);
+		do_syscall_trace_leave(regs);
+	}
+
+	local_irq_disable();
+	ti_flags =3D READ_ONCE(*ti_flagsp);
+	while (unlikely(ti_flags & _TIF_USER_WORK_MASK)) {
+		local_irq_enable();
+		if (ti_flags & _TIF_NEED_RESCHED) {
+			schedule();
+		} else {
+			save_nvgprs(regs);
+			/*
+			 * SIGPENDING must restore signal handler function
+			 * argument GPRs, and some non-volatiles (e.g., r1).
+			 * Restore all for now. This could be made lighter.
+			 */
+			if (ti_flags & _TIF_SIGPENDING)
+				ret |=3D _TIF_RESTOREALL;
+			do_notify_resume(regs, ti_flags);
+		}
+		local_irq_disable();
+		ti_flags =3D READ_ONCE(*ti_flagsp);
+	}
+
+	WARN_ON(!(regs->msr & MSR_EE)); /* don't do this */
+
+	/* Tell lockdep IRQs are being enabled when we RFI */
+	trace_hardirqs_on();
+
+#if 0
+	if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE)) {
+		struct thread_struct *t =3D &current->thread;
+
+		/*
+		 * If the process has its own DBCR0 value, load it up. The
+		 * internal debug mode bit tells us that dbcr0 should be
+		 * loaded.
+		 */
+		if (unlikely(t->debug.dbcr0 & DBCR0_IDM))
+			load_dbcr0();
+	}
+
+	if (IS_ENABLED(CONFIG_4xx) && !mmu_has_feature(MMU_FTR_TYPE_47x)) {
+		if (unlikely(icache_44x_need_flush))
+			flush_icache_44x();
+	}
+
+	if (IS_ENABLED(PPC_BOOK3S_32))
+		kuep_unlock();
+
+	kuap_check();
+#endif
+
+	account_cpu_user_exit();
+
+	return ret;
+}
--=20
2.22.0

=
