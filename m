Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3A98C1C4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 04:05:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i7kFHFDX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VbBzm66Vrz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 12:05:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i7kFHFDX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=richard.weiyang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbBz03W4Nz3c4v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 12:04:42 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a599a298990so363778666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2024 19:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715306676; x=1715911476; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI5tyqymmN9gGbJ6fagCaRykBg1tbmyzeV+T0zeBy6M=;
        b=i7kFHFDXyHXmYE+QMn5QNaW2g5DEkO3Ehay23n7vkY9Qyqk/iojVOM4xErMtIDdY7W
         pSSnO8dgsCHupwK/AKuRI7VOtcZJAM1KG97tsNKn0YEO10ymNMPaAhK98tM+4jmTX2vQ
         AP4IUaiPYS+hs5zZDci+B/TjAiR/em624LmonYoFAB1mFChaigaAAy2eVbkFFfzmABXk
         lkQP2hQCXEiYFmBxOJ3xKzjIfdyAdf9MjjaFxaHIqv6vcVNLxA5uOWf5nCAKmHOt+bd/
         k2wXPehDwn4aOkA/vqT4FfCzEH7XW0bnrv2EaZFmEaU9t6d3UjoPfrz0rEEqYr3D246A
         PfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715306676; x=1715911476;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI5tyqymmN9gGbJ6fagCaRykBg1tbmyzeV+T0zeBy6M=;
        b=cz986tocfi6l9xKkHKUHXHWbP8CgSOa0PF2toaP+3dz+kjcU6HUwNQs7gJsDzCWo7d
         +v3uQt6UmS/boJlqvXtkLlEw0CRI1VxajWEwUdpUk/ZebRde2pu7wzhBT4xkE6xyXqpy
         Mp62JdJe/8bozBINI6jVUY7Q8AdyVw7pIL6j9ZMwBv7QjmuUqCf2ziOEXXpSn3Q1s6p5
         s45sUVN9Kki7bfooKnpDwuH+XMDU9QutUe9cMuBwtL0IK3OaYAKIPb9UVwjyamgI5KdA
         N8/aAIodYUNZWCX+a0NmeBkZKL4muMrf+QAkTClDXPzKMDrvFflbsvCMbCGoI3Mzvw9z
         VG4g==
X-Gm-Message-State: AOJu0YzNWe3bDosJ/opZvULoqIHsvUZaHA2ShuvcALAgnYCKjraqJmi2
	MuRu+zLU4POEJiI2BQA65CiNCZOMrn3Ccnw6698ctoF0ViK6usEQ
X-Google-Smtp-Source: AGHT+IF2QDguCK8rTieenO0F4aGJLfLKKE/VD2hKk7gSUjMQEBdHmWN/fJPbugbyh1hN9Y/Vir1/Ug==
X-Received: by 2002:a17:906:3c57:b0:a59:2e45:f528 with SMTP id a640c23a62f3a-a5a2d5c96b5mr71148666b.38.1715306675648;
        Thu, 09 May 2024 19:04:35 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d553sm133706966b.43.2024.05.09.19.04.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 May 2024 19:04:34 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	arnd@arndb.de,
	rppt@kernel.org,
	anshuman.khandual@arm.com
Subject: [Patch v2] mm/memblock: discard .text/.data if CONFIG_ARCH_KEEP_MEMBLOCK not set
Date: Fri, 10 May 2024 02:04:22 +0000
Message-Id: <20240510020422.8038-1-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_ARCH_KEEP_MEMBLOCK not set, we expect to discard related
code and data. But it doesn't until CONFIG_MEMORY_HOTPLUG not set
neither.

This patch puts memblock's .text/.data into its own section, so that it
only depends on CONFIG_ARCH_KEEP_MEMBLOCK to discard related code and
data.

After this, from the log message in mem_init_print_info(), init size
increase from 2420K to 2432K on arch x86.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>

---
v2: fix orphan section for powerpc
---
 arch/powerpc/kernel/vmlinux.lds.S |  1 +
 include/asm-generic/vmlinux.lds.h | 14 +++++++++++++-
 include/linux/memblock.h          |  8 ++++----
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index f420df7888a7..d6d33bec597a 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -125,6 +125,7 @@ SECTIONS
 		*(.text.asan.* .text.tsan.*)
 		MEM_KEEP(init.text)
 		MEM_KEEP(exit.text)
+		MEMBLOCK_KEEP(init.text)
 	} :text
 
 	. = ALIGN(PAGE_SIZE);
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index f7749d0f2562..775c5eedb9e6 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -147,6 +147,14 @@
 #define MEM_DISCARD(sec) *(.mem##sec)
 #endif
 
+#if defined(CONFIG_ARCH_KEEP_MEMBLOCK)
+#define MEMBLOCK_KEEP(sec)    *(.mb##sec)
+#define MEMBLOCK_DISCARD(sec)
+#else
+#define MEMBLOCK_KEEP(sec)
+#define MEMBLOCK_DISCARD(sec) *(.mb##sec)
+#endif
+
 #ifndef CONFIG_HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
 #define KEEP_PATCHABLE		KEEP(*(__patchable_function_entries))
 #define PATCHABLE_DISCARDS
@@ -356,6 +364,7 @@
 	*(.ref.data)							\
 	*(.data..shared_aligned) /* percpu related */			\
 	MEM_KEEP(init.data*)						\
+	MEMBLOCK_KEEP(init.data*)					\
 	*(.data.unlikely)						\
 	__start_once = .;						\
 	*(.data.once)							\
@@ -573,6 +582,7 @@
 		*(.ref.text)						\
 		*(.text.asan.* .text.tsan.*)				\
 	MEM_KEEP(init.text*)						\
+	MEMBLOCK_KEEP(init.text*)					\
 
 
 /* sched.text is aling to function alignment to secure we have same
@@ -680,6 +690,7 @@
 	KEEP(*(SORT(___kentry+*)))					\
 	*(.init.data .init.data.*)					\
 	MEM_DISCARD(init.data*)						\
+	MEMBLOCK_DISCARD(init.data*)					\
 	KERNEL_CTORS()							\
 	MCOUNT_REC()							\
 	*(.init.rodata .init.rodata.*)					\
@@ -706,7 +717,8 @@
 #define INIT_TEXT							\
 	*(.init.text .init.text.*)					\
 	*(.text.startup)						\
-	MEM_DISCARD(init.text*)
+	MEM_DISCARD(init.text*)						\
+	MEMBLOCK_DISCARD(init.text*)
 
 #define EXIT_DATA							\
 	*(.exit.data .exit.data.*)					\
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index e2082240586d..3e1f1d42dde7 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -100,13 +100,13 @@ struct memblock {
 
 extern struct memblock memblock;
 
+#define __init_memblock        __section(".mbinit.text") __cold notrace \
+						  __latent_entropy
+#define __initdata_memblock    __section(".mbinit.data")
+
 #ifndef CONFIG_ARCH_KEEP_MEMBLOCK
-#define __init_memblock __meminit
-#define __initdata_memblock __meminitdata
 void memblock_discard(void);
 #else
-#define __init_memblock
-#define __initdata_memblock
 static inline void memblock_discard(void) {}
 #endif
 
-- 
2.34.1

