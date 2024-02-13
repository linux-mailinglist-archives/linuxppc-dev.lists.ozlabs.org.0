Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD28A85369F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 17:54:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ6qG55MDz3dnN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 03:54:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ6pr2tqdz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 03:53:39 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA9CDA7;
	Tue, 13 Feb 2024 08:53:48 -0800 (PST)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.36.130])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB5073F5A1;
	Tue, 13 Feb 2024 08:53:03 -0800 (PST)
Date: Tue, 13 Feb 2024 16:53:01 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v5 21/25] arm64/mm: Implement new
 [get_and_]clear_full_ptes() batch APIs
Message-ID: <ZcuebesH1pvx4sxl@FVFF77S0Q05N.cambridge.arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-22-ryan.roberts@arm.com>
 <ZcucHyb1OBG677gx@FVFF77S0Q05N.cambridge.arm.com>
 <aaf2bc8e-3fe3-4d41-ab5b-fca99b33c8a4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaf2bc8e-3fe3-4d41-ab5b-fca99b33c8a4@arm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 13, 2024 at 04:48:50PM +0000, Ryan Roberts wrote:
> On 13/02/2024 16:43, Mark Rutland wrote:
> > On Fri, Feb 02, 2024 at 08:07:52AM +0000, Ryan Roberts wrote:

> >> +static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
> >> +				pte_t *ptep, unsigned int nr, int full)
> >> +{
> >> +	for (;;) {
> >> +		__ptep_get_and_clear(mm, addr, ptep);
> >> +		if (--nr == 0)
> >> +			break;
> >> +		ptep++;
> >> +		addr += PAGE_SIZE;
> >> +	}
> >> +}
> > 
> > The loop construct is a bit odd; can't this be:
> 
> I found it a little odd at first, but its avoiding the ptep and addr increments
> the last time through the loop. Its the preferred pattern for these functions in
> core-mm. See default set_ptes(), wrprotect_ptes(), clear_full_ptes() in
> include/linux/pgtable.h.
> 
> So I'd prefer to leave it as is so that we match them. What do you think?

That's fair enough; it I'm happy with it as-is.

Mark.
