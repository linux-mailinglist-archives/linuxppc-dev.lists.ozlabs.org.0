Return-Path: <linuxppc-dev+bounces-514-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB4695EAA4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:38:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WsjFw16Y5z2ynj;
	Mon, 26 Aug 2024 17:38:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:40e1:4800::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724657892;
	cv=none; b=BL7yzOZBb1M5M098qwRLsNl49/zKV7WnpQjCufdQIWiRANKRbSTKxL3ICQ2nwni+fbI1hvuE+NVIg4WzAP5cZOBSfEzQcSffdNf1YXwvu35cAaH7e4MKHO8lZtvx2DatytqBWsgmb3uoBhtVdK6MjyGTU+W0+uSud06TzmjrLW0wOg9TZo3ZYT9oY/6zuVrLaTkJ5ZDs7FNnZHT242jRdcWTnOh6njVAiW9dkOOyrl0UonndbiUouIU5c1R9Yky5SW5iO3B4BtAA3ySi1rklKBGMfjzyfqorD/YESJ9PDvGhhKcKPFI1Uq2U0NWhDL3HuuiCUv5nRuPPNk63wEBy0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724657892; c=relaxed/relaxed;
	bh=jumxgHXVZw5b27vJZV1Xc81w+BGEUEBT++1X+y17eXM=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OMW8pB7guqK/RLUYFQme02hnOf64W/cPlSH1NTCGQlYQV+4vzq9NwqkEvAHf+MrwWiCpFv8kShSQE9gk+6r6M68UNMR36gZsXBEfif3wM0L5tkKwls7LMReTcQOBXSo2dfC7ys7e6CT7x1vm34L8AMnoGQy58CLB8ghYUNgMkKlJPGP2ORcluvRDi3Mf8BiLIO4+WLGeGHxSnTGycpFNBBdUpD2IDnZG31Q52BOFr47ddnvLI276rHGphw2Ixw76yIrP1WbAKqZxy8pGAUE2Q96105iSSrHWAe4SOy/fZXhLzT+++Wt+Bk8JG2sEbfeucH0oYHp82f2Q6bCZETN+Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=X2EiMjdR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=X2EiMjdR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WsjFw0ClDz2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:38:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25C6ECE0B2F;
	Mon, 26 Aug 2024 07:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A2AC8CDC1;
	Mon, 26 Aug 2024 07:38:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X2EiMjdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724657885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jumxgHXVZw5b27vJZV1Xc81w+BGEUEBT++1X+y17eXM=;
	b=X2EiMjdR3EdNxjI3x1bQOgJRdF//Juq/iK+blRCB6mkEKShZv2DdzDb5T6sJ0CSgr8DTrO
	CHOW8X2DqZjtE1ZGFBTwT3XueIppy4bMGI92dBoD+xkYb3vIpgFmTKlgdb8V1tfoLKBvtF
	hY0i04RI9PjGE4L3q01XhoKRLDN13cI=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6957f791 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:38:05 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:37:56 +0200
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
Subject: Re: [PATCH v2 16/17] selftests: vdso: Make VDSO function call more
 generic
Message-ID: <Zsww1IgALClDUf8g@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <bd05c8faee64972a9e01f9497d1870dc267a55f4.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <bd05c8faee64972a9e01f9497d1870dc267a55f4.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:24AM +0200, Christophe Leroy wrote:
> On powerpc, a call to a VDSO function is not a standard C function
> call. Unlike x86 that returns a negated error code in case of an
> error, powerpc sets CR[SO] and returns the error code as a
> positive value.
> 
> So use a macro called VDSO_CALL() which takes a pointer to the
> function to call, the number of arguments and the arguments.
 
You'll probably want to move to VDSO_CALL() for the whole test suite,
not just the getrandom one, right?

