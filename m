Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D20DA409ECF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 23:06:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7fCb4yrKz2ywl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 07:06:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=dZApan+/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20150623.gappssmtp.com
 header.i=@paul-moore-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=dZApan+/; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7fBr2Bwyz2yL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 07:05:22 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id g21so16389542edw.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 14:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=373m7inPGNTCDOiEZsbke1WmzoymEFvAttGADuwHDDA=;
 b=dZApan+/iH4NW1oyIBh56hyWC0xvVWqlTSK28qynQC4TgDjgqY/p3DDGCieGAdnE+I
 0aAGZTbnqRM5fK3TAuLjdF7NMMeCiV0kCAfGdpzcWIOkp6sGMVlUrfxYCH3SD3gyogJC
 4YUBZARL2myz4qpAuMZTGYV2rnkRZ9K57xrX/1azGmh55BtgXM4p6fR98t3Lj/TtI5og
 R/GBhjg5GXvtd+GgOVsER1+uWOFoeaerYmB9DSE925/Yk+BqT4PYFMFnKhDH3tmHZ5eB
 xUYs9eTg/9uBmvVggoWXp8e0Cnzsirc3guy7n646rKKVwHb6iHMN/jX2KPg7JseQr8+1
 ToQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=373m7inPGNTCDOiEZsbke1WmzoymEFvAttGADuwHDDA=;
 b=XolJ0oJ3xZIX3UkXw8WRoYp6kt1XR/522xMwCkpSSrVmsn1+VhGmwKJQlVcBHshId4
 q8K6V6fE/WqJbDbrAvzaLwnD9MCDuSWy5XAl7tvCzhGiBCHseZ4+z/6Pefhmez3UKKbo
 LKQputM6JuTXpojvRuMHkF3tw741Y4Y8jstUaHxFLAeMn8WluSpgEEzZMrSed+RP0Nyk
 nfgQSTJloT69zlV+3uBx1M9QUwVfbt+OUdyGZWAo+yS0cOENNHqidPaFoLwQag0YDqfu
 nsHO3J4f4wmzGl2OfcS36E92sx3skvJ2qdrocbhvT9H27cnhP37J8z0Kh0gcEub/xDtL
 TglA==
X-Gm-Message-State: AOAM531vPxmKsyyom2s8upHpouvSoYB9U0zJEKBrBODQ7o3Csh/efSdT
 Xbrav2hUfKHvm/RHaZlaAzQvHGUAtsiJnplB1lmv
X-Google-Smtp-Source: ABdhPJyhjptYpi0mwh96yMlLzxckfq2tRXqkGTb/ZQJf0dLr8KeUC8PkrIaOITSWhjWsL1Ai+gNDn5oE1rgV2wDOPdI=
X-Received: by 2002:a05:6402:2810:: with SMTP id
 h16mr14507917ede.293.1631567115278; 
 Mon, 13 Sep 2021 14:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210913140229.24797-1-omosnace@redhat.com>
In-Reply-To: <20210913140229.24797-1-omosnace@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 13 Sep 2021 17:05:04 -0400
Message-ID: <CAHC9VhRw-S+zZUFz5QFFLMBATjo+YbPAiR21jX6p7cT0T+MVLA@mail.gmail.com>
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

On Mon, Sep 13, 2021 at 10:02 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
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
> Acked-by: Dan Williams <dan.j.williams@intel.com>         [cxl]
> Acked-by: Steffen Klassert <steffen.klassert@secunet.com> [xfrm]
> Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> ---
>
> v4:
> - rebase on top of TODO
> - fix rebase conflicts:
>   * drivers/cxl/pci.c
>     - trivial: the lockdown reason was corrected in mainline
>   * kernel/bpf/helpers.c, kernel/trace/bpf_trace.c
>     - trivial: LOCKDOWN_BPF_READ was renamed to LOCKDOWN_BPF_READ_KERNEL
>       in mainline
>   * kernel/power/hibernate.c
>     - trivial: !secretmem_active() was added to the condition in
>       hibernation_available()
> - cover new security_locked_down() call in kernel/bpf/helpers.c
>   (LOCKDOWN_BPF_WRITE_USER in BPF_FUNC_probe_write_user case)
>
> v3: https://lore.kernel.org/lkml/20210616085118.1141101-1-omosnace@redhat.com/
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

The changes between v3 and v4 all seem sane to me, but I'm going to
let this sit for a few days in hopes that we can collect a few more
Reviewed-bys and ACKs.  If I don't see any objections I'll merge it
mid-week(ish) into selinux/stable-5.15 and plan on sending it to Linus
after it goes through a build/test cycle.

-- 
paul moore
www.paul-moore.com
