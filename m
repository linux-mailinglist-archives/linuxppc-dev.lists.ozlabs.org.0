Return-Path: <linuxppc-dev+bounces-10784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC42B1FA0D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Aug 2025 14:58:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0Hr75ZBxz3cZL;
	Sun, 10 Aug 2025 22:58:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754830695;
	cv=none; b=kyZ/7J4QtmaTS6n0LgVHKTu+6veRR9I+hJceSTMVsaoH9XXiCI+BcN6j+Ea5JmvYNt94zcjvP2AU/QoPSDpnTGaAOZtKAFy3kUM723y62kR8DV2RCxB0Qi5Q390GUjANnsSf3SDeY/WERoxQtz3d+kagKYqrI2NqEj4u/tiIG7tW//jZJA5JlT6jTY/u420gRA2vFCRNssIzJycjuES1R6V/WZJb3AREiJPONJK7BK28BhfJjHfpIzN9KkCJ/yrHLw3C0sCwv3+b82pEaIFbF4dHckpbHwP6KJTx73bb6WeiufYYnubE1ptTyJMXi5dEs2dnB5ivk8Qx3lU11+zizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754830695; c=relaxed/relaxed;
	bh=qPUEdIdCRmt+MYJsQtBbxjY1GnPuX9CU1RwbVybqcDU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fatyDZTOnotlFD+yIZc66m7HaRqgs4EsBukGcRx2iBoq8yLg10ImiJig2ihsOx+PTnpv7bFqwgeuhwyK4evhV9v09txn9WYXHwgnxraEiAUPpz7/TbmLvhKIMBUWEdi6rqLTCFe/LLw3CqzGJCMHB4csNdngXSdPrBgDGS70OY6FHhcHsi3ItDwoXaqX4IbpZ0CIlQZKMt+P5lSsrxklmacnsCJkMS6mSH72iYFIgoMqN1qBU/IwF4V7ZnNQ6rApXAtecLl0VxRhNnEsJPJ9dQoFVLJlur31nouaV9ohTScahdXpKHkU6fAw1si1HWwwJqNcyuhEBF8tVNEn3dqhIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gfYSgA4/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gfYSgA4/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0Hr669z0z3cYy
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 22:58:14 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55b978c61acso3355000e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 05:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754830692; x=1755435492; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPUEdIdCRmt+MYJsQtBbxjY1GnPuX9CU1RwbVybqcDU=;
        b=gfYSgA4/jHOlQBV/+EK1Off11pEgQBKR8QYATgaUWuMeka4Tx0NK9gE1gZ3Z8fBYgV
         YxUOMy/1Cg0brcrPlXeR4Uv7hvjhLBX8iHT72p/Gigo6JB2+L8Ahw4gDdLerQM7MCbK4
         LD3wZxulXy5zhx6hZ88ARr4fsir0/t1oKTaBaNfEJY63cNckbsWNNdh96QBgXAygb+gZ
         BCBxgyeto/gUmYJJLBHHuOIv+5Km1rog4RCOXy+lWc/QAmj6K0XyJfVLf/mkWbE8aKG7
         0qy0lCvgcUiqMLQhTLGpXhxYWNdEryxK/vu2UfOjHLuQC8sJ0BG2r+nbFyKDDzg5ydT5
         QGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754830692; x=1755435492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPUEdIdCRmt+MYJsQtBbxjY1GnPuX9CU1RwbVybqcDU=;
        b=jkbcoI20YHDzDk8u3Jo7DtMhsw6iQDCWYvY+HiQTnHZuPil6XoFIDQeYzMNAUM/78K
         IAjxePdpoqBTeUji3h8P6sRPBtz9TI/CpIcSUh8LbLkZfWpNmoLFz/899RqWb4St+oxb
         yzpiBmzx0PuE1zLf4RRMFUHCCenBeTlYJp4Rla0W29gayLaW4EqYTb6zHQObr8gOd66B
         m3sBfFe3ZPmhRb8bUq+uGBgOCf0k3uYXQlIp2yDcelyv849c2tR4rc1/7AltZ7t/gV90
         /zhDZVNqvN6F7Y1DqG/gLcQXYbjkJxZrrdP3Ske0WkX+rXB25zgfMdxO2VWhpETAIOTW
         MvNA==
X-Forwarded-Encrypted: i=1; AJvYcCWuxccEF8vRz38cGy7CLQzeNSsoRx/B9rxjoof8EYK+PhBtEHWPxuy1elvaaUup6a8EBClgQn4ls45ruCo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzT0KB6LvqE6h1vPXgqNVzL16zW+5SXrdEWDYHegRk5p38nRo54
	fjmPDsjFLUhRSgCUTOVmp6X4e5nNtbvaMw7oIkeC04cn1xAVwMNBWuUl
