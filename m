Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FA18AA11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 23:54:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466qPk6rbwzDqfS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 07:54:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::a4a; helo=mail-vk1-xa4a.google.com;
 envelope-from=3md9rxqwkdja7xycue572ybc08805y.w86527eh99w-xyf52cdc.8j5uvc.8b0@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QD2Q9TVx"; 
 dkim-atps=neutral
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466qMV08TLzDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 07:52:29 +1000 (AEST)
Received: by mail-vk1-xa4a.google.com with SMTP id x71so36175018vkd.15
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=2AgXEJvicJBSy/SRKWnK2/gvt/mXyTWKNhSQOzYorzg=;
 b=QD2Q9TVxotj25Bb1ouljTvMCvR83QJDYk2233b6aDf5UyAOc4+c3u0nYzqK2HiP9Jd
 mWjfm3fF7X8BxISaaea7HPxbpoGJAkgRdVmpjYKrjmNuH3MarsX7MS4wsNBe6G8n6f36
 n47LxqcnSGzw6RtyrzlLPb+EQoVzrvthsOmuGkhCqDIEAEO62T+Ih/9XGutE8xHgaxex
 niw/b9YZcCQAxTuG+nGc6XTtMhuRJ36Q9JkIWVX4S93KEdLzIXq0UIzJZCfKPIBEyf5h
 yv65GUdyh/ZiBeRFUstxqphaAC9yA1yaTYOoX+hpm1aZ4CwSO39oD+vxLn1QJTqzYfuB
 H22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=2AgXEJvicJBSy/SRKWnK2/gvt/mXyTWKNhSQOzYorzg=;
 b=N25n8KXZfsuJ6W5/BGnjF6ZLKw84yd1KxLjFJ3qpxfJeoUyJlSQMJPmMOkSsgp4eFX
 bW5KtKY/jYsmlNspei5GLSyLOyTYIajQVpGWF6iYTQ3c8vR5EyH8h8FEOp8fOo6Z6brE
 ka3XHu0mbzXMEIFTSYOzs5hH5TFc5r+sBQF2fl+O5My33PWoxEP6SbCWXrNMWFx+HkwM
 ifCXrcC8N5ESXOjkAxvI9o6rm55ixgI4yAG0GV94yyy09er63DWJO+qdV/nsNJV4PQyc
 xEtQkO8L811ePApoUUsKKeJjHbNXQqKWm60x4DhUN11m1OCDv1kv+yS0ehC9STE333Mf
 OzMQ==
X-Gm-Message-State: APjAAAV0noou68qDEa8n0s6pYC4nk/+zCghQXFfVJ/3M54gxNCPUCupI
 uOLJXCimPuGu2oCETOs1TKqzPNrvUHWRUPdLd1o=
X-Google-Smtp-Source: APXvYqyYgGBEoezTTpIvU8mq/ZQBKS1RsoV2oTSHueva+H2OsTqtCQ71O4GdWT1QoPUyVfobIUtoTQjr5ewI4rtj4B0=
X-Received: by 2002:a67:e447:: with SMTP id n7mr10737492vsm.115.1565646745461; 
 Mon, 12 Aug 2019 14:52:25 -0700 (PDT)
Date: Mon, 12 Aug 2019 14:50:43 -0700
In-Reply-To: <20190812215052.71840-1-ndesaulniers@google.com>
Message-Id: <20190812215052.71840-10-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190812215052.71840-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH 10/16] powerpc: prefer __section and __printf from
 compiler_attributes.h
From: Nick Desaulniers <ndesaulniers@google.com>
To: akpm@linux-foundation.org
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
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, clang-built-linux@googlegroups.com,
 yhs@fb.com, jpoimboe@redhat.com, sedat.dilek@gmail.com,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, netdev@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/boot/main.c         | 3 +--
 arch/powerpc/boot/ps3.c          | 6 ++----
 arch/powerpc/include/asm/cache.h | 2 +-
 arch/powerpc/kernel/btext.c      | 2 +-
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
index 102cc546444d..3ccc84e06fc4 100644
--- a/arch/powerpc/boot/main.c
+++ b/arch/powerpc/boot/main.c
@@ -150,8 +150,7 @@ static struct addr_range prep_initrd(struct addr_range vmlinux, void *chosen,
  * edit the command line passed to vmlinux (by setting /chosen/bootargs).
  * The buffer is put in it's own section so that tools may locate it easier.
  */
-static char cmdline[BOOT_COMMAND_LINE_SIZE]
-	__attribute__((__section__("__builtin_cmdline")));
+static char cmdline[BOOT_COMMAND_LINE_SIZE] __section(__builtin_cmdline);
 
 static void prep_cmdline(void *chosen)
 {
diff --git a/arch/powerpc/boot/ps3.c b/arch/powerpc/boot/ps3.c
index c52552a681c5..70b2ed82d2de 100644
--- a/arch/powerpc/boot/ps3.c
+++ b/arch/powerpc/boot/ps3.c
@@ -24,8 +24,7 @@ extern int lv1_get_repository_node_value(u64 in_1, u64 in_2, u64 in_3,
 #ifdef DEBUG
 #define DBG(fmt...) printf(fmt)
 #else
-static inline int __attribute__ ((format (printf, 1, 2))) DBG(
-	const char *fmt, ...) {return 0;}
+static inline int __printf(1, 2) DBG(const char *fmt, ...) { return 0; }
 #endif
 
 BSS_STACK(4096);
@@ -35,8 +34,7 @@ BSS_STACK(4096);
  * The buffer is put in it's own section so that tools may locate it easier.
  */
 
-static char cmdline[BOOT_COMMAND_LINE_SIZE]
-	__attribute__((__section__("__builtin_cmdline")));
+static char cmdline[BOOT_COMMAND_LINE_SIZE] __section(__builtin_cmdline);
 
 static void prep_cmdline(void *chosen)
 {
diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index 45e3137ccd71..9114495855eb 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -91,7 +91,7 @@ static inline u32 l1_cache_bytes(void)
 	isync
 
 #else
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(.data..read_mostly)
 
 #ifdef CONFIG_PPC_BOOK3S_32
 extern long _get_L2CR(void);
diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 6dfceaa820e4..f57712a55815 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -26,7 +26,7 @@
 static void scrollscreen(void);
 #endif
 
-#define __force_data __attribute__((__section__(".data")))
+#define __force_data __section(.data)
 
 static int g_loc_X __force_data;
 static int g_loc_Y __force_data;
-- 
2.23.0.rc1.153.gdeed80330f-goog

