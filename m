Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7A7F221F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 01:28:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QEweu6iH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZ4x22MNtz3cT3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 11:28:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QEweu6iH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZ4w72nzFz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 11:27:50 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1cc921a4632so43645555ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 16:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700526467; x=1701131267; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBBoxetyuP8PrY6LsK5WuxZzMVjegd6dnnywtdG7bfU=;
        b=QEweu6iH99O8EJOeJ5OIxIl14Au4mE0b6EJlGKPHPFF64Q77RQzTF6+o999kOeLbSk
         llpKBGw3SD6b6XZ5iZcBAXTAikDTG5D/SuJ6CdbtVVQt0YUh8usQ9aMeX6pjEAp6ISvA
         RkNxb35/YVfTXoJuGbz1VilXIbXT1k/vXMsftC+dhKhojCnzQoJ+NwJZYfxfUwZGI1Oz
         ZvgswE1MBpSzlt0fPftmJDavp7kW7N9RnzUdfeuZsrkWxItBdnK/riNgKEtK4U7VeTxL
         zWy3QiLJ6/TZyVt5ktOsOWpOICjD5hy0lnSmhLGLg+/++Hv2nV3p0a1YZ7OKtM0kj5S+
         mN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700526467; x=1701131267;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iBBoxetyuP8PrY6LsK5WuxZzMVjegd6dnnywtdG7bfU=;
        b=Rq3edBD8/wayXi+fmvJj0xEJMSWYNP+zEpeCfwOcDLzuauqygOIvUPPVdqhGAvp+UT
         hOvlbV0mPmJgxhzzfji8Wujb0XnO773Nb0j0pACLE/UpKCoDJ0Q0TTZ2RKnDjZXAYkZs
         2p3OJ0dN24ASwAfIXIekt6xlh/XuNZfmNfZMgiWz+/pznlLuPM5gWOnnohqQ6bxoGRZ2
         cMITW3iaH27tz269jG1gpCUsVcSqnAFRAY/U+48UcsWCGOj6ttFvyQKkRh4E04WH+wR2
         7lLwmyXShd6X/Plkln5eOWkXxTNjKyCH6dtQF/vS5o/x/n+2IED9Id59o/CBlicAhUp2
         n6pQ==
X-Gm-Message-State: AOJu0Yz4HQzZ0bC3QKpltohlqdVxVXKfviXKF9tloe+LE39vYt3WU0hi
	lW2SqIhKIuw+bcNxrcmd6OI=
X-Google-Smtp-Source: AGHT+IFoYSJbDqHLP+0BSTHPGDvO48jUdvK/tcby/7LrxEO3V1tLJBZIrFf+1ZwK7zquv11qJF1hng==
X-Received: by 2002:a17:903:2292:b0:1cf:595b:eabb with SMTP id b18-20020a170903229200b001cf595beabbmr7608979plh.27.1700526467327;
        Mon, 20 Nov 2023 16:27:47 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id 20-20020a170902ee5400b001c724732058sm6690340plo.235.2023.11.20.16.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 16:27:47 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 10:27:41 +1000
Message-Id: <CX42BJRGTS20.1ENG3JZ0N2UX5@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Timothy Pearson"
 <tpearson@raptorengineering.com>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse>
In-Reply-To: <874jhg6lkn.fsf@mail.lhotse>
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

On Tue Nov 21, 2023 at 9:39 AM AEST, Michael Ellerman wrote:
> Timothy Pearson <tpearson@raptorengineering.com> writes:
> > ----- Original Message -----
> >> From: "Michael Ellerman" <mpe@ellerman.id.au>
> ...
> >>=20
> >> But we now have a new path, because io-uring can call copy_process() v=
ia
> >> create_io_thread() from the signal handling path. That's OK if the sig=
nal is
> >> handled as we return from a syscall, but it's not OK if the signal is =
handled
> >> due to some other interrupt.
> >>=20
> >> Which is:
> >>=20
> >> interrupt_return_srr_user()
> >>  interrupt_exit_user_prepare()
> >>    interrupt_exit_user_prepare_main()
> >>      do_notify_resume()
> >>        get_signal()
> >>          task_work_run()
> >>            create_worker_cb()
> >>              create_io_worker()
> >>                copy_process()
> >>                  dup_task_struct()
> >>                    arch_dup_task_struct()
> >>                      flush_all_to_thread()
> >>                        save_all()
> >>                          if (tsk->thread.regs->msr & MSR_FP)
> >>                            save_fpu()
> >>                            # fr0 is clobbered and potentially live in =
userspace
> >>=20
> >>=20
> >> So tldr I think the corruption is only an issue since io-uring started=
 doing
> >> the clone via signal, which I think matches the observed timeline of t=
his bug
> >> appearing.
> >
> > I agree the corruption really only started showing up in earnest on
> > io_uring clone-via-signal, as this was confirmed several times in the
> > course of debugging.
>
> Thanks.
>
> > Note as well that I may very well have a wrong call order in the
> > commit message, since I was relying on a couple of WARN_ON() macros I
> > inserted to check for a similar (but not identical) condition and
> > didn't spend much time getting new traces after identifying the root
> > cause.
>
> Yep no worries. I'll reword it to incorporate the full path from my mail.
>
> > I went back and grabbed some real world system-wide stack traces, since=
 I now know what to trigger on.  A typical example is:
> >
> > interrupt_return_srr_user()
> >  interrupt_exit_user_prepare()
> >   interrupt_exit_user_prepare_main()
> >    schedule()
> >     __schedule()
> >      __switch_to()
> >       giveup_all()
> >        # tsk->thread.regs->msr MSR_FP is still set here
> >        __giveup_fpu()
> >         save_fpu()
> >         # fr0 is clobbered and potentially live in userspace
>
> fr0 is not live there.
>
> __giveup_fpu() does roughly:
>
> 	msr =3D tsk->thread.regs->msr;
> 	msr &=3D ~(MSR_FP|MSR_FE0|MSR_FE1);
>         msr &=3D ~MSR_VSX;
> 	tsk->thread.regs =3D msr;
>
> ie. it clears the FP etc. bits from the task's MSR. That means the FP
> state will be reloaded from the thread struct before the task is run agai=
n.
>
> Also on that path we're switching to another task, so we'll be reloading
> the other task's FP state before returning to userspace.
>
> So I don't see any bug there.
>
> There's only two places that call save_fpu() and skip the giveup logic,
> which is save_all() and kvmppc_save_user_regs().
>
> save_all() is only called via clone() so I think that's unable to
> actually cause visible register corruption as I described in my previous
> mail.
>
> I thought the KVM case was similar, as it's called via an ioctl, but
> I'll have to talk to Nick as his mail indicates otherwise.

Yeah it can, because later on it runs the guest and that will clobber
other regs. I reproduced fr14 corruption in the host easily with KVM
selftests.

It should just do a "giveup" on FP/VEC (as it does with TM).

Thanks,
Nick
