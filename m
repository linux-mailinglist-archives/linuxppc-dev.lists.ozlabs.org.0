Return-Path: <linuxppc-dev+bounces-15380-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB28CFD234
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 11:20:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmPFD1DW0z2yFh;
	Wed, 07 Jan 2026 21:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767781248;
	cv=none; b=HGEyP76uTZPiQX5PlC9aXVW9ImU1FjPkH0LrNQ15FYMj0u37yKbJrL4q0lq9sqzfGCQ7+cTOT6qGGMeeP7+UL062QeYnY9mmDZmk+NFmwz+v1ZMQ5jRYJwoJWIqR6DOohnBuwJtU03tGEnptod8SDF0LaM2Wfiw7EaZ2YkSZ2USnZreQp7/P0b+KsI2n46+dekJSG1xYNpOq7XL/0pOv5PXsfFwzIIyOJRYXSx8wptyoIbK8L8Ts0cvvyKNcyzi6A4sCn47QEPoD1600QINCagdUueWRCEEae3v5A3+Qdxamb54bacYrXW2yC0SXS/Lism2F0ahtzc9oHGFni5pzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767781248; c=relaxed/relaxed;
	bh=YAjWTfL5/3oXi6ADzeSFQa0DHNLHQ/Gxlrenv2YfAWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FbXFes5yv1rDX93t8kFXxqT8Dqr/mNdqvpZP7ksIBCBh76K3aiDKLfIg98KpAw2vp0GNUgSuSnTrxLWLICaagUXvN3RQz1S2angGr32RbT77+r+EvjjTwhO7HJEyntij1tPFOJfP65L7GvvIu0ArViLGheHmQlc2AfHjHjn4HqLf9E9ipFy0MkBX3OJFKFey2L4ae267ZO2MUuap2Rx13hfTWWd2CRzY+dSev0OQPlaxlhd2OFepBHCHEExhjRInT6/+Ahl4QIH3k35kDb+utk0J9lMMGtW51Cu8vvW/LjPfyq7L735BjRfRUl9Sd+7m1ihbsO4SZ3Hw8US/MOuI3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HG3UgZmi; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HG3UgZmi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmPFC0CKyz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 21:20:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3697D60007;
	Wed,  7 Jan 2026 10:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332F3C4CEF7;
	Wed,  7 Jan 2026 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767781243;
	bh=2N7QgaN9sMjltiFqaQG4UkyiWR5RDDQ2n4IgHLPouW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HG3UgZmir72YPYFm/emlV/3aORPdbjLAnBvpX04p5XtFP762LStn/wPAzNuqOQyK8
	 k7OnYBM5tMSwl6jbeHb8PLi19AGtC/53sTnfGuvHRwU1J5fTUCYLII+PuhChCRsuuP
	 lesNvqozgo8UJHTVTNpJsDervk1O2VsPtftbzvVYNlT5k9C+Ou7zoWZDNLa9w7OL7l
	 1I+dvThsPPRQrJPx2bNt/P7eQY786Hlh4y2DUZqzVomuI/Tc2vep7bqbTNymx1RDAb
	 W1AWrPHPHnhn5oDQwiHOAOhH7g90DnMJIt+6Fqkfre323p/NzMyoEh/2zKKa/f4rTg
	 6GL2C2ybj5rcA==
Date: Wed, 7 Jan 2026 12:20:23 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>,
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
Subject: Re: [PATCH v2 14/28] powerpc: introduce arch_zone_limits_init()
Message-ID: <aV4zZ8D5eaLC6K-w@kernel.org>
References: <20260102070005.65328-1-rppt@kernel.org>
 <20260102070005.65328-15-rppt@kernel.org>
 <87ldia9he1.ritesh.list@gmail.com>
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
In-Reply-To: <87ldia9he1.ritesh.list@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Wed, Jan 07, 2026 at 09:57:34AM +0530, Ritesh Harjani wrote:
> Mike Rapoport <rppt@kernel.org> writes:
> 
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> >
> > Move calculations of zone limits to a dedicated arch_zone_limits_init()
> > function.
> >
> > Later MM core will use this function as an architecture specific callback
> > during nodes and zones initialization and thus there won't be a need to
> > call free_area_init() from every architecture.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/powerpc/mm/mem.c | 22 ++++++++++++----------
> >  1 file changed, 12 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > index 3ddbfdbfa941..32c496bfab4f 100644
> > --- a/arch/powerpc/mm/mem.c
> > +++ b/arch/powerpc/mm/mem.c
> > @@ -221,13 +221,23 @@ static int __init mark_nonram_nosave(void)
> >   * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
> >   * ZONE_DMA.
> >   */
> > -static unsigned long max_zone_pfns[MAX_NR_ZONES];
> > +void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
> > +{
> > +#ifdef CONFIG_ZONE_DMA
> > +	max_zone_pfns[ZONE_DMA]	= min(zone_dma_limit, max_low_pfn - 1) + 1;
> 
> Hi Mike, 
> 
> This doesn't look correct. Isn't the zone_dma_limit value in bytes actually?
> Shouldn't it be -
> 
>      max_zone_pfns[ZONE_DMA] = min((zone_dma_limit >> PAGE_SHIFT) + 1, max_low_pfn);

You are right, I'll update it for v3. 
 
> -ritesh

-- 
Sincerely yours,
Mike.

