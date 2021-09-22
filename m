Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6BD414D0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 17:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF2QT579Fz3081
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 01:34:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AQMyvC3e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AQMyvC3e; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF2Pn65g4z2yHS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 01:33:33 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 14B0E611CA
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632324811;
 bh=zgMtdOpd/aGknfzHKioiiyl9LMQtACQesrYoW3Qt+xY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AQMyvC3ef/8avIMZWl243qeag5cJg/hYpk6Ugs9qjaflLjY0/QAkmr/qvpduS//Ff
 uJlPTzaOz/TcZC7OP12XP9oWUo8Zdc4duu6+ZxqJbbUWm6AiMctxU5jC4f79fYJOeR
 sOQmqyb/oNxmPeja96mpplk0qZd1FjGPNpx7LFQea36x2UdOH9DwshKPPlWYJRKByp
 f8EV0rTahWPN098kgPW0DxUT2/1KaDDgz1eC2us4fFBw7PtxVwtCPutMiiJNvlF1+D
 WzB+jSMGKkN9sc6riCbp8g8d+QhvO//m24lYSavohv7jFUxksa6cI0JaNaI15f26I0
 vNPyngOjvFwrQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F1DE760FA0; Wed, 22 Sep 2021 15:33:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Wed, 22 Sep 2021 15:33:30 +0000
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
Message-ID: <bug-213837-206035-ilyQ6qrWP6@https.bugzilla.kernel.org/>
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

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298919
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298919&action=3Dedit
dmesg (5.15-rc2 + patch, PowerMac G5 11,2)

(In reply to mpe from comment #6)
> Can you try this patch, it might help us work out what is corrupting the
> stack.
With your patch applied to recent v5.15-rc2 the output looks like this:

[...]
stack corrupted? stack end =3D 0xc000000029fdc000
stack: c000000029fdbc00: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ.....=
...
stack: c000000029fdbc10: 00000ddc 7c000010 cccccccc cccccccc  ....|........=
...
stack: c000000029fdbc20: 29fc4e41 673d4bb3 5a5a5a5a 5a5a5a5a  ).NAg=3DK.ZZZ=
ZZZZZ
stack: c000000029fdbc30: cccccccc cccccccc 00000ddc 8e000010  .............=
...
stack: c000000029fdbc40: cccccccc cccccccc 41fc4e41 673d41a3  ........A.NAg=
=3DA.
stack: c000000029fdbc50: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ.....=
...
stack: c000000029fdbc60: 00000ddc 8e00000c cccccccc cccccccc  .............=
...
stack: c000000029fdbc70: 79fc4e41 673d4dab 5a5a5a5a 5a5a5a5a  y.NAg=3DM.ZZZ=
ZZZZZ
stack: c000000029fdbc80: cccccccc cccccccc 00000ddc 90000008  .............=
...
stack: c000000029fdbc90: cccccccc cccccccc 91fc4e41 673d4573  ..........NAg=
=3DEs
stack: c000000029fdbca0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ.....=
...
stack: c000000029fdbcb0: 00000dd7 ac000016 cccccccc cccccccc  .............=
...
stack: c000000029fdbcc0: c9fc4e41 673d4203 5a5a5a5a 5a5a5a5a  ..NAg=3DB.ZZZ=
ZZZZZ
stack: c000000029fdbcd0: cccccccc cccccccc 00000ddc 6c000004  ............l=
...
stack: c000000029fdbce0: cccccccc cccccccc e1fc4e41 673d474b  ..........NAg=
=3DGK
stack: c000000029fdbcf0: 5a5a5a5a 5a5a5a5a cccccccc cccccccc  ZZZZZZZZ.....=
...
stack: c000000029fdbd00: 00000ddc 88000000 cccccccc cccccccc  .............=
...
stack: c000000029fdbd10: 19fd4e41 673d4143 5a5a5a5a 5a5a5a5a  ..NAg=3DACZZZ=
ZZZZZ
[...]
stack: c000000029fdffd0: 00000000 00000000 00000000 00000000  .............=
...
stack: c000000029fdffe0: 00000000 00000000 00000000 00000000  .............=
...
stack: c000000029fdfff0: 00000000 00000000 00000000 00000000  .............=
...
Kernel panic - not syncing: corrupted stack end detected inside scheduler
CPU: 0 PID: 686 Comm: kworker/u4:0 Tainted: G        W=20=20=20=20=20=20=20=
=20
5.15.0-rc2-PowerMacG5+ #2
Workqueue: writeback .wb_workfn (flush-254:1)
Call Trace:
[c000000029fdf400] [c0000000005532c8] .dump_stack_lvl+0x98/0xe0 (unreliable)
[c000000029fdf490] [c000000000069534] .panic+0x14c/0x3e8
[c000000029fdf540] [c00000000081d598] .__schedule+0xc0/0x874
[c000000029fdf610] [c00000000081de98] .preempt_schedule_common+0x28/0x48
[c000000029fdf690] [c00000000081dee4] .__cond_resched+0x2c/0x50
[c000000029fdf700] [c0000000002b31b8] .writeback_sb_inodes+0x328/0x4c8
[c000000029fdf880] [c0000000002b33e8] .__writeback_inodes_wb+0x90/0xcc
[c000000029fdf930] [c0000000002b3650] .wb_writeback+0x22c/0x3c8
[c000000029fdfa50] [c0000000002b45a8] .wb_workfn+0x380/0x460
[c000000029fdfbb0] [c00000000008b300] .process_one_work+0x31c/0x4ec
[c000000029fdfca0] [c00000000008b950] .worker_thread+0x1d4/0x290
[c000000029fdfd60] [c000000000093b0c] .kthread+0x124/0x12c
[c000000029fdfe10] [c00000000000bce0] .ret_from_kernel_thread+0x58/0x60
Rebooting in 40 seconds..

Can't make much sense out of it but hopefully you can. ;) For the full trace
please have a look at the attached kernel dmesg (via netconsole).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
You are watching someone on the CC list of the bug.=
