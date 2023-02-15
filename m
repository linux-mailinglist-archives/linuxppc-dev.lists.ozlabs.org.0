Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968016983A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 19:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PH6Qn1WLMz3f3K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 05:43:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8DssxvW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K8DssxvW;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PH6Nn6lY8z3bhS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 05:41:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6566661D23;
	Wed, 15 Feb 2023 18:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B679C4339B;
	Wed, 15 Feb 2023 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676486486;
	bh=Bn4PnsdfMk3VpRZTuBATRwN4ucU9A9gaRgDX010A7pA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K8DssxvWbdq3XXo1YlSzB5+4GoV8/dvTaDPuEvZyLvicAEOonCuS2M5DEFoCbrvhg
	 9mX1bx0KyAhhg/9xZjzUlCLfgkI4AtVp12CiaitfkmBdGayB6shkHIcfQYfCaILPFl
	 ZWwZx/cZ24fUFYqQNUm4vn0vD7tBojGDzilj0Ph30bbwU7lwBvDE/KMd10N660T9wb
	 y0CoDUJoN5/UGiiVBnXt3o0rPnzt9mJ5v0OQ/zG481K9slBRUjyMcnYQ/P8+4OaEUm
	 GhAGo6913DGwcPIbWcvHbaSpd/5Sd8TnWJ3pfordVGsGBdVCNuG6XT5/pW3IxuytL3
	 5jbCLGsXGIUPA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 15 Feb 2023 11:41:15 -0700
Subject: [PATCH 1/3] powerpc/boot: Only use '-mabi=elfv2' with
 CONFIG_PPC64_BOOT_WRAPPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230118-ppc64-elfv2-llvm-v1-1-b9e2ec9da11d@kernel.org>
References: <20230118-ppc64-elfv2-llvm-v1-0-b9e2ec9da11d@kernel.org>
In-Reply-To: <20230118-ppc64-elfv2-llvm-v1-0-b9e2ec9da11d@kernel.org>
To: mpe@ellerman.id.au
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Bn4PnsdfMk3VpRZTuBATRwN4ucU9A9gaRgDX010A7pA=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlv1UNDVS+uVxZctb7mrC67yZbDwu3i3yIzTRpudAjIi
 LeJeV/tKGVhEONgkBVTZKl+rHrc0HDOWcYbpybBzGFlAhnCwMUpABP5spLhf+Bf/oNmFpFBUb6v
 WfMc5rDmiO8KlFiyN/ebnkn7A8F7Gxl+s/3U+PCZu/WaT3mP2GK3kIayadsSHt+fKtjALvwuec1
 TdgA=
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
Cc: erhard_f@mailbox.org, trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org, patches@lists.linux.dev, nathan@kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_PPC64_ELF_ABI_V2 is enabled with clang through
CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2, building the powerpc boot wrapper
in 32-bit mode (i.e. with CONFIG_PPC64_BOOT_WRAPPER=n) fails with:

    error: unknown target ABI 'elfv2'

The ABI cannot be changed with '-m32'; GCC silently accepts it but clang
errors out. Only provide '-mabi=elfv2' when CONFIG_PPC64_BOOT_WRAPPER is
enabled, which is the only way '-mabi=elfv2' will be useful.

Tested-by: "Erhard F." <erhard_f@mailbox.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/boot/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index d32d95aea5d6..0d4a8e8bdcab 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -44,6 +44,9 @@ BOOTCFLAGS	+= -m64 -mcpu=powerpc64le
 else
 BOOTCFLAGS	+= -m64 -mcpu=powerpc64
 endif
+ifdef CONFIG_PPC64_ELF_ABI_V2
+BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
+endif
 else
 BOOTCFLAGS	+= -m32 -mcpu=powerpc
 endif
@@ -55,9 +58,6 @@ BOOTCFLAGS	+= -mbig-endian
 else
 BOOTCFLAGS	+= -mlittle-endian
 endif
-ifdef CONFIG_PPC64_ELF_ABI_V2
-BOOTCFLAGS	+= $(call cc-option,-mabi=elfv2)
-endif
 
 BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
 

-- 
2.39.2

