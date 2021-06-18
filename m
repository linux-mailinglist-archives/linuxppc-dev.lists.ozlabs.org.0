Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 431F33AC181
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 05:41:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5l82069kz3c4H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 13:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=2IcUlThU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=2IcUlThU; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5l7Z122Yz3bsW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 13:40:41 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id u24so6572170edy.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 20:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v3U6tSssyiyTmySewt2Ln0yQu0gc7Qdpf16AvD+Xaxk=;
 b=2IcUlThUD9BpN0YyQAHGmGcQr5S6gOJpFAuAjkTFZTnpzRn9tzKgvjENS7ySkBTDUb
 WVu8rDNnk4oMaPDWaYfJqGQq5hspjx3UAm8iGpqhN5Tm3s/4JNu9ecnP/aWmJefz9KgA
 jyaF4PQvWKhcAMY06wY9zLmJ3F3grfHwVu/lTteAZll8NquJe5RM3crl0S/T9nJz4lga
 qE6I+1oXf+z4XpHgtSakyooDjOifTHlFJYDjvZrRG53E21pvvJVkEQhe7yTOwfRW+SR3
 lPE0DbuCzB2/MU+0Ln8LRSJFFCt8crMBcGon76/h7fb0x+sFtOdRmHlxhubL8TVLcdkW
 w8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v3U6tSssyiyTmySewt2Ln0yQu0gc7Qdpf16AvD+Xaxk=;
 b=CE5CMFO+TXEePE/dPjYx+qzVwFxxkS2fggqORBc9nEh+irRsAh12TiofZf9FcQ3R1U
 gR4t1JhjAL3rp2JsvUi7u/baMFrzh5X2UdyfXwvo+EjTyZZJOyF559b50YDpkmohoapm
 YEV8vlSKWElIS7Z1J1gx2mDPNAnqGJkh0ZnmXz+1pgYk5z8XsHghNg1fTJj0c8pDalyY
 zrVQNerFAylBt1ia2AYRP5uZ9ZtgI8hoCmgNRbu4cmUU6owmgjomZsJVn51MryBG3/pn
 2f6bM/go7u9xtuXomzSAAkQVLB5qw9vWSCblhsrToZrfL66oMGmJFZsZSPoHLL54Ga7j
 GxRw==
X-Gm-Message-State: AOAM5322dWYE5be2bH+ov0cLoDrOWGHCIAifK+yon/Q5Lbjsog2hNXs4
 JnRVL/Q4+gssjGHIiKlMG0ShU9GZcfGJnBPOqAA+
X-Google-Smtp-Source: ABdhPJw5b/xZ/eb8rl7JdfhOxmPvL4XDmYW6VYxutA0Sjq6NM72bhKaQUg+rtX3S00r5obIGVrm+f+Zrvy0193ShGoE=
X-Received: by 2002:a05:6402:1771:: with SMTP id
 da17mr2074259edb.31.1623987634898; 
 Thu, 17 Jun 2021 20:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210616085118.1141101-1-omosnace@redhat.com>
In-Reply-To: <20210616085118.1141101-1-omosnace@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 17 Jun 2021 23:40:24 -0400
Message-ID: <CAHC9VhSr2KpeBXuyoHR3_hs+qczFUaBx0oCSMfBBA5UNYU+0KA@mail.gmail.com>
Subject: Re: [PATCH v3] lockdown,selinux: fix wrong subject in some SELinux
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
 netdev@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16, 2021 at 4:51 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
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
> To fix this, add an explicit struct cred pointer argument to
> security_lockdown() and define NULL as a special value to pass instead
> of current_cred() in such situations. LSMs that take the subject
> credentials into account can then fall back to some default or ignore
> such calls altogether. In the SELinux lockdown hook implementation, use
> SECINITSID_KERNEL in case the cred argument is NULL.
>
> Most of the callers are updated to pass current_cred() as the cred
> pointer, thus maintaining the same behavior. The following callers are
> modified to pass NULL as the cred pointer instead:
> 1. arch/powerpc/xmon/xmon.c
>      Seems to be some interactive debugging facility. It appears that
>      the lockdown hook is called from interrupt context here, so it
>      should be more appropriate to request a global lockdown decision.
> 2. fs/tracefs/inode.c:tracefs_create_file()
>      Here the call is used to prevent creating new tracefs entries when
>      the kernel is locked down. Assumes that locking down is one-way -
>      i.e. if the hook returns non-zero once, it will never return zero
>      again, thus no point in creating these files. Also, the hook is
>      often called by a module's init function when it is loaded by
>      userspace, where it doesn't make much sense to do a check against
>      the current task's creds, since the task itself doesn't actually
>      use the tracing functionality (i.e. doesn't breach lockdown), just
>      indirectly makes some new tracepoints available to whoever is
>      authorized to use them.
> 3. net/xfrm/xfrm_user.c:copy_to_user_*()
>      Here a cryptographic secret is redacted based on the value returned
>      from the hook. There are two possible actions that may lead here:
>      a) A netlink message XFRM_MSG_GETSA with NLM_F_DUMP set - here the
>         task context is relevant, since the dumped data is sent back to
>         the current task.
>      b) When adding/deleting/updating an SA via XFRM_MSG_xxxSA, the
>         dumped SA is broadcasted to tasks subscribed to XFRM events -
>         here the current task context is not relevant as it doesn't
>         represent the tasks that could potentially see the secret.
>      It doesn't seem worth it to try to keep using the current task's
>      context in the a) case, since the eventual data leak can be
>      circumvented anyway via b), plus there is no way for the task to
>      indicate that it doesn't care about the actual key value, so the
>      check could generate a lot of "false alert" denials with SELinux.
>      Thus, let's pass NULL instead of current_cred() here faute de
>      mieux.
>
> Improvements-suggested-by: Casey Schaufler <casey@schaufler-ca.com>
> Improvements-suggested-by: Paul Moore <paul@paul-moore.com>
> Fixes: 59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>

