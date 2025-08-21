Return-Path: <linuxppc-dev+bounces-11178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B45FB3081C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Aug 2025 23:16:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7GML2ffzz3bVW;
	Fri, 22 Aug 2025 07:15:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755810958;
	cv=none; b=XpSecGmQeAvwJ3pCpA1UEZwyG2kFd5HAtWMsdijIXmdxlAXoB8/OY2S73uFBjHym35Aw37G2/QkWM4dPnTvCN33LOc/tMgoK09DmQpJBA8QXXewfckynh7wjxgm4MKd76S6DXv1nkfq5tjFNoF3uM6AXGQ+TGfUxcr6jTs+oiNAv6OCRIifvIYyHg6bo+gMRdQH4KLENvLsVS1tCp8uvrnKJUjUM29po1l2mT/Z8cHeQuX7n7sELssIlCmfRTgh+KIS1yT1OIr387ZcXkrhIIXmXq14mUSgEV9iPPebQiEQIPkSi9Aag1JhrvgUqmxSUcmbsUqB/mfHBPVX3foje6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755810958; c=relaxed/relaxed;
	bh=9AFaKTNpzu3Wl7g0cbSUK5dGjCeHRl49IBORR+ozh/Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gaHXvLNXwJY47mqaphxj/O+Sz8T8aypUotGF9/LaMoFS+BxKvYDekYpCunZnR1hSlfy8C73KI7hmfmooqSGG0tVPPJGW9w1qLAtqeTLwfhL4Zd8zyWx0X/p2OwLtzDylt3fnLFArDvj3sk8Y4hgkENE67WhYVwHqcZyqJz1kCunY+vkuhavV/79yOfTFCSQ56eZpus4/Thu8JPBbRW2JpQLmcjg/5iu4IwwlybuRSa0Yd6Gs5Mvfjj4QyRA53wsui5Et2LVmIP7IT3PP/ABPdehn3RUuaQED29+FqUyH0GhTNb7mG2C1KtXHZEPMBsxILGIinfrNhhQSuW+TnwgisA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uQZ01Sr4; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uQZ01Sr4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7GMK1sNGz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 07:15:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7E18601F8;
	Thu, 21 Aug 2025 21:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9A8C4CEEB;
	Thu, 21 Aug 2025 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810954;
	bh=pOQAZPk+siIZkKBpkkHyydqf+iJWdipFSBVhf2HWXnk=;
	h=From:Subject:Date:To:Cc:From;
	b=uQZ01Sr4y5UBxZbhDZfvUDEeNvw7RqMPpecFt11yc7bsaW5ovYL0XUfzrWWsiNXzZ
	 c8++tipPQjqwKYp0k0gDhrvljaAd7re4WVkFUF5WrFBqQqEIN8iR74Vee7BNt/CA+g
	 /tG0RI1G9MmS/0WG3vAsp0ldl5sjGRh0EGxzNxVH1Tm0PYZoCyCQqG00dIozdKH/oE
	 pE+AKTCsKwpp5uIo1NEGnmB8ycta84iEl1LU6UXiRm6kopTiphBIqE2wbsbInRJaJl
	 x/kzDSN/k618a3jDJ0BA65cb43YnV0uqrkYoP768loOw8+WrPigrhNPUtuX3uXdZuq
	 W/LW5Ik2tcyqg==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 00/12] Bump minimum supported version of LLVM for
 building the kernel to 15.0.0
Date: Thu, 21 Aug 2025 14:15:37 -0700
Message-Id: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAHqMp2gC/22NQQ6CMBBFr0Jm7ZhOzSi48h6GhcAAE6GQVhsN4
 e5W3Lp8L/nvLxDEqwQ4Zwt4iRp0cgnsLoO6v7lOUJvEYI1lcyKD1XOccVSHwxBHjOKRGAu2B2p
 JqiMzpOnspdXXlr2WiXsNj8m/t5dIX/sL5pT/D0ZCg3VeUWPaglnM5S7eybCffAfluq4fb81km
 bkAAAA=
