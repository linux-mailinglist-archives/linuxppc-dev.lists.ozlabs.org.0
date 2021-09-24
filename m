Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB07417DBF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 00:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGRSZ3Xshz30Bl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Sep 2021 08:25:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sYx6kIAG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sYx6kIAG; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGRRq59Xwz2yPw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Sep 2021 08:25:11 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2655E6125F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632522309;
 bh=AbEK7rPbNYX9vdwO2HKtZKqB5Kyq65UNcMNiUEwHYa0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sYx6kIAGzIptqGxdVD4Ah3lIYFQMmfhIbLJDODmiWyAonoWq2yga3wz1YiXDyEg2k
 BFtXywCrUJ8MKHXeCLPUe9vHD0R0m1S77jFg/iT4zIVbK7iifex+KKok2PFxqdgzAB
 hxGKCyN9r5MwPsmZCdZhXz4jfuGDG6cj2J6llxbbliZYeHBPv1wPrjzYK0YiG6FT+2
 nX1HkaezQovyFGp/aLSw+1VlOwtE1Q0YzH2WWFsQtoYGQnJ6kSV+cMH9SY1b5ADQR0
 bl0pmuSuWRcxL5jlIPjGbraj5nzUKpwGhEnVLX0wk27y2nKn2RBz7TR9vXqLlHwS82
 6LTmvDM59TDiQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0F82E60FED; Fri, 24 Sep 2021 22:25:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Fri, 24 Sep 2021 22:25:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213837-206035-UVeEquN3So@https.bugzilla.kernel.org/>
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

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298963
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298963&action=3Dedit
dmesg (5.15-rc2 + patch, PowerMac G5 11,2) #1

Last stack trace with CONFIG_THREAD_SHIFT=3D14 however did reveal a bit more
data:

[...]
stack: c0000000023effb0: 00000000 28022284 00000000 00000000  ....(."......=
...
stack: c0000000023effc0: 00000000 00000c00 00003fff 94c95000  ..........?..=
.P.
stack: c0000000023effd0: 00000000 42000000 ffffffff ffffffea  ....B........=
...
stack: c0000000023effe0: 00000000 00000000 00000000 00000000  .............=
...
stack: c0000000023efff0: 00000000 00000000 00000000 00000000  .............=
...
Kernel panic - not syncing: corrupted stack end detected inside scheduler
CPU: 1 PID: 2652 Comm: cc1plus Tainted: G        W=20=20=20=20=20=20=20=20
5.15.0-rc2-PowerMacG5+ #4
Call Trace:
[c0000000023ef7f0] [c0000000005532d8] .dump_stack_lvl+0x98/0xe0 (unreliable)
[c0000000023ef880] [c000000000069538] .panic+0x14c/0x3e8
[c0000000023ef930] [c00000000081d5a0] .__schedule+0xc0/0x874
[c0000000023efa00] [c00000000081dea0] .preempt_schedule_common+0x28/0x48
[c0000000023efa80] [c00000000081deec] .__cond_resched+0x2c/0x50
[c0000000023efaf0] [c00000000029579c] .dput+0x40/0x218
[c0000000023efba0] [c000000000285204] .path_put+0x1c/0x34
[c0000000023efc20] [c00000000027eab8] .do_readlinkat+0xdc/0x124
[c0000000023efcf0] [c00000000027f310] .__se_sys_readlink+0x20/0x30
[c0000000023efd60] [c000000000022850] .system_call_exception+0x1ac/0x1e4
[c0000000023efe10] [c00000000000b4cc] system_call_common+0xec/0x250
--- interrupt: c00 at 0x3fff95335500
NIP:  00003fff95335500 LR: 00003fff95273f6c CTR: 0000000000000000
REGS: c0000000023efe80 TRAP: 0c00   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.15.0-rc2-PowerMacG5+)
MSR:  900000000200f032 <SF,HV,VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 28022284  XER:
00000000
IRQMASK: 0=20
GPR00: 0000000000000055 00003fffd5fb3600 00003fff95424300 00003fffd5fb4040=
=20
GPR04: 00003fffd5fb3b20 00000000000003ff 0000000062697473 000000002bcf8581=
=20
GPR08: ffffffffd4307a80 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fff95946430 00000000000003ff 00003fffd5fb4030=
=20
GPR16: 00003fffd5fb3b20 0000000000000000 00003fffd5fb3700 0000000000000000=
=20
GPR20: 000000000000002f 00003fffd5fb3b10 00003fff9593f7b8 00003fffd5fb4080=
=20
GPR24: 0000000000000004 00003fffd5fb3710 00003fffd5fb3b20 00003fffd5fb4040=
=20
GPR28: 00003fffd5fb4538 00003fffd5fb4084 00003fffd5fb4040 0000000000000000=
=20
NIP [00003fff95335500] 0x3fff95335500
LR [00003fff95273f6c] 0x3fff95273f6c
--- interrupt: c00
Rebooting in 40 seconds..

