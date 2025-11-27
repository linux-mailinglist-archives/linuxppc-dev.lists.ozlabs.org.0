Return-Path: <linuxppc-dev+bounces-14529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A30C901B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 21:29:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHShY5TCzz2yrQ;
	Fri, 28 Nov 2025 07:29:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f31"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764275373;
	cv=none; b=HBP6eo4KxpHU6exNPl+ZRGgBvKJe2pwzVksa2KUUirOuB1/OxsAaIMUqNmUNtGyFBN55tRepZayd6GL/MOREypLrrcCeqj39od0JyFCc37huBZEqCIpxBy3np2OmuFBFn8OrjZS0wtaHaUDm0HFGGbgkHOjccBHpQGec1r/nW/Qpu0dfFwhfyVSVEaRxwnTwzvBaffMzlDnRpiDmDDVfzzBKTZLXfCzhHj76y+5ddTVkvkfHjw4mu3jvQLZ/3tvYarhDjS/PQw+XHD4qjgVBbMC0d1OzT07h8oP7LOQEeCwmrDy0qwTLz2SOlUikjAGgXF+uuhewO5u0HswyZim3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764275373; c=relaxed/relaxed;
	bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nighIxLjbmZA1SSsjvD6c26xaKDjQ5XwLOOGIj0bGPuGZ/DmYxqRLDAILa3Cy4+lkwos6sTK/g2we2jbvD9qOK8UfLcpeVjjv/f81NT8bxBeiktqJIKHxb/9dG3q70w8SV+xq/GV1CrFV25K/wzWcqP0J4srFd1oKbT5xDRHLtQ60nESiUZxbGT7KeLhQKyWkLTOmz6voi3//WUlpGiknLApLPVqfO4Mx7eoU2vKnZRkDjqM+GZftQ9TBiagqsBeeiswC/zCOlNNYd8xWc33NJSl3sThFepUw1/6s5xATtrC99MHpGS6VMNW5rAmRmG/DWUXAPX1mw2g8RFub09PZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mnJ8BNeE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mnJ8BNeE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31; helo=mail-qv1-xf31.google.com; envelope-from=21cnbao@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHShX1ptVz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 07:29:31 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-880439c5704so11667606d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 12:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764275368; x=1764880168; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
        b=mnJ8BNeEm0jLy2V0UkBV0uJ4jNyzsd0uza17ZljJ/mg35U7GU5eF+cAOCQ0ugqeYZl
         JPru4J5Piu1nziOptP7itexc6XTHW93qnQotFbWg8RETD5wS4JVgtvl9BwCG6GfU8hsM
         0vW0SPNPVZ5q5/uA2ZSoTHp+bZHZfwFk+DKbVJSb4f+KSo3e8R4CaGGzopwumyjxAzvb
         HzIKxG04ryDx2JwiWMrt+D4DKyjvpSbmkPSTuTkIrkSDjSJpSH0602bft6FL/leWCtH/
         l9MnjCCptAmoAeKp3tdN8ibuifCULUf1TLaen9lfVBHDQQv2suFAL/KIMu2hlTvj2Je6
         KDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764275368; x=1764880168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BMTw1kDL8EKjTOAtowuEddJlwPoqJdeq89qWoiUPpVg=;
        b=wffGQoPVeGTkKeK9Mk6E3qZq2ZMhGHyFsZ/bYlWPGByN+bx6xluTNII4lMiALY7kvv
         /sPRVXNBB+WVFAgEyXJSYmxQwUdKrlRSfJ3F+ZlY0XAG+4ssgKlqe+3TSFZNo20v/pwc
         BILi2eJc7tFwWB0HsOKtJ1C1vxUEYktIJvPVLwt8Afh6tiAi2aR52rije9yphUNfPxp5
         qz1WkIr+ATFy+w7zj4OaPimyrRN5EeLNAX6lyb0ZJGDtERnmC+fej2g+3U4DeCJtuzjo
         lLTvkKp/N7EW0JQKbyKpQi2G0ufrl3wAOtDuG33y1/TqnX1ZI9XHLJov4SlfJBEQ1HhW
         y+Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXP8oSxThoOi+zfukQ5hZ5o1PR4G+qO1PI8tJer6zad6JCbmwzQLkszYztXdPSRFMyFVua2tUU4ZdcAsa4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsIGmy2auN9dACXYcPgFlUXrllHjp0KJubRVzXYhpre/ygpECL
	9pwmpQ8tnTAHqZUaOgpqCOs8GOh60/zZjjR4GbMWDY8Mks7KzUCTVj8Og0D/slBqbZXXZhU6fNF
	aW9a6zIvkKO1wAtyzQPhNlbE972ncQ/0=
