Return-Path: <linuxppc-dev+bounces-14551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B84C94AD8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Nov 2025 03:56:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dJsBF5QY8z2yr9;
	Sun, 30 Nov 2025 13:56:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::733"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764471397;
	cv=none; b=m73ZewFX+HZ8HSGQLowtcQ3hRz98TjPtA99CGUP70YNp/FepCovUhK17xv2oRlChn+8whcAkuWcmOLys6k+DBLmfegMhJcUcTBQL5l6MrAVnlrY8JqNMHUjmw96JIdKCYxrrPBW6WEOVwYMqCK6hDpqNAzBlRL9q+rKHfRXaQOry2mBU6kxeoC+AfNfucEN+5KLMTZXJN5qF7sTY35FjE4JSH0lxSuhATezqElBBWLZZdWmlaChhYHFbfCdeWidrbt1dRVBYVWFuMc+haxXN4NL9BclR8aSovXJXvHv0XdA+cJidRZllYBPvpQuXmnJR5F5v/WmGUbZm5+IGjESehw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764471397; c=relaxed/relaxed;
	bh=+XJGr14VL/NvhNbPuU96ozt3/FF8toa21mCuIzcZISc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOkeY/+ZkUdoFaTrhHDuhNKxCB+yycJ//DbSYUPaUsbDs4/sT5SmIlj+d+z9VTlCmfSkfLksyZsc2iei8EYGQREv0Z8yhz2y67Ov0MaDKwGomEwqhXKNRYl0KuU327WsApPKwJEukjeCFn36XBW7Q/aTJXmQ3m3MzdDwngUB+NPbKeVrmI8Eo7RAcXHkPFst6Sxq4kT8VejPccxn9Epy6ahbDuwehcJkBl/ULs/lzWKsSjbYHNOHKqy57mmxMPw492y/xlWZmdKiVxpRhC5wTpVYnfmHa7EhqVcdMUmt4PGnr33RW/ND260J6X+vVpIWHmxlOsBiBwhL8WIltq9SNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f5P+plnE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f5P+plnE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJsBC41tsz2ynH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Nov 2025 13:56:34 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b2aa1ae006so412845585a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Nov 2025 18:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764471392; x=1765076192; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XJGr14VL/NvhNbPuU96ozt3/FF8toa21mCuIzcZISc=;
        b=f5P+plnEN6upB4p7SrVwMqXYYTPv5ksaw4vHkoAwHUeO+T9lKjn59OBYKPkXdQ+pGz
         RoTLio4JfDS3kyvKZ7MYrPBX3+2lrGTeV8vpRrXNT8d7RD8JJkacfwpH6YMPZm05Vb+A
         LGe8kjm72RzTuFtg9VqBBfroueTitmBfXTgCTW0ffJgXJy1QGLzLpHT90NEtXN+d99Ia
         PONXrbpqM5gCwyOgF/4hDhOeziYOkz0AqNr2MkkohBXKrg+wxuZ/O+z/O1v8LdzOJqtX
         ClcDQ7WxzZCNlgoGm4/a1YBn5+7TyGBIECrZcfD85qSYDh5H17SBqLnPL9t+fNw5QILJ
         LF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764471392; x=1765076192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XJGr14VL/NvhNbPuU96ozt3/FF8toa21mCuIzcZISc=;
        b=PLWMVsIL5bfPMBbU3Ogx2kxRC0+lhIFRbOdeHNWZyOtwcYctEXtl2tMXt7VOzHlO7G
         EUoSxYyMeUzD/4fP/8puvESdwfqC3KYDbpgGAKjjaJikza5tyUb/HqmwipCInEz4IkMQ
         YdQxT24iTT5oVIRA4d3vGlsT6NiWyHTDxA77G7S41+YaEgiZUZwScxPBseDKr6VU+wVj
         izs/dR4gXcS+3ABeIU7zXHkpcbC7ptoxVsxWdPbv+8PSX1/tJjqrTzWFWKvaoyCfBL9p
         LTYb/o54TGe9yRAwW2Dp0kTEYhFkjB7XYnhwvWYm+Ra3f4WQUq0TVpxg1VgDU9NneBpD
         f0Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVeOTL1N+nnAa/rwy2jb5q+1AGHFpOHXdQuibzxXSitNuWnrCS8cdFBJ0rplsFkUSYL4wlRC9F7WqRaC28=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbWcyWvhfBGJxVFKUfmgIuTvWzrW9kGc3vtzrBM4rOK6iRMmML
	A4NL2ROOYAXNgUC78d5e8a5s33b28rqzLcuZw6OyxBgEtaIoveVqm3B7Nc5j6AkC3KbOGDhAlrg
	WoZzR0mdrIGSAFSJL4wGFFu3NFtGPPC0=
