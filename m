Return-Path: <linuxppc-dev+bounces-1185-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD987971D13
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 16:49:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2V9X3CZYz2yQ9;
	Tue, 10 Sep 2024 00:49:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725893392;
	cv=none; b=cW5pscGRvpG6+HbAt9OYmbAhPZEcHaGqQm86O451ryF+lk/L0CblqeDJ7VNbC5J9HsvJNsCT9d2US1b+640Tv9mEQZFvXTh21Pex7lzS0fj+RvXd8bREvij7Q90z/gPPAPwpYtKk/vL/Lrf+OMQa/gi24WnyMaMVdvkW+TRKuhxzT+jbzqHD4utfdWESEe8uQlgkTkyspyHADSZVL2PkctkepJeGqJtLzSfzOdjUw5fA66qOU8RQ3ydFg9C7irrir33iBpRiqwtm6AhdwyXwnBaVEAw0ZkdCzo33qLwvAU+q9LMxzQiXW/bFalD6w0mB9ByCte6iAsQ7FKJ+/M9uXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725893392; c=relaxed/relaxed;
	bh=rCUjKs3zWYCyeMG5H+lBybDJNyI55woPVsrQWuULxrg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F1l+AJsgrDYsddf6x21xuoqypyKTFWi0ObFa4btD8o/2wvFwau3V4yvmmY0O8GBsGbktk/BsOnWRRgqk+0Gybfv5kXM6Sl6Ab5QrXRINO2X0T8QVD59xOHiv7+eZaygeyxvn6zv0/TWdQwuU9SE5rgccSFZdLmXiaxI1al7fRCELSqrXNbz6L4xEJA/ug0tWAAkT+hJM0DzPuy/UzDa/TqFlqGHuOy6Yn7MBicbSwmmMI13HDSl7UvQHkHsMUfcgPdi841kQttXNR9CMi+IedtZyR0H6HiqJDqVWuaXnzngTDNUGKOs0QtLtVZaIL6WhoWJArKib0xtb3jpa3nbCpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=5o0h=qh=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=5o0h=qh=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2V9W24hhz2yPM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 00:49:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B62E3A43CB7;
	Mon,  9 Sep 2024 14:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23C7C4CEC5;
	Mon,  9 Sep 2024 14:49:41 +0000 (UTC)
Date: Mon, 9 Sep 2024 10:49:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>, Andreas Larsson <andreas@gaisler.com>, Andy
 Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav
 Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Christoph Hellwig <hch@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen
 <dave.hansen@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Russell
 King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Stafford Horne
 <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas
 Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Vineet
 Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH v3 6/8] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <20240909104940.71d8464c@gandalf.local.home>
In-Reply-To: <Zt8HiAzcaZS8lHT-@kernel.org>
References: <20240909064730.3290724-1-rppt@kernel.org>
	<20240909064730.3290724-7-rppt@kernel.org>
	<20240909092923.GB4723@noisy.programming.kicks-ass.net>
	<Zt8HiAzcaZS8lHT-@kernel.org>
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

On Mon, 9 Sep 2024 17:34:48 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> > This is insane, just force BUILDTIME_MCOUNT_SORT  
> 
> The comment in ftrace.c says "... while mcount loc in modules can not be
> sorted at build time"
>  
> I don't know enough about objtool, but I'd presume it's because the sorting
> should happen after relocations, no?
> 

IIRC, the sorting at build time uses scripts/sorttable.c, which from what I
can tell, only gets called on vmlinux.

-- Steve

