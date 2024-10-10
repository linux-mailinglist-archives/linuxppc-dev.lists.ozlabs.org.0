Return-Path: <linuxppc-dev+bounces-2072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A57299957C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 00:54:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPlSH19mpz3bnD;
	Fri, 11 Oct 2024 09:54:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728600863;
	cv=none; b=Kmi9muCVF+omzjdocH49YFdIgo3RvP/eDwjkZXvbQ/KkilED0fea5rDvR39HPNGdA5Lfi72CzBwsB7unumxCCQInRq/Sb7sLCkQuc0ljlPifS5nGkv2rYkBwte8rBv+YxGfcvVyE9Ry7N4t4GVSCiJPFf5hL38lnwfhGU7r5camk0YYgK1iUtwPNpkVfamBW8VEBmMMH3iy0O98NzpWiK9xqwjDMiX2rTLZQdhezfQkO5rIJbkMgqb9+hJHIlBoaqe3TfkXWXuzlxlBMqm07zCcmVMCmXglBuQvUEctjz3qxmZAY6vS2Zk9bhO3ah8VLHPz3jDgCVMQrIJm4s5bQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728600863; c=relaxed/relaxed;
	bh=CtnQW9M1qfhCyoSIRxyhjm78v3iEbXx5vUa6szTpCQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qu67CDctFnFxnIvxSCxkoCK8oj0SBMVNZo0B+9qsRWIXbQ7M6dMzeiq8M0+48F5F+zWlnv+/Wd0RkVVocJX18DsLqv87JNhCwDuGK9Q6tRcHDo12E2ADws19o3kSTq/ZLgyCyBb0hx7TYqln9jGkwz8ayM+x8pf+kw5lvxbjvWpgvt/RI07zSntOl46x5licfs+V4G8KP2tOn9I7uaLZSw0Yy08NG0oCue98JjScArMwjzvXANTr0FFs+EXQwDtUhWHwZHC/0KGEF3BjmBuEQzkuZL4excj+mPznWKzNG5z9Yhu5ISxPmqjQMP7rF+W3E/j/f+QwxFbrI/XtGRMYQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QiUIOLSB; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QiUIOLSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPlSG0TfPz3bn0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 09:54:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 072705C5FDE;
	Thu, 10 Oct 2024 22:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7BFC4CEC5;
	Thu, 10 Oct 2024 22:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728600856;
	bh=dRFHj5mtH0xn8PBj2ZbOuI6o6u0ly0QH1iws5fctk8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiUIOLSBcasoVYYND8KdWz7eQh/+0boOgNRGeOQlhf5jvA1/EBnMYKjn5VICJ3eAY
	 cnnu9shlCLMfTHHTHra7MnZ0rLJlXd0Hph0c0PBZ21X9KTVg4eVdzFCTR7+dIRdltD
	 hxCWp0qmt+fIbgTEcIZSFHp2Q6iE2wK9yyyZ4vyAJOkCE63MHkbL8C+vAlgxvUIB86
	 jOXbNmyf7S3aQkYS+MyXLrzvy5GjYypHqnc1WER+qWs986tCcEJrL1436xfNVNVaY8
	 SuEhjakzc9ZUyRU5YtUSasIp4EiqD3HrJhbPDpQFeVHrdwLEF3yFgOYnlD+BEfVYYI
	 t/83JFWrskzLQ==
Date: Thu, 10 Oct 2024 15:54:11 -0700
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
Message-ID: <20241010225411.GA922684@thelio-3990X>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-7-rppt@kernel.org>
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
In-Reply-To: <20241009180816.83591-7-rppt@kernel.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Mike,

On Wed, Oct 09, 2024 at 09:08:14PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> When module text memory will be allocated with ROX permissions, the
> memory at the actual address where the module will live will contain
> invalid instructions and there will be a writable copy that contains the
> actual module code.
> 
> Update relocations and alternatives patching to deal with it.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

I bisected a boot failure that I see with CONFIG_CFI_CLANG enabled to
this change as commit be712757cabd ("x86/module: perpare module loading
for ROX allocations of text") in -next.

  $ echo CONFIG_CFI_CLANG=y >arch/x86/configs/cfi.config

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig cfi.config bzImage

  $ curl -LSs https://github.com/ClangBuiltLinux/boot-utils/releases/download/20230707-182910/x86_64-rootfs.cpio.zst | zstd -d >rootfs.cpio

  $ qemu-system-x86_64 \
      -display none \
      -nodefaults \
      -M q35 \
      -d unimp,guest_errors \
      -append 'console=ttyS0 earlycon=uart8250,io,0x3f8' \
      -kernel arch/x86/boot/bzImage \
      -initrd rootfs.cpio \
      -cpu host \
      -enable-kvm \
      -m 512m \
      -smp 8 \
      -serial mon:stdio
  [    0.000000] Linux version 6.12.0-rc2-00140-gbe712757cabd (nathan@n3-xlarge-x86) (ClangBuiltLinux clang version 19.1.0 (https://github.com/llvm/llvm-project.git a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4), ClangBuiltLinux LLD 19.1.0 (https://github.com/llvm/llvm-project.git a4bf6cd7cfb1a1421ba92bca9d017b49936c55e4)) #1 SMP PREEMPT_DYNAMIC Thu Oct 10 22:42:57 UTC 2024
  ...
  [    0.092204] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
  [    0.093207] TAA: Mitigation: TSX disabled
  [    0.093711] MMIO Stale Data: Mitigation: Clear CPU buffers
  [    0.094228] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
  [    0.095203] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
  [    0.096203] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
  [    0.097203] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
  [    0.098003] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
  [    0.098203] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
  [    0.099203] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
  [    0.100204] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
  [    0.101204] x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
  [    0.102203] x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
  [    0.103204] x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
  [    0.104051] x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
  [    0.104204] x86/fpu: Enabled xstate features 0x2e7, context size is 2440 bytes, using 'compacted' format.

then nothing after that. Boot is successful if CFI is not enabled (the
initrd will just shutdown the machine after printing the version string).

If there is any further information I can provide or patches I can test,
I am more than happy to do so.

Cheers,
Nathan

