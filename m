Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808353F9C9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 18:36:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx52l2Ppbz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Aug 2021 02:36:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r3Ljts+z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r3Ljts+z; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx5015YTwz306K
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Aug 2021 02:34:25 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so5191564pjq.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 09:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s29H83HO3/zGMiCk3uJxXaiCT/8ADytyYEcz6tRjaNU=;
 b=r3Ljts+zeH6GB859JVG8PB6MYlQ16cGD+4UdOCtQ3yd+3CCDm8vEwb+1PWi8F7uG+3
 CdrUAHkmF5fpJczCwOOrZ0WvA+OWNfUvNzbeZU3+g99j/HST8XgRhWiL/bAd744ehuRW
 9Pfgaa+UyyUUCHqtvDSrF12ART7uVe+bmKFTKb+PtBgG/3oLaQj8AtOoCaNTavlVCkiZ
 w2uU8E9s1ztJeYc7qDHSf8UDyR6WTnst/ZuyORb9er5jZoLiDbOby15u0OPXPPy4R/MX
 bfyflkWGjhAJAItkxeLEDz1HblE4cOTJbBcbLo3e43hYMxXPEc2KKZfprdPxAf2jblwz
 K7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s29H83HO3/zGMiCk3uJxXaiCT/8ADytyYEcz6tRjaNU=;
 b=FB76e9ilFYkIVkv9wGJkS2POACyEvgU/6p04vMKNvLTqeOYgiFJScMch87tQYnUSav
 UK9kZk9x1LtXFDsjesuGvg+IYuNFRYzD/7H9fJ9iXlKawLdOf7fnek2UwNkJDNvcAKjq
 Y+ylC/CmfQNhFz+0fZ7qyCanDRA5Cw50TN/8oPvHfAD8du0xnxHewp0mfTTsOQJ/Kugc
 wmrYTyT7uiLLQvKMsDB/KevuwHe5xa6QvvtjwWRbhL8SzfXef2As5E3TannzkjZpZq+0
 bujZvx+atC+HLzzg1AxSkFW4h2CQOcMTH8G7T2zGlFr6MHwzS9BhwrLbp09Iub4yig0e
 lK/g==
X-Gm-Message-State: AOAM531mWwzcpCdAPockR9OB40un1Xt5XRZlD2FG0dRPVK0etNcsBtzm
 CoeNARBVGt7NNf8rneF9p0/wMxQSaWo=
X-Google-Smtp-Source: ABdhPJzCteNc0SaeSUtngK3MK6HAFTD0IYKX6zVHKXs/9hf0CwhB1Xwzgj5o1n4KfzSeft2nAN8BGw==
X-Received: by 2002:a17:90a:a502:: with SMTP id
 a2mr1693159pjq.149.1630082063516; 
 Fri, 27 Aug 2021 09:34:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-244-72-10.tpgi.com.au. [220.244.72.10])
 by smtp.gmail.com with ESMTPSA id u24sm7083852pfm.85.2021.08.27.09.34.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 09:34:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/6] powerpc/pseries: Stop selecting PPC_HASH_MMU_NATIVE
Date: Sat, 28 Aug 2021 02:34:07 +1000
Message-Id: <20210827163410.1177154-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210827163410.1177154-1-npiggin@gmail.com>
References: <20210827163410.1177154-1-npiggin@gmail.com>
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

The pseries platform does not use the native hash code but the PAPR
virtualised hash interfaces. Remove PPC_HASH_MMU_NATIVE. This
requires moving some tlbiel code from hash_native.c to hash_utils.c.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   4 -
 arch/powerpc/mm/book3s64/hash_native.c        | 104 ------------------
 arch/powerpc/mm/book3s64/hash_utils.c         | 104 ++++++++++++++++++
 arch/powerpc/platforms/pseries/Kconfig        |   1 -
 4 files changed, 104 insertions(+), 109 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 215973b4cb26..d2e80f178b6d 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -14,7 +14,6 @@ enum {
 	TLB_INVAL_SCOPE_LPID = 1,	/* invalidate TLBs for current LPID */
 };
 
