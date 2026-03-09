Return-Path: <linuxppc-dev+bounces-17925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPNjKEMOr2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:31 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B86AB23E6F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4tR2CTbz3cBN;
	Tue, 10 Mar 2026 05:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080111;
	cv=none; b=a/nnUPRpFQdBDEM2SHAZJmPl3w128OViayqs4baDe/2BbdHAWuBAPQGibyqtAgaiN/izfJPAx5Dql7HMRR2uQZ5b1OOlVUimO+3RqZ+plDD8d1ZKsGi2j/jL0dCnSX2d9VkgW7C0hoYaOxB05LsopZF54mForJx6kEFbPJ8rDvY513quBxl4gNDFKZEk7d6Y4nTA5zqm2FwmEsKuayxcqYx0aVWjKEcj8n5ETMNMnjtIEE6Ym0xKxihbajzfscgwm6GwYjpKU2UT2QXGo3lqq+PIwFQ9sGXEPovrqQXdHP14oRyCZaLRIhgSmOzRhNqape6nJ3xzhzNdnO3nYHXy4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080111; c=relaxed/relaxed;
	bh=nb2FVFG9xOxlj9TxNAcYhj6fFvFJdTTnxVgK5PjkaUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqCaVDopEg7pAxjrGTiPwwF2FNpS+zSiwXs2H6hsz2Nc4sruNp+Ea8XD043EohYcwyqZlhEapz4kLEe2FFMOWyvyonz3OARs5nUf2b5cgMneBK8URH9ik1RajnA0IXsMLP7biwjRDKCPf+sTV85+5EOEEpHHXXlbAkvQfPLmNclBFa1Eckk4fQt0+m8jEM01xD3Nx0MfQQH6vVmo3CvdzNoo2YubVxFj1tDhFo3s4v40l+DV8rj9og0rcX8lrsow+/D1xdApiA1OKrAQnxW89T3BNZO+6u4+bJrCURVrBql/qIsYoPPnrkxEYSWksnB3xsp90jmCCpWDwW063A+aNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jVclzGfA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jVclzGfA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4tQ4Rh3z3cB5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:15:10 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-829865a8471so4624826b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080108; x=1773684908; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb2FVFG9xOxlj9TxNAcYhj6fFvFJdTTnxVgK5PjkaUw=;
        b=jVclzGfArbKeCx4jNxBMX2bp44mLjWHawW+TB3OBtpuN7Zfsvtt/MWEa/QrvjK8SA0
         H+TVyQ3vMzSd68A8fjG2xMUH68O9GWpwQzDlsqZkiz7wSoQkIIPfXx+PAkNVxzJGyyBV
         9eJDk77BRXGGA0px8veGsdlSJ+6azaq8CpdRuDicc4IHIgRH7R6vORRlQXt7NM7EW3TE
         McKDmF4h1+IYmwBwV45EDqYEU7ri30vfD3+pXjomVDrRADfGkgLvC58ttT3vwjGjZaRV
         8NaDbCTRqhFqOBgLyUU2Bg7AJ/OZRk1/UQ96m/e2hwyvS5kb7sX6bn/eMbLn+9v6EjHn
         1INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080108; x=1773684908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nb2FVFG9xOxlj9TxNAcYhj6fFvFJdTTnxVgK5PjkaUw=;
        b=Oa7Xi8snWgqIQg0bKAZiMaEQQfDzuCSl4dgBWpSShQZoObapWy29d8ogv60jTgNC6U
         FJDk1TbCnzRZLVX/sLI4RcE5i/4o07N0QYOEBwmh5pycGqkvKO8g5hBmw//THytRElc/
         aYwI0CR50wSebqPUezbtr3wJW0OBMzhcWmLQj2ZbAad3gI1f/dlCVGK+SEmKsO22mjoP
         KCp9Hc8G9/7odnPOcszZaRr1Eoou2yxE0cafgZkBQfx1L4RR08HdYNlgVIsJf/8QinJO
         0YwAXHp74z1ywXS9fq3Bj43YkRYpawpvaSFIQR4JKI2RnWZEThwcHZKIlwkAQ+P1vw7Q
         8mOA==
X-Gm-Message-State: AOJu0Yybemor0YnBYCO8THrojpLYN+T/L6bRY9wHq/A7t8ODhvBV2sSL
	4F1oJH6DnWK32vv7lSLohTgyTVoRsQWC8qAGdmWK5VGRZOi6/jlWtY/WRtFqQegT