X-Gm-Gg: ASbGncvExWZEE8AoUs2ZGCVbyUCbcJbNIlBgixCzIH2o6y5uPHMi41EKCX8VzOx8GRb
	+gv8zMgA6esgBbHarJTrmdqAxMf8G8sIbCoorkxkcA830Y5/aIYCm0U1IbQHltJvyWPzQz0Rf2c
	XlptFLl8j6H5t4AtsrwRLkrbX8sLGB8rlsxksag2H9f62GxnCHbx5sPmsND4xJPiJhOonEMceze
	e3CkQWTtBx7bH+Jm0noaEMQvJTQ+piUBpVlmrbljI/FIGS6D/iv/PJnZY+3OMK84LyhtQ==
X-Google-Smtp-Source: AGHT+IF/3KjmDnaoo/ldsvPnDlqyF1g2t85SJ38riWFY6aw2+Rx4sE2XTJgJQYrytReWz53k6ueQn63K+Iy7zP31uHo=
X-Received: by 2002:a05:620a:4407:b0:8b2:e565:50b5 with SMTP id
 af79cd13be357-8b33d49a212mr4299108585a.60.1764471391497; Sat, 29 Nov 2025
 18:56:31 -0800 (PST)
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
 <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
In-Reply-To: <CAJuCfpFVQJtvbj5fV2fmm4APhNZDL1qPg-YExw7gO1pmngC3Rw@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 30 Nov 2025 10:56:20 +0800
X-Gm-Features: AWmQ_bmtzU1YmYdPvDdBUL-_Xs4w9bVsuxx9pZGnImnoxnlMuoZQMERTeIMRpa0
Message-ID: <CAGsJ_4wnwAet4svDrxT4sTdp24sweAU-2VyYn3iNPOoaKdXxPw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Suren Baghdasaryan <surenb@google.com>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Nov 30, 2025 at 8:28=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Nov 27, 2025 at 2:29=E2=80=AFPM Barry Song <21cnbao@gmail.com> wr=
ote:
> >
> > On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead=
.org> wrote:
> > >
> > > [dropping individuals, leaving only mailing lists.  please don't send
> > > this kind of thing to so many people in future]
> > >
> > > On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > > > On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infr=
adead.org> wrote:
> > > > >
> > > > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > > > There is no need to always fall back to mmap_lock if the per-VM=
A
> > > > > > lock was released only to wait for pagecache or swapcache to
> > > > > > become ready.
> > > > >
> > > > > Something I've been wondering about is removing all the "drop the=
 MM
> > > > > locks while we wait for I/O" gunk.  It's a nice amount of code re=
moved:
> > > >
> > > > I think the point is that page fault handlers should avoid holding =
the VMA
> > > > lock or mmap_lock for too long while waiting for I/O. Otherwise, th=
ose
> > > > writers and readers will be stuck for a while.
> > >
> > > There's a usecase some of us have been discussing off-list for a few
> > > weeks that our current strategy pessimises.  It's a process with
> > > thousands (maybe tens of thousands) of threads.  It has much more map=
ped
> > > files than it has memory that cgroups will allow it to use.  So on a
> > > page fault, we drop the vma lock, allocate a page of ram, kick off th=
e
> > > read, sleep waiting for the folio to come uptodate, once it is return=
,
> > > expecting the page to still be there when we reenter filemap_fault.
> > > But it's under so much memory pressure that it's already been reclaim=
ed
> > > by the time we get back to it.  So all the threads just batter the
> > > storage re-reading data.
> >
> > Is this entirely the fault of re-entering the page fault? Under extreme
> > memory pressure, even if we map the pages, they can still be reclaimed
> > quickly?
> >
> > >
> > > If we don't drop the vma lock, we can insert the pages in the page ta=
ble
> > > and return, maybe getting some work done before this thread is
> > > descheduled.
> >
> > If we need to protect the page from being reclaimed too early, the fix
> > should reside within LRU management, not in page fault handling.
> >
> > Also, I gave an example where we may not drop the VMA lock if the folio=
 is
