Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A25683AE9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 01:04:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P62Gs4tGZz3f3F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 11:04:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kjgH2CMP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kjgH2CMP;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P62Fw2hnvz2yNm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 11:04:03 +1100 (AEDT)
Received: by mail-yb1-xb2d.google.com with SMTP id x4so20332545ybp.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 16:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUycsi7Qy1G+kA/BDKEqAynjD+S1ub0yGcBr2S1csDg=;
        b=kjgH2CMPcbJUL89I13duLHr/x00EFsX3fEJyRMjgA3lmo+3BlhNvsXihc340eh4Mo2
         xJLlakMeru4DhNc2LQ7VdXDjksVjD8J95ylIlceJjZjmLcziSrIGjflqo01hf0aIuPRr
         /Tm7tSWg1BzuIO5SMCXWDrfUCKN94wOyzFfYw06eAp4JwvSUDIkxnWZVGG8jazLCRLQ4
         fy9jQY5nCrkr6ftTyn2XwMB2wYenW9lk/kPwLomUt2hRm3TEP3rTyKcgDtcfIeERobCm
         uThPnsvu8qu2+2UDFWG+LRF+g46vJaxVjEr6TrfgDRaIL6R7vK5wPEjDj7fJztXMnUO3
         CX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUycsi7Qy1G+kA/BDKEqAynjD+S1ub0yGcBr2S1csDg=;
        b=vYfm5K4YOQvJs9/L3c4PF+ufUCkd2gZYdRW7esT0cxrT08DcmOjuN0TiI9US4HPXvs
         64TjB2pjAM7itvprEisskBvs5Mp5UIvrE/Xx699G/Ji9mwORoq6Q7HVpJhP8P8Js4kT9
         K0bgnR2RP3tMupsVhVpb8k0C7OiH/u801nyF8PzEz9pyUoY1T8cHBWYdn649ube6MQWj
         xwCb2GZbpdGNdt4D83mOPYWIGbghl8c+eNLeBdSdIw+mIpPPb7YAXCOhRXzaAs/xmBqf
         cNMsliU1BgdPD6P6CF/Am9qqvQYTCRILsg8N+IBKbR5TMRpDrqYhYEwW90GUQt4m39QL
         6hqA==
X-Gm-Message-State: AO0yUKWQYqD+Rhz0puiqRgxT6uRnv0NOTtD74qkouunqdZZrfP7hW87z
	db/RQFGJEyFyboJcBilOZt4r5F4yaxKl6tDAj1mj/g==
X-Google-Smtp-Source: AK7set8i/R4jubc4/eBLZr1C2uot2lhviGeGxjdH9LtwH5rX8BcQ29iFG2gEY6poGbAAfxlHLKG4eGpFSJTOl8lO5k0=
X-Received: by 2002:a25:2441:0:b0:80b:5988:2045 with SMTP id
 k62-20020a252441000000b0080b59882045mr107656ybk.59.1675209840310; Tue, 31 Jan
 2023 16:04:00 -0800 (PST)
MIME-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com> <20230126193752.297968-5-surenb@google.com>
 <Y9jSFFeHYZE1/yFg@hyeyoo> <CAJuCfpEzaVkgQt=C-33jAh1vLVJAjoyM8X5AD9CzyDUJnPDCkw@mail.gmail.com>
 <20230131125355.f07f42af56b23bfa28b2a58c@linux-foundation.org>
 <CAJuCfpHmtkzrKx45SQQ0gXLoybtgHxHmTP5J4L74ChTqSfFA-g@mail.gmail.com> <20230131151209.d53ba65c3c065979808d9912@linux-foundation.org>
In-Reply-To: <20230131151209.d53ba65c3c065979808d9912@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 31 Jan 2023 16:03:49 -0800
Message-ID: <CAJuCfpF-Lu2fX6azVzmpJn75qDgwjpWjKT85=CEbwo2YAnx-Qw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] mm: replace vma->vm_flags direct modifications
 with modifier calls
To: Andrew Morton <akpm@linux-foundation.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Sebastian Reichel <sebastian.reichel@collabora.com>, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, h
 annes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 31, 2023 at 3:12 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 31 Jan 2023 13:08:19 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > On Tue, Jan 31, 2023 at 12:54 PM Andrew Morton
> > <akpm@linux-foundation.org> wrote:
> > >
> > > On Tue, 31 Jan 2023 10:54:22 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > > > > -             vma->vm_flags &= ~VM_MAYWRITE;
> > > > > > +             vm_flags_clear(vma, VM_MAYSHARE);
> > > > > >       }
> > > > >
> > > > > I think it should be:
> > > > >         s/VM_MAYSHARE/VM_MAYWRITE/
> > > >
> > >
> > > I added the fixup.  Much better than resending a seven patch series for a
> > > single line change.  Unless you have substantial other changes pending.
> >
> > Thanks! That sounds reasonable.
> >
> > I'll also need to introduce vm_flags_reset_once() to use in
> > replacement of WRITE_ONCE(vma->vm_flags, newflags) case. Should I send
> > a separate short patch for that?
>
> That depends on what the patch looks like.  How about you send it
> and we'll see?

Here it is: https://lore.kernel.org/all/20230201000116.1333160-1-surenb@google.com/

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
