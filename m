Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D55B3CB7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLbQ1mHqz3cBt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bm1FOIwt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bm1FOIwt;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPLZq6bsFz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:11:15 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-346cd4c3d7aso24388857b3.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=H8x/XM6uf9GNJ3IYrM179zXxz1ytCDaEsM8slNACmxA=;
        b=bm1FOIwt0xPcS44lKFw20V/2FDGaluKQMr5RC/lv3kNt2CPd2qLKAgKO08lxAtII6u
         PqklGnQVjl04fCksXY7P6fDFkNnDl8WYpxKvWT4cYx3ZkcilSVu+h2Aa6BrXe55muS1Q
         agwNdalHUuz0PeBqka58ITIOXvnpT9SNeecbgghP1pdGggGAydoTvqHCpmNM9m0z/Ypb
         fWpqtc3wWWhY39E/EicXhVnsQm904qYgi9g1ZHZrJV15Rdnfrn7Ug3poT5uJ1TyVxIrs
         O9pd33EAGvLIIFPhsJ7pXSeH1VXZczvL3gB1yaSelr3tpJ7jNqnRpd0+Oyvi9CJLfpKx
         kbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=H8x/XM6uf9GNJ3IYrM179zXxz1ytCDaEsM8slNACmxA=;
        b=71VJvbR3Rc6Grt3A8LBDDt1EZ525qb7haDsOZFYtL56bYvOXDPL7frMcnVFgWs1oan
         cKThmXTkxaLUwjLXSiBKNzhQvtBKpfOmLeGloo7ojXvjUMb4yXXSlF3Uk3qV1wHbJUdb
         J+dC5OYfQorVCq7AT7MaOdZTiragzjZRyBaQ+lCy6ZwPKCJG5RHb9Jevz+Ji6ChSBAMk
         RHFFRz8eVgHOgwF5M4ZoLCL/jjKZu+n6J/XY3SfuwYFLgnz1oCuDjMi4btX+pFDjAo1p
         b88nNrtwz61bb4XkFahmoSYH07Hji4ecFjNYy6mzruDKp0DkOOqzVauk2A+MxxjYPzBJ
         JMwg==
X-Gm-Message-State: ACgBeo3CZsmIG2GaPvHusv9hX9kge2KXrXdjti5VVO0nmZP2inw+tjJZ
	1U/bvAfwtGEUGURprGapaQHMsTqvFJofmuayvljY9g==
X-Google-Smtp-Source: AA6agR5l3NZBiyBjZVBHRaW8gCnmEWnPaAr7lbOsOW2FwXMOgi2wrQrtA9QsGncMTjIGt3R0HYfTWoumi/nvScrttCI=
X-Received: by 2002:a0d:f904:0:b0:345:4639:8253 with SMTP id
 j4-20020a0df904000000b0034546398253mr12696848ywf.438.1662739873041; Fri, 09
 Sep 2022 09:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-21-surenb@google.com>
 <54df2224-feca-52ed-567b-a82bb9d711da@linux.ibm.com>
In-Reply-To: <54df2224-feca-52ed-567b-a82bb9d711da@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:11:02 -0700
Message-ID: <CAJuCfpGRN244-Z3v6+sj7zJ9NGftA8ejq7FpnfyWWyGqJgvOPg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 20/28] mm: introduce per-VMA lock statistics
To: Laurent Dufour <ldufour@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 7:29 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:35, Suren Baghdasaryan a =C3=A9crit :
> > Add a new CONFIG_PER_VMA_LOCK_STATS config option to dump extra
> > statistics about handling page fault under VMA lock.
> >
>
> Why not making this a default when per VMA lock are enabled?

Good idea. If no objections I'll make that change.

>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/vm_event_item.h | 6 ++++++
> >  include/linux/vmstat.h        | 6 ++++++
> >  mm/Kconfig.debug              | 8 ++++++++
> >  mm/vmstat.c                   | 6 ++++++
> >  4 files changed, 26 insertions(+)
> >
> > diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_ite=
m.h
> > index f3fc36cd2276..a325783ed05d 100644
> > --- a/include/linux/vm_event_item.h
> > +++ b/include/linux/vm_event_item.h
> > @@ -150,6 +150,12 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWP=
OUT,
> >  #ifdef CONFIG_X86
> >               DIRECT_MAP_LEVEL2_SPLIT,
> >               DIRECT_MAP_LEVEL3_SPLIT,
> > +#endif
> > +#ifdef CONFIG_PER_VMA_LOCK_STATS
> > +             VMA_LOCK_SUCCESS,
> > +             VMA_LOCK_ABORT,
> > +             VMA_LOCK_RETRY,
> > +             VMA_LOCK_MISS,
> >  #endif
> >               NR_VM_EVENT_ITEMS
> >  };
> > diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
> > index bfe38869498d..0c2611899cfc 100644
> > --- a/include/linux/vmstat.h
> > +++ b/include/linux/vmstat.h
> > @@ -131,6 +131,12 @@ static inline void vm_events_fold_cpu(int cpu)
> >  #define count_vm_vmacache_event(x) do {} while (0)
> >  #endif
> >
> > +#ifdef CONFIG_PER_VMA_LOCK_STATS
> > +#define count_vm_vma_lock_event(x) count_vm_event(x)
> > +#else
> > +#define count_vm_vma_lock_event(x) do {} while (0)
> > +#endif
> > +
> >  #define __count_zid_vm_events(item, zid, delta) \
> >       __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
> >
> > diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> > index ce8dded36de9..075642763a03 100644
> > --- a/mm/Kconfig.debug
> > +++ b/mm/Kconfig.debug
> > @@ -207,3 +207,11 @@ config PTDUMP_DEBUGFS
> >         kernel.
> >
> >         If in doubt, say N.
> > +
> > +
> > +config PER_VMA_LOCK_STATS
> > +     bool "Statistics for per-vma locks"
> > +     depends on PER_VMA_LOCK
> > +     help
> > +       Statistics for per-vma locks.
> > +       If in doubt, say N.
> > diff --git a/mm/vmstat.c b/mm/vmstat.c
> > index 90af9a8572f5..3f3804c846a6 100644
> > --- a/mm/vmstat.c
> > +++ b/mm/vmstat.c
> > @@ -1411,6 +1411,12 @@ const char * const vmstat_text[] =3D {
> >       "direct_map_level2_splits",
> >       "direct_map_level3_splits",
> >  #endif
> > +#ifdef CONFIG_PER_VMA_LOCK_STATS
> > +     "vma_lock_success",
> > +     "vma_lock_abort",
> > +     "vma_lock_retry",
> > +     "vma_lock_miss",
> > +#endif
> >  #endif /* CONFIG_VM_EVENT_COUNTERS || CONFIG_MEMCG */
> >  };
> >  #endif /* CONFIG_PROC_FS || CONFIG_SYSFS || CONFIG_NUMA || CONFIG_MEMC=
G */
>
