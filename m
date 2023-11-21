Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 369967F26C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 08:57:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AqA1/fKJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZGtR0JlZz3dJZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 18:57:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AqA1/fKJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZGsb6JTDz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 18:56:19 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so5007658b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 23:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700553376; x=1701158176; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPkROMmbes+NoTwBo6+myJWaj5ksNAqKHgxIe4KqEts=;
        b=AqA1/fKJYFKpvO60uq3tzfFxbL73WRA5qbTwNMQYYSlteMCVw8tAa0wkHb+aNoONEH
         A1K5/GL7whCKvH0iQOq6cCzhfjOi36k9d0gBJJoxH9QedBKJVmVfdUjwznqF/a3ErwTf
         y5YXpTlmaIy1W8pSl9Su3kuTHObtzqr3X9VGOeTGlcTyCJGrRETdHDvT0bPFBRXh89iK
         zhHPena/TGOlDEthNzN43OZZIeSeoEQaoXubpFyWtSlEoDvfIGidQtp1dpifUQl+k+RO
         danRI/169sg6vK97ZcRyN4jg0qOxdm+tOUk4PzB1bCkiFB9kCc94vAkRMIziIguYiaG6
         Ljyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553376; x=1701158176;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPkROMmbes+NoTwBo6+myJWaj5ksNAqKHgxIe4KqEts=;
        b=t1XkiVfXXPiZX7IWsetMGIFIaqStwhc3u2LeuHJjbluC98pjPpcEeGA30qy8bD9Ct5
         hvRAYg1B0qPm50Zw6MPER6Pi5JNZMrleFKnEQwFMNAk66ropS9D3pxwsAsNlvwBb3w2J
         decRYZeWOfxmsQH8g+wSlDEcM0U/xM0Tyitd4y2LRj48imJYuKpK8Oho/H9nvl1+RmfM
         qjUoI5V3bTYDHsHCT0X5kKps1ICpOgVdW8I6gZv4FxsDyIoVZ+BJ0mMiivQqTJMSg8hA
         O2/X3ORlN4eaQi/KKQieUEVEH4K+weH70RG3B3nTAOY0KHF0buQpNlEgFg6ZlV99IfMp
         vGCg==
X-Gm-Message-State: AOJu0YzedZTrdDmAFdsfp+cdqF/vz4E1oBtoAiUB6jO7si0V4BNE1i2g
	SyQN+uJY/xLRnFrc2HVCPqU=
X-Google-Smtp-Source: AGHT+IGOCLqAMv/TBcLtTqQ5OkM/wL3HZhsfigdHGhc8FOL3f0xgpNEsonSURDAai5Ll61v7nVXwZg==
X-Received: by 2002:a05:6a20:8f14:b0:18a:e86f:f246 with SMTP id b20-20020a056a208f1400b0018ae86ff246mr990692pzk.10.1700553376311;
        Mon, 20 Nov 2023 23:56:16 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id ju4-20020a170903428400b001cc3875e658sm7340245plb.303.2023.11.20.23.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 23:56:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 17:56:10 +1000
Message-Id: <CX4BUXJD624S.2U2UZ9M6H198U@wheely>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <608737213.48890358.1700529837699.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <608737213.48890358.1700529837699.JavaMail.zimbra@raptorengineeringinc.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, regressions <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 21, 2023 at 11:23 AM AEST, Timothy Pearson wrote:
>
>
> ----- Original Message -----
> > From: "Michael Ellerman" <mpe@ellerman.id.au>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "Jens Axboe" <axboe@kernel.dk>, "regressions" <regressions@lists.li=
nux.dev>, "npiggin" <npiggin@gmail.com>,
> > "christophe leroy" <christophe.leroy@csgroup.eu>, "linuxppc-dev" <linux=
ppc-dev@lists.ozlabs.org>
> > Sent: Monday, November 20, 2023 5:39:52 PM
> > Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altive=
c register  save
>
> > Timothy Pearson <tpearson@raptorengineering.com> writes:
> >> ----- Original Message -----
> >>> From: "Michael Ellerman" <mpe@ellerman.id.au>
> > ...
> >>>=20
> >>> But we now have a new path, because io-uring can call copy_process() =
via
> >>> create_io_thread() from the signal handling path. That's OK if the si=
gnal is
> >>> handled as we return from a syscall, but it's not OK if the signal is=
 handled
> >>> due to some other interrupt.
> >>>=20
> >>> Which is:
> >>>=20
> >>> interrupt_return_srr_user()
> >>>  interrupt_exit_user_prepare()
> >>>    interrupt_exit_user_prepare_main()
> >>>      do_notify_resume()
> >>>        get_signal()
> >>>          task_work_run()
> >>>            create_worker_cb()
> >>>              create_io_worker()
> >>>                copy_process()
> >>>                  dup_task_struct()
> >>>                    arch_dup_task_struct()
> >>>                      flush_all_to_thread()
> >>>                        save_all()
> >>>                          if (tsk->thread.regs->msr & MSR_FP)
> >>>                            save_fpu()
> >>>                            # fr0 is clobbered and potentially live in=
 userspace
