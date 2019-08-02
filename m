Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5E47F61E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:41:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460QGd3zh3zDqdM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:41:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KyWtGJc7"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMX61CzzDqyG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:24 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n190so769173pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jIhsNd5YQJz/rDA3V1MZBXHXL5wyYsVdMoD4Ib8k8bI=;
 b=KyWtGJc7EDI6L58AH3L7OC2a0QXDtA2+LAYGr0Amuq28VKQVrt97wzgpOhm1pstUlW
 VOIb/XgdZ1DjiDDDsxo938DA4fhxQqpV98OxEpxuH2QKq753YRjvQDDlM59BqMMnJDa1
 CBmqxxqGCvnJZehqpK6Qnn7NdE/Wt1urx7iB5yWycNyVj1rkFYq4ToHwerEMWSY24AA7
 CPA6vLjUFKRQQxflFSBMevOORw5zJfoY7VQlHKEDHbxV20FntosNxFFsAs8EfEOYxspp
 SD9YkDVn3RebIOD21HD6VCTHpRxhhCjEXGpaC4R097K16PbJmlMPgIyDWS0YiDKK232F
 pP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIhsNd5YQJz/rDA3V1MZBXHXL5wyYsVdMoD4Ib8k8bI=;
 b=W29oRxvkPcCqFzyLXb8mTSYgq+2C6O0hie4HsfocEA9UzLGush4ftQ0E+6pDe94+Lh
 1y3Flj0upSwejFnP8bj+EU0se5yYA4saPn1YhhQNud9GV39aOxIWVy7pd/G8rKDLK0F6
 9LeSazC0Zkza0BiRNQOkFU3YTHjcd9iFmgRsycidf/ZRd3BZZmGnutprYkoKIGcU5BsQ
 cBpnh714XiIjK9ykR7TZpMXZiAau7DYkUxmalcZ9Z9MohI7SWj6DgN+F+Y0TRI+4PG5C
 amIRNNMxUs0wARWcVN0qo7xbbm8+e1oE6n3dhvUDTt0gVIAynP/Y/1Z+BAITmwWIh10K
 j3+g==
X-Gm-Message-State: APjAAAXajfYDroZfOknjKIuf2/b85K6QRVCLtpl8TUBnJb5kM67ImByg
 NiWKOYy17HRwlwLHA/nakOMUT3uoBac=
X-Google-Smtp-Source: APXvYqxEAZqtXjywi81VyJTvvOw9POK4Ws3EKu7qzwj90OkPgP5fZOAcfSf0ZWfNtlBGIeSTRE1WoA==
X-Received: by 2002:a63:590f:: with SMTP id n15mr77248872pgb.190.1564743622904; 
 Fri, 02 Aug 2019 04:00:22 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 18/44] powerpc/64s/exception: move head-64.h exception code
 to exception-64s.S
Date: Fri,  2 Aug 2019 20:56:43 +1000
Message-Id: <20190802105709.27696-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The head-64.h code should deal only with the head code sections
and offset calculations.

No generated code change except BUG line number constants.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/head-64.h   | 41 ----------------------------
 arch/powerpc/kernel/exceptions-64s.S | 41 ++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index a466765709a9..2dabcf668292 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -169,47 +169,6 @@ end_##sname:
 
 #define ABS_ADDR(label) (label - fs_label + fs_start)
 
