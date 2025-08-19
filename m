Return-Path: <linuxppc-dev+bounces-11113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 770D9B2B598
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 02:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5WN55gD9z3ckP;
	Tue, 19 Aug 2025 10:55:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755564933;
	cv=none; b=I8ZYjiw0K1zY9Q2z4MYCbi/TiUZrl9evoA/7+5Xw8CCcfNx4/kT/5/DlT8sHBMaYY0P6f7bf9XvlNeg378XAelH2+bQkhYAZ2k81x4okxoJcpgDjRlVdXUoVYlPfuTsTacGPJjzlr+L/swi+tpeWxY8Gg7qtDdyEPppfF4Qwi9SPawxAyN8O4ByE8xCt9RVvp1kTCjMxxyuyIXyeeVFNVt4fcjyWEP5LlGmiRexZ6P+9o9zzuSjmijRVz9n2rYv5bsoFOQiGigXGy6ks/KNtEsK5RNzi5uc3MFkNLWZpLF49t1JDxvmKrNOir/rohDeV+SN9LSy4pNte+MxVjWRGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755564933; c=relaxed/relaxed;
	bh=JzfTMaSWFx+xn7Q0qfVZdQJA3fiAtavglfDwO1hdcSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpBR0eEpcmjVavetEOFhRDGMnQWEnhc86X9iF7MaGN8+e+Vvlb9LeKR4WI8sa/Kcz5uOns8w2RZt0VNJsTemacsDnTrVaZasj64pLeKDKfCnCrmxuRkQSRVERMeMcTTXXSSFlqNP97ilBIg98dKUqj6aAei9QGvvfhsi5CD+dT/W6QXdPte+Ddlw24REGkktjsfg9/Cqc3onNtj3kiye8Mk3KZIJQ6ojZ2B/oWJmmpATGyIOXlCrB+QN/KX04XBZuxn9uFKsi4P633ch3vnKBrsD5WsPx1n0nKZZETHSYe+Ffnt8LmdxkPxj3RPA3Lx2bKqrHrd3RfN7kjod1TDu4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xf9fcNQg; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xf9fcNQg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5WN437kZz3ck2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 10:55:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 896C55C57B0;
	Tue, 19 Aug 2025 00:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A33C4CEEB;
	Tue, 19 Aug 2025 00:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755564929;
	bh=RHDDgdI1KU5gTd6q3RZ5KjPYkSkpxLcDr1NCuu19268=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xf9fcNQgSU+Jeg+ZP/DY9xu+7OEGwXkut8IrHzRW8NQLSJst0aTV0vjj7mBLD2TMC
	 w5Fy48Sn79iupubE3YtfbIfAZusLxLPs26rf7V0ryA7My7a+9RNPJSdkDFA+bypbef
	 SxGw74sKCkXQJfaZC+ps0lk9znD9XBmUnvgdm6lcfG4Dymf7j7PwKOAneQrOIzbUez
	 vCSoiI+k4kes3saiX75j3h1XiAq43lBTMSMpkalNwUodG0ItYSp05wxSQjcjHYl4v/
	 z2RjuW+7g/v5dY5viRILFm+jyrKcdgAUsnv3ksqOxqwz7dYrU5SvTErUHtrouytaWZ
	 aW3FdXzlx4+Dw==
Date: Mon, 18 Aug 2025 17:55:28 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com, Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 00/10] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Message-ID: <202508181753.7204670E@keescook>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 18, 2025 at 11:57:16AM -0700, Nathan Chancellor wrote:
> s390 and x86 have required LLVM 15 since
>
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
>
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.

Looks good to me!

Reviewed-by: Kees Cook <kees@kernel.org>

> I think it makes sense for either Andrew to carry this via -mm on a
> nonmm branch or me to carry this via the Kbuild tree, with the
> appropriate acks.

I vote you carry it with Kbuild. :)

--
Kees Cook

