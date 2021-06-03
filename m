Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D73B39A983
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 19:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwtdK16Y2z30D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 03:47:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=shlAJEj6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=shlAJEj6; dkim-atps=neutral
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwtcr4j1mz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 03:46:50 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id t3so8094259edc.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Jun 2021 10:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PjKM+TjEr+V3wE7MxndA3ubsqd3UWDYCTnVADiaOAMc=;
 b=shlAJEj66Pg/XbiEGnmtQJmvdrbwexBkOjTFbaM6kXGwG5oJROkd58SfFaUCx4WL+/
 tODxUyrXscc/Xvf5JwzKCpG6jRb4my/mtPtIsBZYV08pQnGbBqbaGI6fBKFEKipP4cXU
 GFh2OB4R/ASbyqyVt7ucNm8NVOx0I9wP/Pcr9qveSO3M7keNfDPxGNuMmo4L2PNCAm4W
 hQ7fgrFa3MxyEs3Zr4PMhDb+v8w0Xmg4RAtyGqWV2HjlCBpSlLhCLi8EjRz+S7QYLBCX
 RPorF7im0+mnzXvz4Uz34h/6sNN2tPN2iJNvf5C5QvboRZsdgJdnXwgebuGyZYOdrEOX
 cFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjKM+TjEr+V3wE7MxndA3ubsqd3UWDYCTnVADiaOAMc=;
 b=o3Zyz0JX1y7eSCMTQHKj3BbnjicuKCU05TNPx4VLjPtaSSTOwWIBnvHU0wY1tg1g1X
 AQjwzAVIQatOoUi55l+tArnb8EaO/Qkt1G2QaFq7NlupkWbt5yGXe8OCitZCoo4WQnrR
 RyiEh/lORYWNIfNu41OtQtw5F/vULSDEE6mJLxHyCSWVtEON2o2eG+jSiby6oNXDr1J2
 gxCZXSgaw39hCeU/7kO59+vpp9aCwAbZY5U4n/RbfLtlQRBIW4x8ByqXRUiy6g0jgtgg
 HLmV++EenpvDDLnu6sxJEhHhJhxcv5rf1XmC4WnqGwTLp04Kb5uecLTE4glbBiDL92pe
 Jm4w==
X-Gm-Message-State: AOAM530evbnB8bvnWcjoiUALvAcRniuypUMXGZyogCc7ALl9wwT6CpQ3
 HRNVtEfhYH4MtI/Z12E3cgSNtmFPNNlgvmaJ6wvU
X-Google-Smtp-Source: ABdhPJzNqWL5QVDNquVrcGn1MGIJNhAiKJcWV+1LAqjA+bM6E9oqpMkI7ks0NoUxqbfii5o8QZYzm5h9oCdO6q1txNE=
X-Received: by 2002:aa7:c7cd:: with SMTP id o13mr622240eds.269.1622742403464; 
 Thu, 03 Jun 2021 10:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <CAFqZXNsh9njbFUNBugidbdiNqD3QbKzsw=KgNKSmW5hv-fD6tA@mail.gmail.com>
In-Reply-To: <CAFqZXNsh9njbFUNBugidbdiNqD3QbKzsw=KgNKSmW5hv-fD6tA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 3 Jun 2021 13:46:31 -0400
Message-ID: <CAHC9VhQj_FvBqSGE+eZtbzvDoRAEbbo-6t_2E6MVuyiGA9N8Hw@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: SElinux list <selinux@vger.kernel.org>,
 network dev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Steven Rostedt <rostedt@goodmis.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 2, 2021 at 9:40 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> On Fri, May 28, 2021 at 3:37 AM Paul Moore <paul@paul-moore.com> wrote:
> > On Mon, May 17, 2021 at 5:22 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> > >
> > > Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
> > > lockdown") added an implementation of the locked_down LSM hook to
> > > SELinux, with the aim to restrict which domains are allowed to perform
> > > operations that would breach lockdown.
> > >
> > > However, in several places the security_locked_down() hook is called in
> > > situations where the current task isn't doing any action that would
> > > directly breach lockdown, leading to SELinux checks that are basically
> > > bogus.
> > >
> > > Since in most of these situations converting the callers such that
> > > security_locked_down() is called in a context where the current task
> > > would be meaningful for SELinux is impossible or very non-trivial (and
> > > could lead to TOCTOU issues for the classic Lockdown LSM
> > > implementation), fix this by modifying the hook to accept a struct cred
> > > pointer as argument, where NULL will be interpreted as a request for a
> > > "global", task-independent lockdown decision only. Then modify SELinux
> > > to ignore calls with cred == NULL.
> >
> > I'm not overly excited about skipping the access check when cred is
> > NULL.  Based on the description and the little bit that I've dug into
> > thus far it looks like using SECINITSID_KERNEL as the subject would be
> > much more appropriate.  *Something* (the kernel in most of the
> > relevant cases it looks like) is requesting that a potentially
> > sensitive disclosure be made, and ignoring it seems like the wrong
> > thing to do.  Leaving the access control intact also provides a nice
> > avenue to audit these requests should users want to do that.
> >
> > Those users that generally don't care can grant kernel_t all the
> > necessary permissions without much policy.
>
> Seems kind of pointless to me, but it's a relatively simple change to
> do a check against SECINITSID_KERNEL, so I don't mind doing it like
> that.

