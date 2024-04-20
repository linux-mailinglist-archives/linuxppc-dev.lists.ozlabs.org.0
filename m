Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318728ABA23
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 09:35:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HstIwZ4k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VM3G95s5Cz3d8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Apr 2024 17:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HstIwZ4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VM3FP035Cz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Apr 2024 17:35:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F15A6CE10BD;
	Sat, 20 Apr 2024 07:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB26C113CE;
	Sat, 20 Apr 2024 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713598501;
	bh=YQ9KfPtm5Gq9HYepBoPJrHlxAcwZYbjakD5piFpGBCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HstIwZ4kXYt594F3dTAKefbjqk59LgLelJ4wfeugjHKdccg9U6QSsThvKUdOj6kpr
	 cxBq3QX4LKiL1ekSZ4hlwHrg2Qo19wEMdjfcoqJC1hKB987QXK8Wq3oegsKl2zZTfI
	 0ahwnVH2zTwg0WMFDB5bQY2DWepkh6sfONxxfG+SnniZiiLcfZnS8gmDD4/taXFr4a
	 gNoyuT99b/yZU19nTHh4Wm4L6MjmbQoSYrPwuVYcHB2CCTGISZcttYnTQA36iEYp8c
	 S1AEVNMPdbCPnyweb2c/fhVBUzL5EOQDTyFmN+U+fX6hUzHCENDjnN15hBAkD3dzc1
	 3OfMh4fyGR7Ag==
Date: Sat, 20 Apr 2024 10:33:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-ID: <ZiNv0jY7Ebw75iQl@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-15-rppt@kernel.org>
 <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
 <ZiKSffcTiP2c6fbs@kernel.org>
 <321def3e-8bf1-4920-92dd-037b20f1272d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <321def3e-8bf1-4920-92dd-037b20f1272d@csgroup.eu>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "x86@kernel.org" <x86@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Song Liu <song@kernel.org>, Donald Dutile <ddutile@redhat.com>, Luis Chamberlain <mcgrof@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Nadav Amit <nadav.amit@gmail.com>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, Masami Hiramats
 u <masami.hiramatsu@gmail.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Puranjay Mohan <puranjay12@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Eric Chanudet <echanude@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 19, 2024 at 03:59:40PM +0000, Christophe Leroy wrote:
> 
> 
> Le 19/04/2024 à 17:49, Mike Rapoport a écrit :
> > Hi Masami,
> > 
> > On Thu, Apr 18, 2024 at 06:16:15AM +0900, Masami Hiramatsu wrote:
> >> Hi Mike,
> >>
> >> On Thu, 11 Apr 2024 19:00:50 +0300
> >> Mike Rapoport <rppt@kernel.org> wrote:
> >>
> >>> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >>>
> >>> kprobes depended on CONFIG_MODULES because it has to allocate memory for
> >>> code.
> >>>
> >>> Since code allocations are now implemented with execmem, kprobes can be
> >>> enabled in non-modular kernels.
> >>>
> >>> Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes inside
> >>> modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
> >>> dependency of CONFIG_KPROBES on CONFIG_MODULES.
> >>
> >> Thanks for this work, but this conflicts with the latest fix in v6.9-rc4.
> >> Also, can you use IS_ENABLED(CONFIG_MODULES) instead of #ifdefs in
> >> function body? We have enough dummy functions for that, so it should
> >> not make a problem.
> > 
> > The code in check_kprobe_address_safe() that gets the module and checks for
> > __init functions does not compile with IS_ENABLED(CONFIG_MODULES).
> > I can pull it out to a helper or leave #ifdef in the function body,
> > whichever you prefer.
> 
> As far as I can see, the only problem is MODULE_STATE_COMING.
> Can we move 'enum module_state' out of #ifdef CONFIG_MODULES in module.h  ?

There's dereference of 'struct module' there:
 
		(*probed_mod)->state != MODULE_STATE_COMING) {
			...
		}

so moving out 'enum module_state' won't be enough.
 
> >   
> >> -- 
> >> Masami Hiramatsu
> > 

-- 
Sincerely yours,
Mike.
