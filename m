Return-Path: <linuxppc-dev+bounces-876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C6D96894D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 16:00:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy9Py5GBZz2xsW;
	Tue,  3 Sep 2024 00:00:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725285638;
	cv=none; b=fINxysw8ax6Iq7pbbxONrHZAkXNuCyEOXRDoo7a7CJChsAjb58qx+eyaU4DsuxpCYTe6PfS8aeyvOweWL0wmpYAfRxjhBITXUGYhLrWoY0CMTb3UdCBB3/KU4xogZhmjaZBchyRCIEJ3oRXs0OQzOiVg0mkWrh5VsXBKkd1Uc6ds0U+Mz3x6H+QjIlG69FJ0qC6S1ayDZH7w+MYqjPMa24125g2E32QaKdMp24t7Iauv0/rf31PY8NKyg+Y6oFCfF4df8EohGv1Q3kfBGu1IhZZ2/O7wCLzwPicVoba5zUlNBL7vxHCljRKkZ5K2amd2rXVWvTLNE5QcuQ/ZLGmQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725285638; c=relaxed/relaxed;
	bh=dH1tTlDFz02LirzapNYJOjvf27rZrsn4qQhBH9PXJJI=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=IgUPj4U35Xq0D138x+52e+fTizebApQTHp2p9U6CVQePBiNH4wtWfGvizjw+wbuPj8cPSrYaz2yXxpB1xs7mrACUbTe3sj/azD0QCEPzJpv1ZtmrGt6rzH9LPA4yBbf9qlErzkGyaWA95eAUcsgJ8rpQBG4AUSw6mqrNhNmtUzI/6YpJdV+206Kf+/4SRl6X6oGUmzY5Nlqz4AUbH+JgWMatMaB1U0bhOAiQXMV7iHSJuzFkerDKFg0AY2wMeV3KsEZ/DygqnNRvt2Pm0+B9PwysaEolMW/Ff1nfg9jLHtgrzEQD2Z/veOPQa1CMdKGl9mdjDA2mQj00PsJ+aqIEPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=X99r7ucy; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=X99r7ucy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy9Pw43BJz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 00:00:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C078DA403BF;
	Mon,  2 Sep 2024 14:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4E3C4CEC2;
	Mon,  2 Sep 2024 14:00:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X99r7ucy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725285629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH1tTlDFz02LirzapNYJOjvf27rZrsn4qQhBH9PXJJI=;
	b=X99r7ucyzGQYz7BV9t3L42iNhMq4Gphnca5YBUq9T8Om5gEZzj1YIOYWEfXnn1VQwl8yQU
	8dh8jff+3pIFuuuweAdnIGuZm/DTbFo6qJfXoT4ZY0IHBzAX9pRhxb8I6Wcc6Mk6KtYGP0
	9nZRx5Gug0R98ELGgORIOU8/WjjAKP0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 26b40413 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 2 Sep 2024 14:00:28 +0000 (UTC)
Date: Mon, 2 Sep 2024 16:00:24 +0200
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
Subject: Re: [PATCH v4 5/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC64
Message-ID: <ZtXE-AISB4w9U9Yc@zx2c4.com>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
 <27de70dcc356e56754a03a2887a97597f5e840a4.1725278148.git.christophe.leroy@csgroup.eu>
 <ZtWyeuCfzZ66fVsg@zx2c4.com>
 <bdf1a515-b3d0-471d-89ee-989ae0d63202@csgroup.eu>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdf1a515-b3d0-471d-89ee-989ae0d63202@csgroup.eu>

On Mon, Sep 02, 2024 at 03:12:47PM +0200, Christophe Leroy wrote:
> 
> 
> Le 02/09/2024 à 14:41, Jason A. Donenfeld a écrit :
> > On Mon, Sep 02, 2024 at 02:04:42PM +0200, Christophe Leroy wrote:
> >>   SYM_FUNC_START(__arch_chacha20_blocks_nostack)
> >>   #ifdef __powerpc64__
> >> -	blr
> >> +	std	r5, -216(r1)
> >> +
> >> +	std	r14, -144(r1)
> >> +	std	r15, -136(r1)
> >> +	std	r16, -128(r1)
> >> +	std	r17, -120(r1)
> >> +	std	r18, -112(r1)
> >> +	std	r19, -104(r1)
> >> +	std	r20, -96(r1)
> >> +	std	r21, -88(r1)
> >> +	std	r22, -80(r1)
> >> +	std	r23, -72(r1)
> >> +	std	r24, -64(r1)
> >> +	std	r25, -56(r1)
> >> +	std	r26, -48(r1)
> >> +	std	r27, -40(r1)
> >> +	std	r28, -32(r1)
> >> +	std	r29, -24(r1)
> >> +	std	r30, -16(r1)
> >> +	std	r31, -8(r1)
> >>   #else
> >>   	stwu	r1, -96(r1)
> >>   	stw	r5, 20(r1)
> >> +#ifdef __BIG_ENDIAN__
> >>   	stmw	r14, 24(r1)
> >> +#else
> >> +	stw	r14, 24(r1)
> >> +	stw	r15, 28(r1)
> >> +	stw	r16, 32(r1)
> >> +	stw	r17, 36(r1)
> >> +	stw	r18, 40(r1)
> >> +	stw	r19, 44(r1)
> >> +	stw	r20, 48(r1)
> >> +	stw	r21, 52(r1)
> >> +	stw	r22, 56(r1)
> >> +	stw	r23, 60(r1)
> >> +	stw	r24, 64(r1)
> >> +	stw	r25, 68(r1)
> >> +	stw	r26, 72(r1)
> >> +	stw	r27, 76(r1)
> >> +	stw	r28, 80(r1)
> >> +	stw	r29, 84(r1)
> >> +	stw	r30, 88(r1)
> >> +	stw	r31, 92(r1)
> >> +#endif
> >> +#endif
> > 
> > This confuses me. Why are you adding code to the !__powerpc64__ branch
> > in this commit? (Also, why does stmw not work on LE?)
> 
> That's for the VDSO32 ie running 32 bits binaries on a 64 bits kernel.
> 
> "Programming Environments Manual for 32-Bit Implementations of the 
> PowerPC™ Architecture" say: In some implementations operating with 
> little-endian byte order, execution of an lmw or stmw instruction
> causes the system alignment error handler to be invoked
> 
> And GCC doesn't like it either:
> 
> tools/arch/powerpc/vdso/vgetrandom-chacha.S:84: Error: `stmw' invalid 
> when little-endian

Does it make sense to do all the 32-bit stuff in the PPC32 commit (and
then you can introduce the selftests there without the error you
mentioned), and then add the 64-bit stuff in this commit?