It's not pointless, the granularity isn't as great as one would like,
but it doesn't mean it is pointless.  *Someone* is acting, in this
case it just happens to be the kernel.  It is likely the most admins
and policy developers will not care, but some might, and we should
enable that.

> > > Since most callers will just want to pass current_cred() as the cred
> > > parameter, rename the hook to security_cred_locked_down() and provide
> > > the original security_locked_down() function as a simple wrapper around
> > > the new hook.
> >
> > I know you and Casey went back and forth on this in v1, but I agree
> > with Casey that having two LSM hooks here is a mistake.  I know it
> > makes backports hard, but spoiler alert: maintaining complex software
> > over any non-trivial period of time is hard, reeeeally hard sometimes
> > ;)
>
> Do you mean having two slots in lsm_hook_defs.h or also having two
> security_*() functions? (It's not clear to me if you're just
> reiterating disagreement with v1 or if you dislike the simplified v2
> as well.)

To be clear I don't think there should be two functions for this, just
make whatever changes are necessary to the existing
security_locked_down() LSM hook.  Yes, the backport is hard.  Yes, it
will touch a lot of code.  Yes, those are lame excuses to not do the
right thing.

> > > The callers migrated to the new hook, passing NULL as cred:
> > > 1. arch/powerpc/xmon/xmon.c
> > >      Here the hook seems to be called from non-task context and is only
> > >      used for redacting some sensitive values from output sent to
> > >      userspace.
> >
> > This definitely sounds like kernel_t based on the description above.
>
> Here I'm a little concerned that the hook might be called from some
> unusual interrupt, which is not masked by spin_lock_irqsave()... We
> ran into this with PMI (Platform Management Interrupt) before, see
> commit 5ae5fbd21079 ("powerpc/perf: Fix handling of privilege level
> checks in perf interrupt context"). While I can't see anything that
> would suggest something like this happening here, the whole thing is
> so foreign to me that I'm wary of making assumptions :)
>
> @Michael/PPC devs, can you confirm to us that xmon_is_locked_down() is
> only called from normal syscall/interrupt context (as opposed to
> something tricky like PMI)?

You did submit the code change so I assumed you weren't concerned
about it :)  If it is a bad hook placement that is something else
entirely.

Hopefully we'll get some guidance from the PPC folks.

> > > 4. net/xfrm/xfrm_user.c:copy_to_user_*()
> > >      Here a cryptographic secret is redacted based on the value returned
> > >      from the hook. There are two possible actions that may lead here:
> > >      a) A netlink message XFRM_MSG_GETSA with NLM_F_DUMP set - here the
> > >         task context is relevant, since the dumped data is sent back to
> > >         the current task.
> >
> > If the task context is relevant we should use it.
>
> Yes, but as I said it would create an asymmetry with case b), which
> I'll expand on below...
>
> > >      b) When deleting an SA via XFRM_MSG_DELSA, the dumped SAs are
> > >         broadcasted to tasks subscribed to XFRM events - here the
> > >         SELinux check is not meningful as the current task's creds do
> > >         not represent the tasks that could potentially see the secret.
> >
> > This looks very similar to the BPF hook discussed above, I believe my
> > comments above apply here as well.
>
> Using the current task is just logically wrong in this case. The
> current task here is just simply deleting an SA that happens to have
> some secret value in it. When deleting an SA, a notification is sent
> to a group of subscribers (some group of other tasks), which includes
> a dump of the secret value. The current task isn't doing any attempt
> to breach lockdown, it's just deleting an SA.
>
> It also makes it really awkward to make policy decisions around this.
> Suppose that domains A, B, and C need to be able to add/delete SAs and
> domains D, E, and F need to receive notifications about changes in
> SAs. Then if, say, domain E actually needs to see the secret values in
> the notifications, you must grant the confidentiality permission to
> all of A, B, C to keep things working. And now you have opened up the
> door for A, B, C to do other lockdown-confidentiality stuff, even
> though these domains themselves actually don't request/need any
> confidential data from the kernel. That's just not logical and you may
> actually end up (slightly) worse security-wise than if you just
> skipped checking for XFRM secrets altogether, because you need to
> allow confidentiality to domains for which it may be excessive.

It sounds an awful lot like the lockdown hook is in the wrong spot.
It sounds like it would be a lot better to relocate the hook than
remove it.

-- 
paul moore
www.paul-moore.com
