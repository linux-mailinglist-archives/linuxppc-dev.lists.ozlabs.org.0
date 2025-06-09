Return-Path: <linuxppc-dev+bounces-9214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2045FAD1921
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jun 2025 09:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bG3kS4lxXz2xgX;
	Mon,  9 Jun 2025 17:40:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749454848;
	cv=none; b=kbQv6VL2cBkYaVyMsR1VqCGKvTCJgAWD2k6M+BpQk1uRM320ZLk4gzntAnkVMLexiPuuUfnxPEPV4z7cC0BK4oHGJy/29mVKS2x6ybq13XUe09ghjSkIG1X2Q8OvPYVeH7KSxITg2+tIM1QKajHP0WXNFNU05s2qdeaDZbYnCILaFKqrH7Sbms2gs6xEzxBwUTwUKdKOwcAHLU/JR4lNyQod6gD4aNfc9CocSeeXF7fYjVv8SWEdtTu4P/jKLIdpLS/mw5Sdt+s7Ii6z/LlOtON9tp7c4ogc42TKxObOo9RZ7zzaLXUFA/A6kOPja92PCTqkHjhKi9Ddqdt9XKgFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749454848; c=relaxed/relaxed;
	bh=K1dmPl2/y0mriFH/2+FP+giifqlHSJmrIRmfkbGsYfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2h1G9tzwv+eLoGKqOcmxHgsqmolDMYnwiw4rIOWsQCxC8gPAYGVomvf3Fgp7NnA+oObDEacqHgrLq5Hrdwuz4iV9nSYFmVxeLoezCKzbaJsxwgRONa4Lq3R17T43onTOdntSe+fbA9ONqCethzaqbq2slmTkB8quu2Thc0H7MX5dNDXpSsoiaS9hjslLdsvSorUbs4RuSjTcqy2RF4p7aGk+pLIWg3qK0HtpRNTOt0bkE3jwaWdWNOmvJZRE+fPnM+3hIeS/iiMms6B0TZJH4ZKUecRavMEG6DVPA1C0rJDhgyVAFWjzM3PAR8BiQDQFWsR2O4gwm8ZWL49RzpsXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gY73dLvT; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mingo@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gY73dLvT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mingo@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bG3kR4KsJz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jun 2025 17:40:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 831154A435;
	Mon,  9 Jun 2025 07:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D454C4CEEB;
	Mon,  9 Jun 2025 07:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749454845;
	bh=209nlqUCXw1v1f3VX0uAONXnvWEHs95NYNmSYw3A208=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gY73dLvTuG20cJBz/uTBYeNpVArZbVpympdOLaTXmTkeunUr3SogtkPrwip9348ep
	 GlTKa/1aKhnLBecgL6YOHGiyn6aWWyzDNjIomZXEgN5BhgUj0hO1mpCxdKv9aobqz4
	 RnoBw1oQVRZdaapyQ1FXeBDESYqX3Q0OfYu1fpREr/8jdQi513Lp7mLf63c+XEToKH
	 LYD8l/KcwV19regOTXQOVdkfp/yPLBBpzHKzu/sXfWel7SlgoHtargDiNocTs3CBSM
	 6lBah99e7LOsXVUIFQVjuP75ksUm9JxSa89Qa+QLFdgswE9W8Py551smm+rsV6wroC
	 3VMj1AV9M7FpQ==
Date: Mon, 9 Jun 2025 09:40:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
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
Message-ID: <aEaP-A21IB4ufbZT@gmail.com>
References: <20250607200454.73587-1-ebiggers@kernel.org>
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
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


* Eric Biggers <ebiggers@kernel.org> wrote:

> This series is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2
> 
> This series improves how lib/crc supports arch-optimized code.  First,
> instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> functions (e.g. crc32c_base()) will now be part of a single module for
> each CRC type, allowing better inlining and dead code elimination.  The
> second change is made possible by the first.
> 
> As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
> crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> were already coupled together and always both got loaded together via
> direct symbol dependency, so the separation provided no benefit.
> 
> Note: later I'd like to apply the same design to lib/crypto/ too, where
> often the API functions are out-of-line so this will work even better.
> In those cases, for each algorithm we currently have 3 modules all
> coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> sha256-x86.ko.  We should have just one, inline things properly, and
> rely on the compiler's dead code elimination to decide the inclusion of
> the generic code instead of manually setting it via kconfig.
> 
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.
> 
> Changed in v2:
>    - Fixed build warning on architectures without any optimized CRC code
>    - Fixed build warning in sparc/crc32.h by removing pr_fmt
>    - Moved fallback definitions of crc32*_arch back into arch files
>    - Remove ARCH_HAS_CRC* symbols at end of series instead of beginning,
>      so that they're not removed until they're no longer being selected
>    - Slightly improved some commit messages
>    - Rebased onto other pending lib/crc changes
> 
> Eric Biggers (12):
>   lib/crc: move files into lib/crc/
>   lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
>   lib/crc/arm: migrate arm-optimized CRC code into lib/crc/
>   lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
>   lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
>   lib/crc/mips: migrate mips-optimized CRC code into lib/crc/
>   lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
>   lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
>   lib/crc/s390: migrate s390-optimized CRC code into lib/crc/
>   lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
>   lib/crc/x86: migrate x86-optimized CRC code into lib/crc/
>   lib/crc: remove ARCH_HAS_* kconfig symbols

For the movement of the x86 bits:

  Acked-by: Ingo Molnar <mingo@kernel.org>

>  rename {arch/s390/lib => lib/crc/s390}/crc32be-vx.c (100%)
>  rename {arch/s390/lib => lib/crc/s390}/crc32le-vx.c (100%)
>  rename arch/sparc/lib/crc32.c => lib/crc/sparc/crc32.h (60%)
>  rename {arch/sparc/lib => lib/crc/sparc}/crc32c_asm.S (100%)
>  create mode 100644 lib/crc/tests/Makefile
>  rename lib/{ => crc}/tests/crc_kunit.c (100%)
>  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-consts.h (100%)
>  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.S (100%)
>  rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.h (100%)
>  rename arch/x86/lib/crc-t10dif.c => lib/crc/x86/crc-t10dif.h (56%)
>  rename {arch/x86/lib => lib/crc/x86}/crc16-msb-pclmul.S (100%)
>  rename {arch/x86/lib => lib/crc/x86}/crc32-pclmul.S (100%)

One small namespace suggestion: wouldn't it be better to move the arch 
support code to lib/crc/arch/, instead of lib/crc/? That way any 
generic code will stand out better and architecture directories don't 
crowd out what is supposed to be generic code.

Thanks,

	Ingo

