Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A562F740492
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 22:14:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=qLT/FXnF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrGCd41KHz304b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 06:14:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=qLT/FXnF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrGBk3y01z304b
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 06:14:05 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3a1d9b64837so2488704b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687896840; x=1690488840;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Omz0x3K5VJ2j7KfDH2649X9QbCItdU3t+DCvtH+dE30=;
        b=qLT/FXnF9fYy8bz41ZGqzPs/xLiMCCfewgfWuzZzcLVjcItB7JcMRZfi6IZL1dCSx3
         OsWOmERj0hyOKFLw3jnnNfW5CTsqZqse181Md9/KF69O7aJpxHwXe5KyY7KekYXV4G1r
         zVWUAFUddyly86sbQfglXGlLJ+Dw6fbYNcanLL/4qX6MAv9NG432kDe3kyebDDkyTfob
         goI5J8lS8Nlzpf0h6eGjsC3OSSCP5RIprmv8BuvIbtDrufzgn/Q2le4t+ExH2qGopi70
         i11eeGh9ltkwfbMdr3qGqDnVah9352dUuKEVj6Z46bgWdO+OozUTmUPxCUjV8K1vxlvi
         swng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687896840; x=1690488840;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Omz0x3K5VJ2j7KfDH2649X9QbCItdU3t+DCvtH+dE30=;
        b=TE5X5XN9v7YvT+D/hKmVKM3M1n7/Q5eqoHKnlk2a2jYy341mthRgexZFZQI+mp/PQm
         3hopx+3/l4Bx9iPoeCVjqWHplLYc2SWC81f5Vm5jCddRu/+e/JNcdaYAhgjkfi0Px6k8
         obBDVKsboMjLKUmRgTSSxH8a7s0PPQLhjeTzzjb1Ys1bmZ9YnSABjlS0x7Vi4fSQImd0
         ecUV1mghWdTng7BgMyNd6qagoTcds6a2iHZX9cIaxXMYp3jeH+pdyZExz67LezARVgzG
         sLmseo72IVNO+E33DvAV9LWAyygXlRTRF0uQqOMvNlwjVTn/eDWuvtA39eNWubvWv4an
         8FXA==
X-Gm-Message-State: AC+VfDy6HMEOpPLebPdGcIGruHYrpspfhnKrTw/7V12SJD0PSGBL5tS7
	UvDbJ28x4m0E/5dMAi6G6XmddQ==
X-Google-Smtp-Source: ACHHUZ7e3joAt7KSpSbDLhKkkEe6hRd92o1ATH/0oO6vi+mlTpkmMRcA4IUypqa5SFzU0uL+mRFuMQ==
X-Received: by 2002:a05:6359:2af:b0:133:9da:8d9f with SMTP id ek47-20020a05635902af00b0013309da8d9fmr5361549rwb.14.1687896839740;
        Tue, 27 Jun 2023 13:13:59 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id q131-20020a817589000000b00565eb8af1fesm1991442ywc.132.2023.06.27.13.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 13:13:59 -0700 (PDT)
Date: Tue, 27 Jun 2023 13:13:49 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 00/33] Split ptdesc from struct page
In-Reply-To: <ac1c162c-07d8-6084-44ca-a2c1a4183df2@redhat.com>
Message-ID: <90e643ca-de72-2f4c-f4fe-35e06e1a9277@google.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com> <e8992eee-4140-427e-bacb-9449f346318@google.com> <ac1c162c-07d8-6084-44ca-a2c1a4183df2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-openrisc@vger.kernel.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, xen-devel@lists.xenproject.org, Jonas Bonn <jonas@southpole.se>, Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mm@kvack.org, linux-mips@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
  Dinh Nguyen <dinguyen@kernel.org>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 27 Jun 2023, David Hildenbrand wrote:
> On 27.06.23 06:44, Hugh Dickins wrote:
> > On Mon, 26 Jun 2023, Vishal Moola (Oracle) wrote:
> > 
> >> The MM subsystem is trying to shrink struct page. This patchset
> >> introduces a memory descriptor for page table tracking - struct ptdesc.
> > ...
> >>   39 files changed, 686 insertions(+), 455 deletions(-)
> > 
> > I don't see the point of this patchset: to me it is just obfuscation of
> > the present-day tight relationship between page table and struct page.
> > 
> > Matthew already explained:
> > 
> >> The intent is to get ptdescs to be dynamically allocated at some point
> >> in the ~2-3 years out future when we have finished the folio project ...
> > 
> > So in a kindly mood, I'd say that this patchset is ahead of its time.
> > But I can certainly adapt to it, if everyone else sees some point to it.
> 
> I share your thoughts, that code churn which will help eventually in the far,
> far future (not wanting to sound too pessimistic, but it's not going to be
> there tomorrow ;) ).
> 
> However, if it's just the same as the other conversions we already did (e.g.,
> struct slab), then I guess there is no reason to stop now -- the obfuscation
> already happened.
> 
> ... or is there a difference regarding this conversion and the previous ones?

I was aware of the struct slab thing, didn't see much point there myself
either; but it was welcomed by Vlastimil, and barely affected outside of
slab allocators, so I had no reason to object.

You think that if a little unnecessary churn (a *lot* of churn if you
include folios, which did save some repeated calls to compound_head())
has already occurred, that's a good precedent for allowing more and more?
My opinion happens to differ on that.

Hugh
