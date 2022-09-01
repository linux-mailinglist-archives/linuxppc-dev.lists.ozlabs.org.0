Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C965AA3B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 01:27:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJcdT0RkSz3bbQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=R2o6wZ8r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=R2o6wZ8r;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJccq2nLcz2xJB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 09:26:34 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3321c2a8d4cso2136357b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 16:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=MTexhQmqymGfgaxSOwwhDwyp4l4FCh8W15KC6mgK2Nc=;
        b=R2o6wZ8rHFTrHg65HWm+sx7byON9XQMo2S9w2qAr7v877njUCnx965lCh5TDybN3fG
         szmKzMNl71kGYs2aeFk6xjyeuwbcVXFkgv5zAw3bvGqos+UnSn816jqobAwL2+pCKfzT
         W/26u7xLOQdtA3Iw5anxeOSG5ErmbCcWCr5YsjjqabfauOlrQtzEGoFnvplqQCIdYxIL
         JHJRAAIhmj8btwRvGxQl9ZtbveVvnZGjC/uV9Rjf9ChCAajmCvS7vnrSasRk1z2iew0z
         pngvq428HmyvaCXLmHtMjuform5IaN6EQQhsiphDW/8GvGNJPFbKid2FCogV2++SPCK8
         Dr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MTexhQmqymGfgaxSOwwhDwyp4l4FCh8W15KC6mgK2Nc=;
        b=iJ9GphRrQfUEsjjbNxqLkvwD1Nsy+AXoycJgqwqDiFrFKmaLVr1buEcosLVIWqb/HO
         CvOqZbP2kj9odFnbGze7DwyaJd2Zo6RPB05Qso1vUI2/C1Eohf9CI8s+BBc/ZFq0dXj1
         x0HTHSeOXFBFdCoOd4DUJIsu3xQJAI6E4jqDrORO16l9yN0pluTov7JSPjmImY0m9FEO
         Dg3G9ibtqPGuFuqeUOldGgyRMLumgOFtrsBgHq/KIhAPsEruyiDPliKQSqiU5kTYCBDJ
         CEiPLd/71LpI3v2ZpiSUk3QEJ08Y2ZdXG8Wi6e2YHLKE8M/J69zWgfXttWNV9VZGP6tB
         Niow==
X-Gm-Message-State: ACgBeo3S5qnBYQ1n4tpjj4hy0Q4n6hK2+FWr5kcD8HxJoLpaadGBqqvZ
	OI9GTtoJDl3/ycb/Kal1SMHLSW4SEH5yG4zed8uyzw==
X-Google-Smtp-Source: AA6agR7ryflRVLt0ycp3Tc1PbYwVBnDj1avkVAWAyik3VlypjQVDlR3+/VVpBD5mYLXhgprc+mz5ihSb0hJesE8YyOE=
X-Received: by 2002:a0d:e7c3:0:b0:344:8cee:c384 with SMTP id
 q186-20020a0de7c3000000b003448ceec384mr4260095ywe.514.1662074790746; Thu, 01
 Sep 2022 16:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901205819.emxnnschszqv4ahy@moria.home.lan>
In-Reply-To: <20220901205819.emxnnschszqv4ahy@moria.home.lan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Sep 2022 16:26:19 -0700
Message-ID: <CAJuCfpGNcZovncozo+Uxfhjwqh3BtGXsws+4QeT6Zy1mcQRJbQ@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, bigeasy@linutronix.de, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, Johannes
  Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 1, 2022 at 1:58 PM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Thu, Sep 01, 2022 at 10:34:48AM -0700, Suren Baghdasaryan wrote:
> > Resending to fix the issue with the In-Reply-To tag in the original
> > submission at [4].
> >
> > This is a proof of concept for per-vma locks idea that was discussed
> > during SPF [1] discussion at LSF/MM this year [2], which concluded with
> > suggestion that =E2=80=9Ca reader/writer semaphore could be put into th=
e VMA
> > itself; that would have the effect of using the VMA as a sort of range
> > lock. There would still be contention at the VMA level, but it would be=
 an
> > improvement.=E2=80=9D This patchset implements this suggested approach.
> >
> > When handling page faults we lookup the VMA that contains the faulting
> > page under RCU protection and try to acquire its lock. If that fails we
> > fall back to using mmap_lock, similar to how SPF handled this situation=
.
> >
> > One notable way the implementation deviates from the proposal is the wa=
y
> > VMAs are marked as locked. Because during some of mm updates multiple
> > VMAs need to be locked until the end of the update (e.g. vma_merge,
> > split_vma, etc). Tracking all the locked VMAs, avoiding recursive locks
> > and other complications would make the code more complex. Therefore we
> > provide a way to "mark" VMAs as locked and then unmark all locked VMAs
> > all at once. This is done using two sequence numbers - one in the
> > vm_area_struct and one in the mm_struct. VMA is considered locked when
> > these sequence numbers are equal. To mark a VMA as locked we set the
> > sequence number in vm_area_struct to be equal to the sequence number
> > in mm_struct. To unlock all VMAs we increment mm_struct's seq number.
> > This allows for an efficient way to track locked VMAs and to drop the
> > locks on all VMAs at the end of the update.
>
> I like it - the sequence numbers are a stroke of genuius. For what it's d=
oing
> the patchset seems almost small.

Thanks for reviewing it!

>
> Two complaints so far:
>  - I don't like the vma_mark_locked() name. To me it says that the caller
>    already took or is taking the lock and this function is just marking t=
hat
>    we're holding the lock, but it's really taking a different type of loc=
k. But
>    this function can block, it really is taking a lock, so it should say =
that.
>
>    This is AFAIK a new concept, not sure I'm going to have anything good =
either,
>    but perhaps vma_lock_multiple()?

I'm open to name suggestions but vma_lock_multiple() is a bit
confusing to me. Will wait for more suggestions.

>
>  - I don't like the #ifdef and the separate fallback path in the fault ha=
ndlers.
>
>    Can we make find_and_lock_anon_vma() do the right thing, and not fail =
unless
>    e.g. there isn't a vma at that address? Just have it wait for vm_lock_=
seq to
>    change and then retry if needed.

I think it can be done but would come with additional complexity. I
was really trying to keep things as simple as possible after SPF got
shot down on the grounds of complexity. I hope to start simple and
improve only when necessary.
