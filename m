Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392067AC366
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 17:44:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UdoqwjNC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RtD320JGRz3cPT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Sep 2023 01:44:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UdoqwjNC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RtD252yBJz307V
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Sep 2023 01:43:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EECAACE1F4E;
	Sat, 23 Sep 2023 15:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A27C433C7;
	Sat, 23 Sep 2023 15:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695483816;
	bh=ljgPDKGzFtkM9CGruxS2yf0TQKHwYcBRpz7ZIM8VO3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdoqwjNCGj6+dmcR2by5om8f6OGdHooNrFAdirAK1+mff8rgXeaENEbWOfJO5o/PC
	 OJ43I0E8Te05bmcEVu+q3++C1e9dGOgWncbQbW9sES2Ibe2Pdsm+p44SaI/GSc9eJn
	 k1TIpPAI+1+0z14moXMdYfGTEFg/c4FGc6F68knV28yyNaM4SU8WYGPaWhzn5xPNAt
	 FG0AxN1gAVv9xHc/jH6GfcIvluITorwBbApgU2SfgTJcYKv7Yh/vBJZDq2ZFWWRfdD
	 gacKAomGi0R18n+DQTrEIea+0KrDaRDhkeAyfdIkOyz1+kcZ1YK3P1S2X1RDLM9+UU
	 ZFkbq4f/xAuEw==
Date: Sat, 23 Sep 2023 18:42:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and
 execmem_free()
Message-ID: <20230923154240.GK3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-3-rppt@kernel.org>
 <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4bQY5fo_+K2z4uUdd4r0wYF1eT3bAya=YqcEcmqdGXvg@mail.gmail.com>
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

On Thu, Sep 21, 2023 at 03:10:26PM -0700, Song Liu wrote:
> On Mon, Sep 18, 2023 at 12:30 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> [...]
> > +
> > +#include <linux/mm.h>
> > +#include <linux/vmalloc.h>
> > +#include <linux/execmem.h>
> > +#include <linux/moduleloader.h>
> > +
> > +static void *execmem_alloc(size_t size)
> > +{
> > +       return module_alloc(size);
> > +}
> > +
> > +void *execmem_text_alloc(enum execmem_type type, size_t size)
> > +{
> > +       return execmem_alloc(size);
> > +}
> 
> execmem_text_alloc (and later execmem_data_alloc) both take "type" as
> input. I guess we can just use execmem_alloc(type, size) for everything?

We could but I still prefer to keep this distinction.
 
> Thanks,
> Song
> 
> > +
> > +void execmem_free(void *ptr)
> > +{
> > +       /*
> > +        * This memory may be RO, and freeing RO memory in an interrupt is not
> > +        * supported by vmalloc.
> > +        */
> > +       WARN_ON(in_interrupt());
> > +       vfree(ptr);
> > +}
> > --
> > 2.39.2
> >

-- 
Sincerely yours,
Mike.
