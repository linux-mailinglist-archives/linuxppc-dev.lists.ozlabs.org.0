Return-Path: <linuxppc-dev+bounces-872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C99968793
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 14:35:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy7WD5Cwbz2xtb;
	Mon,  2 Sep 2024 22:35:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725280504;
	cv=none; b=c1VT8TpYbN++PjyGLFjTtSnsWRN9FdaeDTNxBHV/xIQcm08p6bUWbPQj9StVtiwHM7PzEtv6BW5nJhN7lyBQU4FrWvAmJLzcJLHHRZ2b2HKxOWtvtxVThnFkG0y+OSkc0RFCMMJyL1gdsqhovteTPQ5msfIKU/08lkhsAT4T4AIKP+CiUhtPgEyrtDPpKh5LPmZSUtboQb9PvxYhhwNPcOHEUTnPZLJ50+5csSw6EOBl+4yMROLeQD7Y0+CcqYdF4lxmlPGCthYaLNVvXG1jyZmtLqCOXL5wkTVo9qVg30lTs/d+kZxlw3sEL14tegH6BwhfI5zCnbFI3IWmEyI+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725280504; c=relaxed/relaxed;
	bh=882s/0oxY3IaUveWmEXQ9Cl4UCSpcI/yfMpsZGvZIqQ=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=beKkypo9gJx/sCorJ/Lda3ABNJh8x2JjStsF7562rE3N+mE9iGpOKFm7jGLijfu53+IXFLiUU4wdmrhXe0qikBHfID4+7QNUJFzk7mymD2a8foJBfJjSS05mCX+bWesNfDIOuiVPSUWHL/EZZ2Pu3GtRqA0AlcPaISovtvHh9r4AJWh3WxQesYFZ5ogWLTAJtRUB9UyJU0RaIDArZfDYRUdpjv3SoGaEs8BhA2wdy9dkUYBCWz+bQwa33+j4cJz9Mu2aF1kaSoMDAeMi6R73Ri/oeIhoHfKBidKakf3UnqIQWiX2iERCIZjbd55bvA3gGFsfbid2azPRTeOLGv2ZTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GvCPvbhW; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GvCPvbhW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy7WB60HDz2xKg
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 22:35:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81C975C5839;
	Mon,  2 Sep 2024 12:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839DDC4CEC2;
	Mon,  2 Sep 2024 12:34:57 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GvCPvbhW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725280495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=882s/0oxY3IaUveWmEXQ9Cl4UCSpcI/yfMpsZGvZIqQ=;
	b=GvCPvbhW2m2jYoAxPU1wvqvYj9FboQLHWShrj+s+adjZAJT3TuHPHxTV7jxhkLBDOaMexZ
	lgOnLbMwcrBalkcwK2Us5lCoS0HPCfmqmBrkvHWRXH4kgn5eiovHjf2iVAYU/SglD3w6gQ
	EdxGyEKCEpN2M6xkxzv9bOZ82o4t/fw=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6aea6560 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 2 Sep 2024 12:34:54 +0000 (UTC)
Date: Mon, 2 Sep 2024 14:34:49 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
	Adhemerval Zanella <adhemerval.zanella@linaro.org>,
	Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCH v4 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC32
Message-ID: <ZtWw6Wuudqj4IYWL@zx2c4.com>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
 <ec4d2919836a9f3a7791c2540ee79067396d701b.1725278148.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <ec4d2919836a9f3a7791c2540ee79067396d701b.1725278148.git.christophe.leroy@csgroup.eu>

On Mon, Sep 02, 2024 at 02:04:41PM +0200, Christophe Leroy wrote:
> This first patch adds support for PPC32. As selftests cannot easily
> be generated only for PPC32, and because the following patch brings
> support for PPC64 anyway, this patch opts out all code in
> __arch_chacha20_blocks_nostack() so that vdso_test_chacha will not
> fail to compile and will not crash on PPC64/PPC64LE, allthough the
> selftest itself will fail. This patch also adds a dummy
> __kernel_getrandom() function that returns ENOSYS on PPC64 so that
> vdso_test_getrandom returns KSFT_SKIP instead of KSFT_FAIL.

Why not just wire up the selftests in the next patch like you did for
v3? This seems like extra stuff for no huge reason?

>  arch/powerpc/Kconfig                         |   1 +
>  arch/powerpc/include/asm/vdso/getrandom.h    |  54 +++++
>  arch/powerpc/include/asm/vdso/vsyscall.h     |   6 +
>  arch/powerpc/include/asm/vdso_datapage.h     |   2 +
>  arch/powerpc/kernel/asm-offsets.c            |   1 +
>  arch/powerpc/kernel/vdso/Makefile            |  13 +-
>  arch/powerpc/kernel/vdso/getrandom.S         |  58 ++++++
>  arch/powerpc/kernel/vdso/vdso32.lds.S        |   1 +
>  arch/powerpc/kernel/vdso/vdso64.lds.S        |   1 +
>  arch/powerpc/kernel/vdso/vgetrandom-chacha.S | 207 +++++++++++++++++++
>  arch/powerpc/kernel/vdso/vgetrandom.c        |  16 ++
>  tools/testing/selftests/vDSO/Makefile        |   2 +-
>  12 files changed, 359 insertions(+), 3 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/vdso/getrandom.h
>  create mode 100644 arch/powerpc/kernel/vdso/getrandom.S
>  create mode 100644 arch/powerpc/kernel/vdso/vgetrandom-chacha.S
>  create mode 100644 arch/powerpc/kernel/vdso/vgetrandom.c

