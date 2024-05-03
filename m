Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AA88BA715
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 08:30:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bwAj/o4z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW1CH0PCGz3bhD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 16:30:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bwAj/o4z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW1BV4Mrcz3bYR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 16:30:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9313060C1B;
	Fri,  3 May 2024 06:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10BEC4AF18;
	Fri,  3 May 2024 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714717806;
	bh=NSC6FggAGOpolvtOOTtzvsapYt7Z43kurk5+y2tvQkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bwAj/o4z6mxVc4acT1p204cItFIICj4lolnvi6/B+2I69ijFUkW4kL43jJvFF5SNj
	 UmKFV+2tDRa5Q0FuZXLq62NUw0f9R//Mhh7KhGfTfGvwsYTuWAbe8R8gF66PSIjIuK
	 FeqRVhFSGE/4hC/ZWczfyriqj4oj0hhlnmoXy3QJUtLWmPOLtD42M3kP1GFnNA0u1m
	 j7L4KS44qkZKAWDpzX4XROQYHr18P+iqEATDzZbnCq6whosLlxL/Atwq7kVYkiGMwb
	 BfuhaXRN8F5uX61hlrlpunm62OWFEbNCk5y1p4CaZ97gubj5n8xiuGbc1yDd9WEY0K
	 w1DM+OB1PDqTw==
Date: Fri, 3 May 2024 09:28:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Liviu Dudau <liviu@dudau.co.uk>
Subject: Re: [PATCH v7 00/16] mm: jit/text allocator
Message-ID: <ZjSECeooxZELXSC1@kernel.org>
References: <20240429121620.1186447-1-rppt@kernel.org>
 <Zi_K4K-j-VB_WI4i@bombadil.infradead.org>
 <ZjQYvOYgURx9/+d0@bart.dudau.co.uk>
 <ZjQcmcA0sNH7jfD7@bombadil.infradead.org>
 <ZjQuggSFcO8FXSd2@bart.dudau.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjQuggSFcO8FXSd2@bart.dudau.co.uk>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Philippe =?iso-8859-1?Q?Mathieu-Daud=E
 9?= <philmd@linaro.org>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 03, 2024 at 01:23:30AM +0100, Liviu Dudau wrote:
> On Thu, May 02, 2024 at 04:07:05PM -0700, Luis Chamberlain wrote:
> > On Thu, May 02, 2024 at 11:50:36PM +0100, Liviu Dudau wrote:
> > > On Mon, Apr 29, 2024 at 09:29:20AM -0700, Luis Chamberlain wrote:
> > > > On Mon, Apr 29, 2024 at 03:16:04PM +0300, Mike Rapoport wrote:
> > > > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > > > 
> > > > > Hi,
> > > > > 
> > > > > The patches are also available in git:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v7
> > > > > 
> > > > > v7 changes:
> > > > > * define MODULE_{VADDR,END} for riscv32 to fix the build and avoid
> > > > >   #ifdefs in a function body
> > > > > * add Acks, thanks everybody
> > > > 
> > > > Thanks, I've pushed this to modules-next for further exposure / testing.
> > > > Given the status of testing so far with prior revisions, in that only a
> > > > few issues were found and that those were fixed, and the status of
> > > > reviews, this just might be ripe for v6.10.
> > > 
> > > Looks like there is still some work needed. I've picked up next-20240501
> > > and on arch/mips with CONFIG_MODULE_COMPRESS_XZ=y and CONFIG_MODULE_DECOMPRESS=y
> > > I fail to load any module:
> > > 
> > > # modprobe rfkill
> > > [11746.539090] Invalid ELF header magic: != ELF
> > > [11746.587149] execmem: unable to allocate memory
> > > modprobe: can't load module rfkill (kernel/net/rfkill/rfkill.ko.xz): Out of memory
> > > 
> > > The (hopefully) relevant parts of my .config:
> > 
> > Thanks for the report! Any chance we can get you to try a bisection? I
> > think it should take 2-3 test boots. To help reduce scope you try modules-next:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=modules-next
> > 
> > Then can you check by resetting your tree to commmit 3fbe6c2f820a76 (mm:
> > introduce execmem_alloc() and execmem_free()"). I suspect that should
> > boot, so your bad commit would be the tip 3c2c250cb3a5fbb ("bpf: remove
> > CONFIG_BPF_JIT dependency on CONFIG_MODULES of").
> > 
> > That gives us only a few commits to bisect:
> > 
> > git log --oneline 3fbe6c2f820a76bc36d5546bda85832f57c8fce2..
> > 3c2c250cb3a5 (HEAD -> modules-next, korg/modules-next) bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
> > 11e8e65cce5c kprobes: remove dependency on CONFIG_MODULES
> > e10cbc38697b powerpc: use CONFIG_EXECMEM instead of CONFIG_MODULES where appropriate
> > 4da3d38f24c5 x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
> > 13ae3d74ee70 arch: make execmem setup available regardless of CONFIG_MODULES
> > 460bbbc70a47 powerpc: extend execmem_params for kprobes allocations
> > e1a14069b5b4 arm64: extend execmem_info for generated code allocations
> > 971e181c6585 riscv: extend execmem_params for generated code allocations
> > 0fa276f26721 mm/execmem, arch: convert remaining overrides of module_alloc to execmem
> > 022cef244287 mm/execmem, arch: convert simple overrides of module_alloc to execmem
> > 
> > With 2-3 boots we should be to tell which is the bad commit.
> 
> Looks like 0fa276f26721 is the first bad commit.
> 
> $ git bisect log
> # bad: [3c2c250cb3a5fbbccc4a4ff4c9354c54af91f02c] bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
> # good: [3fbe6c2f820a76bc36d5546bda85832f57c8fce2] mm: introduce execmem_alloc() and execmem_free()
> git bisect start '3c2c250cb3a5' '3fbe6c2f820a76'
> # bad: [460bbbc70a47e929b1936ca68979f3b79f168fc6] powerpc: extend execmem_params for kprobes allocations
> git bisect bad 460bbbc70a47e929b1936ca68979f3b79f168fc6
> # bad: [0fa276f26721e0ffc2ae9c7cf67dcc005b43c67e] mm/execmem, arch: convert remaining overrides of module_alloc to execmem
> git bisect bad 0fa276f26721e0ffc2ae9c7cf67dcc005b43c67e
> # good: [022cef2442870db738a366d3b7a636040c081859] mm/execmem, arch: convert simple overrides of module_alloc to execmem
> git bisect good 022cef2442870db738a366d3b7a636040c081859
> # first bad commit: [0fa276f26721e0ffc2ae9c7cf67dcc005b43c67e] mm/execmem, arch: convert remaining overrides of module_alloc to execmem
> 
> Maybe MIPS also needs a ARCH_WANTS_EXECMEM_LATE?

I don't think so. It rather seems there's a bug in the initialization of
the defaults in execmem. This should fix it:

diff --git a/mm/execmem.c b/mm/execmem.c
index f6dc3fabc1ca..0c4b36bc6d10 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -118,7 +118,6 @@ static void __init __execmem_init(void)
 		info->ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
 		info->ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL_EXEC;
 		info->ranges[EXECMEM_DEFAULT].alignment = 1;
-		return;
 	}
 
 	if (!execmem_validate(info))
 
> Best regards,
> Liviu

-- 
Sincerely yours,
Mike.
