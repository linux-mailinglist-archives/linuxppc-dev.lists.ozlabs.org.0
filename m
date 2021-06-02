Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4AA398AEB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 15:40:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw9CF1By9z308p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 23:40:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzx1sqD5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzx1sqD5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=dzx1sqD5; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=dzx1sqD5; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw9Bj2Llhz2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 23:40:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RSyNYGQzSIGWwH69Ad9FPmGQv4nF3yGhgBhDO7Psolk=;
 b=dzx1sqD5WoMIsMt2PsUnm9LLj+ZvW+zCgO7cj/T9+QSbACIBc+F4lSFGZEb1N45KYeLdyX
 8kw3Sw6sZ2OmHGwqrwsFpOrbRzJF+Lvf9vasd2PtR0DfGmiHpVIdOuGgovLExnCK0VS4Tv
 KvR4zNerfQNHl9WeBdiPziu4mri57H8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622641207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RSyNYGQzSIGWwH69Ad9FPmGQv4nF3yGhgBhDO7Psolk=;
 b=dzx1sqD5WoMIsMt2PsUnm9LLj+ZvW+zCgO7cj/T9+QSbACIBc+F4lSFGZEb1N45KYeLdyX
 8kw3Sw6sZ2OmHGwqrwsFpOrbRzJF+Lvf9vasd2PtR0DfGmiHpVIdOuGgovLExnCK0VS4Tv
 KvR4zNerfQNHl9WeBdiPziu4mri57H8=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-BQVVCiMEMPuBAtFXzXcHHg-1; Wed, 02 Jun 2021 09:40:00 -0400
X-MC-Unique: BQVVCiMEMPuBAtFXzXcHHg-1
Received: by mail-yb1-f197.google.com with SMTP id
 d63-20020a254f420000b02904f91ef33453so3188967ybb.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 06:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RSyNYGQzSIGWwH69Ad9FPmGQv4nF3yGhgBhDO7Psolk=;
 b=Atu4ZRSLiz1VAq20liXW1n9ch8JmsMVn8OWfYT+kbij7ASwvEZly3GFLQ5APMTYoVg
 yZzRx1EVxSy0BuFsX8kCFa3FS+mBJtBaYJapCY0QpCqlstS+cUj1IjqHrz+XZTQizOU4
 SuF8j2MHvWC+GOOfdmFyeS0ZMCMmUQ1SqQXvj8VnNu8XnIq8EnASRg3BVmaqxbFxFsGh
 mx1gLXhFz2Aw4DNq0zxXBkP9wqazH7lSC3DKvs1Z/bWCB8BsGlINjWALsk7IMXeJHJQ1
 OsmA83j6mifR5VFynvndMi6lrVYfNYBfiwBRDrQNJD4K7cgP01S+MlJo7MMFtmbO3N9h
 jyaw==
X-Gm-Message-State: AOAM532/MsLHHBFnoOn8i0MRPHo9XClLJHty4aX+OAU1B23Vym5YF9fI
 M3q9TX1bgneo+rbTMMj0nymJLZaE+gHqKQRqoKuup7z3AUcT+Yh8H9o7vY88rsYn1/0FbV5sa1P
 jdJZy/obFf2ToRE0A4JI6Z/wi9+l7cyAiMhADBdDzFQ==
X-Received: by 2002:a25:1fc1:: with SMTP id
 f184mr49512901ybf.289.1622641199361; 
 Wed, 02 Jun 2021 06:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw5HMz1i5JZoc28rMvNEKCzlMpWnbJkeOjx0h3wVL7BIyqJUVNqQMi69Vk7Zxbp7rEd6SlqgoL+Hsz/MSD+is=
X-Received: by 2002:a25:1fc1:: with SMTP id
 f184mr49512857ybf.289.1622641199013; 
 Wed, 02 Jun 2021 06:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
