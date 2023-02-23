Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E242A6A1178
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 21:50:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN4t058Plz3f36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 07:50:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EpX9CHX7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::e36; helo=mail-vs1-xe36.google.com; envelope-from=yuzhao@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EpX9CHX7;
	dkim-atps=neutral
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN4s20ghYz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 07:49:40 +1100 (AEDT)
Received: by mail-vs1-xe36.google.com with SMTP id f31so17749188vsv.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 12:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SF3XhVP3fAY++OBxv67A9DpjZx+ZDC9K9+v7wrHIg4=;
        b=EpX9CHX76iRG0Fs24LnxWWmUrr6GORT9E0/M4Xni5oa8PVB+NyUf9xnluacNRHiJLi
         oTPsaXyvlxhYWm1ndp1ryFZ2TYjXOvmoy1HRUGzS0OcGc0zMZqTcHgAXNM4rvtYhkBVg
         qf1J0mPiiAUp/S0+3TAXNUeuKCd0ORgY+E6d2A7I7obvZdxZj53WV4QC5FeppMbcQG4J
         w3LEbf37wFLbDqttTYWl7EPewRkSSHAJUCRfzZv8DTS9QEc8hXTrQprXo+iEqU+77E4a
         oj0f9UT2zBFwspHpPsFBXYoak9R9do+2VFEDllmPwgJrEESjvU63PTjiVmuQ4E+SRpNl
         YYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3SF3XhVP3fAY++OBxv67A9DpjZx+ZDC9K9+v7wrHIg4=;
        b=k29WI13+w1bz+x7mZ5gohcJbHueVzGRtsPTR4c+jpL/qBaY2vdmruUsqGbyiZ0dCoq
         hGz/7d7ipxlOImLXEtcdN9hVlRbPt8orDk1fln5kyz9MSsis3wbbxIf7+1PXog9SyHjG
         wIO3LZyetQ3AF3fZ/yy3HHKgTi32+iNsGYFTIXa3oC/xeOcLUWgEcqE0h2PICrTmWdMI
         UrHus77fSPETNF4MmMKltHUV3ASY8VCER/f+63hr0HMHZ+N3TgJnhYQQsRiR7e2kCkD2
         Hp5vzJt3JwufA4VVdywtwehqEWvY1WdD9Y5Dw4tv3MpkVBYBZWuWlIhVbj0XfUfZHD+g
         6gaA==
X-Gm-Message-State: AO0yUKUWL+SqycxKOVhU1KZN1tY4AY1YShNS/Nt3dVzsDPHtwtcBaF0w
	4IxiiTflrAaKHLlcWeWIroaArzmwMtvh6+jsayFJSw==
X-Google-Smtp-Source: AK7set+PFnbYU2JD49LX096IfpIl1qWCv3pt6jtJWvZdeEDsrHSa6XgcIEspmONr+RBUjp9C7QlPEAawwJ6rNQ/sErI=
X-Received: by 2002:a67:fb96:0:b0:411:bf89:685c with SMTP id
 n22-20020a67fb96000000b00411bf89685cmr800789vsr.6.1677185377290; Thu, 23 Feb
 2023 12:49:37 -0800 (PST)
MIME-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-6-yuzhao@google.com>
 <Y/elw7CTvVWt0Js6@google.com> <CAOUHufbAKpv95k6rVedstjD_7JzP0RrbOD652gyZh2vbAjGPOg@mail.gmail.com>
 <Y/e6Z+KIl6sYJoRg@google.com> <CAOUHufbwcqx21T=zmvYpnX_Mnd2A0KkPORbtxnJEwKuUKVSPzA@mail.gmail.com>
 <Y/fFWyYPu5Jf0de1@google.com> <CAOUHufYWktz4SNjL_o_2oZNcJLXserwCot-Prv4UEG9uzn57rg@mail.gmail.com>
 <Y/fMimvChfhhbCid@google.com>
