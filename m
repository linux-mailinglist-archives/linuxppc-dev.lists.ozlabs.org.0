Return-Path: <linuxppc-dev+bounces-15535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC76AD10E58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 08:35:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqPKk1vLfz2yvG;
	Mon, 12 Jan 2026 18:35:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768203306;
	cv=none; b=KCxTYcMYcVjHCms8uJz6dfCnYtws4jaPw9aOYbRpZ88kt2R/OA0OyICg4RNJSnCE+9gPWLM5mzmeYK5KeJaWQ0fMB66xHibVAOIVEpVpT2nsZFWphZ3JHFD5SsVZKUaF9VE3MOldA0FlJzqxsnie3VUt9VsN1YVBN9m5GfFc42nINUgxS6mzW+fDuUJ0I3UwtcfOgePkr27ITtF5DVM0+7cMCgZA1UFQ18TwRNhBRVHHgupCFMHUk7IA1LSa+/2Sf68DGrZXy7l71PJ6QuXhPmAbn1CCbqT0NsoZNIUVgjZ4AaCjqezvCNZRtlHREdtyQWd6iF+ILVbB/ZI9Z4n3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768203306; c=relaxed/relaxed;
	bh=MpZZgA7Z9Th48hWh+uWd3ploF1QFnvsBfVrDzcsw5WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uhx3hePn6Ra+A3eW06sAKI5vIf1XvljduCwfAdWo/UlQFZacBkY36Z1vqHgyjwjNciqn1GeWoMnklw+/tDxhcSBG/BlKs8fZYJsEtfN4ik/zKjkaZ5AHMiTDurt08CxNLwXB9riWawyf44dZZQmzTeeRUVOJLqskY7X6cgJHKF398jMLV+l7yr9XDAKJcN6G6C7jePIVzDefrh+A0NGys5EOTvnffGNdrRxwnv6sMF1Xmd6cKnnfKOzGUiFbWg4GcKwyxV1m6HUaCChLRzC2GIijM8UygYhE2hsD173tcJG56I6cGxn6+Yg0l0Cd7wG6bFWGcJg1dySfHAejCQUo0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cB9JlNOs; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cB9JlNOs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqPKj1bJvz2yv9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 18:35:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CBFE43C1F;
	Mon, 12 Jan 2026 07:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61041C19422;
	Mon, 12 Jan 2026 07:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768203303;
	bh=H0wpDyU4+hGvGadEaJXaoKwU4fABU87rkRhUJIykrtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cB9JlNOsE5ASTDSwfciaJvBRecBB1lB0Uwj+GaWwyCjgypyJQWPdkiELZQ8iVJPfz
	 nMocJbirHN/1lk3J7Si3fdDg+XjkNRlIqWpD36vowiVH0S+GvTZEHLt/X4w6L2bjbX
	 MW70tMpH6LtqJ9xirliNmH6ey3Jn3uobFlK0X2Mc7rV2i4ddTSmSf1HxKEBm5toCRi
	 d46Yvu6ZlmDb9ZF7jcWZyute2z21cTSvo7YbjPFCodLjqoxUiSIWkDnwdalYjHh76y
	 ow7pMfD3F6CiXLdHJYJqrOQj4clSEc/bsWScF8TIIT22yhLrTWzvu1RJLquyFnQ26r
	 U5L75tv4dABXw==
Date: Mon, 12 Jan 2026 09:34:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Klara Modin <klarasmodin@gmail.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 17/29] s390: introduce arch_zone_limits_init()
Message-ID: <aWSkELL7xJ04QAct@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260111082105.290734-18-rppt@kernel.org>
 <b211f877-f9bb-4892-b67c-d2610048575a-agordeev@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b211f877-f9bb-4892-b67c-d2610048575a-agordeev@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Mon, Jan 12, 2026 at 08:02:48AM +0100, Alexander Gordeev wrote:
> On Sun, Jan 11, 2026 at 10:20:51AM +0200, Mike Rapoport wrote:
> 
> Hi Mike,
> 
> ...
> > +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> > +{
> > +	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
> > +	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> > +}
> > +
> >  /*
> >   * paging_init() sets up the page tables
> >   */
> > @@ -97,8 +103,7 @@ void __init paging_init(void)
> >  	sparse_init();
> >  	zone_dma_limit = DMA_BIT_MASK(31);
> >  	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
> > -	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
> > -	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> > +	arch_zone_limits_init(max_zone_pfns);
> 
> You move initialization of max_zone_pfns[] to a function, name the
> function arch_zone_limits_init(), but leave the initializatio of
> max_zone_pfns[] to zeroes outside. Should not it be brought along?

The idea is that is the caller responsibility to initialize max_zone_pfns
to zero. After patch 24: "arch, mm: consolidate initialization of
SPARSE memory model" there is a single caller of arch_zone_limits_init()
and having initialization of max_zone_pfns() there is more optimal than
having 20-something of those.
 
> >  	free_area_init(max_zone_pfns);
> >  }
> 
> Thanks!

-- 
Sincerely yours,
Mike.

