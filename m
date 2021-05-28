Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E0394567
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 17:48:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fs8H14B5Fz30CZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 01:48:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=cV3BLzZE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=cV3BLzZE; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fs8GW74nrz2yYc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 01:48:01 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id lg14so6023017ejb.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cedQ3gdQGSeryyIBkgL2iEXtO51+6C0BVmoVaS+PlM8=;
 b=cV3BLzZEFVqzScfaH+W2YK1IING9yBQLn3zs/n4gZ/1QFQkDsq4/sT+Oz99jSji5OB
 zMnYo8T2L2JzSDnjz3XCqMFWyADusnMnQUIYhGMPTz7q4lfwQiaODHEtfNCa3vdf1sUN
 qiVX84dZNOsQWGTudOMSBi3ad6uuqnawwLDXa8x2HKDGZ5kHWAcQUYPTvufJzA8W0211
 2H79PEPxxkqVJMjWi2CozKYpkBJGsoo491sHWLofkgqkGyNujdcBqMelLZi4dmYHCj8b
 pOKX1NVawxYnhgJQJAJRofEZRnqYwlQwS4zBKPV3A/knri21lHjUHOk4+i++RwAMO6gZ
 ra4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cedQ3gdQGSeryyIBkgL2iEXtO51+6C0BVmoVaS+PlM8=;
 b=NCILNzB9YZ/op8+7eGvyhpsU6oGshyGpNBKehw+xjylpUSEBR/0MKw9Aa5a2GwBjcT
 GpQ6zI9AKbzbfKyahiszR5PYTq9Eia3pzQ6HKDxbL89PdQHAKpm0XSl2VR+ry3mHnylO
 0SinXmXDGJbdWDI9Z8SsUJ/8UwdYSnSgkz5TB21j3eVQz7o67FELJNhKFtqRlxnjN5Dj
 JQoOGV3xLKIqLfRJNfW+PZ/qzK/0ng9BjBHwz9iryFmf71mHgOZ+glxFYJsREG57MI17
 AKgy7/lORkWG+47dAiLn+bpLvpQHRJH3Yv7Fxciq6xrvNR3knceMdxLJWbk69W+8H3QG
 mpVQ==
X-Gm-Message-State: AOAM530LjYX3wT7rbYWC03VjfqNY9oS3MpXGwElGBYZ0rT8hkpXLMlvU
 JN0gM7sTjpAxfELxqjkjob8siAl3lmZzIO+lApM9
X-Google-Smtp-Source: ABdhPJy5zGrumOsF35e9/C8VOmP4TnS6oe5zK2otc0QgHld1PJrO+rbOMzZA/egUo9LAH2Kzd15DYfSROZYt4coiLJ8=
X-Received: by 2002:a17:906:840c:: with SMTP id
 n12mr9552143ejx.431.1622216871579; 
 Fri, 28 May 2021 08:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
In-Reply-To: <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 28 May 2021 11:47:40 -0400
Message-ID: <CAHC9VhR-kYmMA8gsqkiL5=poN9FoL-uCyx1YOLCoG2hRiUBYug@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Daniel Borkmann <daniel@iogearbox.net>
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
Cc: jolsa@redhat.com, selinux@vger.kernel.org, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 James Morris <jmorris@namei.org>, Casey Schaufler <casey@schaufler-ca.com>,
 linux-security-module@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 28, 2021 at 3:10 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 5/28/21 3:37 AM, Paul Moore wrote:
> > On Mon, May 17, 2021 at 5:22 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >>
> >> Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
> >> lockdown") added an implementation of the locked_down LSM hook to
> >> SELinux, with the aim to restrict which domains are allowed to perform
> >> operations that would breach lockdown.
> >>
> >> However, in several places the security_locked_down() hook is called in
> >> situations where the current task isn't doing any action that would
> >> directly breach lockdown, leading to SELinux checks that are basically
> >> bogus.
> >>
> >> Since in most of these situations converting the callers such that
> >> security_locked_down() is called in a context where the current task
> >> would be meaningful for SELinux is impossible or very non-trivial (and
> >> could lead to TOCTOU issues for the classic Lockdown LSM
> >> implementation), fix this by modifying the hook to accept a struct cred
> >> pointer as argument, where NULL will be interpreted as a request for a
> >> "global", task-independent lockdown decision only. Then modify SELinux
> >> to ignore calls with cred == NULL.
> >
> > I'm not overly excited about skipping the access check when cred is
> > NULL.  Based on the description and the little bit that I've dug into
> > thus far it looks like using SECINITSID_KERNEL as the subject would be
> > much more appropriate.  *Something* (the kernel in most of the
> > relevant cases it looks like) is requesting that a potentially
> > sensitive disclosure be made, and ignoring it seems like the wrong
> > thing to do.  Leaving the access control intact also provides a nice
> > avenue to audit these requests should users want to do that.
>
> I think the rationale/workaround for ignoring calls with cred == NULL (or the previous
> patch with the unimplemented hook) from Ondrej was two-fold, at least speaking for his
> seen tracing cases:
>
>    i) The audit events that are triggered due to calls to security_locked_down()
>       can OOM kill a machine, see below details [0].
>
>   ii) It seems to be causing a deadlock via slow_avc_audit() -> audit_log_end()
>       when presumingly trying to wake up kauditd [1].
>
> How would your suggestion above solve both i) and ii)?

