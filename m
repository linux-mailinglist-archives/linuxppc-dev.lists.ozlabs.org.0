Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214688AA330
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 21:46:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CmVx6dRz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VL7ZC6SD8z3dJV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Apr 2024 05:46:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CmVx6dRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VL7YW4z8zz3cYj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Apr 2024 05:45:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB01D618E2;
	Thu, 18 Apr 2024 19:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87BEC113CC;
	Thu, 18 Apr 2024 19:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713469548;
	bh=dHO0bamdxUUeACG8WtZho+GCcL4yBYsb4entMWbbmyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmVx6dRzicEYeby+eqehWh43quHdNoBbYY/i36pebwlC3hu3ZmeS4VjBXURj7aNy3
	 iceEu2pMqBEVdzfyoNs6zYPwdeFEVjMU4daLSOF+34RPv/VgtKgm1TQzPbhCvKJCzp
	 PwHKW3yddAFwEE2clGQPe9VCz0EWlv35PYz4PkEEkLTMMrd+GAZOMmGABmKaUl5Y8d
	 4udjlt3Z97dUrMWxxJyIATuY3MTqmnZM5WdZYeq2ykeLqUHwwS1ZlLE9RAdOJI4t5m
	 dZHSPXrDPE8q2nmOH9o+Xw5o1ED5ivvKuuyvGRHdoAhgoYmdvYsWWSvRA9smcyAVNW
	 9J1gVzjdVbV+Q==
Date: Thu, 18 Apr 2024 22:44:31 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [RFC PATCH 3/7] module: [
Message-ID: <ZiF4H5_tGx7woaXH@kernel.org>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-4-rppt@kernel.org>
 <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
 <ZiDz4YbIHEOAnpwF@kernel.org>
 <A714B340-9EFB-4F27-9CD6-CFBC1BC9139F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A714B340-9EFB-4F27-9CD6-CFBC1BC9139F@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masa
 mi Hiramatsu <mhiramat@kernel.org>, bpf <bpf@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 18, 2024 at 10:31:16PM +0300, Nadav Amit wrote:
> 
> > On 18 Apr 2024, at 13:20, Mike Rapoport <rppt@kernel.org> wrote:
> > 
> > On Tue, Apr 16, 2024 at 12:36:08PM +0300, Nadav Amit wrote:
> >> 
> >> 
> >> 
> >> I might be missing something, but it seems a bit racy.
> >> 
> >> IIUC, module_finalize() calls alternatives_smp_module_add(). At this
> >> point, since you don’t hold the text_mutex, some might do text_poke(),
> >> e.g., by enabling/disabling static-key, and the update would be
> >> overwritten. No?
> > 
> > Right :(
> > Even worse, for UP case alternatives_smp_unlock() will "patch" still empty
> > area.
> > 
> > So I'm thinking about calling alternatives_smp_module_add() from an
> > additional callback after the execmem_update_copy().
> > 
> > Does it make sense to you?
> 
> Going over the code again - I might have just been wrong: I confused the
> alternatives and the jump-label mechanisms (as they do share a lot of
> code and characteristics).
> 
> The jump-labels are updated when prepare_coming_module() is called, which
> happens after post_relocation() [which means they would be updated using
> text_poke() “inefficiently” but should be safe].
> 
> The “alternatives” appear only to use text_poke() (in contrast for
> text_poke_early()) from very specific few flows, e.g., 
> common_cpu_up() -> alternatives_enable_smp().
> 
> Are those flows pose a problem after boot?

Yes, common_cpu_up is called  on CPU hotplug, so it's possible to have a
race between alternatives_smp_module_add() and common_cpu_up() ->
alternatives_enable_smp().

And in UP case alternatives_smp_module_add() will call
alternatives_smp_unlock() that will patch module text before it is updated.

> Anyhow, sorry for the noise.

On the contrary, I would have missed it.

-- 
Sincerely yours,
Mike.
