Return-Path: <linuxppc-dev+bounces-829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 466BF9666A5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 18:17:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwNbY1y1mz30PD;
	Sat, 31 Aug 2024 02:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725034665;
	cv=none; b=RE+QogEp2twOcLxmdS1fXIsjtFJKTO40a990X6/nlucvN8kG3NZWYsSXrxXti8MKNGI8yMjN3DsP3HmuEwu2PGhGJNsGCtcn1dIg9X0RZrmg1/cLgjPBmOCugaZrxEj1rqGUg9jsbCsIPncaFafQ52vI5uhELnKZCJOOeDH7QhZw7SsEchh3FxoWLPm2PJiPHRNIx9FwLv2VaLg+OpDH7TvTw4ecqJI91DqM83X0fFg+F5rC5ApCyL6WQ7UU7AxtFX8nYrfLYaaaX267h/iDJakAKUgreF4S3tOUmJZeS5ENVDlfUHT9+PRbhev1rxBXPlXJ9HcQ1nvXx7Hct5KFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725034665; c=relaxed/relaxed;
	bh=4V9WSctwTuWuaC+9YWeMzjXHA67ruA71pLDIgbwvzQM=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AmDXRmZXkclpl0pog+RqWFNX8XELHaJqli1N88TwlH5cyQIDLHksNvsfj28DY7mOARbr4DVAfx7VEzCjYVGHWWwYMyqUYmQGDe6bp7Ze/0ZApFTf4UH87VdtNXmSIVRJfsz0ehugI7BpLW42c2JTIWKAUGGrPLI50NCqyr4dEUKqUud3kaq4AcPVNm7h410atQvLufDSf2ZrUDu3ZQYpACOS/Kv0xjstl52i9r6VerxaS8Wu7j0cLnYW/oE95y78EI1RT9wnVCBwQHNqtSCoznRqpr/MyQEVG6dennD7bkmMD4d6GgYAf8o91t4Z0cIxQy8NUtEi1ksdMjdwrJcjnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=JpbhujkJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=4jm9=p5=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=JpbhujkJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=4jm9=p5=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwNbY0P2yz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 02:17:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20A175C006B;
	Fri, 30 Aug 2024 16:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB6AC4CEC2;
	Fri, 30 Aug 2024 16:17:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JpbhujkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725034657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4V9WSctwTuWuaC+9YWeMzjXHA67ruA71pLDIgbwvzQM=;
	b=JpbhujkJUXq1uk0Y0jqDBpxTfnVNfq53N2rv5YQsHeCptpCOwgh3bCbr/YIMxylwO3n5No
	TnOFlxyTKJEG2X1X/9gM2gvPyskQiCmifotrmFx2qf7yyQJjLTybZ8GLL+cn/0YbdYgx6z
	7oh7adhrtquvMjsiHA2IQwUSPYbEkrA=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 21e77804 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 30 Aug 2024 16:17:37 +0000 (UTC)
Date: Fri, 30 Aug 2024 18:17:33 +0200
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
Message-ID: <ZtHwnc4AZuRULkom@zx2c4.com>
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
> @@ -14,6 +14,10 @@ ifeq ($(uname_M),x86_64)
>  TEST_GEN_PROGS += vdso_test_getrandom
>  TEST_GEN_PROGS += vdso_test_chacha
>  endif
> +ifeq ($(ARCH),powerpc)
> +TEST_GEN_PROGS += vdso_test_getrandom
> +TEST_GEN_PROGS += vdso_test_chacha
> +endif

FYI, as of [1], you should now be able to add powerpc to the filter list
instead of having to duplicate a new stanza:

[1] https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git/commit/?id=bbaae98172ed284fc0d5d39cc0d68f5d06164f06

