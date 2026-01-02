Return-Path: <linuxppc-dev+bounces-15123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A9ACEDB1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 07:59:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djF1R5MNfz2xrC;
	Fri, 02 Jan 2026 17:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767337179;
	cv=none; b=SLjOu4o6Hib9F1/cPvtGk/yFcpxZ8Qg8+JLsqCi2j4WvpkSsKL87ePFyzSSXiSKNFotw4a1f4ZdyGX6UHAyFyI6fmZdGpDC45GB5o/42bulZ32PzupxbH1id3ASRkVPdwLEyMPRMzK5zp6SUjfBu19e2bDaQiriCY96ccUxHt2DBlaG+a5e6eOjepl7Ha2SrPDxwqhOtodUVFHuS+Qbx3O1rltF+omWXMlCOfMRJf9Svv0CvN1pVptmYSOeYgQvGjEBgukSLaasZANd/vUE6UDTWnM3Sx9qydpXpbjY5m8sWUYV+4BSCu3f6vSXvsL5q9gD/31mqrt6h8p/r5QSAyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767337179; c=relaxed/relaxed;
	bh=I0saHnqZE8DNUz3Eq4POw6LWeguXVeLKnWvje6WQ15M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEX63/dsmHeJXLh0tQlkZHOaGkGYcvmQYi1CWad7102hZ04An2YSh9k6mlGT9h8XHrDNP04H1vuqeTwV4H1lcZo1aVmqS5nmPwZHtuncz/D0a/LbrEF2bLbwdHy+HwQ/9quQGM41eQEi+uC0pdqSMX3a3jbLMw3jaCv1Q2GWqdg30f7wvoC70+K+iiJCKUOIdydZQ2JIXLbGBUvf0mZtsXZm2NsHiQnawzyGffe0jnz1ZJ6ysCyYtdXwbs/OEI/YWSiC9xn9MPPgwhgqnESSfbTFF8+DidBX+Q6IVyLx7Pn8oWyVCRMblhAkfp7SaP1tWUNGPat39HjN1K4ZbYdqiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JURDexdX; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JURDexdX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djF1Q2z41z2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 17:59:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6490F439EC;
	Fri,  2 Jan 2026 06:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B4AC116B1;
	Fri,  2 Jan 2026 06:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767337175;
	bh=6UamW9ypeYvnLArvWXDR1zXy9G1XczNWSIs66XcI5UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JURDexdXezRaYfVCWbUaXW3lzvXlm31RIqEgAxJWeFjD7mvppUL+nB5Q6DW/syoE7
	 9KCN3XX0+IFrZ6lXHKvj23Zbubf1juMpQoyVR3R5K+W0wTXoTePytdymIvKf7/FuUt
	 b7F7Op6aP4W0iuoMzjx2QqloKghcV05PUK7YhWlqmCDHRezSFJ5+E+XxOvd9U94KrO
	 yMpXKhnr9xm6zugptlmyDIWLkIzbYaeb0b/lyAP5EPPZjPoSkHAZCyI/7qGe07Bh3c
	 ZF/OMYqQXU+WaQeAzqytLFSZafleWXTxSNL1jQdGV6O5YweZiL0UFX3Jm+OycztA8g
	 kFuOhUi2qJ56g==
Date: Fri, 2 Jan 2026 08:59:12 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
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
Subject: Re: [PATCH 00/28] arch, mm: consolidate hugetlb early reservation
Message-ID: <aVdswNM9PUN6Kr8Q@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
 <20251231172714.a7fe44e856c14fdc8fe1cb43@linux-foundation.org>
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
In-Reply-To: <20251231172714.a7fe44e856c14fdc8fe1cb43@linux-foundation.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Dec 31, 2025 at 05:27:14PM -0800, Andrew Morton wrote:
> On Sun, 28 Dec 2025 14:39:30 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > Order in which early memory reservation for hugetlb happens depends on
> > architecture, on configuration options and on command line parameters.
> > 
> > Some architectures rely on the core MM to call hugetlb_bootmem_alloc()
> > while others call it very early to allow pre-allocation of HVO-style
> > vmemmap.
> > 
> > When hugetlb_cma is supported by an architecture it is initialized during
> > setup_arch() and then later hugetlb_init code needs to understand did it
> > happen or not.
> > 
> > To make everything consistent and unified, both reservation of hugetlb
> > memory from bootmem and creation of CMA areas for hugetlb must be called
> > from core MM initialization and it would have been a simple change.
> > However, HVO-style pre-initialization ordering requirements slightly
> > complicate things and for HVO pre-init to work sparse and memory map should
> > be initialized after hugetlb reservations.
> > 
> > This required pulling out the call to free_area_init() out of setup_arch()
> > path and moving it MM initialization and this is what the first 23 patches
> > do.
> > 
> > These changes are deliberately split into per-arch patches that change how
> > the zone limits are calculated for each architecture and the patches 22 and
> > 23 just remove the calls to free_area_init() and sprase_init() from arch/*.
> > 
> > Patch 24 is a simple cleanup for MIPS.
> > 
> > Patches 25 and 26 actually consolidate hugetlb reservations and patches 27
> > and 28 perform some aftermath cleanups.
> 
> Thanks for the diligence - this can't have been the most exciting thing
> to work on!
> 
> > I tried to trim the distribution list and although it's still quite long
> > if you feel that someone was wrongly excluded please add them back.
> 
> I'll add these to mm.git's mm-new branch for some testing.  I'll
> suppress the usual email storm because 41 * 28 is a lot of emails ;)

kbuild reported failures on some configurations so I'm anyway going to send
a lot of emails for v2 :)

-- 
Sincerely yours,
Mike.