X-Gm-Gg: ASbGnctsHdN14eBscb34OG02gHP/o0C403dIXvHYD+kBC4Ofyn5FCNXLX3ywRie5DHW
	NQFI8a1IJilfkOpfdCe7GCRX04Ia/P6DSXTomWXCc1AX8ddtjbjw3Ob5ZUkCeB7wxxqxzyMhZjd
	rWEiBSpml1LJRxKSJB8JJPdAmVC1cicNwIGp5HY/3WxKXI6/VdG+MT6nXSwU2qJ+h+vG6wEHUGL
	QvDCL9RBLedaM+1imTOajKlfqjFFSJZSBZvVX/I42uEgYIpED0f8hHeKnPPXc0MkGLYMwF+0yJt
	JXheO9jK2sSRW729YEbN9RQb7V3P/0nLp6LXrc8IrBZauZlT20We4CTzxV1DhUzR1U1eMCbBMVR
	flv1YRSLLe2AcN1TIz/u82h7RbN9gia63UNHo0g==
X-Google-Smtp-Source: AGHT+IFrIl3eJCoqqHt0ANltzYIq2yL9Jka0mZA2tOEeoGsTnUPJed1OxDGIgQlZCm+SP4loyYZbRA==
X-Received: by 2002:a05:6512:3502:b0:55b:732d:931 with SMTP id 2adb3069b0e04-55cc00b14c8mr2560689e87.12.1754830691289;
        Sun, 10 Aug 2025 05:58:11 -0700 (PDT)
Received: from localhost.localdomain ([2a03:32c0:2e:37dd:bfc4:9fdc:ddc6:5962])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9908esm3804561e87.76.2025.08.10.05.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:58:10 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	christophe.leroy@csgroup.eu,
	bhe@redhat.com,
	hca@linux.ibm.com,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	davidgow@google.com,
	glider@google.com,
	dvyukov@google.com,
	alexghiti@rivosinc.com
Cc: alex@ghiti.fr,
	agordeev@linux.ibm.com,
	vincenzo.frascino@arm.com,
	elver@google.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v6 2/2] kasan: call kasan_init_generic in kasan_init
Date: Sun, 10 Aug 2025 17:57:46 +0500
Message-Id: <20250810125746.1105476-3-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250810125746.1105476-1-snovitoll@gmail.com>
References: <20250810125746.1105476-1-snovitoll@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Call kasan_init_generic() which handles Generic KASAN initialization.
For architectures that do not select ARCH_DEFER_KASAN,
this will be a no-op for the runtime flag but will
print the initialization banner.

For SW_TAGS and HW_TAGS modes, their respective init functions will
handle the flag enabling, if they are enabled/implemented.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com> # riscv
Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390
---
Changes in v6:
- Call kasan_init_generic() in arch/riscv _after_ local_flush_tlb_all()
---
 arch/arm/mm/kasan_init.c    | 2 +-
 arch/arm64/mm/kasan_init.c  | 4 +---
 arch/riscv/mm/kasan_init.c  | 1 +
 arch/s390/kernel/early.c    | 3 ++-
 arch/x86/mm/kasan_init_64.c | 2 +-
 arch/xtensa/mm/kasan_init.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 111d4f703136..c6625e808bf8 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -300,6 +300,6 @@ void __init kasan_init(void)
 	local_flush_tlb_all();
 
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
-	pr_info("Kernel address sanitizer initialized\n");
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 }
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d541ce45daeb..abeb81bf6ebd 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -399,14 +399,12 @@ void __init kasan_init(void)
 {
 	kasan_init_shadow();
 	kasan_init_depth();
-#if defined(CONFIG_KASAN_GENERIC)
+	kasan_init_generic();
 	/*
 	 * Generic KASAN is now fully initialized.
 	 * Software and Hardware Tag-Based modes still require
 	 * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
 	 */
-	pr_info("KernelAddressSanitizer initialized (generic)\n");
-#endif
 }
 
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 41c635d6aca4..c4a2a9e5586e 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -533,4 +533,5 @@ void __init kasan_init(void)
 
 	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
+	kasan_init_generic();
 }
diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 9adfbdd377dc..544e5403dd91 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <asm/asm-extable.h>
 #include <linux/memblock.h>
+#include <linux/kasan.h>
 #include <asm/access-regs.h>
 #include <asm/asm-offsets.h>
 #include <asm/machine.h>
@@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d216..998b6010d6d3 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f39c4d83173a..0524b9ed5e63 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -94,5 +94,5 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages. */
 	current->kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1