I think you might have forgotten to add the symlink in this commit (or
the next one, per my comment above, if you agree with it).

> +/*
> + * Very basic 32 bits implementation of ChaCha20. Produces a given positive number
> + * of blocks of output with a nonce of 0, taking an input key and 8-byte
> + * counter. Importantly does not spill to the stack. Its arguments are:
> + *
> + *	r3: output bytes
> + *	r4: 32-byte key input
> + *	r5: 8-byte counter input/output (saved on stack)
> + *	r6: number of 64-byte blocks to write to output
> + *
> + *	r0: counter of blocks (initialised with r6)
> + *	r4: Value '4' after key has been read.
> + *	r5-r12: key
> + *	r14-r15: counter
> + *	r16-r31: state
> + */
> +SYM_FUNC_START(__arch_chacha20_blocks_nostack)
> +#ifdef __powerpc64__
> +	blr
> +#else
> +	stwu	r1, -96(r1)
> +	stw	r5, 20(r1)
> +	stmw	r14, 24(r1)
> +
> +	lwz	r14, 0(r5)
> +	lwz	r15, 4(r5)
> +	mr	r0, r6
> +	subi	r3, r3, 4
> +
> +	lwz	r5, 0(r4)
> +	lwz	r6, 4(r4)
> +	lwz	r7, 8(r4)
> +	lwz	r8, 12(r4)
> +	lwz	r9, 16(r4)
> +	lwz	r10, 20(r4)
> +	lwz	r11, 24(r4)
> +	lwz	r12, 28(r4)

If you don't want to do this, don't worry about it, but while I'm
commenting on things, I think it's worth noting that x86, loongarch, and
arm64 implementations all use the preprocessor or macros to give names
to these registers -- state1,2,3,...copy1,2,3 and so forth. Might be
worth doing the same if you think there's an easy and obvious way of
doing it. If not -- or if that kind of work abhors you -- don't worry
about it, as I'm confident enough that this code works fine. But it
might be "nice to have". Up to you.

> +
> +	li	r4, 4
> +.Lblock:
> +	li	r31, 10
> +

Maybe a comment here, "expand 32-byte k" or similar.

> +	lis	r16, 0x6170
> +	lis	r17, 0x3320
> +	lis	r18, 0x7962
> +	lis	r19, 0x6b20
> +	addi	r16, r16, 0x7865
> +	addi	r17, r17, 0x646e
> +	addi	r18, r18, 0x2d32
> +	addi	r19, r19, 0x6574
> +
> +	mtctr	r31
> +
> +	mr	r20, r5
> +	mr	r21, r6
> +	mr	r22, r7
> +	mr	r23, r8
> +	mr	r24, r9
> +	mr	r25, r10
> +	mr	r26, r11
> +	mr	r27, r12
> +
> +	mr	r28, r14
> +	mr	r29, r15
> +	li	r30, 0
> +	li	r31, 0
> +
> +.Lpermute:
> +	QUARTERROUND4( 0, 4, 8,12, 1, 5, 9,13, 2, 6,10,14, 3, 7,11,15)
> +	QUARTERROUND4( 0, 5,10,15, 1, 6,11,12, 2, 7, 8,13, 3, 4, 9,14)
> +
> +	bdnz	.Lpermute
> +
> +	addis	r16, r16, 0x6170
> +	addis	r17, r17, 0x3320
> +	addis	r18, r18, 0x7962
> +	addis	r19, r19, 0x6b20
> +	addi	r16, r16, 0x7865
> +	addi	r17, r17, 0x646e
> +	addi	r18, r18, 0x2d32
> +	addi	r19, r19, 0x6574
> +
> +	add	r20, r20, r5
> +	add	r21, r21, r6
> +	add	r22, r22, r7
> +	add	r23, r23, r8
> +	add	r24, r24, r9
> +	add	r25, r25, r10
> +	add	r26, r26, r11
> +	add	r27, r27, r12
> +
> +	add	r28, r28, r14
> +	add	r29, r29, r15
> +
> +	stwbrx	r16, r4, r3
> +	addi	r3, r3, 8
> +	stwbrx	r17, 0, r3
> +	stwbrx	r18, r4, r3
> +	addi	r3, r3, 8
> +	stwbrx	r19, 0, r3
> +	stwbrx	r20, r4, r3
> +	addi	r3, r3, 8
> +	stwbrx	r21, 0, r3
> +	stwbrx	r22, r4, r3
> +	addi	r3, r3, 8
> +	stwbrx	r23, 0, r3
> +	stwbrx	r24, r4, r3
> +	addi	r3, r3, 8
> +	stwbrx	r25, 0, r3
> +	stwbrx	r26, r4, r3
> +	addi	r3, r3, 8
> +	stwbrx	r27, 0, r3
> +	stwbrx	r28, r4, r3
> +	addi	r3, r3, 8
> +	stwbrx	r29, 0, r3
> +	stwbrx	r30, r4, r3
> +	addi	r3, r3, 8
> +	stwbrx	r31, 0, r3
> +
> +	subic.	r0, r0, 1	/* subi. can't use r0 as source */

Never seen the period suffix. Just looked this up. Neat.

