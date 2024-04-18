Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A7D8A9EA8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 17:39:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dhagt/Ds;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL25g3GKhz3dCt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 01:39:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dhagt/Ds;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL24y6yp6z3cV6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 01:39:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD174CE188E;
	Thu, 18 Apr 2024 15:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB10C113CC;
	Thu, 18 Apr 2024 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713454751;
	bh=poikjUesrlZvYhdkYUVTGKAXtyh6o27VwcY88bzAEGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dhagt/DsCV508bBCSM8PQFh0KZ4ChVYVPTqwgApoowoaluDog1pdK/qIVJU1bAfJ1
	 yTHdqpTqCwsTRyfpVzaQYmToVgTGF005G8P5bcBRn51+TfjO6upp0QzeXZdpRVmP9T
	 DyDQSEZc+G77sXhvEvzJVgEwHd81+hiEegtvxJRrNRYHrUsgJx5AWmHmLJX+3OoPI9
	 DgUEekwf3Gv6AvfsAJ1j1lmBPCAVlRdxF5BEqB76VwjdS5tGiPR4UhLWWIRbIEiDfd
	 AIVB7M07XTdJ0VLvAnDkmSjg91AV2IlHsKb94RwxZ2UFTajWhnfg+q+QMNKv4wdsDX
	 0LvSLkPCKaqng==
Date: Thu, 18 Apr 2024 18:37:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Masami Hiramatsu <masami.hiramatsu@gmail.com>
Subject: Re: [PATCH v4 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-ID: <ZiE-UE27NalI-IeW@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-15-rppt@kernel.org>
 <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
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

Hi Masami,

On Thu, Apr 18, 2024 at 06:16:15AM +0900, Masami Hiramatsu wrote:
> Hi Mike,
> 
> On Thu, 11 Apr 2024 19:00:50 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > kprobes depended on CONFIG_MODULES because it has to allocate memory for
> > code.
> > 
> > Since code allocations are now implemented with execmem, kprobes can be
> > enabled in non-modular kernels.
> > 
> > Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes inside
> > modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
> > dependency of CONFIG_KPROBES on CONFIG_MODULES.
> 
> Thanks for this work, but this conflicts with the latest fix in v6.9-rc4.
> Also, can you use IS_ENABLED(CONFIG_MODULES) instead of #ifdefs in
> function body? We have enough dummy functions for that, so it should
> not make a problem.

I'll rebase and will try to reduce ifdefery where possible.

> Thank you,
> 
> > 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  arch/Kconfig                |  2 +-
> >  kernel/kprobes.c            | 43 +++++++++++++++++++++----------------
> >  kernel/trace/trace_kprobe.c | 11 ++++++++++
> >  3 files changed, 37 insertions(+), 19 deletions(-)
> > 
> 
> -- 
> Masami Hiramatsu

-- 
Sincerely yours,
Mike.