> >>>=20
> >>>=20
> >>> So tldr I think the corruption is only an issue since io-uring starte=
d doing
> >>> the clone via signal, which I think matches the observed timeline of =
this bug
> >>> appearing.
> >>
> >> I agree the corruption really only started showing up in earnest on
> >> io_uring clone-via-signal, as this was confirmed several times in the
> >> course of debugging.
> >=20
> > Thanks.
> >=20
> >> Note as well that I may very well have a wrong call order in the
> >> commit message, since I was relying on a couple of WARN_ON() macros I
> >> inserted to check for a similar (but not identical) condition and
> >> didn't spend much time getting new traces after identifying the root
> >> cause.
> >=20
> > Yep no worries. I'll reword it to incorporate the full path from my mai=
l.
> >=20
> >> I went back and grabbed some real world system-wide stack traces, sinc=
e I now
> >> know what to trigger on.  A typical example is:
> >>
> >> interrupt_return_srr_user()
> >>  interrupt_exit_user_prepare()
> >>   interrupt_exit_user_prepare_main()
> >>    schedule()
> >>     __schedule()
> >>      __switch_to()
> >>       giveup_all()
> >>        # tsk->thread.regs->msr MSR_FP is still set here
> >>        __giveup_fpu()
> >>         save_fpu()
> >>         # fr0 is clobbered and potentially live in userspace
> >=20
> > fr0 is not live there.
> >=20
> > __giveup_fpu() does roughly:
> >=20
> >	msr =3D tsk->thread.regs->msr;
> >	msr &=3D ~(MSR_FP|MSR_FE0|MSR_FE1);
> >        msr &=3D ~MSR_VSX;
> >	tsk->thread.regs =3D msr;
> >=20
> > ie. it clears the FP etc. bits from the task's MSR. That means the FP
> > state will be reloaded from the thread struct before the task is run ag=
ain.
> >=20
> > Also on that path we're switching to another task, so we'll be reloadin=
g
> > the other task's FP state before returning to userspace.
> >=20
> > So I don't see any bug there.
>
> Yeah, you're right.  I was trying to get traces while doing something els=
e, and didn't think that all the way through, sorry. :)  It's not going to =
be super easy to get a real trace (I was triggering the WARN_ON() from of f=
r0 getting set to to FPSCR), so let's just assume it's mainly the path you =
manually found above and update the commit message accordingly.
>
> > There's only two places that call save_fpu() and skip the giveup logic,
> > which is save_all() and kvmppc_save_user_regs().
>
> Now that's interesting as well, since it might explain some issues I've s=
een for years on a specific QEMU workload.  Once this is backported to stab=
le I'll need to get the kernels updated on those boxes and see if the issue=
s disappear...

KVM issue is actually slightly different. You need this (lightly
verified to solve issue so far).

---

From c12fbed0e12207058282a2411da59b43b1f96c49 Mon Sep 17 00:00:00 2001
From: Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 21 Nov 2023 17:03:55 +1000
Subject: [PATCH] KVM: PPC: Book3S HV: Fix KVM_RUN ioctl clobbering FP/VEC
 registers

Before running a guest, the host process's FP/VEC registers are saved
away like a context switch or a kernel use of those regs. The guest
FP/VEC registers can then be loaded as needed. The host process
registers would be restored lazily when it uses FP/VEC again.

KVM HV did not do this correctly. The registers are saved in the
thread struct, but the FP/VEC/VSX bits remain enabled in the user
MSR, leading the kernel to think they are still valid. Even after
they are clobbered by guest registers. This leads to the host
process getting guest FP/VEC register values.

KVM must be invoked by ioctl in this path, and almost certainly that
means a C call to a wrapper function, but that still leaves real
possibility of corruption in for non-volatile registers to cause
problems for QEMU process.
---
 arch/powerpc/kernel/process.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 392404688cec..9452a54d356c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1198,11 +1198,11 @@ void kvmppc_save_user_regs(void)
=20
 	usermsr =3D current->thread.regs->msr;
=20
+	/* Caller has enabled FP/VEC/VSX/TM in MSR */
 	if (usermsr & MSR_FP)
-		save_fpu(current);
-
+		__giveup_fpu(current);
 	if (usermsr & MSR_VEC)
-		save_altivec(current);
+		__giveup_altivec(current);
=20
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (usermsr & MSR_TM) {
--=20
2.42.0

