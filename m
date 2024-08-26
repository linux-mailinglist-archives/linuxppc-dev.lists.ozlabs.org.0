Return-Path: <linuxppc-dev+bounces-495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0423695EA55
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:26:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj0w5RGQz2yF0;
	Mon, 26 Aug 2024 17:26:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724657216;
	cv=none; b=jfKLb1pTHzTMQGVivgSj0OEEUPRLC3hLFp8WX764owmsZJINI80j3HRMtvpSaRSOBkXg+tHmYbCQ6Gy+3NjrhjeTiIhpTuJXbgIAyX251Wt64HV7IaDCO1lovcYeJgkhGxi9vD5gpF8Jo0CeHKDt21KS4s47e8FtOAog1IdMQy+y5zoAejLRhOpM7KJAHLEskiIA40JwLT9QHzbiJ7HEZGY/4TspATXsXb1FgCMHlM02Sz2eo/dfu//rYiSewlVSGJEwRmetkHx9DXaTcKfPLYpS2oUnfABbALikwFPJSf0lDte48Se3akv5rvQKx7mVev6ETQ2796Dc0aDYCRpqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724657216; c=relaxed/relaxed;
	bh=w24dLA36c/d+xQ7ZOImOMWGl1II9pRfdgFurGBE0teA=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=C/p8PkShvdJH8vFG0rkLqxU+h4J1zDYazwpJYd+6HdEacL9sNYdcSbPS9/dmBnFTIjQTU532G/vyP2nnlLZ4TsHDPUXZnSVUOuqadP+2XyCmSOQmJ8gO6ECBICP3eK+poPksoQbK/oSpXHR2KjC0OM213japXZM64DKrcI3T7lMFHQzGcwK25+2NrdR77XAL3BuSxRwwFSTOrmVj5LSOgBoScTex1A9K+0+C1xGdMSIuBMgjP02CTRE8o7lruIiNW5imUEjsc984Y3IqqG2lLiUvvuOnf+tR9vYUvEhon+tf5fu8/w1X1HyK0yMdlqZAp6xmttpSDsePrdegGvzpqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eYAnrPy3; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=eYAnrPy3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsj0w3Vk8z2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:26:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FE08A41188;
	Mon, 26 Aug 2024 07:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2BEC4FDF3;
	Mon, 26 Aug 2024 07:26:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eYAnrPy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724657210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w24dLA36c/d+xQ7ZOImOMWGl1II9pRfdgFurGBE0teA=;
	b=eYAnrPy37tSdpNsOmLxnE9vtVohlmjxR65Olke78XoDNkBDbyRAPVZ8yVj5TfBfvzC93iz
	U17fXHlJI9Qzp1HLsBACdsK6/LpPt0sDt6PMsbbcE1euKmR/4Icub25zv3gIElrlQ9wXEB
	9UYlaBoAY1m9Yx1tf5dw5a/jQPgDNBY=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d127c021 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:26:50 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:26:40 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 13/17] selftests: vdso: Don't hard-code location of
 vDSO sources
Message-ID: <ZswuMITw0PLJJBuU@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <a40d859dba5654239650eec44d75ab45c98221f4.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <a40d859dba5654239650eec44d75ab45c98221f4.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:21AM +0200, Christophe Leroy wrote:
> Architectures use different location for vDSO sources:
> 	arch/mips/vdso
> 	arch/sparc/vdso
> 	arch/arm64/kernel/vdso
> 	arch/riscv/kernel/vdso
> 	arch/csky/kernel/vdso
> 	arch/x86/um/vdso
> 	arch/x86/entry/vdso
> 	arch/powerpc/kernel/vdso
> 	arch/arm/vdso
> 	arch/loongarch/vdso
> 
> Don't hard-code vdso sources location in selftest Makefile,
> instead create a vdso/ symbolic link in tools/arch/$arch/ and
> update Makefile accordingly.

That seems like a good way of handling it. As archs add their
implementations, they can just add the symlink and do no more work. It
will also make review slightly easier: if I don't see the symlink added,
I'll know the submitter didn't actually test their chacha :-P.

I'll take this into my random.git tree now as a fix.

Jason

