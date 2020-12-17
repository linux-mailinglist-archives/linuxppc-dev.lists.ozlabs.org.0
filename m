Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA912DD293
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 15:02:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxYbr1pVVzDqfd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 01:02:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AWquFx23; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxYGl56dDzDqVS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Dec 2020 00:47:59 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id r4so15164763pls.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9WSpcjgIBdfE8rFP3qDLJO/GdvXShlYsy4dvfCyWlSQ=;
 b=AWquFx23emfLz4cs29iybHaJjBgr67mA7qRHIABJNNpoO28WkTS1yW3Sn6MdAJxN40
 xCMN91pvGlPGOXhMAhty9VW9PUeaAiz5FIavDHgkSUCqSBDbwL8HrG5v+EHXughRvX+v
 eUx8UXah3r2gFoddkvZuAXIbrUrGbCn/owVUWbIvFnPXVrBgfaGfvPb/mb5Mda1Yj3dc
 odBoUrjuuvnNiLIQrJyfcdhYxJqLAAty8hJ9Ociq/9YNjUCT7HSIHPdG0iWXegMw0yTN
 yRs5c/HObkV1kbVn5eN24J7sEHU+8g4UCa0vcW4aV4hPgoPP8bOTdmVCx7u4kJmq+ym4
 HrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9WSpcjgIBdfE8rFP3qDLJO/GdvXShlYsy4dvfCyWlSQ=;
 b=YQbpy3zLHzHz3PcrDVpQatvzTjOikbiRGrReUESJkYGMnUv7DQ34LBkJQVLsBz2ZFX
 2MN2lMoMnQGb0gTgr4j9Q95GyYdK8RklYbC2sBDM2nnaB23dwV2QDpMPZnAlbHp/lcJP
 SKe4WfVOnxsKsbxCb/AveVNpG4dVbq3sUhZrYf6hOUC8HzmG+tw6Y36kqiP+ngeXTDFk
 LYBVy3VOACoENwsDtMXOX6GpNdWcWCeRYX+QWkMUvN4hjwvKjPbgxFiVzTdrJkJlWCr5
 dY51MTrpttVzhll3a7nOQB1o0OfdeFPYG46KuHhsw0qO/nSkTvMe9JFdKiYL30HKOpNC
 +D1A==
X-Gm-Message-State: AOAM530ko4OzHmCwnHjAHJO6Gerh0jBUs3yWwIiNJNd71/FgHEHbJFXq
 IKSX7Ihu+rO+m0y1/LMUkNpBz6ORTXMw1g==
X-Google-Smtp-Source: ABdhPJyFeAoFlY59mRkerW8L0NcD2LAr+Y992Kajw6x45v8KoT0SRNLLWeVjJ+MKeRPsG96VDrzyHw==
X-Received: by 2002:a17:902:b192:b029:d7:ca4a:4ec1 with SMTP id
 s18-20020a170902b192b02900d7ca4a4ec1mr29419363plr.76.1608212877194; 
 Thu, 17 Dec 2020 05:47:57 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id bf3sm5486112pjb.45.2020.12.17.05.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:47:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 7/7] powerpc/64s: Implement ptep_clear_flush_young that does
 not flush TLBs
Date: Thu, 17 Dec 2020 23:47:31 +1000
Message-Id: <20201217134731.488135-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201217134731.488135-1-npiggin@gmail.com>
References: <20201217134731.488135-1-npiggin@gmail.com>
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

Similarly to the x86 commit b13b1d2d8692 ("x86/mm: In the PTE swapout
page reclaim case clear the accessed bit instead of flushing the TLB"),
implement ptep_clear_flush_young that does not actually flush the TLB
in the case the referenced bit is cleared.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 23 +++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index cd3feeac6e87..751f98a40aca 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -388,11 +388,28 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 #define ptep_test_and_clear_young(__vma, __addr, __ptep)	\
 ({								\
-	int __r;						\
-	__r = __ptep_test_and_clear_young((__vma)->vm_mm, __addr, __ptep); \
-	__r;							\
+	__ptep_test_and_clear_young((__vma)->vm_mm, __addr, __ptep); \
 })
 
+/*
+ * On Book3S CPUs, clearing the accessed bit without a TLB flush
+ * doesn't cause data corruption. [ It could cause incorrect
+ * page aging and the (mistaken) reclaim of hot pages, but the
+ * chance of that should be relatively low. ]
+ *
+ * So as a performance optimization don't flush the TLB when
+ * clearing the accessed bit, it will eventually be flushed by
+ * a context switch or a VM operation anyway. [ In the rare
+ * event of it not getting flushed for a long time the delay
+ * shouldn't really matter because there's no real memory
+ * pressure for swapout to react to. ]
+ */
+#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
+#define ptep_clear_flush_young ptep_test_and_clear_young
+
+#define __HAVE_ARCH_PMDP_CLEAR_YOUNG_FLUSH
+#define pmdp_clear_flush_young pmdp_test_and_clear_young
+
 static inline int __pte_write(pte_t pte)
 {
 	return !!(pte_raw(pte) & cpu_to_be64(_PAGE_WRITE));
-- 
2.23.0

