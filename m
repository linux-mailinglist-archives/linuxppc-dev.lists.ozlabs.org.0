Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D27F382728
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 10:35:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkC9x0k58z302S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 18:35:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQJu/Q9D;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQJu/Q9D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hQJu/Q9D; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQJu/Q9D; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkC9Q3BjQz2xfr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 18:34:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621240467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0rIkLZVSWvcw5d0SRX5kn9M8zHvErYPyZMfehLrUnc=;
 b=hQJu/Q9DiIwDZsPigFsECdGZgI7dhLjR8o5xX89/y1TC1IZINiym/UUegzE+cTRD3GG0ol
 l5keOYQNMBqPJiGpSoxICfmnsvkyfuOpV0pEuZoKIXMoAm0nou/uRfyLt8+UPCIgDvn8iH
 5SvCP6MyCUSGpL35pJQ38LbggjfzmUQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621240467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0rIkLZVSWvcw5d0SRX5kn9M8zHvErYPyZMfehLrUnc=;
 b=hQJu/Q9DiIwDZsPigFsECdGZgI7dhLjR8o5xX89/y1TC1IZINiym/UUegzE+cTRD3GG0ol
 l5keOYQNMBqPJiGpSoxICfmnsvkyfuOpV0pEuZoKIXMoAm0nou/uRfyLt8+UPCIgDvn8iH
 5SvCP6MyCUSGpL35pJQ38LbggjfzmUQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-Wll6lWg4Mb-bru-mbYysNg-1; Mon, 17 May 2021 04:34:25 -0400
X-MC-Unique: Wll6lWg4Mb-bru-mbYysNg-1
Received: by mail-yb1-f198.google.com with SMTP id
 q6-20020a25bfc60000b02904f9715cd13cso8555087ybm.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 01:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H0rIkLZVSWvcw5d0SRX5kn9M8zHvErYPyZMfehLrUnc=;
 b=tjvCtg6vgo+fnw6S9cYDRL56BlpGeQVHi8gaA9S7xYtANpOTi3mSWulePGGGoDyP7+
 72Xy7OtTSXDOcIM8VwQmUqGGv2EL5/6nC8KgUvCSBIh9nVxonmiBRwa6K3IrSmq1qXxP
 e37/ziNTYKRYb3mXVlBNZFNldA5IE5kuAZFw+NsqLFpYJ3Dvzgu+xNtm24X5bUYN8Bwh
 BCZviSO1cL4iGQBcXoywXfxqrjqEtdd4KvkWn7oibJtEi9ozaXXV0g9NAxViOaEAjQuo
 Y5cQaZmk+qHSU4anorFJL4Hc1cTYg66P59KdKbVpFuL3APnDGGwFT52gxIxJ1dgMzNYW
 9BfQ==
X-Gm-Message-State: AOAM5305/WTcpCJG7qvtI6fFvFltmv1rrgBP9vYn3+GXfGltQceck5cF
 A/WO/umuYUt8vkf5uCnHNWFmG88TeZewFp+C3G+E+5tjgxnOHwrDRbZ6JnSZr9fpZdhtZdZpTK9
 5C5Kt9VlC0sPXObr6pKwkILQGSniT9x2XuRzhuY7WsQ==
X-Received: by 2002:a25:7451:: with SMTP id p78mr10684349ybc.227.1621240465229; 
 Mon, 17 May 2021 01:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG+xOt2sI6iuR2d62PUilNKaHp2d8mDgxkq88vNwwlef+ekCp0Xow3HwXFMFBuMiPNKcW/vJ9jupOWJKiZWFg=
X-Received: by 2002:a25:7451:: with SMTP id p78mr10684322ybc.227.1621240465001; 
 Mon, 17 May 2021 01:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210507114048.138933-1-omosnace@redhat.com>
 <a8d138a6-1d34-1457-9266-4abeddb6fdba@schaufler-ca.com>
 <CAFqZXNtr1YjzRg7fTm+j=0oZF+7C5xEu5J0mCZynP-dgEzvyUg@mail.gmail.com>
 <24a61ff1-e415-adf8-17e8-d212364d4b97@schaufler-ca.com>
 <CAFqZXNvB-EyPz1Qz3cCRTr1u1+D+xT-dp7cUxFocYM1AOYSuxw@mail.gmail.com>
 <e8d60664-c7ad-61de-bece-8ab3316f77bc@schaufler-ca.com>
 <CAFqZXNu_DW1FgnVvtA+CnBMtdRDrzYo5B3_=SzKV7-o1CaV0RA@mail.gmail.com>
 <94486043-322f-74bd-dc33-83e43b531068@schaufler-ca.com>
