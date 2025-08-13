Return-Path: <linuxppc-dev+bounces-10927-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42ACB243F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 10:16:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c21RL28LVz30Vf;
	Wed, 13 Aug 2025 18:16:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755072974;
	cv=none; b=H82y+gqFVP9jRe85mUOoXnHiBK3QI6A+8y9oQbYfnlSO68s7I/zIs7pZcuQKEx3hjMZ59Wb2Dg6tZ6BQkqgcgXFRgkZknTqdy8/06bej3MOByJMBtoNqeem8UoTbnUHDIU/uXA3ok7HLbD/vz4C39BctfnEHoWeWpehWdPOoTeoKAI3+LstULA/Yonx/y54mVElZ1U7jxRLoXIO7WUbIAvfej2jKpD7mpNewVZ2gbZLBpDNQMUVDuVAKLGxZpkmE9LuZ9FfjghDnqykmKKTEkkPu2aUUb5JD4FF7vove1o6eXlZmKU6Itg0pRy+ouJdXUsUDKZVwzFJdfP68wbMWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755072974; c=relaxed/relaxed;
	bh=vgBW8b/WLrVQq0BHMU+zEk/Lyyfrm6a/mGbcYhX7PWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V52STy18oc7zcqlV3FPFXizkEAc5eiVIeRKHnMNwS7kD8udXs2y7GUcQ/uU/Lxs7VqHNqMgTgeulDlWh2JwLL0MXKWl/y9J6FRy+1Ha8zJTF8dCIu2I8paU7dP6XIu25j5tBqeacdDheBCbA/TOKsTB5TcYpxC8GhtYDinu+wxHTW5sqyCQ7naq+hyvz/GRQynHPs9B3W84Gee+q0t1d5u3E3m97qzKVxS75W/ydcSpniliGGproUczYnrBvCBhTmTLvqqdMpigPWO4gCL0cyWpkevxLISh9FfTeQjnrHEksEcsEt+2QwvoCR8SplkDsxzbXLwFvd5wZKjnsDFPdnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=t3ZaanvF; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E1zvWv48; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=t3ZaanvF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E1zvWv48;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 95494 seconds by postgrey-1.37 at boromir; Wed, 13 Aug 2025 18:16:10 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c21RG1vXHz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 18:16:10 +1000 (AEST)
Date: Wed, 13 Aug 2025 10:16:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755072965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgBW8b/WLrVQq0BHMU+zEk/Lyyfrm6a/mGbcYhX7PWw=;
	b=t3ZaanvFJHTW1l1H2nSwoa1VFh8EVFo/BJn0UMRG7bq78PXYOpzqMO9UGefI5UiLZP7nNe
	J1FX1/E5cqcFOVpKvUjolk1j8zY71ykS0B7X6UJ1jM73mZGhOMT+2RFDhdp4Y1WmHG3lB8
	fhvgGlk/PFabS5Cn+w3uMjkgmqVzkQuRRvX4xJrjg/8hJ+0j7jOT/qLXJIWkp6a9jfxObj
	LUOs4JziO5PF87uDbwzJHBzRMHIM1CkGRGPGIwWfVdP7ckTLMMlHtUDzc+O5vxoBEjlmG7
	1skI/bKKNj/R2CTmQujVy01wAp2WhS97QfxNvozWzsRXygdxqvZz7+ZCEZyixQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755072965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgBW8b/WLrVQq0BHMU+zEk/Lyyfrm6a/mGbcYhX7PWw=;
	b=E1zvWv48KJJ+SOu4RstGU/Hts0jpCLaRVEpYFntAu8DSCAbOKCuCF3vYrHswu5Uo/Nk8OK
	GMt5eI9bpKssCIDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 00/24] vdso: Reject absolute relocations during build
Message-ID: <20250813101305-04911850-2375-4be5-9a06-ced21de3ca22@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
 <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nV62c8cVBzke73OH-sfLdgerDBGrLKTmT83+OQtK6PjA@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 12, 2025 at 01:07:34PM +0200, Miguel Ojeda wrote:
> On Tue, Aug 12, 2025 at 7:44 AM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > Kbuild and Rust folks: This contains custom definitions of hostprog
> > bindgen and rust library commands.
> > These are currently only defined inside the subsystem directory.
> > Let me know if they should go into scripts/Makefile.host.
> 
> Glad to see more Rust host progs :)
> 
> Keeping them local may be a bit easier initially to land, I guess
> (e.g. no docs), and then we can generalize when needed later.

I'm happy to do the docs etc. I only wanted to avoid doing all that work,
only for it to stay a subsystem-local solution.

Also it would be nice to have a Kconfig symbol, RUSTC_CAN_LINK or similar,
which indicates that the rust compiler can build host programs.

> By the way, for consistency with elsewhere, probably we want
> `HOSTRUSTLIB` -> `HOSTRUSTC L`. Though I am thinking to remove the `L`
> anyway since eventually a lot of code will be "lib".

Ack.

