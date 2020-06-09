Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88D1F34EE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:35:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h23273s8zDqsj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:35:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Mda2+0yP; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1Pk0ncdzDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:06:34 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id m2so998375pjv.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 00:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nv1xnXQ09Sk5xdYZkDphhnbaxAVbk33kYYkkc6jvMSs=;
 b=Mda2+0yPnetTwe5bS9LTEJ7Wc0OkYhfVQaVco4tqE0MEie9pm04aKNPHQT3k4s3oxM
 HPXzf8scBiOExm6AClrqSDnVf+5neavZb8KCx7fV7wr+p/mWaGcDraq3HGt3OGvT80o2
 3Lkg/nfFYiMljVr8e2pv4q8cFm+mDkxTrvFuaWQofXtdDPkiJoX1slHFqQpOYYu9dZU8
 mf6NFfi1MIjHqe9VT2J19jl58XdX+luz6iUbmdcquAcshvq3ttZ/9eQ4Uy9sFVW4vQ0Y
 O/IaGclLK7ZiPgusUFED79yhUocsTDlnLTyyhjfPMeGiJucED7Ayaz+IobELYyqQoR5B
 wp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nv1xnXQ09Sk5xdYZkDphhnbaxAVbk33kYYkkc6jvMSs=;
 b=P7tGKudQZxBySMip6W/HD159kBR8Uzy08yDk9omunQwApzG81eQDlrHTWVfih7yJcA
 fKvuvBquJETA6plL6WbkXQh9fjV36HbUpVFbvc69cMi/F52C0Y3ZlkuIZjF4SG5a1YKy
 +rUqeiqwNz64qGG25M4xp8swgwWDGgkBcJNXi8mVV+SjGW3egNmPvJiiasbO5MrYro7m
 LErgTZmaKG4f7q9lkIrPuLDwEj77C6ohj6/o1kj9pg5+OcQE6K31ua8EKVNws6o5umn2
 LVKz7uIgBDnASx3pxMD19R7BE8P2XQFN9u6xONJ2iCqPF+8jEfWCRw/j6nrKgvPTYq8l
 BmfA==
X-Gm-Message-State: AOAM5313Lkk2dDNZM/UcykoixjRKzk3t260fkVFXVcguMEQd9rHkDJl9
 ckeHTGrHh+rGFH2ypOlUFtFmwVFVwCE=
X-Google-Smtp-Source: ABdhPJyGMUudq/K8LBs9o2iNF97/qHM06n2MuK6lM7+oFbcVTKN0fjdrhMTw1iX8lCGaSjbZfkcZ1w==
X-Received: by 2002:a17:90b:4d06:: with SMTP id
 mw6mr3450715pjb.190.1591686391461; 
 Tue, 09 Jun 2020 00:06:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id 9sm1545615pju.1.2020.06.09.00.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 00:06:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/7] powerpc/security: split branch cache flush toggle from
 code patching
Date: Tue,  9 Jun 2020 17:06:07 +1000
Message-Id: <20200609070610.846703-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200609070610.846703-1-npiggin@gmail.com>
References: <20200609070610.846703-1-npiggin@gmail.com>
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

