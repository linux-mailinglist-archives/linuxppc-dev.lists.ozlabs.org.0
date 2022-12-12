Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB4649848
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 04:53:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVnm70HG3z3bym
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 14:53:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iXgjTS6f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iXgjTS6f;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVnlB08gCz3bTw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 14:52:36 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id c13so7668144pfp.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Dec 2022 19:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XctFxUXYUO8D+WUUPx5si8Wx+CurgzW1cwwxCd9eJVk=;
        b=iXgjTS6fIWSVCfMoYQuOxa3SKJUrSYIMvDP3b7kDQOhc3IJEHWkLegBj0D4p36AsGW
         /fquFZ6A6fDMkfTbx1uk3awrf4eH6X9Sk9PiPgYRD7txpNqUCgPhZv6PKfDPW/b6amBU
         6Yi52v6LAxrJxjmFe5v5iB8yWSMlG3oiFTxUUkONK0rcgreW0oAbjqhQtN96cJqlb+tb
         0t48JX4YBLIW2jMfpftd1Ul8xxv9d+rydMNBh/UtQ/+O32oxJyvXfoDUjJj3vrkeSOcl
         5e1UzdGl2SSH9h7K574WUOcxB/NCM6ZwA1NzZ+FYJGIm8zTQqBQssis0xYmneAf7WsvV
         VeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XctFxUXYUO8D+WUUPx5si8Wx+CurgzW1cwwxCd9eJVk=;
        b=ap/IwF3rand7o/5V0Ob4FUsvnP19+nQwd6Im7vR51YCk2dOUnqR7LTzd/QLBx6QK4e
         uOlXUcsEJWGAHBUJPZvr+R9YCsmxMJfAay2LJBfXuMDBYe4RBxDaD9mtv3IeF0iLe66Y
         QSsunu42A8XGz98S8Y6BmJpF5JyS9E/FenhY5hFpTtcG+csjEyjfULkCKJ4xTyCE56IV
         jKTcZb6wvXiEaSSpwUk+C5esRkpUGCTNydyR1nqdeaIWcwxqkRd1xRdRBSyiD8hr4Xhi
         HlCN8SwbZqP4/baIV7Anq2Iz+nqtYRdSkRgcmxuLfOjNxIH0o3d9ezbjJDZab/uO2DPv
         LIEw==
X-Gm-Message-State: ANoB5pkzZO1hoTRBw9CU7xI4Soi+B5VQzow+UMPk1dfFoMVrmdAaMgLD
	TnbfieNR0HiF6eV7u9ldLrw=
X-Google-Smtp-Source: AA0mqf4//qc97QTJZ3T+QmE5Vd/zAWwW/KevbcbbGifOPb/pua6lgoS9dMUgUpgsPx9TfeoYbiQPcA==
X-Received: by 2002:aa7:8f14:0:b0:576:6320:3a1a with SMTP id x20-20020aa78f14000000b0057663203a1amr14521747pfr.7.1670817153625;
        Sun, 11 Dec 2022 19:52:33 -0800 (PST)
Received: from localhost (58-6-248-8.tpgi.com.au. [58.6.248.8])
        by smtp.gmail.com with ESMTPSA id y130-20020a62ce88000000b0056d73ef41fdsm4640325pfg.75.2022.12.11.19.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Dec 2022 19:52:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Dec 2022 13:52:28 +1000
Message-Id: <COZJ8XSHX9KD.1JWG82VQXX2LE@bobo>
Subject: Re: [Bug 214913] [xfstests generic/051] BUG: Kernel NULL pointer
 dereference on read at 0x00000108 NIP [c0000000000372e4]
 tm_cgpr_active+0x14/0x40
From: "Nicholas Piggin" <npiggin@gmail.com>
To: <bugzilla-daemon@kernel.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <bug-214913-206035@https.bugzilla.kernel.org/>
 <bug-214913-206035-wclPzMFhaA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214913-206035-wclPzMFhaA@https.bugzilla.kernel.org/>
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

int tm_cgpr_active(struct task_struct *target, const struct user_regset *re=
gset)
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
-	for (t =3D info->thread; t !=3D NULL; t =3D t->next)
+	for (t =3D info->thread; t !=3D NULL; t =3D t->next) {
+		if (!t->task) {
+			WARN_ON(1);
+			printk("core info lost task\n");
+			continue;
+		}
+		if (!t->task->thread.regs) {
+			WARN_ON(1);
+			printk("lost regs pid:%d (current->pid:%d)\n", t->task->pid, current->p=
id);
+			continue;
+		}
+
 		if (!fill_thread_core_info(t, view, cprm->siginfo->si_signo, info))
 			return 0;
+	}
=20
 	/*
 	 * Fill in the two process-wide notes.
diff --git a/kernel/exit.c b/kernel/exit.c
index 35e0a31a0315..6820fe333081 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -366,6 +366,8 @@ static void coredump_task_exit(struct task_struct *tsk)
 	if (core_state) {
 		struct core_thread self;
=20
+		WARN_ON(!current->thread.regs);
+
 		self.task =3D current;
 		if (self.task->flags & PF_SIGNALED)
 			self.next =3D xchg(&core_state->dumper.next, &self);
