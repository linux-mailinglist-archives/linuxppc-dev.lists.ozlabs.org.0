Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 773A79483A7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 22:38:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bF0xgt41;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd7Ym2yv6z3cgM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 06:38:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bF0xgt41;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd7Y44kbqz3cRF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 06:37:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD1AD60DD2;
	Mon,  5 Aug 2024 20:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087EBC4AF0E;
	Mon,  5 Aug 2024 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722890261;
	bh=qdRuOti9XNlLltkR78ltAp8iub7ZiaEGkve5ZQKgRXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bF0xgt419GbxyCGFRj0fNjByi1OtMInAxUy0fO7kuEExoo6r6jeZMXGjN5ikPGLYH
	 /M1nzHizackmgautp/VnDSLRxQXCurMyrYVEwg5Yf+PdgGkwhSt7ZiA1a6tEsPe3+w
	 oJPfE55fHB91q50vVv1vV9hAXYemhAyhr6OpNgWOOvXUx9/9Vw4S7evidbf87YcNj+
	 pEPIiDW05PYUn8lRlujrJ1DKbY3WIHytjXuNelSTWpy7nXBiYR1lO2v9ZQh4g3aHrR
	 PgFXkbijAdUJ0BywpuS1YJGB4AvPiLFgG1t0OrXdtLJEh5IFQJb88z75ZKH8cfv8oU
	 ALk7ATW/rOneA==
Date: Mon, 5 Aug 2024 23:35:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 11/26] x86/numa: use get_pfn_range_for_nid to verify
 that node spans memory
Message-ID: <ZrE3ijXA3efepKcH@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
 <20240801060826.559858-12-rppt@kernel.org>
 <66b1302ce5fd3_c1448294d3@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66b1302ce5fd3_c1448294d3@dwillia2-xfh.jf.intel.com.notmuch>
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, linux-cxl@vger.kernel.org, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 05, 2024 at 01:03:56PM -0700, Dan Williams wrote:
> Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > Instead of looping over numa_meminfo array to detect node's start and
> > end addresses use get_pfn_range_for_init().
> > 
> > This is shorter and make it easier to lift numa_memblks to generic code.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Tested-by: Zi Yan <ziy@nvidia.com> # for x86_64 and arm64
> > ---
> >  arch/x86/mm/numa.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> > index edfc38803779..cfe7e5477cf8 100644
> > --- a/arch/x86/mm/numa.c
> > +++ b/arch/x86/mm/numa.c
> > @@ -521,17 +521,10 @@ static int __init numa_register_memblks(struct numa_meminfo *mi)
> >  
> >  	/* Finally register nodes. */
> >  	for_each_node_mask(nid, node_possible_map) {
> > -		u64 start = PFN_PHYS(max_pfn);
> > -		u64 end = 0;
> > +		unsigned long start_pfn, end_pfn;
> >  
> > -		for (i = 0; i < mi->nr_blks; i++) {
> > -			if (nid != mi->blk[i].nid)
> > -				continue;
> > -			start = min(mi->blk[i].start, start);
> > -			end = max(mi->blk[i].end, end);
> > -		}
> > -
> > -		if (start >= end)
> > +		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
> > +		if (start_pfn >= end_pfn)
> 
> Assuming I understand why this works, would it be worth a comment like:
> 
> "Note, get_pfn_range_for_nid() depends on memblock_set_node() having
>  already happened"

Will add a comment, sure.
 
> ...at least that context was not part of the diff so took me second to
> figure out how this works.
> 

-- 
Sincerely yours,
Mike.
