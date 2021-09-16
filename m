Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603440D1E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 05:00:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H91zR0tZYz2xsj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 13:00:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=EyxUWdCt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=EyxUWdCt; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H91yl16kjz2xYP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 12:59:41 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id t6so11071224edi.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 19:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bK17SO3X70z4YqfpudbGkJpUfQn3wXsVxii6aCrF/hI=;
 b=EyxUWdCtuNTuayC9lkcXPgWleZ8bHcRF7PdMazQqlX+DjN9DeK/P5kGPXL3QuXc4XW
 kCgGjVmBNRQnk+BE9t74LsnVFUsl79l/tR744ZWrHrY1q1f8UXZIfqGeNr9nIVh/Q8XZ
 dWMhuOOQvK/PO5kIKb7pDZQmaBTkjQ3/i/zTAK5Zm+2YJjLZG5lfLuc2ORkyvnY34dye
 Xj+oZOtcMXWk5RLjnJN9KnknPwThumRU8WZHr0gufgDmlXKMMBoCNzRhyy4O28ek49cR
 P8hMd3liqmlSRporSijNz40h8Nv8X4Chbv8pQaKssVolCWCDl8dX0L29zoZoTm+1Zjjd
 Qr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bK17SO3X70z4YqfpudbGkJpUfQn3wXsVxii6aCrF/hI=;
 b=Gn67adT9IVNLAWF8nJ6W4XMYqPn+xdCJ7LnQa764+oXnPol2snGmNVhkWjGVrY8OOA
 X+0KNIeRAhPP0PV/HfLylZnC9Ql4y06kUqUn8kCeYz+F/v+6bBPCfXf7LUJrS5Xi1wLg
 bHlvwwst9Gpfym8gXFLso0xY084/1+cymOqt5Ctlc+V8xhoiKCvE6TmsloJApy26/9MP
 y+mPKC2w6bvjNm7tcXuV92c9afYHjOXeBl5oo0iiMHWvQK8dt2ulPiqDwL/tPAeUgiIY
 10aBINQVmiTGLdgR/co+mAx4+5OOtmv4edAi0yuDYvlzj3b+Nut+0QNPs1MfMPd6RDeU
 F3uw==
X-Gm-Message-State: AOAM533G0xPzGC9XHR4b/AkAGN/dF2TucPMFtU8ExUN711zWbp1O/5iB
 lEj0IJnCf0GK33fWQc1hCT9xxN5NaQpYp9rbPWM6
X-Google-Smtp-Source: ABdhPJxYzI63Wh7B932JufxmCVl5MRmcZoWxKUOX5ts9dsculQ1nMB73xM3IEM0/sD5sdM0oPHDUFMQFvAvBgYyICR4=
X-Received: by 2002:a17:907:76e7:: with SMTP id
 kg7mr3719013ejc.344.1631761175250; 
 Wed, 15 Sep 2021 19:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210913140229.24797-1-omosnace@redhat.com>
 <CAHC9VhRw-S+zZUFz5QFFLMBATjo+YbPAiR21jX6p7cT0T+MVLA@mail.gmail.com>
In-Reply-To: <CAHC9VhRw-S+zZUFz5QFFLMBATjo+YbPAiR21jX6p7cT0T+MVLA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 15 Sep 2021 22:59:23 -0400
Message-ID: <CAHC9VhQyejnmLn0NHQiWzikHs8ZdzAUdZ2WqNxgGM6xhJ4mvMQ@mail.gmail.com>
Subject: Re: [PATCH v4] lockdown,selinux: fix wrong subject in some SELinux
 lockdown checks
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
Cc: linux-efi@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 James Morris <jmorris@namei.org>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Casey Schaufler <casey@schaufler-ca.com>,
 Dan Williams <dan.j.williams@intel.com>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 13, 2021 at 5:05 PM Paul Moore <paul@paul-moore.com> wrote:
