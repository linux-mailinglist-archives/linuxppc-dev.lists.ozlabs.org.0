Return-Path: <linuxppc-dev+bounces-518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D6495EAD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsjXC4ytfz2yNt;
	Mon, 26 Aug 2024 17:50:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724658635;
	cv=none; b=CpMPrH7GEKT/Q92gGHvYOe+NkjntWDIvzyfB188q3/DKN8frvAYSdXjR3GufMW+d1B66wBmeyXAb7qlONzemORmPlEcz3xhMv2sg3Zo6X1RQl0nIqlfoHFTyiVgXXgy7YGv84yJl3Nzt15pb81QhyKABJhJ5h8hIkRC9QQsrXS1pen9SMxHhZGmPwsUjAIxIgE1wrQ/ZeoSS5NfhXLgXclCtHv9S0o1PCo5QbrUxH2VwL3IrxvQ7MyYVd5wa+OZCjvQUA3FkSmgvwTXwoKgrnp0G6pDpMf+G1x7GeM9HNrcq8fQ9ciJYhRR0PALQG3D3su0sx+BP/xzAvy4pG8ARug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724658635; c=relaxed/relaxed;
	bh=5QLg9tCESPGWijcOQ8JKikCNIoatGO4axd4GWvhdYYE=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WSGimX9zz/EhKODHZEzEaVQAnKmP63ECR14uvslLWaZUTGuHfGIxEwYOzIXpAxO8HioDbeauAW5tTsdUfn/hXVvBhuex6rZuZCuBNOXIDMTlCTj/oC9BLS+c6I8IRqM/S1kdxjGiZ7eCCuOOX21oP83hVTgjlc0DAc4hd/53lwNp21GTEnH5VwEaQKAkXH4NSa8jJUrBPyTRiR3yNizGJ+2AKh2rp+w0Bs2u9PKPEgH4ORgFZ8ZHa/L7vBwA9BuH6I5L+OG3PsAL684mFe0oRBgKr11Q/Vt+O2ohr0otJUmc0DoT+7lp9uY4SD2uraFd1ONlUzCMwdHILpICbYeVeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=kQHi3+H3; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=kQHi3+H3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsjXC1dMDz2yNc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:50:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F387A41C6D;
	Mon, 26 Aug 2024 07:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6AEC4DE00;
	Mon, 26 Aug 2024 07:50:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kQHi3+H3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724658628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5QLg9tCESPGWijcOQ8JKikCNIoatGO4axd4GWvhdYYE=;
	b=kQHi3+H3+KvCec2w2M7PlU9vKWJw4MmxxAJGd8KaVakXHO8fuSwuvQEqHIKMXDXig3bKh+
	ifsFzp2/VTZPMw2Xlzn3wncTqsCSsCMf5EeNfxJMaXsiP8wA6aGHQYqp29D4T5aekQPuNp
	d0TD8Rv85cFT6vXrvtP1KLsRK1jqaR4=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8cf2c087 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:50:28 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:50:19 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 06/17] vdso: Change getrandom's generation to unsigned
 long
Message-ID: <Zswzu1l3xO99KN3I@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <525b48eb79978ddba2d1b8ee23b27bd6c5b0b4ee.1724309198.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <525b48eb79978ddba2d1b8ee23b27bd6c5b0b4ee.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:14AM +0200, Christophe Leroy wrote:
> Performing SMP atomic operations on u64 fails on powerpc32.
> 
> Random driver generation is handled as unsigned long not u64,
> see for instance base_cnrg or struct crng.
> 
> Use the same type for vDSO's getrandom as it gets copied
> from the above. This is also in line with the local
> current_generation which is already an unsigned long.

This isn't going to work when 32-bit userspace tries to access a 64-bit
kernel.

I had "fixed" this with a vdso_kernel_ulong type way back in an earlier
version: https://lore.kernel.org/lkml/20240528122352.2485958-5-Jason@zx2c4.com/#Z31include:vdso:types.h

But tglx pointed out in that thread that this actually isn't necessary:

| All of this is pointless because if a 32-bit application runs on a
| 64-bit kernel it has to use the 64-bit 'generation'. So why on earth do
| we need magic here for a 32-bit kernel?
| 
| Just use u64 for both and spare all this voodoo. We're seriously not
| "optimizing" for 32-bit kernels.
|
| All what happens on a 32-bit kernel is that the RNG will store the
| unsigned long (32bit) generation into a 64bit variable:
| 
| 	smp_store_release(&_vdso_rng_data.generation, next_gen + 1);
| 
| As the upper 32bit are always zero, there is no issue vs. load store
| tearing at all. So there is zero benefit for this aside of slightly
| "better" user space code when running on a 32-bit kernel. Who cares?

So I just got rid of it and used a u64 as he suggested.

However, there's also an additional reason why it's not worth churning
further over this - because VM_DROPPABLE is 64-bit only (due to flags in
vma bits), likely so is vDSO getrandom() for the time being. So I think
it makes more sense to retool this series to be ppc64, and then if you
really really want 32-bit and can convince folks it matters, then all of
these parts (for example, here, the fact that the smp helper doesn't
want to tear) can be fixed up in a separate series.

Jason

