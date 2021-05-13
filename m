Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E10BB380090
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 00:58:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh6XY6LYkz3bnT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 08:58:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FISfCtkd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FISfCtkd; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh6X469rmz2xvb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 08:58:26 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id k15so9925828pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 15:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ogPYkSXr3MBMxqRa1PY3uFIGRkoy7QfcNVTIWng8VMY=;
 b=FISfCtkd2uYDiLSbZsY7wVWXHVG8z4fzSYCfylF0wiNwHRz4kRFBKqPyCO0/WdXTfv
 o2v6XPWOoZH1rksVO0sZKlnpkc7nUeyHcV2l0S0YuMoleAq3NJKrl5UdnwGSEM0V/JJB
 wvPNieEd11E0PctdlHwSbqILUCMBv9zCEv0ZPTaZ2s/PReeLlDwkIGwYK0V7CLA3TjUU
 xb4L3u45JDZmz0iIumkbNQ3G7JHG+zwU58XbTjhoN+gaCpX3vd2OfjMJ/gad0Xqj1pQ1
 toMpqcvWjc3oDoCCjmj42tkQlALUJFjT3Q6H/k5o/6dfTPwzCb+3EExf1RCe6+cUA4Jt
 M/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ogPYkSXr3MBMxqRa1PY3uFIGRkoy7QfcNVTIWng8VMY=;
 b=sk2gL4CSR/8Ekgpeh0GB+4bB2d7JKUaX0CgV9Zrw8cPO1pJRGX4VrmBlGd6f4oAQyh
 x+P5Aysfh1w49uDDY+p1VAY0S8mZztq4kCBzhWxE8cluIYeeYD4eZrWwPe0Yq78Kw4c4
 Fa0xhjejeEWapTAAop28FYhmTK5eyLEy2lS9XTM/eKPs0/dhFDTBcDcmW/z7okdZU4BR
 g/4JXYYCa4NmOq3hoHyoSp+8Ycycm37Wqax0QopoxghcplDWXfaXE7Y9rHhBE0K5clVq
 XYYrJwsn0h+eqJkkMl6pv79bKtwxBgUBiG/fPou2Cmezw3+ze1lW0JbXkx1ovGhy3i3r
 Zh7A==
X-Gm-Message-State: AOAM530jUdjyj1qswgVUud7xFFzdpPbc2ouquqMYV4OGdi/ui4F61Juy
 OEFIYgo+81DYYyUvt7QIoeE=
X-Google-Smtp-Source: ABdhPJwdUViaWya9vV/+VSqn0MpzGb/OwkDA0b6ZxbfxR/H/o8ZRtJE+SV1bhW+oQybJs7Tdp+cTIw==
X-Received: by 2002:aa7:904e:0:b029:28f:da01:1a5f with SMTP id
 n14-20020aa7904e0000b029028fda011a5fmr42196028pfo.67.1620946702927; 
 Thu, 13 May 2021 15:58:22 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id j3sm2784666pfe.98.2021.05.13.15.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 15:58:22 -0700 (PDT)
Date: Fri, 14 May 2021 08:58:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Christian Zigotzky
 <chzigotzky@xenosoft.de>
References: <72e138cd-5201-a059-e8aa-cebc3db4029c@csgroup.eu>
 <65116250-6EEB-4419-8A7D-B0882379A68B@xenosoft.de>
 <c90ba856-1ef2-c010-17ac-a091c5252a5c@csgroup.eu>
 <781a426e-8561-108f-0e5c-9393bc653e86@xenosoft.de>
 <56899373-f821-62e2-26ab-b1a98b3fe2e2@csgroup.eu>
 <4175f794-f8b8-d9fc-620d-408317e27eba@xenosoft.de>
 <ea99d32a-b544-e813-8e0f-1719f3600ba9@csgroup.eu>
 <2f00463c-a87a-6dbc-037c-5a8996790d23@xenosoft.de>
