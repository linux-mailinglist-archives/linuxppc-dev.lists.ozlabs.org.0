Return-Path: <linuxppc-dev+bounces-5216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B25A10248
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 09:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXMyg36kCz301x;
	Tue, 14 Jan 2025 19:40:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736844027;
	cv=none; b=izgVBHZwnaqu1tPBzmGHwpjkHnxyCD8+kcDyHIiQXYjL3wuvaXr86rXyYCoAkjZ9bHDGHxt0HFjvbS20u7SABDtrODP0pDUNDD4GDr5r1rnucaaHKh5hvbzCCENnqlcJoH+EIH47JqUrPrW75IXXsR4WqMjQCo6zq8NuL5t5H2gO776gnPMAwhIhEN3EJrEdE6AAqzZSbYokPEhxT0duwMCwTl7eu+SEhTpvdXfqn0reKu2NbQk9glmx0LdDygSCh6Q1SLOSf6TTbWLGkvgZQ9znSzVfoYhLY8Ywd5NKvy1hsTeH5g93zuGfAn3VxDtq4srO5t40vCx4NvPnupaSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736844027; c=relaxed/relaxed;
	bh=xO/nQTULVjGFS4TV539Ayp3ZWEmdmkrMeax/kxGzbA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4i33e7Qr08bhCDKdxI0QSF810zrPWxM5I6CsYO4a3EAwWdvUNOeRGXflkF4a91xu6ULhjaLqwuQSKsIXpc0M0s/n/iAOOaZL98U+HFKeHwjbx0XkYqKfAkZgEykPmWEEtThbFv4+IMsOOv7Bya9MgIlaD4cT0y5knSdsrEOIkAoRcoIDalqeco1BhKkDTjQWamCvqVZFfuSrVwAJuwTGmFejyPlKq/Jews81geOEptxBJ8YYLwqdlCJf2NEfMo16283pf2XcNF1ts+sQkVkNvFiZTEMYfuteZuM7XREDXB50VAEB+u5Bcq3Ir8USmKrT6qRwaAlwdP5pY7fDIqVFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hpYgILLP; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mNLDwfdu; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hpYgILLP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=mNLDwfdu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXMyd0q3Hz301v
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 19:40:25 +1100 (AEDT)
Date: Tue, 14 Jan 2025 09:40:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736844014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xO/nQTULVjGFS4TV539Ayp3ZWEmdmkrMeax/kxGzbA4=;
	b=hpYgILLPXQ7SmDpUn60QinBCupBkKGG01dSa+3FTRxgCNWqRO6deM+5ajnF8F0Od2hJi0z
	cpxkUWPEgYxlKuFJaMAU5lKMBOMsqCHOy8bQU1BqkIFPZmu3C6m9guZo5f5gQe7CgWfAgj
	wXlrJ+vaLY79yRCYtXdOy7ekdepzM2+FdVeCX/9qEmHH9Disy0/cKsvFF+W1CBIVrlQCea
	CdXCh/v5ERdvmGs43kWOXeLO4kjwv39L0SRYilloKSbhCM9dQG/0V+AKwY49Zz5COQvlml
	dgkfNHCH4XX6YPAxAxjBf1Hw2izDtl+kF8Vz8wbVdA0kf1Oan0fsv7K9pzMvpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736844014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xO/nQTULVjGFS4TV539Ayp3ZWEmdmkrMeax/kxGzbA4=;
	b=mNLDwfduAqnNjlxAvy66A4s1VI9taFFzoR0Bjcd3QoK3m68hFryx0HiKPwHcCzZrImHOWD
	IoGhvQiZnGydi4Aw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>, linux-parisc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org, 
	Nam Cao <namcao@linutronix.de>, linux-csky@vger.kernel.org
Subject: Re: [PATCH v2 09/18] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20250114093609-6cb25835-f912-4f64-9ba7-54c67d4e2904@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
 <20250110-vdso-store-rng-v2-9-350c9179bbf1@linutronix.de>
 <20250113-kissable-monstrous-aace0cf7182e@spud>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113-kissable-monstrous-aace0cf7182e@spud>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 07:48:15PM +0000, Conor Dooley wrote:
> On Fri, Jan 10, 2025 at 04:23:48PM +0100, Thomas Weiﬂschuh wrote:
> > The generic storage implementation provides the same features as the
> > custom one. However it can be shared between architectures, making
> > maintenance easier.
> > 
> > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> For rv64, nommu:
>   LD      vmlinux
> ld.lld: error: undefined symbol: vmf_insert_pfn
> >>> referenced by datastore.c
> >>>               lib/vdso/datastore.o:(vvar_fault) in archive vmlinux.a
> 
> ld.lld: error: undefined symbol: _install_special_mapping
> >>> referenced by datastore.c
> >>>               lib/vdso/datastore.o:(vdso_install_vvar_mapping) in archive vmlinux.a
> 
> Later patches in the series don't make it build again.
> rv32 builds now though, so thanks for fixing that.

Thanks for the report.
Can you try to diff below?

I'm adding rv64 and arm nommu configs to my test matrix and
doublechecking all kconfig dependencies.


diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 335cbbd4dddb..583c55910612 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -52,7 +52,7 @@ config RISCV
        select ARCH_HAS_SYSCALL_WRAPPER
        select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
        select ARCH_HAS_UBSAN
-       select ARCH_HAS_VDSO_ARCH_DATA
+       select ARCH_HAS_VDSO_ARCH_DATA if GENERIC_VDSO_DATA_STORE
        select ARCH_KEEP_MEMBLOCK if ACPI
        select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE if 64BIT && MMU
        select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
@@ -115,7 +115,7 @@ config RISCV
        select GENERIC_SCHED_CLOCK
        select GENERIC_SMP_IDLE_THREAD
        select GENERIC_TIME_VSYSCALL if MMU && 64BIT
-       select GENERIC_VDSO_DATA_STORE
+       select GENERIC_VDSO_DATA_STORE if MMU
        select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
        select HARDIRQS_SW_RESEND
        select HAS_IOPORT if MMU

