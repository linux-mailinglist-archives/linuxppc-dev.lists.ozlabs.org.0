Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 310203F240E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 02:13:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrMY00gVtz3bhp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 10:13:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZJbsTj1x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZJbsTj1x; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrMXF5tLLz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 10:12:29 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 89AA7601FD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 00:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629418345;
 bh=Ne1SzyvHdxWEyCw3Jur4wNVLlOTVsja+Od+Db2m4baM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZJbsTj1xGLERyadfaYcfJFcSR/7W4ZxJm0BzW+PyX+hLrauDzrhAgHHhSH5IooISv
 bIbTc4v7qcvZbrUPKJugAXLEivkmCdVYqSFyZEizH8UrRamCImUlEXIC0+/YXbLHkC
 /FxcU+8N3TIFXUShmGxX7VfyigUj6htLuI6vbQ0QT1Dv2Qty9VCTYDwYP0dLMtLtlJ
 JwSQdJIkQbG8CuY7Icb0TSOFQAIIM+BGD2v7FNNs/0zSM7LUeMSNyd1BQ+rFlzPD2a
 srVtxdMHB9K8+39M4D+5aTW7+mhatXEJA04tmxMmWpQaQ7tTjfR5PpOWGvNsTl2ydv
 R1RptH2Sxl+fA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7C2AC60F6E; Fri, 20 Aug 2021 00:12:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] [bisected] IRQ problems and crashes on a PowerMac G5
 with 5.12.3
Date: Fri, 20 Aug 2021 00:12:24 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-213079-206035-IH0Hx5AIPj@https.bugzilla.kernel.org/>
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

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #297473|0                           |1
        is obsolete|                            |

--- Comment #16 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298371
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298371&action=3Dedit
dmesg (5.14-rc6, PowerMac G5 11,2)

As there is a fix now for bug #213803 I was able to build v5.14-rc6 and gav=
e it
a testride. Looks like the issue persists:

[...]
irq 63: nobody cared (try booting with the "irqpoll" option)
CPU: 0 PID: 10732 Comm: emerge Tainted: G        W=20=20=20=20=20=20=20=20
5.14.0-rc6-PowerMacG5+ #2
Call Trace:
[c00000000fff7af0] [c00000000054de24] .dump_stack_lvl+0x98/0xe0 (unreliable)
[c00000000fff7b80] [c0000000000e1724] .__report_bad_irq+0x34/0xf0
[c00000000fff7c20] [c0000000000e160c] .note_interrupt+0x258/0x300
[c00000000fff7ce0] [c0000000000dd840] .handle_irq_event_percpu+0x5c/0x88
[c00000000fff7d70] [c0000000000dd8b0] .handle_irq_event+0x44/0x70
[c00000000fff7e00] [c0000000000e2d34] .handle_fasteoi_irq+0xac/0x158
[c00000000fff7ea0] [c0000000000dc8bc] .handle_irq_desc+0x34/0x54
[c00000000fff7f10] [c000000000012058] .__do_irq+0x15c/0x238
[c00000000fff7f90] [c000000000012978] .__do_IRQ+0xac/0xb4
[c00000001e9cfcf0] [c00000001e9cfd90] 0xc00000001e9cfd90
[c00000001e9cfd90] [c000000000012ac4] .do_IRQ+0x144/0x194
[c00000001e9cfe10] [c000000000008050]
hardware_interrupt_common_virt+0x210/0x220
--- interrupt: 500 at 0x3fffb9b25d9c
NIP:  00003fffb9b25d9c LR: 00003fffb9b2811c CTR: 00003fffb9b25d9c
REGS: c00000001e9cfe80 TRAP: 0500   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.14.0-rc6-PowerMacG5+)
MSR:  900000000000f032 <SF,HV,EE,PR,FP,ME,IR,DR,RI>  CR: 22482822  XER:
20000000
IRQMASK: 0=20
GPR00: 00003fffb9b28100 00003ffffd4e7550 00003fffb9ef6200 00003fffb7977790=
=20
GPR04: 00003fffb7977790 00003fffb55e8b80 0000000000000000 00003fffb9eccac0=
=20
GPR08: 00003fffb9b25d9c 0000000000000000 000000000000000f 0000000000000000=
=20
GPR12: 00003fffb9b7eeb0 00003fffb9fc8890 00003ffffd4e7658 00003fffb395c548=
=20
GPR16: 00003ffffd4e7670 ffffffffffffffff 00003fffb7902480 ffffffffffffffff=
=20
GPR20: 0000000000000000 00003fffb395c528 000000014b8f7878 0000000000000000=
=20
GPR24: 00003fffb7969a80 000000014b8f7830 00003fffb7a750d0 000000000000000a=
=20
GPR28: 00003fffb7a750dc 000000000000007c 000000014b8f9420 00003fffb395c3c0=
=20
NIP [00003fffb9b25d9c] 0x3fffb9b25d9c
LR [00003fffb9b2811c] 0x3fffb9b2811c
--- interrupt: 500
handlers:
[<c0000000015a6568>] .nvme_irq
[<c0000000015a6568>] .nvme_irq
Disabling IRQ #63

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
