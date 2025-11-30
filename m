Return-Path: <linuxppc-dev+bounces-14550-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A47C949A7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Nov 2025 01:28:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dJnv94qlMz2yvD;
	Sun, 30 Nov 2025 11:28:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764462501;
	cv=none; b=XPdjuKve6sSzBQAtz8QE/w2MoU9RHME2bZRKij3C1u+OyDVNklNgn7DYZPqTum8O32f2+W1NE2Xdi1UEhmnXBofvv/XwR++/dmyFasnUl+ZMPZesOg6KGOM9C/8A4d3PCBAt9uHoYa0gl8qmFBcGyC+xEt02+kNZqdCF0z7HlH7D2jwqZ6a+aNGf9oEJ17Bsd9tAEecoIFFwzZVuAvlLxLzUlJIFJkBMAZL0vFPIUlJkrHu2VkM2IW11ZQr2Nerj+wGi8VBXFgIW6h/wbFC3tXPDg9xY8lkYlNC6LDs4VFbn8UqKy0ZDwfn/h2zBc2I5Hf44FaL+dT52SS0knekvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764462501; c=relaxed/relaxed;
	bh=xdkwplQZXP7FjFnU+v366rZ413pi5bTQ7R9T4YIrwjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnftW5pM1P0MsFw3gkaeGGRVP6RPjHSbiOi+amyEi8mfNw2QJhCiR8v6XAOF9EC9513VuPT6fiGuEFvIrPEuwfbloa6n9lJS+RFLK3qrxNNKGXPMjjxyq1swFmSrjKC/FBFYhvtre36LvPuKYKrW4n1fm04rbbZivIWRvicqA+XdDjDVDUY9HZl5Hi9IB6/aDp9Nrym9wcWLqeCkNMn4AJA/UKLXikNN27JC6ksjfkYqieD+by0rcX8Cn0SCLtgWApgxKN1du/x1soTpJqUkMyiPi3ePYG/ugBxqx/PEx6wOiTI08miYdIhDJqppjV4zvoxk5FHhiAz8rg/dYXW/qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2SfgAXaj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2SfgAXaj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82e; helo=mail-qt1-x82e.google.com; envelope-from=surenb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJnv70Hjcz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Nov 2025 11:28:18 +1100 (AEDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ee147baf7bso851891cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Nov 2025 16:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764462494; x=1765067294; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdkwplQZXP7FjFnU+v366rZ413pi5bTQ7R9T4YIrwjA=;
        b=2SfgAXajtr9dXkhYX45LkL9p3tRxrQiC1DY2xlai1MuooW6iuGNFET3+z6QRpVcAru
         acE6C6UGPcG3+oyzrCJJxzfVchqiNImac9OqtSOZBFdh+yTMmXUxj7a6UR4oMkO2rJkj
         QgqdZCoN4xuyp2Zpd+sE7E0EybyzmsD8RkuaawsqUt+8bv7p/3tK2aZWHIrsgaIhDz0k
         XRvqDuwVc+4I4fmdyuVdhLoJEK+xs34cI+Bqc2g1Hg8FcY1M6ws/E1cI7hMHPD+uZkEH
         ghyGArBLy7B7jWll/PkW/1UH1C0D48cIRgrdjOgkQXt9AY55bsR0be2oUMCnOre3t47m
         Dqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764462494; x=1765067294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xdkwplQZXP7FjFnU+v366rZ413pi5bTQ7R9T4YIrwjA=;
        b=Ys728yv6aEgLkgIWk0a5VduxM4R9EYHkoxYN50s0DQrjNTlkN23HKweSRYTe09Pg09
         Lh+INyluiVKqRhu9UFrYvZBVrCANb8qHLLn8KfvNZmxR74aUcEHou1NB+lLm12QJQX6I
         BWGgXNU3bvRwyV8ofeDVti9LjqXw+mxFG5AHsQXeFoSfGeA+GKi0Mc+LzKpD1alpnpD/
         z7saqj9JZf/ldgwyWTPWv3GDtDk2aVYYO6B3VCKX2T1olkKj+kQPlyGyIg8B7Z+skIHj
         gBXZFqEfbib6jeQKTy5qXkKpNHu6x2mVppNTwqM6VbLyKJptp3YtELvysAtyAX8tepCt
         zmCA==
X-Forwarded-Encrypted: i=1; AJvYcCXdyM7+2Kd4r8sAhKhQ44BzlUh54/dFxXQsRySNRH2jj5cmW2JonuUmJUG8VEYD69+cjL4n9SjEl/yM/vk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyHlox/9Y8q4jWUdrgz/spcQiy76feFWEc7g2OwkX4u8/1MjfrB
	xnjvWA8KfX2uZniSTuqOozTagVKBNYI6XqzdtXWBY3aJx3AgBRThTIgaqp7ubi3CJ5LA3gl+Chn
	vwBbdVzIYRJdXaF4wGcPV+lgyE35bFLqr/cKU0NVP
X-Gm-Gg: ASbGncsGJVena/sSatgYpdwLsYgxd/9OvkxjhCThvtwUB5AaskzNFltXO729oGodDzq
	UXS0kt/bgdmJBoNrAtCAQCF5tzxmJMIRHGTz1ZGh9vZTNARxM3N9IcrCKpiRyarnCQ0/vV7kAxW
	q/TNKnE/YJc0X3gqicHUYHyPJc4K0kTnGZXX13yi2z5bBrSrBh03nuBZ7il56ak1oR+YV7qJdIU
	dE/p79Jgfwza5WA9H/H30xXOM2UDvcs9Rauzmv5qDiTimhxaGdEpUT7OwY5WGC25ZrAIXDN4JHL
	SJU=
X-Google-Smtp-Source: AGHT+IHVf3jUEElcRU5UiElII1poREaWD5vAdlvPdSkAXo0sG8wTVz/TvP7Aj2pleN+SVZmwr5KEBBbORX+cZ2IR4bw=
X-Received: by 2002:a05:622a:41:b0:4ed:7c45:9908 with SMTP id
 d75a77b69052e-4efd0ca4d05mr10929131cf.10.1764462494131; Sat, 29 Nov 2025
 16:28:14 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 29 Nov 2025 18:28:01 -0600
X-Gm-Features: AWmQ_blhKzVTz_OrE9p2RQX3OU7BXlogLE0D_GARspeRWjGy1hzzkkEbN5F-bD8
Message-ID: <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Barry Song <21cnbao@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 2:29=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > [dropping individuals, leaving only mailing lists.  please don't send
> > this kind of thing to so many people in future]
> >
> > On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > > On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infrad=
ead.org> wrote:
> > > >
> > > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > > There is no need to always fall back to mmap_lock if the per-VMA
> > > > > lock was released only to wait for pagecache or swapcache to
> > > > > become ready.
> > > >
> > > > Something I've been wondering about is removing all the "drop the M=
M
> > > > locks while we wait for I/O" gunk.  It's a nice amount of code remo=
ved:
> > >
> > > I think the point is that page fault handlers should avoid holding th=
e VMA
> > > lock or mmap_lock for too long while waiting for I/O. Otherwise, thos=
e
> > > writers and readers will be stuck for a while.
> >
> > There's a usecase some of us have been discussing off-list for a few
> > weeks that our current strategy pessimises.  It's a process with
> > thousands (maybe tens of thousands) of threads.  It has much more mappe=
d
> > files than it has memory that cgroups will allow it to use.  So on a
> > page fault, we drop the vma lock, allocate a page of ram, kick off the
> > read, sleep waiting for the folio to come uptodate, once it is return,
> > expecting the page to still be there when we reenter filemap_fault.
> > But it's under so much memory pressure that it's already been reclaimed
> > by the time we get back to it.  So all the threads just batter the
> > storage re-reading data.
>
> Is this entirely the fault of re-entering the page fault? Under extreme
> memory pressure, even if we map the pages, they can still be reclaimed
> quickly?
>
> >
> > If we don't drop the vma lock, we can insert the pages in the page tabl=
e
> > and return, maybe getting some work done before this thread is
> > descheduled.
>
> If we need to protect the page from being reclaimed too early, the fix
> should reside within LRU management, not in page fault handling.
>
> Also, I gave an example where we may not drop the VMA lock if the folio i=
s
> already up to date. That likely corresponds to waiting for the PTE mappin=
g to
> complete.
>
> >
> > This use case also manages to get utterly hung-up trying to do reclaim
> > today with the mmap_lock held.  SO it manifests somewhat similarly to
> > your problem (everybody ends up blocked on mmap_lock) but it has a
> > rather different root cause.
> >
> > > I agree there=E2=80=99s room for improvement, but merely removing the=
 "drop the MM
> > > locks while waiting for I/O" code is unlikely to improve performance.
> >
> > I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" code
> > was written before the VMA locking code was written.  I don't know that
> > it's actually helping these days.
>
> I am concerned that other write paths may still need to modify the VMA, f=
or
> example during splitting. Tail latency has long been a significant issue =
for
> Android users, and we have observed it even with folio_lock, which has mu=
ch
> finer granularity than the VMA lock.

Another corner case we need to consider is when there is a large VMA
covering most of the address space, so holding a VMA lock during IO
would resemble holding an mmap_lock, leading to the same issue that we
faced before "drop mmap locks for I/O". We discussed this with Matthew
in the context of the problem he mentioned (the page is reclaimed
before page fault retry happens) with no conclusion yet.

>
> >
> > > The change would be much more complex, so I=E2=80=99d prefer to land =
the current
> > > patchset first. At least this way, we avoid falling back to mmap_lock=
 and
> > > causing contention or priority inversion, with minimal changes.
> >
> > Uh, this is an RFC patchset.  I'm giving you my comment, which is that =
I
> > don't think this is the right direction to go in.  Any talk of "landing=
"
> > these patches is extremely premature.
>
> While I agree that there are other approaches worth exploring, I
> remain entirely unconvinced that this patchset is the wrong
> direction. With the current retry logic, it substantially reduces
> mmap_lock acquisitions and represents a clear low-hanging fruit.
>
> Also, I am not referring to landing the RFC itself, but to a subsequent f=
ormal
> patchset that retries using the per-VMA lock.

I don't know if this direction is the right one but I agree with
Matthew that we should consider alternatives before adopting a new
direction. Hopefully we can find one fix for both problems rather than
fixing each one in isolation.

>
> Thanks
> Barry
>

