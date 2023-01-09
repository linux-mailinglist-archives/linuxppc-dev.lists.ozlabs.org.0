Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F386632FD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:34:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRzR6rS0z3g28
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:34:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iCotF84f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iCotF84f;
	dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrRsN27BHz3g8y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 08:29:12 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id k6so1316842vsk.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 13:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=unEz8Po80qyvgT7TDUJc75ZwwHShIf6/y2xqGnG0MLw=;
        b=iCotF84fyU6WecJRaYkXs3vK3d7x9b8Nj+HbTmHBstmHAOMZ6wu+fHC/f2BCes33RA
         5Fex5jkaX4wZyn1EVHLh4oXxBe3d0BIv3ScUHRW8XjHZwT6wW1BIxT9WOy2NCE0uv+xi
         PLlTpj1j71eEzTVt4GNqWdM4k/zlutRaSDhJ+huyga2k/sVU947d+CQcmJ0o2Kn/wWrh
         N3ZH599DUjSeyBwoo+dD7R3dzvW99iMSiiHe5FTO+O6oNTGlVY2PLme/QJwE/M+iFpJZ
         ou86QYiECR/qaRGKBBSprOValMlbWr0mGDwDFYrVmap0Q30KY9DkgX3d+50qdeKqpyZB
         YkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unEz8Po80qyvgT7TDUJc75ZwwHShIf6/y2xqGnG0MLw=;
        b=t/twTQRtwuRWD6IH499delqV1FQKMpU2SLcBVXl/+AHy1+QXZyw9uthH/gReRJ1zeF
         tPejQs8ZmvfmgnRuNqxkhmtxfMOlKe1xlVxot9sh8MXcHj3PtsJzpMsmmspqzPaStL2S
         81pBrglBoGyp422evHVTTGIdLftPtbtgqDbFnEyPl5u6kBoWn1FxMnnwWaVyh0Mta2jS
         PTNW5sBRUMN+NzjBrWrTAQUglQb8BIbC/HXQWcvvi3fqpZKt9Tfls8q0BheLvk/tJI4C
         AtzreP5MWGM9xQovSHt5BwZQQDBh5zwZ5zvhGbRkRufiiLe6+LsibuL1app8QtxE4kTE
         rwWA==
X-Gm-Message-State: AFqh2kohnzPFu+yvKa3sU2LGU105DMFGl3I3tlh3/SH9eOBxtaKmQHX/
	Vyz4wKJAsMgEZ/RAURVCQ8H5Lp52mcbd335mCRw=
X-Google-Smtp-Source: AMrXdXsg6Ko/alWOI1aCE8iGkx65RtschN8kfdrjibAvlZRKWqyjgef2aFot9xS0Y4dCZHNtV0kQ5ZBQglrZ6/auzas=
X-Received: by 2002:a67:5e01:0:b0:3ce:d776:30b6 with SMTP id
 s1-20020a675e01000000b003ced77630b6mr3170503vsb.33.1673299747173; Mon, 09 Jan
 2023 13:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20221117082648.47526-1-yangyicong@huawei.com> <20221117082648.47526-3-yangyicong@huawei.com>
 <Y7cToj5mWd1ZbMyQ@arm.com> <CAGsJ_4yC0i6MYwvosRSrdQ1iT7n88ypmK3aOQJkuusqNKtddtg@mail.gmail.com>
 <Y7xMhPTAwcUT4O6b@arm.com>
