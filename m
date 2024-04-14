Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A91C8A40BE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 08:55:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ExCk/4I4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHLg00W5Cz3dV7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 16:55:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ExCk/4I4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHLfF1kymz3bsj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 16:55:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F54E602C3;
	Sun, 14 Apr 2024 06:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6995FC072AA;
	Sun, 14 Apr 2024 06:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713077713;
	bh=yXFVMzCDhJLeup5ZM/cl95e9uW89yN9aiaOn424Za9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExCk/4I4W5Phef5aKaCHl7yCjGPCdhEDo2t4j5gOOcRyNoNKAWaoFjcjUPNV/ZDjL
	 NgPGAZFKEHXGgq8aJVi8Z2vvDSoVvCAV16D5jLcPzItS86EojO+p5yw5DDCakIbCdC
	 uDA7f0oS8i29LKJV724dmx85sHqKA14tjFqITDp8vRb8dfZu8WBgwU1FYXq0TYmRGR
	 7tSa/jZjNfXa/T7/J/CXr2wjq9OOfmF2PhtvRmpH6VXO/pNGCEo0ysFPCgbJcswH3+
	 8pSQxW9Jh3lYLdHalhcMBeJUrFP7jE5aNtiOQBUuA7scvpAOHZqdofUGHWY2VvqQnF
	 hEcRjO6WYTf+Q==
Date: Sun, 14 Apr 2024 09:53:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <Zht9hw_DhDsaTuEP@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <Zhg9DXzagPbpNGH1@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zhg9DXzagPbpNGH1@bombadil.infradead.org>
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

On Thu, Apr 11, 2024 at 12:42:05PM -0700, Luis Chamberlain wrote:
> On Thu, Apr 11, 2024 at 07:00:41PM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > module_alloc() is used everywhere as a mean to allocate memory for code.
> > 
> > Beside being semantically wrong, this unnecessarily ties all subsystems
> > that need to allocate code, such as ftrace, kprobes and BPF to modules and
> > puts the burden of code allocation to the modules code.
> > 
> > Several architectures override module_alloc() because of various
> > constraints where the executable memory can be located and this causes
> > additional obstacles for improvements of code allocation.
> > 
> > Start splitting code allocation from modules by introducing execmem_alloc()
> > and execmem_free() APIs.
> > 
> > Initially, execmem_alloc() is a wrapper for module_alloc() and
> > execmem_free() is a replacement of module_memfree() to allow updating all
> > call sites to use the new APIs.
> > 
> > Since architectures define different restrictions on placement,
> > permissions, alignment and other parameters for memory that can be used by
> > different subsystems that allocate executable memory, execmem_alloc() takes
> > a type argument, that will be used to identify the calling subsystem and to
> > allow architectures define parameters for ranges suitable for that
> > subsystem.
> 
> It would be good to describe this is a non-fuctional change.

Ok.
 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> 
> > diff --git a/mm/execmem.c b/mm/execmem.c
> > new file mode 100644
> > index 000000000000..ed2ea41a2543
> > --- /dev/null
> > +++ b/mm/execmem.c
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: GPL-2.0
> 
> And this just needs to copy over the copyright notices from the main.c file.

Will do.
 
>   Luis

-- 
Sincerely yours,
Mike.
