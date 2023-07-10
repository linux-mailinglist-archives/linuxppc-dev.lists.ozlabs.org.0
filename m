Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E32974DB2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:36:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UuZrn4FN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R08lY1RSyz3byT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:36:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=UuZrn4FN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R08jp6KHkz3bnp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:34:53 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-262dc1ced40so3443464a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689006891; x=1691598891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=McmzJB5w4UGeZqusQBhdxfjqigG3UhKtoIfFccLuj2s=;
        b=UuZrn4FN/UbJwfewh85rKzjLye9uELQEX45+YZjjYTP/BYBPgS+1UF+XIPNG2dESCU
         W86RtEBWvSwsPMW2x13eLsYhpVucWKpqju+x0agjnUbM9X4mJPFqV5rxvm4kT+xeCHJ2
         VLT5n9dF1ENtaArZbX2UUhZour8m8LNq5DgukydBxaU2fh8GLhckDOL0rRtQHMK6r9Zy
         jdOMwsf8im36X5gkixxf9GaLSAwdB6NrArpT95n6SO2ZLoGIlJK/Rxm4qX2jwfk/k1E7
         Ou/qPcZpE/ua9W+K5ji+Kqm43nFA7KCT2k00BsUZLSUM4S3DFaj6X8Q0tH21tk5YJKRc
         ar2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689006891; x=1691598891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McmzJB5w4UGeZqusQBhdxfjqigG3UhKtoIfFccLuj2s=;
        b=NweCBv6euUMdScewwjhaz8RmXBaP2McgvOo20ZZfRjJz/Ex0lJKR/4GHaxdoxLAPQN
         BzlMCyEtWR5/CfiedD45RGCtYOpkF6xFmwosbxgtzlKfpqBCKln/uFSzC8sln9S5ry1E
         4lsF0MlzS9RdTxkYPM3QZJXeN3iHFa8RLFW6/n2uR4SQL2IHpqjYfb1nKb5LnHkC9jBm
         etXkKZLXuLSAChN5KRFR9zCm5QnW5DvR9w3B1T74NTgLyHqgIwdRWd41A5/aBsreE9rz
         Uv/yWeWjkGLR/3wqV2NHQLPVoqGMZUwgWqgCsnREGtsnh4LdEpo0aPp4pScwRfbPOUOx
         De1Q==
X-Gm-Message-State: ABy/qLbZUohojiAKQ2hpDoeadk+K9srbpCo1c+H+m7RwCudaXebtrGkA
	PGsSLb5ZPSDLWvVCH5NnJ6E=
X-Google-Smtp-Source: APBJJlFGgItLHZLzX11JZjIS73D9W6Es/hAVqOzRDVW3J19VHlBJaksBcwskjpiGnATOLXIP8QCxUQ==
X-Received: by 2002:a17:90a:b315:b0:261:113e:50d2 with SMTP id d21-20020a17090ab31500b00261113e50d2mr13856226pjr.31.1689006890824;
        Mon, 10 Jul 2023 09:34:50 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090aae0800b00263f40cf83esm6456783pjq.47.2023.07.10.09.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 09:34:50 -0700 (PDT)
Date: Mon, 10 Jul 2023 09:34:48 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to
 __kvm_follow_pfn
Message-ID: <20230710163448.GE3894444@ls.amr.corp.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-6-stevensd@google.com>
 <20230705101800.ut4c6topn6ylwczs@linux.intel.com>
 <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
 <20230706155805.GD3894444@ls.amr.corp.intel.com>
 <CAD=HUj6GiK3TSSe7UY8C2Jd+3tjZNBa-TLgk-UodyL=E+qKavg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=HUj6GiK3TSSe7UY8C2Jd+3tjZNBa-TLgk-UodyL=E+qKavg@mail.gmail.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 07, 2023 at 10:35:02AM +0900,
David Stevens <stevensd@chromium.org> wrote:

> > > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > > index e44ab512c3a1..b1607e314497 100644
> > > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > >
> > > > ...
> > > >
> > > > > @@ -2937,6 +2943,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
> > > > >       bool host_writable = !fault || fault->map_writable;
> > > > >       bool prefetch = !fault || fault->prefetch;
> > > > >       bool write_fault = fault && fault->write;
> > > > > +     bool is_refcounted = !fault || fault->is_refcounted_page;
> > > >
> > > > Just wonder, what if a non-refcounted page is prefetched?  Or is it possible in
> > > > practice?
> > >
> > > Prefetching is still done via gfn_to_page_many_atomic, which sets
> > > FOLL_GET. That's fixable, but it's not something this series currently
> > > does.
> >
> > So if we prefetch a page, REFCOUNTED bit is cleared unconditionally with this
> > hunk.  kvm_set_page_{dirty, accessed} won't be called as expected for prefetched
> > spte.  If I read the patch correctly, REFCOUNTED bit in SPTE should represent
> > whether the corresponding page is ref-countable or not, right?
> >
> > Because direct_pte_prefetch_many() is for legacy KVM MMU and FNAME(prefetch_pte)
> > is shadow paging, we need to test it with legacy KVM MMU or shadow paging to hit
> > the issue, though.
> >
> 
> direct_pte_prefetch_many and prefetch_gpte both pass NULL for the
> fault parameter, so is_refcounted will evaluate to true. So the spte's
> refcounted bit will get set in that case.

Oops, my bad.  My point is "unconditionally".  Is the bit always set for
non-refcountable pages?  Or non-refcountable pages are not prefeched?
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
