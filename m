Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEA964984E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 04:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVnn850WBz3bwQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 14:54:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ABubDCI0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ABubDCI0;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVnlG34XKz3bYL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 14:52:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33E76B80B4B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 03:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF72EC433D2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 03:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670817156;
	bh=ibbIwAa8fQPEdo7GGEb+YWKH82Zu2wQuPtLp6rKPENk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ABubDCI0svsihvPJ6aXrKh0loBTMgfBDbUdFMBkUA/zwCH3Vn3JgUhulSX+ptjmg6
	 Pk1tUg4xuY9e0/rQbC5N1MxBIvVuPhJTBqrxcvWaY7zqLfMXmxhjZQQfBy76h+t4gH
	 p/+Rdp3a0pF0Ek2e0J1XNYuQb0Bp5XEzpdLk4gq/XgQSoN/gyl8VzfWwoJd+uwQnDm
	 B80t87Ke0kOSQ2KdBbbF2io9TNmUiXN+npEtcl/CyR9bpcxmKu8Dxg09q/vp1EStJK
	 qiMljbEDewkUufTDFJkmXoWY3lAKc57+23ZHL/D1g7ePjNNmZEKLiHZB5t47grJY6K
	 mJeMJ9q3kuPxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A96EAC43143; Mon, 12 Dec 2022 03:52:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
Date: Mon, 12 Dec 2022 03:52:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: npiggin@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214913-206035-1iMUijfpCI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214913-206035@https.bugzilla.kernel.org/>
References: <bug-214913-206035@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214913

--- Comment #8 from npiggin@gmail.com ---
On Sun Dec 11, 2022 at 11:19 PM AEST,  wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D214913
>
> --- Comment #7 from Zorro Lang (zlang@redhat.com) ---
> (In reply to Michael Ellerman from comment #5)
> > Sorry I don't have any idea which commit could have fixed this.
> >=20
> > The process that crashed was "fsstress", do you know if it uses io_urin=
g?
>
> Yes, fsstress has io_uring read/write operations. And from the kernel .co=
nfig
> file(as attachment), the CONFIG_IO_URING=3Dy

The task being dumped seems like it's lost its task->thread.regs. The
NULL pointer is here:

int tm_cgpr_active(struct task_struct *target, const struct user_regset
*regset)
{
        if (!cpu_has_feature(CPU_FTR_TM))
                return -ENODEV;

        if (!MSR_TM_ACTIVE(target->thread.regs->msr))
                return 0;

        return regset->n;
}

On that regs->msr deref. r9 contains the regs pointer.

The kernel attempt to read user page - exploit attempt? message is
I think a red herring it's coming up because of the NULL deref I
think (I thought we fixed that).

Anyway I'm not sure how we could lose regs, all user threads should
have them set to non-NULL. It doesn't look like we can collect threads
for dumping before we have called copy_thread(), which is where they
get thread.regs set. AFAIK it's not supposed to change after that.

Would you be able to try this patch, hopefully it catches the problem
thread on the exit side, and gives a clue why regs is NULL.

Thanks,
Nick

---

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index 6a11025e5850..ece63b3d2304 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -1898,9 +1898,21 @@ static int fill_note_info(struct elfhdr *elf, int ph=
drs,
        /*
         * Now fill in each thread's information.
         */
-       for (t =3D info->thread; t !=3D NULL; t =3D t->next)
+       for (t =3D info->thread; t !=3D NULL; t =3D t->next) {
+               if (!t->task) {
+                       WARN_ON(1);
+                       printk("core info lost task\n");
+                       continue;
+               }
+               if (!t->task->thread.regs) {
+                       WARN_ON(1);
+                       printk("lost regs pid:%d (current->pid:%d)\n",
t->task->pid, current->pid);
+                       continue;
+               }
+
                if (!fill_thread_core_info(t, view, cprm->siginfo->si_signo,
info))
                        return 0;
+       }

        /*
         * Fill in the two process-wide notes.
diff --git a/kernel/exit.c b/kernel/exit.c
index 35e0a31a0315..6820fe333081 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -366,6 +366,8 @@ static void coredump_task_exit(struct task_struct *tsk)
        if (core_state) {
                struct core_thread self;

+               WARN_ON(!current->thread.regs);
+
                self.task =3D current;
                if (self.task->flags & PF_SIGNALED)
                        self.next =3D xchg(&core_state->dumper.next, &self);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
