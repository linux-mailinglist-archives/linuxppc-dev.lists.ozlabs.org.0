Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D23337C8D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 18:45:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgLHl2N1Qz3bt1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 02:45:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzcW+h7F;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzcW+h7F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XzcW+h7F; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzcW+h7F; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgLHD3MhBz2yQy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 02:44:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620837876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1wT9y/+CUxpw2t+GrCY0Qp+nfyUTGHKVjJx14ixlaYw=;
 b=XzcW+h7FZZt+OkHxpxIsfqmMxRzF+v/BpzsKYx5mnjzowbigVKijhTMLzdcr1fEP9FU8Px
 AfRmRoLR2+KEF6BHuo3a/8J4sWuxECABjpy3Xlo9+dvNEPb34OSITSeOe+4RBm2/eGf0/k
 jRIOuT5OLNvi9Zp+Twx9X9fwotrBtOU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620837876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1wT9y/+CUxpw2t+GrCY0Qp+nfyUTGHKVjJx14ixlaYw=;
 b=XzcW+h7FZZt+OkHxpxIsfqmMxRzF+v/BpzsKYx5mnjzowbigVKijhTMLzdcr1fEP9FU8Px
 AfRmRoLR2+KEF6BHuo3a/8J4sWuxECABjpy3Xlo9+dvNEPb34OSITSeOe+4RBm2/eGf0/k
 jRIOuT5OLNvi9Zp+Twx9X9fwotrBtOU=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-WI42J8qOMkiFqoqxZWwucw-1; Wed, 12 May 2021 12:44:33 -0400
X-MC-Unique: WI42J8qOMkiFqoqxZWwucw-1
Received: by mail-yb1-f198.google.com with SMTP id
 r2-20020a25ac420000b02904f5a9b7d37fso28644595ybd.22
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 09:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1wT9y/+CUxpw2t+GrCY0Qp+nfyUTGHKVjJx14ixlaYw=;
 b=S7/om+R+qTiQC0X8hGdnL/WIer3etEwDANIbEgkeORcyVY6LgW1h86+i3cgWQEWv+B
 ImFO+9H2Gj9ruXuMjA5bmP4wLAXy03CrTvbXRgqsVkiNSkQTu+9HPoQBXHh5EWdV9oZl
 sglbf3QVQgqAf/FoXwkLaTPI/sOCEZAqtuI4tkPFU7WFazdaqbzwRaSuQZ7CpvW+XclN
 Ss4zvZ37W7qgYoHax3enJpKnsoOS57fg3k5Su1sugkKsH+wYeYq7VKrvXGR4Qc5q5N+k
 LvBVibIQ7L9gMCwM95eEy0Axj+XPYwGdsbnSSfi6vGhxb67VdjkqLyV3M8ziGl5eGaP7
 CL8w==
X-Gm-Message-State: AOAM531ZHzZjjQ8QP/NReo++GzRyxUO+u/IJIBe1qxiaMzKzdzWzZLEP
 UguB3qC2IFliusLmNHuaDb1KiSpV3s+LCZMzVUln8+73p+7a5Ei9OeHfBoh2mmrJ4X4yOdyyJrQ
 QXnoO2MvHM7cKdmw5QQPJwLHUu9eHp+XcGz1YBDFV5w==
X-Received: by 2002:a25:6886:: with SMTP id
 d128mr49884182ybc.227.1620837872713; 
 Wed, 12 May 2021 09:44:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziai7GI5a1DWeJt0YlXK6570k2N9+Sy1G9tLOxLGUvPGU+rPfrJ8aFA1k+I7x/KZgli19pSgP+PzUsymRQT9M=
X-Received: by 2002:a25:6886:: with SMTP id
 d128mr49884143ybc.227.1620837872433; 
 Wed, 12 May 2021 09:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210507114048.138933-1-omosnace@redhat.com>
 <a8d138a6-1d34-1457-9266-4abeddb6fdba@schaufler-ca.com>
 <CAFqZXNtr1YjzRg7fTm+j=0oZF+7C5xEu5J0mCZynP-dgEzvyUg@mail.gmail.com>
 <24a61ff1-e415-adf8-17e8-d212364d4b97@schaufler-ca.com>
In-Reply-To: <24a61ff1-e415-adf8-17e8-d212364d4b97@schaufler-ca.com>
From: Ondrej Mosnacek <omosnace@redhat.com>
Date: Wed, 12 May 2021 18:44:21 +0200
Message-ID: <CAFqZXNvB-EyPz1Qz3cCRTr1u1+D+xT-dp7cUxFocYM1AOYSuxw@mail.gmail.com>
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

On Wed, May 12, 2021 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 5/12/2021 6:21 AM, Ondrej Mosnacek wrote:
> > On Sat, May 8, 2021 at 12:17 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 5/7/2021 4:40 AM, Ondrej Mosnacek wrote:
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
> >>> implementation), fix this by adding a separate hook
> >>> security_locked_down_globally()
> >> This is a poor solution to the stated problem. Rather than adding
> >> a new hook you should add the task as a parameter to the existing hook
> >> and let the security modules do as they will based on its value.
> >> If the caller does not have an appropriate task it should pass NULL.
> >> The lockdown LSM can ignore the task value and SELinux can make its
> >> own decision based on the task value passed.
> > The problem with that approach is that all callers would then need to
> > be updated and I intended to keep the patch small as I'd like it to go
> > to stable kernels as well.
> >
> > But it does seem to be a better long-term solution - would it work for
> > you (and whichever maintainer would be taking the patch(es)) if I just
> > added another patch that refactors it to use the task parameter?
>
> I can't figure out what you're suggesting. Are you saying that you
> want to add a new hook *and* add the task parameter?

No, just to keep this patch as-is (and let it go to stable in this
form) and post another (non-stable) patch on top of it that undoes the
new hook and re-implements the fix using your suggestion. (Yeah, it'll
look weird, but I'm not sure how better to handle such situation - I'm
open to doing it whatever different way the maintainers prefer.)

-- 
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

