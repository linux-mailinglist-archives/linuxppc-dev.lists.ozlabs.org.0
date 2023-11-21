Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3320C7F26BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 08:55:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TeGifHso;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZGr304hVz3c4R
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 18:54:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TeGifHso;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZGq71F6Mz3by8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 18:54:10 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2839cf9ea95so2340798a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 23:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700553248; x=1701158048; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GpGlzTpFmEmndUoQPeihmLydV+15ixLMOznzzwXxVQ=;
        b=TeGifHsoIJfhKCfABUcnGOpuBA+9hBDapz+D3cWuNDAiiD+mo4/BU1YOXzSaHifJgn
         Mu/R3ZMismpMRMQ8gsYM2wTfLVKyT8JxEOONbjVhKzxPsHkRTkBhpjH8GZ/pHlOa0vq6
         FSYLGo/2xJk11rMJI0Uc2xGAt6K35HW8/WWm8R+CrZMXBUookZDhmxRPUwFX69fNmFxX
         TkUwUOrrJLn14Y41bwhwtrGaqQbvDy5u4P1UVVwZg8obO1JMV7BExwVdfjIh4TPZa1oO
         DSUMMfk4ia9YSFlPh6nToxVUyMcog4cGara+d+v8Yv8/i9v39E81s4Jl2n7bSfDZqrMa
         XQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700553248; x=1701158048;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4GpGlzTpFmEmndUoQPeihmLydV+15ixLMOznzzwXxVQ=;
        b=hVDtNBpDDPPuYCNUPgJruzfwFLVK9tizy3d8RsLhEjyfXzWp5ETIcB7AbkkTcyncQC
         ymbEdKn2+CSLBrtPXqU6KSP9Y4ipZhZ722HUZc9MJ1KGeq+A969flD96qzRPv+TJR3O8
         8lrN6+aRI9Zoioy0jOBJhO9J8Me3u3Cv3BVoiYvVdR1KLLBJAlFlP4QLMvFbUBiMOP61
         pkGDAY6T90lCBUCsz7TttC6Y7PugSH/uLomzcCltLTVaLdeGrnBnDZCkH99DXA1KzOPw
         rqDq403iOlzFw7C9ZAJnp+KDMjq5gSDjpG/R4FHSBinTmIHoq+mdydsScEfBIEaWQ7kY
         B8ew==
X-Gm-Message-State: AOJu0YzxyZKYhKhYktiohYXFdtq0gOdyON6Zm8eXUoBkIYVN7bzUzWYt
	3CwDMN5nWnOjpsca+HFnq8U=
X-Google-Smtp-Source: AGHT+IEDQQ1myxH37RT6l8dvllopvb4hWIXobKBKwtE4UQnTWaQheRNBKNiZafUW3ET0yW/moGJJfw==
X-Received: by 2002:a17:90b:4f45:b0:27c:f016:49a2 with SMTP id pj5-20020a17090b4f4500b0027cf01649a2mr7784712pjb.7.1700553247587;
        Mon, 20 Nov 2023 23:54:07 -0800 (PST)
Received: from localhost (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id bg11-20020a1709028e8b00b001cc307bcdbdsm7216652plb.211.2023.11.20.23.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 23:54:07 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Nov 2023 17:54:02 +1000
Message-Id: <CX4BTAI45247.1FAQB8BD1J0H0@wheely>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Timothy Pearson" <tpearson@raptorengineering.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com>
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

On Tue Nov 21, 2023 at 2:10 PM AEST, Timothy Pearson wrote:
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
> <snip>=20
> > ie. it clears the FP etc. bits from the task's MSR. That means the FP
> > state will be reloaded from the thread struct before the task is run ag=
ain.
>
> So a little more detail on this, just to put it to rest properly vs. assu=
ming hand analysis caught every possible pathway. :)
>
> The debugging that generates this stack trace also verifies the following=
 in __giveup_fpu():
>
> 1.) tsk->thread.fp_state.fpr doesn't contain the FPSCR contents prior to =
calling save_fpu()
> 2.) tsk->thread.fp_state.fpr contains the FPSCR contents directly after c=
alling save_fpu()
> 3.) MSR_FP is set both in the task struct and in the live MSR.
>
> Only if all three conditions are met will it generate the trace.  This is=
 a generalization of the hack I used to find the problem in the first place=
.
>
> If the state will subsequently be reloaded from the thread struct, that m=
eans we're reloading the registers from the thread struct that we just veri=
fied was corrupted by the earlier save_fpu() call.  There are only two ways=
 I can see for that to be true -- one is if the registers were already clob=
bered when giveup_all() was entered, and the other is if save_fpu() went ah=
ead and clobbered them right here inside giveup_all().
>
> To see which scenario we were dealing with, I added a bit more instrument=
ation to dump the current register state if MSR_FP bit was already set in r=
egisters (i.e. not dumping data from task struct, but using the live FPU re=
gisters instead), and sure enough the registers are corrupt on entry, so so=
mething else has already called save_fpu() before we even hit giveup_all() =
in this call chain.
>
> Unless I'm missing something, doesn't this effectively mean that anything=
 interrupting a task can hit this bug?  Or, put another way, I'm seeing sev=
eral processes hit this exact call chain with the corrupt register going ba=
ck out to userspace without io_uring even in the mix, so there seems to be =
another pathway in play.  These traces are from a qemu guest, in case it ma=
tters given the kvm path is possibly susceptible.
>
> Just a few things to think about.  The FPU patch itself definitely resolv=
es the problems; I used a sledgehammer approach *specifically* so that ther=
e is no place for a rare call sequence we didn't consider to hit it again d=
own the line. :)

I don't think interrupts are supposed to use (or save) FP/VEC
registers. So you're allowed to _take_ interrupts while FP/VEC
are being saved or used, just not be preempted, block, or
return to user. Hence all the preempt_disable() around these
things.

Not that we cover all these with warnings very well in the
enable_kernel_* functions AFAIKS. We could add more checks.
At least interrupts enabled would be good. balance and user
exit checks should somewhat be covered by preempt count
implicitly.

Thanks,
Nick