In-Reply-To: <Y7xMhPTAwcUT4O6b@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 10 Jan 2023 05:28:55 +0800
Message-ID: <CAGsJ_4zrff5vtS0WP4Q8VH8vhBma8bzMqyY5c0mxjQ_qjFbO-Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Catalin Marinas <catalin.marinas@arm.com>, Nadav Amit <namit@vmware.com>, 
	Mel Gorman <mgorman@suse.de>
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, realmz6@gmail.com, linux-doc@vger.kernel.org, peterz@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, punit.agrawal@bytedance.com, linux-riscv@lists.infradead.org, will@kernel.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, arnd@arndb.de, anshuman.khandual@arm.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, darren@os.amperecomputing.com, yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org, guojian@oppo.com, xhao@linux.alibaba.com, linux-mips@vger.kernel.org, huzhanyuan@oppo.com, Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 10, 2023 at 1:19 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Sun, Jan 08, 2023 at 06:48:41PM +0800, Barry Song wrote:
> > On Fri, Jan 6, 2023 at 2:15 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> > > On Thu, Nov 17, 2022 at 04:26:48PM +0800, Yicong Yang wrote:
> > > > It is tested on 4,8,128 CPU platforms and shows to be beneficial on
> > > > large systems but may not have improvement on small systems like on
> > > > a 4 CPU platform. So make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends
> > > > on CONFIG_EXPERT for this stage and make this disabled on systems
> > > > with less than 8 CPUs. User can modify this threshold according to
> > > > their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.
> > >
> > > What's the overhead of such batching on systems with 4 or fewer CPUs? If
> > > it isn't noticeable, I'd rather have it always on than some number
> > > chosen on whichever SoC you tested.
> >
> > On the one hand, tlb flush is cheap on a small system. so batching tlb flush
> > helps very minorly.
>
> Yes, it probably won't help on small systems but I don't like config
> options choosing the threshold, which may be different from system to
> system even if they have the same number of CPUs. A run-time tunable
> would be a better option.
>
> > On the other hand, since we have batched the tlb flush, new PTEs might be
> > invisible to others before the final broadcast is done and Ack-ed.
>
> The new PTEs could indeed be invisible at the TLB level but not at the
> memory (page table) level since this is done under the PTL IIUC.
>
> > thus, there
> > is a risk someone else might do mprotect or similar things  on those deferred
> > pages which will ask for read-modify-write on those deferred PTEs.
>
> And this should be fine, we have things like the PTL in place for the
> actual memory access to the page table.
>
> > in this
> > case, mm will do an explicit flush by flush_tlb_batched_pending which is
> > not required if tlb flush is not deferred.
>
> I don't fully understand why it's needed, or at least why it would be
> needed on arm64. At the end of an mprotect(), we have the final PTEs in
> place and we just need to issue a TLBI for that range.
> change_pte_range() for example has a tlb_flush_pte_range() if the PTE
> was present and that won't be done lazily. If there are other TLBIs
> pending for the same range, they'll be done later though likely
> unnecessarily but still cheaper than issuing a flush_tlb_mm().

Thanks! I'd like to ask for some comments from Nadav and Mel from the x86 side.
Revisiting the code of flush_tlb_batched_pending shows we still have races even
under PTL.

/*
 * Reclaim unmaps pages under the PTL but do not flush the TLB prior to
 * releasing the PTL if TLB flushes are batched. It's possible for a parallel
 * operation such as mprotect or munmap to race between reclaim unmapping
 * the page and flushing the page. If this race occurs, it potentially allows
 * access to data via a stale TLB entry. Tracking all mm's that have TLB
 * batching in flight would be expensive during reclaim so instead track
 * whether TLB batching occurred in the past and if so then do a flush here
 * if required. This will cost one additional flush per reclaim cycle paid
 * by the first operation at risk such as mprotect and mumap.
 *
 * This must be called under the PTL so that an access to tlb_flush_batched
 * that is potentially a "reclaim vs mprotect/munmap/etc" race will synchronise
 * via the PTL.
 */
void flush_tlb_batched_pending(struct mm_struct *mm)
{
}

According to Catalin's comment, it seems over-cautious since we can make sure
people see updated TLB after mprotect and munmap are done as they have tlb
flush.  We can also make sure mprotect see updated "memory" of PTEs from
reclamation though pte is not visible in TLB level.

Hi Mel, Nadav, would you please help clarify the exact sequence of how this race
is going to happen?

>
> > void flush_tlb_batched_pending(struct mm_struct *mm)
> > {
> >        int batch = atomic_read(&mm->tlb_flush_batched);
> >        int pending = batch & TLB_FLUSH_BATCH_PENDING_MASK;
> >        int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
> >
> >        if (pending != flushed) {
> >                flush_tlb_mm(mm);
> >         /*
> >          * If the new TLB flushing is pending during flushing, leave
> >          * mm->tlb_flush_batched as is, to avoid losing flushing.
> >         */
> >       atomic_cmpxchg(&mm->tlb_flush_batched, batch,
> >            pending | (pending << TLB_FLUSH_BATCH_FLUSHED_SHIFT));
> >      }
> > }
>
> I guess this works on x86 better as it avoids the IPIs if this flush
> already happened. But on arm64 we already issued the TLBI, we just
> didn't wait for it to complete via a DSB.
>
> > I believe Anshuman has contributed many points on this in those previous
> > discussions.
>
> Yeah, I should re-read the old threads.
>
> --
> Catalin

Thanks
Barry
