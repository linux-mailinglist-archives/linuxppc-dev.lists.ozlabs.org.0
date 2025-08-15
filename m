Return-Path: <linuxppc-dev+bounces-11058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 819F1B27DDD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 12:06:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3HnH054Fz3cfR;
	Fri, 15 Aug 2025 20:06:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755252370;
	cv=none; b=dbJR2VHjNATwMaK4bc+k56EOmvylw/3ylCOMejCJdEAb1sm0OaTBRegeuz6Mjv1QgN0AGPwHYoTqvhsWfXsX1+E8SkrqkjjvSSR7Qimtt9GkaUcRmWnG38ycSwDD3g4Y8118h2NDr3FfmA8IFTR+inOqRZacb0xZ6rjJ49PXZgy8t6zLYyQWuEM5pC45SJrl1GrMdg+gtagmRiW/s+2UN3+Q43AmFcjPpEAsZQOov8CIaEEqrX3XW/h2kikD/11Z32ppOmqTgvV/Vlc83qfaAHRTifYKQtiDt/w8pU/HRCBnMOsG3jiQXR+GxgCDwsVi8B6YN1LLgkB45QSXyF91wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755252370; c=relaxed/relaxed;
	bh=NKM6vYBTvYJgJZpC+3klg9OwyY5OfNg57KkNb0OocWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/FjG4FmEqCkFrFnpOMinhazMhRqmCi46lQzmSy7dVtRT6piPmRParGezXuXye15vfd3CmjOtRY44vfwR0J8pWGLJWAgIUwWN6NQsC3qlEY2psej2O8zkgCBy2oiPvaeRfIrMcvy4myo5Bzcch4q43ceN4CcGaOuxkqrj42gBWCmcbeRYjW8+HyovvLnTMWMGz8XX0qeqexX4GlYpQAQDbslTaI0/NWBgQYSMiOAVkiLH453ddeVzpyCNA16tEi2QoDESGZdZy3yUiks6k1NMlpZXE2ue2nZ4uzms5bgD2AZTJSXBHAj6X0jlmAIcBSDdtHGG8LKQceBDLK0q4TuAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aO2iazZB; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=S6z9FpXD; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=aO2iazZB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=S6z9FpXD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c3HnD2k1qz3cbL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 20:06:08 +1000 (AEST)
Date: Fri, 15 Aug 2025 12:06:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755252363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKM6vYBTvYJgJZpC+3klg9OwyY5OfNg57KkNb0OocWg=;
	b=aO2iazZBVl4jvGHcxioVfsh65iLR3Izq+qWPXADbutMqMavKgUaUthaDr+R6w1r6xC69M7
	pL5h2TEWtWYewAnpScYhJCkIaFAKgULbi15SjfGtKC8LJ/mZc1hQQzLg71FWu25eDTH0y1
	MdUY3+nnowrj0PdDzw1hyrQ8ozJ0BdBe+J6xfrhxUNOLMiWm7280NRlOtJuKnvCK2Hl4+R
	JjnaSPjNDatrg+pgW4dq3uCQftbz45AWPj/EWmXs4IklOD4k8lw//0rXGaZQYflfEXqJDN
	ZoNnis/wD+gc1ASC2wdlydN0BBi8bv7A4d+0Pi34HL6a8GZJXUQvVqO1fxQIkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755252363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKM6vYBTvYJgJZpC+3klg9OwyY5OfNg57KkNb0OocWg=;
	b=S6z9FpXDI0m5KmQAvWcT/IWg9tN8RVfisToJ75YI5pbqWTKx4VxzrYh7GLy6FZouW5QiYj
	9qWhB6v7+0ZZRyBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
	Nicholas Piggin <npiggin@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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
Message-ID: <20250815112851-e613308f-d49e-44ae-b2dd-ca7946fa1fd9@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
 <86186254-b2c6-4818-af0a-4eb67d90e501@csgroup.eu>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86186254-b2c6-4818-af0a-4eb67d90e501@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

On Thu, Aug 14, 2025 at 03:43:09PM +0200, Christophe Leroy wrote:
> Le 12/08/2025 à 07:44, Thomas Weißschuh a écrit :
> > The compiler can emit absolute relocations in vDSO code,
> > which are invalid in vDSO code.
> > Detect them at compile-time.
> 
> I'm a bit puzzled with this series.
> 
> If I understand correctly, the check will be done only when you have RUST
> available ?

Yes, this new check will only be performed if a rust toolchain is available.
CONFIG_RUST however is *not* required.

> I wouldn't expect having RUST to build a C kernel.

The build will work fine without Rust present and will fall back to the
simplistic readelf test. A single report of breakage will allow us to fix the code,
not everybody needs to run the full thing.

> By the way, aren't relocations already detected by command cmd_vdso_check in
> lib/vdso/Makefile.include , using readelf ? Why is a new tool needed

The current cmd_vdso_check only validates the final vDSO image.
However that is not sufficient, as some problematic relocations will not show
up in the final image anymore but only the intermediary object files.
And there the logic is more complex than can be reasonably expressed in inline
shell scripts, see the previous revisions of this series for the attempts.
The valid relocations depend on each architecture and the specific ELF section
they appear in.
For the real example that triggered all of this, see commit
0c314cda9325 ("arm64: vdso: Work around invalid absolute relocations from GCC")

> and why does it have to be written in RUST langage ?

There is no hard requirement for Rust. I chose it for convenience of
implementation, especially around descriptive error handling and generic
functions. tglx was fine with it.


Thomas

