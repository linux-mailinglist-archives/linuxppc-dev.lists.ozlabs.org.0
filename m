Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840566E82C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:10:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxM445qvqz3fD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:10:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mTi6Cm+r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=mTi6Cm+r;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxM352J5Bz3fC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:09:36 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id 66so522079yba.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E1pw3vOO82Ds9w0163Mtmi7QOVEF9Qab6422FSilTSc=;
        b=mTi6Cm+rzRtxi6oZLIJ91mSXwfcEY4a81qq/xNecU7vlrtpUR0JpUZwhomKtKdV/bH
         yATQfErPbZeyxcdUyrwsBWOSQi8RryHvk++rcz/w37nplP0mXTMxsOfNDarssjFI59pq
         xr/7egPGkEYgrPd2M84+OJzl0Gvc+HM4EftCB2pHv8VhI8/KQoFHXoj87lciP06arJYR
         b6NCAoEFSNtxVpc2Xa35GvApYPnqkvaTscxeFceDY0/WXM2I2CsL2bwcuP4vAlthafgX
         e/k0u6+zh4JdfVmiWfJDx6EnicyeOXe5BqhJwpOAEOaXveBALnLC//9uWtAWOKl1MqIc
         ZOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1pw3vOO82Ds9w0163Mtmi7QOVEF9Qab6422FSilTSc=;
        b=OQnNKjlEUhhtm6STf1sbyjCfb9bHBQGgJU4p7EMMW777EEbrwt9Fkga10A8zyXCk6/
         B5F0wu1MCR14lPIdL+dRiu6Rdk+HB74ZqwcvgeYyPRBwkOvKlBzVhVUS3lET4RWLlZ6O
         8iIfpkaq6zT6P87cAWlwPG1sxnKj4/8wSXzsuScjRqATVYAQVi0XzrZHlWi4/uhYpzRc
         J3XbxJFysE79//PAewzEPzxJY2hDGM8rozpi08ktOuhBVvEhPW2kDlaUTSgCcYEZVYhQ
         3p0niiflxC62h4nkUN+/N4UkbXFeo0baAHQNeo6/HHwn100aK72oBufDYaiGTDY68u0j
         /CWw==
X-Gm-Message-State: AFqh2krukXtZh9kmzgBNTFLDuOlXgn8xWQEJ8dXuWaDxLrvECr1zWBZ7
	lCMYunBFa1Zo52to19D/zkelXSQXYFBxYcYv/Qi5GA==
X-Google-Smtp-Source: AMrXdXsOr+GEGkBosigfUHXu92KjE9VznkpfG3TQiLvk8vecH24hbrAEBO8q8YfqiqTC9f7Q1FqDZlNhJ6QWePgl6iw=
X-Received: by 2002:a05:6902:685:b0:7e9:646d:2da3 with SMTP id
 i5-20020a056902068500b007e9646d2da3mr667784ybt.340.1673989773689; Tue, 17 Jan
 2023 13:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
 <Y8a5lRr+qNVwau5G@dhcp22.suse.cz>
In-Reply-To: <Y8a5lRr+qNVwau5G@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 13:09:13 -0800
Message-ID: <CAJuCfpGGWLsagSsXbe8mshm9fTD0CZ=Hmv8c_5Uj2+YFStLaEw@mail.gmail.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
To: Michal Hocko <mhocko@suse.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 7:07 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 09-01-23 12:53:07, Suren Baghdasaryan wrote:
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 5986817f393c..c026d75108b3 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -474,6 +474,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> >                */
> >               *new = data_race(*orig);
> >               INIT_LIST_HEAD(&new->anon_vma_chain);
> > +             vma_init_lock(new);
> >               dup_anon_vma_name(orig, new);
> >       }
> >       return new;
> > @@ -1145,6 +1146,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
> >       seqcount_init(&mm->write_protect_seq);
> >       mmap_init_lock(mm);
> >       INIT_LIST_HEAD(&mm->mmlist);
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +     WRITE_ONCE(mm->mm_lock_seq, 0);
> > +#endif
>
> The mm shouldn't be visible so why WRITE_ONCE?

True. Will change to a simple assignment.

>
> --
> Michal Hocko
> SUSE Labs
