Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9113394381
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 15:42:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fs5V86Jxtz306y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 23:42:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aZjWNNFp;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKg0wS9n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aZjWNNFp; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=KKg0wS9n; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fs5Tc6QGKz2yRQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 23:42:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622209343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U2IqSZIHmJs1U626ov1801TPHqiAMQZgW3aXqcOf9ok=;
 b=aZjWNNFpyQHmN4fJRFe2e1L+qm+2GVOLTllFx5KP0SBVVo9oBsx5uX+ndH5Q9Svr313pvP
 Gsm9NeqK5jvoDMhBiHJePpVoXMV+mN/NpApf1f9trz6pzFYzh437ZPufESchFrRSSL+65c
 aFaDfcLOQKs2XWnSzXhtjyfpH8JLdbE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622209344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U2IqSZIHmJs1U626ov1801TPHqiAMQZgW3aXqcOf9ok=;
 b=KKg0wS9ntg4tZQJLLQC2IDwVlN81IrJpnEAisHXKbD1RadfNjDJWE/HDRpRQkr7gEkseI8
 geBUkTRozdNzJgALeHMx59yG88Y9jipMmm+wAp6ANlVBviPL0SyPWzqoBFlE8A77ShjNsw
 NP5oRxnoOoaP9ZquF5X0ebWk8DDZraU=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-m6g0lzFMO_iCRymQvASQFw-1; Fri, 28 May 2021 09:42:22 -0400
X-MC-Unique: m6g0lzFMO_iCRymQvASQFw-1
Received: by mail-yb1-f199.google.com with SMTP id
 22-20020a250d160000b0290532b914c9f4so1236628ybn.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 06:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2IqSZIHmJs1U626ov1801TPHqiAMQZgW3aXqcOf9ok=;
 b=RWplQwWW3NCqSEf8EW/ggo9D0EZ98Blk90C+aP7pVKF/L7uMFrtlVsY5oZxaF/2eKU
 I1EOMrCP1nmiiSOfPiY4Pr1UJNxP9WKztpR8XI6oc49DG4UFivAR8Hp+ItAqHWvHxSCt
 0FsHTPr8RIm2z/EVOoRvE8ZKPYTGcMb+mcFdGgxpDy8SU1xjkB75eDMiJO5o0YkQcp6F
 QcEMLTDKHKaS9qEZKV4FF2qEgtZkcCDLygE+dPznfFYBmcWehLE9aegMZwqTzKmHh7qQ
 aVGtCxRy6+N6Vq+CdQbojPlDcwNUeuxn+zi/PH+LZx4EiimxD5WHQmR2UHZxfitROGb/
 N+mA==
X-Gm-Message-State: AOAM532k2ILjy1YO3S++3alANT39r0HJOcgRjFvBYOLAJN88trDsFbn4
 ph+Ve5+1OTTaLuD7w71iAx5pnqKcBXGWG1+5Adaz4vuS+RFS1rpoDkZAgj8R7wS7ux2fM0sBD1w
 1r7edfrK0ztzPbWwpbp5PcM68+kvx0ZESVRgCoZdJlw==
X-Received: by 2002:a25:f208:: with SMTP id i8mr12505990ybe.340.1622209341654; 
 Fri, 28 May 2021 06:42:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzY+Q3lAZD5z2I0qCaLzE8vPZbw30C0qe9jw96SwP96ICqH8giHKwWORUSXlm+cwx1tCc/b+Qf60iJexuKP47M=
X-Received: by 2002:a25:f208:: with SMTP id i8mr12505951ybe.340.1622209341353; 
 Fri, 28 May 2021 06:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
 <01135120-8bf7-df2e-cff0-1d73f1f841c3@iogearbox.net>
 <4fee8c12-194f-3f85-e28b-f7f24ab03c91@iogearbox.net>
