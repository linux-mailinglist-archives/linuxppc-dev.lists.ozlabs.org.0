Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B4391673
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 13:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fqpzz0xtXz308j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 21:45:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kuhbd30J;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kuhbd30J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Kuhbd30J; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Kuhbd30J; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqpzT5pV7z2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 21:45:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622029519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Uw+/IY4PFLhc9QD0XQTD8Vq22Bv9V1A42B8cw/tcfQ=;
 b=Kuhbd30J9x/y4HQUnZ9h1s4PvK8YEhrAeOiu61Mmq05kpIckdxQfU2GoAyMMCrxp2Y3Fx8
 4Ew/m1+3OdXqZVqzN5LyATLbQbSx9ugDGtIxwVpezVNYW7rPatjhDlJpeKVDpahfzwYvST
 x0HaU/28DMema5M+T5gBdd6GqKHRTMM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622029519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5Uw+/IY4PFLhc9QD0XQTD8Vq22Bv9V1A42B8cw/tcfQ=;
 b=Kuhbd30J9x/y4HQUnZ9h1s4PvK8YEhrAeOiu61Mmq05kpIckdxQfU2GoAyMMCrxp2Y3Fx8
 4Ew/m1+3OdXqZVqzN5LyATLbQbSx9ugDGtIxwVpezVNYW7rPatjhDlJpeKVDpahfzwYvST
 x0HaU/28DMema5M+T5gBdd6GqKHRTMM=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-8cavWTLaOX2CLCu4l3u8Ag-1; Wed, 26 May 2021 07:45:15 -0400
X-MC-Unique: 8cavWTLaOX2CLCu4l3u8Ag-1
Received: by mail-yb1-f200.google.com with SMTP id
 d4-20020a25b5c40000b02904f8e3c8c6c9so1322299ybg.14
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 04:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Uw+/IY4PFLhc9QD0XQTD8Vq22Bv9V1A42B8cw/tcfQ=;
 b=KUWpshvvaVmHdfWfXehLEp2TWHZUXz3EDej//B5nJiiLLfd7Q828+hf8MCUhIcc0rh
 mGUcgFhNS+9ddT6N4wsNq4VGa0DIBVi7AG6+LKrmKrNLVdb/M34ZjPwLWF6o9CEbML/G
 oyK0DrlGO6WTzdg9MqFPZfEsWAocn9ynPsUIohHqaxxcXT1TlwDeOtzbFiAnIekf5yVf
 fsYdWWa4XUFDk872INFz4oxYOGwiIlW2WqO4Hk9O3gNB3iMdZmJ7fRIdC1ZVB2dKMIei
 hFosMJiVVgrCMDgEiBPjsdyXTfzi8RO8RGP9rpU9rmmmh5P0W9dLZsQA1I7evvXj8N8U
 EE7Q==
X-Gm-Message-State: AOAM530B1r/zKujwK9STZwUorpKtVFEdViMAfxBl36jN7J/zkl4k0kXS
 NimwAdXyhW61FBgWksr6TkTZjES3y0oPTsGkUGW6Xd/o5G0Q+Sw6LQiF6tQEW3RU1sF3pM13RAl
 5I5loBT8g7QuaN07rVsiiH/N9LZmvj7gTcOPycsSnng==
X-Received: by 2002:a25:f50e:: with SMTP id a14mr48352353ybe.172.1622029514557; 
 Wed, 26 May 2021 04:45:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7JX0t9Q+MjZUdNuGYqNNwFWjv7mwlUzB5zjT5J9a7c3DzGoUhB3CdgL/OZI5wwTVrJZE9FoOnkmowu6kRXnk=
X-Received: by 2002:a25:f50e:: with SMTP id a14mr48352333ybe.172.1622029514339; 
 Wed, 26 May 2021 04:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210517092006.803332-1-omosnace@redhat.com>
 <87o8d9k4ln.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o8d9k4ln.fsf@mpe.ellerman.id.au>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 26 May 2021 13:44:59 +0200
Message-ID: <CAFqZXNtUvrGxT6UMy81WfMsfZsydGN5k-VGFBq8yjDWN5ARAWw@mail.gmail.com>
Subject: Re: [PATCH v2] lockdown,selinux: avoid bogus SELinux lockdown
 permission checks
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Paul Moore <paul@paul-moore.com>, SElinux list <selinux@vger.kernel.org>,
 network dev <netdev@vger.kernel.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 James Morris <jmorris@namei.org>, Steven Rostedt <rostedt@goodmis.org>,
 Linux kernel mailing list <linux-kernel@vger.kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Linux Security Module list <linux-security-module@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 17, 2021 at 1:00 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Ondrej Mosnacek <omosnace@redhat.com> writes:
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
> > implementation), fix this by modifying the hook to accept a struct cred
> > pointer as argument, where NULL will be interpreted as a request for a
> > "global", task-independent lockdown decision only. Then modify SELinux
> > to ignore calls with cred == NULL.
> >
> > Since most callers will just want to pass current_cred() as the cred
> > parameter, rename the hook to security_cred_locked_down() and provide
> > the original security_locked_down() function as a simple wrapper around
> > the new hook.
> >
> > The callers migrated to the new hook, passing NULL as cred:
> > 1. arch/powerpc/xmon/xmon.c
> >      Here the hook seems to be called from non-task context and is only
> >      used for redacting some sensitive values from output sent to
> >      userspace.
>
> It's hard to follow but it actually disables interactive use of xmon
> entirely if lockdown is in confidentiality mode, and disables
> modifications of the kernel in integrity mode.
>
> But that's not really that important, the patch looks fine.
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks, Michael!

James/Paul, is there anything blocking this patch from being merged?
Especially the BPF case is causing real trouble for people and the
only workaround is to broadly allow lockdown::confidentiality in the
policy.

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

