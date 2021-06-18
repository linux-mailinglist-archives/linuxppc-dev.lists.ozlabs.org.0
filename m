Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCA23AD5E4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 01:30:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G6FXG2tMhz3c5N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Jun 2021 09:30:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MAmbaxQG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MAmbaxQG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G6FWj1X7Wz30CZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jun 2021 09:29:53 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id DA62361264
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624058989;
 bh=UXzkQQV8tsoJigMpTNH6aHY1TcqEDEu0eBqlMvSeUvY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MAmbaxQGSkqIGcCr4Of6PMzoJBP0MFjHXcB25biibcrMjVCYK390ASvKRy+ZrD9nn
 EzPzV8olRYgMnCZGORTusfK+fmHVn2gc7o3DtlsgbXJp86bQTL6r3RMxDRhJmDKOjk
 6/ussx6tNSH91VgduNq2GjIPxDSSGPdh0EDSzj0bJPKOJILrZWMvNzWNUi3Sblc5UD
 05xlKKSbXNVeXViJiW9JWOac+9hXj4EIBMnNG9fZmGy6hEkuRwecDq0pQnMENa7mgX
 9ert9fOQQF1GUWQN8pOm2IrOCvj9B7QBzWQrjWK8ME2juA5rdMNsEiY8MvqrP+3Zn5
 OCBnjNYmnvEfw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CC235611AD; Fri, 18 Jun 2021 23:29:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] [bisected] IRQ problems and crashes on a PowerMac G5
 with 5.12.3
Date: Fri, 18 Jun 2021 23:29:49 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213079-206035-Cum5GfgIUu@https.bugzilla.kernel.org/>
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

--- Comment #11 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297473
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297473&action=3Dedit
dmesg (5.13-rc6 + DEBUG_VM_PGTABLE, PowerMac G5 11,2)

The trace got some additional data with DEBUG_VM_PGTABLE=3Dy, slub_debug=3D=
P and
page_poison=3D1:

[...]
irq 63: nobody cared (try booting with the "irqpoll" option)
Call Trace:
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W=20=20=20=20=20=20=20=20
5.13.0-rc6-PowerMacG5+ #2
[c00000000fff7ae0] [c00000000054eafc] .dump_stack+0xe0/0x13c (unreliable)
[c00000000fff7b80] [c0000000000e1428] .__report_bad_irq+0x34/0xf0
[c00000000fff7c20] [c0000000000e1310] .note_interrupt+0x258/0x300
[c00000000fff7ce0] [c0000000000dd58c] .handle_irq_event_percpu+0x64/0x90
[c00000000fff7d70] [c0000000000dd5fc] .handle_irq_event+0x44/0x70
[c00000000fff7e00] [c0000000000e2a14] .handle_fasteoi_irq+0xac/0x158
[c00000000fff7ea0] [c0000000000dc648] .generic_handle_irq+0x38/0x58
[c00000000fff7f10] [c000000000011688] .__do_irq+0x15c/0x238
[c00000000fff7f90] [c00000000001207c] .do_IRQ+0x180/0x188
[c0000000012db810] [c000000000011f9c] .do_IRQ+0xa0/0x188
[c0000000012db8b0] [c000000000007f94]
hardware_interrupt_common_virt+0x1a4/0x1b0
--- interrupt: 500 at .power4_idle_nap+0x30/0x34
NIP:  c00000000002cc04 LR: c000000000016828 CTR: c000000000016768
REGS: c0000000012db920 TRAP: 0500   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.13.0-rc6-PowerMacG5+)
MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI>  CR: 44082242  XER: 00000000
IRQMASK: 0=20
GPR00: c0000000000167dc c0000000012dbbc0 c0000000012df700 0000000000000001=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000002 9000000000049032=
=20
GPR08: 0000000000000001 c0000000011b3b80 0000000000000001 0000000000000016=
=20
GPR12: 0000000044082242 c0000000023a6000 000000000014aa88 00000000ffb30100=
=20
GPR16: 0000000001e7b8da 0000000001e7bd5f 0000000001e7b9f0 0000000001e88d8d=
=20
GPR20: 0000000001e7bd3d 0000000001e7b98b 0000000001e7bbb2 0000000001e7b89c=
=20
GPR24: 000000000270f700 c000000001081008 c000000000a7c02d 0000000000000000=
=20
GPR28: c0000000012edb9c c0000000011b3b80 9000000000009032 c0000000012ed985=
=20
NIP [c00000000002cc04] .power4_idle_nap+0x30/0x34
LR [c000000000016828] .power4_idle+0xc0/0xe8
--- interrupt: 500
[c0000000012dbbc0] [c0000000000167dc] .power4_idle+0x74/0xe8 (unreliable)
handlers:
[c0000000012dbc40] [c00000000001665c] .arch_cpu_idle+0x80/0x18c
[c0000000012dbcc0] [c00000000081f058] .default_idle_call+0x7c/0xd0
[c0000000012dbd30] [c0000000000a7bcc] .do_idle+0x128/0x140
[c0000000012dbdd0] [c0000000000a7eb4] .cpu_startup_entry+0x28/0x2c
[c0000000012dbe40] [c000000000010044] .rest_init+0x1b0/0x1bc
[c0000000012dbec0] [c0000000010047f4] .start_kernel+0x934/0x9b8
[c0000000012dbf90] [c00000000000b390] start_here_common+0x1c/0x8c
[<000000001553d54b>] .nvme_irq
[<000000001553d54b>] .nvme_irq
Disabling IRQ #63

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
