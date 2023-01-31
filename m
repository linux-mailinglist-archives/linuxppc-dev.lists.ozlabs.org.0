Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 196CA683858
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 22:09:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5yNP757lz3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 08:09:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U/HrMYPE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=U/HrMYPE;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5yMT0RhFz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 08:08:35 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id 123so19798205ybv.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 13:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bDq7d/n4hRdxw/uuHY1zsy7WUcXmIawJLMPKVEj5Oqk=;
        b=U/HrMYPECFRkq9PkPWwApR3OeNslyly/bOGovMVkhgn5x/4H3rBa+5Q1e8lajkmDFg
         hdXiowPRj5EJYmQVq9v0e3GI9JRDz5DDKyxwYMJnQQUDMLSyXobCMDk8u5db/owOJJ5L
         GAAyUx478W7Dj8GmbfulidXOwwUIp82QUFfTe8W4/EE7jRoOVHESeFqMZbWCROEzxlFp
         XbZxSml7D6XvIfI3uiwDZBOWarlwFsYgBHo7/hJ9rwt2ieOpQlFlDGL8xtXyb8xPzMAL
         BNBZNshG24V4cs4Sz8MVzFEx3BFPEwCUj7E3bhs6Ek5WwtzRyXCLhX5E2tjmXkI8dGzU
         Dzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDq7d/n4hRdxw/uuHY1zsy7WUcXmIawJLMPKVEj5Oqk=;
        b=hal7EEDObZQF80AVQDq8TzAgdO/wVK7qfc1AvK7zL/boJrHylL235Uz6P1aY8MMRAk
         QzYM3xY3AduQg/Ejp6MtD1nNkuQnkuZA9/I2jcTXj46ZdKm30CWT2WoZNw1EuK6CjBL0
         nURrD87SCLzkaHKNkeOQPatS5f1lCpayXe+Fg86u0bbni4Ra9u7C5hws6trwtNNOpf86
         jhUhq1qy6bl0W1J/3cMp7+2kBLz9L/Unj+oQoSk6k29NUsD8QXym9e54y0VfNLomq+N2
         mNnp6+CDTikUKyTeBvdfSngAGpC5+26XQuwjpF4V0M8eesJKjJsLWDF4KP/8ugAscPd8
         nhzg==
X-Gm-Message-State: AO0yUKWhzwLl8tHqIq0G+1sG6xFFvqp8xC+drMxSXOvPxGYzK44X1n3R
	2SBelzV6scLo57B17KyPqtX6ydI10v50mCtMwZUKiw==
X-Google-Smtp-Source: AK7set8TN+vhTCk6n+wEoQB3UO9IaaO8ylUfxNJA77IxdpDEU7vhpknIio3f4DVrz3qNcZAJLnR7+kYgR98f6snoq4A=
X-Received: by 2002:a25:a088:0:b0:80b:6fd3:84d3 with SMTP id
 y8-20020a25a088000000b0080b6fd384d3mr46494ybh.316.1675199311005; Tue, 31 Jan
 2023 13:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com> <20230126193752.297968-5-surenb@google.com>
 <Y9jSFFeHYZE1/yFg@hyeyoo> <CAJuCfpEzaVkgQt=C-33jAh1vLVJAjoyM8X5AD9CzyDUJnPDCkw@mail.gmail.com>
 <20230131125355.f07f42af56b23bfa28b2a58c@linux-foundation.org>
In-Reply-To: <20230131125355.f07f42af56b23bfa28b2a58c@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 31 Jan 2023 13:08:19 -0800
Message-ID: <CAJuCfpHmtkzrKx45SQQ0gXLoybtgHxHmTP5J4L74ChTqSfFA-g@mail.gmail.com>
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

On Tue, Jan 31, 2023 at 12:54 PM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Tue, 31 Jan 2023 10:54:22 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > > > -             vma->vm_flags &= ~VM_MAYWRITE;
> > > > +             vm_flags_clear(vma, VM_MAYSHARE);
> > > >       }
> > >
> > > I think it should be:
> > >         s/VM_MAYSHARE/VM_MAYWRITE/
> >
>
> I added the fixup.  Much better than resending a seven patch series for a
> single line change.  Unless you have substantial other changes pending.

Thanks! That sounds reasonable.

I'll also need to introduce vm_flags_reset_once() to use in
replacement of WRITE_ONCE(vma->vm_flags, newflags) case. Should I send
a separate short patch for that?

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
