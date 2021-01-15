Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 132632F81EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:17:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHSXt326hzDqBd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:17:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VZf7LCFC; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRyd3JVtzDsj5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:05 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id y8so4991257plp.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YThq0+tj5Xq3TBJJj6IoR+O9eLTtgrUfwujJIu+gsQM=;
 b=VZf7LCFCbn+o0nCK+Wu1CFBJZxw3qqTcoAbIopW9AtNSHA3E5jeWW6umJzjRjWM/nS
 yeQLiO4Ouy4Om0zIi6BfuvVwS3NdHaJ4orFOo3AeaCxTQsvUBiI87SZHk8K8/VaEWgGV
 hxluv37CI5eAIjSjaLaMl+PlD9xJFU56O03A7Y/zRdj9vWlYZ27drgyARyw0M3jWMN/3
 nEFl3V6QKHr2+K/Zy6PgYU9o1UBCjsGUIlS+S0u/ALUJbpW3x7Y7B8AXUHiJjzOL+zQZ
 oxx0kOSo7tlwIMQ1Yo2ZqCIiXIwkDljG2AnNAunLLVirbohOBwpS6D3Wlx1Tfw/aauWp
 JS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YThq0+tj5Xq3TBJJj6IoR+O9eLTtgrUfwujJIu+gsQM=;
 b=UDfxDz453CKRMcSA0mmvXV6k3CcBEEtfjTdoQvnVQdkTdD9jG4ns2BbscbbRD2JF6B
 MlxXcxotwg2bxWxuqkvQQSpT+MEx7AKUXB4n34Ac+SNcEuz03O9x3TbLE6A61EvgmeEp
 /iciYhCrLsXMrCwanft80wZ00MsIgLPp/ezvfCk2aVctWm1P4XZpWy9+Axvg8p/7gXce
 IxLqFmwNsyfjxTNnWqqiAzKxwRzz44J/9WN2cKx8nOkiNemkAZQoOdT9gzmAy9Inr1F7
 wCIa0OcKRZ7KMtaV9wUrgZr1KZZMdPMtPIWhUAnhVg8N8+utzjT98pVF+koOaMxrjtSh
 UC5w==
X-Gm-Message-State: AOAM533rcN5M5cQCPI7B2gKJG2ANRQKk16I1Cw0EbYT1CoAWGzvwem5x
 T0s1iB1o4O7L2IeuKiZxyWd/YQ5gcMY=
X-Google-Smtp-Source: ABdhPJymUavJ8+RriSI/UmUijg4WcdHIfiQ3lEA3imLRMfhOvJ3j5FqxV8UX34JuqnJKqbn9mCoQrw==
X-Received: by 2002:a17:902:6b43:b029:db:c7fc:82f3 with SMTP id
 g3-20020a1709026b43b02900dbc7fc82f3mr13774491plt.74.1610729462242; 
 Fri, 15 Jan 2021 08:51:02 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 10/39] powerpc/64s: split do_hash_fault
Date: Sat, 16 Jan 2021 02:49:43 +1000
Message-Id: <20210115165012.1260253-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

This is required for subsequent interrupt wrapper implementation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 56 ++++++++++++++++-----------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1a270cc37d97..d7d3a80a51d4 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1512,7 +1512,7 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-long do_hash_fault(struct pt_regs *regs)
+static long __do_hash_fault(struct pt_regs *regs)
 {
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
@@ -1522,27 +1522,6 @@ long do_hash_fault(struct pt_regs *regs)
 	unsigned int region_id;
 	long err;
 
-	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT)))
-		goto page_fault;
-
-	/*
-	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
-	 * don't call hash_page, just fail the fault. This is required to
-	 * prevent re-entrancy problems in the hash code, namely perf
-	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
-	 * hash fault. See the comment in hash_preload().
-	 *
-	 * We come here as a result of a DSI at a point where we don't want
-	 * to call hash_page, such as when we are accessing memory (possibly
-	 * user memory) inside a PMU interrupt that occurred while interrupts
-	 * were soft-disabled.  We want to invoke the exception handler for
-	 * the access, or panic if there isn't a handler.
-	 */
-	if (unlikely(in_nmi())) {
-		bad_page_fault(regs, SIGSEGV);
-		return 0;
-	}
-
 	region_id = get_region_id(ea);
 	if ((region_id == VMALLOC_REGION_ID) || (region_id == IO_REGION_ID))
 		mm = &init_mm;
@@ -1581,8 +1560,39 @@ long do_hash_fault(struct pt_regs *regs)
 			bad_page_fault(regs, SIGBUS);
 		}
 		err = 0;
+	}
+
+	return err;
+}
+
+long do_hash_fault(struct pt_regs *regs)
+{
+	unsigned long dsisr = regs->dsisr;
+	long err;
+
+	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT)))
+		goto page_fault;
+
+	/*
+	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
+	 * don't call hash_page, just fail the fault. This is required to
+	 * prevent re-entrancy problems in the hash code, namely perf
+	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
+	 * hash fault. See the comment in hash_preload().
+	 *
+	 * We come here as a result of a DSI at a point where we don't want
+	 * to call hash_page, such as when we are accessing memory (possibly
+	 * user memory) inside a PMU interrupt that occurred while interrupts
+	 * were soft-disabled.  We want to invoke the exception handler for
+	 * the access, or panic if there isn't a handler.
+	 */
+	if (unlikely(in_nmi())) {
+		bad_page_fault(regs, SIGSEGV);
+		return 0;
+	}
 
-	} else if (err) {
+	err = __do_hash_fault(regs);
+	if (err) {
 page_fault:
 		err = do_page_fault(regs);
 	}
-- 
2.23.0

