Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21D735B19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jun 2023 17:25:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kRzjt2nD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlD926txbz3bNp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 01:25:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kRzjt2nD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlD8456Gqz2y1Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 01:24:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0183660CFB;
	Mon, 19 Jun 2023 15:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA4DC433C8;
	Mon, 19 Jun 2023 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687188257;
	bh=N4a6+AKTlpfQu+hNLgDTvYGemlpqgXPewbtXySTT2Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRzjt2nDIAl4X26ojRiB8w8CJVn45eTmiPbIYkIvDYRBR/QR7IVpfAXYd9FpfNQDQ
	 OvemWMKmfnlcr5GwcS7TCX2oTJmzf2fUUsDJHf2Oq+4RHGmHWKbk0CASnuDz6Gk1Ld
	 1e26ENdIJqn1qjqL2vy8CRe3zudh+ZqjAZ7btzz+Jja4UEKxYRLaqjs+hNR8TPWi48
	 sYyUqJtdsNHbcbOzxo9zMe/AaYlu9nZhYjfHu5NSh21mKAk+otvslcioi5dkhxeNTF
	 EnxnECqDbcsPkYZvvYUeyjGiH7IzMmaAIOnWvmMc+HuAd2WDWUtK2BFwEfTtd03m+J
	 SY9K1sARFWi7g==
Date: Mon, 19 Jun 2023 18:23:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
Message-ID: <20230619152334.GC52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-7-rppt@kernel.org>
 <87jzw0qu3s.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzw0qu3s.ffs@tglx>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, linux-mm@kvack.org, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 19, 2023 at 12:32:55AM +0200, Thomas Gleixner wrote:
> Mike!
> 
> Sorry for being late on this ...
> 
> On Fri, Jun 16 2023 at 11:50, Mike Rapoport wrote:
> 
> The fact that my suggestions had a 'mod_' namespace prefix does not make
> any of my points moot.

The prefix does not matter. What matters is what we are trying to abstract.
Your suggestion is based of the memory used by modules. I'm abstracting
address spaces for different types of executable and related memory. They
are similar, yes, but they are not the same.

The TEXT, INIT_TEXT and *_DATA do not match to what we have from arch POV.
They have modules with text, rw data, ro data and ro after init data and
the memory for the generated code. The memory for modules and memory for
other users have different restrictions for their placement, so using a
single TEXT type for them is semantically wrong. BPF and kprobes do not
necessarily must be at the same address range as modules and init text does
not differ from normal text.

> Song did an extremly good job in abstracting things out, but you decided
> to ditch his ground work instead of building on it and keeping the good
> parts. That's beyond sad.

Actually not. The core idea to describe address range suitable for code
allocations with a structure and have arch code initialize this structure
at boot and be done with it is the same. But I don't think vmalloc
parameters belong there, they should be completely encapsulated in the
allocator. Having fallback range named explicitly is IMO clearer than an
array of address spaces.

I accept your point that the structures describing ranges for different
types should be unified and I've got carried away with making the wrappers
to convert that structure to parameters to the core allocation function.

I've chosen to define ranges as fields in the containing structure rather
than enum with types and an array because I strongly feel that the callers
should not care about these parameters. These parameters are defined by
architecture and the callers should not need to know how each and every
arch defines restrictions suitable for modules, bpf or kprobes.

That's also the reason to have different names for API calls, exactly to
avoid having alloc(KPROBES,...), alloc(BPF, ...), alloc(MODULES, ...) an so
on.

All in all, if I filter all the ranting, this boils down to having a
unified structure for all the address ranges and passing this structure
from the wrappers to the core alloc as is rather that translating it to
separate parameters, with which I agree.

> Thanks,
> 
>         tglx

-- 
Sincerely yours,
Mike.