In-Reply-To: <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 2 Jun 2021 15:39:43 +0200
Message-ID: <CAFqZXNsh9njbFUNBugidbdiNqD3QbKzsw=KgNKSmW5hv-fD6tA@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Paul Moore <paul@paul-moore.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=omosnace@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Fri, May 28, 2021 at 3:37 AM Paul Moore <paul@paul-moore.com> wrote:
> On Mon, May 17, 2021 at 5:22 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >
> > Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
> > lockdown") added an implementation of the locked_down LSM hook to
> > SELinux, with the aim to restrict which domains are allowed to perform
> > operations that would breach lockdown.
> >
> > However, in several places the security_locked_down() hook is called in
> > situations where the current task isn't doing any action that would
> > directly breach lockdown, leading to SELinux checks that are basically
> > bogus.
> >
> > Since in most of these situations converting the callers such that
> > security_locked_down() is called in a context where the current task
> > would be meaningful for SELinux is impossible or very non-trivial (and
> > could lead to TOCTOU issues for the classic Lockdown LSM
> > implementation), fix this by modifying the hook to accept a struct cred
> > pointer as argument, where NULL will be interpreted as a request for a
> > "global", task-independent lockdown decision only. Then modify SELinux
> > to ignore calls with cred == NULL.
>
> I'm not overly excited about skipping the access check when cred is
> NULL.  Based on the description and the little bit that I've dug into
> thus far it looks like using SECINITSID_KERNEL as the subject would be
> much more appropriate.  *Something* (the kernel in most of the
> relevant cases it looks like) is requesting that a potentially
> sensitive disclosure be made, and ignoring it seems like the wrong
> thing to do.  Leaving the access control intact also provides a nice
> avenue to audit these requests should users want to do that.
>
> Those users that generally don't care can grant kernel_t all the
> necessary permissions without much policy.

Seems kind of pointless to me, but it's a relatively simple change to
do a check against SECINITSID_KERNEL, so I don't mind doing it like
that.

> > Since most callers will just want to pass current_cred() as the cred
> > parameter, rename the hook to security_cred_locked_down() and provide
> > the original security_locked_down() function as a simple wrapper around
> > the new hook.
>
> I know you and Casey went back and forth on this in v1, but I agree
> with Casey that having two LSM hooks here is a mistake.  I know it
> makes backports hard, but spoiler alert: maintaining complex software
> over any non-trivial period of time is hard, reeeeally hard sometimes
> ;)

Do you mean having two slots in lsm_hook_defs.h or also having two
security_*() functions? (It's not clear to me if you're just
reiterating disagreement with v1 or if you dislike the simplified v2
as well.)

> > The callers migrated to the new hook, passing NULL as cred:
> > 1. arch/powerpc/xmon/xmon.c
> >      Here the hook seems to be called from non-task context and is only
> >      used for redacting some sensitive values from output sent to
> >      userspace.
>
> This definitely sounds like kernel_t based on the description above.

