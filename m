Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C0665084
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 01:45:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ns89k3GFFz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 11:45:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rccchTxY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rccchTxY;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ns88q4G8Mz2ynD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 11:44:58 +1100 (AEDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-4d13cb4bbffso55808007b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 16:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtvZkDMfjdpj7QHOsKas/y5TjQNGWMzi4v+NaAfxc/M=;
        b=rccchTxYrSIKNuMMA04XAuTcSJ82eK2GdC2ENpgcicB00sj0WcV6jGWsPM7Vj88mPb
         QlM6SlS+l5D5N1ROSmPhwdv9eKvOxbnACcaMUmUMyG/hgdcTpc/m2/U7zUEjMHWKmRnJ
         iLnc+bUB3YARfZVoEVFAUqxXlhi7zPYNt5sxx3Yiv65exEivUjNJfGC6OO/litDhtM1s
         h6F5QPgDgXCz4P3MtLZPSCkFhTucZbdO/UV56ccQ8XpnKs4GidmWckh3zxyqlNmd7nzX
         e8wZVJSxeBkQJKlInwlBAfcaPDtsJFiO+j4iCugO/eypq/qyTfw7kmDZjkQ90McLsnQj
         Cghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtvZkDMfjdpj7QHOsKas/y5TjQNGWMzi4v+NaAfxc/M=;
        b=GDttbZOK0YWR1fHyb/PlvNYNwv+g0h/zuPS0JLqV7ClvVxR2N/yprk2jtJhqdmtGy8
         nZK5BSsrJGR/KRWa0GzHTjGO1NAi8lCsGtEpBUZPRaSFInRDwHKgK9sXy/n4HYwT8kdH
         XJahjle8BJkjvZQYuOU8k6FWq45Ijsw1vYtNaO4Y2oId5NLIPsK8Ptly6ZV8FyTjYRFU
         jZZ5Zh4xzecW8sENtjC+hF1FqD2DpWk78NN/Ut4q94hXt3yjRXyjvgk5oejTP2ut8NvB
         hy4ET1mXuV9VmjYX02GZfWdOzfqO9B3shj5G0zhvx1PiBSbJoSICDPYtL6uWH3p5/mrb
         UdOA==
X-Gm-Message-State: AFqh2kpGGH6nBnGNVCRsLypMntUOwrYJLoftpoWCwaXOx4yzK8dRvQsm
	z0z6sUb4gop40WhgLPXDbPAyDBfFhLv0ZaRK+by91Q==
X-Google-Smtp-Source: AMrXdXvPXLbnMiGgkk5CiK3fMZDgBpCfW92tb2P0dpshIrb2n4DxdFF46+Kabz2Cd6j2GosIoYiHxTRK+05ofT24Es8=
X-Received: by 2002:a0d:c2c5:0:b0:433:f1c0:3f1c with SMTP id
 e188-20020a0dc2c5000000b00433f1c03f1cmr1613574ywd.438.1673397893628; Tue, 10
 Jan 2023 16:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-9-surenb@google.com>
 <20230111001331.cxdeh52vvta6ok2p@offworld>
In-Reply-To: <20230111001331.cxdeh52vvta6ok2p@offworld>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 10 Jan 2023 16:44:42 -0800
Message-ID: <CAJuCfpEv--awCY0=R3h5Fez8x74U1EZCzNkq4_7deCYqej5sSA@mail.gmail.com>
Subject: Re: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, michel@lespinasse.org, 
	jglisse@google.com, mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, willy@infradead.org, liam.howlett@oracle.com, 
	peterz@infradead.org, ldufour@linux.ibm.com, laurent.dufour@fr.ibm.com, 
	paulmck@kernel.org, luto@kernel.org, songliubraving@fb.com, peterx@redhat.com, 
	david@redhat.com, dhowells@redhat.com, hughd@google.com, 
	bigeasy@linutronix.de, kent.overstreet@linux.dev, punit.agrawal@bytedance.com, 
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com, 
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com, 
	jannh@google.com, shakeelb@google.com, tatashin@google.com, 
	edumazet@google.com, gthelen@google.com, gurua@google.com, 
	arjunroy@google.com, soheil@google.com, hughlynch@google.com, 
	leewalsh@google.com, posk@google.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 10, 2023 at 4:39 PM Davidlohr Bueso <dave@stgolabs.net> wrote:
>
> On Mon, 09 Jan 2023, Suren Baghdasaryan wrote:
>
> >This configuration variable will be used to build the support for VMA
> >locking during page fault handling.
> >
> >This is enabled by default on supported architectures with SMP and MMU
> >set.
> >
> >The architecture support is needed since the page fault handler is called
> >from the architecture's page faulting code which needs modifications to
> >handle faults under VMA lock.
>
> I don't think that per-vma locking should be something that is user-configurable.
> It should just be depdendant on the arch. So maybe just remove CONFIG_PER_VMA_LOCK?

Thanks for the suggestion! I would be happy to make that change if
there are no objections. I think the only pushback might have been the
vma size increase but with the latest optimization in the last patch
maybe that's less of an issue?

>
> Thanks,
> Davidlohr
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
