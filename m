Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 524226A7882
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 01:54:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRt1F12Whz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 11:54:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dIuwnaIQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dIuwnaIQ;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRt0H4dd6z3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 11:54:06 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id h17-20020a17090aea9100b0023739b10792so1099139pjz.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 16:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1p7gLBnjTY2NzqqDfZ3+sK3ELM0whxNqoGWgGrbWZok=;
        b=dIuwnaIQ2bBUUz2optFpHImdgLTXLjc71Pyskqyty88uSV5WuiXl4EF6AzbQz/NvDA
         bnewBQ8MDcrZ3ZNu5L92lqAmIdJYxFkE39GdDnGIB1WAuljQTRNHcNkW6Ug1O76YUDIq
         ii9cc5JIQNsExXmUEy6NT3bGWAn0vrvp6IUyDQHQGe9STLpLDGrPNztuq+gJuPBVf1sW
         knhPQtyF1OhCU9vVlwi3oypfLyPDcxoNZW9OvJANM9vYeephCdst1w6i6OPbiK24p0Ye
         WpobOonjOm828sKMocXSeQ/i3h3VC8YHc62eF6VDSwVoPyhmf1FldFlcNVZEtveAyPgR
         b4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1p7gLBnjTY2NzqqDfZ3+sK3ELM0whxNqoGWgGrbWZok=;
        b=KYeJudL3ZYHkmhIakktJVleNZiYjRB7giEdw7+MRMckD3dNT4n6FRBfU9JQ5gu/CPe
         GjNpJHf14tI8m6Fis19heXAVdVTrK3LqXWGseWvRvCwrcyJZscU26vEjquLiVWsDxllu
         JutflwYGtBu2j2zkxOyBjtqDu83kBul7PSYgVPp9OAaG1EUuQZWh8r7W80zp7tyNZV+5
         LXeCQBnCPhaLQR7NCa2z9X7XJ+hkw6DqarPFN6hp+Yva4NWTCZZgxSHfel7E5Pv3pKNt
         biNu1jsJg5NcUjAqlsdyjyljmobMrlOlZSW2r/uORGEfSijPt4f+Qd5TX7HfxhwNxkNm
         MKLw==
X-Gm-Message-State: AO0yUKUyJVSMVzNvCsvUNJGbS5XMdOt+lfJB859h4CDFx33BZ7Wy9LjK
	hNmD2Xvdck3g0fD7fsqJdh0=
X-Google-Smtp-Source: AK7set9xYz9SPyOCt7tLgYDSF/C0yAQqSuW6dLV1Fq6uvubFXXpgs+hx2VuoCASTSYarsrrYwT4C/g==
X-Received: by 2002:a17:902:e886:b0:19a:ad2f:2df9 with SMTP id w6-20020a170902e88600b0019aad2f2df9mr10366596plg.55.1677718442825;
        Wed, 01 Mar 2023 16:54:02 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id a11-20020a170902900b00b0019a9637b2d3sm8999040plp.279.2023.03.01.16.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 16:54:01 -0800 (PST)
Date: Thu, 2 Mar 2023 00:53:45 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 18/33] mm: write-lock VMAs before removing them from
 VMA tree
Message-ID: <Y//zmYeu6uexiyOY@localhost>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230227173632.3292573-19-surenb@google.com>
 <Y/8CJQGNuMUTdLwP@localhost>
 <Y/8FNM9czzPHb5eG@localhost>
 <CAJuCfpHYT++MBC6T-p80n_m5hHWRRC4Y1bO9J-bFFZZDqNX-BQ@mail.gmail.com>
 <CAJuCfpFax8LSdcq1qiz3sp0XPLaNZnkFFky2tQekG2_Azvw9_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpFax8LSdcq1qiz3sp0XPLaNZnkFFky2tQekG2_Azvw9_g@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 01, 2023 at 10:42:48AM -0800, Suren Baghdasaryan wrote:
> On Wed, Mar 1, 2023 at 10:34 AM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Tue, Feb 28, 2023 at 11:57 PM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
> > >
> > > On Wed, Mar 01, 2023 at 07:43:33AM +0000, Hyeonggon Yoo wrote:
> > > > On Mon, Feb 27, 2023 at 09:36:17AM -0800, Suren Baghdasaryan wrote:
> > > > > Write-locking VMAs before isolating them ensures that page fault
> > > > > handlers don't operate on isolated VMAs.
> > > > >
> > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > ---
> > > > >  mm/mmap.c  | 1 +
> > > > >  mm/nommu.c | 5 +++++
> > > > >  2 files changed, 6 insertions(+)
> > > > >
> > > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > > index 1f42b9a52b9b..f7ed357056c4 100644
> > > > > --- a/mm/mmap.c
> > > > > +++ b/mm/mmap.c
> > > > > @@ -2255,6 +2255,7 @@ int split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > > > >  static inline int munmap_sidetree(struct vm_area_struct *vma,
> > > > >                                struct ma_state *mas_detach)
> > > > >  {
> > > > > +   vma_start_write(vma);
> > > > >     mas_set_range(mas_detach, vma->vm_start, vma->vm_end - 1);
> > > >
> > > > I may be missing something, but have few questions:
> > > >
> > > >       1) Why does a writer need to both write-lock a VMA and mark the VMA detached
> > > >          when unmapping it, isn't it enough to just only write-lock a VMA?
> >
> > We need to mark the VMA detached to avoid handling page fault in a
> > detached VMA. The possible scenario is:
> >
> > lock_vma_under_rcu
> >   vma = mas_walk(&mas)
> >                                                         munmap_sidetree
> >                                                           vma_start_write(vma)
> >
> > mas_store_gfp() // remove VMA from the tree
> >                                                           vma_end_write_all()
> >   vma_start_read(vma)
> >   // we locked the VMA but it is not part of the tree anymore.
> >
> > So, marking the VMA locked before vma_end_write_all() and checking
> 
> Sorry, I should have said "marking the VMA *detached* before
> vma_end_write_all() and checking vma->detached after vma_start_read()
> helps us avoid handling faults in the detached VMA."
> 
> > vma->detached after vma_start_read() helps us avoid handling faults in
> > the detached VMA.

Thank you for explanation, that makes sense!

By the way, if there are no 32bit users of Per-VMA lock (are there?),
"detached" bool could be a VMA flag (i.e. making it depend on 64BIT
and selecting ARCH_USES_HIGH_VMA_FLAGS)

Thanks,
Hyeonggon

