Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 639072DF260
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 00:54:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cz2f46l3TzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Dec 2020 10:54:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rrypSkDa; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cz2Vk6HkQzDqS5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Dec 2020 10:48:30 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id f14so3673986pju.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 15:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QybGjdSIsDRYE3ibaVlzKWhdb3UETSBreqtTrYRLhIM=;
 b=rrypSkDa1PmIimWyTQ7VP+kpEnbpeFzKqKYsSklf9wXqBKhuTvJngnd/SIbVJSqwjc
 4aG+xkOBZINERmFB1R1KCuTGRLK/CdqUlxfduvKKr8hPIsZ89hmj7yD3s1xnSKNggwgp
 i74S9f1oz1jwQ3Lbylr+m4uUa8sjl6cQrQoi/UplNunWsJ8iEOyGev8h4AB1gjRWRj1X
 +a9V0SFAEuvOD25EO/O8yU6ZdCMN17bmE2OSvQDKYCSlczn7wlnUtNpSENaFbvmB+Uhb
 KxXryLBPYsO1c6Pq23q5FpK7QnDSueESyNT9gC9/RGGZxhRwtemXyv71eSK+9xGoOot0
 t3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QybGjdSIsDRYE3ibaVlzKWhdb3UETSBreqtTrYRLhIM=;
 b=b/QE0FHtWiOLhXMYfTwz0XPLAoBTaGt6xmhMoquvdtu+URQkH8iAnCo/9rlIEozE8d
 HYtx2+zHijnCUTn+Q/FnNF2YLHp6U9iodge/ImK01xtxcbTWyPMi6LCEE7aTX1O20yjp
 sugLxQ9/XDC58rXAhiAB76gV1GWwhZpuGsIjNZoY1eSmkjxQyTevPf6WezPebZGUJHd/
 cfcWKr23kpfhUMmAXkkGNe/+5VxoGabl5OAfQX9PMgbPY5g2FDeCKnVkbDGbQhzVwVAY
 BgmaGnvJkJ9U67Nz3gsx5F/ORpbtfTm0V+ObS6987csnsT5T0s7lDLkdekAN94EsrEUl
 plog==
X-Gm-Message-State: AOAM533J074n5+nzlhH6p0jpQD78O8VSBohX+/54RMAGaUKStdx8ht5W
 /W6JILCDrpuC/rIBjQ6kItlpxHuu47U=
X-Google-Smtp-Source: ABdhPJz9jpZknV38JHEgZteoqTtzW8+vca+nUoyNaD4brssfm6K/m9l3Jv0R68FO8rP5hzMNtMG5bw==
X-Received: by 2002:a17:902:fe87:b029:da:5d3b:4a84 with SMTP id
 x7-20020a170902fe87b02900da5d3b4a84mr10746327plm.51.1608421707942; 
 Sat, 19 Dec 2020 15:48:27 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id k15sm12729275pfh.40.2020.12.19.15.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 15:48:27 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/5] powerpc/64s: add CONFIG_PPC_NMMU for nest MMU support
Date: Sun, 20 Dec 2020 09:48:11 +1000
Message-Id: <20201219234813.830747-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201219234813.830747-1-npiggin@gmail.com>
References: <20201219234813.830747-1-npiggin@gmail.com>
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

This allows some nest MMU features to be compiled away if coprocessor
support is not selected.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                          | 1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      | 2 ++
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 2 ++
 arch/powerpc/include/asm/mmu_context.h        | 5 +++--
 arch/powerpc/platforms/Kconfig                | 3 +++
 arch/powerpc/platforms/powernv/Kconfig        | 1 +
 6 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ae7391627054..4376bf4c53b4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -888,6 +888,7 @@ config PPC_PROT_SAO_LPAR
 
 config PPC_COPRO_BASE
 	bool
+	select PPC_NMMU if PPC_BOOK3S_64
 
 config SCHED_SMT
 	bool "SMT (Hyperthreading) scheduler support"
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 995bbcdd0ef8..07850d68a624 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -103,8 +103,10 @@ typedef struct {
 	/* Number of bits in the mm_cpumask */
 	atomic_t active_cpus;
 
+#ifdef CONFIG_PPC_NMMU
 	/* Number of users of the external (Nest) MMU */
 	atomic_t copros;
+#endif
 
 	/* Number of user space windows opened in process mm_context */
 	atomic_t vas_windows;
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 0a7431e954c6..c70a82851f78 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -16,8 +16,10 @@ enum {
 
 static inline bool mm_has_nmmu(struct mm_struct *mm)
 {
+#ifdef CONFIG_PPC_NMMU
 	if (unlikely(atomic_read(&mm->context.copros) > 0))
 		return true;
+#endif
 	return false;
 }
 
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index d5821834dba9..53eac0cc4929 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -143,6 +143,7 @@ static inline void dec_mm_active_cpus(struct mm_struct *mm)
 	atomic_dec(&mm->context.active_cpus);
 }
 
+#ifdef CONFIG_PPC_NMMU
 static inline void mm_context_add_copro(struct mm_struct *mm)
 {
 	/*
@@ -187,6 +188,7 @@ static inline void mm_context_remove_copro(struct mm_struct *mm)
 			dec_mm_active_cpus(mm);
 	}
 }
+#endif
 
 /*
  * vas_windows counter shows number of open windows in the mm
@@ -218,8 +220,7 @@ static inline void mm_context_remove_vas_window(struct mm_struct *mm)
 #else
 static inline void inc_mm_active_cpus(struct mm_struct *mm) { }
 static inline void dec_mm_active_cpus(struct mm_struct *mm) { }
-static inline void mm_context_add_copro(struct mm_struct *mm) { }
-static inline void mm_context_remove_copro(struct mm_struct *mm) { }
+static inline bool mm_has_nmmu(struct mm_struct *mm) { return false; }
 #endif
 
 
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 7a5e8f4541e3..b4b04b3f98d1 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -191,6 +191,9 @@ config PPC_INDIRECT_MMIO
 config PPC_IO_WORKAROUNDS
 	bool
 
+config PPC_NMMU
+	bool
+
 source "drivers/cpufreq/Kconfig"
 
 menu "CPUIdle driver"
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 619b093a0657..145009d74457 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -36,6 +36,7 @@ config PPC_MEMTRACE
 config PPC_VAS
 	bool "IBM Virtual Accelerator Switchboard (VAS)"
 	depends on PPC_POWERNV && PPC_64K_PAGES
+	select PPC_NMMU
 	default y
 	help
 	  This enables support for IBM Virtual Accelerator Switchboard (VAS).
-- 
2.23.0

