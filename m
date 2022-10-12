Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D2B5FC39B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 12:16:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnT8H6WgCz3bnH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 21:16:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nfZwwXji;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TNuc/J+n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=nfZwwXji;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TNuc/J+n;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnT776zS4z2xKV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 21:15:30 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 58A003200805;
	Wed, 12 Oct 2022 06:15:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 12 Oct 2022 06:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1665569722; x=1665656122; bh=83CvuiBE1w
	c4vTr2PjjGiIv+STUdLqJ4IDEFHLHKt60=; b=nfZwwXjicT/zv2ohfD1WiM9qnt
	xaVbNBpGfSJardxO+Fc+6D+uO6U69rLTxzWh5MYPGN5Rb2V3qGslwBIqdY6FdC5p
	MjOc2gyFOssEZhIAMAp95oBkeKc4+OAeYHg7kOHO+hOsmNRe9QAYGZ4vtKmsL9GW
	Aq7znlmAUb+DmpBH+ScmIkE+40YbDeo64IUE+nQKj7jcAczHq9eWBunZbHzpFiy0
	0BFZcL6ZpK28blxAFpj3fkaYVkhGP0OqFFawQ8dHANGhDMeOU1q+Xi6CxGRuvBMr
	VEWiK71JjmvR+Wyj6irHtTK2hV0Sk60JF0EvMJslr5QRU4qi3Mv2s+NTk3ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1665569722; x=1665656122; bh=83CvuiBE1wc4vTr2PjjGiIv+STUd
	LqJ4IDEFHLHKt60=; b=TNuc/J+nKxOdnB7n2MwgAaonbCiVFUOH2neWIrYYucUT
	nTt22qkZLTx0I0qKerMRfxNiGiF5GNuy7HzGpjfEq/t1si6eEzUPbOV7OG2cjwKw
	ll2UFTKE4gSI+V86+nNp22Httl6GQWsdYSpM1HmgUV0hPsKBHI/aKIqsDJ3UOWSV
	MOPybEw7RNgusYx6QvUFuZNwHWp7hy2uatTUXHnIzaFJRlM3h9rhtkzzCJpyOGsu
	048lQVJX0iEo/Ez9gEOOMzbkM9a2QuUNR6r5py6q3lVxw+ix9SZYacCgNM1+fCwk
	1p2gJQKMMTjiRtRTuZmWfEesjzUUMFYvkPX7RxMgfQ==
X-ME-Sender: <xms:upNGY0UsjhsdTlEOv1gdvUWVCgMUyhytMprp63sjthbH_aLtu-yEAg>
    <xme:upNGY4nz4GR5UQ3x6e_K582fCJ8stweWaEYYVPrQT66PKOpAxXGjE5cfIkncE1LDO
    P46rVZLOT7uAPxL8Pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:upNGY4YfQVYWewkLk4rgBPvmUJ91v-owZy5gG9Xa81J6r-Vwz7A-Og>
    <xmx:upNGYzU8eMS7FTuSn6qrebpm_zGVnp_cmPX5Zf3vnJ1gKzSF9ajonw>
    <xmx:upNGY-kEaWAqQvTJzfTmfx5YPKQylCLUXR2aGTwaYtEIKLf5nWUmUw>
    <xmx:upNGY1tnpIGCQDfW3ah6R75Mu8cb52MqQOnXJWrOC3wXdj8WDVsv4A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B10B0B60086; Wed, 12 Oct 2022 06:15:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <aa679476-a3bc-4377-8340-0c807855a920@app.fastmail.com>
