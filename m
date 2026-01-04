Return-Path: <linuxppc-dev+bounces-15198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0C0CF1678
	for <lists+linuxppc-dev@lfdr.de>; Sun, 04 Jan 2026 23:07:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dks4N5GxYz2yG3;
	Mon, 05 Jan 2026 09:07:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767564468;
	cv=none; b=i24j9CkbZfmPSAm0rhraLri4OxHVBWmXUUd/kwlkup2827StemKAfFr5J0kgvSifj6ufH4z3x0aDLANEYkl/OBhqBalidlNw54gjuOa1DR9Gr9Dm9ccJ7izIXKd5iOdHed6or8yPYjGnRw02DCGhnRl3LZlvMRtn6huEAsenC6Ii8fwfsB8GgexBB+hRKqq7mguvd/M7Pl6dKEwOcGD4zJjxUhv+6jHDlYZ88wkaqqW5qALn+Ny4O1zHyoPL9RUNXqtkDdzM/RTlE9tbuqVqHtHvxrbUyFFFFTy/6yWjPD6MfZ/Sw+RPdJeCwtweuIsR8/IFH9IjOUkWNVYigp0stg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767564468; c=relaxed/relaxed;
	bh=wo1Kl74psMzgyQ0k984/Z8XxStihf6Ag9RZU9qJUQBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJj7jstT3yaRvkp76HUBFA2GL7MHM84xYBQl5HdwDQFdqEirqUy95Lwhh+7cwWlzyL1ej8Xb8ijxn/elq/L8nFx3GszeHpJDhpeazh8E9LV0llOtmJ7lXYDtHefWaaZhuCw/Wd3Uu1+kv68B5Z5R2MNln7TfE+SYwrbtaPROFCXOe7pU3s2U5fUxxArU7tfiZmFjY9Aku75c7f1IcI1KK4t1fYNDN1kYeVcwVFDHxdgVnzx0ryPMmC7mHCZPx+8efzQiyCY6w3EeDNaY410v9W9Ag7/1KBOUw0y9n3DhbZ49+0VlAaHWH1Yq0KsD12SnifeB6OsyeZgHarqO/UrOFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gScty2Ff; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gScty2Ff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dks4M1mYXz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 09:07:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C47C434F3;
	Sun,  4 Jan 2026 22:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E756CC4CEF7;
	Sun,  4 Jan 2026 22:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767564464;
	bh=Ee42W97PW2cmqfwn1Sv3QlRj9Q5zCvDbUSuBQxv/Op0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gScty2FfULdESXHMa7hr8G8loXGEUlcQN5S80gDD5UqJ9suJ3KSg5EBnAfBmPbN4t
	 9i+loVAvbh0AVx5Yk4Koh1k8IXcYongXSPkBU/coQveXqy9HIob5+WjT9N8n85Gjtm
	 QC1qHBE6xVD7AdKk4C44SLTYTxRO2wXx2AsAtG8JDeEhyiIAC6f2WQDRBjpGsCOR0w
	 FS8iQ8IYIJkUJd7l21ONO+cGDEowjKvrtTSsbbdAQreKdAJdoXpAyGIgxSjm5iGWsN
	 P4fDUybYnndFC6q8lAflfYkDiUy/1o2TDN1ho6i4H4kKv0NoHgcQix3vta1Wo/qJz4
	 ESWpk4nesfdDw==
Date: Mon, 5 Jan 2026 00:07:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Klara Modin <klarasmodin@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
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
Subject: Re: [PATCH 3.5] arm: make initialization of zero page independent of
 the memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate
 initialization of nodes, zones and memory map)
Message-ID: <aVrkmnzgwM5i1VqX@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-23-rppt@kernel.org>
 <aVhN2NgQEKe0yzva@soda.int.kasm.eu>
 <aVll339wim7dCIaQ@kernel.org>
 <aVlwOyicOLPB9SOa@parmesan.int.kasm.eu>
 <aVpWpLV4Dut5Muo2@kernel.org>
 <aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk>
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
In-Reply-To: <aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Jan 04, 2026 at 08:56:45PM +0000, Russell King (Oracle) wrote:
> On Sun, Jan 04, 2026 at 02:01:40PM +0200, Mike Rapoport wrote:
> > From 35d016bbf5da7c08cc5c5547c85558fc50cb63aa Mon Sep 17 00:00:00 2001
> > From: Klara Modin <klarasmodin@gmail.com>
> > Date: Sat, 3 Jan 2026 20:40:09 +0200
> > Subject: [PATCH] arm: make initialization of zero page independent of the
> >  memory map
> > 
> > Unlike most architectures, arm keeps a struct page pointer to the
> > empty_zero_page and to initialize it requires conversion of a virtual
> > address to page which makes it necessary to have memory map initialized
> > before creating the empty_zero_page.
> > 
> > Make empty_zero_page a stataic array in BSS to decouple it's
> > initialization from the initialization of the memory map.
> 
> I see you haven't considered _why_ ARM does this.
> 
> You are getting rid of the flush_dcache_page() call, which ensures
> that the zeroed contents of the page are pushed out of the cache
> into memory. This is necessary.
> 
> BSS is very similar. It's memset() during the kernel boot _after_
> the caches are enabled. Without an explicit flush, nothing
> guarantees that those writes will be visible to userspace.

There's a call to flush_cache_all() paging_init()->devicemaps_init() that
will guarantee that those writes are flushed long before userspace starts.
 
> To me, this seems like a bad idea, which will cause userspace to
> break.
> 
> We need to call flush_dcache_page(), and _that_ requires a struct
> page.

Right now there's __flush_dcache_folio() that will break anyway when folio
divorces from struct page.   

-- 
Sincerely yours,
Mike.

