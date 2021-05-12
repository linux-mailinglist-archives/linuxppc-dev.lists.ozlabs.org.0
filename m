Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C5A37BE23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 15:22:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgFns3X4Vz3086
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 23:22:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bnvYHMO3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bnvYHMO3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bnvYHMO3; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bnvYHMO3; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgFnL3zNzz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 23:21:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620825712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dtvrIv0gd9IsJeuZT9VIJXOOFa9yzPvKusGPJfLQ7f4=;
 b=bnvYHMO3BOy5FY3NcXGxL0pJECTYRm58szHBO2GRM2NAPnvHVJrLy8phDXgmT+wjJU8rS2
 VNYH87505VmCKt4W+/hTXjby0R88BYviweYJXg0zQXaN7ySoW6rHZvAtOgcx2j5FgS8wwe
 W2SYfIvEoUL1bFQdqUtkzNGUh35URLg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620825712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dtvrIv0gd9IsJeuZT9VIJXOOFa9yzPvKusGPJfLQ7f4=;
 b=bnvYHMO3BOy5FY3NcXGxL0pJECTYRm58szHBO2GRM2NAPnvHVJrLy8phDXgmT+wjJU8rS2
 VNYH87505VmCKt4W+/hTXjby0R88BYviweYJXg0zQXaN7ySoW6rHZvAtOgcx2j5FgS8wwe
 W2SYfIvEoUL1bFQdqUtkzNGUh35URLg=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-ApSjZwtmOMiS44mz3Gc0jA-1; Wed, 12 May 2021 09:21:49 -0400
X-MC-Unique: ApSjZwtmOMiS44mz3Gc0jA-1
Received: by mail-yb1-f200.google.com with SMTP id
 78-20020a250b510000b02904f953c1fb64so2843901ybl.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 06:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dtvrIv0gd9IsJeuZT9VIJXOOFa9yzPvKusGPJfLQ7f4=;
 b=RX/gcoFgh56QDf/Kwp9GI114R5DLgb61vyhudXGSBKhEKywowb+954ZzDsB/MM4ANR
 Ffitm4KSXRTj3y2nFXSo7iphIW5oWsCRDd2bERsKFFpg1opFG5HOQC8roCcky8dIvuv8
 woHHx/r9B7DI0DcI7RiIFd6P/jcLRE1OMGf23xsZ9NLY+tWzx8gad/7rrrAkiyrh1gII
 6jCV6bpMZlDfXAQjUXIHUBsnxWTG0Hjg9bzCJhNg+EYPmQXcQ5vbTOP55iRLvSszBCsh
 v+ElDAypwDiufxvKGzpW4yOb8NZgBjNO2PypVKU6JQuHsN+lqK+c5CXzTHLNn4fONYXi
 6lRA==
X-Gm-Message-State: AOAM533h7oPwSDtlIrdFlhw/fMGWp90bonddXIBnTNXs0DqxA2s2nyzG
 kONNoqb8Tqg616WHC9ifq8bU5hY7JgKIudR/ftApkqHZ1u62YgZ44n4nUacx4gmmPsOSBRFfPmy
 mzcJrHhxYVMGf8vWlzAdV6D53TFZ+E1OAF/tAtOkbVg==
X-Received: by 2002:a25:6983:: with SMTP id e125mr46782764ybc.81.1620825709190; 
 Wed, 12 May 2021 06:21:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmv2Qjn6VYEo9c/oXPEmu6i04CA+M1aunHQiWM6u48mJ31LcpQnTbka787MtlSpRVc8GFLI9xcdcVeHkvyMsg=
X-Received: by 2002:a25:6983:: with SMTP id e125mr46782731ybc.81.1620825708981; 
 Wed, 12 May 2021 06:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210507114048.138933-1-omosnace@redhat.com>
 <a8d138a6-1d34-1457-9266-4abeddb6fdba@schaufler-ca.com>
In-Reply-To: <a8d138a6-1d34-1457-9266-4abeddb6fdba@schaufler-ca.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 12 May 2021 15:21:37 +0200
Message-ID: <CAFqZXNtr1YjzRg7fTm+j=0oZF+7C5xEu5J0mCZynP-dgEzvyUg@mail.gmail.com>
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

On Sat, May 8, 2021 at 12:17 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 5/7/2021 4:40 AM, Ondrej Mosnacek wrote:
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
> > implementation), fix this by adding a separate hook
> > security_locked_down_globally()
>
> This is a poor solution to the stated problem. Rather than adding
> a new hook you should add the task as a parameter to the existing hook
> and let the security modules do as they will based on its value.
> If the caller does not have an appropriate task it should pass NULL.
> The lockdown LSM can ignore the task value and SELinux can make its
> own decision based on the task value passed.

The problem with that approach is that all callers would then need to
be updated and I intended to keep the patch small as I'd like it to go
to stable kernels as well.

But it does seem to be a better long-term solution - would it work for
you (and whichever maintainer would be taking the patch(es)) if I just
added another patch that refactors it to use the task parameter?

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

