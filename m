Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E41857C94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 13:30:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbrrB4MJBz3vb7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 23:30:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbrqj4Rz8z3dXP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 23:30:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 234B6CE293E;
	Fri, 16 Feb 2024 12:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0D8C433C7;
	Fri, 16 Feb 2024 12:30:14 +0000 (UTC)
Date: Fri, 16 Feb 2024 12:30:12 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 13/18] arm64/mm: Implement new wrprotect_ptes() batch
 API
Message-ID: <Zc9VVC4cSFcYzgCZ@arm.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-14-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215103205.2607016-14-ryan.roberts@arm.com>
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

On Thu, Feb 15, 2024 at 10:32:00AM +0000, Ryan Roberts wrote:
> Optimize the contpte implementation to fix some of the fork performance
> regression introduced by the initial contpte commit. Subsequent patches
> will solve it entirely.
> 
> During fork(), any private memory in the parent must be write-protected.
> Previously this was done 1 PTE at a time. But the core-mm supports
> batched wrprotect via the new wrprotect_ptes() API. So let's implement
> that API and for fully covered contpte mappings, we no longer need to
> unfold the contpte. This has 2 benefits:
> 
>   - reduced unfolding, reduces the number of tlbis that must be issued.
>   - The memory remains contpte-mapped ("folded") in the parent, so it
>     continues to benefit from the more efficient use of the TLB after
>     the fork.
> 
> The optimization to wrprotect a whole contpte block without unfolding is
> possible thanks to the tightening of the Arm ARM in respect to the
> definition and behaviour when 'Misprogramming the Contiguous bit'. See
> section D21194 at https://developer.arm.com/documentation/102105/ja-07/
> 
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
