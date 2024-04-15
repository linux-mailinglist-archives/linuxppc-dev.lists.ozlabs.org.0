Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B98A4CE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 12:48:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DmPlp+Gw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ3nC34fBz3dWn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 20:48:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DmPlp+Gw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ3mS4LrDz3d3Q
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 20:48:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RaoQRV0+66EHGN6m1Ed2GcaJhrluoYf96YNmq1kLoeM=; b=DmPlp+GwTjnqhKH6J+sryoEdrY
	Bs7/bAK5dGN/tvOZpggS1MRWFWhxCzXtg3Kme5+z0u7Td+mbEbDDM50WNlWh1bBT5LGWUxcb+bGHm
	elRahugHUcxnEkAqkbSjVEdy4EY9K3hAojTO6rN2gFUgyfCr0rBFNu0FLG+U39e1a1V9WMtD/KjXZ
	Zp9hCayzKEN/2qzib0qaBIaeLkLJf4Ht0/GJYYy/QPucZKIP2egPoJY7GIjLvQztCzQtItKx8NefU
	MgyHUypo6g915o9W6pq9YTc3bSEs3SrWCDaJITQ7Iyh1VXY7BNiW5EFf6MEbQ4nSlfuaPnF415DH5
	Z7AJDBhA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJsN-0000000AXAk-0b8k;
	Mon, 15 Apr 2024 10:47:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C563430040C; Mon, 15 Apr 2024 12:47:50 +0200 (CEST)
Date: Mon, 15 Apr 2024 12:47:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [RFC PATCH 6/7] execmem: add support for cache of large ROX pages
Message-ID: <20240415104750.GJ40213@noisy.programming.kicks-ass.net>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-7-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411160526.2093408-7-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 07:05:25PM +0300, Mike Rapoport wrote:

> To populate the cache, a writable large page is allocated from vmalloc with
> VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> ROX.

> +static void execmem_invalidate(void *ptr, size_t size, bool writable)
> +{
> +	if (execmem_info->invalidate)
> +		execmem_info->invalidate(ptr, size, writable);
> +	else
> +		memset(ptr, 0, size);
> +}

+static void execmem_invalidate(void *ptr, size_t size, bool writeable)
+{
+       /* fill memory with INT3 instructions */
+       if (writeable)
+               memset(ptr, 0xcc, size);
+       else
+               text_poke_set(ptr, 0xcc, size);
+}

Thing is, 0xcc (aka INT3_INSN_OPCODE) is not an invalid instruction.
It raises #BP not #UD.
