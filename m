Return-Path: <linuxppc-dev+bounces-11102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC27B2B0F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 20:58:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5MRZ0GLYz3cfm;
	Tue, 19 Aug 2025 04:58:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755543481;
	cv=none; b=FgfZt+aWWYa7xyz5yQ57aBmg8p7FJiG+LMsNskTSzfMWH055C4hY3x0HdXQF3WAyDapBAcHXKAd+b92rs7aPanJW+jZ0m3pqvX5ukjJUpVZw+rHIcy9p7yDztV9Zbxu9iC9WYDaGsefdBavtt5NXfMZo7SDLGJs5/U7+y90etw1cexmYhaPQZXTaEL0hKxXzI55k9GyZd3VgLklDC/oPsL3T4HTf7HRSihVssDsDxJBWirK02mXOUxHTnUhKoss82ds/7vPrNZCTabvahfTcD0nZtWk2FPhHLY87TVVFLIyh5A5Y3TX4DTFv7YTIE6xSDXgE7Wz9b2Gw4XQP9vXfqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755543481; c=relaxed/relaxed;
	bh=TBN15g8rAP23J96r4n28IjSBg+WDu3nayiyCti2V2i8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DsaOenDa4sepbs3yYc/++ieW+pQDRZK3E/kbUfULvDF38hcI4fxDgRFlLFkWhSxfqQKSMLlZfosFQKx8xvG6PVDvKg8YmMwmOAw9pjsHHKfiMeQ1CThHZYNAC5oymSIMW5Z005HHgF/a5Cm4nMUQ7hL26cZ9elnG8z9pRk91alcFo9an353MsnQJSTjuqMfQSDlp1FcjMb8hfZxiJWy/H0YPLh9abPSm9ocBLxN06FVhbBaMrYmG9htiYzilKfk72moPUWFERVMZ9MRtssLp7zbH1admOBckK3gIwGebmUUqn255A1xSMJhUJwCuLFjldeusY8Xt2f5jVkCqk2gJHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TO8hGFu9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TO8hGFu9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5MRX70G9z3cfj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 04:58:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A05445C62C9;
	Mon, 18 Aug 2025 18:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7007FC4CEEB;
	Mon, 18 Aug 2025 18:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543466;
	bh=qBGPy4AI12NWfHAvs72tXhhLkggZ76cCh4aJ0zfhg4o=;
	h=From:Subject:Date:To:Cc:From;
	b=TO8hGFu9iuv4h970cI0P8DaQE+EJjCFUuIpmSaDSZc3jEdTo9PJkV2ZjkGkU8yAyz
	 hA6uFbfmOGnWNaUYGLBL+njTod03yGzU0n3WtfoyFctsEwXUmB+b+ektMo1uhkUEt0
	 x+B2tuvrWWSXUizIVwqIgYX1trm2mhHkeSrWJzCgOaoVdF3TOEIEatnQLchQ6bouVN
	 bqR50c9Og2MFxhXY+8T0CJouc/vuM+CLdC6liY23Lilx/TBdkUhSccNoOPjp8E2qEG
	 KDRyquCnMeMv42skmZrHiH02/P7YKlkxqYQSYkfrbDYOmhiwgZm559AXS4YzQzJBoT
	 JHTROUXnhA26w==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 00/10] Bump minimum supported version of LLVM for building
 the kernel to 15.0.0
Date: Mon, 18 Aug 2025 11:57:16 -0700
Message-Id: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAIx3o2gC/x3MwQoCIRCA4VeROe+AY0zRvkrsoa2xBtRESQLx3
 Vc6fof/71ClqFRYTYciTat+0gQtBh7ve3oJ6nManHVsL2Rx/8aMUROG0CI2KUiMV3Yn8iT7mRl
 mmot4/f23t22MA23HpyFmAAAA
X-Change-ID: 20250710-bump-min-llvm-ver-15-95231f1eb655
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 kasan-dev@googlegroups.com, Alexander Potapenko <glider@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3422; i=nathan@kernel.org;
 h=from:subject:message-id; bh=qBGPy4AI12NWfHAvs72tXhhLkggZ76cCh4aJ0zfhg4o=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmLyxfkKs9J3XvmTW/HPLXzb2LV/ble9105em3NlZSrK
 rcn6luu7yhlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQAT2WLNyLDcY1peR8tewSkT
 F3NPCHvlGPr7vt3zpq/7/opaMwrfUPdmZDjG+/9Q5BeZLcKLVm0XPXCDawGDjEHkhrzAGu39rXt
 Z47gA
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

I think it makes sense for either Andrew to carry this via -mm on a
nonmm branch or me to carry this via the Kbuild tree, with the
appropriate acks.

---
Nathan Chancellor (10):
      kbuild: Bump minimum version of LLVM for building the kernel to 15.0.0
      arch/Kconfig: Drop always true condition from RANDOMIZE_KSTACK_OFFSET
      ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
      arm64: Remove tautological LLVM Kconfig conditions
      mips: Unconditionally select ARCH_HAS_CURRENT_STACK_POINTER
      powerpc: Drop unnecessary initializations in __copy_inst_from_kernel_nofault()
      riscv: Remove version check for LTO_CLANG selects
      lib/Kconfig.debug: Drop CLANG_VERSION check from DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
      objtool: Drop noinstr hack for KCSAN_WEAK_MEMORY
      KMSAN: Remove tautological checks

 Documentation/process/changes.rst |  2 +-
 arch/Kconfig                      |  1 -
 arch/arm/Kconfig                  | 11 ++++-------
 arch/arm64/Kconfig                |  5 +----
 arch/mips/Kconfig                 |  2 +-
 arch/powerpc/include/asm/inst.h   |  4 ----
 arch/riscv/Kconfig                |  5 ++---
 lib/Kconfig.debug                 |  2 +-
 lib/Kconfig.kcsan                 |  6 ------
 lib/Kconfig.kmsan                 | 11 +----------
 scripts/min-tool-version.sh       |  6 ++----
 tools/objtool/check.c             | 10 ----------
 12 files changed, 13 insertions(+), 52 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-bump-min-llvm-ver-15-95231f1eb655

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