First off, a bit of general commentary - I'm not sure if Ondrej was
aware of this, but info like that is good to have in the commit
description.  Perhaps it was in the linked RHBZ but I try not to look
at those when reviewing patches; the commit descriptions must be
self-sufficient since we can't rely on the accessibility or the
lifetime of external references.  It's fine if people want to include
external links in their commits, I would actually even encourage it in
some cases, but the links shouldn't replace a proper description of
the problem and why the proposed solution is The Best Solution.

With that out of the way, it sounds like your issue isn't so much the
access check, but rather the frequency of the access denials and the
resulting audit records in your particular use case.  My initial
reaction is that you might want to understand why you are getting so
many SELinux access denials, your loaded security policy clearly does
not match with your intended use :)  Beyond that, if you want to
basically leave things as-is but quiet the high frequency audit
records that result from these SELinux denials you might want to look
into the SELinux "dontaudit" policy rule, it was created for things
like this.  Some info can be found in The SELinux Notebook, relevant
link below:

* https://github.com/SELinuxProject/selinux-notebook/blob/main/src/avc_rules.md#dontaudit

The deadlock issue that was previously reported remains an open case
as far as I'm concerned; I'm presently occupied trying to sort out a
rather serious issue with respect to io_uring and LSM/audit (plus
general stuff at $DAYJOB) so I haven't had time to investigate this
any further.  Of course anyone else is welcome to dive into it (I
always want to encourage this, especially from "performance people"
who just want to shut it all off), however if the answer is basically
"disable LSM and/or audit checks" you have to know that it is going to
result in a high degree of skepticism from me, so heavy documentation
on why it is The Best Solution would be a very good thing :)  Beyond
that, I think the suggestions above of "why do you have so many policy
denials?" and "have you looked into dontaudit?" are solid places to
look for a solution in your particular case.

> >> Since most callers will just want to pass current_cred() as the cred
> >> parameter, rename the hook to security_cred_locked_down() and provide
> >> the original security_locked_down() function as a simple wrapper around
> >> the new hook.
>
> [...]
> >
> >> 3. kernel/trace/bpf_trace.c:bpf_probe_read_kernel{,_str}_common()
> >>       Called when a BPF program calls a helper that could leak kernel
> >>       memory. The task context is not relevant here, since the program
> >>       may very well be run in the context of a different task than the
> >>       consumer of the data.
> >>       See: https://bugzilla.redhat.com/show_bug.cgi?id=1955585
> >
> > The access control check isn't so much who is consuming the data, but
> > who is requesting a potential violation of a "lockdown", yes?  For
> > example, the SELinux policy rule for the current lockdown check looks
> > something like this:
> >
> >    allow <who> <who> : lockdown { <reason> };
> >
> > It seems to me that the task context is relevant here and performing
> > the access control check based on the task's domain is correct.
>
> This doesn't make much sense to me, it's /not/ the task 'requesting a potential
> violation of a "lockdown"', but rather the running tracing program which is e.g.
> inspecting kernel data structures around the triggered event. If I understood
> you correctly, having an 'allow' check on, say, httpd would be rather odd since
> things like perf/bcc/bpftrace/systemtap/etc is installing the tracing probe instead.
>
> Meaning, if we would /not/ trace such events (like in the prior mentioned syscall
> example), then there is also no call to the security_locked_down() from that same/
> unmodified application.

My turn to say that you don't make much sense to me :)

Let's reset.

What task_struct is running the BPF tracing program which is calling
into security_locked_down()?  My current feeling is that it is this
context/domain/cred that should be used for the access control check;
in the cases where it is a kernel thread, I think passing NULL is
reasonable, but I think the proper thing for SELinux is to interpret
NULL as kernel_t.

-- 
paul moore
www.paul-moore.com