> > already up to date. That likely corresponds to waiting for the PTE mapp=
ing to
> > complete.
> >
> > >
> > > This use case also manages to get utterly hung-up trying to do reclai=
m
> > > today with the mmap_lock held.  SO it manifests somewhat similarly to
> > > your problem (everybody ends up blocked on mmap_lock) but it has a
> > > rather different root cause.
> > >
> > > > I agree there=E2=80=99s room for improvement, but merely removing t=
he "drop the MM
> > > > locks while waiting for I/O" code is unlikely to improve performanc=
e.
> > >
> > > I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" co=
de
> > > was written before the VMA locking code was written.  I don't know th=
at
> > > it's actually helping these days.
> >
> > I am concerned that other write paths may still need to modify the VMA,=
 for
> > example during splitting. Tail latency has long been a significant issu=
e for
> > Android users, and we have observed it even with folio_lock, which has =
much
> > finer granularity than the VMA lock.
>
> Another corner case we need to consider is when there is a large VMA
> covering most of the address space, so holding a VMA lock during IO
> would resemble holding an mmap_lock, leading to the same issue that we
> faced before "drop mmap locks for I/O". We discussed this with Matthew
> in the context of the problem he mentioned (the page is reclaimed
> before page fault retry happens) with no conclusion yet.

Suren, thank you very much for your input.

Right. I think we may discover more corner cases on Android in places
where we previously saw VMA merging, such as between two native heap
mmap areas. This can happen fairly often, and we don=E2=80=99t want long BI=
O
queues to block those writers.

>
> >
> > >
> > > > The change would be much more complex, so I=E2=80=99d prefer to lan=
d the current
> > > > patchset first. At least this way, we avoid falling back to mmap_lo=
ck and
> > > > causing contention or priority inversion, with minimal changes.
> > >
> > > Uh, this is an RFC patchset.  I'm giving you my comment, which is tha=
t I
> > > don't think this is the right direction to go in.  Any talk of "landi=
ng"
> > > these patches is extremely premature.
> >
> > While I agree that there are other approaches worth exploring, I
> > remain entirely unconvinced that this patchset is the wrong
> > direction. With the current retry logic, it substantially reduces
> > mmap_lock acquisitions and represents a clear low-hanging fruit.
> >
> > Also, I am not referring to landing the RFC itself, but to a subsequent=
 formal
> > patchset that retries using the per-VMA lock.
>
> I don't know if this direction is the right one but I agree with
> Matthew that we should consider alternatives before adopting a new
> direction. Hopefully we can find one fix for both problems rather than
> fixing each one in isolation.

As I mentioned in a follow-up reply to Matthew[1], I think the current
approach also helps in cases where pages are reclaimed during retries.
Previously, we required mmap_lock to retry, so any contention made it
hard to acquire and introduced high latency. During that time, pages
could be reclaimed before mmap_lock was obtained. Now that we only
require the per-VMA lock, retries can proceed much more easily than
before.
As long as we replace a big lock with a smaller one, there is less
chance of getting stuck in D state.

If either you or Matthew have a reproducer for this issue, I=E2=80=99d be
happy to try it out.

BTW, we also observed mmap_lock contention during MGLRU aging. TBH, the
non-RMAP clearing of the PTE young bit does not seem helpful on arm64,
which does not support non-leaf young bits at all. After disabling the
feature below, we found that reclamation used less CPU and ran better.

echo 1 >/sys/kernel/mm/lru_gen/enabled

0x0002 Clearing the accessed bit in leaf page table entries in large
       batches, when MMU sets it (e.g., on x86). This behavior can
       theoretically worsen lock contention (mmap_lock). If it is
       disabled, the multi-gen LRU will suffer a minor performance
       degradation for workloads that contiguously map hot pages,
       whose accessed bits can be otherwise cleared by fewer larger
       batches.

[1] https://lore.kernel.org/linux-mm/CAGsJ_4wvaieWtTrK+koM3SFu9rDExkVHX5eUw=
YiEotVqP-ndEQ@mail.gmail.com/

Thanks
Barry

