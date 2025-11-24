Return-Path: <linuxppc-dev+bounces-14454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD37C80EC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 15:10:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFSQ42CN8z2xQD;
	Tue, 25 Nov 2025 01:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763993404;
	cv=none; b=giC97a83Sv7k5cWsK5fIRsH4YSjzVDuW/p6ufNTKF1gd+o20eNzcQxl+vymA1Sfe0mbDBVyQpT8rV/XYv5+ksUcyimC4S4+GFIPOJ2K7BC+kmxXwwOU1WaI+9p5DSaguTKoLXje2t2W/81mBmkAd1Ux9flfvqzbWfQj827bkfq6hRY3v4v3Piyu071+e9AX9Vt9812xS23VY/DKaqBvorBzVB0EvY+OKBDBWiLweCBxCMOjJUfAgQ1SWEP8XVTwUA7C2PjWQYURnp6Vggb97Fj/qOeMOhW41AuMoUdCCTUzXYB8GdlNUcEgfDaer7+es1QsRPsiWCuFbBz2frcfczA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763993404; c=relaxed/relaxed;
	bh=8G5fnunS4XtYzsuHwEAt2+VrWQNWQA1EjOphxoaxaK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKv5tpuni7diXAeFDDZHs4xyz8B9oSgbHqmUlyHWYQJKBzg0UEgUTn7LXKEEYk6ZZUfJ/0jjzvkTOUn1g1EHMSzKx8gtdsbu10bYW1hVHXPkEG1qbzLjhglmf6rx7pzCNtyFR/i7e2QZToKMudr5gu+PjT6CpV9ZSCEUOT9Qslkrglox2RLuLyQHHjNCbVzgmwGTgE5SegZ2NUoD7PkmXm/eXwkMrFmeeJN4j2K9bFL4vxmkUCXPmEI5RNb3UBV+T6QCZt0Mv2VJTw6c2YvfSQe2SmkwPpq8x2e1WQmMaTuG2xIR7BI2Bs1t8zPhGT0aoohpEU7a9OgfxCIWFMDf1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fn+KCCRj; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fn+KCCRj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFSQ30L2Yz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 01:10:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8396A4195B;
	Mon, 24 Nov 2025 14:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F1F8C116C6;
	Mon, 24 Nov 2025 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763993399;
	bh=TWEkufK+gYKT1sSMXcHmAUd4hn/Rf+NblbWiRzqjYXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fn+KCCRjb50rns8DRSbP5eHwsxgoY/Kml4PeEgcCJeD26M9vYXui7/aT7inSMbIxf
	 YzKx3Oxi12/SHccP4zqiAZBpkawAjBIrdIq6ojtNJ3MqzZIZs/6LWUcWZiW8b0FuJE
	 Ml+dVSCPPiz4nA0kHauPvd8caafMtHO4bKeEncACk6GoCcx0j21HPCEQRfm6P0giCM
	 Ly/blKcvqn2emQo6jii0GCNdl30wtJ7h2LuC/4FBTV86yMpoaQeq2/Vb5EVoAwqxwk
	 Ook4PMLPReVXf+dc0dSemeN/A7u7VMwVtjwjGYoNs7r8xWNS2kh156oqM6wjxrgdtJ
	 4TjfjsfNIahLg==
Message-ID: <886f8f49-f113-445f-8f1e-3cdaabf7b38d@kernel.org>
Date: Mon, 24 Nov 2025 15:09:48 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <20251124132228.622678-9-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/24/25 14:22, Kevin Brodsky wrote:
> Despite recent efforts to prevent lazy_mmu sections from nesting, it
> remains difficult to ensure that it never occurs - and in fact it
> does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> made nesting tolerable on arm64, but without truly supporting it:
> the inner call to leave() disables the batching optimisation before
> the outer section ends.
> 
> This patch actually enables lazy_mmu sections to nest by tracking
> the nesting level in task_struct, in a similar fashion to e.g.
> pagefault_{enable,disable}(). This is fully handled by the generic
> lazy_mmu helpers that were recently introduced.
> 
> lazy_mmu sections were not initially intended to nest, so we need to
> clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
> This patch takes the following approach:
> 
> * The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
>    calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.
> 
> * Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
>    to the arch via arch_{enter,leave} - lazy MMU remains enabled so
>    the assumption is that these callbacks are not relevant. However,
>    existing code may rely on a call to disable() to flush any batched
>    state, regardless of nesting. arch_flush_lazy_mmu_mode() is
>    therefore called in that situation.
> 
> A separate interface was recently introduced to temporarily pause
> the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
> exits the mode *regardless of the nesting level*, and resume()
> restores the mode at the same nesting level.
> 
> pause()/resume() are themselves allowed to nest, so we actually
> store two nesting levels in task_struct: enable_count and
> pause_count. A new helper in_lazy_mmu_mode() is introduced to
> determine whether we are currently in lazy MMU mode; this will be
> used in subsequent patches to replace the various ways arch's
> currently track whether the mode is enabled.
> 
> In summary (enable/pause represent the values *after* the call):
> 
> lazy_mmu_mode_enable()		-> arch_enter()	    enable=1 pause=0
>      lazy_mmu_mode_enable()	-> ø		    enable=2 pause=0
> 	lazy_mmu_mode_pause()	-> arch_leave()     enable=2 pause=1
> 	lazy_mmu_mode_resume()	-> arch_enter()     enable=2 pause=0
>      lazy_mmu_mode_disable()	-> arch_flush()     enable=1 pause=0
> lazy_mmu_mode_disable()		-> arch_leave()     enable=0 pause=0
> 
> Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
> headers included by <linux/pgtable.h> to use it.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Nothing jumped at me, so

Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

Hoping we can get some more eyes to have a look.

-- 
Cheers

David

