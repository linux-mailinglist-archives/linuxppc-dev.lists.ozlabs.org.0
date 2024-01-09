Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B71828FB4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 23:18:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DcHElP87;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8lgv6nfDz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 09:18:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DcHElP87;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8ldz24Ygz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 09:16:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDA6C6153B;
	Tue,  9 Jan 2024 22:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123A1C3277D;
	Tue,  9 Jan 2024 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704838613;
	bh=FqUV9XbJobSbmU63Vc9OUMUQcPG9O3IVnKnVxKihgqg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DcHElP8752uyAsMVCQ9k3+715C2jIK4g14tGotfDJ8U38bRblNG/AwFYta/n5LoQG
	 LpV8+bXv7FtW/SUluAkK6SJlStsaYCU3zH4HvblRDr91qAIYBiQOC3/W2UTWgJ1kRp
	 GbrNfFIJNjfOdc23+OlnmB/PTzxp7bE2RSj3T2FzFdBlBnmXZCikPdLw9yHssj4mFr
	 m6ZSKQG3Nd+HtcvSORAmZa/N0vc16PcFvKuV782vl/tGde85StEGLfiO5CA6NT4IMm
	 iDK+5HVkluEYBHetuLhGlho3xKaEgxI6WVWeqqRcIxbmFYNGbaRQOlT40dp51jolLc
	 fu27RYeGMMNpQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 09 Jan 2024 15:16:30 -0700
Subject: [PATCH 2/3] arch and include: Update LLVM Phabricator links
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-update-llvm-links-v1-2-eb09b59db071@kernel.org>
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
In-Reply-To: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
To: akpm@linux-foundation.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3768; i=nathan@kernel.org;
 h=from:subject:message-id; bh=FqUV9XbJobSbmU63Vc9OUMUQcPG9O3IVnKnVxKihgqg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKlzj14wLXz9bOkxsYsrTGYdLPdQyNrnvz59Sf7hWSzS5
 avzyrO5O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEuHQYGY67OxucPlmQ4Skk
 bzsxKZ793GXTxU+kr3sE7umaHJ1xyIeR4V+622l/ZUP3AsYOg2ahGcz/dlh+redryHGc4DIv7X4
 mHwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: linux-efi@vger.kernel.org, kvm@vger.kernel.org, llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-media@vger.kernel.org, linux-pm@vger.kernel.org, bridge@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, patches@lists.linux.dev, linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

reviews.llvm.org was LLVM's Phabricator instances for code review. It
has been abandoned in favor of GitHub pull requests. While the majority
of links in the kernel sources still work because of the work Fangrui
has done turning the dynamic Phabricator instance into a static archive,
there are some issues with that work, so preemptively convert all the
links in the kernel sources to point to the commit on GitHub.

Most of the commits have the corresponding differential review link in
the commit message itself so there should not be any loss of fidelity in
the relevant information.

Link: https://discourse.llvm.org/t/update-on-github-pull-requests/71540/172
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/Kconfig              | 4 ++--
 arch/riscv/Kconfig              | 2 +-
 arch/riscv/include/asm/ftrace.h | 2 +-
 include/linux/compiler-clang.h  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b071a00425d..3304ba7c6c2a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -380,7 +380,7 @@ config BROKEN_GAS_INST
 config BUILTIN_RETURN_ADDRESS_STRIPS_PAC
 	bool
 	# Clang's __builtin_return_adddress() strips the PAC since 12.0.0
-	# https://reviews.llvm.org/D75044
+	# https://github.com/llvm/llvm-project/commit/2a96f47c5ffca84cd774ad402cacd137f4bf45e2
 	default y if CC_IS_CLANG && (CLANG_VERSION >= 120000)
 	# GCC's __builtin_return_address() strips the PAC since 11.1.0,
 	# and this was backported to 10.2.0, 9.4.0, 8.5.0, but not earlier
@@ -2202,7 +2202,7 @@ config STACKPROTECTOR_PER_TASK
 
 config UNWIND_PATCH_PAC_INTO_SCS
 	bool "Enable shadow call stack dynamically using code patching"
-	# needs Clang with https://reviews.llvm.org/D111780 incorporated
+	# needs Clang with https://github.com/llvm/llvm-project/commit/de07cde67b5d205d58690be012106022aea6d2b3 incorporated
 	depends on CC_IS_CLANG && CLANG_VERSION >= 150000
 	depends on ARM64_PTR_AUTH_KERNEL && CC_HAS_BRANCH_PROT_PAC_RET
 	depends on SHADOW_CALL_STACK
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cd4c9a204d08..f7453eba0b62 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -291,7 +291,7 @@ config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
 
 config AS_HAS_OPTION_ARCH
-	# https://reviews.llvm.org/D123515
+	# https://github.com/llvm/llvm-project/commit/9e8ed3403c191ab9c4903e8eeb8f732ff8a43cb4
 	def_bool y
 	depends on $(as-instr, .option arch$(comma) +m)
 	depends on !$(as-instr, .option arch$(comma) -i)
diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 2b2f5df7ef2c..3f526404a718 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -15,7 +15,7 @@
 
 /*
  * Clang prior to 13 had "mcount" instead of "_mcount":
- * https://reviews.llvm.org/D98881
+ * https://github.com/llvm/llvm-project/commit/ef58ae86ba778ed7d01cd3f6bd6d08f943abab44
  */
 #if defined(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION >= 130000
 #define MCOUNT_NAME _mcount
diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index ddab1ef22bee..f0a47afef125 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -9,7 +9,7 @@
  * Clang prior to 17 is being silly and considers many __cleanup() variables
  * as unused (because they are, their sole purpose is to go out of scope).
  *
- * https://reviews.llvm.org/D152180
+ * https://github.com/llvm/llvm-project/commit/877210faa447f4cc7db87812f8ed80e398fedd61
  */
 #undef __cleanup
 #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))

-- 
2.43.0

