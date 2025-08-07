Return-Path: <linuxppc-dev+bounces-10744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE17B1DD95
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 21:40:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bycvg3J05z3cQx;
	Fri,  8 Aug 2025 05:40:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754595631;
	cv=none; b=CGbHzIM4eEI3tkgrtJ9EI6gMu6eEl2Le1yf7H+2Ca/U7SUu8fQOeuPhYa25YFCSfW2r+HeHVzI9BkgVK+TAzncRcVaWPrqToIE++hG+yHsOCAyl66WpelNPGnNzDzsw3FiOqpoI8R28aJuiNJmCXHcnhACpA9Bv9VYrZxFUhXknMqmLFG2oyaf1Uhp+p3bqCyTTh0XQPGacaoaxZJsJCIT6vxyZpWmPqojiUQjnhnUuhrqzUGOMbLJ3WzfSrGadQui8C+P2kNxOmhpf9SlPn59QdnVMLdkkzB88f5t9LEyLZs4xcvyoj2XJXsGYY48K+jfzqZfaL+A3I9O91QIWovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754595631; c=relaxed/relaxed;
	bh=sNdBwl8v2OqAa3v0ByxYoV2FZHtZfSuaaApNKvSqvMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hi0QIWXaoY/gqNU/j6CKfnZdFpOSDG+xV8CyeZlq+hg9eC3AZonUp7EmEMTJoLnnfFs8uSMKhnUt/WlLRGYVGFT9lVt5A2yvfOOoaSgFSxPcuLvl9C+llrVGOougXozAmk02v2W0dTUDxCnSGyz0Mo0T0khe5Q1LRAsYFJmKBC+CT44KFwYOCH6LROkFvpNzMn5/P/vYpyj3J84GNTT9pk1nn6D1V9jTjGQSzqAyBS8UIdR7gKSEJ0agwAAknYjlelgEACNqWZKz4nWHgQD1JfIabJVpr2T14SQXaWposbLswkNyU/D/q3q9HQ1cCBCiiRwBmstJQ5RTOwmys1ppMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WCRGXCaJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WCRGXCaJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bycvf3tHqz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 05:40:30 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-55b9375d703so1373082e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Aug 2025 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754595627; x=1755200427; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNdBwl8v2OqAa3v0ByxYoV2FZHtZfSuaaApNKvSqvMU=;
        b=WCRGXCaJ7oq5VMTxz3nz7G2h5otagXPKBHf3UpXa3O7Mu9DuyxO7JlTftPQgTXXQCt
         FvfCz5hDV4GF1qcXOyF6dSmegQEBuoV0rx0HY8bt9xNII7ESkyWClSvi9QHk44n71RwU
         O+4LTYdXJ3eokqJqFpslEJRvQUIpO5m9RTCHCgUV9hhxA6+EfVRzP/W0NMCfMByaS1+2
         kNtHws9d/xUwBwBpgfLUPmw1dtyHLWFHWmedDX67b987BWKaTNn9FLp0n+WmKpLq/MdO
         dpvquDed1MzhULzczeM9xdA9G+MsgwyUpk2zOtlq3oAvUR5oGEghTtTsT+qp5NktPfBY
         sXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754595627; x=1755200427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNdBwl8v2OqAa3v0ByxYoV2FZHtZfSuaaApNKvSqvMU=;
        b=ZD3n2LP4kYQdxOuestxm1GobwReFmZBsjhwhFlTjT9FYxj6PWWPTCqM0jyWOA6DbgG
         /XH2BTryTNuS6qAJtsph9C7u4keCyyXyMUP1XxWo9YjvVfl30p9u1NXKyFWsl6vjAgID
         Hx4t+j9vXkfh50/cmbLA/kTnJ02S4WJ51WKrurTOcBxaw5DTznSJdBRM+Gc2NCfZDfVR
         JtGE3JaMvlKb/W7gXA/K6oOBsp6Sv/G1v/EmF3QV9OoIIHL6RdiFQ3jkxVc8VdvqXWiz
         GDhYuoRlZUWd1rXH4Rahe3A30NhYVCY+e92jKiVF9ViRk2tydydV7MszUksuCEBW5hE8
         SyRA==
