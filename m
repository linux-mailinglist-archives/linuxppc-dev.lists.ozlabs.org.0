Return-Path: <linuxppc-dev+bounces-9225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25969AD262E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 20:55:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGLhV2YQVz2xHv;
	Tue, 10 Jun 2025 04:55:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749495306;
	cv=none; b=Ue4QwS/WfzQRSraBNbAdijpopOwAI2gom0JQRNqOQdVYBcXZkFoGVzUi+7P7OAvT/tXe0ihW0gwEsSQh+AZBdPQZV43TbBKEoihFwqjn4ipvuzy+bDoDQngSwQkb69RrivfYA4uZ2ASM25oDI5fGzxLuDa3O2itIOFnAbzOci8nokHje7+2XY5gEDKEnAOahTPo+GjKG3p+CvWvv5motLOMLS8hB5VLpbyzybLpLqCZofjdrY1HomF77as2dOvI69fazLC/B9XfSS9REKS9CoEwnqYMIkKagfh4w+hyYawtWoiZSkgrKNewqtmFmTfiB5KAnj5uqpfvQe0WwGGOlQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749495306; c=relaxed/relaxed;
	bh=8A4kfNqCpnvhSbBzTBjtE+VJ2L30xs4Ao8ewlm8dEvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgvzHbTyV137O3WXy4Ez1O14+EsH6qbTGfRae5Z/HvPwvVuEIFpPGHjbN6l6IdLvR4E1Ugq9Pj9lR9c+wl3ElMr770dlFGOEteogdYb/3ie2bJHGBnf9d4rub7U6kBDgxchtRiJ26+j74hDs7vWKEhfihYVD0FG9jH7JlpANG0TnfsSodsAWil+BVKoANmcgCJjQPn4h6CjOuQY+WIMrHpkpLW4HGppC2mmUfX/dB51Dd2gCLslNoKMbbLVkJgZg4k4qAPc3UQlDEQMDTavNZvx/KkT1Qc8RCo/dS0vKKNQ5Oo24HsFZw5YO0vPHKa0GPIOPMIGa/OkworRnbSaeAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cOGXtZ0b; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cOGXtZ0b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGLhT1xG1z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 04:55:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 290694ACCA;
	Mon,  9 Jun 2025 18:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDEAC4CEEF;
	Mon,  9 Jun 2025 18:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749495302;
	bh=i03d00nCfUWfOdFAfB3hz6pL/gDpm+GCWlrY8GYnNSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cOGXtZ0bxE5c/cKVjIahkTcrKCRAsE2Gfxn3UIhlFlFiZLaC+zKdF7VWxfKm8/ETS
	 6AhGs0umiRMCJ5JgdBhNOOkRxSsFWAtxF3SJIcO4BKZGFJs1ZQtGYfS9ZJ9KjnFtXu
	 CoUuDzdDeoQNA3IJviIlNiJi7ydg2ehdcQ5OXBzI0xl+XsUGv/gmofveqW1cZVJlxj
	 7S5NNv/e7xF0C/H29trUyZ+4svuZFkbjIOhn5nXwrlL711gYmP+gm6Ewk+tz2CReoY
	 NFWzzRmLR5sYfJufJHFK1j4djDnBCF+UiHFg8rnM/mFlrhQ4MNaEJcQxnaEuTEhFf3
	 PK9kqt1NEZKGw==
Date: Mon, 9 Jun 2025 11:54:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is
 integrated
Message-ID: <20250609185439.GB1255@sol>
References: <20250607200454.73587-1-ebiggers@kernel.org>
 <aEaP-A21IB4ufbZT@gmail.com>
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
In-Reply-To: <aEaP-A21IB4ufbZT@gmail.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 09, 2025 at 09:40:40AM +0200, Ingo Molnar wrote:
> 
> * Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > This series is also available at:
> > 
> >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
> > 
> > This series improves how lib/crc supports arch-optimized code.  First,
> > instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> > will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> > crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> > functions (e.g. crc32c_base()) will now be part of a single module for
> > each CRC type, allowing better inlining and dead code elimination.  The
> > second change is made possible by the first.
> > 
> > As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> > crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> > were already coupled together and always both got loaded together via
> > direct symbol dependency, so the separation provided no benefit.
> > 
> > Note: later I'd like to apply the same design to lib/crypto/ too, where
> > often the API functions are out-of-line so this will work even better.
> > In those cases, for each algorithm we currently have 3 modules all
> > coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> > sha256-x86.ko.  We should have just one, inline things properly, and
> > rely on the compiler's dead code elimination to decide the inclusion of
> > the generic code instead of manually setting it via kconfig.
> > 
> > Having arch-specific code outside arch/ was somewhat controversial when
> > Zinc proposed it back in 2018.  But I don't think the concerns are
> > warranted.  It's better from a technical perspective, as it enables the
> > improvements mentioned above.  This model is already successfully used
> > in other places in the kernel such as lib/raid6/.  The community of each
> > architecture still remains free to work on the code, even if it's not in
> > arch/.  At the time there was also a desire to put the library code in
> > the same files as the old-school crypto API, but that was a mistake; now
> > that the library is separate, that's no longer a constraint either.
> > 
> > Changed in v2:
> >    - Fixed build warning on architectures without any optimized CRC code
> >    - Fixed build warning in sparc/crc32.h by removing pr_fmt
> >    - Moved fallback definitions of crc32*_arch back into arch files
> >    - Remove ARCH_HAS_CRC* symbols at end of series instead of beginning,
> >      so that they're not removed until they're no longer being selected
> >    - Slightly improved some commit messages
> >    - Rebased onto other pending lib/crc changes
> > 
> > Eric Biggers (12):
> >   lib/crc: move files into lib/crc/
> >   lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
> >   lib/crc/arm: migrate arm-optimized CRC code into lib/crc/
> >   lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
> >   lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
> >   lib/crc/mips: migrate mips-optimized CRC code into lib/crc/
> >   lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
> >   lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
> >   lib/crc/s390: migrate s390-optimized CRC code into lib/crc/
> >   lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
> >   lib/crc/x86: migrate x86-optimized CRC code into lib/crc/
> >   lib/crc: remove ARCH_HAS_* kconfig symbols
> 
> For the movement of the x86 bits:
> 
>   Acked-by: Ingo Molnar <mingo@kernel.org>
> 
> >  rename {arch/s390/lib => lib/crc/s390}/crc32be-vx.c (100%)
> >  rename {arch/s390/lib => lib/crc/s390}/crc32le-vx.c (100%)
> >  rename arch/sparc/lib/crc32.c => lib/crc/sparc/crc32.h (60%)
> >  rename {arch/sparc/lib => lib/crc/sparc}/crc32c_asm.S (100%)
> >  create mode 100644 lib/crc/tests/Makefile
> >  rename lib/{ => crc}/tests/crc_kunit.c (100%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-consts.h (100%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.S (100%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.h (100%)
> >  rename arch/x86/lib/crc-t10dif.c => lib/crc/x86/crc-t10dif.h (56%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc16-msb-pclmul.S (100%)
> >  rename {arch/x86/lib => lib/crc/x86}/crc32-pclmul.S (100%)
> 
> One small namespace suggestion: wouldn't it be better to move the arch 
> support code to lib/crc/arch/, instead of lib/crc/? That way any 
> generic code will stand out better and architecture directories don't 
> crowd out what is supposed to be generic code.

I don't think that yet another level of directories would provide much value
here.  The only non-arch subdirectory of lib/crc/ is "tests", so it's not like
there are a lot of subdirectories that could be confused with arch names.

- Eric