In-Reply-To: <Y/fMimvChfhhbCid@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Thu, 23 Feb 2023 13:48:59 -0700
Message-ID: <CAOUHufb4yFPJ8bLt-YRC7eMAyT2PMA_JF82Z412+O=79edsuwQ@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v1 5/5] mm: multi-gen LRU: use mmu_notifier_test_clear_young()
To: Sean Christopherson <seanjc@google.com>
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 1:29=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, Feb 23, 2023, Yu Zhao wrote:
> > On Thu, Feb 23, 2023 at 12:58=E2=80=AFPM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > >
> > > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > On Thu, Feb 23, 2023 at 12:11=E2=80=AFPM Sean Christopherson <seanj=
c@google.com> wrote:
> > > > >
> > > > > On Thu, Feb 23, 2023, Yu Zhao wrote:
> > > > > > > As alluded to in patch 1, unless batching the walks even if K=
VM does _not_ support
> > > > > > > a lockless walk is somehow _worse_ than using the existing mm=
u_notifier_clear_flush_young(),
> > > > > > > I think batching the calls should be conditional only on LRU_=
GEN_SPTE_WALK.  Or
> > > > > > > if we want to avoid batching when there are no mmu_notifier l=
isteners, probe
> > > > > > > mmu_notifiers.  But don't call into KVM directly.
> > > > > >
> > > > > > I'm not sure I fully understand. Let's present the problem on t=
he MM
> > > > > > side: assuming KVM supports lockless walks, batching can still =
be
> > > > > > worse (very unlikely), because GFNs can exhibit no memory local=
ity at
> > > > > > all. So this option allows userspace to disable batching.
> > > > >
> > > > > I'm asking the opposite.  Is there a scenario where batching+lock=
 is worse than
> > > > > !batching+lock?  If not, then don't make batching depend on lockl=
ess walks.
> > > >
> > > > Yes, absolutely. batching+lock means we take/release mmu_lock for
> > > > every single PTE in the entire VA space -- each small batch contain=
s
> > > > 64 PTEs but the entire batch is the whole KVM.
> > >
> > > Who is "we"?
> >
> > Oops -- shouldn't have used "we".
> >
> > > I don't see anything in the kernel that triggers walking the whole
> > > VMA, e.g. lru_gen_look_around() limits the walk to a single PMD.  I f=
eel like I'm
> > > missing something...
> >
> > walk_mm() -> walk_pud_range() -> walk_pmd_range() -> walk_pte_range()
> > -> test_spte_young() -> mmu_notifier_test_clear_young().
> >
> > MGLRU takes two passes: during the first pass, it sweeps entire VA
> > space on each MM (per MM/KVM); during the second pass, it uses the rmap=
 on each
> > folio (per folio).
>
> Ah.  IIUC, userspace can use LRU_GEN_SPTE_WALK to control whether or not =
to walk
> secondary MMUs, and the kernel further restricts LRU_GEN_SPTE_WALK to sec=
ondary
> MMUs that implement a lockless walk.  And if the answer is "no", secondar=
y MMUs
> are simply not consulted.

Sorry for the bad naming -- probably LRU_GEN_SPTE_BATCH_WALK would be
less confusing.

MGLRU always consults the secondary MMU for each page it's going to
reclaim (during the second pass), i.e., it checks the A-bit in the
SPTE mapping a page (by the rmap) it plans to reclaim so that it won't
take a hot page away from KVM.

If the lockless walk is supported, MGLRU doesn't need to work at page
granularity: (physical) pages on the LRU list may have nothing in
common (e.g., from different processes), checking their PTEs/SPTEs one
by one is expensive. Instead, it sweeps the entire KVM spaces in the
first pass and checks the *adjacent SPTEs* of a page it plans to
reclaim in the second pass. Both rely on the *assumption* there would
be some spatial locality to exploit. This assumption can be wrong, and
LRU_GEN_SPTE_WALK disables it.

> If that's correct, then the proper way to handle this is by extending mmu=
_notifier_ops
> to query (a) if there's at least one register listeners that implements
> test_clear_young() and (b) if all registered listeners that implement tes=
t_clear_young()
> support lockless walks.  That avoids direct dependencies on KVM, and avoi=
ds making
> assumptions that may not always hold true, e.g. that KVM is the only mmu_=
notifier
> user that supports the young APIs.
>
> P.S. all of this info absolutely belongs in documentation and/or changelo=
gs.

Will do.
