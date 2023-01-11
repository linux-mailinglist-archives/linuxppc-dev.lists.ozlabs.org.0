Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F258666072
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 17:29:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsY7466cjz3cKm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 03:29:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Yzh3gZKn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Yzh3gZKn;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsY692RgGz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 03:29:04 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-4d13cb4bbffso81646727b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 08:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Lr8tSm6MqUPgF/LWfHDA9iNzXlwa0xD0GVdK5cZd9g=;
        b=Yzh3gZKn1mLa2Za1k9SYRxbcKca9L17S5JQFl3qF9blmNHMcuOBgj4kMQW7wplK6Lx
         e8zBR6KI/RCHR++bGrQjGNn9B4FFj/zDTtccI3A0ugVo6eZmh4MPBQ2aGoOno0fhGxHl
         XjSlsW50U1m7j2YKUXjIDerEEAjp1e6UR8rEeqNUlp5Y5hg5hABLOUW+1+WYMuW+wjLD
         P6i3bApuhlQn2xaOuXEWwh7+Hr3Bhk7riQ8Ggwa18xpE6h0rgfqlX7mjzO50d0PlgXLA
         xih+3oKx3c2hbNzmL+L4GpJpGcz1WIyS/pKI84+Dlxo53T9P+/2BNhkVLDIOei55vmrr
         Vozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Lr8tSm6MqUPgF/LWfHDA9iNzXlwa0xD0GVdK5cZd9g=;
        b=GpXuyw9k6VSfTDEEz+TTCtF0+91YE1Zfmn3kb+YK41A89Y/hofl/NiKDGHV+n67evC
         eJAZ8nTz+EXiFmbGLsYjYfA6hNg8lmBYswk3oHaFT7ULM0lYjhmTwnKA0q/J4Gefd4tC
         8XLT/51w12BlQjUf0/sTqMdZmVmC+2CEMtV4HNF7PgtVnz2yioy6jzqj0ag/QbWl0bYB
         SuQmHssBjt4yNtWgijAsQu7vIrOLTM7SGNN70al7ntD14S/Vi7zZ7efxQi6mYiiMTAAU
         WtMSPqv1TlaZNGrbVPPv/k5Sf3XRDPjB3UMJitUHFeS5fnzYdAZSmDfuvU1X8SDUHQZ7
         cpGQ==
X-Gm-Message-State: AFqh2koBPpLH1zcISbK1ZTklcBw6bq3Z5xuMXs83c2k7HYmgsY0rwhJ3
	VCHve/FwTtCbZCwMA5WbyJn7zE2v75dF/FL0m9rkuQ==
X-Google-Smtp-Source: AMrXdXvLgK6W7lAuuCYwgiArrtAg97gzYPQSMPDbpaiV/C+O44LDuwgcKcWpyW8gYaBkcIY/p7HDYgSic7XqJ1wpyfU=
X-Received: by 2002:a81:190a:0:b0:3dc:fd91:ef89 with SMTP id
 10-20020a81190a000000b003dcfd91ef89mr2162583ywz.347.1673454540467; Wed, 11
 Jan 2023 08:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-9-surenb@google.com>
 <20230111001331.cxdeh52vvta6ok2p@offworld> <CAJuCfpEv--awCY0=R3h5Fez8x74U1EZCzNkq4_7deCYqej5sSA@mail.gmail.com>
 <Y75x5fGPcJ63pBIp@dhcp22.suse.cz> <Y76HTfIeEt8ZOIH3@gmail.com> <6be809f5554a4faaa22c287ba4224bd0@AcuMS.aculab.com>