>
> On Mon, Sep 13, 2021 at 10:02 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
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
> > To fix this, add an explicit struct cred pointer argument to
> > security_lockdown() and define NULL as a special value to pass instead
> > of current_cred() in such situations. LSMs that take the subject
> > credentials into account can then fall back to some default or ignore
> > such calls altogether. In the SELinux lockdown hook implementation, use
> > SECINITSID_KERNEL in case the cred argument is NULL.
> >
> > Most of the callers are updated to pass current_cred() as the cred
> > pointer, thus maintaining the same behavior. The following callers are
> > modified to pass NULL as the cred pointer instead:
> > 1. arch/powerpc/xmon/xmon.c
> >      Seems to be some interactive debugging facility. It appears that
> >      the lockdown hook is called from interrupt context here, so it
> >      should be more appropriate to request a global lockdown decision.
> > 2. fs/tracefs/inode.c:tracefs_create_file()
> >      Here the call is used to prevent creating new tracefs entries when
> >      the kernel is locked down. Assumes that locking down is one-way -
> >      i.e. if the hook returns non-zero once, it will never return zero
> >      again, thus no point in creating these files. Also, the hook is
> >      often called by a module's init function when it is loaded by
> >      userspace, where it doesn't make much sense to do a check against
> >      the current task's creds, since the task itself doesn't actually
> >      use the tracing functionality (i.e. doesn't breach lockdown), just
> >      indirectly makes some new tracepoints available to whoever is
> >      authorized to use them.
> > 3. net/xfrm/xfrm_user.c:copy_to_user_*()
> >      Here a cryptographic secret is redacted based on the value returned
> >      from the hook. There are two possible actions that may lead here:
> >      a) A netlink message XFRM_MSG_GETSA with NLM_F_DUMP set - here the
> >         task context is relevant, since the dumped data is sent back to
> >         the current task.
> >      b) When adding/deleting/updating an SA via XFRM_MSG_xxxSA, the
> >         dumped SA is broadcasted to tasks subscribed to XFRM events -
> >         here the current task context is not relevant as it doesn't
> >         represent the tasks that could potentially see the secret.
> >      It doesn't seem worth it to try to keep using the current task's
> >      context in the a) case, since the eventual data leak can be
> >      circumvented anyway via b), plus there is no way for the task to
> >      indicate that it doesn't care about the actual key value, so the
> >      check could generate a lot of "false alert" denials with SELinux.
> >      Thus, let's pass NULL instead of current_cred() here faute de
> >      mieux.
> >
> > Improvements-suggested-by: Casey Schaufler <casey@schaufler-ca.com>
> > Improvements-suggested-by: Paul Moore <paul@paul-moore.com>
> > Fixes: 59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
> > Acked-by: Dan Williams <dan.j.williams@intel.com>         [cxl]
> > Acked-by: Steffen Klassert <steffen.klassert@secunet.com> [xfrm]
> > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> > ---
> >
> > v4:
> > - rebase on top of TODO
> > - fix rebase conflicts:
> >   * drivers/cxl/pci.c
> >     - trivial: the lockdown reason was corrected in mainline
> >   * kernel/bpf/helpers.c, kernel/trace/bpf_trace.c
> >     - trivial: LOCKDOWN_BPF_READ was renamed to LOCKDOWN_BPF_READ_KERNEL
> >       in mainline
> >   * kernel/power/hibernate.c
> >     - trivial: !secretmem_active() was added to the condition in
> >       hibernation_available()
> > - cover new security_locked_down() call in kernel/bpf/helpers.c
> >   (LOCKDOWN_BPF_WRITE_USER in BPF_FUNC_probe_write_user case)
> >
> > v3: https://lore.kernel.org/lkml/20210616085118.1141101-1-omosnace@redhat.com/
> > - add the cred argument to security_locked_down() and adapt all callers
> > - keep using current_cred() in BPF, as the hook calls have been shifted
> >   to program load time (commit ff40e51043af ("bpf, lockdown, audit: Fix
> >   buggy SELinux lockdown permission checks"))
> > - in SELinux, don't ignore hook calls where cred == NULL, but use
> >   SECINITSID_KERNEL as the subject instead
> > - update explanations in the commit message
> >
> > v2: https://lore.kernel.org/lkml/20210517092006.803332-1-omosnace@redhat.com/
> > - change to a single hook based on suggestions by Casey Schaufler
> >
> > v1: https://lore.kernel.org/lkml/20210507114048.138933-1-omosnace@redhat.com/
>
> The changes between v3 and v4 all seem sane to me, but I'm going to
> let this sit for a few days in hopes that we can collect a few more
> Reviewed-bys and ACKs.  If I don't see any objections I'll merge it
> mid-week(ish) into selinux/stable-5.15 and plan on sending it to Linus
> after it goes through a build/test cycle.

Time's up, I just merged this into selinux/stable-5.15 and I'll send
this to Linus once it passes testing.

-- 
paul moore
www.paul-moore.com
