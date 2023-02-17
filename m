Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94F69B04E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 17:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJH1k2M6Rz3fRp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 03:14:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ps/3Ura3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ps/3Ura3;
	dkim-atps=neutral
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJH0r2kj3z3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 03:13:16 +1100 (AEDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-536566e8dfdso20054657b3.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 08:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J4EHWLfMVpn05LE1kL8V3EaRVJa2Vq/hdu+Zr2nir+A=;
        b=Ps/3Ura3iI/sgUgvz42dqxzsriO4I9cszr72+ddh2HMcmKhNMfYrqt5HL1Y86sjtN6
         yu2myzRPHLctGeK0vbEnLBiPb+LDtXDpu1H/ngw8hd42q77djSNfEDuq2smOvHfVmvG5
         jndrjIPwxv0mEFmpwF7d6AzaGw0QKW07BGmDwE/OV8XDtfAqz9YPEGlGej0Z1YGRB8M7
         vS9f4qzXP+t1M77sBl6rLadj8ku4sO6zQg0RbTtATOc0mlsP4oO2LhtJiLBVsIdKQ9or
         eJRYL0nXT4a4l6+W9WgYSxzVHw1LfCBVuoX5M/HBbFMa1KMU+rAuVYnT32UPuo2CitFI
         Bknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4EHWLfMVpn05LE1kL8V3EaRVJa2Vq/hdu+Zr2nir+A=;
        b=UBaMGgxlp85bKu3jDjdU6+YSBpBZQIW1KNPHRAsS/heZBGiOQncadvc8DnfjPChZed
         zRu2vO2SGfxEc129AF59/DBXwgsV+XE95qp5ZtO8MxnyXPOVnkkMWpX+Hka/py1Lui7i
         1LqqoG+cEIw2quiF3fNrrtfgyT/Emzq6DsjXXauGTtRWfIzQ0Gs5mkzGhWVyYKijv00L
         gDDJ+32nMF6/tAbIRSjuHcw/GlGlbk0O2ICvYtf1y/ZmsY5DsGaOaL2HKZdh5h7D9tEH
         OwYVFP/V8Vln0sKYO5C0KkLGRuz9KCzYNUIvmzZAUnSNUfWvxHTBVv5jrCzAoJ7vebRh
         Tl9w==
X-Gm-Message-State: AO0yUKUPet89AEdPESURiVQiYjCBesY2Jl449kLCNF/M1+I7R/b+KdEV
	ynkwvpvcAa7sZa5tfrl/4hJmdK6VXGmuhIKd0j4JZw==
X-Google-Smtp-Source: AK7set8CiXM0E8YPU1/djoX0qPy+RyHJBDO7kI4idZxu74F7kxn5or+wulxu9xRZnwkebwpvo4C/y03As5+77Z+srdY=
X-Received: by 2002:a0d:d54b:0:b0:534:c230:ff14 with SMTP id
 x72-20020a0dd54b000000b00534c230ff14mr317502ywd.7.1676650392893; Fri, 17 Feb
 2023 08:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-27-surenb@google.com>
 <Y+5Pb4hGmV1YtNQp@casper.infradead.org> <CAJuCfpHR8k0GsrYPMjSBVLAbu3EZgDU081+5CnR1td0cLEyDFw@mail.gmail.com>
 <CAJuCfpHODBAV=riSPyvcmLbZVtXSdxrw2GMy8VOjvDV9yCyX8A@mail.gmail.com> <CAB=+i9ToNQ-se1XWGOGbiM_0QRBYjuhCF5A8Cdvius89t8r7Ag@mail.gmail.com>
In-Reply-To: <CAB=+i9ToNQ-se1XWGOGbiM_0QRBYjuhCF5A8Cdvius89t8r7Ag@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 17 Feb 2023 08:13:01 -0800
Message-ID: <CAJuCfpHeeRymNmAZ+FAFgdVMDFOHNeZB+7d6PHHL8uFVbshu8g@mail.gmail.com>
Subject: Re: [PATCH v3 26/35] mm: fall back to mmap_lock if vma->anon_vma is
 not yet set
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, ak
 pm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 2:21 AM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
>
> On Fri, Feb 17, 2023 at 11:15 AM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Thu, Feb 16, 2023 at 11:43 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > On Thu, Feb 16, 2023 at 7:44 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > >
> > > > On Wed, Feb 15, 2023 at 09:17:41PM -0800, Suren Baghdasaryan wrote:
> > > > > When vma->anon_vma is not set, page fault handler will set it by either
> > > > > reusing anon_vma of an adjacent VMA if VMAs are compatible or by
> > > > > allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
> > > > > a compatible adjacent VMA and that requires not only the faulting VMA
> > > > > to be stable but also the tree structure and other VMAs inside that tree.
> > > > > Therefore locking just the faulting VMA is not enough for this search.
> > > > > Fall back to taking mmap_lock when vma->anon_vma is not set. This
> > > > > situation happens only on the first page fault and should not affect
> > > > > overall performance.
> > > >
> > > > I think I asked this before, but don't remember getting an aswer.
> > > > Why do we defer setting anon_vma to the first fault?  Why don't we
> > > > set it up at mmap time?
> > >
> > > Yeah, I remember that conversation Matthew and I could not find the
> > > definitive answer at the time. I'll look into that again or maybe
> > > someone can answer it here.
> >
> > After looking into it again I'm still under the impression that
> > vma->anon_vma is populated lazily (during the first page fault rather
> > than at mmap time) to avoid doing extra work for areas which are never
> > faulted. Though I might be missing some important detail here.
>
> I think this is because the kernel cannot merge VMAs that have
> different anon_vmas?
>
> Enabling lazy population of anon_vma could potentially increase the
> chances of merging VMAs.

Hmm. Do you have a clear explanation why merging chances increase this
way? A couple of possibilities I can think of would be:
1. If after mmap'ing a VMA and before faulting the first page into it
we often change something that affects anon_vma_compatible() decision,
like vm_policy;
2. When mmap'ing VMAs we do not map them consecutively but the final
arrangement is actually contiguous.

Don't think either of those cases would be very representative of a
usual case but maybe I'm wrong or there is another reason?

>
> > > In the end rather than changing that logic I decided to skip
> > > vma->anon_vma==NULL cases because I measured them being less than
> > > 0.01% of all page faults, so ROI from changing that would be quite
> > > low. But I agree that the logic is weird and maybe we can improve
> > > that. I will have to review that again when I'm working on eliminating
> > > all these special cases we skip, like swap/userfaults/etc.
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
