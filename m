Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B73687AC3A4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 18:27:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q1TXhCaO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RtF0g4bBXz3cST
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 02:27:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q1TXhCaO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RtDzr0bybz30P3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Sep 2023 02:26:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 345E5B8047E;
	Sat, 23 Sep 2023 16:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE71FC433C7;
	Sat, 23 Sep 2023 16:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486404;
	bh=2piJOAc4UtCWCg8jsg4cD2ZIAtKbobPaZdza3lM1trU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q1TXhCaOUKwD4i9ywBsaA7fqhllTiUUEop2bqUBzfEeLiBK0GMJal6TZCH02gcByL
	 753jvJ06wYTsHa9bNjwSyI/D53kLiYdlB1AiITQEZl13j1+ufZspu8eHeVKiSfnDPa
	 Xnzc94p2Es7bJABHatU5GnvCNtXzBwLW/ClIG+R90OCKZCTnz4sBwhPKehiv0ITJJM
	 +UjHKGlf0w5d8TT9nGbQtF1BeBR/tDz6eSth+IHkKyRVTlF1gKubvNuOjqYZN8sC6v
	 yInZcSWBoyftCQIH5y4EX0l+ogMUchapNByEIoCoBWaItl9SpqS6bxW8Fm8jrgT5Hv
	 hjgDbZyqE8rAA==
Date: Sat, 23 Sep 2023 19:25:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v3 09/13] powerpc: extend execmem_params for kprobes
 allocations
Message-ID: <20230923162547.GN3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-10-rppt@kernel.org>
 <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW5Vg7yDn8zb5ez4JY4efoQ6aW+vYm9OL+Xr0NJnLfMYHg@mail.gmail.com>
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

On Thu, Sep 21, 2023 at 03:30:46PM -0700, Song Liu wrote:
> On Mon, Sep 18, 2023 at 12:31 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> [...]
> > @@ -135,5 +138,13 @@ struct execmem_params __init *execmem_arch_params(void)
> >
> >         range->pgprot = prot;
> >
> > +       execmem_params.ranges[EXECMEM_KPROBES].start = VMALLOC_START;
> > +       execmem_params.ranges[EXECMEM_KPROBES].start = VMALLOC_END;
> 
> .end = VMALLOC_END.

Thanks, this should have been

	execmem_params.ranges[EXECMEM_KPROBES].start = range->start;
	execmem_params.ranges[EXECMEM_KPROBES].end = range->end;

where range points to the same range as EXECMEM_MODULE_TEXT.

 
> Thanks,
> Song
> 
> > +
> > +       if (strict_module_rwx_enabled())
> > +               execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_ROX;
> > +       else
> > +               execmem_params.ranges[EXECMEM_KPROBES].pgprot = PAGE_KERNEL_EXEC;
> > +
> >         return &execmem_params;
> >  }
> > --
> > 2.39.2
> >
> >

-- 
Sincerely yours,
Mike.
