Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA540101B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Sep 2021 16:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H2YPd3YJQz2xtg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 00:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sqYXcACf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sqYXcACf; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H2YNn73L3z2xrP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 00:11:21 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id BA817600D4
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Sep 2021 14:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630851077;
 bh=2e4wBmkR2/x8UGcQpsIMESKnFV45FAbYRQXYMnHZNgE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sqYXcACfR0m1IFTX5mauV1KYVSdYrRth+XRwsE8lcuPAj4qSKYXrU3/l23UilTTru
 DQSbkOczlHF/xzTZ7/6dXoImvppJRcoC78+XiUK8nYDkg0vz9VZGXTDtA/Uhgsd1lL
 Wklb/44jGflqcDsoMXWgvDWP+JGmpKGI7pH+2cdyic7AUDlqQ0rIvHuUDQgIUpXwI1
 45gxLPFt8k1HBCguEqR+OhYUwlA2vMuZ9hoUiR0G/buQZ1Ap63mpovLEfErG/Ql2e8
 vxdbDk9vbxU6nK76ykEr/gFMQitluSv++7K6qXFA2vIPTh1gL+3Ade77rVm28a7+aD
 twqw3ZU8vbziQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AFB3060F39; Sun,  5 Sep 2021 14:11:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Sun, 05 Sep 2021 14:11:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: see_also
Message-ID: <bug-213837-206035-BEt4KJvSST@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213837-206035@https.bugzilla.kernel.org/>
References: <bug-213837-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213837

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           See Also|https://bugzilla.kernel.org |
                   |/show_bug.cgi?id=3D213079     |

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Checked out whether this has really something to do with bug #213079 or not=
 by
copying this root partition to a regular HDD and use that one instead. As t=
he
issue still happens it seems these are two seperate bugs.

[...]
Kernel panic - not syncing: corrupted stack end detected inside scheduler
CPU: 1 PID: 1509 Comm: powerpc64-unkno Tainted: G        W=20=20=20=20=20=
=20=20=20
5.14.1-PowerMacG5+ #2
Call Trace:
[c0000000386434c0] [c00000000054cd64] .dump_stack_lvl+0x98/0xe0 (unreliable)
[c000000038643550] [c000000000068ab8] .panic+0x160/0x40c
[c000000038643600] [c00000000081202c] .__schedule+0x7c/0x840
[c0000000386436d0] [c00000000081293c] .preempt_schedule_common+0x28/0x48
[c000000038643750] [c00000000081298c] .__cond_resched+0x30/0x4c
[c0000000386437d0] [c0000000004edf18] .copy_page_to_iter+0xbc/0x32c
[c0000000386438a0] [c0000000001c99d8] .filemap_read+0x574/0x618
[c000000038643a60] [c00000000033182c] .ext4_file_read_iter+0xb8/0x11c
[c000000038643b00] [c000000000272f1c] .new_sync_read+0x94/0xe0
[c000000038643c00] [c0000000002746c0] .vfs_read+0x128/0x12c
[c000000038643ca0] [c000000000274a58] .ksys_read+0x78/0xc4
[c000000038643d60] [c000000000022808] .system_call_exception+0x1a4/0x1dc
[c000000038643e10] [c00000000000b4cc] system_call_common+0xec/0x250
--- interrupt: c00 at 0x3fffbc477cd0
NIP:  00003fffbc477cd0 LR: 000000011c413660 CTR: 0000000000000000
REGS: c000000038643e80 TRAP: 0c00   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.14.1-PowerMacG5+)
MSR:  900000000200f032 <SF,HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 24000422  XER:
00000000
IRQMASK: 0=20
GPR00: 0000000000000003 00003fffd3c43d70 00003fffbc4a4f00 0000000000000004=
=20
GPR04: 00003fffbbfac010 00000000001e7697 00003fffbc458320 0000000000000000=
=20
GPR08: 00003fffbc4582e0 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fffbc54ec20 00000001470b79c0 0000000157c21760=
=20
GPR16: 000000011c41ec38 00003fffd3c44258 000000011c41eb28 00003fffd3c440a8=
=20
GPR20: 00003fffd3c44460 ffffffffffffffff 00000001470b6dd0 0000000000000000=
=20
GPR24: 00000001470b77f0 00000001470b7d30 0000000000000005 00003fffd3c43fc0=
=20
GPR28: 000000011c4668e8 0000000000000004 00003fffbbfac010 00000000001e7697=
=20
NIP [00003fffbc477cd0] 0x3fffbc477cd0
LR [000000011c413660] 0x11c413660
--- interrupt: c00
Rebooting in 40 seconds..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
