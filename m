Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E86C1678746
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 21:10:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P11Rm5twyz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 07:10:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RyYyVfXd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RyYyVfXd;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P11Q018Fcz3fG6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 07:08:38 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id q8so9925355wmo.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 12:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx0+AS/R5cTFxTer1KPJhFwelUzEZqlaudVJ4C5UqlM=;
        b=RyYyVfXdy0EOGXtjgeoYEX0CSfXeDuawJy3LtwRKGEXH7xPRUd7FzH5vM0ZD/5/uNP
         fWBSe/Vuek0fbxHy7ulBo2tzxgjytQXIhDoKjaRk3SO4pUlWanXPzUwdk9sCfPJMgGQV
         p18xwdky3Y0ZFWjj2oRsWB1r8iCofsyuM+DRRi3eBUWKYZ0nN2FXeurkdZEHXIwEXyHo
         0hKaiu62QCi9O+hzr1ZvTjmsOHLWnqe2N/6m1fgfhTobQv9HYlX2hUiV/odvHm54lxez
         NCc0aIPRkybQcRORZZdU5UX7FU9qwPmbIdE06KG8aUUiUZFG2ePpUffvAsR6tWHeElFT
         rYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xx0+AS/R5cTFxTer1KPJhFwelUzEZqlaudVJ4C5UqlM=;
        b=ACReuMrm/5Q1mute3UEfV6nmr8/FmyTmjgoCAlPbohM5GOpaVi+ZFS6i+evBx4K1qU
         JzNs7JTMA/POCCoSVT+fm2qzBJqowLV1nynF9sQXRNoFGVWk1p33xLIFrm4bgKC0VErZ
         i8kcS66Nr6SkP/756NLK2w+u+TBLIBdHgnxM0ZBVs/cRhAVbmxH3pWHOJ6jymXmtX0vE
         Q7nmEnewQ2vkU9iCAqne/ydwd0LbiA/Sn2ebK3a4C6tWXf1fBvqx+u0OADSUw07wzUm3
         BlAJ9aFCXOB2zB3QpmBZ63vyt1OplCDTAAkL/PKpL2InRQdV4is0D/U23D0MJVAwqLJL
         YwNw==
X-Gm-Message-State: AFqh2kpjft5weINqmu44WPgzeYlNvdj1CylP7gVjjPKYrhhMC2J0IKVT
	CQiNThBYYRca5uLsuSO8kyLHd3QtZxpTn/lMWB2lPg==
X-Google-Smtp-Source: AMrXdXsAYItHDpk4yH6h+tdfdbjpmDtWUNcVfzcOaPv8ocdm14en5egjG3x9mr/LGbfmiQJ1437Ba8Qp+R4Oyn+yujs=
X-Received: by 2002:a05:600c:3412:b0:3d0:a619:c445 with SMTP id
 y18-20020a05600c341200b003d0a619c445mr1027494wmp.17.1674504514768; Mon, 23
 Jan 2023 12:08:34 -0800 (PST)
MIME-Version: 1.0
References: <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
 <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz> <CAJuCfpG86qc4odkpUbzuROb+jThQgXGWjcFXb0e-c2i0wEGg4g@mail.gmail.com>
 <Y868Fadajv27QMXh@dhcp22.suse.cz> <CAJuCfpGSCHpnZwwVV_922fmMBpFPZL0HAHMABuDzMfuURF2sWg@mail.gmail.com>
 <Y87A2CEKAugfgfHC@dhcp22.suse.cz> <CAJuCfpGJRZATfc8eUurvV5kGkSNkG=vK=sfwJbU72PESOyATSw@mail.gmail.com>
 <Y87QjHH2aDG5XCGv@casper.infradead.org> <Y87djZwQpXazRd00@dhcp22.suse.cz>
 <Y87gY7fhi5OJ35WQ@casper.infradead.org> <Y87nVydD7oF9BGMb@dhcp22.suse.cz>
In-Reply-To: <Y87nVydD7oF9BGMb@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Jan 2023 12:08:21 -0800
Message-ID: <CAJuCfpEz_Qm3BeY5a0O+OBgZTTLSgvkqDE4XieCYyGMMv3Hykw@mail.gmail.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@g
 oogle.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 12:00 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 23-01-23 19:30:43, Matthew Wilcox wrote:
> > On Mon, Jan 23, 2023 at 08:18:37PM +0100, Michal Hocko wrote:
> > > On Mon 23-01-23 18:23:08, Matthew Wilcox wrote:
> > > > On Mon, Jan 23, 2023 at 09:46:20AM -0800, Suren Baghdasaryan wrote:
> > > [...]
> > > > > Yes, batching the vmas into a list and draining it in remove_mt() and
> > > > > exit_mmap() as you suggested makes sense to me and is quite simple.
> > > > > Let's do that if nobody has objections.
> > > >
> > > > I object.  We *know* nobody has a reference to any of the VMAs because
> > > > you have to have a refcount on the mm before you can get a reference
> > > > to a VMA.  If Michal is saying that somebody could do:
> > > >
> > > >   mmget(mm);
> > > >   vma = find_vma(mm);
> > > >   lock_vma(vma);
> > > >   mmput(mm);
> > > >   vma->a = b;
> > > >   unlock_vma(mm, vma);
> > > >
> > > > then that's something we'd catch in review -- you obviously can't use
> > > > the mm after you've dropped your reference to it.
> > >
> > > I am not claiming this is possible now. I do not think we want to have
> > > something like that in the future either but that is really hard to
> > > envision. I am claiming that it is subtle and potentially error prone to
> > > have two different ways of mass vma freeing wrt. locking. Also, don't we
> > > have a very similar situation during last munmaps?
> >
> > We shouldn't have two ways of mass VMA freeing.  Nobody's suggesting that.
> > There are two cases; there's munmap(), which typically frees a single
> > VMA (yes, theoretically, you can free hundreds of VMAs with a single
> > call which spans multiple VMAs, but in practice that doesn't happen),
> > and there's exit_mmap() which happens on exec() and exit().
>
> This requires special casing remove_vma for those two different paths
> (exit_mmap and remove_mt).  If you ask me that sounds like a suboptimal
> code to even not handle potential large munmap which might very well be
> a rare thing as you say. But haven't we learned that sooner or later we
> will find out there is somebody that cares afterall? Anyway, this is not
> something I care about all that much. It is just weird to special case
> exit_mmap, if you ask me. Up to Suren to decide which way he wants to
> go. I just really didn't like the initial implementation of batching
> based on a completely arbitrary batch limit and lazy freeing.

I would prefer to go with the simplest sufficient solution. A
potential issue with a large munmap might prove to be real but I think
we know how to easily fix that with batching if the issue ever
materializes (I'll have a fix ready implementing Michal's suggestion).
So, I suggest going with Liam's/Matthew's solution and converting to
Michal's solution if regression shows up anywhere else. Would that be
acceptable?

> --
> Michal Hocko
> SUSE Labs
