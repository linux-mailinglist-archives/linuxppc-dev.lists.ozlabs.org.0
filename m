Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C91F537043
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 10:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L9rjt2hR2z3blf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 May 2022 18:07:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpTAcgW7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jpTAcgW7;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L9rj72vCgz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 18:06:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 303D160C48
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 08:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 959E5C385A9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 May 2022 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653811591;
	bh=Zgl1uMnbRrbj8wxzajN5ocD+SCeNmbKXWtlvUJISr5U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jpTAcgW7i2FDXJFHJ1erIOV5WOF+ojz/sHbLXRw+RZqxu0uZDCqDs6i+jOSfXY1wC
	 /VPnPKOlUnqXplyw6pOoZ6hNTYel5vkQeL62We25vBOJ3PRE5W2krMmb4QR/aAHoC6
	 xnQ+BnbIj0FLlYbCnury/kev3i9ZQHk2Tahn6OD82tCr9QtpT287wFaevQ8bmDiwwi
	 LDm6j769udULlw3WU9CqS3OOjuE+U8rhNOPYGPW9N1lqAKTF5waClzY9d1T8ngOP4h
	 oZsswgM62xBf9e0+2eZRvoszQE/ZV0XXrCV1e1zCXrMuUDT0IrH6P27/RR5Nm1aRpp
	 Cw0r5cHTGCbQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7800AC05FD2; Sun, 29 May 2022 08:06:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 216041] Stack overflow at boot (do_IRQ: stack overflow: 1984)
 on a PowerMac G4 DP, KASAN debug build
Date: Sun, 29 May 2022 08:06:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-32
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@csgroup.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-32@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216041-206035-yw3rav3C9j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216041-206035@https.bugzilla.kernel.org/>
References: <bug-216041-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216041

--- Comment #5 from Christophe Leroy (christophe.leroy@csgroup.eu) ---
There is an interrupt, that needs too looked at a bit deeper:

[eaa1c7a0] [c07d0bd4] dump_stack_lvl+0x60/0x90
[eaa1c7c0] [c0009234] __do_IRQ+0x170/0x174
[eaa1c800] [c0009258] do_IRQ+0x20/0x34
[eaa1c820] [c00045b4] HardwareInterrupt_virt+0x108/0x10c

The interesting part is __do_IRQ() :

void __do_IRQ(struct pt_regs *regs)
{
        struct pt_regs *old_regs =3D set_irq_regs(regs);
        void *cursp, *irqsp, *sirqsp;

        /* Switch to the irq stack to handle this */
        cursp =3D (void *)(current_stack_pointer & ~(THREAD_SIZE - 1));
        irqsp =3D hardirq_ctx[raw_smp_processor_id()];
        sirqsp =3D softirq_ctx[raw_smp_processor_id()];

        check_stack_overflow();

        /* Already there ? */
        if (unlikely(cursp =3D=3D irqsp || cursp =3D=3D sirqsp)) {
                __do_irq(regs);
                set_irq_regs(old_regs);
                return;
        }
        /* Switch stack and call */
        call_do_irq(regs, irqsp);

        set_irq_regs(old_regs);
}

The dump_stack() we see in the call trace is from check_stack_overflow(),
following the message "do_IRQ: stack overflow: 1984", because the stack dro=
pped
below 0xeaa1c800

check_stack_overflow() function emits a warning and a stack dump when
CONFIG_DEBUG_STACKOVERFLOW is selected and only 2kbytes remain available on=
 the
stack.

But here we get an Oops when the stack reaches 0xeaa1c000. Seems like the
2kbytes limit it not enough to properly perform the stack dump.

Commit 547db12fd8a0 ("powerpc/32: Use vmapped stacks for interrupts") doesn=
't
remove IRQ stacks. It change the IRQ stacks allocation from kmalloc to vmal=
loc.

Here we are stillon the original stack. The switch to the IRQ stack is
performed by call_do_irq().

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