-#ifdef CONFIG_PPC_NATIVE
 static inline void tlbiel_all(void)
 {
 	/*
@@ -30,9 +29,6 @@ static inline void tlbiel_all(void)
 	else
 		hash__tlbiel_all(TLB_INVAL_SCOPE_GLOBAL);
 }
-#else
-static inline void tlbiel_all(void) { BUG(); }
-#endif
 
 static inline void tlbiel_all_lpid(bool radix)
 {
diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 52e170bd95ae..83afd08351f1 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -43,110 +43,6 @@
 
 static DEFINE_RAW_SPINLOCK(native_tlbie_lock);
 
-static inline void tlbiel_hash_set_isa206(unsigned int set, unsigned int is)
-{
-	unsigned long rb;
-
-	rb = (set << PPC_BITLSHIFT(51)) | (is << PPC_BITLSHIFT(53));
-
-	asm volatile("tlbiel %0" : : "r" (rb));
-}
-
-/*
- * tlbiel instruction for hash, set invalidation
- * i.e., r=1 and is=01 or is=10 or is=11
- */
-static __always_inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
-					unsigned int pid,
-					unsigned int ric, unsigned int prs)
-{
-	unsigned long rb;
-	unsigned long rs;
-	unsigned int r = 0; /* hash format */
-
-	rb = (set << PPC_BITLSHIFT(51)) | (is << PPC_BITLSHIFT(53));
-	rs = ((unsigned long)pid << PPC_BITLSHIFT(31));
-
-	asm volatile(PPC_TLBIEL(%0, %1, %2, %3, %4)
-		     : : "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r)
-		     : "memory");
-}
-
-
-static void tlbiel_all_isa206(unsigned int num_sets, unsigned int is)
-{
-	unsigned int set;
-
-	asm volatile("ptesync": : :"memory");
-
-	for (set = 0; set < num_sets; set++)
-		tlbiel_hash_set_isa206(set, is);
-
-	ppc_after_tlbiel_barrier();
-}
-
-static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
-{
-	unsigned int set;
-
-	asm volatile("ptesync": : :"memory");
-
-	/*
-	 * Flush the partition table cache if this is HV mode.
-	 */
-	if (early_cpu_has_feature(CPU_FTR_HVMODE))
-		tlbiel_hash_set_isa300(0, is, 0, 2, 0);
-
-	/*
-	 * Now invalidate the process table cache. UPRT=0 HPT modes (what
-	 * current hardware implements) do not use the process table, but
-	 * add the flushes anyway.
-	 *
-	 * From ISA v3.0B p. 1078:
-	 *     The following forms are invalid.
-	 *      * PRS=1, R=0, and RIC!=2 (The only process-scoped
-	 *        HPT caching is of the Process Table.)
-	 */
-	tlbiel_hash_set_isa300(0, is, 0, 2, 1);
-
-	/*
-	 * Then flush the sets of the TLB proper. Hash mode uses
-	 * partition scoped TLB translations, which may be flushed
-	 * in !HV mode.
-	 */
-	for (set = 0; set < num_sets; set++)
-		tlbiel_hash_set_isa300(set, is, 0, 0, 0);
-
-	ppc_after_tlbiel_barrier();
-
-	asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT "; isync" : : :"memory");
-}
-
-void hash__tlbiel_all(unsigned int action)
-{
-	unsigned int is;
-
-	switch (action) {
-	case TLB_INVAL_SCOPE_GLOBAL:
-		is = 3;
-		break;
-	case TLB_INVAL_SCOPE_LPID:
-		is = 2;
-		break;
-	default:
-		BUG();
-	}
-
-	if (early_cpu_has_feature(CPU_FTR_ARCH_300))
-		tlbiel_all_isa300(POWER9_TLB_SETS_HASH, is);
-	else if (early_cpu_has_feature(CPU_FTR_ARCH_207S))
-		tlbiel_all_isa206(POWER8_TLB_SETS, is);
-	else if (early_cpu_has_feature(CPU_FTR_ARCH_206))
-		tlbiel_all_isa206(POWER7_TLB_SETS, is);
-	else
-		WARN(1, "%s called on pre-POWER7 CPU\n", __func__);
-}
-
 static inline unsigned long  ___tlbie(unsigned long vpn, int psize,
 						int apsize, int ssize)
 {
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index e35faefa8e59..43c05cdbba73 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -175,6 +175,110 @@ static struct mmu_psize_def mmu_psize_defaults_gp[] = {
 	},
 };
 
