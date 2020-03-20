Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98F18C606
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 04:43:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k8kY6Rc7zDrQy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 14:43:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=flIViyqh; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k8hR5xtKzDrQk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 14:41:26 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id h11so1928922plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 20:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=OgeGHsw2B04cs0tuM77W0Fg0AJifH+WR4QN654Xc21Q=;
 b=flIViyqhnsjSPw35EAQ2MFfedgwPd1tF7bXBrquwJsaZwaHfIbaPJQIhqiqMk7Ax+O
 t+0Mt0FY53wJYn89JVQlOddTIDkhK1gcF7+Zp2hfAw9apbL8CEfbcVnoXy/pZiMU5i3+
 8Ue2fXEiKNiiy+jUVKi4hArbwJnU4beXNDITkXSy8JEcZiLuQHQbt7FNSCD7WDcFXD+K
 C0mKfu8P2jEALcdN97JM0rrUfcaczD/8lM/p6b6rbmwzqLeJZB1cg52RQMZHAqn4vjRL
 uct7IdNP5xCNvr6Y6XEunr7itdPr7zmcO3cDNU9qnRenlMW+Nm+qLwVPoR4pXIeQ6Uyk
 ZBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=OgeGHsw2B04cs0tuM77W0Fg0AJifH+WR4QN654Xc21Q=;
 b=QfyTM/jUn7iGSBAtavMABzBgMy8yllNT5LULu752ze3KAe6mZXQu3UMMWupbN2pIGX
 1ECzsvnxTJSdX8TMPqc2VMC1EuqHGQrfntYDL5diP3O6cOJvGkvc0lMOV3LI4+KkVZRg
 MlJAwBF8TqbOr2TRTxexssfhxWFOdah06G9m0wyYMAWkvo1b6mqpKpnlnXN4L4wMT+Wm
 /WIuIY5HoWN4ZM4OEnLZJLXV963Wgr0NxJkYjb+pj9+RyMM1Vi47wh0hEIX5mrOzp/9W
 m6VCxeAbQ5aW7ZTCggChCLuXItmtvAfgRwAuISucdIymmhBX6heBr90H8BavfHx7pbCs
 t2hw==
X-Gm-Message-State: ANhLgQ3SLuZZMGliLo3S1XKTdz9MM4Tg/C+aRu83hfy2YkTjosJxr97v
 o2aQeYBa+dz/LxGWL/Cf088=
X-Google-Smtp-Source: ADFU+vvLCY9fXOHMH8dKtxHDUZ6Db6pCVxLvewhFWUKmuFA0FaV/UHMGfxJUNR/0k1bzM/rI1AY8Dg==
X-Received: by 2002:a17:902:784c:: with SMTP id
 e12mr6430810pln.191.1584675683131; 
 Thu, 19 Mar 2020 20:41:23 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id w124sm3829689pfd.71.2020.03.19.20.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 20:41:22 -0700 (PDT)
Date: Fri, 20 Mar 2020 13:39:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 25/32] powerpc/64: system call implement entry/exit
 logic in C
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-26-npiggin@gmail.com>
 <b64d5395-1280-e997-fc56-aaaaba7bffad@c-s.fr>