-#define EXC_REAL_BEGIN(name, start, size)			\
-	FIXED_SECTION_ENTRY_BEGIN_LOCATION(real_vectors, exc_real_##start##_##name, start, size)
-
-#define EXC_REAL_END(name, start, size)				\
-	FIXED_SECTION_ENTRY_END_LOCATION(real_vectors, exc_real_##start##_##name, start, size)
-
-#define EXC_VIRT_BEGIN(name, start, size)			\
-	FIXED_SECTION_ENTRY_BEGIN_LOCATION(virt_vectors, exc_virt_##start##_##name, start, size)
-
-#define EXC_VIRT_END(name, start, size)				\
-	FIXED_SECTION_ENTRY_END_LOCATION(virt_vectors, exc_virt_##start##_##name, start, size)
-
-#define EXC_COMMON_BEGIN(name)					\
-	USE_TEXT_SECTION();					\
-	.balign IFETCH_ALIGN_BYTES;				\
-	.global name;						\
-	_ASM_NOKPROBE_SYMBOL(name);				\
-	DEFINE_FIXED_SYMBOL(name);				\
-name:
-
-#define TRAMP_REAL_BEGIN(name)					\
-	FIXED_SECTION_ENTRY_BEGIN(real_trampolines, name)
-
-#define TRAMP_VIRT_BEGIN(name)					\
-	FIXED_SECTION_ENTRY_BEGIN(virt_trampolines, name)
-
-#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-#define TRAMP_KVM_BEGIN(name)					\
-	TRAMP_VIRT_BEGIN(name)
-#else
-#define TRAMP_KVM_BEGIN(name)
-#endif
-
-#define EXC_REAL_NONE(start, size)				\
-	FIXED_SECTION_ENTRY_BEGIN_LOCATION(real_vectors, exc_real_##start##_##unused, start, size); \
-	FIXED_SECTION_ENTRY_END_LOCATION(real_vectors, exc_real_##start##_##unused, start, size)
-
-#define EXC_VIRT_NONE(start, size)				\
-	FIXED_SECTION_ENTRY_BEGIN_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size); \
-	FIXED_SECTION_ENTRY_END_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size)
-
 #endif /* __ASSEMBLY__ */
 
 #endif	/* _ASM_POWERPC_HEAD_64_H */
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f79f811ee131..1fb46fb24696 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -43,6 +43,47 @@
 .endif
 #endif
 
+#define EXC_REAL_BEGIN(name, start, size)			\
+	FIXED_SECTION_ENTRY_BEGIN_LOCATION(real_vectors, exc_real_##start##_##name, start, size)
+
+#define EXC_REAL_END(name, start, size)				\
+	FIXED_SECTION_ENTRY_END_LOCATION(real_vectors, exc_real_##start##_##name, start, size)
+
+#define EXC_VIRT_BEGIN(name, start, size)			\
+	FIXED_SECTION_ENTRY_BEGIN_LOCATION(virt_vectors, exc_virt_##start##_##name, start, size)
+
+#define EXC_VIRT_END(name, start, size)				\
+	FIXED_SECTION_ENTRY_END_LOCATION(virt_vectors, exc_virt_##start##_##name, start, size)
+
+#define EXC_COMMON_BEGIN(name)					\
+	USE_TEXT_SECTION();					\
+	.balign IFETCH_ALIGN_BYTES;				\
+	.global name;						\
+	_ASM_NOKPROBE_SYMBOL(name);				\
+	DEFINE_FIXED_SYMBOL(name);				\
+name:
+
+#define TRAMP_REAL_BEGIN(name)					\
+	FIXED_SECTION_ENTRY_BEGIN(real_trampolines, name)
+
+#define TRAMP_VIRT_BEGIN(name)					\
+	FIXED_SECTION_ENTRY_BEGIN(virt_trampolines, name)
+
+#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
+#define TRAMP_KVM_BEGIN(name)					\
+	TRAMP_VIRT_BEGIN(name)
+#else
+#define TRAMP_KVM_BEGIN(name)
+#endif
+
+#define EXC_REAL_NONE(start, size)				\
+	FIXED_SECTION_ENTRY_BEGIN_LOCATION(real_vectors, exc_real_##start##_##unused, start, size); \
+	FIXED_SECTION_ENTRY_END_LOCATION(real_vectors, exc_real_##start##_##unused, start, size)
+
+#define EXC_VIRT_NONE(start, size)				\
+	FIXED_SECTION_ENTRY_BEGIN_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size); \
+	FIXED_SECTION_ENTRY_END_LOCATION(virt_vectors, exc_virt_##start##_##unused, start, size)
+
 /*
  * We're short on space and time in the exception prolog, so we can't
  * use the normal LOAD_REG_IMMEDIATE macro to load the address of label.
-- 
2.22.0

