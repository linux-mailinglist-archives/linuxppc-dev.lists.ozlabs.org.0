Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F469A902
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 11:22:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ7D517gfz3f8b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 21:22:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=myOxV9ga;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=myOxV9ga;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ7C92RXwz3brJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 21:21:39 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id bw7so274605ybb.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 02:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H9BBhPTLGGaUBxW3AOHp6ZsKFR75sYiq19lXrasIXls=;
        b=myOxV9gamhIWyliGmdmN2/mk/L1tbECLokR9V0fsZYL+Aj/t5D9uNxFdPdzQY8b5Eb
         thUND1gGBMTB39ipgJZf2Ql2LwujdfXsd2EzrT0IKVckNP1pDgIt9Lw3ICJtr2va/jkA
         WiVF19oUY+8ELCnfLAH8YG5HyU9uEcJ7o4MYoepq66YAimbAXisPnHBVOsYIERKI9ViL
         ty30kR8wtoIG+qnXXowYn0X8x22Hf3AhdUqHDULpynsgtTJmn69CgLLXR2KaH0cSsKFu
         3jTW/4sCmj6lx99hEANBNFSMI5FxNAw7CWRBuN7NnhQp+zZF7xQg+Fa//77roL19p0Kt
         LVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9BBhPTLGGaUBxW3AOHp6ZsKFR75sYiq19lXrasIXls=;
        b=HYe9m6O60VEQuFfoYmKmZLT5W1XqABZmnBs1LKvVmVZBlIcY/NEMj5M+wsFtWJgTvA
         YgW0FZqvKC5ZfvEALXNVL7cZgWwOrso/q3K1l/Kjov3qNGNCq3f4k9k1D7MIm+rp1xTP
         CcmNqea2jyTfGxgYGRPPDmJfk8EFL1hcz+S/MV5bxiqAXgdaiH+mc26V14sAVSpyfokE
         9iYMnPw8CzgULasnewj8fFtOYbhYTwlWdxhyMcvLkPdQ64dOKfAcVp/Scj71TCtcQRpR
         esY/W/vgNnpEermiMZqvPXB8jqBezKcATc3xrH9nRPxTDbyRsB24aHCf9rw3odgjQrh6
         Wp2Q==
X-Gm-Message-State: AO0yUKUkH5ZqMHli9Z4qrfampF8AELvASp3bpaPT/CDd0wAd5tfwlelV
	zDyDFn0FMo3vAOHUXJjcqCt0yDI+rpcqgAR7VmI=
X-Google-Smtp-Source: AK7set9XZzct7X7WLcYp9C1YQZ54GdA3ZML/EFmNgnNLzMxsPTlkXoYn0KU+aTYkj1KX4pt6o21ZLWxWDcs5n3vh8n0=
X-Received: by 2002:a05:6902:308:b0:969:a7c9:d7b8 with SMTP id
 b8-20020a056902030800b00969a7c9d7b8mr386954ybs.624.1676629294516; Fri, 17 Feb
 2023 02:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-27-surenb@google.com>
 <Y+5Pb4hGmV1YtNQp@casper.infradead.org> <CAJuCfpHR8k0GsrYPMjSBVLAbu3EZgDU081+5CnR1td0cLEyDFw@mail.gmail.com>
 <CAJuCfpHODBAV=riSPyvcmLbZVtXSdxrw2GMy8VOjvDV9yCyX8A@mail.gmail.com>
In-Reply-To: <CAJuCfpHODBAV=riSPyvcmLbZVtXSdxrw2GMy8VOjvDV9yCyX8A@mail.gmail.com>
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Date: Fri, 17 Feb 2023 19:21:21 +0900
Message-ID: <CAB=+i9ToNQ-se1XWGOGbiM_0QRBYjuhCF5A8Cdvius89t8r7Ag@mail.gmail.com>
Subject: Re: [PATCH v3 26/35] mm: fall back to mmap_lock if vma->anon_vma is
 not yet set
To: Suren Baghdasaryan <surenb@google.com>
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

On Fri, Feb 17, 2023 at 11:15 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Thu, Feb 16, 2023 at 11:43 AM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > On Thu, Feb 16, 2023 at 7:44 AM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Wed, Feb 15, 2023 at 09:17:41PM -0800, Suren Baghdasaryan wrote:
> > > > When vma->anon_vma is not set, page fault handler will set it by either
> > > > reusing anon_vma of an adjacent VMA if VMAs are compatible or by
> > > > allocating a new one. find_mergeable_anon_vma() walks VMA tree to find
> > > > a compatible adjacent VMA and that requires not only the faulting VMA
> > > > to be stable but also the tree structure and other VMAs inside that tree.
> > > > Therefore locking just the faulting VMA is not enough for this search.
> > > > Fall back to taking mmap_lock when vma->anon_vma is not set. This
> > > > situation happens only on the first page fault and should not affect
> > > > overall performance.
> > >
> > > I think I asked this before, but don't remember getting an aswer.
> > > Why do we defer setting anon_vma to the first fault?  Why don't we
> > > set it up at mmap time?
> >
> > Yeah, I remember that conversation Matthew and I could not find the
> > definitive answer at the time. I'll look into that again or maybe
> > someone can answer it here.
>
> After looking into it again I'm still under the impression that
> vma->anon_vma is populated lazily (during the first page fault rather
> than at mmap time) to avoid doing extra work for areas which are never
> faulted. Though I might be missing some important detail here.

I think this is because the kernel cannot merge VMAs that have
different anon_vmas?

Enabling lazy population of anon_vma could potentially increase the
chances of merging VMAs.

> > In the end rather than changing that logic I decided to skip
> > vma->anon_vma==NULL cases because I measured them being less than
> > 0.01% of all page faults, so ROI from changing that would be quite
> > low. But I agree that the logic is weird and maybe we can improve
> > that. I will have to review that again when I'm working on eliminating
> > all these special cases we skip, like swap/userfaults/etc.
