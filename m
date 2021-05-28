Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A27393B1B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 03:38:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrnQ33k2Qz30Gt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:38:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=POerS0Ux;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=POerS0Ux; dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrnPY0SvKz2xxq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 11:37:51 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id ss26so2968608ejb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 May 2021 18:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCl/OoNf08gbSAkv21GdMjWI/U5EK/VtpzFkOjaRXDc=;
 b=POerS0Ux4ct2bWMhkrOhHCReDGmKwGq49OtylDhjF9lBGQePK0TFjOCijyW8C1Kp/o
 Xh/madiE0TnJlXbz8A9quFOg+/RI5jAUOif+6JsRURl3t/ze4YQnI44921ViT1tdrrM4
 HjuPpQdlOCOYZPPbHCLCzTx/HQU+AEBcGTknBjcNeZrWDZ8YoRD7/wVOL3h3fMalQU3w
 RHKDeBAQIYl6E/bgA3OnVAijXoVpCgmqz+qBj1zfhN7HjvWBWklw9U4UDflAOFogdwNn
 LQdislTgKFgkdjsNn26pf+B5s1Ifqow6EwLkeFnrksRVYEWkqLWG9JczSwAXar565r2c
 BXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCl/OoNf08gbSAkv21GdMjWI/U5EK/VtpzFkOjaRXDc=;
 b=sycy9h5AGVgHeyDjEjSTYl7H4LPbCfhJ3m2sfLtVgq2JQz8G4fhNGDB/lhsgOp+vsP
 B2XIYaQxwEzdcK1qA4bginZSQNCamA+YMV7Kily13hOEvnvhOfVW+oozEioknW6NsnDo
 /WR4UIsguLZi0nqYQkWl/MwfvBQPOgDeYxHzYJmnV7jpDGlMMlV5jXcTJRAmQLIYcwl2
 ae1x21dnoLeJ4JL1iMNu7np8ry3bjQLRF9i7QIio6KzwTiVOm0SObVSPO0x9cc1gvgXL
 yqy8liQh0c/UOvT66dtMbW0j5T+HXFAVqymakq1txmCz5BpyVExsh4Bo7L32fzQUcEGC
 9rTw==
X-Gm-Message-State: AOAM531ZOIwP316LzLqaEeNsMlKeDSZeeciSzRF9znXJKfmG0/UUyLR7
 t0d09ODSXLlksH4QlWHIXQHhtf+SRQPbuhRJF85f
X-Google-Smtp-Source: ABdhPJxLOItL9vdGc/YxGb4zM3gCgphGyyxSx8AHRjJ/9K0sjs3QF6XIJzfJvXSrGS6ej4rkXclv/bfnao0YEc+kFow=
X-Received: by 2002:a17:906:b2ce:: with SMTP id
 cf14mr6910759ejb.178.1622165863989; 
 Thu, 27 May 2021 18:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
In-Reply-To: <20210517092006.803332-1-omosnace@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 27 May 2021 21:37:33 -0400
Message-ID: <CAHC9VhTasra0tU=bKwVqAwLRYaC+hYakirRz0Mn5jbVMuDkwrA@mail.gmail.com>
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
Cc: selinux@vger.kernel.org, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>,
 linux-security-module@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 17, 2021 at 5:22 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
>
> Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
> lockdown") added an implementation of the locked_down LSM hook to
> SELinux, with the aim to restrict which domains are allowed to perform
> operations that would breach lockdown.
>
> However, in several places the security_locked_down() hook is called in
> situations where the current task isn't doing any action that would
> directly breach lockdown, leading to SELinux checks that are basically
> bogus.
>
> Since in most of these situations converting the callers such that
> security_locked_down() is called in a context where the current task
> would be meaningful for SELinux is impossible or very non-trivial (and
> could lead to TOCTOU issues for the classic Lockdown LSM
> implementation), fix this by modifying the hook to accept a struct cred
> pointer as argument, where NULL will be interpreted as a request for a
> "global", task-independent lockdown decision only. Then modify SELinux
> to ignore calls with cred == NULL.

I'm not overly excited about skipping the access check when cred is
NULL.  Based on the description and the little bit that I've dug into
thus far it looks like using SECINITSID_KERNEL as the subject would be
much more appropriate.  *Something* (the kernel in most of the
relevant cases it looks like) is requesting that a potentially
sensitive disclosure be made, and ignoring it seems like the wrong
thing to do.  Leaving the access control intact also provides a nice
avenue to audit these requests should users want to do that.