X-Change-ID: 20250710-bump-min-llvm-ver-15-95231f1eb655
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Marco Elver <elver@google.com>, 
 "Peter Zijlstra (Intel)" <peterz@infraded.org>, kasan-dev@googlegroups.com
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3775; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pOQAZPk+siIZkKBpkkHyydqf+iJWdipFSBVhf2HWXnk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLexp5jt71uLBmLnPYsZJXWxZZ/jvpEC46Jadf9c7Uw
 ETlF/9MO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEbpkw/I9487fgnDGfn0/r
 3M6FSqzXJdY9UrRtFZK/fJjFtn+JsiAjw7+LX1KSfVQYtyp9370iKU3tw4SvX9nUW67uL1go/I+
 LnxkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

s390 and x86 have required LLVM 15 since

  30d17fac6aae ("scripts/min-tool-version.sh: raise minimum clang version to 15.0.0 for s390")
  7861640aac52 ("x86/build: Raise the minimum LLVM version to 15.0.0")

respectively. This series bumps the rest of the kernel to 15.0.0 to
match, which allows for a decent number of clean ups.

On the distros front, we will only leave behind Debian Bookworm and
Ubuntu Jammy. In both of those cases, builders / developers can either
use the kernel.org toolchains or https://apt.llvm.org to get newer
versions that will run on those distributions, if they cannot upgrade.

  archlinux:latest              clang version 20.1.8
  debian:oldoldstable-slim      Debian clang version 11.0.1-2
  debian:oldstable-slim         Debian clang version 14.0.6
  debian:stable-slim            Debian clang version 19.1.7 (3+b1)
  debian:testing-slim           Debian clang version 19.1.7 (3+b1)
  debian:unstable-slim          Debian clang version 19.1.7 (3+b2)
  fedora:41                     clang version 19.1.7 (Fedora 19.1.7-4.fc41)
  fedora:latest                 clang version 20.1.8 (Fedora 20.1.8-3.fc42)
  fedora:rawhide                clang version 20.1.8 (Fedora 20.1.8-3.fc43)
  opensuse/leap:latest          clang version 17.0.6
  opensuse/tumbleweed:latest    clang version 20.1.8
  ubuntu:focal                  clang version 10.0.0-4ubuntu1
  ubuntu:jammy                  Ubuntu clang version 14.0.0-1ubuntu1.1
  ubuntu:noble                  Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:latest                 Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:rolling                Ubuntu clang version 20.1.2 (0ubuntu1)
  ubuntu:devel                  Ubuntu clang version 20.1.8 (0ubuntu1)

I plan to carry this via the Kbuild tree with the appropriate acks.

---
Changes in v2:
- Add two new patches for RISC-V to clean up more LLD_VERSION checks
  (Alex)
- Pick up provided tags (thanks all!)
- Link to v1: https://lore.kernel.org/r/20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org

---
Nathan Chancellor (12):
      kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
      arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
      ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
      arm64: Remove tautological LLVM Kconfig conditions
      mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
      powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
      riscv: Remove version check for LTO_CLANG selects
      riscv: Unconditionally use linker relaxation
      riscv: Remove ld.lld version checks from many TOOLCHAIN_HAS configs
      lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
      objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
      KMSAN: Remove tautological checks

 Documentation/process/changes.rst |  2 +-
 arch/Kconfig                      |  1 -
 arch/arm/Kconfig                  | 11 ++++-------
 arch/arm64/Kconfig                |  5 +----
 arch/mips/Kconfig                 |  2 +-
 arch/powerpc/include/asm/inst.h   |  4 ----
 arch/riscv/Kconfig                | 21 +++++++--------------
 arch/riscv/Makefile               |  9 +--------
 lib/Kconfig.debug                 |  2 +-
 lib/Kconfig.kcsan                 |  6 ------
 lib/Kconfig.kmsan                 | 11 +----------
 scripts/min-tool-version.sh       |  6 ++----
 tools/objtool/check.c             | 10 ----------
 13 files changed, 19 insertions(+), 71 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-bump-min-llvm-ver-15-95231f1eb655

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


