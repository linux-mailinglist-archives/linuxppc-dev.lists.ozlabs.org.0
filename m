Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C391939
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2019 21:15:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BRbD2qgfzDrL7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 05:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jOAP1YSP"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BRYQ0DwxzDr9N
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 05:13:45 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id o4so1157109wmh.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2019 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eItUq57lzuEyxOyGZwQoMhoYPdZi6IDY86pDynuNHFQ=;
 b=jOAP1YSP++R2gAWpAygJcBtWwWzNM+/grIpmaCngPE95Cx9uOWFNjBmToxIc42WCfT
 Jt24X3uoz17QrtrC7Leo/eZXwYzGQKSbwOyMFkaVgLOmM3IzezTEwI1hFO90xFYeylLb
 puqD5E5C4mw4qVyxowLvgnn1CIbJdXOd2lyD8i6zteoPxsXret2AH20kdZ2Xk2qBQTo5
 3XQcLLF8cEgcqqiIbUD1GL4bQpz3JYWvZn/zBqGHitiuid6jp+voBO9gS0Dl9Rd0AgPx
 35XyLyMeroXH0fD3y7oyep04pA+mrJPtRxRCzMbvmBBjnN3MZekt4xDMb4DMIZqIH0S+
 mkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eItUq57lzuEyxOyGZwQoMhoYPdZi6IDY86pDynuNHFQ=;
 b=CL4rzYCo7/vS9UDq1zc8NG3XUcNLa7TDMd0sq+jXK7ba1mEEr9+3jnXlQjxFeEp04H
 5tZ37gvO1D+XpbLI7/rFisLQu0WfYvp5+JbcOtck3R+u1zlFq9yjwdHs6dRQSDC0sx4T
 m4tukZGg5O9W42ey5WviiKaTi1N9iX8/elUwDxf1dnXWJJRwWCndt2/w8oYQdFXQ1Tbr
 15d0tpXud32DAatjm9bFVU/Dg6u7LeR0kxhrfNQgwfx5lL8QEJm3gskqepBXABtVHFzj
 IG4QA6JhHUTu5NX/wOiPJGTQBeK2I8LTRyxRMvMDWgTz1ORD249o0AVUiiGVWCnKmhNJ
 lf9Q==
X-Gm-Message-State: APjAAAXe5UehLQzPWvljaOqzY+x2FJmo4gDPDGhQ8RIxWx0Xpn4pnKwl
 hXynNnDlbMl6ShGno787TJs=
X-Google-Smtp-Source: APXvYqxWsHGe/k20qP1luPVjPo9gxvf6E1ffTQMQA5wmY/d7ZHcq7uya7ADq0ed1SLYd1s5SX5sqJw==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr17481652wmk.90.1566155618001; 
 Sun, 18 Aug 2019 12:13:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id e14sm8647033wme.35.2019.08.18.12.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 12:13:37 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Don't add -mabi= flags when building with Clang
Date: Sun, 18 Aug 2019 12:13:21 -0700
Message-Id: <20190818191321.58185-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building pseries_defconfig, building vdso32 errors out:

  error: unknown target ABI 'elfv1'

Commit 4dc831aa8813 ("powerpc: Fix compiling a BE kernel with a
powerpc64le toolchain") added these flags to fix building GCC but
clang is multitargeted and does not need these flags. The ABI is
properly set based on the target triple, which is derived from
CROSS_COMPILE.

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/clang/lib/Driver/ToolChains/Clang.cpp#L1782-L1804

-mcall-aixdesc is not an implemented flag in clang so it can be
safely excluded as well, see commit 238abecde8ad ("powerpc: Don't
use gcc specific options on clang").

pseries_defconfig successfully builds after this patch and
powernv_defconfig and ppc44x_defconfig don't regress.

Link: https://github.com/ClangBuiltLinux/linux/issues/240
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/powerpc/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c345b79414a9..971b04bc753d 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -93,11 +93,13 @@ MULTIPLEWORD	:= -mmultiple
 endif
 
 ifdef CONFIG_PPC64
+ifndef CONFIG_CC_IS_CLANG
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
 aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
 endif
+endif
 
 ifndef CONFIG_CC_IS_CLANG
   cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mno-strict-align
@@ -144,6 +146,7 @@ endif
 endif
 
 CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
+ifndef CONFIG_CC_IS_CLANG
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
@@ -152,6 +155,7 @@ CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 endif
+endif
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
 
-- 
2.23.0