In-Reply-To: <94486043-322f-74bd-dc33-83e43b531068@schaufler-ca.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Mon, 17 May 2021 10:34:12 +0200
Message-ID: <CAFqZXNucQhcYTZPGmi0MeHOvwCTsxxBSwzZ+W_MODX0_5WgcPg@mail.gmail.com>
Subject: Re: [PATCH] lockdown,
 selinux: fix bogus SELinux lockdown permission checks
To: Casey Schaufler <casey@schaufler-ca.com>
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
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 15, 2021 at 2:57 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 5/14/2021 8:12 AM, Ondrej Mosnacek wrote:
> > On Wed, May 12, 2021 at 7:12 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 5/12/2021 9:44 AM, Ondrej Mosnacek wrote:
> >>> On Wed, May 12, 2021 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>> On 5/12/2021 6:21 AM, Ondrej Mosnacek wrote:
> >>>>> On Sat, May 8, 2021 at 12:17 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>>>> On 5/7/2021 4:40 AM, Ondrej Mosnacek wrote:
> >>>>>>> Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
> >>>>>>> lockdown") added an implementation of the locked_down LSM hook to
> >>>>>>> SELinux, with the aim to restrict which domains are allowed to perform
> >>>>>>> operations that would breach lockdown.
> >>>>>>>
> >>>>>>> However, in several places the security_locked_down() hook is called in
> >>>>>>> situations where the current task isn't doing any action that would
> >>>>>>> directly breach lockdown, leading to SELinux checks that are basically
> >>>>>>> bogus.
> >>>>>>>
> >>>>>>> Since in most of these situations converting the callers such that
> >>>>>>> security_locked_down() is called in a context where the current task
> >>>>>>> would be meaningful for SELinux is impossible or very non-trivial (and
> >>>>>>> could lead to TOCTOU issues for the classic Lockdown LSM
> >>>>>>> implementation), fix this by adding a separate hook
> >>>>>>> security_locked_down_globally()
> >>>>>> This is a poor solution to the stated problem. Rather than adding
> >>>>>> a new hook you should add the task as a parameter to the existing hook
> >>>>>> and let the security modules do as they will based on its value.
> >>>>>> If the caller does not have an appropriate task it should pass NULL.
> >>>>>> The lockdown LSM can ignore the task value and SELinux can make its
> >>>>>> own decision based on the task value passed.
> >>>>> The problem with that approach is that all callers would then need to
> >>>>> be updated and I intended to keep the patch small as I'd like it to go
> >>>>> to stable kernels as well.
> >>>>>
> >>>>> But it does seem to be a better long-term solution - would it work for
> >>>>> you (and whichever maintainer would be taking the patch(es)) if I just
> >>>>> added another patch that refactors it to use the task parameter?
> >>>> I can't figure out what you're suggesting. Are you saying that you
> >>>> want to add a new hook *and* add the task parameter?
> >>> No, just to keep this patch as-is (and let it go to stable in this
> >>> form) and post another (non-stable) patch on top of it that undoes the
> >>> new hook and re-implements the fix using your suggestion. (Yeah, it'll
> >>> look weird, but I'm not sure how better to handle such situation - I'm
> >>> open to doing it whatever different way the maintainers prefer.)
> >> James gets to make the call on this one. If it was my call I would
> >> tell you to make the task parameter change and accept the backport
> >> pain. I think that as a security developer community we spend way too
> >> much time and effort trying to avoid being noticed in source trees.
> > Hm... actually, what about this attached patch? It switches to a
> > single hook with a cred argument (I figured cred makes more sense than
> > task_struct, since the rest of task_struct should be irrelevant for
> > the LSM, anyway...) right from the start and keeps the original
> > security_locked_down() function only as a simple wrapper around the
> > main hook.
> >
> > At that point I think converting the other callers to call
> > security_cred_locked_down() directly isn't really worth it, since the
> > resulting calls would just be more verbose without much benefit. So
> > I'm tempted to just leave the security_locked_down() helper as is, so
> > that the more common pattern can be still achieved with a simpler
> > call.
> >
> > What do you think?
>
> It's still a bit kludgy, but a big improvement over the previous version.
> I wouldn't object to this approach.

Ok, thanks. I'll post it as a v2 then.

-- 
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

