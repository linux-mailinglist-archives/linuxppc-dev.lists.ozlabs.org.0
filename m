Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67974403A2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 14:56:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4MZZ1gG9z3002
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 22:56:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XAdq1BG6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bugzilla.kernel.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=bugzilla-daemon@bugzilla.kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XAdq1BG6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4MYM6Y3dz2yHN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 22:55:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id A96AC61153
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631105699;
 bh=F6R4vBHgmKBQUUJqJU/Q5MQ2Gtgyhcz4nYAzKjwL6HU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XAdq1BG6DZ1M5RUtFaa/hqIogZuEVG0qKxhde1WUb4VLpoaLKYFeYfbyPIZnvJMvE
 RP0DzyvPlOZa24DwCLX8O/Mi9iZx1mlHQBWnQbSs7Av+Ap0RUhRQ4gabVPYdYt4gzq
 1k6lnjCQcKYSZ5JV119sDOiy4sIyBKF/PAyZogYq4c0s9R/Wm1xpJS9KoA2bbF7ZEU
 rnAOchAxbT5pUFlfIoYx3QpsReAVujmdcwobLeNBwWn1z54h/eBHCEnYp6/PhmWpZs
 ZDCQ5vD3T+nYw1tyz8kmM/cBxIJVBKU0zqTl57ZWvOK5JpUWNaOQs+lGRzvGr3rXhH
 vq1pI5/ZI3EQw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A0CB860FC4; Wed,  8 Sep 2021 12:54:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 213837] "Kernel panic - not syncing: corrupted stack end
 detected inside scheduler" at building via distcc on a G5
Date: Wed, 08 Sep 2021 12:54:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: CC platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpe@ellerman.id.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213837-206035-XXW9TojSF0@https.bugzilla.kernel.org/>
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

--- Comment #6 from mpe@ellerman.id.au ---
bugzilla-daemon@bugzilla.kernel.org writes:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D213837
>
> Erhard F. (erhard_f@mailbox.org) changed:
>
>            What    |Removed                     |Added
> -------------------------------------------------------------------------=
---
>            See Also|https://bugzilla.kernel.org |
>                    |/show_bug.cgi?id=3D213079     |
>
> --- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
> Checked out whether this has really something to do with bug #213079 or n=
ot
> by
> copying this root partition to a regular HDD and use that one instead. As=
 the
> issue still happens it seems these are two seperate bugs.
>
> [...]
> Kernel panic - not syncing: corrupted stack end detected inside scheduler

Can you try this patch, it might help us work out what is corrupting the
stack.

cheers

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c4462c454ab9..07bfa25c1b48 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5490,8 +5490,14 @@ static noinline void __schedule_bug(struct task_stru=
ct
*prev)
 static inline void schedule_debug(struct task_struct *prev, bool preempt)
 {
 #ifdef CONFIG_SCHED_STACK_END_CHECK
-       if (task_stack_end_corrupted(prev))
+       if (task_stack_end_corrupted(prev)) {
+               char *start =3D (char *)end_of_stack(prev);
+               pr_err("stack corrupted? stack end =3D 0x%px\n",
end_of_stack(prev));
+               print_hex_dump(KERN_ERR, "stack: ", DUMP_PREFIX_ADDRESS, 16=
, 4,
+                              start - SZ_1K, THREAD_SIZE + SZ_1K, true);
+
                panic("corrupted stack end detected inside scheduler\n");
+       }

        if (task_scs_end_corrupted(prev))
                panic("corrupted shadow stack detected inside scheduler\n");

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching someone on the CC list of the bug.=
