Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4FD1F34B4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:17:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1dj16wczDqjj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:16:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ubqsvgxa; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0JR0GjtzDqgZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:16:54 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id j1so9453647pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 23:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nv1xnXQ09Sk5xdYZkDphhnbaxAVbk33kYYkkc6jvMSs=;
 b=ubqsvgxalaftDUQb8TQkZvUIY92VTlRJ8XiACMRcJ8Pqih9J9RDjUkvmpbk85A+Eiz
 rMZRYJ/0gHlwMzX9qZZF73r3GUrW1K8Ef+0INuQs+9AkTyqEH+7k75wVsU4bYlAGxQtI
 sMNisCJqBV5MUlrgfJ+9tIGj35BBlbf9hklHHpJr9SLLqY2bxpVLeQfw0RdrWttRPJXV
 iqGukkClkANqYN0CU0EsORvqcRqldjFgM/EGyUxS6WBxlnjGbMiuZ9+9T29I+zg7Q708
 4r5KTfQaTbDCpd7N6wX7UP9HB3tuaBzrQ/H+VNcNx3YCIZZLCW5NMQUcvwoeMz6SymcM
 GT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nv1xnXQ09Sk5xdYZkDphhnbaxAVbk33kYYkkc6jvMSs=;
 b=s3wGTf3BemjED7j3DsZEpJBitZc7oLK8N2EWDeIcVhI7PMA/h3OiN81ioduguh9zf9
 rcNw2RRoxVRpXhp7OrPZcSO6QT5qLyt/U15mVZC2vNxX5Idt/7pGtkAh9bykAxlPeyn+
 6cTzCcQU34AXhQMc95Z1yG3oSGNXQVDhqdZ725w4g7j2faLJKoeR/F6cbgrkTAWCSaRi
 rZbEqDlUdrBUY7CnKsMupGyi5rEzaowcno11vJXsksg8S03Er2Una5MDdyZq4j60EuRu
 BDzcHwytsnA6s0e8v460JWn06ST6Kb5SMgKUoXFhoDj+Q7vnFQJ3IqlERw9NW3HIeWjB
 vRxg==
X-Gm-Message-State: AOAM533nRX/RhGMMO6pCx58hYt1TMnSq5WKOoMEY0yPV+ocJ4U2eh2pX
 hhnCKW23/FUMve1y8TYqu61NJBEZruY=
X-Google-Smtp-Source: ABdhPJxR9dUNW7K7oz8+Lwq84m8ajwuzD/J3j/RvN8qru2hiStozqWYTkkfvLTICqpqkehVIHhXwfg==
X-Received: by 2002:a65:41c8:: with SMTP id b8mr22296358pgq.265.1591683412413; 
 Mon, 08 Jun 2020 23:16:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id k12sm7567981pgm.11.2020.06.08.23.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 23:16:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 4/7] powerpc/security: split branch cache flush toggle from
 code patching
Date: Tue,  9 Jun 2020 16:16:28 +1000
Message-Id: <20200609061631.844390-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200609061631.844390-1-npiggin@gmail.com>
References: <20200609061631.844390-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Branch cache flushing code patching has inter-dependencies on both the
link stack and the count cache flushing state.

To make the code clearer and to separate the link stack and count
cache handling, split the "toggle" (setting up variables and printing
enable/disable) from the code patching.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/security.c | 94 ++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 659ef6a92bb9..2a413af21124 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -427,61 +427,69 @@ static __init int stf_barrier_debugfs_init(void)
 device_initcall(stf_barrier_debugfs_init);
 #endif /* CONFIG_DEBUG_FS */
 
