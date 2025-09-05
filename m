Return-Path: <linuxppc-dev+bounces-11782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF90B45626
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 13:19:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJDQ737TLz3c3l;
	Fri,  5 Sep 2025 21:19:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757071167;
	cv=none; b=VzEC20DMEltfvW2MxoXtWfkftINfrje4MC4YcnNZh+wvTbMQ34MIWO/psziA582Di/8XqH+GQE1VYBD0WlPTGAhp9cudtkW22xsA3lJlOyBrm+XLjiEPeBN99ryg2UxChII70nzCDs1LsqmKBoNvhFy/qDV4JvGSl37LbZgKL7ceP/1y5aslXHhP9CYug/RJM6vdjnelybGq2xlSXLmhi5COMmvh5ZBLEhR27gWVYOSpXQzdYGyVXhzFKX1QKqZvaog9cgFWEVJYwF+27ncEjkGfZ1yTm9+rVNQhuo3EQpfsh8l7HFlVxSCY+w/k+Y60+YV/UQ2zHSBCm3/gE2PTDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757071167; c=relaxed/relaxed;
	bh=vSe61z5BayeoSR86wiQVMBpcSVw9JUSiFDv132hHJEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiS6QbJdvjGm+z2Sbrfs2shFW5jd58dZiVxppF6tSJhPTOO9k82ObwAY3W7bc3BeRyALvW9oufawkZwkwZcPIeLEOPK8tekrZB10jpxlmc/mZQGNZ1j8Rjn+YxTuxGxsSOMtPLXXG3AS2Jy+/og+bWoPgGCLjAGXza2OQ/+3btafuR5pmZNI3ezyPd0naAWXWsCCmizO2msHLMcaFFsY+98skvSHR86ytZAXURLSl1tA+RCLOBeqLCgrAgwsqT5p4r8baQMT/JC7tvxvIP9/HkrY8qlmfZVvQnknS897TNb34SDJBZNXfMYUaS7Ft9+tH24XHRVPw5ituLsbHZzDnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A/QIh2dd; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A/QIh2dd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJDQ6484Lz3c2R
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 21:19:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 89B416027B;
	Fri,  5 Sep 2025 11:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C27C4CEF1;
	Fri,  5 Sep 2025 11:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757071164;
	bh=RHLqjtmoQ09sM+x+rrDllENxQeIkKdioDv+JW9P+Aos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/QIh2ddmPQW9GbhkGscvwZJAOdlvRvh05eTseLWqDi0NqX5VoUz3c+rFGi5te6gs
	 FeVf6cxesM0g4NssvOVujDWyj9mrdK8LpKlTGDp/6FZss2dq4STW6zOMrER9uue5m7
	 gYM0YJqrGGelTJTg/Wae0ezZ+Ln5Z9a7rQdsrtvsC5aJMkzJDUejnZeo9niA5S9ZsO
	 rAiiZhiID4hhFyLR0EPR+sXVy1LHpEREWSJ9XWSwcd0WYCKy66BICmsJmvPOks/99s
	 KUtvAv0iw5WXUoAptM66b1336WnWvdA8iRqYrawyqjKazn3DqpgdPmx5ld20pIZHkT
	 94jShf4NQqhcQ==
Date: Fri, 5 Sep 2025 14:19:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
Message-ID: <aLrHL-C_UXfUbCd9@kernel.org>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
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
In-Reply-To: <20250904125736.3918646-3-kevin.brodsky@arm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 04, 2025 at 01:57:31PM +0100, Kevin Brodsky wrote:
> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
> (taking and returning no value). This is proving problematic in
> situations where leave() needs to restore some context back to its
> original state (before enter() was called). In particular, this
> makes it difficult to support the nesting of lazy_mmu sections -
> leave() does not know whether the matching enter() call occurred
> while lazy_mmu was already enabled, and whether to disable it or
> not.
> 
> This patch gives all architectures the chance to store local state
> while inside a lazy_mmu section by making enter() return some value,
> storing it in a local variable, and having leave() take that value.
> That value is typed lazy_mmu_state_t - each architecture defining
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
> For now we define it as int everywhere, which is sufficient to
> support nesting.
> 
> The diff is unfortunately rather large as all the API changes need
> to be done atomically. Main parts:
> 
> * Changing the prototypes of arch_{enter,leave}_lazy_mmu_mode()
>   in generic and arch code, and introducing lazy_mmu_state_t.
> 
> * Introducing LAZY_MMU_{DEFAULT,NESTED} for future support of
>   nesting. enter() always returns LAZY_MMU_DEFAULT for now.
>   (linux/mm_types.h is not the most natural location for defining
>   those constants, but there is no other obvious header that is
>   accessible where arch's implement the helpers.)
> 
> * Changing all lazy_mmu sections to introduce a lazy_mmu_state
>   local variable, having enter() set it and leave() take it. Most of
>   these changes were generated using the Coccinelle script below.
> 
> @@
> @@
> {
> + lazy_mmu_state_t lazy_mmu_state;
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
> ...
> - arch_leave_lazy_mmu_mode();
> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
> ...
> }
> 
> Note: it is difficult to provide a default definition of
> lazy_mmu_state_t for architectures implementing lazy_mmu, because
> that definition would need to be available in
> arch/x86/include/asm/paravirt_types.h and adding a new generic
>  #include there is very tricky due to the existing header soup.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