X-Forwarded-Encrypted: i=1; AJvYcCUjW0eq1/1EsT3ui+k2ZKv3CQFwYWWtfjV4HTO7wrCld1Q3BGNdt+6wBavXe20gZMBcvVbIWdjQb3+Tr5E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxVq2TTWNoxbRx0rsIzLT1H51B/2Fcx3kDnPFzIg04an9YXeEX+
	oA677Ry4IEsMC52Rnc+j+dbPM4AHZje5e0oh4/uXr2LRFb963KHSb2Q9
X-Gm-Gg: ASbGncsU3wYAJ81wjTuh4oyz3VMzrU800+janRfXjFJCbU5+pv5eHmT/HZRP8cvWTsf
	i14fMg8aw8yl5WMLtDo0qDpKpTsqf/+CuZUPQGUB0U815enVK9Q8mB/xE4wx4AG/i+1cyUd5Ks+
	yoat+PFRPXjqQaTzjl1HfFWIPZ+aLOER0sk5ShePcNh0x61nHFC0AB8zkiYTi3Lhx1FtRM4XvLT
	vLtiPdwb8HhhDennvFiqVKAiRZlhYIO8f3U80thMXqocK+/MnXZSeWggUX3bt9RzQmXr1pMMtIQ
	84yF9p3uwpPCexs/xgi182a9HMRxIAgeD3odE1Cvl/S7cIfbVlAM7vxpAlSjFwS/DsriBry9UMu
	X3+YwSYaGSFLo3Cg4Cy01md8isKQGTOBvu6ZpTY8GMyW+xGwE3nPbYsNANUY7QHi2SzrSCg==
X-Google-Smtp-Source: AGHT+IFy1K+04TTf6HeQynR9tEb65FcTbYVkR/07BpvyTspaDpSD1TTrgV/AzkLRIY/TwnnFAN629A==
X-Received: by 2002:ac2:4e14:0:b0:55b:8f46:80ed with SMTP id 2adb3069b0e04-55cc00e3a66mr10263e87.21.1754595627098;
        Thu, 07 Aug 2025 12:40:27 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c98c2asm2793570e87.77.2025.08.07.12.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 12:40:26 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	bhe@redhat.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	davidgow@google.co,
	glider@google.com,
	dvyukov@google.com
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
	snovitoll@gmail.com,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 2/2] kasan: call kasan_init_generic in kasan_init
Date: Fri,  8 Aug 2025 00:40:12 +0500
Message-Id: <20250807194012.631367-3-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250807194012.631367-1-snovitoll@gmail.com>
References: <20250807194012.631367-1-snovitoll@gmail.com>
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
Changes in v5:
- Unified arch patches into a single one, where we just call
	kasan_init_generic()
- Added Tested-by tag for riscv (tested the same change in v4)
- Added Acked-by tag for s390 (tested the same change in v4)
---
 arch/arm/mm/kasan_init.c    | 2 +-
 arch/arm64/mm/kasan_init.c  | 4 +---
 arch/riscv/mm/kasan_init.c  | 1 +
 arch/s390/kernel/early.c    | 3 ++-
 arch/x86/mm/kasan_init_64.c | 2 +-
 arch/xtensa/mm/kasan_init.c | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 111d4f70313..c6625e808bf 100644
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
index d541ce45dae..abeb81bf6eb 100644
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
index 41c635d6aca..ba2709b1eec 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -530,6 +530,7 @@ void __init kasan_init(void)
 
 	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 
 	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 9adfbdd377d..544e5403dd9 100644
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
index 0539efd0d21..998b6010d6d 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f39c4d83173..0524b9ed5e6 100644
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


