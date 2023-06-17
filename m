Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A78E733EF6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 08:59:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nHkTyW+h;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qjn2b6w7Zz3bwj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 16:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nHkTyW+h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qjn1j5xx5z30GJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 16:58:49 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E11B6068F;
	Sat, 17 Jun 2023 06:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9588BC433C0;
	Sat, 17 Jun 2023 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686985126;
	bh=9S4P8JW7Aw6+2ZoVDniU5EdIBLc9OdiTvqw3YA9ECf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHkTyW+hctadrgmIg2I6LaptKR6YKkmtmdcOS/HSni9feQ5p1DZtCSX6Dnam1slU3
	 FLDQnf/OEx1d4jSPxMmAwLEhSg3dDkigyXgxGzkX1VJc1UJnkk6n01fCEZ0qwx4ELP
	 r6wbjQNoXnPg5HveUgv1zS7owOZuF5kej34YgRIGZdC2tH3sGX0H+MpQa784HSW6mk
	 qjN9Au7ZhvMEPLupJ+gAv5/GudEwZVVlLyNGJFO9CDGv8qdQ0I+Zmw8CDlXcjxb8w/
	 RZuOMQ5h8Q4Z/8VeTux+zm8PEK9dnLGg98fBUnC+4CbpTq0gKeC8d5BMUXJufl+4IU
	 tPAEuFrGSOYnA==
Date: Sat, 17 Jun 2023 09:57:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
Message-ID: <20230617065759.GT52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-8-rppt@kernel.org>
 <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 16, 2023 at 01:05:29PM -0700, Song Liu wrote:
> On Fri, Jun 16, 2023 at 1:52 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >
> > The memory allocations for kprobes on arm64 can be placed anywhere in
> > vmalloc address space and currently this is implemented with an override
> > of alloc_insn_page() in arm64.
> >
> > Extend execmem_params with a range for generated code allocations and
> > make kprobes on arm64 use this extension rather than override
> > alloc_insn_page().
> >
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  arch/arm64/kernel/module.c         |  9 +++++++++
> >  arch/arm64/kernel/probes/kprobes.c |  7 -------
> >  include/linux/execmem.h            | 11 +++++++++++
> >  mm/execmem.c                       | 14 +++++++++++++-
> >  4 files changed, 33 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > index c3d999f3a3dd..52b09626bc0f 100644
> > --- a/arch/arm64/kernel/module.c
> > +++ b/arch/arm64/kernel/module.c
> > @@ -30,6 +30,13 @@ static struct execmem_params execmem_params = {
> >                         .alignment = MODULE_ALIGN,
> >                 },
> >         },
> > +       .jit = {
> > +               .text = {
> > +                       .start = VMALLOC_START,
> > +                       .end = VMALLOC_END,
> > +                       .alignment = 1,
> > +               },
> > +       },
> >  };
> 
> This is growing fast. :) We have 3 now: text, data, jit. And it will be
> 5 when we split data into rw data, ro data, ro after init data. I wonder
> whether we should still do some type enum here. But we can revisit
> this topic later.

I don't think we'd need 5. Four at most :)

I don't know yet what would be the best way to differentiate RW and RO
data, but ro_after_init surely won't need a new type. It either will be
allocated as RW and then the caller will have to set it RO after
initialization is done, or it will be allocated as RO and the caller will
have to do something like text_poke to update it.
 
> Other than that
> 
> Acked-by: Song Liu <song@kernel.org>

-- 
Sincerely yours,
Mike.