This seems reasonable to me, but before I merge it into the SELinux
tree I think it would be good to get some ACKs from the relevant
subsystem folks.  I don't believe we ever saw a response to the last
question for the PPC folks, did we?

> ---
>
> v3:
> - add the cred argument to security_locked_down() and adapt all callers
> - keep using current_cred() in BPF, as the hook calls have been shifted
>   to program load time (commit ff40e51043af ("bpf, lockdown, audit: Fix
>   buggy SELinux lockdown permission checks"))
> - in SELinux, don't ignore hook calls where cred == NULL, but use
>   SECINITSID_KERNEL as the subject instead
> - update explanations in the commit message
>
> v2: https://lore.kernel.org/lkml/20210517092006.803332-1-omosnace@redhat.com/
> - change to a single hook based on suggestions by Casey Schaufler
>
> v1: https://lore.kernel.org/lkml/20210507114048.138933-1-omosnace@redhat.com/
>
>  arch/powerpc/xmon/xmon.c             |  4 ++--
>  arch/x86/kernel/ioport.c             |  4 ++--
>  arch/x86/kernel/msr.c                |  4 ++--
>  arch/x86/mm/testmmiotrace.c          |  2 +-
>  drivers/acpi/acpi_configfs.c         |  2 +-
>  drivers/acpi/custom_method.c         |  2 +-
>  drivers/acpi/osl.c                   |  3 ++-
>  drivers/acpi/tables.c                |  2 +-
>  drivers/char/mem.c                   |  2 +-
>  drivers/cxl/mem.c                    |  2 +-
>  drivers/firmware/efi/efi.c           |  2 +-
>  drivers/firmware/efi/test/efi_test.c |  2 +-
>  drivers/pci/pci-sysfs.c              |  6 +++---
>  drivers/pci/proc.c                   |  6 +++---
>  drivers/pci/syscall.c                |  2 +-
>  drivers/pcmcia/cistpl.c              |  2 +-
>  drivers/tty/serial/serial_core.c     |  2 +-
>  fs/debugfs/file.c                    |  2 +-
>  fs/debugfs/inode.c                   |  2 +-
>  fs/proc/kcore.c                      |  2 +-
>  fs/tracefs/inode.c                   |  2 +-
>  include/linux/lsm_hook_defs.h        |  2 +-
>  include/linux/lsm_hooks.h            |  1 +
>  include/linux/security.h             |  4 ++--
>  kernel/bpf/helpers.c                 | 10 ++++++----
>  kernel/events/core.c                 |  2 +-
>  kernel/kexec.c                       |  2 +-
>  kernel/kexec_file.c                  |  2 +-
>  kernel/module.c                      |  2 +-
>  kernel/params.c                      |  2 +-
>  kernel/power/hibernate.c             |  3 ++-
>  kernel/trace/bpf_trace.c             | 20 ++++++++++++--------
>  kernel/trace/ftrace.c                |  4 ++--
>  kernel/trace/ring_buffer.c           |  2 +-
>  kernel/trace/trace.c                 | 10 +++++-----
>  kernel/trace/trace_events.c          |  2 +-
>  kernel/trace/trace_events_hist.c     |  4 ++--
>  kernel/trace/trace_events_synth.c    |  2 +-
>  kernel/trace/trace_events_trigger.c  |  2 +-
>  kernel/trace/trace_kprobe.c          |  6 +++---
>  kernel/trace/trace_printk.c          |  2 +-
>  kernel/trace/trace_stack.c           |  2 +-
>  kernel/trace/trace_stat.c            |  2 +-
>  kernel/trace/trace_uprobe.c          |  4 ++--
>  net/xfrm/xfrm_user.c                 | 11 +++++++++--
>  security/lockdown/lockdown.c         |  3 ++-
>  security/security.c                  |  4 ++--
>  security/selinux/hooks.c             |  7 +++++--
>  48 files changed, 97 insertions(+), 77 deletions(-)

-- 
paul moore
www.paul-moore.com
