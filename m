Return-Path: <linuxppc-dev+bounces-5362-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA74A15076
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 14:25:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZL8R4jZ8z30WQ;
	Sat, 18 Jan 2025 00:25:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737120343;
	cv=none; b=ddaxSTBd18W5ALVCH1NMQud7dwuVJHecXFCfmwnbFI5xXae/ioGkhIpcga5b0Bpqcthj02Lv2ETP/iDw14QyIraetaiBgu60CECrvkWeRI6F+SWdeHJ5PBI2x0A2BS03VCPcNkfvIa9D7hmUqJ+TeajDJgPzkmO9ME/79MCIhkVjWngiZN7rcPuyFYf45RMNipKSaU9ZniY0+/UFUZurBaGbJBCIna7dkIU8cOJ+wcXwHDmmJeNdPY9ga+qr7O32xlNgTJAGVH3V3Uo2Wq+eOgEkikdEE4oaMEgpa2E+lZn8aYYyQMsZDemGDSDXdjz1GFG8idXw4uQIxEw0RUjfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737120343; c=relaxed/relaxed;
	bh=XEKAG0VVDbRMDZVYLbr0bVW85rqDk6xFXu+Myl9rZ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SS2oFZxvsG8of4dBWNI9bDJX3wgwLWUeEpAsSP5JZClEl700Rzrr7YLAILJaPRLTQo4aF3OGUU6Gg2fdoHVMWR8H+ExaUjBw8ctaDtAv679CuDD+MMkTKeyr2WJhxmmbuGq43HkCMT/Qf5F3aoRSinsBl9W4xbNCPucPdpTsHdu/zBAuwkRIib3OZ8NJKCgtGsQU+y1t0gusWSKi8E9kRP9rBYPxkBwdD4FcuDW2THFLXQIj3gT0MV4CjSY3pU/jYUXgFHUrCi3AUpnDBYMLSQqnHLDy83OKpG3sjT9OuJirp6O/VKBzDw6ipxRpHwhLy1EbzKk4p35l5mRqsJeDJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nCvHMpF2; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nCvHMpF2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZL8Q4RmBz2ynR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 00:25:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D60BBA42C2C;
	Fri, 17 Jan 2025 13:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C43C4CEDD;
	Fri, 17 Jan 2025 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737120338;
	bh=i5g2DbcJlsukG3CuQeCOvnrmGoI0+t7RerfHcE2ITE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nCvHMpF21/84VoMzTIfTmODZawDxjude8tCR6JJtkJECU6I5I9whWXy05LWEyoVNW
	 KSzrpuQi7EY7p8WZMS465l3rzsHJ8EnYeKCSayrYuWoVdpTDqvziBmoejLV5qSMBK6
	 f5E+BQjEiCRh0u6SKqq//93pPU+X4JoeMx70R+9aHhWo8pxelv+5LYbQpozArWbl4N
	 fjahkxBv/te1ioiDTpeoXYuLizhvr0ePIgbB6YsYdqX4IS/429ehvwWhMUBrLB8HOx
	 2ER9LwPKInXFc4sc8Z5xZ0s6RECYLRZli7PrwB954w5tTFqDoUfRjjNblQvSNEU4sb
	 Uskxi7/yiLEew==
Date: Fri, 17 Jan 2025 13:25:28 +0000
From: Will Deacon <will@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
	alex@ghiti.fr, andreas@gaisler.com, palmer@dabbelt.com,
	tglx@linutronix.de, david@redhat.com, jannh@google.com,
	hughd@google.com, yuzhao@google.com, willy@infradead.org,
	muchun.song@linux.dev, vbabka@kernel.org,
	lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
	rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de,
	aneesh.kumar@kernel.org, npiggin@gmail.com,
	dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d
 level page table
Message-ID: <20250117132527.GA17058@willie-the-truck>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
 <20250113162600.GA14101@willie-the-truck>
 <a017d072-943f-4008-bb1d-7be438804a44@bytedance.com>
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
In-Reply-To: <a017d072-943f-4008-bb1d-7be438804a44@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 10:26:54AM +0800, Qi Zheng wrote:
> Hi Will,
> 
> On 2025/1/14 00:26, Will Deacon wrote:
> > On Wed, Jan 08, 2025 at 02:57:21PM +0800, Qi Zheng wrote:
> > > Like other levels of page tables, also use mmu gather mechanism to free
> > > p4d level page table.
> > > 
> > > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> > > Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > >   arch/arm64/include/asm/pgalloc.h |  1 -
> > >   arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
> > >   2 files changed, 14 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
> > > index 2965f5a7e39e3..1b4509d3382c6 100644
> > > --- a/arch/arm64/include/asm/pgalloc.h
> > > +++ b/arch/arm64/include/asm/pgalloc.h
> > > @@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
> > >   	__pgd_populate(pgdp, __pa(p4dp), pgdval);
> > >   }
> > > -#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
> > >   #else
> > >   static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
> > >   {
> > > diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
> > > index a947c6e784ed2..445282cde9afb 100644
> > > --- a/arch/arm64/include/asm/tlb.h
> > > +++ b/arch/arm64/include/asm/tlb.h
> > > @@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
> > >   }
> > >   #endif
> > > +#if CONFIG_PGTABLE_LEVELS > 4
> > > +static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
> > > +				  unsigned long addr)
> > > +{
> > > +	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
> > > +
> > > +	if (!pgtable_l5_enabled())
> > > +		return;
> > > +
> > > +	pagetable_p4d_dtor(ptdesc);
> > > +	tlb_remove_ptdesc(tlb, ptdesc);
> > > +}
> > 
> > Should we update p4d_free() to call the destructor, too? It looks like
> > it just does free_page() atm.
> 
> The patch #3 introduces the generic p4d_free() and lets arm64 to use it.
> The patch #4 adds the destructor to generic p4d_free(). So IIUC, there
> is no problem here.

Sorry, I missed that. In which case:

Acked-by: Will Deacon <will@kernel.org>

Will