X-Gm-Gg: ATEYQzyZXSFnglqfFTai2lKmglCvVqIZBWHSfuL6yrWJ9QTbE+8TkzPgHUcQoU8rSBW
	eiCodbKD4Zs+L3GAQnvsSrRmPBFM0/PlgVzUc4t9mSlkFemGbA+b6vsZEt83jfvOuWdvD7NP99w
	HFLExk5qgoQy3OSu7TMjx4AHcLkBLU6SLmR/m0TC4Zi3sUXhixrzv/1LH4kAInv4qVFngDNeVT7
	WbMiBIVzf/pRO/y9VDgr5Im2tS4ZbPebQM2paO3MOkZISGVAiCgHV9IVKis5s6Bg1rtULxCJYkr
	q9YmSryLRgVl/KFDyioxlS1YpJ7ds7kJZv0jylxdxh5PvCrmdnavDjHXHGB0dRrxt4F/h4THKif
	IXkLhgzfRUYg/hVLPkBXYgGj9xS59P75nNuTQfoBzLJ/89nujx0+FPbPby0kdrn/LQ5UIywhHdV
	p/3pRd5WYipXF2CwnNj3cwvfAVLaTYfsdjlvofOrZ51qgKzDxjqEBRCTg693/t57/H
X-Received: by 2002:a05:6a00:2d19:b0:829:883c:1d53 with SMTP id d2e1a72fcca58-829a2f13e5emr10567643b3a.31.1773080107573;
        Mon, 09 Mar 2026 11:15:07 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.15.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:15:06 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 05/10] powerpc/64s: Move serialize_against_pte_lookup() to hash_pgtable.c
Date: Mon,  9 Mar 2026 23:44:28 +0530
Message-ID: <a73ebe800a9be257329507703779f822363f8b2f.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773078178.git.ritesh.list@gmail.com>
References: <cover.1773078178.git.ritesh.list@gmail.com>
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
X-Rspamd-Queue-Id: B86AB23E6F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17925-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Originally,
commit fa4531f753f1 ("powerpc/mm: Don't send IPI to all cpus on THP updates")
introduced serialize_against_pte_lookup() call for both Radix and Hash.

However below commit fixed the race with Radix
commit 70cbc3cc78a9 ("mm: gup: fix the fast GUP race against THP collapse")

And therefore following commit removed the
serialize_against_pte_lookup() call from radix_pgtable.c
commit bedf03416913
("powerpc/64s/radix: don't need to broadcast IPI for radix pmd collapse flush")

Now since serialize_against_pte_lookup() only gets called from
hash__pmdp_collapse_flush(), thus move the related functions to
hash_pgtable.c

Hence this patch:
- moves serialize_against_pte_lookup() from radix_pgtable.c to hash_pgtable.c
- removes the radix specific calls from do_serialize()
- renames do_serialize() to do_nothing().

There should not be any functionality change in this patch.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  1 -
 arch/powerpc/mm/book3s64/hash_pgtable.c      | 21 ++++++++++++++++
 arch/powerpc/mm/book3s64/pgtable.c           | 25 --------------------
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 6be7428fdde4..1b8916618f89 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1438,7 +1438,6 @@ static inline bool arch_needs_pgtable_deposit(void)
 		return false;
 	return true;
 }
-extern void serialize_against_pte_lookup(struct mm_struct *mm);
 
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index ac2a24d15d2e..d9b5b751d7b7 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -221,6 +221,27 @@ unsigned long hash__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr
 	return old;
 }
 
+static void do_nothing(void *arg)
+{
+
+}
+
+/*
+ * Serialize against __find_linux_pte() which does lock-less
+ * lookup in page tables with local interrupts disabled. For huge pages
+ * it casts pmd_t to pte_t. Since format of pte_t is different from
+ * pmd_t we want to prevent transit from pmd pointing to page table
+ * to pmd pointing to huge page (and back) while interrupts are disabled.
+ * We clear pmd to possibly replace it with page table pointer in
+ * different code paths. So make sure we wait for the parallel
+ * __find_linux_pte() to finish.
+ */
+static void serialize_against_pte_lookup(struct mm_struct *mm)
+{
+	smp_mb();
+	smp_call_function_many(mm_cpumask(mm), do_nothing, mm, 1);
+}
+
 pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 			    pmd_t *pmdp)
 {
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 42c7906d0e43..faec2dc71a5c 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -150,31 +150,6 @@ void set_pud_at(struct mm_struct *mm, unsigned long addr,
 	return set_pte_at_unchecked(mm, addr, pudp_ptep(pudp), pud_pte(pud));
 }
 
-static void do_serialize(void *arg)
-{
-	/* We've taken the IPI, so try to trim the mask while here */
-	if (radix_enabled()) {
-		struct mm_struct *mm = arg;
-		exit_lazy_flush_tlb(mm, false);
-	}
-}
-
-/*
- * Serialize against __find_linux_pte() which does lock-less
- * lookup in page tables with local interrupts disabled. For huge pages
- * it casts pmd_t to pte_t. Since format of pte_t is different from
- * pmd_t we want to prevent transit from pmd pointing to page table
- * to pmd pointing to huge page (and back) while interrupts are disabled.
- * We clear pmd to possibly replace it with page table pointer in
- * different code paths. So make sure we wait for the parallel
- * __find_linux_pte() to finish.
- */
-void serialize_against_pte_lookup(struct mm_struct *mm)
-{
-	smp_mb();
-	smp_call_function_many(mm_cpumask(mm), do_serialize, mm, 1);
-}
-
 /*
  * We use this to invalidate a pmdp entry before switching from a
  * hugepte to regular pmd entry.
-- 
2.50.1 (Apple Git-155)