-static void no_count_cache_flush(void)
+static void update_branch_cache_flush(void)
 {
-	count_cache_flush_type = BRANCH_CACHE_FLUSH_NONE;
-	pr_info("count-cache-flush: flush disabled.\n");
-}
-
-static void toggle_branch_cache_flush(bool enable)
-{
-	if (!security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE) &&
-	    !security_ftr_enabled(SEC_FTR_FLUSH_LINK_STACK))
-		enable = false;
-
-	if (!enable) {
-		patch_instruction_site(&patch__call_flush_branch_caches,
-				       ppc_inst(PPC_INST_NOP));
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	// This controls the branch from guest_exit_cont to kvm_flush_link_stack
+	if (link_stack_flush_type == BRANCH_CACHE_FLUSH_NONE) {
 		patch_instruction_site(&patch__call_kvm_flush_link_stack,
 				       ppc_inst(PPC_INST_NOP));
-#endif
-		pr_info("link-stack-flush: flush disabled.\n");
-		link_stack_flush_type = BRANCH_CACHE_FLUSH_NONE;
-		no_count_cache_flush();
-		return;
+	} else {
+		patch_branch_site(&patch__call_kvm_flush_link_stack,
+				  (u64)&kvm_flush_link_stack, BRANCH_SET_LINK);
 	}
-
-	// This enables the branch from _switch to flush_branch_caches
-	patch_branch_site(&patch__call_flush_branch_caches,
-			  (u64)&flush_branch_caches, BRANCH_SET_LINK);
-
-#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
-	// This enables the branch from guest_exit_cont to kvm_flush_link_stack
-	patch_branch_site(&patch__call_kvm_flush_link_stack,
-			  (u64)&kvm_flush_link_stack, BRANCH_SET_LINK);
 #endif
 
-	pr_info("link-stack-flush: software flush enabled.\n");
-	link_stack_flush_type = BRANCH_CACHE_FLUSH_SW;
+	// This controls the branch from _switch to flush_branch_caches
+	if (count_cache_flush_type == BRANCH_CACHE_FLUSH_NONE &&
+	    link_stack_flush_type == BRANCH_CACHE_FLUSH_NONE) {
+		patch_instruction_site(&patch__call_flush_branch_caches,
+				       ppc_inst(PPC_INST_NOP));
+	} else {
+		patch_branch_site(&patch__call_flush_branch_caches,
+				  (u64)&flush_branch_caches, BRANCH_SET_LINK);
+
+		// If we just need to flush the link stack, early return
+		if (count_cache_flush_type == BRANCH_CACHE_FLUSH_NONE) {
+			patch_instruction_site(&patch__flush_link_stack_return,
+					       ppc_inst(PPC_INST_BLR));
+
+		// If we have flush instruction, early return
+		} else if (count_cache_flush_type == BRANCH_CACHE_FLUSH_HW) {
+			patch_instruction_site(&patch__flush_count_cache_return,
+					       ppc_inst(PPC_INST_BLR));
+		}
+	}
+}
 
-	// If we just need to flush the link stack, patch an early return
-	if (!security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE)) {
-		patch_instruction_site(&patch__flush_link_stack_return,
-				       ppc_inst(PPC_INST_BLR));
-		no_count_cache_flush();
-		return;
+static void toggle_branch_cache_flush(bool enable)
+{
+	if (!enable || !security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE)) {
+		if (count_cache_flush_type != BRANCH_CACHE_FLUSH_NONE) {
+			count_cache_flush_type = BRANCH_CACHE_FLUSH_NONE;
+			pr_info("count-cache-flush: flush disabled.\n");
+		}
+	} else {
+		if (security_ftr_enabled(SEC_FTR_BCCTR_FLUSH_ASSIST)) {
+			count_cache_flush_type = BRANCH_CACHE_FLUSH_HW;
+			pr_info("count-cache-flush: hardware flush enabled.\n");
+		} else {
+			count_cache_flush_type = BRANCH_CACHE_FLUSH_SW;
+			pr_info("count-cache-flush: software flush enabled.\n");
+		}
 	}
 
-	if (!security_ftr_enabled(SEC_FTR_BCCTR_FLUSH_ASSIST)) {
-		count_cache_flush_type = BRANCH_CACHE_FLUSH_SW;
-		pr_info("count-cache-flush: software flush enabled.\n");
-		return;
+	if (!enable || !security_ftr_enabled(SEC_FTR_FLUSH_LINK_STACK)) {
+		if (link_stack_flush_type != BRANCH_CACHE_FLUSH_NONE) {
+			link_stack_flush_type = BRANCH_CACHE_FLUSH_NONE;
+			pr_info("link-stack-flush: flush disabled.\n");
+		}
+	} else {
+		link_stack_flush_type = BRANCH_CACHE_FLUSH_SW;
+		pr_info("link-stack-flush: software flush enabled.\n");
 	}
 
-	patch_instruction_site(&patch__flush_count_cache_return, ppc_inst(PPC_INST_BLR));
-	count_cache_flush_type = BRANCH_CACHE_FLUSH_HW;
-	pr_info("count-cache-flush: hardware flush enabled.\n");
+	update_branch_cache_flush();
 }
 
 void setup_count_cache_flush(void)
-- 
2.23.0

