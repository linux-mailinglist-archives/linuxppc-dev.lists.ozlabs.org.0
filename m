Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1F58C8995
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 17:47:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qPsMCEt7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgrvK4Q0Dz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 01:47:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qPsMCEt7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgrtX3WThz2xjM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 01:47:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D514961DEB;
	Fri, 17 May 2024 15:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111FAC4AF67;
	Fri, 17 May 2024 15:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715960804;
	bh=EpkhHazhMZ2fwuDobsplhqZvRLo+YDrsHfPiI4NpGv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPsMCEt72a5yEc9EgEt6r+yjYEkV9BPAe1xRO8Mnx0FWUaiC9lvILRG04VRJZWw48
	 6oi3NhTWACIBMVCpaYFZBzGgjvog9Y2TBWGjwbtg4as/XPHXHwLo0KeYmlix1Tn8jJ
	 4VeuQ6blAMOigvYJG5R5zp9Slb7rxBGhcGmnSRhVLw3HY2TMrkHzFxNCfy5TM2KOl7
	 3goZJdJ9Tr8Zr9DvcjkvtgL8pUnnLDDUJrwFLygDVMOs6MaI5wNJFVtqt+sDPTLZKE
	 8D0fBgS7iYh917OFn63YR+c8+L84i4xjQMciA0V/P7pqzz6WoJLNRgmPCqv4y8iZTU
	 E4tvvudi2KGsA==
Date: Fri, 17 May 2024 16:46:32 +0100
From: Will Deacon <will@kernel.org>
To: Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH RESEND v8 16/16] bpf: remove CONFIG_BPF_JIT dependency on
 CONFIG_MODULES of
Message-ID: <20240517154632.GA320@willie-the-truck>
References: <20240505160628.2323363-1-rppt@kernel.org>
 <20240505160628.2323363-17-rppt@kernel.org>
 <7983fbbf-0127-457c-9394-8d6e4299c685@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7983fbbf-0127-457c-9394-8d6e4299c685@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liviu Dudau <liviu@dudau.co.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@l
 inaro.org>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Klara,

On Fri, May 17, 2024 at 01:00:31AM +0200, Klara Modin wrote:
> On 2024-05-05 18:06, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > BPF just-in-time compiler depended on CONFIG_MODULES because it used
> > module_alloc() to allocate memory for the generated code.
> > 
> > Since code allocations are now implemented with execmem, drop dependency of
> > CONFIG_BPF_JIT on CONFIG_MODULES and make it select CONFIG_EXECMEM.
> > 
> > Suggested-by: Björn Töpel <bjorn@kernel.org>
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >   kernel/bpf/Kconfig | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
> > index bc25f5098a25..f999e4e0b344 100644
> > --- a/kernel/bpf/Kconfig
> > +++ b/kernel/bpf/Kconfig
> > @@ -43,7 +43,7 @@ config BPF_JIT
> >   	bool "Enable BPF Just In Time compiler"
> >   	depends on BPF
> >   	depends on HAVE_CBPF_JIT || HAVE_EBPF_JIT
> > -	depends on MODULES
> > +	select EXECMEM
> >   	help
> >   	  BPF programs are normally handled by a BPF interpreter. This option
> >   	  allows the kernel to generate native code when a program is loaded
> 
> This does not seem to work entirely. If build with BPF_JIT without module
> support for my Raspberry Pi 3 B I get warnings in my kernel log (easiest way
> to trigger it seems to be trying to ssh into it, which fails).

Thanks for the report. I was able to reproduce this using QEMU and it
looks like the problem is because bpf_arch_text_copy() silently fails
to write to the read-only area as a result of patch_map() faulting and
the resulting -EFAULT being chucked away.

Please can you try the diff below?

Will

--->8

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 255534930368..94b9fea65aca 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -36,7 +36,7 @@ static void __kprobes *patch_map(void *addr, int fixmap)
 
        if (image)
                page = phys_to_page(__pa_symbol(addr));
-       else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
+       else if (IS_ENABLED(CONFIG_EXECMEM))
                page = vmalloc_to_page(addr);
        else
                return addr;

