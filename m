Return-Path: <linuxppc-dev+bounces-2273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAEB99E109
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 10:29:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSS1l58fGz2yVd;
	Tue, 15 Oct 2024 19:29:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728980955;
	cv=none; b=l71fNWPI1RyibHp/TBYM8hnxG28VhxpbhNIpm8+JApiA7M6ThP2VYXMnjfd+KYsgd7zAnyFw+LdHdAX7VtMyxkctECH/QRZYQEbHisnuIFGrx5FBonh4k93te7u8zekgKHFO1cW5bhJHmhejQMwGbbrYQxXWVW+jsufTWLhLlKgLzn+24vPLN1V/Nnaj4rBwn4ud2pB+G2wcQKsrl/4patHTbB2gyCpX6qemhftWqYnf5gg7KSLROKAtuWVbneO5BCvfb8YKumqfYRahzeuDoAXtpR9azZAlUF+WpZw0B0HgxOxMooawMc9o3JL2frc1IGnpYopZfPmndlxTZT/QDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728980955; c=relaxed/relaxed;
	bh=7f34hNZ8N5QMtc9kv7/p1tvlxDcQfSdeHysdRXgwdRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiC2KiHYchsSf140wC6tzqTWspDqmknTf9GIaLzxtKLVcSA2V8ZAA+RWoUFk8S3lciJU9mInTPKEXEz2bxTC4I2AdwEXfxo5QY+NTM0xV2cP49Rbrby2bLayRVypVaxd9lf2g+gM0KWhEq/bMQN1TGmQ/I7dRilrXTRVUcxDaApossQbPxDkUZE4zRpRkUBuQwysVFPoCTlTUVWrfWwrQZG1tHUQ74m3AUocAWaLiFO+95KI1WSZkWOqk6vt/ykjryagc/hOGEYKzwsesa/L4mNMuUZcyT80iaZ5FQF2mzyXZl5Zyy+l35Nv7vhtmOFo56OfDxf7ro/bLCZ9LGpzaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=egqvVNG6; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=egqvVNG6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSS1k4KLrz2yGC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 19:29:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E090A412DE;
	Tue, 15 Oct 2024 08:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFFDFC4CEC7;
	Tue, 15 Oct 2024 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728980950;
	bh=DsgcZIwzu+lcz+sCcqq5yd6bbrmg5UWNN75kmiN7u1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egqvVNG6q9wlgpkO2ihI5nbC6bmr+MKMXS2UkyLdtZUnRa2mJjPhb/GoHeE8B3JIV
	 VDOtfy1iCH02B47+vC2mLdYrhXPmRCcdJ1+Qf6WXe8/wfp0qMu9/oa8S2JtMyqJO/O
	 ZmBQkqH3b1vcstwGj/aIQZ/QJ/x/VWHD7oxFh+9oQa2EPZRfC0PAr1bUMSRbgTw0WX
	 C7Lug7jeKA6ulz3nyHPgkg0UGzQL6Atd/tuR2Y2ST5aOa7GcMnBjH9MVS3YMhP6L1x
	 3BVwGozDPiF2n6afO7840UO9nN2SDmvcqv5gq/FNe0QhCmwM6wOayqIt/j1N459swo
	 /mUI7oPo31iJQ==
Date: Tue, 15 Oct 2024 01:29:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 6/8] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <20241015082905.GA1235948@thelio-3990X>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-7-rppt@kernel.org>
 <20241010225411.GA922684@thelio-3990X>
 <Zwkg3LwlNJOwNWZh@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zwkg3LwlNJOwNWZh@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Oct 11, 2024 at 03:58:04PM +0300, Mike Rapoport wrote:
> I overlooked how cfi_*_callers routines update addr.
> This patch should fix it:

Thanks, can confirm. My boot is working again and LKDTM's
CFI_FORWARD_PROTO test properly fails.

> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 3b3fa93af3b1..cf782f431110 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1148,11 +1148,13 @@ static int cfi_disable_callers(s32 *start, s32 *end, struct module *mod)
>  
>  	for (s = start; s < end; s++) {
>  		void *addr = (void *)s + *s;
> -		void *wr_addr = module_writable_address(mod, addr);
> +		void *wr_addr;
>  		u32 hash;
>  
>  		addr -= fineibt_caller_size;
> -		hash = decode_caller_hash(addr);
> +		wr_addr = module_writable_address(mod, addr);
> +		hash = decode_caller_hash(wr_addr);
> +
>  		if (!hash) /* nocfi callers */
>  			continue;
>  
> @@ -1172,11 +1174,12 @@ static int cfi_enable_callers(s32 *start, s32 *end, struct module *mod)
>  
>  	for (s = start; s < end; s++) {
>  		void *addr = (void *)s + *s;
> -		void *wr_addr = module_writable_address(mod, addr);
> +		void *wr_addr;
>  		u32 hash;
>  
>  		addr -= fineibt_caller_size;
> -		hash = decode_caller_hash(addr);
> +		wr_addr = module_writable_address(mod, addr);
> +		hash = decode_caller_hash(wr_addr);
>  		if (!hash) /* nocfi callers */
>  			continue;
>  
> @@ -1249,11 +1252,12 @@ static int cfi_rand_callers(s32 *start, s32 *end, struct module *mod)
>  
>  	for (s = start; s < end; s++) {
>  		void *addr = (void *)s + *s;
> -		void *wr_addr = module_writable_address(mod, addr);
> +		void *wr_addr;
>  		u32 hash;
>  
>  		addr -= fineibt_caller_size;
> -		hash = decode_caller_hash(addr);
> +		wr_addr = module_writable_address(mod, addr);
> +		hash = decode_caller_hash(wr_addr);
>  		if (hash) {
>  			hash = -cfi_rehash(hash);
>  			text_poke_early(wr_addr + 2, &hash, 4);
> @@ -1269,14 +1273,15 @@ static int cfi_rewrite_callers(s32 *start, s32 *end, struct module *mod)
>  
>  	for (s = start; s < end; s++) {
>  		void *addr = (void *)s + *s;
> -		void *wr_addr = module_writable_address(mod, addr);
> +		void *wr_addr;
>  		u32 hash;
>  
>  		addr -= fineibt_caller_size;
> -		hash = decode_caller_hash(addr);
> +		wr_addr = module_writable_address(mod, addr);
> +		hash = decode_caller_hash(wr_addr);
>  		if (hash) {
>  			text_poke_early(wr_addr, fineibt_caller_start, fineibt_caller_size);
> -			WARN_ON(*(u32 *)(addr + fineibt_caller_hash) != 0x12345678);
> +			WARN_ON(*(u32 *)(wr_addr + fineibt_caller_hash) != 0x12345678);
>  			text_poke_early(wr_addr + fineibt_caller_hash, &hash, 4);
>  		}
>  		/* rely on apply_retpolines() */
>  
> > Cheers,
> > Nathan
> 
> -- 
> Sincerely yours,
> Mike.

