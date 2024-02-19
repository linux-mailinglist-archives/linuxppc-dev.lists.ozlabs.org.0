Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E971E85A739
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Feb 2024 16:19:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TdmR36ghbz3cPp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 02:19:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TdmQb18b1z2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 02:18:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 51CD9CE127E;
	Mon, 19 Feb 2024 15:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179F3C433F1;
	Mon, 19 Feb 2024 15:18:35 +0000 (UTC)
Date: Mon, 19 Feb 2024 15:18:33 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 12/18] arm64/mm: Wire up PTE_CONT for user mappings
Message-ID: <ZdNxSRR9MgvtMVao@arm.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-13-ryan.roberts@arm.com>
 <Zc9UQy-mtYAzNWm2@arm.com>
 <892caa6a-e4fe-4009-aa33-0570526961c5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892caa6a-e4fe-4009-aa33-0570526961c5@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 16, 2024 at 12:53:43PM +0000, Ryan Roberts wrote:
> On 16/02/2024 12:25, Catalin Marinas wrote:
> > On Thu, Feb 15, 2024 at 10:31:59AM +0000, Ryan Roberts wrote:
> >> +pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
> >> +{
> >> +	/*
> >> +	 * Gather access/dirty bits, which may be populated in any of the ptes
> >> +	 * of the contig range. We may not be holding the PTL, so any contiguous
> >> +	 * range may be unfolded/modified/refolded under our feet. Therefore we
> >> +	 * ensure we read a _consistent_ contpte range by checking that all ptes
> >> +	 * in the range are valid and have CONT_PTE set, that all pfns are
> >> +	 * contiguous and that all pgprots are the same (ignoring access/dirty).
> >> +	 * If we find a pte that is not consistent, then we must be racing with
> >> +	 * an update so start again. If the target pte does not have CONT_PTE
> >> +	 * set then that is considered consistent on its own because it is not
> >> +	 * part of a contpte range.
> >> +*/
[...]
> > After writing the comments above, I think I figured out that the whole
> > point of this loop is to check that the ptes in the contig range are
> > still consistent and the only variation allowed is the dirty/young
> > state to be passed to the orig_pte returned. The original pte may have
> > been updated by the time this loop finishes but I don't think it
> > matters, it wouldn't be any different than reading a single pte and
> > returning it while it is being updated.
> 
> Correct. The pte can be updated at any time, before after or during the reads.
> That was always the case. But now we have to cope with a whole contpte block
> being repainted while we are reading it. So we are just checking to make sure
> that all the ptes that we read from the contpte block are consistent with
> eachother and therefore we can trust that the access/dirty bits we gathered are
> consistent.

I've been thinking a bit more about this - do any of the callers of
ptep_get_lockless() check the dirty/access bits? The only one that seems
to care is ptdump but in that case I'd rather see the raw bits for
debugging rather than propagating the dirty/access bits to the rest in
the contig range.

So with some clearer documentation on the requirements, I think we don't
need an arm64-specific ptep_get_lockless() (unless I missed something).

-- 
Catalin