Here I'm a little concerned that the hook might be called from some
unusual interrupt, which is not masked by spin_lock_irqsave()... We
ran into this with PMI (Platform Management Interrupt) before, see
commit 5ae5fbd21079 ("powerpc/perf: Fix handling of privilege level
checks in perf interrupt context"). While I can't see anything that
would suggest something like this happening here, the whole thing is
so foreign to me that I'm wary of making assumptions :)

@Michael/PPC devs, can you confirm to us that xmon_is_locked_down() is
only called from normal syscall/interrupt context (as opposed to
something tricky like PMI)?

> > 2. fs/tracefs/inode.c:tracefs_create_file()
> >      Here the call is used to prevent creating new tracefs entries when
> >      the kernel is locked down. Assumes that locking down is one-way -
> >      i.e. if the hook returns non-zero once, it will never return zero
> >      again, thus no point in creating these files.
>
> More kernel_t.

This should be OK.

> > 3. kernel/trace/bpf_trace.c:bpf_probe_read_kernel{,_str}_common()
> >      Called when a BPF program calls a helper that could leak kernel
> >      memory. The task context is not relevant here, since the program
> >      may very well be run in the context of a different task than the
> >      consumer of the data.
> >      See: https://bugzilla.redhat.com/show_bug.cgi?id=1955585
>
> The access control check isn't so much who is consuming the data, but
> who is requesting a potential violation of a "lockdown", yes?  For
> example, the SELinux policy rule for the current lockdown check looks
> something like this:
>
>   allow <who> <who> : lockdown { <reason> };
>
> It seems to me that the task context is relevant here and performing
> the access control check based on the task's domain is correct.  If we
> are also concerned about who has access to this sensitive information
> once it has been determined that the task can cause it to be sent, we
> should have another check point for that, assuming the access isn't
> already covered by another check/hook.

This case is being discussed further in this thread, so I'm going to
skip it in this reply.

> > 4. net/xfrm/xfrm_user.c:copy_to_user_*()
> >      Here a cryptographic secret is redacted based on the value returned
> >      from the hook. There are two possible actions that may lead here:
> >      a) A netlink message XFRM_MSG_GETSA with NLM_F_DUMP set - here the
> >         task context is relevant, since the dumped data is sent back to
> >         the current task.
>
> If the task context is relevant we should use it.

Yes, but as I said it would create an asymmetry with case b), which
I'll expand on below...

> >      b) When deleting an SA via XFRM_MSG_DELSA, the dumped SAs are
> >         broadcasted to tasks subscribed to XFRM events - here the
> >         SELinux check is not meningful as the current task's creds do
> >         not represent the tasks that could potentially see the secret.
>
> This looks very similar to the BPF hook discussed above, I believe my
> comments above apply here as well.

Using the current task is just logically wrong in this case. The
current task here is just simply deleting an SA that happens to have
some secret value in it. When deleting an SA, a notification is sent
to a group of subscribers (some group of other tasks), which includes
a dump of the secret value. The current task isn't doing any attempt
to breach lockdown, it's just deleting an SA.

It also makes it really awkward to make policy decisions around this.
Suppose that domains A, B, and C need to be able to add/delete SAs and
domains D, E, and F need to receive notifications about changes in
SAs. Then if, say, domain E actually needs to see the secret values in
the notifications, you must grant the confidentiality permission to
all of A, B, C to keep things working. And now you have opened up the
door for A, B, C to do other lockdown-confidentiality stuff, even
though these domains themselves actually don't request/need any
confidential data from the kernel. That's just not logical and you may
actually end up (slightly) worse security-wise than if you just
skipped checking for XFRM secrets altogether, because you need to
allow confidentiality to domains for which it may be excessive.

This is why I talk about the task that gets to see the sensitive
values as the relevant one - because otherwise the semantics of a
given domain having the confidentiality permission granted becomes
very hard to reason about.

> >      It really doesn't seem worth it to try to preserve the check in the
> >      a) case ...
>
> After you've read all of the above I hope you can understand why I
> disagree with this.
>
> >      ... since the eventual leak can be circumvented anyway via b)
>
> I don't follow the statement above ... ?  However I'm not sure it
> matters much considering my other concerns.

What I meant was that if we skip/kernel_t-ize the check in case b)
(for which I don't see a good alternative), then denying
confidentiality perm to a given domain wouldn't prevent it from seeing
the key value, as it could potentially see them by subscribing to SA
modification events. IMO, in that case it's better to just give up on
controlling the SA secrets with SELinux lockdown altogether than to
create some false assumptions of this being covered. You may disagree
and would be willing to implement the partial checking as well if you
insist, but we need to first come to a consensus about case b) before
such discussion becomes relevant, anyway...

Given the yet unresolved discussions around the XFRM and BPF cases, I
plan to respin the patch with just the tracefs and xmon changes and we
can then incrementally address the rest as the individual discussions
come to a consensus.

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

