Return-Path: <linuxppc-dev+bounces-7556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E2A813DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Apr 2025 19:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXCz51fL6z30TG;
	Wed,  9 Apr 2025 03:40:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744134033;
	cv=none; b=UnASs26rsGAEK1bsLBTyXo0e74AkxuAfMIRApZwA5gmq/lgAU6jTaxjFtugrsK0L8VmC0IsVzS55JP/SxiWpI3QjoGv0HECCIgCujLUrwrjmsgPeLlikol7gVgYQCs87O6tsnDTczFe2lCrNjBo9pC3tzHI5s/Un2mwDG+BEI4w3In2arUtXfVupnp7Y5H+0hH+JMl6JFF7wePyyl1Q7h+fvlQmg4caLDhoE/0Aa0z34EB7zhWRc+6uLNCYTdOGw0PwlB1VTpBdk2zijcLQRs2QZr7j+ZSUnrt0UKlt4y4Yf7H9VnWgcTgKd+XL4BDzjikg15XZAhga5GgebOsy41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744134033; c=relaxed/relaxed;
	bh=5tE/97qDLNInhrSv41O24hz6k5it7lrWx1B8nzMlNNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kI9Gu6846JgVwpTLimXvDj/jKPQsY1yWbZTKd8DKdjmHKCu2rjhj17uvU6AH51d8cn1JrR0F2qGuIrEid3+JLxOmK0pdKW+Z7x0hx/Rg5ZYlucSCFCluIvNuNXsp7nMF12CGUb0c3tThUJLXmC+TKQiie7dVDe/37CvsWVtL89ued57uUIOUh/xKt4PLmSymAdVDPv0az47MuXoyI0gezbFiAGRAyhc43DgoHEa9T3YlfM5xK3DVcbVhdJzJwx/D2BMOguTbbtlvHHwzadcmiUnr16cD9VIgNTWxvfbCNUChGWqn7y+cdDyjVAlHZrhhim3Xs7tEEUjDLO07rQ6Wzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KOx/f5Uy; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=KOx/f5Uy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZXCz16Bg9z30Qb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Apr 2025 03:40:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5tE/97qDLNInhrSv41O24hz6k5it7lrWx1B8nzMlNNY=; b=KOx/f5UyipuUZDxVD5jHE+qtD2
	eu74DLpYFMC1h+xs/K+Yc3/IGk3Plq8aRYPYtEobrVYMeFJvoXpTOtoRRqrUJBUPtc/oY9cvtp/lD
	gKRIIV5K3Ay5rO73pxFfgDEaeM4l+kvMJBV/UxCy4LKTUvAXPVBmtE0chmbr9c2fpSmrm4V1I0bvt
	qVHlSwz6Tx3BeDuT4Zh7G7fi3wuMGEI1XTtoz+ESpsT2mM38529r1gpY1IKCfBTHF7RDItD5mxBJ7
	Wah2MxhHtGeY0sW+tFM+xPtnysJSl7HjGpXBzLxKQwN1mbRbcboMHLNFuI3tvLHMlCUzQg23htLGm
	jl0FA5PQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Cvg-00000000Iq7-25G6;
	Tue, 08 Apr 2025 17:40:08 +0000
Date: Tue, 8 Apr 2025 18:40:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 02/12] x86: pgtable: Always use pte_free_kernel()
Message-ID: <Z_VfeFgrj23Oa0fX@casper.infradead.org>
References: <20250408095222.860601-1-kevin.brodsky@arm.com>
 <20250408095222.860601-3-kevin.brodsky@arm.com>
 <409d2019-a409-4e97-a16f-6b345b0f5a38@intel.com>
 <Z_VQxyqkU8DV7QGy@casper.infradead.org>
 <9247436d-ae01-4eb8-bd5d-370b2fb2eebc@intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9247436d-ae01-4eb8-bd5d-370b2fb2eebc@intel.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 08, 2025 at 09:54:42AM -0700, Dave Hansen wrote:
> On 4/8/25 09:37, Matthew Wilcox wrote:
> > On Tue, Apr 08, 2025 at 08:22:47AM -0700, Dave Hansen wrote:
> >> Are there any tests for folio_test_pgtable() at free_page() time? If we
> >> had that, it would make it less likely that another free_page() user
> >> could sneak in without calling the destructor.
> > It's hidden, but yes:
> > 
> > static inline bool page_expected_state(struct page *page,
> >                                         unsigned long check_flags)
> > {
> >         if (unlikely(atomic_read(&page->_mapcount) != -1))
> >                 return false;
> > 
> > PageTable uses page_type which aliases with mapcount, so this check
> > covers "PageTable is still set when the last refcount to it is put".
> 
> Huh, so shouldn't we have ended up in bad_page() for these, other than:
> 
>         pagetable_dtor(virt_to_ptdesc(pmd));
>         free_page((unsigned long)pmd);

I think at this point in Kevin's series, we don't call the ctor for
these pages, so we never set PageTable() on them.  I could be wrong;
as Kevin says, this is all very twisty and confusing with exceptions and
exceptions to exceptions.  This series should reduce the confusion.