X-Gm-Gg: ASbGncva0HYxXMbWGPQFqEVwJ/GU8bbb8QXKLi+YegRF4DME8QG5K+Uj0zDujSqfRum
	x5GmPG1o9AHcDAiSsMI4O+VuOzFBweCk/5dj92X4Qm1oj/XoyOSiX8ZLBbcThRLW9166vgMcM/w
	IkBUyeitNgkUMf8HYyf4EKHzd7OijjAcblZc+8laYBLInPzZC4CS/wd/j0JZYTrA1pBBYbOZZhM
	bAkfoqnvASSsCmQuhG4rqMQq3zh0ULMPqcapUPUD1G1U/W66rToxyn253mKVU0hUUfXWQ==
X-Google-Smtp-Source: AGHT+IG5GcGrOmVVsePre6BxCVhrhKY7NJnCRBVNCLt/HcgbymNTTZVjYmvrDTtjRkuAQ9GKsIJdwvx3BNDYrNQPC88=
X-Received: by 2002:a05:6214:234f:b0:880:486d:18dc with SMTP id
 6a1803df08f44-8863afb4d8fmr176925236d6.58.1764275367501; Thu, 27 Nov 2025
 12:29:27 -0800 (PST)
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
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com> <aSip2mWX13sqPW_l@casper.infradead.org>
In-Reply-To: <aSip2mWX13sqPW_l@casper.infradead.org>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 04:29:16 +0800
X-Gm-Features: AWmQ_bn_b-JGqeMVPQ751bNAv2Qsiauy9g_kN3cQ2gR4dkmeqYmOBAyRrjCf_ew
Message-ID: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 28, 2025 at 3:43=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> [dropping individuals, leaving only mailing lists.  please don't send
> this kind of thing to so many people in future]
>
> On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > On Thu, Nov 27, 2025 at 12:09=E2=80=AFPM Matthew Wilcox <willy@infradea=
d.org> wrote:
> > >
> > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > There is no need to always fall back to mmap_lock if the per-VMA
> > > > lock was released only to wait for pagecache or swapcache to
> > > > become ready.
> > >
> > > Something I've been wondering about is removing all the "drop the MM
> > > locks while we wait for I/O" gunk.  It's a nice amount of code remove=
d:
> >
> > I think the point is that page fault handlers should avoid holding the =
VMA
> > lock or mmap_lock for too long while waiting for I/O. Otherwise, those
> > writers and readers will be stuck for a while.
>
> There's a usecase some of us have been discussing off-list for a few
> weeks that our current strategy pessimises.  It's a process with
> thousands (maybe tens of thousands) of threads.  It has much more mapped
> files than it has memory that cgroups will allow it to use.  So on a
> page fault, we drop the vma lock, allocate a page of ram, kick off the
> read, sleep waiting for the folio to come uptodate, once it is return,
> expecting the page to still be there when we reenter filemap_fault.
> But it's under so much memory pressure that it's already been reclaimed
> by the time we get back to it.  So all the threads just batter the
> storage re-reading data.

Is this entirely the fault of re-entering the page fault? Under extreme
memory pressure, even if we map the pages, they can still be reclaimed
quickly?

>
> If we don't drop the vma lock, we can insert the pages in the page table
> and return, maybe getting some work done before this thread is
> descheduled.

If we need to protect the page from being reclaimed too early, the fix
should reside within LRU management, not in page fault handling.

Also, I gave an example where we may not drop the VMA lock if the folio is
already up to date. That likely corresponds to waiting for the PTE mapping =
to
complete.

>
> This use case also manages to get utterly hung-up trying to do reclaim
> today with the mmap_lock held.  SO it manifests somewhat similarly to
> your problem (everybody ends up blocked on mmap_lock) but it has a
> rather different root cause.
>
> > I agree there=E2=80=99s room for improvement, but merely removing the "=
drop the MM
> > locks while waiting for I/O" code is unlikely to improve performance.
>
> I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" code
> was written before the VMA locking code was written.  I don't know that
> it's actually helping these days.

I am concerned that other write paths may still need to modify the VMA, for
example during splitting. Tail latency has long been a significant issue fo=
r
Android users, and we have observed it even with folio_lock, which has much
finer granularity than the VMA lock.

>
> > The change would be much more complex, so I=E2=80=99d prefer to land th=
e current
> > patchset first. At least this way, we avoid falling back to mmap_lock a=
nd
> > causing contention or priority inversion, with minimal changes.
>
> Uh, this is an RFC patchset.  I'm giving you my comment, which is that I
> don't think this is the right direction to go in.  Any talk of "landing"
> these patches is extremely premature.

While I agree that there are other approaches worth exploring, I
remain entirely unconvinced that this patchset is the wrong
direction. With the current retry logic, it substantially reduces
mmap_lock acquisitions and represents a clear low-hanging fruit.

Also, I am not referring to landing the RFC itself, but to a subsequent for=
mal
patchset that retries using the per-VMA lock.

Thanks
Barry

