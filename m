Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB31B8A40F9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 09:36:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CkZX4pyV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHMYC44bKz3vZW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 17:35:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CkZX4pyV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHMXR5Rc8z3bvJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 17:35:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7DD3FCE0660;
	Sun, 14 Apr 2024 07:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E552AC072AA;
	Sun, 14 Apr 2024 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713080113;
	bh=3r6JYrqvdbon9DEhTY1H2+qNf7eZiRWdkYsZpzrESPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkZX4pyVmQMjyHu1MkWMG+OmN+DpitNdvE+8Vnnpv2LwAkTUvDzAFWuF0QZM39J6H
	 Ds3a5kvcM/VK28fYIC44oLB0Bdn+zUbgRasxe5aCWB4xUu/RgLtSeh5qZWnq/2e8FJ
	 rTnb7E26SRg3O/Hr8+YjRqZvnQzlbsBhEdpfwJTzRcQc4vzX1fY1+RLch4UM3gsvOo
	 lhHc3rEpR8JxFCgxftuFbGO+Ys7pTermVZbhFSEMwu4SjmoAKErzDXHDO+V07uYXeL
	 1NKQmyuzEhmwb/N+lOun0QbkHzR0Hj54fWIETmay8j375CiTaSdfa1+arS37433DN9
	 Fj6dSalTyF8Tw==
Date: Sun, 14 Apr 2024 10:34:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 2/7] mm: vmalloc: don't account for number of nodes
 for HUGE_VMAP allocations
Message-ID: <ZhuG6HxnXp036bKk@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-3-rppt@kernel.org>
 <9217c95a-39f6-49ce-9857-ee2eebdb7a16@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9217c95a-39f6-49ce-9857-ee2eebdb7a16@csgroup.eu>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Helge Deller <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lorenzo Stoakes <lstoakes@gmail.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kern
 el@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 12, 2024 at 06:07:19AM +0000, Christophe Leroy wrote:
> 
> 
> Le 11/04/2024 à 18:05, Mike Rapoport a écrit :
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > vmalloc allocations with VM_ALLOW_HUGE_VMAP that do not explictly
> > specify node ID will use huge pages only if size_per_node is larger than
> > PMD_SIZE.
> > Still the actual allocated memory is not distributed between nodes and
> > there is no advantage in such approach.
> > On the contrary, BPF allocates PMD_SIZE * num_possible_nodes() for each
> > new bpf_prog_pack, while it could do with PMD_SIZE'ed packs.
> > 
> > Don't account for number of nodes for VM_ALLOW_HUGE_VMAP with
> > NUMA_NO_NODE and use huge pages whenever the requested allocation size
> > is larger than PMD_SIZE.
> 
> Patch looks ok but message is confusing. We also use huge pages at PTE 
> size, for instance 512k pages or 16k pages on powerpc 8xx, while 
> PMD_SIZE is 4M.

Ok, I'll rephrase.
 
> Christophe
> 
> > 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >   mm/vmalloc.c | 9 ++-------
> >   1 file changed, 2 insertions(+), 7 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 22aa63f4ef63..5fc8b514e457 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3737,8 +3737,6 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
> >   	}
> >   
> >   	if (vmap_allow_huge && (vm_flags & VM_ALLOW_HUGE_VMAP)) {
> > -		unsigned long size_per_node;
> > -
> >   		/*
> >   		 * Try huge pages. Only try for PAGE_KERNEL allocations,
> >   		 * others like modules don't yet expect huge pages in
> > @@ -3746,13 +3744,10 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
> >   		 * supporting them.
> >   		 */
> >   
> > -		size_per_node = size;
> > -		if (node == NUMA_NO_NODE)
> > -			size_per_node /= num_online_nodes();
> > -		if (arch_vmap_pmd_supported(prot) && size_per_node >= PMD_SIZE)
> > +		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> >   			shift = PMD_SHIFT;
> >   		else
> > -			shift = arch_vmap_pte_supported_shift(size_per_node);
> > +			shift = arch_vmap_pte_supported_shift(size);
> >   
> >   		align = max(real_align, 1UL << shift);
> >   		size = ALIGN(real_size, 1UL << shift);

-- 
Sincerely yours,
Mike.
