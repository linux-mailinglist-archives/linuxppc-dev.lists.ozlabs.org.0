Return-Path: <linuxppc-dev+bounces-498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2B95EA6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:29:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj3G4T3Sz2yFD;
	Mon, 26 Aug 2024 17:28:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724657338;
	cv=none; b=jBzqbfV42sQzBUIZlkZdDeumyYfXqgua7qQfbAyd0bMJoK9KgBL5b/JFj/UL+xbTjGHSUJWR0k3shaU4c7+SgCohPGK0Gox12mrabPvQzNtiQXNIdqRn8V49qD3FBzaSCYs8FMZ4wH776fQ4BRGy5iggyTjZY0g5HfJfn3F2SKnqrB8yX7tnVci18/nCoQKjaGLvyYVve19wLI228+CXYZkz6bw8X1pj8hG7EzWaxmyDs2pa9hx+3Bkir+o4fIbaVJ0oov8j4iRjpHSUqM/UVP1QH2Skv35E3ipD88n8ofW2Ah6cwUoOulx1a7fi+faTLSuW2ZDkkG5yo72F6dRUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724657338; c=relaxed/relaxed;
	bh=cIIjB88DbOJOvuZ2jjU6lJJKiyoqxEyU/0md06aOA9Y=;
	h=X-Greylist:Received:Received:DKIM-Signature:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=h6HNlF6qS/Wb2O1z5jxstxf+uud8Tr4+g5Dng9229pXgUA04ouqEOv2psS722418Fy87fuLBYt/F4fWHfY/PCgLKi4jCFK1FgUxbZ6EeUuG2/mmD9A3I4BQ4HNdN6p/M2BJWYUFp0rtHqeE0r33gjU8s87lo74yI+gg8JtwxhNkyavlQ/2O9dYK4NKLoJnKAA2TmufKL9UjxNbP582pdx6sQE1Ce1HuSFxOL0r5HFx1e6KKBgaONoJGZyHAj3JdEHPptBkPE/lEBklU0JPrVhuy/ZE2PwVn4KN9V9TCqIcChPANZela+IHHfZPxT9iHJEbtrc2CvaEXiKaBFY08acA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=fGS4lsQP; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=fGS4lsQP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 100 seconds by postgrey-1.37 at boromir; Mon, 26 Aug 2024 17:28:58 AEST
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsj3G2hkjz2yF6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:28:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C13CA41197;
	Mon, 26 Aug 2024 07:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880B9C8CDC1;
	Mon, 26 Aug 2024 07:28:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fGS4lsQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724657332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cIIjB88DbOJOvuZ2jjU6lJJKiyoqxEyU/0md06aOA9Y=;
	b=fGS4lsQPmJ47S4KPzgxk3QvyNtKhSk0/NSOVe7mmBsaTQCOpf8LdeOZ8NRFSZVGvJlo+6S
	zya3q8/MC3vnj7W6QkSb/tQ7ibwWIO7gaTmCFFEUbZBJZ4gTKo0ADc09YExEQZvcI0SprG
	MnhV/Nlqebjptb73hPDfjdwYVd0Acps=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 087983a8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:28:51 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:28:42 +0200
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
Subject: Re: [PATCH v2 14/17] selftests: vdso: Make test_vdso_getrandom look
 for the right vDSO function
Message-ID: <ZswuqjC8T8TwF8LJ@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <04d1de23a2ff14e2709edd8b75e27b81d703bc57.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <04d1de23a2ff14e2709edd8b75e27b81d703bc57.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:22AM +0200, Christophe Leroy wrote:
> Don't hard-code x86 specific names, use vdso_config definitions
> to find the correct function matching the architecture.
> 
> Add random VDSO function names in names[][]. Remove the #ifdef
> CONFIG_VDSO32, having the name there all the time is harmless
> and guaranties a steady index for following strings.

This is indeed the right way of doing it. Thanks. I'll take this now,
though with one small fixup:

> +	const char *version = versions[VDSO_VERSION];
> +	const char **name = (const char **)&names[VDSO_NAMES];

I'll just do:

        const char *name = names[VDSO_NAMES][6];

Instead of referring to name[6] everywhere after. Seems more straight
forward.

Jason

