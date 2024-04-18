Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6FC8AA19B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 19:54:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qitx/umw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL55B1RLfz3dHC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 03:54:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qitx/umw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL54V57JDz3cP3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 03:54:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80D62618A3;
	Thu, 18 Apr 2024 17:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F12DC3277B;
	Thu, 18 Apr 2024 17:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713462839;
	bh=GVKHg9/GMb+Q7svthQO5bm+rPzNDL6zXlQZOsDeKWL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qitx/umwjvXDKNme47QxvztrUiipBcKV2Lg0Yvd1RXezrm9EMN+zfFrxXb923+dxO
	 AxZ6KgXvjlorR3mUIjvBXST4+3n8nelthPynguxJTOQoS9rNBrqZ+3MIlU37kTQ9FA
	 a4e+nx+8unMMLT17+KcFFJ93DVlkbK2eXc4Av0nU3f2Yxj+rBXrkR0WI95IANr/7qX
	 uZj4q1Xb4qjUIP87QNJk+Jgy4oid7eW9FtvEPOx7D0x1Tt1iXSqSWNLPcTP4XbQ2OW
	 z8BEya9Rxr0dlQHlDm5T4jpRs2aqcA2Iy8EkKuiv4ehWjUKDt48ywWZ7K+xjdgeN4d
	 Qxf4CJCyjHkiA==
Date: Thu, 18 Apr 2024 20:52:39 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <ZiFd567L4Zzm2okO@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
 <20240415075241.GF40213@noisy.programming.kicks-ass.net>
 <Zh1lnIdgFeM1o8S5@FVFF77S0Q05N.cambridge.arm.com>
 <Zh4nJp8rv1qRBs8m@kernel.org>
 <CAPhsuW6Pbg2k_Gu4dsBx+H8H5XCHvNdtEZJBPiG_eT0qqr9D1w@mail.gmail.com>
 <ZiE91CJcNw7gBj9g@kernel.org>
 <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
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

On Thu, Apr 18, 2024 at 09:13:27AM -0700, Song Liu wrote:
> On Thu, Apr 18, 2024 at 8:37 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > >
> > > > I'm looking at execmem_types more as definition of the consumers, maybe I
> > > > should have named the enum execmem_consumer at the first place.
> > >
> > > I think looking at execmem_type from consumers' point of view adds
> > > unnecessary complexity. IIUC, for most (if not all) archs, ftrace, kprobe,
> > > and bpf (and maybe also module text) all have the same requirements.
> > > Did I miss something?
> >
> > It's enough to have one architecture with different constrains for kprobes
> > and bpf to warrant a type for each.
> 
> AFAICT, some of these constraints can be changed without too much work.

But why?
I honestly don't understand what are you trying to optimize here. A few
lines of initialization in execmem_info?
What is the advantage in forcing architectures to have imposed limits on
kprobes or bpf allocations?

> > Where do you see unnecessary complexity?
> >
> > > IOW, we have
> > >
> > > enum execmem_type {
> > >         EXECMEM_DEFAULT,
> > >         EXECMEM_TEXT,
> > >         EXECMEM_KPROBES = EXECMEM_TEXT,
> > >         EXECMEM_FTRACE = EXECMEM_TEXT,
> > >         EXECMEM_BPF = EXECMEM_TEXT,      /* we may end up without
> > > _KPROBE, _FTRACE, _BPF */
> > >         EXECMEM_DATA,  /* rw */
> > >         EXECMEM_RO_DATA,
> > >         EXECMEM_RO_AFTER_INIT,
> > >         EXECMEM_TYPE_MAX,
> > > };
> > >
> > > Does this make sense?
> >
> > How do you suggest to deal with e.g. riscv that has separate address spaces
> > for modules, kprobes and bpf?
> 
> IIUC, modules and bpf use the same address space on riscv

Not exactly, bpf is a subset of modules on riscv.

> while kprobes use vmalloc address.

The whole point of using the entire vmalloc for kprobes is to avoid
pollution of limited modules space.
 
> Thanks,
> Song

-- 
Sincerely yours,
Mike.
