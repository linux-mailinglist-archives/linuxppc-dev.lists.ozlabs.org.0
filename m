Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 276CC7343A9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 22:38:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dfNjewHV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qk7Cb06zpz3bv3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jun 2023 06:38:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dfNjewHV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.33; helo=out-33.mta1.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
Received: from out-33.mta1.migadu.com (out-33.mta1.migadu.com [95.215.58.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qk7Bc2Jxkz2ys5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 06:37:42 +1000 (AEST)
Date: Sat, 17 Jun 2023 16:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1687034256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q0VmYCbqCGEwwRm9p2gHyBMkJehgKoo9YX+I+uEXlwI=;
	b=dfNjewHVuYudVnc8TKpcch6UyyxsC62EekInr+KCF+/d5W19oLEbYgWNkxwMPmu6LU+6YJ
	DDxDUAUrcbSRUp/oMghsBWa2J9HukZTCZ/JGCQrtkNxjPDHNM3pSHNKVBsHXTHpr3HEdfU
	c38+ELnaz0YDpRbuK0hGGk55HYtUVFk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Song Liu <song@kernel.org>
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
Message-ID: <ZI4Zifzfi/5qBNMw@moria.home.lan>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-8-rppt@kernel.org>
 <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
 <20230617065759.GT52412@kernel.org>
 <ZI3TGhJ2y5SBWmnA@moria.home.lan>
 <CAPhsuW4KDriCDfQ40MKKQ3AjyeRbEUJxjqoBLipe5AJMxY3U-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW4KDriCDfQ40MKKQ3AjyeRbEUJxjqoBLipe5AJMxY3U-w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-s390@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-modules@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 17, 2023 at 09:38:17AM -0700, Song Liu wrote:
> On Sat, Jun 17, 2023 at 8:37 AM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > On Sat, Jun 17, 2023 at 09:57:59AM +0300, Mike Rapoport wrote:
> > > > This is growing fast. :) We have 3 now: text, data, jit. And it will be
> > > > 5 when we split data into rw data, ro data, ro after init data. I wonder
> > > > whether we should still do some type enum here. But we can revisit
> > > > this topic later.
> > >
> > > I don't think we'd need 5. Four at most :)
> > >
> > > I don't know yet what would be the best way to differentiate RW and RO
> > > data, but ro_after_init surely won't need a new type. It either will be
> > > allocated as RW and then the caller will have to set it RO after
> > > initialization is done, or it will be allocated as RO and the caller will
> > > have to do something like text_poke to update it.
> >
> > Perhaps ro_after_init could use the same allocation interface and share
> > pages with ro pages - if we just added a refcount for "this page
> > currently needs to be rw, module is still loading?"
> 
> If we don't relax rules with read only, we will have to separate rw, ro,
> and ro_after_init. But we can still have page sharing:
> 
> Two modules can put rw data on the same page.
> With text poke (ro data poke to be accurate), two modules can put
> ro data on the same page.
> 
> > text_poke() approach wouldn't be workable, you'd have to audit and fix
> > all module init code in the entire kernel.
> 
> Agreed. For this reason, each module has to have its own page(s) for
> ro_after_init data.

Relaxing page permissions to allow for page sharing could also be a
config option. For archs with 64k pages it seems worthwhile.
