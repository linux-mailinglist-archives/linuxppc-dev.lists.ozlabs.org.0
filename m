Return-Path: <linuxppc-dev+bounces-1970-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D149986F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 15:01:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPVJ94xgWz3bfB;
	Fri, 11 Oct 2024 00:01:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728565289;
	cv=none; b=c38Ihb7S7tpTM8FM5SxLPJXxGZ5hnRMLplgazgVhafZMAvzIU/9wqW9Al/DPD2fCeg323oMxy3QTHHsGqv4ABmsKpgUZ74peqUpeDp8u2O6iygEtyHvULrwboJSu1zoEhP0Dv2CY4/vRkfIqBHewSzF6UmSIf10TfZQN+jARoXZdUlKkQfDO3Nv3pec9ydy4piaZK/y2vvi3xaifTpVqaqe/EV2dvySrBR6JIKjBw/eMdDPeUUxnCRKJ6SxmYYtU76TkMkmXXkSp8tU9dli0NmRxqbKMt8wN9KdgAGcfpGTKF8p+gLFVgK3xKl1qKvun+mQ9i/+xKInirFWqAQH3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728565289; c=relaxed/relaxed;
	bh=cPMXZCtGVsXXTQe/GGlDBbrLC+/ZwOWPH4PT2f+WeoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B03uM/S0vTqv1oEtL//EAvW74+Ee4xznN+SYp33JHPheALhLeEF+JofQY9QqnacGEryRwC51ZGDzl3OZl2npBFzFQuhjnnnWH78xOER+CVYfmiR/i/+TPi9hRr9IoXQWXqnBUV5wc+Rdcz0iMQyz39LrFhiRZGk9UcV7Y3EXBZKFTKEXBBIDG6+7hEMQ3XZAhLJ3Hfgp/Sj3oQGnPIJFhF3zeYHae3Mgw3NZ7JTAQjxTPMgslM4koB7x5NhmKk13ZeUGm2tJ8p9MITz7Hblds85NiQNM4yWi1WQuNBWYFwBniUIceHQULd/LiPs+W1oHMlg4S3KJNeFg6flP+LbBrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i15xpEq/; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i15xpEq/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPVJ83VlBz3bdq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 00:01:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 645C55C57C3;
	Thu, 10 Oct 2024 13:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F0EC4CEC5;
	Thu, 10 Oct 2024 13:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728565283;
	bh=0gFND+MAHX6q3fPU9Dm7aa3AX+VkNdk2ZdK9663ePGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i15xpEq/kuFAv6DlXG15A1e80Zkeyfpm7KcH2z/4b7LHy0huNtJIfhTPl8l4m2Thz
	 DrC+EerzAtj77QkSwvdLuoM9HsdVcSXAYblfY52ni7z3rWCwNvYecLnzzamyv05TxQ
	 MvyRQw4iBhqZGVncP0l5I4u44ZK9GkUbVv2NjZJ1KmbX6KkRkPzCVKd/P5aEdD5W04
	 r/juMpxct8TYbYtPQygo8mwFvlF95PkeOYNJV8aiyjpOL0HlbI0t0P6KYVnwxFYXRs
	 bP4FdthxlHe3zfpEHTln3UXCWui5XHPdWaBkcJjwrkqkqBVwNb4EXbX5FI3Wx8W6oT
	 ueyyZehAwF8+A==
Date: Thu, 10 Oct 2024 15:57:33 +0300
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
Message-ID: <ZwfPPZrxHzQgYfx7@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
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
In-Reply-To: <Zwd7GRyBtCwiAv1v@infradead.org>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 09, 2024 at 11:58:33PM -0700, Christoph Hellwig wrote:
> On Wed, Oct 09, 2024 at 09:08:15PM +0300, Mike Rapoport wrote:
> >  /**
> >   * struct execmem_info - architecture parameters for code allocations
> > + * @fill_trapping_insns: set memory to contain instructions that will trap
> >   * @ranges: array of parameter sets defining architecture specific
> >   * parameters for executable memory allocations. The ranges that are not
> >   * explicitly initialized by an architecture use parameters defined for
> >   * @EXECMEM_DEFAULT.
> >   */
> >  struct execmem_info {
> > +	void (*fill_trapping_insns)(void *ptr, size_t size, bool writable);
> >  	struct execmem_range	ranges[EXECMEM_TYPE_MAX];
> 
> Why is the filler an indirect function call and not an architecture
> hook?

The idea is to keep everything together and have execmem_info describe all
that architecture needs. 

-- 
Sincerely yours,
Mike.

