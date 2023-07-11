Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9474E4EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 05:00:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jbRRZbz4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0QbQ26xYz3bcP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jbRRZbz4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0QZT2qPGz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 12:59:26 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso80042021fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 19:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689044360; x=1691636360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DBmSxEV9koNvPnH4f6fQb1MyHlXgygw1qw/AWmL9NU=;
        b=jbRRZbz4ynuhPqqeV5apPzs0jqkJtDi55aZFCp3oS1Ky8RkTvPlwMnB4q/fiemRBoQ
         /nqmDMG2P1A6auw8vdVkBVLFNlCCKg5J2gfTl+c6qkohrCouZIFJFDxXVd83G/CNdJVI
         qpp4LD8m9YAEdXqPmRzBi1781HakxZf9US60Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689044360; x=1691636360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DBmSxEV9koNvPnH4f6fQb1MyHlXgygw1qw/AWmL9NU=;
        b=UFs4qkPCJx7Zuiom7YQoPqfYJsSlNL/7auJZGfg39H02s+jJe9y4a4HCAcvzX5/IXw
         G/QTIqltCcNAe37JVv86iHMiQtN+Z8raHqF5QFGhWd6QJ/8InQ4iOdMpC1PtiD3yLgBQ
         aBPdAeKtY5F4mkNPwX3UU8JLiqN41J99aSjLnWdaPmINmCfquHw/bg3pQAhJBYXA3bMe
         MGfQy2Cgs6xXa0ytme6qX+OLN0Hxyk2XVCkRPslR09EG0jnTsyDwehF3CEVHTH9zMGSz
         m3qj1Q62ocv8jAMHXxEV5ypuRokrLfl1oh/7dH9wvlnl/8Uo9vm5sUZgIKrumH3XhrH4
         H5ug==
X-Gm-Message-State: ABy/qLZUZYNFMI/av2sXDlk5aGZ23R6uVAtIIUAcqDEIBJKXzCx1qrL9
	2wr3JRaKTrCFqcw0JGQqZNPfV/kv0TjrEv9jua68qA==
X-Google-Smtp-Source: APBJJlFhZxK1fGMNnOjl8Qk8f7Az5wy8Xg34SBiq6VLsMfXYX+pfTJMvsTItHqfjvno05fAVxl0LMgHzDd+1uLzcle4=
X-Received: by 2002:a2e:7e12:0:b0:2b7:1b63:4657 with SMTP id
 z18-20020a2e7e12000000b002b71b634657mr5157080ljc.37.1689044359940; Mon, 10
 Jul 2023 19:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <20230705101800.ut4c6topn6ylwczs@linux.intel.com> <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
 <20230706155805.GD3894444@ls.amr.corp.intel.com> <CAD=HUj6GiK3TSSe7UY8C2Jd+3tjZNBa-TLgk-UodyL=E+qKavg@mail.gmail.com>
 <20230710163448.GE3894444@ls.amr.corp.intel.com>
In-Reply-To: <20230710163448.GE3894444@ls.amr.corp.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Tue, 11 Jul 2023 11:59:08 +0900
Message-ID: <CAD=HUj6ZEzVEFgn_J_9EPNMj5i-N=MSc0xZF8FweqrgTxUks0g@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
To: Isaku Yamahata <isaku.yamahata@gmail.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 1:34=E2=80=AFAM Isaku Yamahata <isaku.yamahata@gmai=
l.com> wrote:
>
> On Fri, Jul 07, 2023 at 10:35:02AM +0900,
> David Stevens <stevensd@chromium.org> wrote:
>
> > > > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > > > index e44ab512c3a1..b1607e314497 100644
> > > > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > > >
> > > > > ...
> > > > >
> > > > > > @@ -2937,6 +2943,7 @@ static int mmu_set_spte(struct kvm_vcpu *=
vcpu, struct kvm_memory_slot *slot,
> > > > > >       bool host_writable =3D !fault || fault->map_writable;
> > > > > >       bool prefetch =3D !fault || fault->prefetch;
> > > > > >       bool write_fault =3D fault && fault->write;
> > > > > > +     bool is_refcounted =3D !fault || fault->is_refcounted_pag=
e;
> > > > >
> > > > > Just wonder, what if a non-refcounted page is prefetched?  Or is =
it possible in
> > > > > practice?
> > > >
> > > > Prefetching is still done via gfn_to_page_many_atomic, which sets
> > > > FOLL_GET. That's fixable, but it's not something this series curren=
tly
> > > > does.
> > >
> > > So if we prefetch a page, REFCOUNTED bit is cleared unconditionally w=
ith this
> > > hunk.  kvm_set_page_{dirty, accessed} won't be called as expected for=
 prefetched
> > > spte.  If I read the patch correctly, REFCOUNTED bit in SPTE should r=
epresent
> > > whether the corresponding page is ref-countable or not, right?
> > >
> > > Because direct_pte_prefetch_many() is for legacy KVM MMU and FNAME(pr=
efetch_pte)
> > > is shadow paging, we need to test it with legacy KVM MMU or shadow pa=
ging to hit
> > > the issue, though.
> > >
> >
> > direct_pte_prefetch_many and prefetch_gpte both pass NULL for the
> > fault parameter, so is_refcounted will evaluate to true. So the spte's
> > refcounted bit will get set in that case.
>
> Oops, my bad.  My point is "unconditionally".  Is the bit always set for
> non-refcountable pages?  Or non-refcountable pages are not prefeched?

The bit is never set for non-refcounted pages, and is always set for
refcounted pages. The current series never prefetches non-refcounted
pages, since it continues to use the gfn_to_page_many_atomic API.

-David
