Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B18038A4BA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 11:38:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WL3mGK96;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ2Cf3Bnhz3dk2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 19:38:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=WL3mGK96;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ2Bt2Zl3z3cZR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 19:37:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gJURSN8ZhZs54MX6UPe8WS991KHmcU3CMSr/wsPBYas=; b=WL3mGK96b4dqocWg2WT6S+o3Lh
	6R4hcBA6RfcHuQQK7isTyMyXCwDos8Q1HdHKBvnc80dazhTsMKZZh+HOA+2p3MytoMgm0z79fe1lO
	6VNzmYAbfQ0K4rY/gTJDrpu5Cj+twK8P8H6r2xTaYF5wANkZ19gJAqZM8x7uwfcFkyoEWlipCNTWk
	6fylSl1gmglon4eNg+zb/yC04zTO/2Lfq8d+LNZPMMi03er3jB/2uzdVHk4Db9ls69FN+sjSeErGv
	ir1OIAWRPD8gvlVd9eQwbdsiTncbhidLvva928W/3FSV8BR+sXBV2NxpcV2Vc46i56RkcJA4zwnpr
	gpLaCNRw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwIlk-0000000FOjV-0IDN;
	Mon, 15 Apr 2024 09:36:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B1DC030040C; Mon, 15 Apr 2024 11:36:55 +0200 (CEST)
Date: Mon, 15 Apr 2024 11:36:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 07/15] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20240415093655.GH40213@noisy.programming.kicks-ass.net>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-8-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-8-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev
 >, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 07:00:43PM +0300, Mike Rapoport wrote:

> +static struct execmem_info execmem_info __ro_after_init = {
> +	.ranges = {
> +		[EXECMEM_DEFAULT] = {
> +			.flags = EXECMEM_KASAN_SHADOW,
> +			.alignment = MODULE_ALIGN,
> +		},
> +	},
> +};
>  
> +struct execmem_info __init *execmem_arch_setup(void)
>  {
> +	unsigned long start, offset = 0;
>  
> +	if (kaslr_enabled())
> +		offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
>  
> +	start = MODULES_VADDR + offset;
> +	execmem_info.ranges[EXECMEM_DEFAULT].start = start;
> +	execmem_info.ranges[EXECMEM_DEFAULT].end = MODULES_END;
> +	execmem_info.ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL;
>  
> +	return &execmem_info;
>  }

struct execmem_info __init *execmem_arch_setup(void)
{
	unsigned long offset = 0;

	if (kaslr_enabled())
		offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;

	execmem_info = (struct execmem_info){
		.ranges = {
			[EXECMEM_DEFAULT] = {
				.start     = MODULES_VADDR + offset,
				.end       = MODULES_END,
				.pgprot    = PAGE_KERNEL,
				.flags     = EXECMEM_KASAN_SHADOW,
				.alignment = 1,
			},
		},
	};

	return &execmem_info;
}
