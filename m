Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B4869B295
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 19:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJLVy5ZzYz3f8R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 05:51:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DoyZ0Iuv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DoyZ0Iuv;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJLTz1bTyz3cdg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 05:50:13 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id x8so1205636pfh.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 10:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=txCbIcxMcKNWF/8/Xv4WaLkszxM0EFbIb80kOwi9Rfc=;
        b=DoyZ0IuvT9n0MkYehst+WgppOwJf4TBkUptMWVrr+72g5BBNmp9R+Jd5HsD22vWeow
         +ry/TEXLMU/Ft/r1cC7WjqyybGO9b9I9SRDu2Eq7ratNg6JQgVlYkMw6wJWEO9M4yxGC
         FlzWFl6/rPQGxhqhVz0td9KNMibW9jb1iUL1loJleWrTIIi+sLaondd3j77EpBuY3HTt
         rNPjllusoF93h15OUC9ZM9HYWozAcsDcVY1LFhQMJYIlN+FIB9F6p+fT47ZdADXSKrAM
         AljoCIDQwQSc2Kh+R9yG0ImV7hvIvtbUWa8dB7ey2t4jTnSqPy6BE+l4VD980Ae/4VO1
         /hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txCbIcxMcKNWF/8/Xv4WaLkszxM0EFbIb80kOwi9Rfc=;
        b=xF1u+74OnPCHMn9L7Zbn3nQ1stf/J3/GCQFzTEoHcsGXx0+mVy0qR9MtS5xyowEXUk
         g1yWZTvX2Z2yAT3bnx0Vw7E2Jbi8u2ZLBWW9kGaDmWXvf53qnAYOSUYCIot0Gkr8u3Pg
         zhcIx3my+P1YwikrWuhy6XybuKbizl54DMMs1JMUx0j1u8rAoqcspQBemDs2FkVuMvPM
         cs5jTps+JzpW2L84dnfzsb0q73U+Cs2ZQ7iqMbH8jr9jartJWM+iZMv1EUY5zpAXXkRF
         NH0aMQUPaomzcUBdBE+cuvLyy0BHUF25wLh6oNijouQX2UAzRr+FEuVJm71NfT/bEYCe
         3S8w==
X-Gm-Message-State: AO0yUKWDIWFXr5xjRbP+QSV6F75Zei1mAT+GwLay49A1SwLanp8Mao3Q
	wnyWBK5hgAMwV/h6Pf9Sa4U=
X-Google-Smtp-Source: AK7set9KYoFRQrG2DJscVGs0pH8tAGSBxCGsCiCA+9GB+lMylmI+TFq2V2i+aqg9/Vw1XgM3dp91jQ==
X-Received: by 2002:aa7:9608:0:b0:5a8:cbcc:4b58 with SMTP id q8-20020aa79608000000b005a8cbcc4b58mr1454308pfg.12.1676659810012;
        Fri, 17 Feb 2023 10:50:10 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id u21-20020a62ed15000000b00581ad007a9fsm3385410pfh.153.2023.02.17.10.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:50:08 -0800 (PST)
Date: Fri, 17 Feb 2023 18:49:53 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 26/35] mm: fall back to mmap_lock if vma->anon_vma is
 not yet set
Message-ID: <Y+/MUXZ8Mm0DKWSV@localhost>
References: <20230216051750.3125598-1-surenb@google.com>
 <20230216051750.3125598-27-surenb@google.com>
 <Y+5Pb4hGmV1YtNQp@casper.infradead.org>
 <CAJuCfpHR8k0GsrYPMjSBVLAbu3EZgDU081+5CnR1td0cLEyDFw@mail.gmail.com>
 <CAJuCfpHODBAV=riSPyvcmLbZVtXSdxrw2GMy8VOjvDV9yCyX8A@mail.gmail.com>
 <CAB=+i9ToNQ-se1XWGOGbiM_0QRBYjuhCF5A8Cdvius89t8r7Ag@mail.gmail.com>
 <CAJuCfpHeeRymNmAZ+FAFgdVMDFOHNeZB+7d6PHHL8uFVbshu8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHeeRymNmAZ+FAFgdVMDFOHNeZB+7d6PHHL8uFVbshu8g@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, aarcange@redhat.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, h
 annes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 08:13:01AM -0800, Suren Baghdasaryan wrote:
> On Fri, Feb 17, 2023 at 2:21 AM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
> >
> > On Fri, Feb 17, 2023 at 11:15 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > On Thu, Feb 16, 2023 at 11:43 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > > >
> > > > On Thu, Feb 16, 2023 at 7:44 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > > >
> > > > > On Wed, Feb 15, 2023 at 09:17:41PM -0800, Suren Baghdasaryan wrote:
> > > > > > When vma->anon_vma is not set, page fault handler will set it by either
> > > > > > reusing anon_vma of an adjacent VMA if VMAs are compatible or by
> > > > > > allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
> > > > > > a compatible adjacent VMA and that requires not only the faulting VMA
> > > > > > to be stable but also the tree structure and other VMAs inside that tree.
> > > > > > Therefore locking just the faulting VMA is not enough for this search.
> > > > > > Fall back to taking mmap_lock when vma->anon_vma is not set. This
> > > > > > situation happens only on the first page fault and should not affect
> > > > > > overall performance.
> > > > >
> > > > > I think I asked this before, but don't remember getting an aswer.
> > > > > Why do we defer setting anon_vma to the first fault?  Why don't we
> > > > > set it up at mmap time?
> > > >
> > > > Yeah, I remember that conversation Matthew and I could not find the
> > > > definitive answer at the time. I'll look into that again or maybe
> > > > someone can answer it here.
> > >
> > > After looking into it again I'm still under the impression that
> > > vma->anon_vma is populated lazily (during the first page fault rather
> > > than at mmap time) to avoid doing extra work for areas which are never
> > > faulted. Though I might be missing some important detail here.
> >
> > I think this is because the kernel cannot merge VMAs that have
> > different anon_vmas?
> >
> > Enabling lazy population of anon_vma could potentially increase the
> > chances of merging VMAs.
> 
> Hmm. Do you have a clear explanation why merging chances increase this
> way? A couple of possibilities I can think of would be:
> 1. If after mmap'ing a VMA and before faulting the first page into it
> we often change something that affects anon_vma_compatible() decision,
> like vm_policy;
> 2. When mmap'ing VMAs we do not map them consecutively but the final
> arrangement is actually contiguous.
> 
> Don't think either of those cases would be very representative of a
> usual case but maybe I'm wrong or there is another reason?

Ok. I agree it does not represent common cases.

Hmm then I wonder how it went from the initial approach of "allocate anon_vma
objects only via fork()" [1] to "populate anon_vma at page faults". [2] [3]

Maybe Hugh, Andrea or Andrew have opinions?

[1] anon_vma RFC2, lore.kernel.org
https://lore.kernel.org/lkml/20040311065254.GT30940@dualathlon.random

[2] The status of object-based reverse mapping, LWN.net
https://lwn.net/Articles/85908

[3] rmap 39 add anon_vma rmap
https://gitlab.com/hyeyoo/linux-historical/-/commit/8aa3448cabdfca146aa3fd36e852d0209fb2276a

> 
> >
> > > > In the end rather than changing that logic I decided to skip
> > > > vma->anon_vma==NULL cases because I measured them being less than
> > > > 0.01% of all page faults, so ROI from changing that would be quite
> > > > low. But I agree that the logic is weird and maybe we can improve
> > > > that. I will have to review that again when I'm working on eliminating
> > > > all these special cases we skip, like swap/userfaults/etc.
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