Those users that generally don't care can grant kernel_t all the
necessary permissions without much policy.

> Since most callers will just want to pass current_cred() as the cred
> parameter, rename the hook to security_cred_locked_down() and provide
> the original security_locked_down() function as a simple wrapper around
> the new hook.

I know you and Casey went back and forth on this in v1, but I agree
with Casey that having two LSM hooks here is a mistake.  I know it
makes backports hard, but spoiler alert: maintaining complex software
over any non-trivial period of time is hard, reeeeally hard sometimes
;)

> The callers migrated to the new hook, passing NULL as cred:
> 1. arch/powerpc/xmon/xmon.c
>      Here the hook seems to be called from non-task context and is only
>      used for redacting some sensitive values from output sent to
>      userspace.

This definitely sounds like kernel_t based on the description above.

> 2. fs/tracefs/inode.c:tracefs_create_file()
>      Here the call is used to prevent creating new tracefs entries when
>      the kernel is locked down. Assumes that locking down is one-way -
>      i.e. if the hook returns non-zero once, it will never return zero
>      again, thus no point in creating these files.

More kernel_t.

> 3. kernel/trace/bpf_trace.c:bpf_probe_read_kernel{,_str}_common()
>      Called when a BPF program calls a helper that could leak kernel
>      memory. The task context is not relevant here, since the program
>      may very well be run in the context of a different task than the
>      consumer of the data.
>      See: https://bugzilla.redhat.com/show_bug.cgi?id=1955585

The access control check isn't so much who is consuming the data, but
who is requesting a potential violation of a "lockdown", yes?  For
example, the SELinux policy rule for the current lockdown check looks
something like this:

  allow <who> <who> : lockdown { <reason> };

It seems to me that the task context is relevant here and performing
the access control check based on the task's domain is correct.  If we
are also concerned about who has access to this sensitive information
once it has been determined that the task can cause it to be sent, we
should have another check point for that, assuming the access isn't
already covered by another check/hook.

> 4. net/xfrm/xfrm_user.c:copy_to_user_*()
>      Here a cryptographic secret is redacted based on the value returned
>      from the hook. There are two possible actions that may lead here:
>      a) A netlink message XFRM_MSG_GETSA with NLM_F_DUMP set - here the
>         task context is relevant, since the dumped data is sent back to
>         the current task.

If the task context is relevant we should use it.

>      b) When deleting an SA via XFRM_MSG_DELSA, the dumped SAs are
>         broadcasted to tasks subscribed to XFRM events - here the
>         SELinux check is not meningful as the current task's creds do
>         not represent the tasks that could potentially see the secret.

This looks very similar to the BPF hook discussed above, I believe my
comments above apply here as well.

>      It really doesn't seem worth it to try to preserve the check in the
>      a) case ...

After you've read all of the above I hope you can understand why I
disagree with this.

>      ... since the eventual leak can be circumvented anyway via b)

I don't follow the statement above ... ?  However I'm not sure it
matters much considering my other concerns.

>      plus there is no way for the task to indicate that it doesn't care
>      about the actual key value, so the check could generate a lot of
>      noise.
>
> Improvements-suggested-by: Casey Schaufler <casey@schaufler-ca.com>
> Fixes: 59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>
> v2:
> - change to a single hook based on suggestions by Casey Schaufler
>
> v1: https://lore.kernel.org/lkml/20210507114048.138933-1-omosnace@redhat.com/
>
>  arch/powerpc/xmon/xmon.c      |  4 ++--
>  fs/tracefs/inode.c            |  2 +-
>  include/linux/lsm_hook_defs.h |  3 ++-
>  include/linux/lsm_hooks.h     |  3 ++-
>  include/linux/security.h      | 11 ++++++++---
>  kernel/trace/bpf_trace.c      |  4 ++--
>  net/xfrm/xfrm_user.c          |  2 +-
>  security/lockdown/lockdown.c  |  5 +++--
>  security/security.c           |  6 +++---
>  security/selinux/hooks.c      | 12 +++++++++---
>  10 files changed, 33 insertions(+), 19 deletions(-)

-- 
paul moore
www.paul-moore.com
