Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AFA3818BC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 14:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fj4Vr6S1zz2yXB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 22:30:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VeKkxDXD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VeKkxDXD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fj4VM4G4gz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 22:30:19 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id E3D9D613D6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621081816;
 bh=NeHi7+eJzcOlUVbG+KLRozPCx3+RckN20zK2ftnO1mA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VeKkxDXD1wS9CpgUFx53cwEWyu3LTvnx4jUN2Xlea5CAyTq5nZFOYrARz+QrcaYaU
 ib5Q1RjACdGf64zAHui4ZHsDu7SRl+KoXgCGA6Si8AWWQgodR7/GLPtPqYiASP9loX
 m7iP9g7DzVe1mOjH3SdlzrKY86uROcv7tTa5+PYsKUQSIp9runVn0UBFnsf0lquhNK
 fQwUAMgjhIPjD5iU7C4f37nRFD8ucCTMcDHuo3GrM0+fhW8iBKNp8FGBzZ/F65VGJR
 NObkP88/HZ8L/7+CqbIJJHZHbUBeSuG7S0OsMJOHMfRNpUVhuDZK7Ney0mbRqZNPk3
 lC9qWChCMex2g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CE71761026; Sat, 15 May 2021 12:30:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] IRQ problems and crashes on a PowerMac G5 with 5.13-rc1
Date: Sat, 15 May 2021 12:30:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213079-206035-sa7WMAGeVS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213079-206035@https.bugzilla.kernel.org/>
References: <bug-213079-206035@https.bugzilla.kernel.org/>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D213079

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Hmm... Just also happened on 5.12.3. But without the Kernel panic (yet).

[...]
irq 63: nobody cared (try booting with the "irqpoll" option)
Call Trace:
CPU: 1 PID: 43491 Comm: emerge Tainted: G        W=20=20=20=20=20=20=20=20
5.12.3-gentoo-PowerMacG5 #2
[c00000000ffefae0] [c00000000053950c] .dump_stack+0xe0/0x13c (unreliable)
[c00000000ffefb80] [c0000000000ddb68] .__report_bad_irq+0x34/0xf0
[c00000000ffefc20] [c0000000000dda50] .note_interrupt+0x250/0x2f8
[c00000000ffefce0] [c0000000000d9cf8] .handle_irq_event_percpu+0x64/0x90
[c00000000ffefd70] [c0000000000d9d68] .handle_irq_event+0x44/0x70
[c00000000ffefe00] [c0000000000df164] .handle_fasteoi_irq+0xac/0x158
[c00000000ffefea0] [c0000000000d8db8] .generic_handle_irq+0x38/0x58
[c00000000ffeff10] [c000000000011314] .__do_irq+0x15c/0x238
[c00000000ffeff90] [c00000000001fe04] .call_do_irq+0x14/0x24
[c000000056e2fd70] [c00000000001154c] .do_IRQ+0x15c/0x164
[c000000056e2fe10] [c000000000007d38]
hardware_interrupt_common_virt+0x158/0x160
--- interrupt: 500 at 0x3fffb8a21520
handlers:
NIP:  00003fffb8a21520 LR: 00003fffb8a214a0 CTR: 00003fffb8ae6d20
REGS: c000000056e2fe80 TRAP: 0500   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.12.3-gentoo-PowerMacG5)
MSR:  900000000200f032 <SF,HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 42482824  XER:
20000000
IRQMASK: 0=20
GPR00: 00003fffb8a214a0 00003fffdb199650 00003fffb8df7200 000000014e8ddc60=
=20
GPR04: 00003fffb210e000 95bfd31b66b69e10 00003fffdb199478 0000000000024d50=
=20
GPR08: 000000014cb987c0 0000000000000002 0000000000000000 0000000000000000=
=20
GPR12: 00003fffb8ae0e50 00003fffb8eb4850 00003fffdb199a58 000000014e8ddf60=
=20
GPR16: 00003fffdb199a70 ffffffffffffffff 0000000000000001 000000014b5d8460=
=20
GPR20: 0000000000000000 0000000000000002 000000014e8ddf38 00003fffb6b176e8=
=20
GPR24: 000000014c126958 00003fffb2030390 000000014b94c380 000000014b5d8460=
=20
GPR28: 000000014c1267f0 000000014c126a60 000000014c1267f0 0000000000000000=
=20
NIP [00003fffb8a21520] 0x3fffb8a21520
LR [00003fffb8a214a0] 0x3fffb8a214a0
--- interrupt: 500
[<000000000e5af612>] .nvme_irq
[<000000000e5af612>] .nvme_irq
Disabling IRQ #63

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
