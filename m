Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795593D3A78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 14:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GWTck2YBwz30Fk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 22:47:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MDqSXcH5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MDqSXcH5; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GWTcD2Pzrz302d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 22:47:24 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FA1E60E53
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627044441;
 bh=+3BzHDAhAXr6s5R2Lj+cwbVgdxZOFZowZGflD8N5Dj8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MDqSXcH5GrpW496Qcp9HbuwSf0cwdVvMgPZ7CAW938idZrheJ8MtTpEqYKmiKjFo2
 TIANVhp+GeKI6oKmHakUmDKiLaBls4z8otrU9NoqRBGwOoxzfLU/Yt//94jsnuB+IS
 6F5gycatGC++4So1oA5WrR/M75JyywdoWxke5jWyAR8DW0vSo+DIwWBA9G3eIXLtlf
 li4e9dat1CYvUNAMRySpzkPI+Yo023toVaeWQdsIK5jtfYT8I1lW/nRaflorBFJOGl
 /lON1XynPr4lV3RwylXG7hkeci6nZZ6omc5pGFbfKnQpMI3488JUcMFZx2yB4ZD5QJ
 XloNGRsDqRp5g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 34D42603E1; Fri, 23 Jul 2021 12:47:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213079] [bisected] IRQ problems and crashes on a PowerMac G5
 with 5.12.3
Date: Fri, 23 Jul 2021 12:47:20 +0000
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
Message-ID: <bug-213079-206035-p4ivb7wGr9@https.bugzilla.kernel.org/>
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

--- Comment #15 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Oliver O'Halloran from comment #13)
> In the meanwhile, can you try the patch above? That seems to fix bug which
> is causing MSIs to be unusable. I'm not 100% sure why that woudld matter,
> but it's possible the crashes are due to some other bug which doesn't app=
ear
> when MSIs are in use.
Now I had time to test your patch on top of kernel 5.13-rc6 and 5.13.4. Can=
't
test it on top of 5.14-rc2 due to bug #213803.

Your patch seems to work fine and I don't get this "irq 63: nobody cared"
messages and crashes any longer! However now when building stuff the G5 soo=
ner
or later crashes with:

[...]
Kernel panic - not syncing: corrupted stack end detected inside scheduler
Call Trace:
CPU: 1 PID: 2968 Comm: powerpc64-unkno Tainted: G        W=20=20=20=20=20=
=20=20=20
5.13.0-rc6-PowerMacG5+ #2
[c0000000717178c0] [c0000000005412d0] .dump_stack+0xe0/0x13c (unreliable)
[c000000071717960] [c0000000000681a0] .panic+0x168/0x430
[c000000071717a10] [c000000000809ca0] .__schedule+0x80/0x840
[c000000071717af0] [c0000000000a0ea8] .do_task_dead+0x54/0x58
[c000000071717b70] [c00000000006e7b4] .do_exit+0xa14/0xa6c
[c000000071717c60] [c00000000006e89c] .do_group_exit+0x50/0xb0
[c000000071717cf0] [c00000000006e910] .__wake_up_parent+0x0/0x34
[c000000071717d60] [c000000000021530] .system_call_exception+0x1b4/0x1ec
[c000000071717e10] [c00000000000b9c4] system_call_common+0xe4/0x214
--- interrupt: c00 at 0x3fffa8092aa8
NIP:  00003fffa8092aa8 LR: 00003fffa7ff2d04 CTR: 0000000000000000
REGS: c000000071717e80 TRAP: 0c00   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.13.0-rc6-PowerMacG5+)
MSR:  900000000200f032 <SF,HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 22000482  XER:
00000000
IRQMASK: 0=20
GPR00: 00000000000000ea 00003fffd04ef2a0 00003fffa81b1300 0000000000000000=
=20
GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fffa8318c30 000000012e5ff800 00000001136b53b0=
=20
GPR16: 00000001200cec38 00003fffddea1c68 00000001200ceb28 000000000000002f=
=20
GPR20: 0000000000000000 00003fffa81abff8 0000000000000001 00003fffa81aaa58=
=20
GPR24: 0000000000000000 0000000000000000 0000000000000003 0000000000000001=
=20
GPR28: 0000000000000000 00003fffa8311c50 fffffffffffff000 0000000000000000=
=20
NIP [00003fffa8092aa8] 0x3fffa8092aa8
LR [00003fffa7ff2d04] 0x3fffa7ff2d04
--- interrupt: c00
Rebooting in 120 seconds..


Don't know whether this is related. I'll throw more debugging stuff in,  fi=
le
this as a seperate issue and link it here just in case.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
