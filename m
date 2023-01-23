Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6711E6786F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 20:58:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P11BV29lDz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 06:58:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Bv35EwZq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Bv35EwZq;
	dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P119W4VxFz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 06:57:50 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so11432829wmb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 11:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N9qQteWUwJAybu5GRF/Inp+dulaE16FE+nFFa5cXdiw=;
        b=Bv35EwZqB5nxyfqZxvO4lwvh8MLjmXwaCbA2/qy9aRspOZWssKSLZNy1CJi6P2Rn5q
         VaGw+yN1V50UWyKMeGwynQOb7hF/ZfbIbdFR/lGzcA4C0YsDCysKaI2Ew5+2SN28SRpS
         PQuQZzuOA3GgIkkhuZcapOi/l72TfgcIr0qYhGtVxiq+Kj/ID+igXXq3jaRMNCPG8Cxo
         yACXNWWYQMHT0KGLp70yDEhiaTqlaLgAavvJ/N1MumrXfgP3vD+NpWfzIjr5Wv/tMw4k
         Sr1NzETlMhnsm/5FEcYy2eMKInOQVf1b21OlIhiA0e+wg58EJ5dEOix4XJTLI1MLHahp
         s1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9qQteWUwJAybu5GRF/Inp+dulaE16FE+nFFa5cXdiw=;
        b=7bYx4YPiQjJSWABJvxDtbSgv0Q/MsjiE1jvweLJdhASIbJft4bcDXWwms767ZRjaoL
         jRoSnn4Rjc4prqy1Dgoj2/9lmiDM7i9ufgKT8+R16sHZhQxGzshR6BxbUs396OIRZNQQ
         A93q+jFiWFOb7slsB4p2M0FGRpG2/TMwy4o8zfOJQEKWfBDYp4+4bTEbPFgRbYgDKEoL
         jNHXn4KJAz4Wl5GtsWLjrhBx32ZUdsMC/+xHjuR9HkPX1cxQzDbeg9AIK/d2LK6vYHp2
         JjXGRF2BJOdKSbG1s1g0c/pymeNmqDd6f4Cmun3QfxlqTE/mEjVnLqVTgBCSQEaBIvI9
         trqw==
X-Gm-Message-State: AFqh2koCt4evFtzxbMwuLqgLn9nO6diP/fudH9O7Jp3ArgVfH6bQ8fjk
	zGLkIbj9ky8XiDh/PknzBs+dLkqWzuWqAipsdBoVIQ==
X-Google-Smtp-Source: AMrXdXtrPcaRXutaoPRaMiUkuyZPEFxjJaJdQAYs4KPWXWBZrMYZ3+R/eUUgMejXYArVmp3bLK0Z+Cqc/V9/bckA/ko=
X-Received: by 2002:a05:600c:d1:b0:3d9:f629:9043 with SMTP id
 u17-20020a05600c00d100b003d9f6299043mr1458123wmm.122.1674503862640; Mon, 23
 Jan 2023 11:57:42 -0800 (PST)
MIME-Version: 1.0
References: <Y8rQNj5dVyuxRBOf@casper.infradead.org> <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
 <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz> <CAJuCfpG86qc4odkpUbzuROb+jThQgXGWjcFXb0e-c2i0wEGg4g@mail.gmail.com>
 <Y868Fadajv27QMXh@dhcp22.suse.cz> <CAJuCfpGSCHpnZwwVV_922fmMBpFPZL0HAHMABuDzMfuURF2sWg@mail.gmail.com>
 <Y87A2CEKAugfgfHC@dhcp22.suse.cz> <CAJuCfpGJRZATfc8eUurvV5kGkSNkG=vK=sfwJbU72PESOyATSw@mail.gmail.com>
 <Y87QjHH2aDG5XCGv@casper.infradead.org> <Y87djZwQpXazRd00@dhcp22.suse.cz> <Y87gY7fhi5OJ35WQ@casper.infradead.org>
In-Reply-To: <Y87gY7fhi5OJ35WQ@casper.infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Jan 2023 11:57:30 -0800
Message-ID: <CAJuCfpFmQb=adyRWJJkSZ8h6qk1G7HiUm2U8VPLdCXatCLVJXA@mail.gmail.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
To: Matthew Wilcox <willy@infradead.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.
 com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 11:31 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Jan 23, 2023 at 08:18:37PM +0100, Michal Hocko wrote:
> > On Mon 23-01-23 18:23:08, Matthew Wilcox wrote:
> > > On Mon, Jan 23, 2023 at 09:46:20AM -0800, Suren Baghdasaryan wrote:
> > [...]
> > > > Yes, batching the vmas into a list and draining it in remove_mt() and
> > > > exit_mmap() as you suggested makes sense to me and is quite simple.
> > > > Let's do that if nobody has objections.
> > >
> > > I object.  We *know* nobody has a reference to any of the VMAs because
> > > you have to have a refcount on the mm before you can get a reference
> > > to a VMA.  If Michal is saying that somebody could do:
> > >
> > >     mmget(mm);
> > >     vma = find_vma(mm);
> > >     lock_vma(vma);
> > >     mmput(mm);
> > >     vma->a = b;
> > >     unlock_vma(mm, vma);
> > >
> > > then that's something we'd catch in review -- you obviously can't use
> > > the mm after you've dropped your reference to it.
> >
> > I am not claiming this is possible now. I do not think we want to have
> > something like that in the future either but that is really hard to
> > envision. I am claiming that it is subtle and potentially error prone to
> > have two different ways of mass vma freeing wrt. locking. Also, don't we
> > have a very similar situation during last munmaps?
>
> We shouldn't have two ways of mass VMA freeing.  Nobody's suggesting that.
> There are two cases; there's munmap(), which typically frees a single
> VMA (yes, theoretically, you can free hundreds of VMAs with a single
> call which spans multiple VMAs, but in practice that doesn't happen),
> and there's exit_mmap() which happens on exec() and exit().
>
> For the munmap() case, just RCU-free each one individually.  For the
> exit_mmap() case, there's no need to use RCU because nobody should still
> have a VMA pointer after calling mmdrop() [1]
>
> [1] Sorry, the above example should have been mmgrab()/mmdrop(), not
> mmget()/mmput(); you're not allowed to look at the VMA list with an
> mmget(), you need to have grabbed.

I think it's clear that this would work with the current code and that
the concern is about any future possible misuse. So, it would be
preferable to proactively prevent such misuse.

vma_write_lock() and vma_write_unlock_mm() both have
mmap_assert_write_locked(), so they always happen under mmap_lock
protection and therefore do not pose any danger. The only issue we
need to be careful with is calling
vma_read_trylock()/vma_read_unlock() outside of mmap_lock protection
while mm is unstable. I don't think doing mmget/mmput inside these
functions is called for but maybe some assertions would prevent future
misuse?