In-Reply-To: <20221012035335.866440-1-npiggin@gmail.com>
References: <20221012035335.866440-1-npiggin@gmail.com>
Date: Wed, 12 Oct 2022 12:15:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicholas Piggin" <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/32: fix syscall wrappers with 64-bit arguments of
 unaligned register-pairs
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022, at 5:53 AM, Nicholas Piggin wrote:
> powerpc 32-bit system call (and function) calling convention for 64-bit
> arguments requires the next available odd-pair (two sequential registers
> with the first being odd-numbered) from the standard register argument
> allocation.
>
> The first argument register is r3, so a 64-bit argument that appears at
> an even position in the argument list must skip a register (unless there
> were preceeding 64-bit arguments, which might throw things off). This
> requires non-standard compat definitions to deal with the holes in the
> argument register allocation.
>
> With pt_regs syscall wrappers which use a standard mapper to map pt_regs
> GPRs to function arguments, 32-bit kernels hit the same basic problem,
> the standard definitions don't cope with the unused argument registers.
>
> Fix this by having 32-bit kernels share those syscall definitions with
> compat.
>
> Thanks to Jason for spending a lot of time finding and bisecting this and
> developing a trivial reproducer. The perfect bug report.
>
> Reported-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

This looks like a good approach to fix the regression. Comments
below only for additional thoughts, don't let that hold up
merging.

> +#ifdef CONFIG_PPC32
> +long sys_ppc_pread64(unsigned int fd,
> +		     char __user *ubuf, compat_size_t count,
> +		     u32 reg6, u32 pos1, u32 pos2);
> +long sys_ppc_pwrite64(unsigned int fd,
> +		      const char __user *ubuf, compat_size_t count,
> +		      u32 reg6, u32 pos1, u32 pos2);
> +long sys_ppc_readahead(int fd, u32 r4,
> +		       u32 offset1, u32 offset2, u32 count);
> +long sys_ppc_truncate64(const char __user *path, u32 reg4,
> +		        unsigned long len1, unsigned long len2);
> +long sys_ppc_ftruncate64(unsigned int fd, u32 reg4,
> +			 unsigned long len1, unsigned long len2);
> +long sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
> +			 size_t len, int advice);
> +#endif

In general, I would leave out the #ifdef here and always declare
the functions, but it doesn't really matter.

>   *
> - * These routines maintain argument size conversion between 32bit and 64bit
> - * environment.
> + * 32-bit system calls with 64-bit arguments pass those in register pairs.
> + * This must be specially dealt with on 64-bit kernels. The compat_arg_u64_dual
> + * in generic compat syscalls is not always usable because the register
> + * pairing is constrained depending on preceeding arguments.
> + *
> + * An analogous problem exists on 32-bit kernels with ARCH_HAS_SYSCALL_WRAPPER,
> + * the defined system call functions take the pt_regs as an argument, and there
> + * is a mapping macro which maps registers to arguments
> + * (SC_POWERPC_REGS_TO_ARGS) which also does not deal with these 64-bit
> + * arguments.
> + *
> + * This file contains these system calls.

It would be nice to eventually move these next to the regular system
call definitions, with more generic naming and #ifdef checks. It looks
like these are the exact same ones that we have in
arch/arm64/kernel/sys32.c and arch/mips/kernel/linux32.c,
while the other five (x86, s390, sparc, riscv, parisc) use the
version without padding that was recently added as the generic
compat syscall set.

> @@ -47,7 +57,17 @@
>  #include <asm/syscalls.h>
>  #include <asm/switch_to.h>
> 
> -COMPAT_SYSCALL_DEFINE6(ppc_pread64,
> +#ifdef CONFIG_PPC32
> +#define PPC32_SYSCALL_DEFINE4	SYSCALL_DEFINE4
> +#define PPC32_SYSCALL_DEFINE5	SYSCALL_DEFINE5
> +#define PPC32_SYSCALL_DEFINE6	SYSCALL_DEFINE6
> +#else
> +#define PPC32_SYSCALL_DEFINE4	COMPAT_SYSCALL_DEFINE4
> +#define PPC32_SYSCALL_DEFINE5	COMPAT_SYSCALL_DEFINE5
> +#define PPC32_SYSCALL_DEFINE6	COMPAT_SYSCALL_DEFINE6
> +#endif

I'm fairly sure what you do here is correct, but I am not convinced
we actually need this as long as none of the syscalls take a signed
'long' argument that requires sign-extension for compat mode but
not native 32-bit kernels.

If we add a generic version, it would be nice to always just
use SYSCALL_DEFINEx instead of COMPAT_SYSCALL_DEFINEx. This would
also simplify the syscall table. Do you see a possible problem with
that?

     Arnd