In-Reply-To: <6be809f5554a4faaa22c287ba4224bd0@AcuMS.aculab.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 11 Jan 2023 08:28:49 -0800
Message-ID: <CAJuCfpH_VZq99=vGQGJ+evVg5wMPKGsjyawgHnOeoKhtEiAi6w@mail.gmail.com>
Subject: Re: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
To: David Laight <David.Laight@aculab.com>
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
Cc: "michel@lespinasse.org" <michel@lespinasse.org>, "joelaf@google.com" <joelaf@google.com>, "songliubraving@fb.com" <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, "leewalsh@google.com" <leewalsh@google.com>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "bigeasy@linutronix.de" <bigeasy@linutronix.de>, "peterx@redhat.com" <peterx@redhat.com>, "dhowells@redhat.com" <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "edumazet@google.com" <edumazet@google.com>, "jglisse@google.com" <jglisse@google.com>, "punit.agrawal@bytedance.com" <punit.agrawal@bytedance.com>, "arjunroy@google.com" <arjunroy@google.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "hughd@google.com" <hughd@google.com>, "willy@infradead.org" <willy@infradead.org>, Ingo Molnar <mingo@kernel.org>, "gurua@google.com" <gurua@google.com>, "laurent.dufour@fr.ibm.com" <laurent.dufour@fr.ibm.com>, "vbabka@suse.cz" <vbabka@suse.
 cz>, "rientjes@google.com" <rientjes@google.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "kernel-team@android.com" <kernel-team@android.com>, "soheil@google.com" <soheil@google.com>, "minchan@google.com" <minchan@google.com>, "jannh@google.com" <jannh@google.com>, "liam.howlett@oracle.com" <liam.howlett@oracle.com>, "shakeelb@google.com" <shakeelb@google.com>, "luto@kernel.org" <luto@kernel.org>, "gthelen@google.com" <gthelen@google.com>, "ldufour@linux.ibm.com" <ldufour@linux.ibm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "posk@google.com" <posk@google.com>, "lstoakes@gmail.com" <lstoakes@gmail.com>, "peterjung1337@gmail.com" <peterjung1337@gmail.com>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "hughlynch@google.com" <hughlynch@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "tatashin@
 google.com" <tatashin@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 11, 2023 at 2:03 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Ingo Molnar
> > Sent: 11 January 2023 09:54
> >
> > * Michal Hocko <mhocko@suse.com> wrote:
> >
> > > On Tue 10-01-23 16:44:42, Suren Baghdasaryan wrote:
> > > > On Tue, Jan 10, 2023 at 4:39 PM Davidlohr Bueso <dave@stgolabs.net> wrote:
> > > > >
> > > > > On Mon, 09 Jan 2023, Suren Baghdasaryan wrote:
> > > > >
> > > > > >This configuration variable will be used to build the support for VMA
> > > > > >locking during page fault handling.
> > > > > >
> > > > > >This is enabled by default on supported architectures with SMP and MMU
> > > > > >set.
> > > > > >
> > > > > >The architecture support is needed since the page fault handler is called
> > > > > >from the architecture's page faulting code which needs modifications to
> > > > > >handle faults under VMA lock.
> > > > >
> > > > > I don't think that per-vma locking should be something that is user-configurable.
> > > > > It should just be depdendant on the arch. So maybe just remove CONFIG_PER_VMA_LOCK?
> > > >
> > > > Thanks for the suggestion! I would be happy to make that change if
> > > > there are no objections. I think the only pushback might have been the
> > > > vma size increase but with the latest optimization in the last patch
> > > > maybe that's less of an issue?
> > >
> > > Has vma size ever been a real problem? Sure there might be a lot of those
> > > but your patch increases it by rwsem (without the last patch) which is
> > > something like 40B on top of 136B vma so we are talking about 400B in
> > > total which even with wild mapcount limits shouldn't really be
> > > prohibitive. With a default map count limit we are talking about 2M
> > > increase at most (per address space).
> > >
> > > Or are you aware of any specific usecases where vma size is a real
> > > problem?

Well, when fixing the cacheline bouncing problem in the initial design
I was adding 44 bytes to 152-byte vm_area_struct (CONFIG_NUMA enabled)
and pushing it just above 192 bytes while allocating these structures
from cache-aligned slab (keeping the lock in a separate cacheline to
prevent cacheline bouncing). That would use the whole 256 bytes per
VMA and it did make me nervous. The current design with no need to
cache-align vm_area_structs and with 44-byte overhead trimmed down to
16 bytes seems much more palatable.

> >
> > 40 bytes for the rwsem, plus the patch also adds a 32-bit sequence counter:
> >
> >   + int vm_lock_seq;
> >   + struct rw_semaphore lock;
> >
> > So it's +44 bytes.

Correct.

>
> Depend in whether vm_lock_seq goes into a padding hole or not
> it will be 40 or 48 bytes.
>
> But if these structures are allocated individually (not an array)
> then it depends on how may items kmalloc() fits into a page (or 2,4).

Yep. Depends on how we arrange the fields.

Anyhow. Sounds like the overhead of the current design is small enough
to remove CONFIG_PER_VMA_LOCK and let it depend only on architecture
support?
Thanks,
Suren.

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
