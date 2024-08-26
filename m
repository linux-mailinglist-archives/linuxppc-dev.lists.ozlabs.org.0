Return-Path: <linuxppc-dev+bounces-494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F2195EA4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WshyB2J5Kz2yDk;
	Mon, 26 Aug 2024 17:24:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724657074;
	cv=none; b=Qa/8dQN4PFiySLADQ6vnGQdoFUdo0TKO+4xICbNLkF6E3SsdpSoPqCwH1Hfd3AVNuAMM3S0b/pJgJkjUVloMSYYNPlAhsdrXog0o35YJNDh+Fsx4sKJE8Rz3TyBAM8cXdk2Hq2jLRdeiqTkwUqr67TDQg20Pa9SHEymAIlXS+v7QT5B/x9vuPPN8TjsZ2CHzVffH93xKaRgAUBBswffBQohyk9qxlDGsXd/TFAY6lDR0WEYAKEW0VJVRK15oRJjShs+vDFWUmertJdwlPTM8rcbFKQEKxM7LgmBi9NxhgIHp51Zq5U0b+AH3nnpG0xcEXoKN3X60Gz2euOFkCS7+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724657074; c=relaxed/relaxed;
	bh=4XYrcqllZpLLj+sqSt83ZS4OGpB+ny/dHDpTQVKEcw0=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=l2XO5au+/m0UNj0lov+hTSgZs9vMAPRdDlhYt1VM3dQgx7Bpi39f55bfPYIaaN1O+K+YWJakrODzUmakvP/QpcE43goGxkQXmn2kcE2JruVeErob6dHUNti58wgJhSnqg8m2e/WrIlrAWrngQEKwtXb69hoXLZA/Uwx2K2NfvjooM0os8UbqXz6NihyV/MYqxXU1o8ux7W7lOPqtAfBIP8P06IwE4XQrYKBD2KquEgaGrVSFtQzYNOCxHb9uk1Dtan6IMYXnYbRf3Fi2rjAM/KPoWk7/JvazAIWCeqiaKWWUUw2j2nvw3o9GGWartL6DWWYhAejSyhNMs2+2339r6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=WRvWNHkl; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=WRvWNHkl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=srs0=kq7x=pz=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wshy80zrrz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:24:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D1238A41C61;
	Mon, 26 Aug 2024 07:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20AFAC4FDFE;
	Mon, 26 Aug 2024 07:24:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WRvWNHkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1724657065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4XYrcqllZpLLj+sqSt83ZS4OGpB+ny/dHDpTQVKEcw0=;
	b=WRvWNHkl3kMGmPVF84AOTFbuLtotKvO5WMOvOcjiQTO5GGt6yxvAvXfJ5NC3ABH4Au/AaH
	lXGxAvyyPehGMUl9Mc67zHgogobiWleqNKnOoQ+iYXZybbgRN4TFpXcnAnXpsJUY6u7XVU
	ZC6nTPIX+X1v5ceKtm4RmJaWa03cBCQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e51e9de (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 26 Aug 2024 07:24:25 +0000 (UTC)
Date: Mon, 26 Aug 2024 09:24:16 +0200
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
Subject: Re: [PATCH v2 03/17] vdso: Add __arch_get_k_vdso_rng_data()
Message-ID: <ZswtoMbWC3se1su3@zx2c4.com>
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <30560b394eaa00fded11fa5bbe5f679c7ffe1714.1724309198.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <30560b394eaa00fded11fa5bbe5f679c7ffe1714.1724309198.git.christophe.leroy@csgroup.eu>

On Thu, Aug 22, 2024 at 09:13:11AM +0200, Christophe Leroy wrote:
> _vdso_data is specific to x86 and __arch_get_k_vdso_data() is provided
> so that all architectures can provide the requested pointer.
> 
> Do the same with _vdso_rng_data, provide __arch_get_k_vdso_rng_data()
> and don't use x86 _vdso_rng_data directly.
> 
> Until now vdso/vsyscall.h was only included by time/vsyscall.c but now
> it will also be included in char/random.c, leading to a duplicate
> declaration of _vdso_data and _vdso_rng_data.
> 
> To fix this issue, move declaration in a C file. vma.c looks like the
> most appropriate candidate. Don't need to replace the definitions in
> vsyscall.h by declarations as declarations are already in asm/vvar.h
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Move x86 DEFINE_VVAR(_vdso_data) and DEFINE_VVAR(_vdso_rng_data) in vma.c

Thanks, this seems sane to me. I'll apply this now to random.git as a
fix; it should have been done this way before and is going to be a
headache to coordinate later.

Jason

