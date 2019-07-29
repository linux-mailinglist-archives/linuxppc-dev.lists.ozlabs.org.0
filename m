Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C2B78E00
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:30:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y2CC3mctzDqFp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:29:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="flAu8kZ5"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rL00X3zDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:37 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id g2so28116538pfq.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jIhsNd5YQJz/rDA3V1MZBXHXL5wyYsVdMoD4Ib8k8bI=;
 b=flAu8kZ53JDBUDO7AuLy3zUcNkTU8YambhAlZvoHU+w11sRUtj6Nmc0b3LOXiFAVa3
 vH/Mk1ff6CZAeveU1cEwp6YBhDDaFkJonHAQbJjU/wFB6npOHRhQjlIBIVsaMD9VnVrN
 dXuvBaUvmne6Lkz121xB8U+1F1l5mGU4rF7Jt59yaSuxVuMktbQ6Ft6Xx8RlV+V6Qv3W
 SEyutIn/X9JCZ0KeGc40y3f9cPi9IKbp/lGcnRdPQcSTi5dbMv6vIxvlRHJK+RcTJnVN
 /0MjNIKtt6txKKYGjulrzAbKchMH9nmCgX7hVvPeiJFW5pbwaYnrGfWeP6xD8EKJd8Pj
 aUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIhsNd5YQJz/rDA3V1MZBXHXL5wyYsVdMoD4Ib8k8bI=;
 b=fVijlFIcrYz8cSaK32j8VZhgA8Z74CMbsjoZler+Wje4sgUnsXCWGeQUUTRwCum1nH
 ihBbEK/7IoFcImdNQPx5ma0jGhyglEr4wsxiPiIdr4FPb1GsPeB1HuZfw9nWe9lEyJ3+
 qPK+nhymkyMH8zSG4QMGc8l2eRp4ZV1RQDHn2bL+VcrtdaAJ31FvzZrrDSHze7TcM1bb
 YPZS/WGdFWH6fha/WyCt50rOOnhT4bs7IwflhYhUPUroEeROyfOKC46CxGS+DO+r7Lx1
 jBfNfGTvT7GuFRqMy58FVPZzYrNk8Ncx8RKmhzxRP5uLoxHN+mLFdXKq/44EZcrcvjXs
 9+HQ==
X-Gm-Message-State: APjAAAUZGSA33MJAwtwZkoR/TUobhHfTUamVugX2zY+L3fdDEI9F3HY9
 cjRLqZ0hgEDqZlLvf/bfZR5a6/mCAuY=
X-Google-Smtp-Source: APXvYqx/tbad/6E+uWVZiazXU4pW8QD4ot5/8pMknBZ+cIK6imqA3EXgeVaFbZIpbGLoEq3hMw+sCA==
X-Received: by 2002:aa7:95bb:: with SMTP id a27mr37660870pfk.229.1564409612583; 
 Mon, 29 Jul 2019 07:13:32 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/18] powerpc/64s/exception: move head-64.h exception code to
 exception-64s.S
Date: Tue, 30 Jul 2019 00:12:31 +1000
Message-Id: <20190729141247.26762-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729141247.26762-1-npiggin@gmail.com>
References: <20190729141247.26762-1-npiggin@gmail.com>
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

