Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FF919EF3B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:54:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wYWW4mK4zDr15
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:54:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=me/5NIBv; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wYTk2fLMzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 11:53:13 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id n10so6806878pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 18:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=SXNmSzR5dCwNc7/+tCsUjUE/EFRQc9Jf99e8qsmtQcE=;
 b=me/5NIBvO2lNB6Y0A1jhUtCoK1+T+/rgkm3YXt9oSeGy8v0G+3YBCqKT3p+13hjTKQ
 GkgNLcAQu5c7KE63P+RDnYtjmZmulP4U5V4S71QgcEfbYPn4GltpEFFq1CJX7Wp4fb6M
 eyzwM6AeuqdYUfWbMG9iIJL7Gu5TpQGkj6FX3Wv+/+JydxYuNBuMmDJ0OG6iFp9X5e4S
 PbnLja9dWFc7/pT2d2TfWV84PhsHTOXsTMzeiGNElukoiR2+7KULficc6UmGveDGobzJ
 898ZdO9LzU8pJcf+4w0jrk5AYdGe4pSqdkT891row6mVAFWfn7d66WvxzXFEoFZTCnqW
 i2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=SXNmSzR5dCwNc7/+tCsUjUE/EFRQc9Jf99e8qsmtQcE=;
 b=AIuX99VEYlWWnc3fE63hshljjaaOCCdgdRmanE9hSTUVsbkrysbyMk/BlCDv96DqX5
 XYx7VoHcmNK0Nk430Ns/jN3gUimNR6bkl2J74run+QsEHHzjSAr9TI7vJZNpoNt/+1sQ
 tzIYqLkB3fv6p+w49ZM5Z/LtPQkKOK9S0kBaVCqJcN9ssYFTtrbBoPkvEXYZ0BYQTY8X
 EYoQMpn5L1GOj1K4BnM7eAACmyx8NOFrF8dbwsl7cZLwTC8IyAdplm9331xbJSpn2hOG
 UqrwTGcIS+r+BlP/5Yn/pS7MYZqlFUdSB1//h2oNMzTuN1qNabv6vkuhg/W99hWGyAyM
 LhRA==
X-Gm-Message-State: AGi0PuY9IM0fEv+wBrPGitmJFvvndurlaJRoUzssYc2sufcNAKK+af/r
 gRQ1ZVQH7IFH/VYKPmkelgg=
X-Google-Smtp-Source: APiQypIUQ73BYUaXI5VN/wYOyBz4psD/SXPTd1t/o0utKbOCm/PL+Ibc7ghLCiW9/740ZWslhbUqew==
X-Received: by 2002:a63:fc24:: with SMTP id j36mr18103516pgi.397.1586137991685; 
 Sun, 05 Apr 2020 18:53:11 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id q8sm10636205pjq.28.2020.04.05.18.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 18:53:11 -0700 (PDT)
Date: Mon, 06 Apr 2020 11:52:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 06/13] powerpc/syscall: Make syscall_64.c buildable
 on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
 <923ab2df9d4a4d0f3a072421e054028c18d614d8.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <923ab2df9d4a4d0f3a072421e054028c18d614d8.1586108649.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1586137334.pcovkdryot.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on April 6, 2020 3:44 am:
