Return-Path: <linuxppc-dev+bounces-2383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CEF9A44A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:30:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWv15Lf0z3brT;
	Sat, 19 Oct 2024 04:30:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272637;
	cv=none; b=lcR07x+6dT+3u+8YNFKVSRDVii0hOe/AKHSqOLNGTOnp3md69YQdILJstbNtUvVJIdlLymcT352nDVCLDFEJm74+Q/KDC9eGF35CJ/Qj06sWnSGwfS/GtK7vTaqHFxeHE4Fme0SGai1doOyzAabynAB85vdxr6Q+ZDnin+yBBfTNzGlYO1vDznwUWkGrAh/80Vy2HEqTMhr0OgjGf1iRSrGje2V82inZXoSRO3W4KPOglpIOCkS9NCaayOO8mMeQaMMF5+FUtgCxSfoYI6weP/NN2/wHtdFHdAJuLFvxOblO7mxnVJVqa2n+OoGqB3Jxfdwhi4HhkGuPPMhltJTlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272637; c=relaxed/relaxed;
	bh=PKeOGzBwhkORap+bFaXRZ5k5ETEZTGkTXkc6r1BfTnM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ff7r7A/BKWMNYUAHTk9erf9XntYFcEd0TOlUDRAsRO6hfTmgANELAGRxYqEM1rNysn+3KDYvVhAINVaNuDkrCelm5ox4lSuzFIX/9RkQAMToZdO7Qi91K3h3g2XueXw7HWweb6I9ASNXZevybTZ4X9DpmoakwMgzGfG83NKG9pkqhyjamOiGN76mc365GPUqCLsdOGgN2bUpvaAAnYUMv8Oft29d/g9ts397f5A8Tb8bJEW5lVGuH+5DzKMuv+1oHMvZr+I2z2ksWL/NMN9iz1MDttUONGMQNSSBbrDoWtPCxoZ3xnLkOmc1xrXjVcx3KX8KO6qLHm2FkzzdkCPohg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JBoQdEMd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JBoQdEMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWv06cjdz3brV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:30:36 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7db637d1e4eso2453320a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272634; x=1729877434; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKeOGzBwhkORap+bFaXRZ5k5ETEZTGkTXkc6r1BfTnM=;
        b=JBoQdEMd3ClTr3B8MM8fxLg36MH2tkGlXHDLlxhagSX4aAXTZI71tNyrz1b4hJGoOR
         FIzStekzHbtnqL6Mj3rli2PmQBrfbJaxJBE0aDqQpV8XALzZ8Aw4aCJNqTqQGHOxehya
         AMsbOxjyQj9fCGumyRZxFU+OvtSghjpeLBCn1IsjN+bPoHFZvMM3sNK8XWul5XI6IyY1
         e9v+XRWE+zVQRB4pO0IxXZyse2aV8bQzxPEer+CozgS+3WD3PcBlFLEE0/kQj3Hm9LY+
         uHVikdkPgmVFOft1tOWndcg9jiuwdM/b1ba95gDMin6NrSeLC7YNEoJd1TsyWVc61h5g
         P5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272634; x=1729877434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKeOGzBwhkORap+bFaXRZ5k5ETEZTGkTXkc6r1BfTnM=;
        b=NG63tPWFW518hgI5U16C4QDglsxuLp/ptbXhh3168An5Wj3eOjdL2AhePCCDAlHnAF
         Ayv43cYN+IgnvbRb5NtytA9lxEhsAv3SRdUeOxwqppIFvB2xlkHchl33d2de7Tmfj29Q
         n9ICBTZ/zHjsxGThU0w2FItC8lMmJu/TNRqS3EQf1b9LD1tBamqi7L5Xp1QhhVJFAm1u
         Mh2WMzVOKT+KCRsvAKQrcopouyzF+kxLROdTR8RCd9nCSnlzyuGRLVSny85u99qHSoNt
         OL4disEkbGgQArM3WZgRexeXI+N7B2dxOPxQSpWADYDauhCp7bQdTPBRnwjZaGaHwYEH
         K35Q==
X-Gm-Message-State: AOJu0YwP4sHn+5nzTEe+tJkxD0AlIeRW0PGWDxzHW0XMTsV+m2G0sCDO
	1EvB8iwaH27gTqRJ9DbPMD1KqPKJqj4SsiNU45OaopSpjRzz/6dREP8HaLOT
X-Google-Smtp-Source: AGHT+IEHDVJvXPkTfxkfLhiJ891PgPvrAItwAzBFVy3rywsUuhpfmzOVbkrBnF6delxgn8dQGKkFxQ==
X-Received: by 2002:a05:6a20:d98:b0:1cf:38b0:57ff with SMTP id adf61e73a8af0-1d92c5ac311mr4139493637.48.1729272634341;
        Fri, 18 Oct 2024 10:30:34 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:30:33 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 03/12] book3s64/hash: Refactor kernel linear map related calls
Date: Fri, 18 Oct 2024 22:59:44 +0530
Message-ID: <56c610310aa50b5417976a39c5f15b78bc76c764.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This just brings all linear map related handling at one place instead of
having those functions scattered in hash_utils file.
Makes it easy for review.

