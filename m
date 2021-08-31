Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F303FC4A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 11:10:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzLxg5RVbz2yLQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 19:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QTXu2LAL;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T9N8IfFX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QTXu2LAL; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=T9N8IfFX; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzLww5bVSz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 19:09:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630400973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lCeb7MSVHIA6AQvPBMrpCMcewt6C5Hp/EtiNe37zzes=;
 b=QTXu2LALP6odVSKkRAWN9FGV8TQNpTVp7Kc8cL+vRT9xE1WVNDcnhDazN6cjB+3LsEVy/S
 iaHYFYHHBfhqlaXY4wdaFjSbUDbz6uPBlw72lJrW+RvRhoc9a08ZfleqrdGIlcUx3lGdZ/
 28skhgurbHz+U8a5OpkTGtQPz2n5pME=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630400974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lCeb7MSVHIA6AQvPBMrpCMcewt6C5Hp/EtiNe37zzes=;
 b=T9N8IfFX3nw2JUKRbdli+hEMo57yx3ogCmsH/cIlIRionLIepvqBra72AW1qBcqkCC6D4k
 CTuut8H5EmajgAjSeofOiAeFjZrBtD+iaKMBBFVFKfq8QIF69dvD9T7Xa9MmqAa2jDcDLT
 zmQsvCTMJPljgJ33JaWeD6ux0fgtuPM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-Y1whsINSP62dxcHd_CkG7A-1; Tue, 31 Aug 2021 05:08:20 -0400
X-MC-Unique: Y1whsINSP62dxcHd_CkG7A-1
Received: by mail-yb1-f200.google.com with SMTP id
 131-20020a251489000000b0059bdeb10a84so4934719ybu.15
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 02:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lCeb7MSVHIA6AQvPBMrpCMcewt6C5Hp/EtiNe37zzes=;
 b=WJZy7IWe05fD95aiPA1CyXtZIqBAnn2UpyuCQw4QDBZ38t9KaVqKo+awFmOwi8MHaX
 oC7F+my03GsiHDnOzs7Tk62mRL2YKR4EO0J+ESaGZdm0+KTBKHXykEm5Dk7+Qo0yXwyK
 vvtnPoF1xf8sKSO1D4uyF8/VluF9Aj/TGF0IFQMUl+PZ8O1XbXPV1qVJ69I0FpUStqMR
 liK8IwhNsqoLXfsD6ZkzM34nIzq6QaAn2BN7tLe4wW59MFePUjSHqQJpu100liDpBUfv
 t8+KzRUWCSnhK0VGKAmtZk4ycltlhg04KGURPi7DHwShp84p/tZEDoi9PoLwUEorj28m
 9Vig==
X-Gm-Message-State: AOAM530dt5sSPHZXoitCXkA+0gx4khR/cE7rE9rImD4sXUQcP1+5U6w0
 yxHXULXfytODwN1XwF9An6aZnxZGKJOou6kksLu9nUwkYKE6E0A3Q0IBfYnOOCLwVJXotaA4Elq
 FPdqg8Tp4LS2GUK18pVGa3Wbg2ZWHTI2W6bEpok5xTA==
X-Received: by 2002:a25:c184:: with SMTP id
 r126mr28651660ybf.123.1630400899634; 
 Tue, 31 Aug 2021 02:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4ZNnqHdPHd1KpwqFLFV6AFeVHb5LZ7Jb5RG2vtJXhk7vybNwPbdTc2aQhHuASLbfSbAuaEwPm90oIL61rhUM=
X-Received: by 2002:a25:c184:: with SMTP id
 r126mr28651621ybf.123.1630400899378; 
 Tue, 31 Aug 2021 02:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210616085118.1141101-1-omosnace@redhat.com>
 <CAHC9VhSr2KpeBXuyoHR3_hs+qczFUaBx0oCSMfBBA5UNYU+0KA@mail.gmail.com>
In-Reply-To: <CAHC9VhSr2KpeBXuyoHR3_hs+qczFUaBx0oCSMfBBA5UNYU+0KA@mail.gmail.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Tue, 31 Aug 2021 11:08:08 +0200
Message-ID: <CAFqZXNvJtMOfLk-SLt2S2qt=+-x8fm9jS3NKxFoT0_5d2=8Ckg@mail.gmail.com>
Subject: Re: [PATCH v3] lockdown,selinux: fix wrong subject in some SELinux
 lockdown checks
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
Cc: linux-efi@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org,
 James Morris <jmorris@namei.org>, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, SElinux list <selinux@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Casey Schaufler <casey@schaufler-ca.com>,
 network dev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, kexec@lists.infradead.org,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 18, 2021 at 5:40 AM Paul Moore <paul@paul-moore.com> wrote:
