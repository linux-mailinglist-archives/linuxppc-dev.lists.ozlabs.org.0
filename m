Return-Path: <linuxppc-dev+bounces-2118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D265999A44D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 15:02:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQ6GJ6kjhz3btJ;
	Sat, 12 Oct 2024 00:02:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728651720;
	cv=none; b=Y8B8hf7OzetJSCnQ7OKvgZdnWnpEFskfPgLd3dtXs24ZE/+6844+wwWKg/haxI3dFVRzFgHi4ZVHRLg7psxpZBkc8jzwdegOQH8bQr05yuwa/oK5cx04pnsF2WRYdaOoDqY9Ia6MKu1/CNCssvmAwclilt7Jjz2GVeaCyrts9K7d50+RgrdmVHyekMP15kixJJ/ARn8X21SugkjFyI16QbPPN3ajdYq8yGyPSkkSX2a1Bh+w6A87zJ0lqhtkj2v1mJHyLmwmwrFiS0L3+QSP3LovtJEOyk6OKDZYVTHjGBm9/J3OMkk7OagfkxgBfJAkVYZdvSlVwuJex6kxiaKiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728651720; c=relaxed/relaxed;
	bh=QR96X5me7JPEdxmex0+cq4Kl2Zr+RXQlVgevmpU+1i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fo2JKGSlDU1INM4pqVD0a/Z09co+MfrgXR0mnNoBZPHxoQAUyKdcwqYKU1WMdJskm+CRiYcISAzmoBfAttBHcEX24MVFB6kF0g0sUeibbkFPyQ+tnd3AQpR9Fz4U40KogqHBg82Vhg2HY3CytkNEA8AjtWKGweBvXQLuTcLiVcm2co8xClGTpjRcjMuTrxraGd64DgseSRMM1LQVxeOHkf3aj6lUO/6vC3ToEQwxY5LFEVeSO3a06ELFmJfmKsZfw9eyvIUzjTKwASC3tgfGcjAj76XVaBdiPzAqfBYc9yF+3OuZRbKVwXXbQtgkB1Wqy9vFzOkZ5Z+c0Qe5omrwqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oaq6u26x; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oaq6u26x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQ6GH3nlyz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 00:01:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5723D5C5D87;
	Fri, 11 Oct 2024 13:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABE8C4CECC;
	Fri, 11 Oct 2024 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728651714;
	bh=j6FIkJsgrJb7Fy59tSRAkzfdThNSkDRiwl7mc5Gyfrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oaq6u26xuDAEns7R2BMHzk4mIfr5FvGiVAeZZthgyUlPcz06DFRl95J0wmkdOT54S
	 YxSAeidiUzjAm9FHVkdDWMVY0Rbrih0bi/ggL0JYHKzOopKm6PqY7SOiicdRP66yLH
	 5VGXr5I3OyVhwrNf1s3DsezlYqKELPmsDJA9V5PkevyRbR9c/cPzuOfoCS+m2Co7l0
	 +b6MYlu7b05Tu5XRA7HGcdEBXgbkMUXnasokDLcI2U83NwvkTB9/gQY3jZ2G5u5tvh
	 AFQJNhIyJak3q6KuqIiMeMoh+g8h6wyqQ854Avo5pBLLyOPI6RqZBJ4HC26lw54SRH
	 zUMItw7kbSuLg==
