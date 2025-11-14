Return-Path: <linuxppc-dev+bounces-14184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6AC5F034
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 20:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7RkV0lMxz2yx7;
	Sat, 15 Nov 2025 06:18:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763147905;
	cv=none; b=ZPXuKckKzfZvO9KEJJT/WHPytvSYt3aAj7MrDzojyS5wMCJuzncBIpSq/0gKjUt/BcKf8enCxVtnk38gcb64v085C5C2wVgDgIaD2TflmVAHQTfQ6qGqc9RQ42bMkyrl27GZJFv56mfa9iWaQQYoyn+e55VSNsReYo3pLdrExFkk332aQA+bhrMj4TND07yZL/sXvU6gEN4cSk3ur2ogaiwp54F3IHzoTCYQktfMoS4GRcg0MidjclyXkmcGsQ/8fb291Q3k4YOOVsBljdQ076XBbY5PtrWm5jMARcmjJtNKcuZaFrHCPVMDapFnOMLdp3WVIF8vEhHdcttxM4b9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763147905; c=relaxed/relaxed;
	bh=sLyi/+2zqDnVdY9Cq47xGNcqDCx9T5B3TdTVzF1jVRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djH919pLGx+88yHYejPM6dYXNuU2QcUvAc/KRFdmyb1JO2HsRI+OqsndiWXpRYtMfbqX3te4bdKR830oEZWmMa1jgkBXOwY5Znb1op1mBRworjJTbhtcCrWv8UX1HFEt99TjMGU1RTT8aOz/j1W7EJjR2+JUpv1YFJYTRvIljt8WG9x66ZNklS/R/M2nuHTAP1917THleSQPzuPJvl58uDC4X89xW3tsq9F9m9eYOyGOJoIbL7vMY+JWD7FzyeXNxK73pSTPVa3vRp7yZh2eO64VvzKGX+A+IVueX3aNP4d8kaUL5Z5woH6Zi3ZV1glgvd+b/Gp84DAqKjUgC+Vn/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jy0Sphxk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jy0Sphxk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7RkS66D1z2ynW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 06:18:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CEB943C7B;
	Fri, 14 Nov 2025 19:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED921C116B1;
	Fri, 14 Nov 2025 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763147902;
	bh=q1olEHlGpuigXtFzJVBaSoMshU+v/j0ueFTcAUs+I9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jy0Sphxk9WR3dz6SBtNjAI3Ag2YV7/GuKr7/FFWOwTamKuZCdqFwcjOXh/hJ3+Ian
	 gArB2pLXfsGjcZhJMAGERlegHCumDDyuUoBmj1JyqZ+TcSSwkqcOWRcSjZEaHruHTr
	 HrsNXqOWkf0E1Ev/PpDXMacfc/DKQHo/itZwh/vqf5IJwgh0wYXAnbIPfEdYnlk/Og
	 UuqFZX3EZTPpv5YL1A2XaeykoteoPNQk+uMRFmWUutc8D8qK9T0JtawgKlAsQ14Fvo
	 3H2TJ1HaqAsNxl3ZCl+UIskhnYGaee2i1MaTooLgDSAmlPF0YPtnNKeV90KBT10itb
	 baNAz/2G9utJw==
Date: Fri, 14 Nov 2025 12:18:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
	"David Hildenbrand (Red Hat)" <david@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [akpm-mm:mm-unstable 36/283] mm/hugetlb.c:4753:18: warning:
 implicit conversion from 'unsigned long long' to 'unsigned long' changes
 value from 17179869184 to 0
Message-ID: <20251114191817.GA1089438@ax162>
References: <202511141140.LrrRrtIv-lkp@intel.com>
 <20251114182956.GD2566209@ax162>
 <aRd69_c1pULRoKOU@casper.infradead.org>
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
In-Reply-To: <aRd69_c1pULRoKOU@casper.infradead.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 14, 2025 at 06:54:47PM +0000, Matthew Wilcox wrote:
> On Fri, Nov 14, 2025 at 11:29:56AM -0700, Nathan Chancellor wrote:
> > > >> mm/util.c:1263:16: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
> > >     1263 |         if (ps->idx < MAX_FOLIO_NR_PAGES) {
> > >          |                       ^~~~~~~~~~~~~~~~~~
> > >    include/linux/mm.h:2104:36: note: expanded from macro 'MAX_FOLIO_NR_PAGES'
> > >     2104 | #define MAX_FOLIO_NR_PAGES      (1UL << MAX_FOLIO_ORDER)
> > >          |                                         ^~~~~~~~~~~~~~~
> > >    include/linux/mm.h:2095:36: note: expanded from macro 'MAX_FOLIO_ORDER'
> > >     2095 | #define MAX_FOLIO_ORDER         get_order(SZ_16G)
> > >          |                                 ~~~~~~~~~ ^~~~~~
> > >    include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
> > >       56 | #define SZ_16G                          _AC(0x400000000, ULL)
> > >          |                                         ^~~~~~~~~~~~~~~~~~~~~
> 
> Clearly this is a 32-bit build, since otherwise a conversion from
> "unsigned long long" to "unsigned long" is a NOP.  But 32-bit cannot
> support 16GB folios!
> 
> I say this is a bug in powerpc32's config.
> 
> #if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
> #define MAX_FOLIO_ORDER         MAX_PAGE_ORDER
> ...
> #else
> #define MAX_FOLIO_ORDER         PUD_ORDER
> 
> (PUD_ORDER is 16GB, so I think this will be what's being picked up)
> 
> but the only place the mentions ARCH_HAS_GIGANTIC_PAGE is pretty
> clearly dependent on 64bit ...
> 
> config PPC_RADIX_MMU
>         bool "Radix MMU Support"
>         depends on PPC_BOOK3S_64
>         select ARCH_HAS_GIGANTIC_PAGE
> 
> so I'm a bit stuck about how this comes to be.  Adding the PPC people
> for thoughts.

Note that the original report is against mm-unstable and flags

  https://git.kernel.org/akpm/mm/c/c3f81a41ba6f93693d208edde08ce2b0da21c645
  https://lore.kernel.org/20251112145632.508687-1-david@kernel.org/

in mm-hotfixes-unstable as the problematic change. This configuration ends up
with

  $ rg -N 'HAVE_GIGANTIC|HUGETLB|PPC_8xx' .config
  # CONFIG_CGROUP_HUGETLB is not set
  CONFIG_PPC_8xx=y
  CONFIG_HAVE_GIGANTIC_FOLIOS=y
  CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
  CONFIG_HUGETLBFS=y
  CONFIG_HUGETLB_PAGE=y

  config PPC_8xx
      bool "Freescale 8xx"
      select ARCH_SUPPORTS_HUGETLBFS
      select FSL_SOC
      select PPC_KUEP
      select HAVE_ARCH_VMAP_STACK
      select HUGETLBFS

which may indicate a bug in either selecting ARCH_HAS_GIGANTIC_PAGE in
this case or the logic of HAVE_GIGANTIC_FOLIOS in that change?

Cheers,
Nathan