In-Reply-To: <2f00463c-a87a-6dbc-037c-5a8996790d23@xenosoft.de>
MIME-Version: 1.0
Message-Id: <1620946444.gkflc9lqps.astroid@bobo.none>
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christian Zigotzky's message of May 14, 2021 6:20 am:
> On 13 May 2021 at 07:00pm, Christophe Leroy wrote:
>>
>> Ah yes, I remember this problem.
>>
>> Can you select CONFIG_VIRT_CPU_ACCOUNTING_GEN in your configuration ?
>>
>> Otherwise, I can try to fix the branch.
>>
>> Christophe
> I selected this. After that it compiles.
>=20
> 1. git bisect good - Xorg restarts again and again
>  =C2=A0=C2=A0=C2=A0 Output: [f9aa0ac1e9e82b60401ad567bdabc30598325bc1] Re=
vert=20
> "powerpc/64e/interrupt: use new interrupt return"
> 2. git bisect good - Xorg restarts again and again
>  =C2=A0=C2=A0=C2=A0 Output: [cd6d259a14704741bf0cd1dcadb84c0de22d7f77] Re=
vert=20
> "powerpc/64e/interrupt: always save nvgprs on interrupt"
> 3. git bisect bad - Xorg works
>  =C2=A0=C2=A0=C2=A0 Output: [9bfa20ef2ae54d3b9088dfbcde4ef97062cf5ef2] Re=
vert=20
> "powerpc/interrupt: update common interrupt code for"
> 4. git bisect good - Xorg restarts again and again
>  =C2=A0=C2=A0=C2=A0 Output:
>=20
> cd6d259a14704741bf0cd1dcadb84c0de22d7f77 is the first bad commit
> commit cd6d259a14704741bf0cd1dcadb84c0de22d7f77
> Author: Christophe Leroy <christophe.leroy@csgroup.eu>
> Date:=C2=A0=C2=A0 Thu May 13 09:52:06 2021 +0000
>=20
>  =C2=A0=C2=A0=C2=A0 Revert "powerpc/64e/interrupt: always save nvgprs on =
interrupt"
>=20
>  =C2=A0=C2=A0=C2=A0 This reverts commit 4228b2c3d20e9f80b847f809c38e6cf82=
864fa50.
>=20
> :040000 040000 156542c857ad72776b69bb67b2f244afeeb7abd3=20
> 92ea86ed097fce16238b0c2f2b343473894e4e8e M=C2=A0=C2=A0=C2=A0 arch

Thank you both very much for chasing this down.

I think I see the problem, it's clobbering r14 and r15 for some=20
interrupts. Something like this is required, I'll give it more
review and testing though.

Thanks,
Nick

---
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exc=
eptions-64e.S
index 7c3654b0d0f4..b91ef04f1ce2 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -535,6 +535,10 @@ __end_interrupts:
 				PROLOG_ADDITION_2REGS)
 	mfspr	r14,SPRN_DEAR
 	mfspr	r15,SPRN_ESR
+	std	r14,_DAR(r1)
+	std	r15,_DSISR(r1)
+	ld	r14,PACA_EXGEN+EX_R14(r13)
+	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x300)
 	b	storage_fault_common
=20
@@ -544,6 +548,10 @@ __end_interrupts:
 				PROLOG_ADDITION_2REGS)
 	li	r15,0
 	mr	r14,r10
+	std	r14,_DAR(r1)
+	std	r15,_DSISR(r1)
+	ld	r14,PACA_EXGEN+EX_R14(r13)
+	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x400)
 	b	storage_fault_common
=20
@@ -557,6 +565,10 @@ __end_interrupts:
 				PROLOG_ADDITION_2REGS)
 	mfspr	r14,SPRN_DEAR
 	mfspr	r15,SPRN_ESR
+	std	r14,_DAR(r1)
+	std	r15,_DSISR(r1)
+	ld	r14,PACA_EXGEN+EX_R14(r13)
+	ld	r15,PACA_EXGEN+EX_R15(r13)
 	EXCEPTION_COMMON(0x600)
 	b	alignment_more	/* no room, go out of line */
=20
@@ -565,10 +577,10 @@ __end_interrupts:
 	NORMAL_EXCEPTION_PROLOG(0x700, BOOKE_INTERRUPT_PROGRAM,
 				PROLOG_ADDITION_1REG)
 	mfspr	r14,SPRN_ESR
-	EXCEPTION_COMMON(0x700)
 	std	r14,_DSISR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
+	EXCEPTION_COMMON(0x700)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -725,11 +737,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	 * normal exception
 	 */
 	mfspr	r14,SPRN_DBSR
-	EXCEPTION_COMMON_CRIT(0xd00)
 	std	r14,_DSISR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXCRIT+EX_R14(r13)
 	ld	r15,PACA_EXCRIT+EX_R15(r13)
+	EXCEPTION_COMMON_CRIT(0xd00)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	DebugException
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -796,11 +808,11 @@ kernel_dbg_exc:
 	 * normal exception
 	 */
 	mfspr	r14,SPRN_DBSR
-	EXCEPTION_COMMON_DBG(0xd08)
 	std	r14,_DSISR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXDBG+EX_R14(r13)
 	ld	r15,PACA_EXDBG+EX_R15(r13)
+	EXCEPTION_COMMON_DBG(0xd08)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	DebugException
 	REST_NVGPRS(r1)
 	b	interrupt_return
@@ -931,11 +943,7 @@ masked_interrupt_book3e_0x2c0:
  * original values stashed away in the PACA
  */
 storage_fault_common:
-	std	r14,_DAR(r1)
-	std	r15,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r14,PACA_EXGEN+EX_R14(r13)
-	ld	r15,PACA_EXGEN+EX_R15(r13)
 	bl	do_page_fault
 	b	interrupt_return
=20
@@ -944,11 +952,7 @@ storage_fault_common:
  * continues here.
  */
 alignment_more:
-	std	r14,_DAR(r1)
-	std	r15,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r14,PACA_EXGEN+EX_R14(r13)
-	ld	r15,PACA_EXGEN+EX_R15(r13)
 	bl	alignment_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return


