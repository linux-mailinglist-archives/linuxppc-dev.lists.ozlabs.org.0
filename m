Return-Path: <linuxppc-dev+bounces-873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0F9687B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 14:41:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy7g30KBpz2xGH;
	Mon,  2 Sep 2024 22:41:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725280911;
	cv=none; b=ZjFM4pPj+FqRlhpd34VUl+FiMgCgFQCuxoPdBPZFCFge4yQ111VsG/xkbUDLKd8rvi4aPJdhLckQn8XDZLbN44FRbt/naBbD5A1yX7dMZmAbvNMvntNoJTWA6RdilMaqXwChhNHb4YWV6D0z9HpZ4IDYEDo4nZUqJhfbyxpe+AbCUdMrZcszTe9dp+7dK9IXp19VCzCjUWqgEKO+TT+pLY9d4dVxxGenUpP9bw+6sVtNO0I0hevcXZAcj2qKEIz9btPX6tDgtkDok+vQnQgBblru7PgORlx/lAMguMRTNNQY2AtUJeRhdPAl01LncNY+6snNGVCXEn+bTNnGLFoUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725280911; c=relaxed/relaxed;
	bh=SbTBvowwyqT3oktU3TVamYzwl3zcSe2e1nUrzf5xWhI=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=WTueoTBLTHkKsxnkXAs73CipJHXxaZO6vmqiyRh/cZ5THuCRw5I//rEjkqIYOFGFaujwNMY6yUxavcDL+GiZbioMCbzXUuQs/RW5lbrAqynNPkYDLp9zHIUlbMXhGRPKZMn9YKAInBI2dJZesohlvZ1xLGCdt+43fqJ/U3QyrG1UTBOLDu401bbF6y4Cz372/+64Qha5ZAQFKzwjTpwr9/TCa3L4WRHppNgP++OgiDHx3WSt/P8LBwOfdz3PoWcfi3IYEZ3UFNm1k7alJVTpLHiY9f8TLsKkLVY4WtWpAOfXTK52eqw0q+j4R2dKT7LNpy51rXJb9VM8ok3uZgEesg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=M4l7tvQZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=M4l7tvQZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=hwiv=qa=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy7g25m5Rz2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 22:41:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC3375C5827;
	Mon,  2 Sep 2024 12:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743FAC4CEC2;
	Mon,  2 Sep 2024 12:41:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="M4l7tvQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725280902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SbTBvowwyqT3oktU3TVamYzwl3zcSe2e1nUrzf5xWhI=;
	b=M4l7tvQZwQqTIhDhEWMzWRgk170y1R8WZOVuU9ydtbdFJffbSwgyBcPmyblIcx3RaFuuft
	0P1p7MEgxZ3b5Ms3Cv7Fo3H/sfGe8NhzU87uuO6Yo/cbI9eyDQYOhSvjsK5nWiAA+exnbi
	zSdAwQMYfNPZ9fMXx3kRAE0vEnV4nRQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id db49d980 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 2 Sep 2024 12:41:42 +0000 (UTC)
Date: Mon, 2 Sep 2024 14:41:30 +0200
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
Message-ID: <ZtWyeuCfzZ66fVsg@zx2c4.com>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
 <27de70dcc356e56754a03a2887a97597f5e840a4.1725278148.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <27de70dcc356e56754a03a2887a97597f5e840a4.1725278148.git.christophe.leroy@csgroup.eu>

On Mon, Sep 02, 2024 at 02:04:42PM +0200, Christophe Leroy wrote:
>  SYM_FUNC_START(__arch_chacha20_blocks_nostack)
>  #ifdef __powerpc64__
> -	blr
> +	std	r5, -216(r1)
> +
> +	std	r14, -144(r1)
> +	std	r15, -136(r1)
> +	std	r16, -128(r1)
> +	std	r17, -120(r1)
> +	std	r18, -112(r1)
> +	std	r19, -104(r1)
> +	std	r20, -96(r1)
> +	std	r21, -88(r1)
> +	std	r22, -80(r1)
> +	std	r23, -72(r1)
> +	std	r24, -64(r1)
> +	std	r25, -56(r1)
> +	std	r26, -48(r1)
> +	std	r27, -40(r1)
> +	std	r28, -32(r1)
> +	std	r29, -24(r1)
> +	std	r30, -16(r1)
> +	std	r31, -8(r1)
>  #else
>  	stwu	r1, -96(r1)
>  	stw	r5, 20(r1)
> +#ifdef __BIG_ENDIAN__
>  	stmw	r14, 24(r1)
> +#else
> +	stw	r14, 24(r1)
> +	stw	r15, 28(r1)
> +	stw	r16, 32(r1)
> +	stw	r17, 36(r1)
> +	stw	r18, 40(r1)
> +	stw	r19, 44(r1)
> +	stw	r20, 48(r1)
> +	stw	r21, 52(r1)
> +	stw	r22, 56(r1)
> +	stw	r23, 60(r1)
> +	stw	r24, 64(r1)
> +	stw	r25, 68(r1)
> +	stw	r26, 72(r1)
> +	stw	r27, 76(r1)
> +	stw	r28, 80(r1)
> +	stw	r29, 84(r1)
> +	stw	r30, 88(r1)
> +	stw	r31, 92(r1)
> +#endif
> +#endif

This confuses me. Why are you adding code to the !__powerpc64__ branch
in this commit? (Also, why does stmw not work on LE?)

