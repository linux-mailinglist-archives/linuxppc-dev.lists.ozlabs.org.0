Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDBD8BA3BB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 01:08:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lb7IPdzU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVqNy1MPqz3c2Z
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 09:08:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVqMf2Vdvz3cTx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 09:07:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Ggldfb+SnGyHf9Y0PSAxHLGif2nJQj+Ec7fEJVGb75o=; b=Lb7IPdzUBf5fxuHKvzI9o6uLSf
	RnddZfhFt7Wuoo+yO08qYqKgdD9hHqwCFkcXYKBIB+4X+0JdnnJtpsqFaMT0wnnv6M9IkA/gRz3dO
	CfH7Qf8EWypK6L/TUeZ0Du7foM4ykeRc3vnVXR/Q8UVZHuQgHqu0NqfWmBjcCr8SvcyvuW4Mkqc28
	xofGGkYwiKsmCUnJHJzx95tE5MA+DQjtoUN9fqejczoSwHyZ+Ikhq12KowJl3pBhgYGyiVQ4bqUvD
	yp2jYj6J2Re5TMWfN03xgZqm/nkb4xW8EoAJALaAt82gNWBFuA9GWVogzaVAH0hDHMU3YDgdcYW0+
	OkmsCkaw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2fW5-0000000ECkp-3WzA;
	Thu, 02 May 2024 23:07:05 +0000
Date: Thu, 2 May 2024 16:07:05 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Liviu Dudau <liviu@dudau.co.uk>
Subject: Re: [PATCH v7 00/16] mm: jit/text allocator
Message-ID: <ZjQcmcA0sNH7jfD7@bombadil.infradead.org>
References: <20240429121620.1186447-1-rppt@kernel.org>
 <Zi_K4K-j-VB_WI4i@bombadil.infradead.org>
 <ZjQYvOYgURx9/+d0@bart.dudau.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjQYvOYgURx9/+d0@bart.dudau.co.uk>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, linux-mm@kvack.org, netdev@v
 ger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 02, 2024 at 11:50:36PM +0100, Liviu Dudau wrote:
> On Mon, Apr 29, 2024 at 09:29:20AM -0700, Luis Chamberlain wrote:
> > On Mon, Apr 29, 2024 at 03:16:04PM +0300, Mike Rapoport wrote:
> > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > 
> > > Hi,
> > > 
> > > The patches are also available in git:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v7
> > > 
> > > v7 changes:
> > > * define MODULE_{VADDR,END} for riscv32 to fix the build and avoid
> > >   #ifdefs in a function body
> > > * add Acks, thanks everybody
> > 
> > Thanks, I've pushed this to modules-next for further exposure / testing.
> > Given the status of testing so far with prior revisions, in that only a
> > few issues were found and that those were fixed, and the status of
> > reviews, this just might be ripe for v6.10.
> 
> Looks like there is still some work needed. I've picked up next-20240501
> and on arch/mips with CONFIG_MODULE_COMPRESS_XZ=y and CONFIG_MODULE_DECOMPRESS=y
> I fail to load any module:
> 
> # modprobe rfkill
> [11746.539090] Invalid ELF header magic: != ELF
> [11746.587149] execmem: unable to allocate memory
> modprobe: can't load module rfkill (kernel/net/rfkill/rfkill.ko.xz): Out of memory
> 
> The (hopefully) relevant parts of my .config:

Thanks for the report! Any chance we can get you to try a bisection? I
think it should take 2-3 test boots. To help reduce scope you try modules-next:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=modules-next

Then can you check by resetting your tree to commmit 3fbe6c2f820a76 (mm:
introduce execmem_alloc() and execmem_free()"). I suspect that should
boot, so your bad commit would be the tip 3c2c250cb3a5fbb ("bpf: remove
CONFIG_BPF_JIT dependency on CONFIG_MODULES of").

That gives us only a few commits to bisect:

git log --oneline 3fbe6c2f820a76bc36d5546bda85832f57c8fce2..
3c2c250cb3a5 (HEAD -> modules-next, korg/modules-next) bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
11e8e65cce5c kprobes: remove dependency on CONFIG_MODULES
e10cbc38697b powerpc: use CONFIG_EXECMEM instead of CONFIG_MODULES where appropriate
4da3d38f24c5 x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
13ae3d74ee70 arch: make execmem setup available regardless of CONFIG_MODULES
460bbbc70a47 powerpc: extend execmem_params for kprobes allocations
e1a14069b5b4 arm64: extend execmem_info for generated code allocations
971e181c6585 riscv: extend execmem_params for generated code allocations
0fa276f26721 mm/execmem, arch: convert remaining overrides of module_alloc to execmem
022cef244287 mm/execmem, arch: convert simple overrides of module_alloc to execmem

With 2-3 boots we should be to tell which is the bad commit.

  Luis
