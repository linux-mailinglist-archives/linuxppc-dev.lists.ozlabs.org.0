Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E767D858320
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 17:56:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbyky6Vy3z3vdc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 03:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbykX4w59z3dSv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 03:56:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B4FC861FFE;
	Fri, 16 Feb 2024 16:56:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7B0C433F1;
	Fri, 16 Feb 2024 16:56:12 +0000 (UTC)
Date: Fri, 16 Feb 2024 16:56:10 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 12/18] arm64/mm: Wire up PTE_CONT for user mappings
Message-ID: <Zc-Tqqfksho3BHmU@arm.com>
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
> >>  arch/arm64/mm/contpte.c          | 285 +++++++++++++++++++++++++++++++
> > 
> > Nitpick: I think most symbols in contpte.c can be EXPORT_SYMBOL_GPL().
> > We don't expect them to be used by random out of tree modules. In fact,
> > do we expect them to end up in modules at all? Most seem to be called
> > from the core mm code.
> 
> The problem is that the contpte_* symbols are called from the ptep_* inline
> functions. So where those inlines are called from modules, we need to make sure
> the contpte_* symbols are available.
> 
> John Hubbard originally reported this problem against v1 and I enumerated all
> the drivers that call into the ptep_* inlines here:
> https://lore.kernel.org/linux-arm-kernel/b994ff89-1a1f-26ca-9479-b08c77f94be8@arm.com/#t
> 
> So they definitely need to be exported. Perhaps we can tighten it to
> EXPORT_SYMBOL_GPL(), but I was being cautious as I didn't want to break anything
> out-of-tree. I'm not sure what the normal policy is? arm64 seems to use ~equal
> amounts of both.

I don't think we are consistent here. For example set_pte_at() can't be
called from non-GPL modules because of __sync_icache_dcache. OTOH, such
driver is probably doing something dodgy. Same with
apply_to_page_range(), it's GPL-only (called from i915).

Let's see if others have any view over the next week or so, otherwise
I'd go for _GPL and relax it later if someone has a good use-case (can
be a patch on top adding _GPL).

> > If you can make this easier to parse (in a few years time) with an
> > additional patch adding some more comments, that would be great. For
> > this patch:
> 
> I already have a big block comment at the top, which was trying to explain it.
> Clearly not well enough though. I'll add more comments as a follow up patch when
> I get back from holiday.

I read that comment but it wasn't immediately obvious what the atomicity
requirements are - basically we require a single PTE to be atomically
read (which it is), the rest is the dirty/young state being added on
top. I guess a sentence along these lines would do.

Enjoy your holiday!

-- 
Catalin
