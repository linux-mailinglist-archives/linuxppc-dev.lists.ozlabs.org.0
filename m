Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6025A9551
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 13:04:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJJ8W4DwGz2xxx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:04:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E/h6gMx0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=E/h6gMx0;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJJ7s00yjz2xJB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 21:03:50 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id z187so17112973pfb.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=HTZLdr7U8DvhvTwmyrHj97AKaaH3aLBKGPWr2Mu1m+g=;
        b=E/h6gMx0/RqMKYQhobh5A+HF/bd5GWPcfnxngpEH16yl9ekf71iQUKkSv/SdKsBSx9
         akYDvQu2Vy/8rSlq2TikkCWvjvCFX4YoeWhQEBV8RrFUiz/CCtcDP6FUcC1eZlL6z91h
         8j5eWkkdMtpnexhnmRanW8YoOyn76L1EjjNIZUDfT5cCfAFTYVqB0SgOcx2wI1GSvq8w
         xYAdkmTP+BPrcSoLUHMdL3qtnByUzfFzmnD5PjWUrCoVZ1ioNb4cJFnWWnUAjgZ7DIay
         JbeiHdaInPW2JjLpfbAD72gj3lOP/oe2NSIPaTUBNc3Wv5vkRPa43iXpRDWIRYk8R2Op
         94FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=HTZLdr7U8DvhvTwmyrHj97AKaaH3aLBKGPWr2Mu1m+g=;
        b=fLIG8uGG0ugJKZjah5wTW27M/r+hkLfQyDfIdHxwMSMysbOvPSHR9fT6lU6QQ4Uhfn
         88V19Uv7sK4I7i0ZugGweDVKIzHyG+7DiGA9EGuiui18lAJOiOM6UeXUCgTfSph7p4Jj
         HOo27QQKI0qvQzc/YfmMlrETK6WQnbKsjs8dy8Dqmq91COw3zKmhTkLok0B2rqfZAfPZ
         JXOpwm/2GRp2tH550GcCXLQVG5SPG2zEKgwXi8SKnIxC05BFhyXqfmccUglaL7R4L3Gs
         +IFSn1udbIHOyeith/pXbZSFKkePCI7/CmB0YMVv1zDuqFXPV4Tm/58xru7b71g4XqCw
         e8Mg==
X-Gm-Message-State: ACgBeo02ZKmcM3D5+bsMQDz0sH/16M9Go2U/2stJB5JXHS6nDclEtWCa
	/otIn0TrADu+Kmvqik3ice2rFss7WEw58A==
X-Google-Smtp-Source: AA6agR46PPaSlIOr9vGXTTkMzBPBm+HwQbMbW6G+D86wDSZfpuVZGVUngg8DHJIguOT7Pmx6vOMKCg==
X-Received: by 2002:a63:5f4c:0:b0:42b:f6bd:47dd with SMTP id t73-20020a635f4c000000b0042bf6bd47ddmr17245148pgb.578.1662030225104;
        Thu, 01 Sep 2022 04:03:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id j18-20020a635952000000b0042b5b036da4sm4972523pgm.68.2022.09.01.04.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 04:03:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s: add pte_needs_flush and huge_pmd_needs_flush
Date: Thu,  1 Sep 2022 21:03:34 +1000
Message-Id: <20220901110334.1618913-1-npiggin@gmail.com>
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
Changes in v2:
- Change VM_BUG_ON to VM_WARN_ON (Christophe)
- Remove ifndef guard around helper defines (Christophe)
- Adjust comments slightly.

 arch/powerpc/include/asm/book3s/64/pgtable.h  |  3 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 56 +++++++++++++++++++
 arch/powerpc/mm/book3s64/hash_tlb.c           |  1 +
 arch/powerpc/mm/book3s64/pgtable.c            |  1 +
 4 files changed, 61 insertions(+)

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
index d2e80f178b6d..66b0de0ce601 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -143,6 +143,62 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 		flush_tlb_page(vma, address);
 }
 
+static inline bool __pte_flags_need_flush(unsigned long oldval,
+					  unsigned long newval)
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
+	 * We do not expect kernel mappings or non-PTEs or not-present PTEs.
+	 */
+	VM_WARN_ON_ONCE(oldval & _PAGE_PRIVILEGED);
+	VM_WARN_ON_ONCE(newval & _PAGE_PRIVILEGED);
+	VM_WARN_ON_ONCE(!(oldval & _PAGE_PTE));
+	VM_WARN_ON_ONCE(!(newval & _PAGE_PTE));
+	VM_WARN_ON_ONCE(!(oldval & _PAGE_PRESENT));
+	VM_WARN_ON_ONCE(!(newval & _PAGE_PRESENT));
+
+	/*
+	*  Must flush on any change except READ, WRITE, EXEC, DIRTY, ACCESSED.
+	*
+	 * In theory, some changed software bits could be tolerated, in
+	 * practice those should rarely if ever matter.
+	 */
+
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
+static inline bool pte_needs_flush(pte_t oldpte, pte_t newpte)
+{
+	return __pte_flags_need_flush(pte_val(oldpte), pte_val(newpte));
+}
+#define pte_needs_flush pte_needs_flush
+
+static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
+{
+	return __pte_flags_need_flush(pmd_val(oldpmd), pmd_val(newpmd));
+}
+#define huge_pmd_needs_flush huge_pmd_needs_flush
+
 extern bool tlbie_capable;
 extern bool tlbie_enabled;
 
-- 
2.37.2

