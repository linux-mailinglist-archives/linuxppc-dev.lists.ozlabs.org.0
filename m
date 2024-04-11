Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC47D8A1FA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 21:43:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p6WjKA9G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFqqv55X1z3vcG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 05:43:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFqpm1bxzz3dV7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 05:42:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GLmQ6OAiLByfHZ0eGe8X2lInPvVUnYvYGHLtnSFpmng=; b=p6WjKA9G6dX+WyDufUHAVMvzmt
	TEEuKUVS+thzRELnqAjvnH6i10dz570nqrjJL9ZXGf4bZS1nXuY4F57S1i8sknzzTiosXrRMWtwja
	Wl2QVyKMVPgdD4djWPDJyYc1qh+eRSQYF6g3SQ+FxVhW8CjBgW1dMrDQA2/rPtVx22R2m4mjZa233
	XbfrF3KCbxbV4a2eULYCR2JvTK5mnLn6In5XBzJIKJGJJDaTbAKriC0c3xg5TIewrOd+koQ0lcmWE
	yuu9PAFmPro1hKpehzsdur/j+e2m4dzk/qfRpBgrPaEio0j2aD0jKKMt0SHDFcdZ3PlSFQUBMlTG7
	n33Z/seQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv0JB-0000000Dvah-2hQJ;
	Thu, 11 Apr 2024 19:42:05 +0000
Date: Thu, 11 Apr 2024 12:42:05 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <Zhg9DXzagPbpNGH1@bombadil.infradead.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-6-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh 
 Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> module_alloc() is used everywhere as a mean to allocate memory for code.
> 
> Beside being semantically wrong, this unnecessarily ties all subsystems
> that need to allocate code, such as ftrace, kprobes and BPF to modules and
> puts the burden of code allocation to the modules code.
> 
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
> 
> Start splitting code allocation from modules by introducing execmem_alloc()
> and execmem_free() APIs.
> 
> Initially, execmem_alloc() is a wrapper for module_alloc() and
> execmem_free() is a replacement of module_memfree() to allow updating all
> call sites to use the new APIs.
> 
> Since architectures define different restrictions on placement,
> permissions, alignment and other parameters for memory that can be used by
> different subsystems that allocate executable memory, execmem_alloc() takes
> a type argument, that will be used to identify the calling subsystem and to
> allow architectures define parameters for ranges suitable for that
> subsystem.

It would be good to describe this is a non-fuctional change.

> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

> diff --git a/mm/execmem.c b/mm/execmem.c
> new file mode 100644
> index 000000000000..ed2ea41a2543
> --- /dev/null
> +++ b/mm/execmem.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0

And this just needs to copy over the copyright notices from the main.c file.

  Luis