And another one:
[...]
stack: c00000002cd77fb0: 00000000 28042822 00000000 00000000  ....(.(".....=
...
stack: c00000002cd77fc0: 00000000 00000c00 00003fff 9b2dd000  ..........?..=
-..
stack: c00000002cd77fd0: 00000000 42000000 00000000 00000000  ....B........=
...
stack: c00000002cd77fe0: 00000000 00000000 00000000 00000000  .............=
...
stack: c00000002cd77ff0: 00000000 00000000 00000000 00000000  .............=
...
Kernel panic - not syncing: corrupted stack end detected inside scheduler
CPU: 1 PID: 2713 Comm: cc1plus Tainted: G        W=20=20=20=20=20=20=20=20
5.15.0-rc2-PowerMacG5+ #4
Call Trace:
[c00000002cd76dd0] [c0000000005532d8] .dump_stack_lvl+0x98/0xe0 (unreliable)
[c00000002cd76e60] [c000000000069538] .panic+0x14c/0x3e8
[c00000002cd76f10] [c00000000081d5a0] .__schedule+0xc0/0x874
[c00000002cd76fe0] [c00000000081dea0] .preempt_schedule_common+0x28/0x48
[c00000002cd77060] [c00000000081deec] .__cond_resched+0x2c/0x50
[c00000002cd770d0] [c000000000327848] .__ext4_handle_dirty_metadata+0x24/0x=
214
[c00000002cd771a0] [c000000000352a6c] .ext4_mb_mark_diskspace_used+0x3e0/0x=
41c
[c00000002cd77290] [c000000000355ae4] .ext4_mb_new_blocks+0x580/0xe10
[c00000002cd773b0] [c00000000033b2f0] .ext4_ind_map_blocks+0x63c/0xb28
[c00000002cd775a0] [c000000000342bf4] .ext4_map_blocks+0x37c/0x588
[c00000002cd77680] [c000000000342e64] ._ext4_get_block+0x64/0xec
[c00000002cd77730] [c0000000002c36a4] .__block_write_begin_int+0x188/0x4a4
[c00000002cd77850] [c0000000003480f8] .ext4_write_begin+0x2a8/0x3d0
[c00000002cd77970] [c0000000001c9170] .generic_perform_write+0xb8/0x1f4
[c00000002cd77a60] [c000000000333d68] .ext4_buffered_write_iter+0xb8/0x154
[c00000002cd77b00] [c000000000277a14] .new_sync_write+0x94/0xe8
[c00000002cd77c00] [c000000000278d6c] .vfs_write+0x13c/0x140
[c00000002cd77ca0] [c000000000278eb4] .ksys_write+0x78/0xc4
[c00000002cd77d60] [c000000000022850] .system_call_exception+0x1ac/0x1e4
[c00000002cd77e10] [c00000000000b4cc] system_call_common+0xec/0x250
--- interrupt: c00 at 0x3fff9b804b00
NIP:  00003fff9b804b00 LR: 00003fff9b780d04 CTR: 0000000000000000
REGS: c00000002cd77e80 TRAP: 0c00   Tainted: G        W=20=20=20=20=20=20=
=20=20=20
(5.15.0-rc2-PowerMacG5+)
MSR:  900000000200d032 <SF,HV,VEC,EE,PR,ME,IR,DR,RI>  CR: 28042822  XER:
00000000
IRQMASK: 0=20
GPR00: 0000000000000004 00003fffe21d3000 00003fff9b8f6300 0000000000000001=
=20
GPR04: 0000000026979780 0000000000001000 0000000000000001 0000000000000036=
=20
GPR08: 000000002697a780 0000000000000000 0000000000000000 0000000000000000=
=20
GPR12: 0000000000000000 00003fff9be17430 00000000100f1858 0000000010063a50=
=20
GPR16: 00000000100639f8 0000000010063968 000000012e83eb28 0000000000000000=
=20
GPR20: ffffffffffffffff 0000000011a5b890 0000000000000001 00000000114e5160=
=20
GPR24: 00000000114e5170 0000000000000000 0000000026979780 0000000000001000=
=20
GPR28: 0000000000001000 00003fff9b8f0920 0000000026979780 0000000000001000=
=20
NIP [00003fff9b804b00] 0x3fff9b804b00
LR [00003fff9b780d04] 0x3fff9b780d04
--- interrupt: c00
Rebooting in 40 seconds..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
