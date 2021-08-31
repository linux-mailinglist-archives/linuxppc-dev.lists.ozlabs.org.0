Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B31603FC4A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 11:11:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzLyS3zdwz305d
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 19:10:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ID0xaPgq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ID0xaPgq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ID0xaPgq; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ID0xaPgq; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzLx66LCCz2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 19:09:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630400984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KqIomsJD8qkvJRmtf6AOcHNJotQV38aV9t/Y65DfWRs=;
 b=ID0xaPgq61aOsxvVDcGByz6aGCJQ7H7d3oK01/mkojpjY8cH7vfPbbP9FT+BlZhABIdLSS
 6mMhEp2cNE3KyGMRP/qmxnzHHnReUYTs8w3pO6r2DoDVgIx+9OXuc7XQCcL+0rHWOJqkt3
 AuH0HjxOwwT6WasrlrdL8PRA21Myl1c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630400984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KqIomsJD8qkvJRmtf6AOcHNJotQV38aV9t/Y65DfWRs=;
 b=ID0xaPgq61aOsxvVDcGByz6aGCJQ7H7d3oK01/mkojpjY8cH7vfPbbP9FT+BlZhABIdLSS
 6mMhEp2cNE3KyGMRP/qmxnzHHnReUYTs8w3pO6r2DoDVgIx+9OXuc7XQCcL+0rHWOJqkt3
 AuH0HjxOwwT6WasrlrdL8PRA21Myl1c=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-yP53oek_MiC3F6BCOeC-1w-1; Tue, 31 Aug 2021 05:09:41 -0400
X-MC-Unique: yP53oek_MiC3F6BCOeC-1w-1
Received: by mail-yb1-f197.google.com with SMTP id
 z8-20020a25ad88000000b0059a94ada16fso5833259ybi.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 02:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KqIomsJD8qkvJRmtf6AOcHNJotQV38aV9t/Y65DfWRs=;
 b=ZbBDbJsan3bCQ7AEnLm0wKZXSbUD0aOI3xLO6OYIvucuknIae+NznW+W/wctcyfPgF
 1FL3sXa3qkffuqD4iPxCNH7IKFmaulRePO1KMYc2cHk0YhZDW82Squhh36AeG23CRPJK
 jk2yBBvObEO+UNJs7e9aMpHVEswVru9+i232fLqYQQRVClebFplid5x70rv9Gurv6qmd
 GJzs5N+90Rg85zDJvy2QjmeWEHjMw1GVM+T8WbOxzL/01tSEXzevXFRN82OmC2AUwStY
 bvAB0aHpn7F7QIv/QIK/QsPN9LXdAoeGMYekeLh99jsIKbjp/GuzXubR8VB4WoID4ISr
 h3Dg==
X-Gm-Message-State: AOAM530ACVqhvKeCkxD/aEtUqM/mga733wOK3xSpUlAiGhMsBmfeBanx
 bPS/RF2I6d5SARJYvzWw2Xd7gBPZqusYdtteNyYcfdGAd04GOMnxbWlutPpTd/AcVjzteCIXI9l
 PubPY9VXKre5gB2Yzap77K1fPwj7BDS1O7eQibwX9vg==
X-Received: by 2002:a25:1d08:: with SMTP id d8mr29534390ybd.377.1630400980460; 
 Tue, 31 Aug 2021 02:09:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoUYVGjsHQ1mAV96NVBWIdFVB3TZpqWc7BWtvr/Mg648rQQ+7P7WYMOAhTFTS/Li+BMqOUSleNc4ReksuZGrg=
X-Received: by 2002:a25:1d08:: with SMTP id d8mr29534365ybd.377.1630400980209; 
 Tue, 31 Aug 2021 02:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210616085118.1141101-1-omosnace@redhat.com>
 <CAPcyv4jvR8CT4rYODR5KUHNdiqMwQSwJZ+OkVf61kLT3JfjC_Q@mail.gmail.com>
In-Reply-To: <CAPcyv4jvR8CT4rYODR5KUHNdiqMwQSwJZ+OkVf61kLT3JfjC_Q@mail.gmail.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Tue, 31 Aug 2021 11:09:29 +0200
Message-ID: <CAFqZXNtuH0329Xvcb415Kar-=o6wwrkFuiP8BZ_2OQhHLqkkAg@mail.gmail.com>
Subject: Re: [PATCH v3] lockdown,selinux: fix wrong subject in some SELinux
 lockdown checks
To: Dan Williams <dan.j.williams@intel.com>
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-cxl@vger.kernel.org,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Linux ACPI <linux-acpi@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 Linux-pm mailing list <linux-pm@vger.kernel.org>,
 SElinux list <selinux@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Casey Schaufler <casey@schaufler-ca.com>, Paul Moore <paul@paul-moore.com>,
 Netdev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 19, 2021 at 12:18 AM Dan Williams <dan.j.williams@intel.com> wrote:
> On Wed, Jun 16, 2021 at 1:51 AM Ondrej Mosnacek <omosnace@redhat.com> wrote:
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
> [..]
> > diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
> > index 2acc6173da36..c1747b6555c7 100644
> > --- a/drivers/cxl/mem.c
> > +++ b/drivers/cxl/mem.c
> > @@ -568,7 +568,7 @@ static bool cxl_mem_raw_command_allowed(u16 opcode)
> >         if (!IS_ENABLED(CONFIG_CXL_MEM_RAW_COMMANDS))
> >                 return false;
> >
> > -       if (security_locked_down(LOCKDOWN_NONE))
> > +       if (security_locked_down(current_cred(), LOCKDOWN_NONE))
>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
>
> ...however that usage looks wrong. The expectation is that if kernel
> integrity protections are enabled then raw command access should be
> disabled. So I think that should be equivalent to LOCKDOWN_PCI_ACCESS
> in terms of the command capabilities to filter.

Yes, the LOCKDOWN_NONE seems wrong here... but it's a pre-existing bug
and I didn't want to go down yet another rabbit hole trying to fix it.
I'll look at this again once this patch is settled - it may indeed be
as simple as replacing LOCKDOWN_NONE with LOCKDOWN_PCI_ACCESS.

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

