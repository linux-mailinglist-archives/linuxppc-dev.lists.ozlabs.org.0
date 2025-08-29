Return-Path: <linuxppc-dev+bounces-11507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1600CB3C4E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 00:33:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDCjb0RlPz2xnv;
	Sat, 30 Aug 2025 08:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756506835;
	cv=none; b=jSzBeWPnGBYSkuZWBbD7nN7qbJVsv6iKD/BflmjXOVCoHKz5d0D+dkDqJQPk4fgE8wo8Z7iqXdPWhIXOCirvsTtJ+sP9j+PxENan+WMWnEUFpUOVtz8n0B/RXVs51xMlleAHbPO1VQPArPIc+oxWUD8Q2A+HYLF3W3yIRJLA9rGYynzC8mSQlenax+sTmrL/VtJ7YVhbW3JmSDNF9XeQLLMhevtiViYnOjrTnB4LvbOTMSjuRjlF7G3MHys58uLkCPif3BG9plgzu21C846cTBnMkOshr2vqhYLkb8s8kVU33fVn1J/x+ee8oD1iMiGCdCd1GlLNlnV7AubIzBnV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756506835; c=relaxed/relaxed;
	bh=kZBy6mGm/GWgsSmHcenYbJqYC61GyZljRKOGMCQEJWk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IL3LxzbUg01qk4sVSk60aTJczcbV7vnWHYpuKdl1rifdoSJF+tWa3qLGeSssWXqV0oqN8dyu8a5Be0xsTwIe1PRo7qPztIAMXUuzza8c20IhXu6qiHT2+tHFABwjX2mG1iDTShyCEB5lnqGr7zfAF3xhpjebOYCzLyAzDM41IUvsvpgbtflwGJyuLFRpW2gIF73DGbxz+a6uv4gA7RjZcWZOLRCPqGC2Q7MEIIdWWNYnkgw9u+3DhZ3EqcnwaImYv8dAQxeZ8hPU+dtECx7ZjohbkrKip5d7//j3QVze6vsBvjFll9nuN7BP+uSWmmGCEbz+AW76SS7jO72HbMHkvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CeI1Uyyw; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CeI1Uyyw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDCjZ2HSSz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 08:33:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B33664534D;
	Fri, 29 Aug 2025 22:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5459DC4CEF0;
	Fri, 29 Aug 2025 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756506831;
	bh=gW3UREhITNbhZNhXVhy/1JzS54isi8alO3SClI/0N4U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CeI1UyywLphq6rbxihW3K12s6RgLJ57FMTz4eKtrVBaIOZQlRF5Mw5MGN9VZqsyUF
	 ws1VVPK2A9Aphpeu08IZ+PBsvH/hZxYQZ/E8LlLJ2UoQZh6ZiWU7Ee+Bxfnwgu4wDN
	 qm+ussMtaWLdi83SF8aT0+Btb7yjNB9Ygip41cIO0PmgxXzADx6IHAKLQjnLPLfqj2
	 5eqSmq9NNuwF0+wjF3Nc60azb8fAUFVptz94yF9f9Xn6OeJKPvhEVPRSVPcQIiH9ig
	 389Jr83bSdXVSFqVbGJ4RM5keAw6x2twpNgOifIA2xME7cb4HiY+r6PWu/R5+ICtHu
	 LsNzjw1Q4Twaw==
From: Nathan Chancellor <nathan@kernel.org>
To: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Marco Elver <elver@google.com>, 
 "Peter Zijlstra (Intel)" <peterz@infraded.org>, kasan-dev@googlegroups.com
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
Subject: Re: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Message-Id: <175650682606.3003527.17329504429724755241.b4-ty@kernel.org>
Date: Fri, 29 Aug 2025 15:33:46 -0700
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Thu, 21 Aug 2025 14:15:37 -0700, Nathan Chancellor wrote:
> s390 and x86 have required LLVM 15 since
> 
>   30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
>   7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")
> 
> respectively. This series bumps the rest of the kernel to 15.0.0 to
> match, which allows for a decent number of clean ups.
> 
> [...]

Applied, thanks!

[01/12] kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
        https://git.kernel.org/kbuild/c/20c0989283564
[02/12] arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
        https://git.kernel.org/kbuild/c/65aebf6f5880e
[03/12] ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
        https://git.kernel.org/kbuild/c/02aba266e391f
[04/12] arm64: Remove tautological LLVM Kconfig conditions
        https://git.kernel.org/kbuild/c/23cb0514208da
[05/12] mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
        https://git.kernel.org/kbuild/c/e633c2e78fd1c
[06/12] powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
        https://git.kernel.org/kbuild/c/488954ca195d0
[07/12] riscv: Remove version check for LTO_CLANG selects
        https://git.kernel.org/kbuild/c/6578a1ff6aa49
[08/12] riscv: Unconditionally use linker relaxation
        https://git.kernel.org/kbuild/c/7ccbe91796d7b
[09/12] riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
        https://git.kernel.org/kbuild/c/87b28d71396bf
[10/12] lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
        https://git.kernel.org/kbuild/c/a817de20091c3
[11/12] objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
        https://git.kernel.org/kbuild/c/573ad421cc551
[12/12] KMSAN: Remove tautological checks
        https://git.kernel.org/kbuild/c/5ff8c11775c74

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


