Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E975AEBDBF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 07:17:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474BnP2VMhzF5cS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 17:17:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=socionext.com (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=yamada.masahiro@socionext.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="vMfrOzEq"; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474Bl00jSqzF6FF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 17:15:39 +1100 (AEDT)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id xA16ELBf016348;
 Fri, 1 Nov 2019 15:14:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xA16ELBf016348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1572588867;
 bh=EbWxLFiY8h504jFBt4i5+hTSLW7vcJ0MI7MXhe5UQ4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vMfrOzEqcV2/ffzg63CsgD7KAK9Gc0e7hcDmgQ5MXqttKHTYPbVhJUrLSB9juAYul
 wLYUcgfYY9xp/QA/isOxstI60AFkA7nkGfwgpkyWCxb+RNjh4NtViZ3ZnVA+FsP2zZ
 L9jNI7XCSZD9bd/Ek/CRT1iwSb7U3g77mbixfMq0Ed+bMCGVnijS76NCTdCzg3YIG0
 vV+neEM0QKtdfOAOOUCuPZ7fXARQVLN4w5dVIGJHHNVB2nrfIlA5cmTURunQ/FfsPA
 MU8oOsILf/rtcXXFSPg7fpTmc+VqTztF8Ms7vjSiXjN5X0OxSchINuevpDufACdFd2
 e9kOSSAmqnYOw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 3/3] libfdt: define INT32_MAX and UINT32_MAX in libfdt_env.h
Date: Fri,  1 Nov 2019 15:14:11 +0900
Message-Id: <20191101061411.16988-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101061411.16988-1-yamada.masahiro@socionext.com>
References: <20191101061411.16988-1-yamada.masahiro@socionext.com>
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
Cc: linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The libfdt in the upstream DTC project added references to (U)INT32_MAX
by the following commits:

  Commit 812b1956a076 ("libfdt: Tweak data handling to satisfy Coverity")
  Commit 7fcf8208b8a9 ("libfdt: add fdt_append_addrrange()")

The kernel needs to adjust libfdt_env.h before pulling in the changes.

As for the user-space programs, <stdint.h> defines (U)INT32_MAX along
with (u)int32_t.

In the kernel, on the other hand, we usually use s32 / u32 instead of
(u)int32_t for the fixed-width types.

Accordingly, we already have S32_MAX / U32_MAX for their max values.
So, we won't add (U)INT32_MAX to <linux/limits.h> any more.

Instead, add them to the in-kernel libfdt_env.h to compile fdt.c and
fdt_addresses.c

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/powerpc/boot/libfdt_env.h | 2 ++
 include/linux/libfdt_env.h     | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/powerpc/boot/libfdt_env.h b/arch/powerpc/boot/libfdt_env.h
index 2abc8e83b95e..a4a386114ef5 100644
--- a/arch/powerpc/boot/libfdt_env.h
+++ b/arch/powerpc/boot/libfdt_env.h
@@ -6,6 +6,8 @@
 #include <string.h>
 
 #define INT_MAX			((int)(~0U>>1))
+#define INT32_MAX		((u32)~0U)
+#define UINT32_MAX		((s32)(INT_MAX >> 1))
 
 #include "of.h"
 
diff --git a/include/linux/libfdt_env.h b/include/linux/libfdt_env.h
index edb0f0c30904..0bd83bdb2482 100644
--- a/include/linux/libfdt_env.h
+++ b/include/linux/libfdt_env.h
@@ -11,6 +11,9 @@ typedef __be16 fdt16_t;
 typedef __be32 fdt32_t;
 typedef __be64 fdt64_t;
 
+#define INT32_MAX	S32_MAX
+#define UINT32_MAX	U32_MAX
+
 #define fdt32_to_cpu(x) be32_to_cpu(x)
 #define cpu_to_fdt32(x) cpu_to_be32(x)
 #define fdt64_to_cpu(x) be64_to_cpu(x)
-- 
2.17.1