In-Reply-To: <b64d5395-1280-e997-fc56-aaaaba7bffad@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584672848.o4y039mc82.astroid@bobo.none>
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on March 19, 2020 7:18 pm:
>=20
>=20
> Le 25/02/2020 =C3=A0 18:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>> System call entry and particularly exit code is beyond the limit of what
>> is reasonable to implement in asm.
>>=20
>> This conversion moves all conditional branches out of the asm code,
>> except for the case that all GPRs should be restored at exit.
>>=20
>> Null syscall test is about 5% faster after this patch, because the exit
>> work is handled under local_irq_disable, and the hard mask and pending
>> interrupt replay is handled after that, which avoids games with MSR.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>> ---
>>=20
>> v2,rebase (from Michal):
>> - Add endian conversion for dtl_idx (ms)
>> - Fix sparse warning about missing declaration (ms)
>> - Add unistd.h to fix some defconfigs, add SPDX, minor formatting (mpe)
>>=20
>> v3: Fixes thanks to reports from mpe and selftests errors:
>> - Several soft-mask debug and unsafe smp_processor_id() warnings due to
>>    tracing and other false positives due to checks in "unreconciled" cod=
e.
>> - Fix a bug with syscall tracing functions that set registers (e.g.,
>>    PTRACE_SETREG) not setting GPRs properly.
>> - Fix silly tabort_syscall bug that causes kernel crashes when making sy=
stem
>>    calls in transactional state.
>>=20
>>   arch/powerpc/include/asm/asm-prototypes.h     |  17 +-
>>   .../powerpc/include/asm/book3s/64/kup-radix.h |  14 +-
>>   arch/powerpc/include/asm/cputime.h            |  29 ++
>>   arch/powerpc/include/asm/hw_irq.h             |   4 +
>>   arch/powerpc/include/asm/ptrace.h             |   3 +
>>   arch/powerpc/include/asm/signal.h             |   3 +
>>   arch/powerpc/include/asm/switch_to.h          |   5 +
>>   arch/powerpc/include/asm/time.h               |   3 +
>>   arch/powerpc/kernel/Makefile                  |   3 +-
>>   arch/powerpc/kernel/entry_64.S                | 338 +++---------------
>>   arch/powerpc/kernel/signal.h                  |   2 -
>>   arch/powerpc/kernel/syscall_64.c              | 213 +++++++++++
>>   arch/powerpc/kernel/systbl.S                  |   9 +-
>>   13 files changed, 328 insertions(+), 315 deletions(-)
>>   create mode 100644 arch/powerpc/kernel/syscall_64.c
>>=20
>> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/in=
clude/asm/asm-prototypes.h
>> index 983c0084fb3f..4b3609554e76 100644
>> --- a/arch/powerpc/include/asm/asm-prototypes.h
>> +++ b/arch/powerpc/include/asm/asm-prototypes.h
>> @@ -97,6 +97,12 @@ ppc_select(int n, fd_set __user *inp, fd_set __user *=
outp, fd_set __user *exp,
>>   unsigned long __init early_init(unsigned long dt_ptr);
>>   void __init machine_init(u64 dt_ptr);
>>   #endif
>> +#ifdef CONFIG_PPC64
>=20
> This ifdef is not necessary as it has no pending #else.
> Having function declaration without definition is not an issue.
> Keeping in mind that we are aiming at generalising this to PPC32.

Well there's other unnecessary ifdefs in there too I think. But sure.
This patch also got the interrupt_exit_ prototypes leaked in from the
later patch so I could fix those.

>> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/a=
sm/cputime.h
>> index 2431b4ada2fa..6639a6847cc0 100644
>> --- a/arch/powerpc/include/asm/cputime.h
>> +++ b/arch/powerpc/include/asm/cputime.h
>> @@ -44,6 +44,28 @@ static inline unsigned long cputime_to_usecs(const cp=
utime_t ct)
>>   #ifdef CONFIG_PPC64
>>   #define get_accounting(tsk)	(&get_paca()->accounting)
>>   static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
>=20
> Could we have the below additions sit outside of this PPC64 ifdef, to be=20
> reused on PPC32 ?

Okay.

>> +
>> +/*
>> + * account_cpu_user_entry/exit runs "unreconciled", so can't trace,
>> + * can't use use get_paca()
>> + */
>> +static notrace inline void account_cpu_user_entry(void)
>> +{
>> +	unsigned long tb =3D mftb();
>> +	struct cpu_accounting_data *acct =3D &local_paca->accounting;
>=20
> In the spirit of reusing that code on PPC32, can we use get_accounting()=20
> ? Or an alternate version of get_accounting(), eg=20
> get_accounting_notrace() to be defined ?

Okay.

>> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sysc=
all_64.c
>=20
> Could some part of it go in a syscall.c to be reused on PPC32 ?

I could put it all in syscall.c and then we can adjust with some ifdefs
or helpers. I don't think there is enough to be worth syscall.c,
syscall_32.c, and syscall_64.c.

I wonder about the interrupt returns as well, that doesn't really make
sense in a file called syscall.c, but the code is very similar to
system call exit. Should we just call it interrupts.c?

>> +	/*
>> +	 * This is not required for the syscall exit path, but makes the
>> +	 * stack frame look nicer. If this was initialised in the first stack
>> +	 * frame, or if the unwinder was taught the first stack frame always
>> +	 * returns to user with IRQS_ENABLED, this store could be avoided!
>> +	 */
>> +	regs->softe =3D IRQS_ENABLED;
>=20
> softe doesn't exist on PPC32. Can we do that through a helper ?

I guess, we can have regs_set_irq_state(regs, IRQS_ENABLED); or
something like that.

We make that helper and a _get_ counterpart in a later patch which=20
covers other cases in the tree as well.

>> +
>> +	__hard_irq_enable();
>=20
> This doesn't exist on PPC32. Should we define __hard_irq_enable() as=20
> arch_local_irq_enable() on PPC32 ?

This goes away with patch 29. Better not to have this ugly thing
spill into ppc32 code at all if we can avoid it :)

>=20
>> +
>> +	ti_flags =3D current_thread_info()->flags;
>> +	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
>> +		/*
>> +		 * We use the return value of do_syscall_trace_enter() as the
>> +		 * syscall number. If the syscall was rejected for any reason
>> +		 * do_syscall_trace_enter() returns an invalid syscall number
>> +		 * and the test against NR_syscalls will fail and the return
>> +		 * value to be used is in regs->gpr[3].
>> +		 */
>> +		r0 =3D do_syscall_trace_enter(regs);
>> +		if (unlikely(r0 >=3D NR_syscalls))
>> +			return regs->gpr[3];
>> +		r3 =3D regs->gpr[3];
>> +		r4 =3D regs->gpr[4];
>> +		r5 =3D regs->gpr[5];
>> +		r6 =3D regs->gpr[6];
>> +		r7 =3D regs->gpr[7];
>> +		r8 =3D regs->gpr[8];
>> +
>> +	} else if (unlikely(r0 >=3D NR_syscalls)) {
>> +		return -ENOSYS;
>> +	}
>> +
>> +	/* May be faster to do array_index_nospec? */
>> +	barrier_nospec();
>> +
>> +	if (unlikely(ti_flags & _TIF_32BIT)) {
>=20
> Use is_compat_task() instead ?

Michal pointed this out, he's got patches that do this on top of this
series.

Incremental diff for your suggestions below. Now there is likely we're
going to have a few ifdefs, particularly in the exit paths where we have
complexity handling irq soft masked state where helpers dont make much
sense. I don't think that will be such a bad thing, but we can come to
it as we go.

Thanks,
Nick

---
 arch/powerpc/include/asm/asm-prototypes.h |  4 ---
 arch/powerpc/include/asm/cputime.h        | 38 +++++++++++++----------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/inclu=
de/asm/asm-prototypes.h
index 4b3609554e76..ab59a4904254 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -97,12 +97,8 @@ ppc_select(int n, fd_set __user *inp, fd_set __user *out=
p, fd_set __user *exp,
 unsigned long __init early_init(unsigned long dt_ptr);
 void __init machine_init(u64 dt_ptr);
 #endif
-#ifdef CONFIG_PPC64
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, lo=
ng r8, unsigned long r0, struct pt_regs *regs);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_reg=
s *regs);
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, un=
signed long msr);
-notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, =
unsigned long msr);
-#endif
=20
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/=
cputime.h
index 6639a6847cc0..0fccd5ea1e9a 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -43,8 +43,26 @@ static inline unsigned long cputime_to_usecs(const cputi=
me_t ct)
  */
 #ifdef CONFIG_PPC64
 #define get_accounting(tsk)	(&get_paca()->accounting)
