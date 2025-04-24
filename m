Return-Path: <linuxppc-dev+bounces-7946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15940A99CCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 02:23:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjcBc2SL5z2yx7;
	Thu, 24 Apr 2025 10:23:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745454184;
	cv=none; b=AlBCc0+zzKbjhxYW4S/6fX/1CJFFiHAl2cKKlxhARgAAJxQWT7LhZpAHygWyeec4JMlND0TDKeO0WxQY1uCN5Rx2rW5VO7qR+M9Wwiz8jJ78UeaVOkanHQ4WHagrtR0+xCoEqSubIFBdq0+wUtf4aaQHGbj5JOlveUUtvbHYCyn/nRm6RjstPf9HZqEvjmbPINjDqmuoreljD01FW/WMy9TULxbEyGat2wYEbyLm1wBXThRalVqsGMFlcriWa+NVYXlzlkTuiPUodHccarwXey1gaEoObru5oVWG4mrwG6DxhFaQ2ZKkyHU6Ir5sJJRfWxYgSFdcJ/17bqBplZliwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745454184; c=relaxed/relaxed;
	bh=y9RE0LT6wLYyzcsFPhNQIEquRQ4Y1gcU4IML1N68Lt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0vsnRJFvWGxxuDpMXvUsJeop4nfK5/pjepNaUZ+EFmanz7wEl83PuaZr2i8dAhQ9IcP5lJT7FV4/3D8lI+pNA/BJkSXrxtQblVnOuW2tS9mAMVw3EqDLcI3YXQk4PaFnHRnQl8B2QxqUPP3U8gpkwGdf5NZRjX/D6Imyj8lSRgbOXujALG21nPwYPu1Tai8MvmYScR3pMZMswcm909W89UwzooAWS4BG6MEkHbDqnQKXE5nghVWgyzRn3BWgC7ynHG7ne4pWSJWdzlgFy9i+Jp6oCbllFKY0+P0TJcCaGxnEFFV6VrjseCQgICpQe8Fyi/CDY9iEdPxPoIr9Fjx/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aWvr/EPc; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aWvr/EPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjcBZ1LpRz305P
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 10:23:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A1484A7AC;
	Thu, 24 Apr 2025 00:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8228FC4CEEA;
	Thu, 24 Apr 2025 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454179;
	bh=fLNBgB98VHmWsYsqCxuP82EHevhaDk2EjXMCqMw0UcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWvr/EPcncCLXclOTaLe63YVgnOiy+N9wim0CGWVLG5JPWdao8sIiUrgqjP211Og9
	 jPYSkEqI/LubFLgHvX/Bs8rYkIWlBfokdgGAg1NEnskSiGSHt3Nm6+IstDdT6KUUvq
	 fdgzd3OQesUexCmrJKlCoN1f3jVyfzH1CNy4mmnAHvwpQ8eDpRo/vD+7tBTlGf9Gc4
	 RK+zxG9iJwmrLDceJAjix6paW6sEefqykYt7k4iVglMQp+Eo40VZan/De8XZf8qqM3
	 LewXnECsVB/HbYP2Cod7GN060YdqJlgseAaFPHHRZF7MctsFoP+9elJbTKHFnqXqzI
	 quzBIIJ3wXqLQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 7/7] x86/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:38 -0700
Message-ID: <20250424002038.179114-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

The use of the term "glue" in filenames is a Crypto API-ism that rarely
shows up elsewhere in lib/ or arch/*/lib/.  I think adopting it there
was a mistake.  The library just uses standard functions, so the amount
of code that could be considered "glue" is quite small.  And while often
the C functions just wrap the assembly functions, there are also cases
like crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
in-lining the actual implementation into the C function.  That's not
"glue code", but rather the actual code.

Therefore, let's drop "glue" from the filenames and instead use e.g.
crc32.c instead of crc32-glue.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/lib/Makefile                            | 6 +++---
 arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c} | 0
 arch/x86/lib/{crc32-glue.c => crc32.c}           | 0
 arch/x86/lib/{crc64-glue.c => crc64.c}           | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/x86/lib/{crc32-glue.c => crc32.c} (100%)
 rename arch/x86/lib/{crc64-glue.c => crc64.c} (100%)

diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 1c50352eb49f9..7cf8681cba0f2 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -37,18 +37,18 @@ lib-$(CONFIG_INSTRUCTION_DECODER) += insn.o inat.o insn-eval.o
 lib-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
 lib-$(CONFIG_MITIGATION_RETPOLINE) += retpoline.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-x86.o
-crc32-x86-y := crc32-glue.o crc32-pclmul.o
+crc32-x86-y := crc32.o crc32-pclmul.o
 crc32-x86-$(CONFIG_64BIT) += crc32c-3way.o
 
 obj-$(CONFIG_CRC64_ARCH) += crc64-x86.o
-crc64-x86-y := crc64-glue.o crc64-pclmul.o
+crc64-x86-y := crc64.o crc64-pclmul.o
 
 obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-x86.o
-crc-t10dif-x86-y := crc-t10dif-glue.o crc16-msb-pclmul.o
+crc-t10dif-x86-y := crc-t10dif.o crc16-msb-pclmul.o
 
 obj-y += msr.o msr-reg.o msr-reg-export.o hweight.o
 obj-y += iomem.o
 
 ifeq ($(CONFIG_X86_32),y)
diff --git a/arch/x86/lib/crc-t10dif-glue.c b/arch/x86/lib/crc-t10dif.c
similarity index 100%
rename from arch/x86/lib/crc-t10dif-glue.c
rename to arch/x86/lib/crc-t10dif.c
diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32.c
similarity index 100%
rename from arch/x86/lib/crc32-glue.c
rename to arch/x86/lib/crc32.c
diff --git a/arch/x86/lib/crc64-glue.c b/arch/x86/lib/crc64.c
similarity index 100%
rename from arch/x86/lib/crc64-glue.c
rename to arch/x86/lib/crc64.c
-- 
2.49.0


