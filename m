Return-Path: <linuxppc-dev+bounces-2351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB79A26C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 17:34:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTsMv6Gxpz3bc6;
	Fri, 18 Oct 2024 02:34:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729179291;
	cv=none; b=DV3EJMBs7JUDgywaNmbVLhie/evBOoo8iHwqzZw+ayB2GTVpMktetAYh5pgACnvd+DXY0GsLnicGKzayuXARRl9gmLfUXqajIcjQsOplGNbCNEyN2CaCZm/L54H5BgzhdPSBAx0xZKge4xdaWL63AYC2ZNGkRkx5cclhkiqaEMf/z7qRZeV7szO1YVeZNSXALhqmSn5b1ZxE9gqtbgQJRzMN7ETUO3th1xOPa81SRxKTPabUgwCYRtLqAkja4h78wSZtItPXKvLrXt8M+ZOaYe0FEJFd5FGtnuTM916mVIpAGb6YChFMF4C8xPn/VSupJ1OzOYu4jKL4L5HyKRhO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729179291; c=relaxed/relaxed;
	bh=c8uvdJJtMhQM0BlLRDZIrk4gS9WA0Ztt7+5eIGzcjpA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GrBXRtgCjSy6FDt+NM467Vk0KcNSZdbFcvObzJb7/GZwJIfKQPlWapthUqeQ3vN5Xbxf3pjcf3b+QV9fYRI5gzRdG2mJuDRQbIupJfvNMATl83keQYKe8tvxjYzR8azMQmbfH+7kGta/7tFGgimjze0TOc0gdYNnVqbwPTSFVyQ/BEzHpUzxZI3upjmYIh5VjGvzPkHQ6DZqPeAB51Lu4xDzAvu0n52HUYF5MmqslokIIiBeL9PZVwxg1ospYP1cbUlLTcryI9TuhOojLlvOZk1Ry+ok+Y8yoAjKXXQufb9vOencMxpzPG2cxUPgcxWlOIBDsGd1LdgoRhegaQTfOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=o9tl=rn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=o9tl=rn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTsMs3gJvz2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 02:34:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 492E1A4412A;
	Thu, 17 Oct 2024 15:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1027DC4CECD;
	Thu, 17 Oct 2024 15:34:38 +0000 (UTC)
Date: Thu, 17 Oct 2024 11:35:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Luis Chamberlain <mcgrof@kernel.org>, Andreas
 Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav
 Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek
 <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Russell King
 <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Stafford Horne
 <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <20241017113453.685ba175@gandalf.local.home>
In-Reply-To: <ZxD0EVBoO-jcxEGE@kernel.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
	<20241016122424.1655560-7-rppt@kernel.org>
	<20241016170128.7afeb8b0@gandalf.local.home>
	<20241017093515.GU16066@noisy.programming.kicks-ass.net>
	<ZxD0EVBoO-jcxEGE@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 17 Oct 2024 14:25:05 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> With this series the module text is allocated as ROX at the first place, so
> the modifications ftrace does to module text have to either use text poking
> even before complete_formation() or deal with a writable copy like I did
> for relocations and alternatives.
> 
> I've been carrying the ftrace changes from a very old prototype and
> didn't pay enough attention to them them until Steve's complaint.
> 
> I'll look into it.

I just posted a patch where you can see the effects of these changes with
respect to ftrace patching times.

  https://lore.kernel.org/all/20241017113105.1edfa943@gandalf.local.home/

I'll be adding this to the next merge window.

-- Steve

