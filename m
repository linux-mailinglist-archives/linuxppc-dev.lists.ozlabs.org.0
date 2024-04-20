Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC0B8AB987
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 06:24:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YhvasTWv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VLz1y6HqZz3dHL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 14:24:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YhvasTWv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VLz1F4Vprz3c4P
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 14:24:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D0AA60C70;
	Sat, 20 Apr 2024 04:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83904C072AA;
	Sat, 20 Apr 2024 04:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713587052;
	bh=XIe/vC5nJoDDEu9/Q7ZoXeJlkdIzu3x0dG0pVHSQyaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhvasTWvPZXPkThPYjnuTXJtKsDsFI6ZK4Bt9IvngW4VcopIHwZq0rN2TN47VCWUq
	 FBJkDpR2DtP+unWDJY8C7sJEQiAOVs8L9KzXsojOjPLi6kQ9YDHioYtZ6nUFM1e0iU
	 J5CLWhI8Oh/UQKju6kDG7HnVFfwfwBxuIE1OR267WnG9gRFiBTNZwpWVx17pWQtTrY
	 fdbuHV6o8S3vVJ6wqWsJuIqtAsaxpsI2nzHYz53bqy1qeEbZ3ljz7qw9wo3USiXNjB
	 OSy86A07SSbIPPzvVI3U5+/bWUkfoO6zoETP+0NHBuzBlMRXY9HoUBu5v7wjVTOH+s
	 DowdwAPfYuE4g==
Date: Sat, 20 Apr 2024 07:22:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <ZiNDGjkcqEPqruza@kernel.org>
References: <ZiE91CJcNw7gBj9g@kernel.org>
 <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
 <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org>
 <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org>
 <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
 <ZiLNGgVSQ7_cg58y@kernel.org>
 <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
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

On Fri, Apr 19, 2024 at 02:42:16PM -0700, Song Liu wrote:
> On Fri, Apr 19, 2024 at 1:00 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Fri, Apr 19, 2024 at 10:32:39AM -0700, Song Liu wrote:
> > > On Fri, Apr 19, 2024 at 10:03 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > [...]
> > > > > >
> > > > > > [1] https://lore.kernel.org/all/20240411160526.2093408-1-rppt@kernel.org
> > > > >
> > > > > For the ROX to work, we need different users (module text, kprobe, etc.) to have
> > > > > the same execmem_range. From [1]:
> > > > >
> > > > > static void *execmem_cache_alloc(struct execmem_range *range, size_t size)
> > > > > {
> > > > > ...
> > > > >        p = __execmem_cache_alloc(size);
> > > > >        if (p)
> > > > >                return p;
> > > > >       err = execmem_cache_populate(range, size);
> > > > > ...
> > > > > }
> > > > >
> > > > > We are calling __execmem_cache_alloc() without range. For this to work,
> > > > > we can only call execmem_cache_alloc() with one execmem_range.
> > > >
> > > > Actually, on x86 this will "just work" because everything shares the same
> > > > address space :)
> > > >
> > > > The 2M pages in the cache will be in the modules space, so
> > > > __execmem_cache_alloc() will always return memory from that address space.
> > > >
> > > > For other architectures this indeed needs to be fixed with passing the
> > > > range to __execmem_cache_alloc() and limiting search in the cache for that
> > > > range.
> > >
> > > I think we at least need the "map to" concept (initially proposed by Thomas)
> > > to get this work. For example, EXECMEM_BPF and EXECMEM_KPROBE
> > > maps to EXECMEM_MODULE_TEXT, so that all these actually share
> > > the same range.
> >
> > Why?
> 
> IIUC, we need to update __execmem_cache_alloc() to take a range pointer as
> input. module text will use "range" for EXECMEM_MODULE_TEXT, while kprobe
> will use "range" for EXECMEM_KPROBE. Without "map to" concept or sharing
> the "range" object, we will have to compare different range parameters to check
> we can share cached pages between module text and kprobe, which is not
> efficient. Did I miss something?

We can always share large ROX pages as long as they are within the correct
address space. The permissions for them are ROX and the alignment
differences are due to KASAN and this is handled during allocation of the
large page to refill the cache. __execmem_cache_alloc() only needs to limit
the search for the address space of the range.

And regardless, they way we deal with sharing of the cache can be sorted
out later.

> Thanks,
> Song

-- 
Sincerely yours,
Mike.
