Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047225A7D44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 14:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHk2y6dkQz3bfH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 22:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W8ZEWKTw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=W8ZEWKTw;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHk2G3lfXz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 22:27:01 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id w2so14020979pld.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 05:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=rdksA5ZeKM0Molgpv+xFvszosGtiIIhi6pWr3wAPDWg=;
        b=W8ZEWKTwh3SpEXAW3jsBR1c7JMxHjr23tZhhEIRi3LIlQVbknbLRXei3fHGm1M2Kaq
         ihwfavFRdPmoapqiqdo/YtKEKaKJ6S3z53ugjU3rXWiASsUD9JoRUcjOzKVsdSosqCkP
         DtANCYI0244YSqSIAU306890IyzRqmUlQP+261t8qsWk4ZmG4VKQV/t6HN5vFJ47/Jik
         JYsJym2ALjmX/aRf5iIYxpnJEdz2gE+YrvRTxeV55V7hx0YfsgampfDrTbQmbFU444Py
         idC2kf9an6TJc1kvc3NE4AN4sBPyTO4uD5CQqxcHChkmvV0d3mFhSbFq2vZylhtBdUNm
         C3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=rdksA5ZeKM0Molgpv+xFvszosGtiIIhi6pWr3wAPDWg=;
        b=JWq8O6mbaNS4lNYe1mjAVzOyP+rHZWczgpyE1q0igj8tT5No2ZX7iItd70od/jvP4f
         94yZwzjArr3mauHdFDDwwNExjnQgRbmRrx3R8OQcyXGdZGLWnp8Mhgvl7CEg6MhEdaip
         tQwrCI0BTmXZRcmwH7imsyZqEjHOVUpoWL7AZm9fm1V+kYlL+/t5m8HTfe6jkKDvNrR1
         1MhMcxdBQdvaKLBmntR5s9Kaix+pQi73FJen7czJbddMv/t5P+Us/RPNRYXZd1HKVcgV
         Tf+KyUgwkMuTkndIMlt7z7Sg6UFDHxPm2aC6f61vfqN3AkhyXEWYsWnPMulL3yyTLW3O
         UaYQ==
X-Gm-Message-State: ACgBeo0kQMND1fpfiOdgj686Mosy0BvHWoAPs2Hw+JZsoZIlRMy+WW1n
	M7rwd85IjxvnBZI3Kkc3lA7ciXOFkzg=
X-Google-Smtp-Source: AA6agR4aXDwFtaMC8ioq57dKoFvRKSd9oXxBoss9bf8z4RsD4b6NOnkHzxIhoKW/Sc078+kzrv0Ghw==
X-Received: by 2002:a17:90a:17e1:b0:1f2:2ff2:6cae with SMTP id q88-20020a17090a17e100b001f22ff26caemr3061445pja.196.1661948818378;
        Wed, 31 Aug 2022 05:26:58 -0700 (PDT)
Received: from bobo.ibm.com (110-175-65-113.tpgi.com.au. [110.175.65.113])
        by smtp.gmail.com with ESMTPSA id e13-20020a056a0000cd00b00537a8d2c2easm5700091pfj.80.2022.08.31.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 05:26:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: add pte_needs_flush and huge_pmd_needs_flush
Date: Wed, 31 Aug 2022 22:26:49 +1000
Message-Id: <20220831122649.1209126-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow PTE changes to avoid flushing the TLB when access permissions are
being relaxed, the dirty bit is being set, and the accessed bit is being
changed.

Relaxing access permissions and setting dirty and accessed bits do not
require a flush because the MMU will re-load the PTE and notice the
updates (it may also cause a spurious fault).

Clearing the accessed bit does not require a flush because of the
imprecise PTE accessed bit accounting that is already performed, as
documented in ptep_clear_flush_young().

This reduces TLB flushing for some mprotect(2) calls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

 arch/powerpc/include/asm/book3s/64/pgtable.h  |  3 ++
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 53 +++++++++++++++++++
 arch/powerpc/mm/book3s64/hash_tlb.c           |  1 +
 arch/powerpc/mm/book3s64/pgtable.c            |  1 +
 4 files changed, 58 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cb9d5fd39d7f..a5042bb9a30c 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -411,6 +411,9 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
  * event of it not getting flushed for a long time the delay
  * shouldn't really matter because there's no real memory
  * pressure for swapout to react to. ]
+ *
+ * Note: this optimisation also exists in pte_needs_flush() and
+ * huge_pmd_needs_flush().
  */
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define ptep_clear_flush_young ptep_test_and_clear_young
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index d2e80f178b6d..bcd7cb585d17 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -143,6 +143,59 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 		flush_tlb_page(vma, address);
 }
 
+static inline bool __pte_flags_need_flush(unsigned long oldval, unsigned long newval)
+{
+	unsigned long delta = oldval ^ newval;
+
+	/*
+	 * The return value of this function doesn't matter for hash,
+	 * ptep_modify_prot_start() does a pte_update() which does or schedules
+	 * any necessary hash table update and flush.
+	 */
+	if (!radix_enabled())
+		return true;
+
+	/*
+	 * In theory some changed software bits could be tolerated, in practice
+	 * those should rarely if ever matter.
+	 */
+
+	/* Don't deal with kernel mappings or non-PTEs or not-present PTEs */
+	VM_BUG_ON((oldval | newval) & _PAGE_PRIVILEGED);
+	VM_BUG_ON(!((oldval | newval) & _PAGE_PTE));
+	VM_BUG_ON(!((oldval | newval) & _PAGE_PRESENT));
+
+	/* Must flush on any change except READ, WRITE, EXEC, DIRTY, ACCESSED */
+	if (delta & ~(_PAGE_RWX | _PAGE_DIRTY | _PAGE_ACCESSED))
+		return true;
+
+	/*
+	 * If any of the above was present in old but cleared in new, flush.
+	 * With the exception of _PAGE_ACCESSED, don't worry about flushing
+	 * if that was cleared (see the comment in ptep_clear_flush_young()).
+	 */
+	if ((delta & ~_PAGE_ACCESSED) & oldval)
+		return true;
+
+	return false;
+}
+
+#ifndef pte_needs_flush
+static inline bool pte_needs_flush(pte_t oldpte, pte_t newpte)
+{
+	return __pte_flags_need_flush(pte_val(oldpte), pte_val(newpte));
+}
+#define pte_needs_flush pte_needs_flush
+#endif
+
+#ifndef huge_pmd_needs_flush
+static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
+{
+	return __pte_flags_need_flush(pmd_val(oldpmd), pmd_val(newpmd));
+}
+#define huge_pmd_needs_flush huge_pmd_needs_flush
+#endif
+
 extern bool tlbie_capable;
 extern bool tlbie_enabled;
 
-- 
2.37.2