> ifdef out specific PPC64 stuff to allow building
> syscall_64.c on PPC32.
>=20
> Modify Makefile to always build syscall.o
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/Makefile  |  5 ++---
>  arch/powerpc/kernel/syscall.c | 10 ++++++++++
>  2 files changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 8cc3c831dccd..e4be425b7718 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -45,11 +45,10 @@ obj-y				:=3D cputable.o syscalls.o \
>  				   signal.o sysfs.o cacheinfo.o time.o \
>  				   prom.o traps.o setup-common.o \
>  				   udbg.o misc.o io.o misc_$(BITS).o \
> -				   of_platform.o prom_parse.o
> +				   of_platform.o prom_parse.o syscall.o
>  obj-y				+=3D ptrace/
>  obj-$(CONFIG_PPC64)		+=3D setup_64.o sys_ppc32.o signal_64.o \
> -				   paca.o nvram_64.o firmware.o note.o \
> -				   syscall.o
> +				   paca.o nvram_64.o firmware.o note.o
>  obj-$(CONFIG_VDSO32)		+=3D vdso32/
>  obj-$(CONFIG_PPC_WATCHDOG)	+=3D watchdog.o
>  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+=3D hw_breakpoint.o
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.=
c
> index 72f3d2f0a823..28bd43db8755 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -25,8 +25,10 @@ notrace long system_call_exception(long r3, long r4, l=
ong r5,
>  	unsigned long ti_flags;
>  	syscall_fn f;
> =20
> +#ifdef CONFIG_PPC64
>  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>  		BUG_ON(irq_soft_mask_return() !=3D IRQS_ALL_DISABLED);
> +#endif
> =20
>  	trace_hardirqs_off(); /* finish reconciling */
> =20
> @@ -34,7 +36,9 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  		BUG_ON(!(regs->msr & MSR_RI));
>  	BUG_ON(!(regs->msr & MSR_PR));
>  	BUG_ON(!FULL_REGS(regs));
> +#ifdef CONFIG_PPC64
>  	BUG_ON(regs->softe !=3D IRQS_ENABLED);
> +#endif
> =20
>  	account_cpu_user_entry();
> =20
> @@ -56,7 +60,9 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  	 * frame, or if the unwinder was taught the first stack frame always
>  	 * returns to user with IRQS_ENABLED, this store could be avoided!
>  	 */
> +#ifdef CONFIG_PPC64
>  	regs->softe =3D IRQS_ENABLED;
> +#endif
> =20
>  	local_irq_enable();
> =20
> @@ -148,7 +154,9 @@ notrace unsigned long syscall_exit_prepare(unsigned l=
ong r3,
>  		ret |=3D _TIF_RESTOREALL;
>  	}
> =20
> +#ifdef CONFIG_PPC64
>  again:
> +#endif
>  	local_irq_disable();
>  	ti_flags =3D READ_ONCE(*ti_flagsp);
>  	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
> @@ -191,6 +199,7 @@ notrace unsigned long syscall_exit_prepare(unsigned l=
ong r3,
> =20
>  	/* This pattern matches prep_irq_for_idle */
>  	__hard_EE_RI_disable();
> +#ifdef CONFIG_PPC64
>  	if (unlikely(lazy_irq_pending())) {
>  		__hard_RI_enable();
>  		trace_hardirqs_off();
> @@ -201,6 +210,7 @@ notrace unsigned long syscall_exit_prepare(unsigned l=
ong r3,
>  	}
>  	local_paca->irq_happened =3D 0;
>  	irq_soft_mask_set(IRQS_ENABLED);
> +#endif
> =20
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  	local_paca->tm_scratch =3D regs->msr;
> --=20
> 2.25.0
>=20
>=20

The #ifdefs disappoint me!

Here is (unested) something that should help 32-bit avoid several ifdefs=20
in the main part of the function. I should have done this as part of the=20
merged series, but that's okay I'll submit as a cleanup.

The rest looks okay for now. Maybe we grow some helpers to manage the
soft-mask state, though I'm not really sure it would make sense for=20
32-bit code to ever call them. Maybe just confined to this file would be
okay but for now the ifdefs are okay.

---
 arch/powerpc/kernel/syscall_64.c | 58 +++++++++++++++-----------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall=
_64.c
index cf06eb443a80..f021db893ec2 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -103,6 +103,31 @@ notrace long system_call_exception(long r3, long r4, l=
ong r5,
 	return f(r3, r4, r5, r6, r7, r8);
 }
=20
+/*
+ * local irqs must be disabled. Returns false if the caller must re-enable
+ * them, check for new work, and try again.
+ */
+static notrace inline bool prep_irq_for_enabled_exit(void)
+{
+	/* This must be done with RI=3D1 because tracing may touch vmaps */
+	trace_hardirqs_on();
+
+	/* This pattern matches prep_irq_for_idle */
+	__hard_EE_RI_disable();
+	if (unlikely(lazy_irq_pending())) {
+		/* Took an interrupt, may have more exit work to do. */
+		__hard_RI_enable();
+		trace_hardirqs_off();
+		local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
+
+		return false;
+	}
+	local_paca->irq_happened =3D 0;
+	irq_soft_mask_set(IRQS_ENABLED);
+
+	return true;
+}
+
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -186,21 +211,10 @@ notrace unsigned long syscall_exit_prepare(unsigned l=
ong r3,
 		}
 	}
=20
-	/* This must be done with RI=3D1 because tracing may touch vmaps */
-	trace_hardirqs_on();
-
-	/* This pattern matches prep_irq_for_idle */
-	__hard_EE_RI_disable();
-	if (unlikely(lazy_irq_pending())) {
-		__hard_RI_enable();
-		trace_hardirqs_off();
-		local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
+	if (unlikely(!prep_irq_for_enabled_exit())) {
 		local_irq_enable();
-		/* Took an interrupt, may have more exit work to do. */
 		goto again;
 	}
-	local_paca->irq_happened =3D 0;
-	irq_soft_mask_set(IRQS_ENABLED);
=20
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch =3D regs->msr;
@@ -264,19 +278,11 @@ notrace unsigned long interrupt_exit_user_prepare(str=
uct pt_regs *regs, unsigned
 		}
 	}
=20
-	trace_hardirqs_on();
-	__hard_EE_RI_disable();
-	if (unlikely(lazy_irq_pending())) {
-		__hard_RI_enable();
-		trace_hardirqs_off();
-		local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
+	if (unlikely(!prep_irq_for_enabled_exit())) {
 		local_irq_enable();
 		local_irq_disable();
-		/* Took an interrupt, may have more exit work to do. */
 		goto again;
 	}
-	local_paca->irq_happened =3D 0;
-	irq_soft_mask_set(IRQS_ENABLED);
=20
 #ifdef CONFIG_PPC_BOOK3E
 	if (unlikely(ts->debug.dbcr0 & DBCR0_IDM)) {
@@ -334,13 +340,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(st=
ruct pt_regs *regs, unsign
 			}
 		}
=20
-		trace_hardirqs_on();
-		__hard_EE_RI_disable();
-		if (unlikely(lazy_irq_pending())) {
-			__hard_RI_enable();
-			irq_soft_mask_set(IRQS_ALL_DISABLED);
-			trace_hardirqs_off();
-			local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;
+		if (unlikely(!prep_irq_for_enabled_exit())) {
 			/*
 			 * Can't local_irq_restore to replay if we were in
 			 * interrupt context. Must replay directly.
@@ -354,8 +354,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(str=
uct pt_regs *regs, unsign
 			/* Took an interrupt, may have more exit work to do. */
 			goto again;
 		}
-		local_paca->irq_happened =3D 0;
-		irq_soft_mask_set(IRQS_ENABLED);
 	} else {
 		/* Returning to a kernel context with local irqs disabled. */
 		__hard_EE_RI_disable();
--=20
2.23.0

=
