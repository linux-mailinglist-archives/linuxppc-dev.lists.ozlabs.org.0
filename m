Return-Path: <linuxppc-dev+bounces-17180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ES/F3TXnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A081196386
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWvp6SzGz3f7G;
	Wed, 25 Feb 2026 22:05:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772017510;
	cv=none; b=JuOL8KSq2N+/OFVBgzPj9KK2mFmWuv9vwgzQ4SOcZKVLhZ9XHLCfDaAYm7ukpiABWj+eyNhXdGVck2pVv0RBa2C0nuIhrSEd7p8I57ibSZpx30QlxhQxiGcSbhESOoepHBkJWZY56ktrMLEfn0Jv0/C5L+2KcWoGLASo89Iyzbp7XbZ7DSs5tyuRVcjK3YYDKQHRX9+BlhDAE73OvxyQ6K2kEsB/zj3L/ju2wjOEavXDoek8sFrzloOUeN9SBBW/Y5GJUxqxo90qE/hOXk30AlGigXgkXnWmuP/uecaZhUKUL6xuOeyMo82l39xPhKQRIXkkVsqTbew5izojMydrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772017510; c=relaxed/relaxed;
	bh=5++u0m+xGMfRLjfeOcLvTjbT7zO8s4I8sMKuOvXVOb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9/50iHuTVgAToB73h3Zrj4wAT5qh18LANPlHK+7LVc0QuKcyi3f4QIbsnTBT+fiC5QNvAr8TZbVYJ4hlDs+a3/+9qOtWJ9RHrIvgXwcA/ZwoPawcyUx4jwjmzlhR6YWxsp0cUSWcpFiGduYeGrVE0m8rR20SWnT8oa03QiuT6oBttsPcbQea4WUhejXTBKWoX+WN7T8E7IaXRKKlndDKXFekyZp3sfQRS0CdqHMGaj7BzT6iG9TdUODP+IyRGeoXRPO4lkZBJyCLhnmNG//QvWFlebNvErXzdIwrkrRiIWkZgqY7/4GPKFFO/6qCILAFzfqjPqVEklHEKkqqaE9Qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SaXQOMvV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SaXQOMvV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWvp1Q20z3f7j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:05:10 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ad9516a653so9137825ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017508; x=1772622308; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5++u0m+xGMfRLjfeOcLvTjbT7zO8s4I8sMKuOvXVOb0=;
        b=SaXQOMvVYwwSX6RTM8FxJEujpqa1Xy+ycQVv1UL8lFEXocCM0cI2veiSj+K4aWQ4Nj
         eSmJSAzqYoWl2ZgBlR0C4xFMiRlwxiXVT8IdUq4LmmWPCdy+teFj98Zw0WNXrGJjOpjz
         X8zHJF3a55JoCLbvVMNBRuIAMIwjn258+QJtBQxjqLeUBoBy/onwpFg/W07P4S9WaQZd
         pzcu73kQcFPTjEIEvGLux7p3h+nqacbDx5KcqaTop7Eoo9s0l2dKTDbd3WvartXbuwGo
         1KBz7zkmLI4YMKSBQRKVdoqVQwGvatpb6XgAExGxQf0DKV8wyBNXXG+qtTYBHtjwUMPh
         LvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017508; x=1772622308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5++u0m+xGMfRLjfeOcLvTjbT7zO8s4I8sMKuOvXVOb0=;
        b=H6LIkD3AHBGYhcb62jDJ2Ouyh957U9B1vq3bJZJuDeMfa7GEB/ZWopLKCtLzXVRgS0
         qNir6y8K3khiyeOpSrH9rEUmob5y/LIavSbBJvflD3og15Wmeme/607IjAV99PZTFWnF
         KcDSteETrElgUMwD8eXJBp0s459298x8BEd5cmCmCGvttFwVd2PJFgUuX32J1m1NqRfc
         Sg3E7Zl0b6ysaMhwKLRJP2MpXBmN+eBhqzAKqXVUGbxtPA87W7M0PTjrBPa7IQ8QLeQp
         /bQ9eBc4uluShU8w1L2bWPgmciU+cJxv85J5Wmr5Fka5DJsDU9FOdajALlDNntKVD99P
         tgag==
X-Gm-Message-State: AOJu0Ywk5GdjGUDVAGDc160ABJGCndsIWrp0l5E+dcvwfflblGVg0Lch
	lQaz5g8L8WICoHdLHCKUCMbWqE3wBK8DWI/E1tzoDQajv8j+9qV+AtL62DdD+A==
X-Gm-Gg: ATEYQzyXbdsY2mXArSICC4Jc6tC26P4/btcdNfKnB5Iw4gGChnAq6Ifb9TJlqs5kwUw
	BpB+y7/u6sHNQiJAk1zgK4caMDkfYgpXwWT5Joqqhutl+nnlFXa7p+1AiJ5LyO5PY1kSGlWsulg
	0JWQtKqukxpYr1WJoTiU1Srj1vw/r0mI2iWn8WXrcILlGeYfknJnIA/cVmcb80PSSYAsHmpso2G
	60srsfBWKkJ4pb/qc3XorupBXHhqyQQ/ToiCYy+GbjMAAnE1tznIUbD816C6SOPHBENKv1Pr3cE
	hD1XrLAkyuqUEzzGvJnHjnezmlSBTAcPN1Wu/Q2l17nm9VWMbq3P+E1d745OymtyO4N/dZchsL6
	cH3Zf0dsFP7tvi7ZrRVV9wT38UNw7aSQnB5t+V/kx7CCPZeyjrFBqs5EEN7Qoo22SlAXp7fJ/1q
	LyUgAcA0ytPPjtHPbi1mxwceQOeOJDTeA=
X-Received: by 2002:a17:903:2ece:b0:2a0:e532:242e with SMTP id d9443c01a7336-2ad743fee5cmr163977165ad.11.1772017507407;
        Wed, 25 Feb 2026 03:05:07 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:05:06 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v1 05/10] powerpc/64s: Move serialize_against_pte_lookup() to hash_pgtable.c
Date: Wed, 25 Feb 2026 16:34:26 +0530
Message-ID: <dd9b5abdcc56d935681f7f95fa018bd886d59ba0.1772013273.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772013273.git.ritesh.list@gmail.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17180-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2A081196386
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

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  1 -
 arch/powerpc/mm/book3s64/hash_pgtable.c      | 21 ++++++++++++++++
 arch/powerpc/mm/book3s64/pgtable.c           | 25 --------------------
 3 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 1a91762b455d..ff264d930fe8 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1400,7 +1400,6 @@ static inline bool arch_needs_pgtable_deposit(void)
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
index 359092001670..84284dff650a 100644
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
2.53.0