+static inline void tlbiel_hash_set_isa206(unsigned int set, unsigned int is)
+{
+	unsigned long rb;
+
+	rb = (set << PPC_BITLSHIFT(51)) | (is << PPC_BITLSHIFT(53));
+
+	asm volatile("tlbiel %0" : : "r" (rb));
+}
+
+/*
+ * tlbiel instruction for hash, set invalidation
+ * i.e., r=1 and is=01 or is=10 or is=11
+ */
+static __always_inline void tlbiel_hash_set_isa300(unsigned int set, unsigned int is,
+					unsigned int pid,
+					unsigned int ric, unsigned int prs)
+{
+	unsigned long rb;
+	unsigned long rs;
+	unsigned int r = 0; /* hash format */
+
+	rb = (set << PPC_BITLSHIFT(51)) | (is << PPC_BITLSHIFT(53));
+	rs = ((unsigned long)pid << PPC_BITLSHIFT(31));
+
+	asm volatile(PPC_TLBIEL(%0, %1, %2, %3, %4)
+		     : : "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r)
+		     : "memory");
+}
+
+
+static void tlbiel_all_isa206(unsigned int num_sets, unsigned int is)
+{
+	unsigned int set;
+
+	asm volatile("ptesync": : :"memory");
+
+	for (set = 0; set < num_sets; set++)
+		tlbiel_hash_set_isa206(set, is);
+
+	ppc_after_tlbiel_barrier();
+}
+
+static void tlbiel_all_isa300(unsigned int num_sets, unsigned int is)
+{
+	unsigned int set;
+
+	asm volatile("ptesync": : :"memory");
+
+	/*
+	 * Flush the partition table cache if this is HV mode.
+	 */
+	if (early_cpu_has_feature(CPU_FTR_HVMODE))
+		tlbiel_hash_set_isa300(0, is, 0, 2, 0);
+
+	/*
+	 * Now invalidate the process table cache. UPRT=0 HPT modes (what
+	 * current hardware implements) do not use the process table, but
+	 * add the flushes anyway.
+	 *
+	 * From ISA v3.0B p. 1078:
+	 *     The following forms are invalid.
+	 *      * PRS=1, R=0, and RIC!=2 (The only process-scoped
+	 *        HPT caching is of the Process Table.)
+	 */
+	tlbiel_hash_set_isa300(0, is, 0, 2, 1);
+
+	/*
+	 * Then flush the sets of the TLB proper. Hash mode uses
+	 * partition scoped TLB translations, which may be flushed
+	 * in !HV mode.
+	 */
+	for (set = 0; set < num_sets; set++)
+		tlbiel_hash_set_isa300(set, is, 0, 0, 0);
+
+	ppc_after_tlbiel_barrier();
+
+	asm volatile(PPC_ISA_3_0_INVALIDATE_ERAT "; isync" : : :"memory");
+}
+
+void hash__tlbiel_all(unsigned int action)
+{
+	unsigned int is;
+
+	switch (action) {
+	case TLB_INVAL_SCOPE_GLOBAL:
+		is = 3;
+		break;
+	case TLB_INVAL_SCOPE_LPID:
+		is = 2;
+		break;
+	default:
+		BUG();
+	}
+
+	if (early_cpu_has_feature(CPU_FTR_ARCH_300))
+		tlbiel_all_isa300(POWER9_TLB_SETS_HASH, is);
+	else if (early_cpu_has_feature(CPU_FTR_ARCH_207S))
+		tlbiel_all_isa206(POWER8_TLB_SETS, is);
+	else if (early_cpu_has_feature(CPU_FTR_ARCH_206))
+		tlbiel_all_isa206(POWER7_TLB_SETS, is);
+	else
+		WARN(1, "%s called on pre-POWER7 CPU\n", __func__);
+}
+
 /*
  * 'R' and 'C' update notes:
  *  - Under pHyp or KVM, the updatepp path will not set C, thus it *will*
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 69a1ff8c079b..98ab9697ab5e 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -17,7 +17,6 @@ config PPC_PSERIES
 	select PPC_RTAS_DAEMON
 	select RTAS_ERROR_LOGGING
 	select PPC_UDBG_16550
-	select PPC_HASH_MMU_NATIVE
 	select PPC_DOORBELL
 	select HOTPLUG_CPU
 	select ARCH_RANDOM
-- 
2.23.0

