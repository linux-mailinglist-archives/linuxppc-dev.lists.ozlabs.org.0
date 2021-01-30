Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 781FE30959F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 14:56:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSbNX3GwYzDrp6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 00:56:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P5edLDmE; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZLZ6b0szDrVV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:09:58 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id l18so7825531pji.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YThq0+tj5Xq3TBJJj6IoR+O9eLTtgrUfwujJIu+gsQM=;
 b=P5edLDmEKkrxVDxjNNwbnSZ74a6OijeTEtZ90f5mWfsN20jW0vZsLRib3nNKcmLNtn
 cYDt0JjrdMwftrX9cA6re1Ezgm1zw/5O092N4pxupCcd+PFYI55N0BbArZr//vSXhYIZ
 JgXH8aaTTWqwOsYukbYYY9jIPTDSCmgsIl02Auc6KoxqB5H+2iHkniqH6CFCwXlC3bhi
 Ix1AHJV09EsznX+3ruk0AaDfLf3Cicbc5htlFuLflQ2n1N/cW8MEoOda/r0jWAsW3LY9
 qjS79y/8dZQPHrAZWmKZhuTmqgcnn4COzQchm/m05cUReBKEkoqaYz+zZzOrbi4saAVG
 UbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YThq0+tj5Xq3TBJJj6IoR+O9eLTtgrUfwujJIu+gsQM=;
 b=G9DAMEKfN7cC+RujS/LKfWBkgCQn0Zy+vSDzzsBjCA7+VDVh2aDsYfnxMhorEzvJTK
 6r/2JTOlDzBORFWsbJwB5TozOWYaPNyl69AQ6IDkccLyYvJhgXA/5I+kmW0CCwUp/OSE
 A/uoTMORN0KPHOPNpEAc8ypkZqAaKP8UPxzBTq0/mBI9RkkUOhthiXXzVSKPHyuaRPAg
 G0oEoGYfXFhiVOzFT2NEweA2L5sB+bzZISMNs4M0dR9DJMJK3Lt7pgbGN/PpAKgM51qB
 eE/eVsQh9oQ6Snj0PvRGnEsUKPofH3ndRlYwg7VV5t7VpSQPTRQ6Czyxxo3ULPpC09uV
 X2+Q==
X-Gm-Message-State: AOAM532qyNJDRWXpGwAl1Rd0Vke/rJp90CEJZaZ4Y41B2DMqNavPAcSF
 zII8/icNgTP/jDdjXyhT7tBcz20rs+0=
X-Google-Smtp-Source: ABdhPJxT8pjRu+CbVz+GjeYa59AVzH6MB0LWUq9JP5xASgp2FVUO5AFyjelRq85vw7NjdvG57BFptQ==
X-Received: by 2002:a17:90b:1a87:: with SMTP id
 ng7mr9200412pjb.211.1612012195601; 
 Sat, 30 Jan 2021 05:09:55 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:09:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 15/42] powerpc/64s: split do_hash_fault
Date: Sat, 30 Jan 2021 23:08:25 +1000
Message-Id: <20210130130852.2952424-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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

