Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DE9460D04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:10:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vj50PBrz3c7h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:10:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FWrkoPe6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FWrkoPe6; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2VfW4pGwz3069
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:19 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id o4so15275119pfp.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGgNCNf0+/PKQu78DOLbLpQlOjPA8YgZvwx1+X75hdo=;
 b=FWrkoPe6Nji3xjPrqf8HafVxlZXseMmdtRdOGUBDNbmF24ktekjs0hePIjz5A13JXj
 hBrvK1ZmVFvY6Lh81WtmEaR/L9fibclOs8gBDGKqpytcoKNaRgHpkrWxSQ/moxF2lUo2
 wHj4911V3wk8hhxfSXegJr8E+pTBb7UjzkqXLuaHs1+SsIA6DuVp7W3EWTGHk+92Sk+A
 isbbQ06sFqrdwtQzzPvi0K63+4HhmJDfv7VorwWaNhj5dbMSAyydZMhHA/tEmIzT2mPX
 iYLGsRgua1Hnh09OuHgYcVgPTX17g8OsuNswHcSOXncdJ5HiJxHbKBmcxTVYupT6H7/W
 L7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGgNCNf0+/PKQu78DOLbLpQlOjPA8YgZvwx1+X75hdo=;
 b=EOgfjZPVpPLT1EsPHUv//2fhcq4OUK4QST3ZqmCiUFUECnFbTCitYzpW4PWH3cNnQz
 rKnlv/JjgS9HrQM8e73zhzcMi/fSI+bJpHLxwItMn2PDXBW/DdE5FBZeciAVDS02f0LP
 uvUs+bkxJ8GV0cSVs6vHW6NMEfC+KV2YfTkjmBjQ7zZVLl+qoFgskVUwWeAmO8UEK2Xf
 Aznqbzm/TIoOppT/C6PkSLunD5nOZj05d9k+KOYqmIzhENPfFyRVV7morwpZDqB/00Vc
 DimkHs1qNjne6UXOw3UEG2gBZL2tw0ClslZt644Rs5jaUkiK4puCrWCAXRgES3EIg74e
 FwfA==
X-Gm-Message-State: AOAM532MgOMhXY5rDq00y0fPhtyjjFrvXu3vw+UbzokTFFmIv9SN/J/L
 TWELX/ECA7VLJjrB+2Y4yI6n6P/Owvs=
X-Google-Smtp-Source: ABdhPJw1vgWJos1dLW4eVoTSGAaVdGt7BJNWDLEFE0C0saOkJ0Z3J2TfH+vc5oB48bKQ3Zif3WnlRQ==
X-Received: by 2002:a05:6a00:2290:b0:49f:c63a:2a5f with SMTP id
 f16-20020a056a00229000b0049fc63a2a5fmr36547686pfe.69.1638155297403; 
 Sun, 28 Nov 2021 19:08:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 03/17] powerpc/pseries: Stop selecting PPC_HASH_MMU_NATIVE
Date: Mon, 29 Nov 2021 13:07:49 +1000
Message-Id: <20211129030803.1888161-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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
index 92680da5229a..97a36fa3940e 100644
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
index 30618750bd98..f7fd91d153a4 100644
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

