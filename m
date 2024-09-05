Return-Path: <linuxppc-dev+bounces-1058-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B903596D977
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 14:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzzrh2ZGPz2yXd;
	Thu,  5 Sep 2024 22:56:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725540996;
	cv=none; b=YxRtHVb9R0sLePeSTscEXKSeyqPEHTjAETdlIcIaR77XN9/53hh4Uu8wrh3YWdMm2i5a9e/bravX2LC3x/Mt8LLQpaSp0bnynYW6bw52qNBlY0+8+xgWBSwPSTgF5TDnouMO3naYWdCt/Inq4xfcn6WK5avmeyYAfT3Ah6E1oQni6myMhcbSuFjvGWgRnabKPv88Gi1Dvqu30/REwlUwU84i7xVFU8KZGIc0PMmUcRxiPFv7eqMHFY065a0IuDCwOKG2Ozi1EinqFqVulkjn5CVC7PTgbCLZG2hDEJ8rsLMs5cYI62SKGq+5D8Y+lOy25rNOQ3gfIlJQfAdA6nUzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725540996; c=relaxed/relaxed;
	bh=6MTRMH1950H7pYJdyL+qM9S+/x9T4aarJ3EpbvZXG0c=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=k7qOiiLEP+p8Gq/0Db+Y6EWAAZjC/lR3furEZanS6kuDBdGt8ptU88kHW+mPS0t/LE6mSKXB3xk+1dzZyrQg6R9qAlmNWgwUPKitsWhYvEO5rHqiOyeh+btgTw2bdUlbAkVt/AR535HcFMkhd1djHyQ6nobPYVJMgR0Z3mSqiziRc8CfJ1UHsgWzluOVS9D1bn7HpZQHCBEsPkX8dccT1FqQOPfMCr81OcxAeFBFlabD0RednDhajQNxlzVt1O9ygLu0Jwiwzxx6tU/bttyPVGlkeWzXLyBIz4T58zpd2thnIfC4vC+wLT/58OVrP7g1MxlHvOranauukDdEgd/aMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=A9I5x1EB; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=A9I5x1EB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=ehjl=qd=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzzrf5DKQz2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 22:56:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BC1CCA4497B;
	Thu,  5 Sep 2024 12:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B06BC4CEC7;
	Thu,  5 Sep 2024 12:56:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="A9I5x1EB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725540987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6MTRMH1950H7pYJdyL+qM9S+/x9T4aarJ3EpbvZXG0c=;
	b=A9I5x1EBzjWpsyVHdJmPYjDYEuQpDwByqVQ89KOcyYwjwC/5UglJ7bOVFCORH/KKdLDSsj
	hE0+FEYI1HzmSRsLBGvjoYX+tvf6Yr6IvTYdDzNBFgQnOfkYAjE0L/FEuSL0rfcnnK/EpH
	wvrGrZzEfhJC/aKxpXKjrA1SYDA0ufM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 83f56dc6 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 5 Sep 2024 12:56:27 +0000 (UTC)
Date: Thu, 5 Sep 2024 14:56:22 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
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
Subject: Re: [PATCH v5 0/5] Wire up getrandom() vDSO implementation on powerpc
Message-ID: <Ztmqdr01_idiz64-@zx2c4.com>
References: <cover.1725304404.git.christophe.leroy@csgroup.eu>
 <Zthr1nB_RJ56YD3O@zx2c4.com>
 <87frqe5m5b.fsf@mail.lhotse>
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
In-Reply-To: <87frqe5m5b.fsf@mail.lhotse>

On Thu, Sep 05, 2024 at 10:18:40PM +1000, Michael Ellerman wrote:
> There is an existing comment in the a/p/vdso/Makefile about the
> fixed-r30 thing, tldr is it's a workaround to avoid breaking old
> versions of Go.

Thanks. Indeed, following Christophe's links yesterday, I tumbled down
that rabbit hole for a bit. Interesting how ABIs ossify unintentionally.


> For the series:
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Excellent, queued up now.

> If you can include Maddy's test results from Power9 in the change log
> for patch 5 that'd be nice.

Was my plan exactly. I replaced the QEMU result with the PowerNV one.

Jason

