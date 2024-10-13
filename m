Return-Path: <linuxppc-dev+bounces-2166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5D99B8D9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 10:47:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRDWt28RBz2yDY;
	Sun, 13 Oct 2024 19:47:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728809258;
	cv=none; b=L/7usxvhS+3mQyvOqENyid1+HFKeYR7659Caqf1tQM5Na713DqHZNoo9vfSb8mrLYnFNaiQmYcSq9tI6ugr5CkBfMxNSIK6yBSF7Q7qgMNmFjV6iwVZbGZbc4is7XvrWgmLT472k0lOu1WC8iIS48sQiWkFBIvM6wuw2A05YoPtOE41EyAZfx/fKsN2lXhwndPc6jFijr1L4zcTyM6mlwSPmo7GhE8fq1BIWnNt86/y8Nd0NkXlx48zn1p+BAQpsjVGRNRop6Dr8bWnq9TOy9Jcf/EsnshwuTx6/x19RakrGC2ux+1peyCAFwx/pbFe7czNlMdNJqgzeUHs9DwD8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728809258; c=relaxed/relaxed;
	bh=IdHkHhUjAfxO8/rqMjtBzvsaF8+JprszM0WexjyZHos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCkwOeTpAP38oqIi9TOHctqw07XeU8gvf5grud9lODtNw7HKfVvRqutAx7DXUYDwcR407PgFCbYQWUVKwdxBooq6Vh3/oaMA3HcoyCMx8/cA8VUyW4I3PX7mmWR0IIXn6Tv0nFe1xqh/jtPZi3yfAW4JCGyE2dCh84SOcaBe68XjGsST4Kw0W5okSw4HMkRcCzsogZQSQjOqzaznSL/brK3h4mPxpsEe1w4baR4VqVEQP1LoxCx/LlKT1zwHX4QiDiE2stGrHwK7C9cVRTRIaQmkaV/S9+WnxrfaO3R3h7sWSLFAhwnuke6VohO0QGB4g7SCoZnhQ2dKS/qTBoSEog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E8OMxiME; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E8OMxiME;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRDWs0HDmz2y8F
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 19:47:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDA245C4CBB;
	Sun, 13 Oct 2024 08:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D61C4CECD;
	Sun, 13 Oct 2024 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728809253;
	bh=oCkJ2115ozRiZPDG4YoFw9nArbpLGJybX01Iv//69uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E8OMxiMEktF+GQmyT4EDIYDJPag5y6VDyo/Ga7wsRXJJ99cwzji7jLF1sUHlppQrC
	 kfjLbesywWMnxfXjdxF/ttfJW0S6OCnAeNyYzQJk2u4D3I/IHI9w4eKpfc6/PVtfuE
	 WndRqsL5ofKVGyFE9G/gSdQ0nGfWKHlQ3BhJP58mfPjvLaZMFmHfTrH7D6YY90Mj1Y
	 Bf6s6/XciGtUwI6Emh7Lkdsn+ce052geMCuH5U+Tb+yPiRy+C2Qz+9+N2Qx0N42A/1
	 /daXS+24OOYM/5Gk5f/vkwwYyUK7ykCQAd22G6E+/Xf2yKVuhiVY41QpTSBy6H62Ks
	 p+MyUT+rRu6SQ==
Date: Sun, 13 Oct 2024 11:43:41 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <ZwuIPZkjX0CfzhjS@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZwjXz0dz-RldVNx0@infradead.org>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 12:46:23AM -0700, Christoph Hellwig wrote:
> On Thu, Oct 10, 2024 at 03:57:33PM +0300, Mike Rapoport wrote:
> > On Wed, Oct 09, 2024 at 11:58:33PM -0700, Christoph Hellwig wrote:
> > > On Wed, Oct 09, 2024 at 09:08:15PM +0300, Mike Rapoport wrote:
> > > >  /**
> > > >   * struct execmem_info - architecture parameters for code allocations
> > > > + * @fill_trapping_insns: set memory to contain instructions that will trap
> > > >   * @ranges: array of parameter sets defining architecture specific
> > > >   * parameters for executable memory allocations. The ranges that are not
> > > >   * explicitly initialized by an architecture use parameters defined for
> > > >   * @EXECMEM_DEFAULT.
> > > >   */
> > > >  struct execmem_info {
> > > > +	void (*fill_trapping_insns)(void *ptr, size_t size, bool writable);
> > > >  	struct execmem_range	ranges[EXECMEM_TYPE_MAX];
> > > 
> > > Why is the filler an indirect function call and not an architecture
> > > hook?
> > 
> > The idea is to keep everything together and have execmem_info describe all
> > that architecture needs. 
> 
> But why?  That's pretty different from our normal style of arch hooks,
> and introduces an indirect call in a security sensitive area.

Will change to __weak hook. 

-- 
Sincerely yours,
Mike.

