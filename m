Return-Path: <linuxppc-dev+bounces-828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FA96669E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 18:15:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwNXM2sBWz30NP;
	Sat, 31 Aug 2024 02:14:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725034499;
	cv=none; b=HDUcsnzTwYiNICmAgaxbRM+xyThf6DhSFJy+b3DhMw5FtriG2Qbvzd5fWQRCVdHKtKCqIbqEKJfWxIvRi4fAyhTsC5s8PG0yicxqVIPt3ELAzuegWxl5uueG5cGJPdYO1ctr02bHrzeaIuEpdJVhf6I3X2YVkeWd6T6FkEh+XM59lJJZThLMGHbpXE46BBFhsREKGrHP+dSts+X3ZmmqB8Omheg3hJ7Q/xcQLRhRf5dTRI4gkkf5eKLnb2N8QcWnHFbqVE/paT3+ImVYbHvBR9YF6G7cvuJ6Yx1MxFnFEpvxUvo1D+ogcvHyZoJdDyrjU5/XzyM6uOC9tKZagVeNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725034499; c=relaxed/relaxed;
	bh=hP39KjvEhHFzK05596i191mBdhVDUqtp/Tqc+PvtOIk=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=X1byna3OmsBOWQf9ix3YG7+5fIlujkLjvM82GpzLfgEqmBZr/ZXDNUQfr5d1b1gFBK2s4NFzUZHsxsQHdj3f1CPcufRKOTeUl+ydeNYQEidk5bIpBN2ECzuWP5bEQkpAfw4XBsmvmx0SDXtc35+c6W2W+bvFXk3j8dxgICj3PEOM8UKcBXIaLeWmnEwxQ+kPoh31PEMKEIZ2XxJPugoML/023Sj5Jm5bSH4Y4VLU1XMc7pL5tTYbBP1fArncQPAzzl9ETZJn+fSGcN9qPoWb5F9WMbDYg5jYeNtnjxQ5sAETS+LalkaRQ5+pDwzEE0l7wbCnUFr2WgxUTrbUR0T/Gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=X4B3Z3+R; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=4jm9=p5=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=X4B3Z3+R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=4jm9=p5=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwNXK2wrzz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 02:14:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F9525C10CC;
	Fri, 30 Aug 2024 16:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933EBC4CEC2;
	Fri, 30 Aug 2024 16:14:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X4B3Z3+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725034490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hP39KjvEhHFzK05596i191mBdhVDUqtp/Tqc+PvtOIk=;
	b=X4B3Z3+RRpb6hKFMi1l1zo0Djitaj3Er0l8oTk/JJVDXNAhN1AX8yFBysIBe+ckynP2qVO
	nyIQFAJq9DymFp/Kl5+S0iFSvp3phz7shrdSoqpPTsxO0USvCUxu6X0wOHej+YBpOuYBLG
	er0UTBm+MFCED3Ceb8+SRsiPuJfgJrg=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7100d0c8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 30 Aug 2024 16:14:50 +0000 (UTC)
Date: Fri, 30 Aug 2024 18:14:45 +0200
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
Subject: Re: [PATCH v3 4/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC32
Message-ID: <ZtHv9R8b7qwWKR2b@zx2c4.com>
References: <cover.1725031952.git.christophe.leroy@csgroup.eu>
 <e7e4c6d36cf98229850c333f113bcea909564501.1725031952.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <e7e4c6d36cf98229850c333f113bcea909564501.1725031952.git.christophe.leroy@csgroup.eu>

On Fri, Aug 30, 2024 at 05:57:08PM +0200, Christophe Leroy wrote:
> + *	r5: 8-byte counter input/output (saved on stack)
> + *
> + *	r14-r15: counter
> + */
> +SYM_FUNC_START(__arch_chacha20_blocks_nostack)
> +	stwu	r1, -96(r1)
> +	stw	r5, 20(r1)
> +	stmw	r14, 24(r1)
> +	li	r31, 4
> +	LWZX_LE	r14, 0, r5
> +	LWZX_LE	r15, r31, r5

Why swap endian on the counter?

