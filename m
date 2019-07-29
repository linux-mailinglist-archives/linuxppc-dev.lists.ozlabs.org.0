Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCF079A0E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 22:34:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yBHw1l6YzDqR6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 06:34:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com;
 envelope-from=3y1y_xqwkdpwrhiweyprmivwksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NrH9CP3j"; 
 dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yB6Q3WprzDqDc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 06:26:14 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id a5so33828851pla.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 13:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=InkWYbyakoin4kW7joWmSnOT6nnJvOIEoZKfiSX6FXM=;
 b=NrH9CP3j3IaEZeQTRPUpaINe6R+O0NeUPVTiKEqR6ZRIdxWO6b0hnLm51vp8WpodBt
 b6YZ/M3SVAVCFf3UurTkKgjdqsG/kQ8nQYh7BWrOOjkRKhtlE1ly2pEUBUWxk6GGbYm8
 1ArC7a1eS8zanTLR4ftZoAMpPBBnZ9ajFP2RpwM+A1dCeK8QIzBW1wpVAYqB7Uuom3Lo
 CoBW1LSDZajNANwdP5yg7IcmAWWiInk7VkArgc5DgBwQrWjtWw6B0CmJ+6WQc8lHqx03
 m3b2v59YP42soakHigmlcSIQP5KCqXM6lb/979S2CV6wnYKKJK5lJX989prCYbKth+Ai
 M+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=InkWYbyakoin4kW7joWmSnOT6nnJvOIEoZKfiSX6FXM=;
 b=RRarK+o6SeRWo2ErDDcMnVA0l3kAbXCjvawejzJtfPcdmguvctx493bRzeJFt7WZMa
 9ut8dJOoQT7LxhB2AChiqzBO6jk1BZy3lsMTs1vD/UPM6QtLhqvz11I+1nAwjj8T/C37
 c+H8sZe18OMmZMRYIRlZlcQdyZcc/J0U/uqYVZ69FUho+yhvm/gb7tvMTA1zRrsSTWlO
 ND/OEK+vELKuni+Vv1n40L/R+rPh7oYOeUbI85On/iX9WFBAZtC6as4VFakgZoPZpyRM
 jgu9of7nnF43O7VcLJ1PJsKSpJS8GOCb4EZiq90XWZZjehZYV0+ppHrLWQEFs+tCzu3D
 kTvQ==
X-Gm-Message-State: APjAAAU207n1UUCwLvWyfVpBqynPwUm+H9J9nYE8Sh8TEX3XeItd5889
 MzG0S2i3zUkIrz2rDuxis67UfEbz2kiWtzkW8vY=
X-Google-Smtp-Source: APXvYqzbqjK6rfCZn+o56AxaIOeOmnCvc2eWfzYd3XaqtryKtAIfNfxTDSqVXK8CEHfxuNI/ij2rwh8wRg9LWpZl+Y0=
X-Received: by 2002:a63:5b52:: with SMTP id l18mr106138942pgm.21.1564431971070; 
 Mon, 29 Jul 2019 13:26:11 -0700 (PDT)
Date: Mon, 29 Jul 2019 13:25:41 -0700
Message-Id: <20190729202542.205309-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH] powerpc: workaround clang codegen bug in dcbz
From: Nick Desaulniers <ndesaulniers@google.com>
To: mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
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
Cc: arnd@arndb.de, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 6c5875843b87 ("powerpc: slightly improve cache helpers") exposed
what looks like a codegen bug in Clang's handling of `%y` output
template with `Z` constraint. This is resulting in panics during boot
for 32b powerpc builds w/ Clang, as reported by our CI.

Add back the original code that worked behind a preprocessor check for
__clang__ until we can fix LLVM.

Further, it seems that clang allnoconfig builds are unhappy with `Z`, as
reported by 0day bot. This is likely because Clang warns about inline
asm constraints when the constraint requires inlining to be semantically
valid.

Link: https://bugs.llvm.org/show_bug.cgi?id=42762
Link: https://github.com/ClangBuiltLinux/linux/issues/593
Link: https://lore.kernel.org/lkml/20190721075846.GA97701@archlinux-threadripper/
Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Reported-by: kbuild test robot <lkp@intel.com>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Alternatively, we could just revert 6c5875843b87. It seems that GCC
generates the same code for these functions for out of line versions.
But I'm not sure how the inlined code generated would be affected.

 arch/powerpc/include/asm/cache.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index b3388d95f451..72983da94dce 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -105,6 +105,30 @@ extern void _set_L3CR(unsigned long);
 #define _set_L3CR(val)	do { } while(0)
 #endif
 
+/*
+ * Workaround for https://bugs.llvm.org/show_bug.cgi?id=42762.
+ */
+#ifdef __clang__
+static inline void dcbz(void *addr)
+{
+	__asm__ __volatile__ ("dcbz 0, %0" : : "r"(addr) : "memory");
+}
+
+static inline void dcbi(void *addr)
+{
+	__asm__ __volatile__ ("dcbi 0, %0" : : "r"(addr) : "memory");
+}
+
+static inline void dcbf(void *addr)
+{
+	__asm__ __volatile__ ("dcbf 0, %0" : : "r"(addr) : "memory");
+}
+
+static inline void dcbst(void *addr)
+{
+	__asm__ __volatile__ ("dcbst 0, %0" : : "r"(addr) : "memory");
+}
+#else
 static inline void dcbz(void *addr)
 {
 	__asm__ __volatile__ ("dcbz %y0" : : "Z"(*(u8 *)addr) : "memory");
@@ -124,6 +148,7 @@ static inline void dcbst(void *addr)
 {
 	__asm__ __volatile__ ("dcbst %y0" : : "Z"(*(u8 *)addr) : "memory");
 }
+#endif /* __clang__ */
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_CACHE_H */
-- 
2.22.0.709.g102302147b-goog

