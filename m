Return-Path: <linuxppc-dev+bounces-1061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DF296DF4F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 18:13:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X04D94zZrz2yYq;
	Fri,  6 Sep 2024 02:13:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725552825;
	cv=none; b=FarxrP1kmq67hBuLUqcHlucZ5fFQBdTnG65vZGxUFmyYzunBfk3EpK9C/mVe6ojFQ11Vtvah+HJAeUD7Tn1l7U68T8jOCFKqAkEsq4mdNd4ltnnsgfc3QG44ABgJ8AR1wofXkwUGFhCZmfD/MTcQAQijrWLMTshrttLEd/EFpyzELykDF5b1if+o972J6IJaDQ5zJSObNWCDZxC0mdly7r8qXTaNeOuuilD4vp/IVo5NrsGVMGod2st6CGE41ogJRQ86iLxFIfpHIMuSiE878H8H11wyAvJkcmJavaatOFdrvOocJWWJh6fQGJR93tbMZBzjOeTknw4K2pxogoVvgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725552825; c=relaxed/relaxed;
	bh=55bJknDRImEIEh83mNWUbwqRYAr8coQT4CUKKDd4gNA=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=PtBORPZo/Bz4jFCITZiuk4oKj4r79D6Fp9R9CYb1cN4BCQf1myg8qRfIpMIOQVHBVsxoP6QLcFiQV2Vt3RCZ8U6bmdr1nsTD3bgNAr7gcOtw5dJIxn2EpXt48SRhZxVCbh4UqKzpIz0fx26tHmMIpLhIa4QeYcCVwbbH4lg1VgFcFWFyGhMgT0j0yqBl8H2WZzJ9HDJHfBV79HYles0RAVBplpsUo4wJ2pKgv1Z7nhOImpEPesj0WcQpTf00QWU3WJ/DTnm8132HO7tpF62fUjFsdvKhR0T4R0sE8aUMrXd1VTm+IdQ/X3CtJjAA/+4lo0JXLfZ9YUCgEDqrOgJoEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=HegSE7me; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=HegSE7me;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X04D75Z4nz2yYn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 02:13:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26A3C5C571E;
	Thu,  5 Sep 2024 16:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C3EC4CEC3;
	Thu,  5 Sep 2024 16:13:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="HegSE7me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725552814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=55bJknDRImEIEh83mNWUbwqRYAr8coQT4CUKKDd4gNA=;
	b=HegSE7mehyaj6SAp/VnhlvGaaf85fyzlVkfWcnn7sUGLHgxLA3R706+39iH7IugfbGGag4
	p5FlY4bhYQq8YynPTQwVluyERdi6BU1onSw+v7PJ1EWAFn80DQmJzY/8vYGa8CRoj7fR1k
	Bvw94kDNyDv1iVrUc3RWVgEGHcyil8w=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9ecc21b4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 16:13:33 +0000 (UTC)
Date: Thu, 5 Sep 2024 18:13:29 +0200
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
Subject: Re: [PATCH v5 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on VDSO32
Message-ID: <ZtnYqZI-nrsNslwy@zx2c4.com>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
 <1f49c2ce009f8b007ab0676fb41187b2d54f28b2.1725304404.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <1f49c2ce009f8b007ab0676fb41187b2d54f28b2.1725304404.git.christophe.leroy@csgroup.eu>

> +/*
> + * The macro sets two stack frames, one for the caller and one for the callee
> + * because there are no requirement for the caller to set a stack frame when
> + * calling VDSO so it may have omitted to set one, especially on PPC64
> + */
> +
> +.macro cvdso_call funct
> +  .cfi_startproc
> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> +	mflr		r0
> +	PPC_STLU	r1, -PPC_MIN_STKFRM(r1)
> +  .cfi_adjust_cfa_offset PPC_MIN_STKFRM
> +	PPC_STL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> +  .cfi_rel_offset lr, PPC_MIN_STKFRM + PPC_LR_STKOFF
> +	get_datapage	r8
> +	addi		r8, r8, VDSO_RNG_DATA_OFFSET
> +	bl		CFUNC(DOTSYM(\funct))
> +	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
> +	cmpwi		r3, 0
> +	mtlr		r0
> +	addi		r1, r1, 2 * PPC_MIN_STKFRM
> +  .cfi_restore lr
> +  .cfi_def_cfa_offset 0
> +	crclr		so
> +	bgelr+
> +	crset		so
> +	neg		r3, r3
> +	blr
> +  .cfi_endproc
> +.endm

You wrote in an earlier email that this worked with time namespaces, but
in my testing that doesn't seem to be the case.

From my test harness [1]:

Normal single thread
   vdso: 25000000 times in 12.494133131 seconds
   libc: 25000000 times in 69.594625188 seconds
syscall: 25000000 times in 67.349243972 seconds
Time namespace single thread
   vdso: 25000000 times in 71.673057436 seconds
   libc: 25000000 times in 71.712774121 seconds
syscall: 25000000 times in 66.902318080 seconds

I'm seeing this on ppc, ppc64, and ppc64le.

Can you figure out what's going on and send a fix, which I'll squash
into this commit?

Jason

[1] https://git.zx2c4.com/linux-rng/commit/?h=jd/vdso-test-harness

