Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C797336C7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 18:54:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f7uDVOP+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjQJ04sQqz3brP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 02:54:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=f7uDVOP+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.63; helo=out-63.mta0.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 352 seconds by postgrey-1.37 at boromir; Sat, 17 Jun 2023 02:54:08 AEST
Received: from out-63.mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjQH40Tgkz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 02:54:07 +1000 (AEST)
Date: Fri, 16 Jun 2023 12:48:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1686934088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IfKIglpY59qnffneasZzBrgWBI/BVVKcO3nvK+88q6Q=;
	b=f7uDVOP+LriTx1GPKpO/iGQAeI7fAgmRpvVnoi5jo3ti6yVsQ9wInwSxipV6MgfOy574mI
	FDCFPj1N9Nd5bgTFZS6HIo1mpnuNsg8Mx89vQT9KdcpGA0IcSmQVrnh8mL+CQCqd9x3abe
	jZmmh6fZtZim0+prcqCTRKU0uIKCYhg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and
 jit_text_alloc()
Message-ID: <ZIySQgafdTHk5Yet@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616085038.4121892-3-rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 11:50:28AM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> module_alloc() is used everywhere as a mean to allocate memory for code.
> 
> Beside being semantically wrong, this unnecessarily ties all subsystems
> that need to allocate code, such as ftrace, kprobes and BPF to modules
> and puts the burden of code allocation to the modules code.
> 
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
> 
> Start splitting code allocation from modules by introducing
> execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free() APIs.
> 
> Initially, execmem_text_alloc() and jit_text_alloc() are wrappers for
> module_alloc() and execmem_free() and jit_free() are replacements of
> module_memfree() to allow updating all call sites to use the new APIs.
> 
> The intention semantics for new allocation APIs:
> 
> * execmem_text_alloc() should be used to allocate memory that must reside
>   close to the kernel image, like loadable kernel modules and generated
>   code that is restricted by relative addressing.
> 
> * jit_text_alloc() should be used to allocate memory for generated code
>   when there are no restrictions for the code placement. For
>   architectures that require that any code is within certain distance
>   from the kernel image, jit_text_alloc() will be essentially aliased to
>   execmem_text_alloc().
> 
> The names execmem_text_alloc() and jit_text_alloc() emphasize that the
> allocated memory is for executable code, the allocations of the
> associated data, like data sections of a module will use
> execmem_data_alloc() interface that will be added later.

I like the API split - at the risk of further bikeshedding, perhaps
near_text_alloc() and far_text_alloc()? Would be more explicit.

Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>
