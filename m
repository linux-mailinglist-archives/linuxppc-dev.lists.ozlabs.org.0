Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE1B8AB418
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 19:04:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RUL9Opqg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLgwm2X9Nz3vgt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 03:04:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RUL9Opqg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLgvz3kxPz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 03:03:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F75061A85;
	Fri, 19 Apr 2024 17:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D36C3277B;
	Fri, 19 Apr 2024 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713546218;
	bh=jFxi5qZrScF2xjH3z+fMU0rA+S3WPw/R5/k/PlfLlD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RUL9Opqg9lVQKyIEyIuq2xjKwlBEmIHBH/IVoveA6aP2JLQi0uzPvTDRn7OmSzfgD
	 nIb4g/5o2RBtfUp3FCsBZLo4UMhQBN8itmVTPuHB1vCt7tnCtqGOlM7w17hYv3aiWy
	 FPRpIYW/h0QBF2/1gYcg2KSSl6cBIyHw8P1BRp78GQ/1rnAZNqj1HgINRQQE2y6kx8
	 pa/lP0BVFbrI+oqwHSJpzLJUH1OONwzfgc8jyKWmKgwbnoS/jGKAA+PE+NrL1eKBBr
	 VPLO+D3Fy9QluAkUMgIaLcYTb9+hJ5Az7wIHrpBlSplLPGXqXzT9s0UFhk3C1grs7n
	 akOPXTz5YdCXA==
Date: Fri, 19 Apr 2024 20:02:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <ZiKjmaDgz_56ovbv@kernel.org>
References: <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
 <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
 <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org>
 <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Russell King <linux@armlinux.org.uk>, linux-mm@kvack.org, Donald Dutile <ddutile@redhat.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-mips@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstree
 t@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Bjorn Topel <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 19, 2024 at 08:54:40AM -0700, Song Liu wrote:
> On Thu, Apr 18, 2024 at 11:56 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Thu, Apr 18, 2024 at 02:01:22PM -0700, Song Liu wrote:
> > > On Thu, Apr 18, 2024 at 10:54 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > >
> > > > On Thu, Apr 18, 2024 at 09:13:27AM -0700, Song Liu wrote:
> > > > > On Thu, Apr 18, 2024 at 8:37 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > > > > > >
> > > > > > > > I'm looking at execmem_types more as definition of the consumers, maybe I
> > > > > > > > should have named the enum execmem_consumer at the first place.
> > > > > > >
> > > > > > > I think looking at execmem_type from consumers' point of view adds
> > > > > > > unnecessary complexity. IIUC, for most (if not all) archs, ftrace, kprobe,
> > > > > > > and bpf (and maybe also module text) all have the same requirements.
> > > > > > > Did I miss something?
> > > > > >
> > > > > > It's enough to have one architecture with different constrains for kprobes
> > > > > > and bpf to warrant a type for each.
> > > > >
> > > > > AFAICT, some of these constraints can be changed without too much work.
> > > >
> > > > But why?
> > > > I honestly don't understand what are you trying to optimize here. A few
> > > > lines of initialization in execmem_info?
> > >
> > > IIUC, having separate EXECMEM_BPF and EXECMEM_KPROBE makes it
> > > harder for bpf and kprobe to share the same ROX page. In many use cases,
> > > a 2MiB page (assuming x86_64) is enough for all BPF, kprobe, ftrace, and
> > > module text. It is not efficient if we have to allocate separate pages for each
> > > of these use cases. If this is not a problem, the current approach works.
> >
> > The caching of large ROX pages does not need to be per type.
> >
> > In the POC I've posted for caching of large ROX pages on x86 [1], the cache is
> > global and to make kprobes and bpf use it it's enough to set a flag in
> > execmem_info.
> >
> > [1] https://lore.kernel.org/all/20240411160526.2093408-1-rppt@kernel.org
> 
> For the ROX to work, we need different users (module text, kprobe, etc.) to have
> the same execmem_range. From [1]:
> 
> static void *execmem_cache_alloc(struct execmem_range *range, size_t size)
> {
> ...
>        p = __execmem_cache_alloc(size);
>        if (p)
>                return p;
>       err = execmem_cache_populate(range, size);
> ...
> }
> 
> We are calling __execmem_cache_alloc() without range. For this to work,
> we can only call execmem_cache_alloc() with one execmem_range.

Actually, on x86 this will "just work" because everything shares the same
address space :)

The 2M pages in the cache will be in the modules space, so
__execmem_cache_alloc() will always return memory from that address space.

For other architectures this indeed needs to be fixed with passing the
range to __execmem_cache_alloc() and limiting search in the cache for that
range.
 
> Did I miss something?
> 
> Thanks,
> Song

-- 
Sincerely yours,
Mike.