In-Reply-To: <4fee8c12-194f-3f85-e28b-f7f24ab03c91@iogearbox.net>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Fri, 28 May 2021 15:42:06 +0200
Message-ID: <CAFqZXNsKf5wSGmspEVEDrm4Ywar-F4kJWbBPBE+_hd1CGQ3jhg@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Daniel Borkmann <daniel@iogearbox.net>
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
Cc: Jiri Olsa <jolsa@redhat.com>, Paul Moore <paul@paul-moore.com>,
 SElinux list <selinux@vger.kernel.org>, network dev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Steven Rostedt <rostedt@goodmis.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, andrii.nakryiko@gmail.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(I'm off work today and plan to reply also to Paul's comments next
week, but for now let me at least share a couple quick thoughts on
Daniel's patch.)

On Fri, May 28, 2021 at 11:56 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 5/28/21 9:09 AM, Daniel Borkmann wrote:
> > On 5/28/21 3:37 AM, Paul Moore wrote:
> >> On Mon, May 17, 2021 at 5:22 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
> >>>
> >>> Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
> >>> lockdown") added an implementation of the locked_down LSM hook to
> >>> SELinux, with the aim to restrict which domains are allowed to perform
> >>> operations that would breach lockdown.
> >>>
> >>> However, in several places the security_locked_down() hook is called in
> >>> situations where the current task isn't doing any action that would
> >>> directly breach lockdown, leading to SELinux checks that are basically
> >>> bogus.
> >>>
> >>> Since in most of these situations converting the callers such that
> >>> security_locked_down() is called in a context where the current task
> >>> would be meaningful for SELinux is impossible or very non-trivial (and
> >>> could lead to TOCTOU issues for the classic Lockdown LSM
> >>> implementation), fix this by modifying the hook to accept a struct cred
> >>> pointer as argument, where NULL will be interpreted as a request for a
> >>> "global", task-independent lockdown decision only. Then modify SELinux
> >>> to ignore calls with cred == NULL.
> >>
> >> I'm not overly excited about skipping the access check when cred is
> >> NULL.  Based on the description and the little bit that I've dug into
> >> thus far it looks like using SECINITSID_KERNEL as the subject would be
> >> much more appropriate.  *Something* (the kernel in most of the
> >> relevant cases it looks like) is requesting that a potentially
> >> sensitive disclosure be made, and ignoring it seems like the wrong
> >> thing to do.  Leaving the access control intact also provides a nice
> >> avenue to audit these requests should users want to do that.
> >
> > I think the rationale/workaround for ignoring calls with cred == NULL (or the previous
> > patch with the unimplemented hook) from Ondrej was two-fold, at least speaking for his
> > seen tracing cases:
> >
> >    i) The audit events that are triggered due to calls to security_locked_down()
> >       can OOM kill a machine, see below details [0].
> >
> >   ii) It seems to be causing a deadlock via slow_avc_audit() -> audit_log_end()
> >       when presumingly trying to wake up kauditd [1].

Actually, I wasn't aware of the deadlock... But calling an LSM hook
[that is backed by a SELinux access check] from within a BPF helper is
calling for all kinds of trouble, so I'm not surprised :)

> Ondrej / Paul / Jiri: at least for the BPF tracing case specifically (I haven't looked
> at the rest but it's also kind of independent), the attached fix should address both
> reported issues, please take a look & test.

Thanks, I like this solution, although there are a few gotchas:

1. This patch creates a slight "regression" in that if someone flips
the Lockdown LSM into lockdown mode on runtime, existing (already
loaded) BPF programs will still be able to call the
confidentiality-breaching helpers, while before the lockdown would
apply also to them. Personally, I don't think it's a big deal (and I
bet there are other existing cases where some handle kept from before
lockdown could leak data), but I wanted to mention it in case someone
thinks the opposite.

2. IIUC. when a BPF program is rejected due to lockdown/SELinux, the
kernel will return -EINVAL to userspace (looking at
check_helper_call() in kernel/bpf/verifier.c; didn't have time to look
at other callers...). It would be nicer if the error code from the
security_locked_down() call would be passed through the call chain and
eventually returned to the caller. It should be relatively
straightforward to convert bpf_base_func_proto() to return a PTR_ERR()
instead of NULL on error, but it looks like this would result in quite
a big patch updating all the callers (and callers of callers, etc.)
with a not-so-small chance of missing some NULL check and introducing
a bug... I guess we could live with EINVAL-on-denied in stable kernels
and only have the error path refactoring in -next; I'm not sure...

3. This is a bit of a shot-in-the-dark, but I suppose there might be
some BPF programs that would be able to do something useful also when
the read_kernel helpers return an error, yet the kernel will now
outright refuse to load them (when the lockdown hook returns nonzero).
I have no idea if such BPF programs realistically exist in practice,
but perhaps it would be worth returning some dummy
always-error-returning helper function instead of NULL from
bpf_base_func_proto() when security_locked_down() returns an error.
That would also resolve (2.), basically. (Then there is the question
of what error code to use (because Lockdown LSM uses -EPERM, while
SELinux -EACCESS), but I think always returning -EPERM from such stub
helpers would be a viable choice.)

-- 
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