> On Wed, Jun 16, 2021 at 4:51 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
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
> > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
>
> This seems reasonable to me, but before I merge it into the SELinux
> tree I think it would be good to get some ACKs from the relevant
> subsystem folks.  I don't believe we ever saw a response to the last
> question for the PPC folks, did we?

Can we move this forward somehow, please?

Quoting the yet-unanswered question from the v2 thread for convenience:

> > > The callers migrated to the new hook, passing NULL as cred:
> > > 1. arch/powerpc/xmon/xmon.c
[...]
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

I strongly suspect the answer will be just "Of course it is, why would
you even ask such a silly question?", but please let's have it on
record so we can finally get this patch merged...


> > ---
> >
> > v3:
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
> >
> >  arch/powerpc/xmon/xmon.c             |  4 ++--
> >  arch/x86/kernel/ioport.c             |  4 ++--
> >  arch/x86/kernel/msr.c                |  4 ++--
> >  arch/x86/mm/testmmiotrace.c          |  2 +-
> >  drivers/acpi/acpi_configfs.c         |  2 +-
> >  drivers/acpi/custom_method.c         |  2 +-
> >  drivers/acpi/osl.c                   |  3 ++-
> >  drivers/acpi/tables.c                |  2 +-
> >  drivers/char/mem.c                   |  2 +-
> >  drivers/cxl/mem.c                    |  2 +-
> >  drivers/firmware/efi/efi.c           |  2 +-
> >  drivers/firmware/efi/test/efi_test.c |  2 +-
> >  drivers/pci/pci-sysfs.c              |  6 +++---
> >  drivers/pci/proc.c                   |  6 +++---
> >  drivers/pci/syscall.c                |  2 +-
> >  drivers/pcmcia/cistpl.c              |  2 +-
> >  drivers/tty/serial/serial_core.c     |  2 +-
> >  fs/debugfs/file.c                    |  2 +-
> >  fs/debugfs/inode.c                   |  2 +-
> >  fs/proc/kcore.c                      |  2 +-
> >  fs/tracefs/inode.c                   |  2 +-
> >  include/linux/lsm_hook_defs.h        |  2 +-
> >  include/linux/lsm_hooks.h            |  1 +
> >  include/linux/security.h             |  4 ++--
> >  kernel/bpf/helpers.c                 | 10 ++++++----
> >  kernel/events/core.c                 |  2 +-
> >  kernel/kexec.c                       |  2 +-
> >  kernel/kexec_file.c                  |  2 +-
> >  kernel/module.c                      |  2 +-
> >  kernel/params.c                      |  2 +-
> >  kernel/power/hibernate.c             |  3 ++-
> >  kernel/trace/bpf_trace.c             | 20 ++++++++++++--------
> >  kernel/trace/ftrace.c                |  4 ++--
> >  kernel/trace/ring_buffer.c           |  2 +-
> >  kernel/trace/trace.c                 | 10 +++++-----
> >  kernel/trace/trace_events.c          |  2 +-
> >  kernel/trace/trace_events_hist.c     |  4 ++--
> >  kernel/trace/trace_events_synth.c    |  2 +-
> >  kernel/trace/trace_events_trigger.c  |  2 +-
> >  kernel/trace/trace_kprobe.c          |  6 +++---
> >  kernel/trace/trace_printk.c          |  2 +-
> >  kernel/trace/trace_stack.c           |  2 +-
> >  kernel/trace/trace_stat.c            |  2 +-
> >  kernel/trace/trace_uprobe.c          |  4 ++--
> >  net/xfrm/xfrm_user.c                 | 11 +++++++++--
> >  security/lockdown/lockdown.c         |  3 ++-
> >  security/security.c                  |  4 ++--
> >  security/selinux/hooks.c             |  7 +++++--
> >  48 files changed, 97 insertions(+), 77 deletions(-)
>
> --
> paul moore
> www.paul-moore.com
>

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc

