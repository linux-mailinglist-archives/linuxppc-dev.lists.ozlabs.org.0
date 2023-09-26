Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F15F07AE75D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 10:06:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RLx2TLWK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rvsks6X3mz3dCP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 18:06:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RLx2TLWK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rvsk10v68z3ckl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 18:05:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B0B9CE12BF;
	Tue, 26 Sep 2023 08:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB07C433C7;
	Tue, 26 Sep 2023 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695715524;
	bh=+Amk36a0CBOiKu5+FtjGQvFX395/lzfG991XVrUkCKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLx2TLWKtN7VAMAOy6Z+yt+5L2H3WvCxgk6fo3xEAFTVDZv0mPqQm9oryMdet+1qZ
	 obrB5TY2nE/qbUSfaI1uId3y2yRK2qnxEYYQpqf8IMXRqLpaWcyp6r1h8W5YGqDDxg
	 /Ipk9rb4CjRrT7bowSHMduOUAEuaFMTD7nXxu83iUI+O1xmmOj2PJsMoiGARKNDMsM
	 m8lXDTJPRNGVXjXTr34wm+BzlG4p+UzrUM7cd5TVxTprWIBaR+mK3IXevwTFE0yWC2
	 SIHL7mRKLFjL2iR5rLVY4OdrYFjdV9kMecllhx3OCPX+UXN+tAGab3AHw/soEZdxZb
	 tvxNd43ZGN+BA==
Date: Tue, 26 Sep 2023 11:04:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and
 execmem_free()
Message-ID: <20230926080422.GP3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-3-rppt@kernel.org>
 <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com>
 <20230923153808.GI3303@kernel.org>
 <CAPhsuW6TxG87ZBwQ_027iiE+_UmXweZEPh8wKHkHo7wA+qXZUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6TxG87ZBwQ_027iiE+_UmXweZEPh8wKHkHo7wA+qXZUg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Luis Chamberlain <mcgrof@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6
 rn_T=F6pel?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 23, 2023 at 03:36:01PM -0700, Song Liu wrote:
> On Sat, Sep 23, 2023 at 8:39 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Thu, Sep 21, 2023 at 03:34:18PM -0700, Song Liu wrote:
> > > On Mon, Sep 18, 2023 at 12:30 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > >
> > >
> > > [...]
> > >
> > > > diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
> > > > index 42215f9404af..db5561d0c233 100644
> > > > --- a/arch/s390/kernel/module.c
> > > > +++ b/arch/s390/kernel/module.c
> > > > @@ -21,6 +21,7 @@
> > > >  #include <linux/moduleloader.h>
> > > >  #include <linux/bug.h>
> > > >  #include <linux/memory.h>
> > > > +#include <linux/execmem.h>
> > > >  #include <asm/alternative.h>
> > > >  #include <asm/nospec-branch.h>
> > > >  #include <asm/facility.h>
> > > > @@ -76,7 +77,7 @@ void *module_alloc(unsigned long size)
> > > >  #ifdef CONFIG_FUNCTION_TRACER
> > > >  void module_arch_cleanup(struct module *mod)
> > > >  {
> > > > -       module_memfree(mod->arch.trampolines_start);
> > > > +       execmem_free(mod->arch.trampolines_start);
> > > >  }
> > > >  #endif
> > > >
> > > > @@ -510,7 +511,7 @@ static int module_alloc_ftrace_hotpatch_trampolines(struct module *me,
> > > >
> > > >         size = FTRACE_HOTPATCH_TRAMPOLINES_SIZE(s->sh_size);
> > > >         numpages = DIV_ROUND_UP(size, PAGE_SIZE);
> > > > -       start = module_alloc(numpages * PAGE_SIZE);
> > > > +       start = execmem_text_alloc(EXECMEM_FTRACE, numpages * PAGE_SIZE);
> > >
> > > This should be EXECMEM_MODULE_TEXT?
> >
> > This is an ftrace trampoline, so I think it should be FTRACE type of
> > allocation.
> 
> Yeah, I was aware of the ftrace trampoline. My point was, ftrace trampoline
> doesn't seem to have any special requirements. Therefore, it is probably not
> necessary to have a separate type just for it.

Since ftrace trampolines are currently used only on s390 and x86 which
enforce the same range for all executable allocations there are no special
requirements indeed. But I think that explicitly marking these allocations
as FTRACE makes it clearer what are they used for and I don't see downsides
to having a type for FTRACE.
 
> AFAICT, kprobe, ftrace, and BPF (JIT and trampoline) can share the same
> execmem_type. We may need some work for some archs, but nothing is
> fundamentally different among these.

Using the same type for all generated code implies that all types of the
generated code must live in the same range and I don't think we want to
impose this limitation on architectures.

For example, RISC-V deliberately added a range for BPF code to allow
relative addressing, see commit 7f3631e88ee6 ("riscv, bpf: Provide RISC-V
specific JIT image alloc/free").
 
> Thanks,
> Song

-- 
Sincerely yours,
Mike.