No functionality changes in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 164 +++++++++++++-------------
 1 file changed, 82 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index e22a8f540193..fb2f717e9e74 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -273,6 +273,88 @@ void hash__tlbiel_all(unsigned int action)
 		WARN(1, "%s called on pre-POWER7 CPU\n", __func__);
 }
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
+static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
+
+static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
+{
+	unsigned long hash;
+	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
+	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
+	unsigned long mode = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL), HPTE_USE_KERNEL_KEY);
+	long ret;
+
+	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
+
+	/* Don't create HPTE entries for bad address */
+	if (!vsid)
+		return;
+
+	if (linear_map_hash_slots[lmi] & 0x80)
+		return;
+
+	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
+				    HPTE_V_BOLTED,
+				    mmu_linear_psize, mmu_kernel_ssize);
+
+	BUG_ON (ret < 0);
+	raw_spin_lock(&linear_map_hash_lock);
+	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
+	linear_map_hash_slots[lmi] = ret | 0x80;
+	raw_spin_unlock(&linear_map_hash_lock);
+}
+
+static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
+{
+	unsigned long hash, hidx, slot;
+	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
+	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
+
+	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
+	raw_spin_lock(&linear_map_hash_lock);
+	if (!(linear_map_hash_slots[lmi] & 0x80)) {
+		raw_spin_unlock(&linear_map_hash_lock);
+		return;
+	}
+	hidx = linear_map_hash_slots[lmi] & 0x7f;
+	linear_map_hash_slots[lmi] = 0;
+	raw_spin_unlock(&linear_map_hash_lock);
+	if (hidx & _PTEIDX_SECONDARY)
+		hash = ~hash;
+	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
+	slot += hidx & _PTEIDX_GROUP_IX;
+	mmu_hash_ops.hpte_invalidate(slot, vpn, mmu_linear_psize,
+				     mmu_linear_psize,
+				     mmu_kernel_ssize, 0);
+}
+
+int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	unsigned long flags, vaddr, lmi;
+	int i;
+
+	local_irq_save(flags);
+	for (i = 0; i < numpages; i++, page++) {
+		vaddr = (unsigned long)page_address(page);
+		lmi = __pa(vaddr) >> PAGE_SHIFT;
+		if (lmi >= linear_map_hash_count)
+			continue;
+		if (enable)
+			kernel_map_linear_page(vaddr, lmi);
+		else
+			kernel_unmap_linear_page(vaddr, lmi);
+	}
+	local_irq_restore(flags);
+	return 0;
+}
+#else /* CONFIG_DEBUG_PAGEALLOC */
+int hash__kernel_map_pages(struct page *page, int numpages,
+					 int enable)
+{
+	return 0;
+}
+#endif /* CONFIG_DEBUG_PAGEALLOC */
+
 /*
  * 'R' and 'C' update notes:
  *  - Under pHyp or KVM, the updatepp path will not set C, thus it *will*
@@ -2120,88 +2202,6 @@ void hpt_do_stress(unsigned long ea, unsigned long hpte_group)
 	}
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
-static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
-
-static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
-{
-	unsigned long hash;
-	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
-	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
-	unsigned long mode = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL), HPTE_USE_KERNEL_KEY);
-	long ret;
-
-	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
-
-	/* Don't create HPTE entries for bad address */
-	if (!vsid)
-		return;
-
-	if (linear_map_hash_slots[lmi] & 0x80)
-		return;
-
-	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
-				    HPTE_V_BOLTED,
-				    mmu_linear_psize, mmu_kernel_ssize);
-
-	BUG_ON (ret < 0);
-	raw_spin_lock(&linear_map_hash_lock);
-	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
-	linear_map_hash_slots[lmi] = ret | 0x80;
-	raw_spin_unlock(&linear_map_hash_lock);
-}
-
-static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
-{
-	unsigned long hash, hidx, slot;
-	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
-	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
-
-	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
-	raw_spin_lock(&linear_map_hash_lock);
-	if (!(linear_map_hash_slots[lmi] & 0x80)) {
-		raw_spin_unlock(&linear_map_hash_lock);
-		return;
-	}
-	hidx = linear_map_hash_slots[lmi] & 0x7f;
-	linear_map_hash_slots[lmi] = 0;
-	raw_spin_unlock(&linear_map_hash_lock);
-	if (hidx & _PTEIDX_SECONDARY)
-		hash = ~hash;
-	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
-	slot += hidx & _PTEIDX_GROUP_IX;
-	mmu_hash_ops.hpte_invalidate(slot, vpn, mmu_linear_psize,
-				     mmu_linear_psize,
-				     mmu_kernel_ssize, 0);
-}
-
-int hash__kernel_map_pages(struct page *page, int numpages, int enable)
-{
-	unsigned long flags, vaddr, lmi;
-	int i;
-
-	local_irq_save(flags);
-	for (i = 0; i < numpages; i++, page++) {
-		vaddr = (unsigned long)page_address(page);
-		lmi = __pa(vaddr) >> PAGE_SHIFT;
-		if (lmi >= linear_map_hash_count)
-			continue;
-		if (enable)
-			kernel_map_linear_page(vaddr, lmi);
-		else
-			kernel_unmap_linear_page(vaddr, lmi);
-	}
-	local_irq_restore(flags);
-	return 0;
-}
-#else /* CONFIG_DEBUG_PAGEALLOC */
-int hash__kernel_map_pages(struct page *page, int numpages,
-					 int enable)
-{
-	return 0;
-}
-#endif /* CONFIG_DEBUG_PAGEALLOC */
-
 void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				phys_addr_t first_memblock_size)
 {
-- 
2.46.0