Date: Fri, 11 Oct 2024 15:58:04 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
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
Message-ID: <Zwkg3LwlNJOwNWZh@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-7-rppt@kernel.org>
 <20241010225411.GA922684@thelio-3990X>
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
In-Reply-To: <20241010225411.GA922684@thelio-3990X>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 03:54:11PM -0700, Nathan Chancellor wrote:
> Hi Mike,
> 
> On Wed, Oct 09, 2024 at 09:08:14PM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > 
> > When module text memory will be allocated with ROX permissions, the
> > memory at the actual address where the module will live will contain
> > invalid instructions and there will be a writable copy that contains the
> > actual module code.
> > 
> > Update relocations and alternatives patching to deal with it.
> > 
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> I bisected a boot failure that I see with CONFIG_CFI_CLANG enabled to
> this change as commit be712757cabd ("x86/module: perpare module loading
> for ROX allocations of text") in -next.
 
>   [    0.000000] Linux version 6.12.0-rc2-00140-gbe712757cabd (nathan@n3-xlarge-x86) (ClangBuiltLinux clang version 19.1.0 (https://github.com/llvm/llvm-project.git a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4), ClangBuiltLinux LLD 19.1.0 (https://github.com/llvm/llvm-project.git a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)) #1 SMP PREEMPT_DYNAMIC Thu Oct 10 22:42:57 UTC 2024
>   ...
>   [    0.092204] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
>   [    0.093207] TAA: Mitigation: TSX disabled
>   [    0.093711] MMIO Stale Data: Mitigation: Clear CPU buffers
>   [    0.094228] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
>   [    0.095203] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
>   [    0.096203] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
>   [    0.097203] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
>   [    0.098003] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
>   [    0.098203] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
>   [    0.099203] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
>   [    0.100204] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
>   [    0.101204] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
>   [    0.102203] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
>   [    0.103204] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
>   [    0.104051] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
>   [    0.104204] x86/fpu: Enabled xstate features 0x2e7, context size is 2440 bytes, using 'compacted' format.
> 
> then nothing after that. Boot is successful if CFI is not enabled (the
> initrd will just shutdown the machine after printing the version string).
> 
> If there is any further information I can provide or patches I can test,
> I am more than happy to do so.

I overlooked how cfi_*_callers routines update addr.
This patch should fix it:

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 3b3fa93af3b1..cf782f431110 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1148,11 +1148,13 @@ static int cfi_disable_callers(s32 *start, s32 *end, struct module *mod)
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
-		void *wr_addr = module_writable_address(mod, addr);
+		void *wr_addr;
 		u32 hash;
 
 		addr -= fineibt_caller_size;
-		hash = decode_caller_hash(addr);
+		wr_addr = module_writable_address(mod, addr);
+		hash = decode_caller_hash(wr_addr);
+
 		if (!hash) /* nocfi callers */
 			continue;
 
@@ -1172,11 +1174,12 @@ static int cfi_enable_callers(s32 *start, s32 *end, struct module *mod)
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
-		void *wr_addr = module_writable_address(mod, addr);
+		void *wr_addr;
 		u32 hash;
 
 		addr -= fineibt_caller_size;
-		hash = decode_caller_hash(addr);
+		wr_addr = module_writable_address(mod, addr);
+		hash = decode_caller_hash(wr_addr);
 		if (!hash) /* nocfi callers */
 			continue;
 
@@ -1249,11 +1252,12 @@ static int cfi_rand_callers(s32 *start, s32 *end, struct module *mod)
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
-		void *wr_addr = module_writable_address(mod, addr);
+		void *wr_addr;
 		u32 hash;
 
 		addr -= fineibt_caller_size;
-		hash = decode_caller_hash(addr);
+		wr_addr = module_writable_address(mod, addr);
+		hash = decode_caller_hash(wr_addr);
 		if (hash) {
 			hash = -cfi_rehash(hash);
 			text_poke_early(wr_addr + 2, &hash, 4);
@@ -1269,14 +1273,15 @@ static int cfi_rewrite_callers(s32 *start, s32 *end, struct module *mod)
 
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
-		void *wr_addr = module_writable_address(mod, addr);
+		void *wr_addr;
 		u32 hash;
 
 		addr -= fineibt_caller_size;
-		hash = decode_caller_hash(addr);
+		wr_addr = module_writable_address(mod, addr);
+		hash = decode_caller_hash(wr_addr);
 		if (hash) {
 			text_poke_early(wr_addr, fineibt_caller_start, fineibt_caller_size);
-			WARN_ON(*(u32 *)(addr + fineibt_caller_hash) != 0x12345678);
+			WARN_ON(*(u32 *)(wr_addr + fineibt_caller_hash) != 0x12345678);
 			text_poke_early(wr_addr + fineibt_caller_hash, &hash, 4);
 		}
 		/* rely on apply_retpolines() */
 
> Cheers,
> Nathan

-- 
Sincerely yours,
Mike.