+#define raw_get_accounting(tsk)	(&local_paca->accounting)
 static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
=20
+#else
+#define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
+#define raw_get_accounting(tsk)	get_accounting(tsk)
+/*
+ * Called from the context switch with interrupts disabled, to charge all
+ * accumulated times to the current process, and to prepare accounting on
+ * the next process.
+ */
+static inline void arch_vtime_task_switch(struct task_struct *prev)
+{
+	struct cpu_accounting_data *acct =3D get_accounting(current);
+	struct cpu_accounting_data *acct0 =3D get_accounting(prev);
+
+	acct->starttime =3D acct0->starttime;
+}
+#endif
+
 /*
  * account_cpu_user_entry/exit runs "unreconciled", so can't trace,
  * can't use use get_paca()
@@ -52,35 +70,21 @@ static inline void arch_vtime_task_switch(struct task_s=
truct *tsk) { }
 static notrace inline void account_cpu_user_entry(void)
 {
 	unsigned long tb =3D mftb();
-	struct cpu_accounting_data *acct =3D &local_paca->accounting;
+	struct cpu_accounting_data *acct =3D raw_get_accounting(current);
=20
 	acct->utime +=3D (tb - acct->starttime_user);
 	acct->starttime =3D tb;
 }
+
 static notrace inline void account_cpu_user_exit(void)
 {
 	unsigned long tb =3D mftb();
-	struct cpu_accounting_data *acct =3D &local_paca->accounting;
+	struct cpu_accounting_data *acct =3D raw_get_accounting(current);
=20
 	acct->stime +=3D (tb - acct->starttime);
 	acct->starttime_user =3D tb;
 }
=20
-#else
-#define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
-/*
- * Called from the context switch with interrupts disabled, to charge all
- * accumulated times to the current process, and to prepare accounting on
- * the next process.
- */
-static inline void arch_vtime_task_switch(struct task_struct *prev)
-{
-	struct cpu_accounting_data *acct =3D get_accounting(current);
-	struct cpu_accounting_data *acct0 =3D get_accounting(prev);
-
-	acct->starttime =3D acct0->starttime;
-}
-#endif
=20
 #endif /* __KERNEL__ */
 #else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
--=20
2.23.0

=
