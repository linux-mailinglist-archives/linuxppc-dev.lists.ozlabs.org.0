Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B877A436D80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:32:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2L81y5dz3cnC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:32:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dfno8e+m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Dfno8e+m; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2HY1S6Yz2yp8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:32 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so6578199pjq.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r7MwLLL2Non4P6sdcif4ctRqal9lyo7X0hD/Y4N6OrQ=;
 b=Dfno8e+mdo9vZYZEYMDb0WZMIVUQPKP73Udb8Qd2os1IVZ0qTNzkvdS4oM1W5yRoLd
 vKoJS06J1U28O8PEZQslLrMBIgPODyYP8HuW9vUGn+g+bcEtweD2cMq/5kviSRXX0QTS
 WEfckPocxWFYs0exDp+r2hJrpDD60RipF7wv4tsrJ7uFq5ZU0YgpkkZyzoYzm54aE7Ev
 hiDFJrTPBo4/qnUKznRZMN8+AzEGZRrS7HbpVssm7OhUrF/J0ULgvG48hrZwM0X/pTYt
 0oFyypikNvvtsXy1OWGHYOcg9pUC6bgpVeRUSbTQ4Lxq16Vx0rOz9CDa9QfYcjRtN8EQ
 hEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r7MwLLL2Non4P6sdcif4ctRqal9lyo7X0hD/Y4N6OrQ=;
 b=rCOTJHH/LZ8A65XE10Q14lFO+tRcs/4s5PdN7ICFhspVxL7bn7mp7xSEhx3FkqOsLS
 7TjoFILHCXjLWhu7eziKCkUikV0/z83nx968KGrL4osvT1utMo38xan2907jxhiUEoMX
 yj4U79eNCPrAQ2rqIn6PPBd8HyZpnv6navH18RizNZ2BfdcjUYa1o6NUiHQ++FFuE2DJ
 6Zvazx1jIEcDHCm0h09RJu5mQpw3Dyn8Sff0mwcU7xlKjc2iBFTyMDhzOao94BM3j1uq
 FA6ZX2DwIGGl92F9yP5AcH8vZYVl9HK9K/cJd6CW4rynGFQZhCrCdaCDiBqZMA6B5nSA
 pHtg==
X-Gm-Message-State: AOAM533rMxr+8SL5x4uZsugggaoRnGjGwyKUhQl1uTD/AIz4W2TFn4jM
 l4SfvN3UVmFZsVFBgeFcCKT9KJEzGZU=
X-Google-Smtp-Source: ABdhPJw+A3wUcqztlPwsC0igirUexF+PWI7Ot+5o8kgoPjhifwbMQhBpSwVbmdFLgweaxISaVF0b6w==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr9718633pjb.100.1634855430911; 
 Thu, 21 Oct 2021 15:30:30 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/18] powerpc/pseries: Stop selecting PPC_HASH_MMU_NATIVE
Date: Fri, 22 Oct 2021 08:29:58 +1000
Message-Id: <20211021223013.2641952-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
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
virtualised hash interfaces, so remove PPC_HASH_MMU_NATIVE.

This requires moving tlbiel code from hash_native.c to hash_utils.c.

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
index d8279bfe68ea..d2a320828c0b 100644
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
index ebe3044711ce..ffc52ff0b3f0 100644
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

