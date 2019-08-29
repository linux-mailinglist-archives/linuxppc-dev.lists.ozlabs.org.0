Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22DA1516
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 11:41:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JyLM1CNgzDrP5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 19:41:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pLKu+BvP"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JyJ12d6QzDrNk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 19:39:44 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w11so1330226plp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 02:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=X/x/eEOUoWL9LyquLa5BVPevtAETeVnk7JAf/dM/W/E=;
 b=pLKu+BvPGMQxe6/jedH6q3XjKP1eNA/QSHpKrFkToawhX5tCEgIkriVRAGnFNhwfeY
 VI6NDFOd0BVtVXCGH+o9LeF2o6edahjAdLMoZ/4ga2gRcRHsx6+rY9WMgJH3UxHBHF3o
 Ee/DSVtZdr9VwPZ5U6agx6HVdVgsgqPnCXGCxPtqaG4liEuencUKAQq9aC41mrApNg2I
 T3PLMZZyY3x+08yXBvwg+wIOFCeBjIS1F9ryhQnUDNWoCS90x4a/TKruUg1n0eh1Jdjw
 y/n8sOGqeH+HW70NfLJh257xwtpyqjTgjArB9UJuBVhhKL2DsXaYO0zNf2iNcHMDUFse
 TK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=X/x/eEOUoWL9LyquLa5BVPevtAETeVnk7JAf/dM/W/E=;
 b=uS2punrB0EtbI+S5AlPq81xe+TiIwIUdBqpqv8PpwErfmh8sRl9J8fEqBvIgwjc7uF
 OqusSDFul5xQleW0xk1f7Foz69X2HqxDuK6/D/VpcEjsx65mTfWjGfepdn0Q9T2XF/C1
 WD+kkMeDO2xAm5MojgvfvWrh0F5AStxCqwaRas2CpX+QWmGYapegTnIft5/mE1ZEVc6m
 k3rVBxryHqs+pwfWm0mBZXMGqUdrpxDD95aLgA5RAaGyyRud/CvHhAYv2epF/w4L3OOd
 yJsTVvZ12ISq3eDMFAO6BK3vggPe6f6edul2f0jK9xA5q8QJCRYmKPYtHiTXHW9XWfrb
 Cb8w==
X-Gm-Message-State: APjAAAWTJw0OIXiJqhujFATt2A47MiEJIzWtMioW8M5OeEZoIf9U1LwQ
 SWnVTJlECOaCRywDzlVV9BA=
X-Google-Smtp-Source: APXvYqwAsNJm37niYmyhJN8K+gJ6kwSWfMGIio2hw2VFBthtarg9K33rQ1/SDTDkXelfqz3Q1Bb1Iw==
X-Received: by 2002:a17:902:9349:: with SMTP id
 g9mr8751136plp.262.1567071581634; 
 Thu, 29 Aug 2019 02:39:41 -0700 (PDT)
Received: from localhost (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id p2sm3761765pfb.122.2019.08.29.02.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 02:39:40 -0700 (PDT)
Date: Thu, 29 Aug 2019 19:38:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] powerpc/64: syscalls in C
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827135548.21457-1-npiggin@gmail.com>
 <5ecd9d1a-d35e-dc8c-9ad4-a830a8b1a952@c-s.fr>
 <1566985278.ehbnos9t6c.astroid@bobo.none>
 <4d0359d8-0958-583f-7727-10a51bd3c7c6@c-s.fr>
In-Reply-To: <4d0359d8-0958-583f-7727-10a51bd3c7c6@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567070800.hlilai6sy6.astroid@bobo.none>
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

Christophe Leroy's on August 28, 2019 7:55 pm:
>=20
>=20
> Le 28/08/2019 =C3=A0 11:49, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Christophe Leroy's on August 28, 2019 7:06 pm:
>>>
>>>
>>> Le 27/08/2019 =C3=A0 15:55, Nicholas Piggin a =C3=A9crit=C2=A0:
>>>> Accounted for some feedback.
>>>>
>>>> Nicholas Piggin (4):
>>>>     powerpc: convert to copy_thread_tls
>>>>     powerpc/64: remove support for kernel-mode syscalls
>>>>     powerpc/64: system call remove non-volatile GPR save optimisation
>>>>     powerpc/64: system call implement the bulk of the logic in C
>>>
>>> Would it be possible to split in the following parts:
>>>
>>> 1/ Implement in C whatever can be implemented without removing
>>> non-volatile GPR save optimisation
>>> 2/ Remove non-volatile GPR save optimisation
>>> 3/ Implement in C everything else
>>=20
>> Hmm. I'll have a look but I would rather not go back and add the
>> intermediate state I was hoping to avoid. I'll think about it and
>> if it's not too difficult I will try to add something. I have an
>> idea.
>>=20
>> With your nvregs performance test on ppc32, are you doing the
>> nvgpr restore? The fast path should be able to avoid that.
>=20
> I only added the SAVE_NVGPRS call in the syscall entry macro just after=20
> the saving of volatile regs, and changed the trap from \trapno+1 to \trap=
no

So... this actually seems to work. Haven't booted it, but the compiler
seems to do what we want.

This may be the way to go for ppc32 I think. I had a look at various=20
ways you could save nvgprs with some early tests and returning early=20
from the C call if it hits trouble without all registers saved. Most of=20
it becomes quite ugly.

Thanks,
Nick

diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall=
_64.c
index d42519b86ddd..b11346447882 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -14,6 +14,52 @@ extern void __noreturn tabort_syscall(void);
=20
 typedef long (*syscall_fn)(long, long, long, long, long, long);
=20
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
+
+static inline void save_nvgprs(struct pt_regs *regs)
+{
+	if (!(regs->trap & 1))
+		return;
+
+	regs->gpr[14] =3D r14;
+	regs->gpr[15] =3D r15;
+	regs->gpr[16] =3D r16;
+	regs->gpr[17] =3D r17;
+	regs->gpr[18] =3D r18;
+	regs->gpr[19] =3D r19;
+	regs->gpr[20] =3D r20;
+	regs->gpr[21] =3D r21;
+	regs->gpr[22] =3D r22;
+	regs->gpr[23] =3D r23;
+	regs->gpr[24] =3D r24;
+	regs->gpr[25] =3D r25;
+	regs->gpr[26] =3D r26;
+	regs->gpr[27] =3D r27;
+	regs->gpr[28] =3D r28;
+	regs->gpr[29] =3D r29;
+	regs->gpr[30] =3D r30;
+	regs->gpr[31] =3D r31;
+
+	regs->trap &=3D 0x1;
+}
+
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, lo=
ng r8, unsigned long r0, struct pt_regs *regs)
 {
 	unsigned long ti_flags;
@@ -66,6 +112,7 @@ long system_call_exception(long r3, long r4, long r5, lo=
ng r6, long r7, long r8,
 		 * do_syscall_trace_enter() returns an invalid syscall number
 		 * and the test below against NR_syscalls will fail.
 		 */
+		save_nvgprs(regs);
 		r0 =3D do_syscall_trace_enter(regs);
 	}
=20
@@ -132,6 +179,7 @@ unsigned long syscall_exit_prepare(unsigned long r3, st=
ruct pt_regs *regs)
 		if (ti_flags & _TIF_NEED_RESCHED) {
 			schedule();
 		} else {
+			save_nvgprs(regs);
 			/*
 			 * SIGPENDING must restore signal handler function
 			 * argument GPRs, and some non-volatiles (e.g., r1).
=
