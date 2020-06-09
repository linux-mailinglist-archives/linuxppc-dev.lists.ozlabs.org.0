Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F26481F34C1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:20:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1k92ZwZzDqNH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WvhbQ90o; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0JW5RGhzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:16:59 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id ga6so943214pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 23:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGbSgTT6emfk+yKkoSS1OONFZ6zUUnEJvZ4/CyZkamM=;
 b=WvhbQ90oyTk8OGCmC6Rtk8qZiA6GP2qCBCYxibFHaM83fC06Ej6MioAM0dgCTkCIjo
 ZY73TclqIguBla6PJYUrQV7ryUHCB/jbfbOYnXDjvPOx7hOS5CN5wvnI71w2FC/Z1dNX
 fv2FRpqlKr1FtFiT0jHahZFfyu6w93+UoSPHAQcrp34cw3nKqxanEINGJV1+Q8DYKZNl
 2FbkA4aHr92PZtQrbIGqJnzSSmmIaFhKT1FH74aPglUTHVtlWhPwjK2uqUp0CtcV7zgD
 uZcfL8Ixia4za4zkRY59xtR/YN/hjBFOnQMWD7Fz1ZQ+a3SI/5T+9EQawE8nsGGgXZ5V
 PVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGbSgTT6emfk+yKkoSS1OONFZ6zUUnEJvZ4/CyZkamM=;
 b=VsR3EEndSWGCyVjx/bwvDfDHK48/R6b5CgPcdSTE9CI1iVodvjufFeVHYcGwsKHS9A
 qNTy1ZD7nM/DDLmObYlPAMZg2Brm6y+bUnWa/KGcOBtJ/8QJxT6DU7/NnGNzJ3Io9AEX
 Uh7TMyp0ydOZlJkqm9iYPq6g4vhBqFcRQWCnnh+fj3tmdNKJTiBZiwNEYTwra3K8nP/F
 E7YwTLKh9ZKhDAUOgDIlWEHxyJLwkjJAVtxPddxsdwMmxTFChpukf3ITKIzt4FSZBUeT
 GFi/f2q2BZ648ZZc95n+O3iKyV0Jej2qeY1aVUUoOa2Ixo8Iah6QCpNWoGdRZq14KIc+
 HlbQ==
X-Gm-Message-State: AOAM533V2b8uHolx8CL5Pc4cgu6meI1vYskdR+qJaLjGm7reONtPAL2/
 dNdvzxtaNmHNhwxWhKrX9bA=
X-Google-Smtp-Source: ABdhPJyCfPIUSAxuWDPOgyons4apGfNx8qvRbvpeS4nGoVhuQRWnp/TNGUKawloJOaD/e65oc3KO8A==
X-Received: by 2002:a17:902:b7c9:: with SMTP id
 v9mr1986498plz.34.1591683417159; 
 Mon, 08 Jun 2020 23:16:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id k12sm7567981pgm.11.2020.06.08.23.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 23:16:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 6/7] powerpc/security: Allow for processors that flush the
 link stack using the special bcctr
Date: Tue,  9 Jun 2020 16:16:30 +1000
Message-Id: <20200609061631.844390-7-npiggin@gmail.com>
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

If both count cache and link stack are to be flushed, and can be flushed
with the special bcctr, patch that in directly to the flush/branch nop
site.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/security_features.h |  2 ++
 arch/powerpc/kernel/security.c               | 27 ++++++++++++++------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerpc/include/asm/security_features.h
index 7c05e95a5c44..fbb8fa32150f 100644
--- a/arch/powerpc/include/asm/security_features.h
+++ b/arch/powerpc/include/asm/security_features.h
@@ -63,6 +63,8 @@ static inline bool security_ftr_enabled(u64 feature)
 // bcctr 2,0,0 triggers a hardware assisted count cache flush
 #define SEC_FTR_BCCTR_FLUSH_ASSIST	0x0000000000000800ull
 
+// bcctr 2,0,0 triggers a hardware assisted link stack flush
+#define SEC_FTR_BCCTR_LINK_FLUSH_ASSIST	0x0000000000002000ull
 
 // Features indicating need for Spectre/Meltdown mitigations
 
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 2a413af21124..6ad5c753d47c 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -219,24 +219,25 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr, c
 		if (ccd)
 			seq_buf_printf(&s, "Indirect branch cache disabled");
 
-		if (link_stack_flush_type == BRANCH_CACHE_FLUSH_SW)
-			seq_buf_printf(&s, ", Software link stack flush");
-
 	} else if (count_cache_flush_type != BRANCH_CACHE_FLUSH_NONE) {
 		seq_buf_printf(&s, "Mitigation: Software count cache flush");
 
 		if (count_cache_flush_type == BRANCH_CACHE_FLUSH_HW)
 			seq_buf_printf(&s, " (hardware accelerated)");
 
-		if (link_stack_flush_type == BRANCH_CACHE_FLUSH_SW)
-			seq_buf_printf(&s, ", Software link stack flush");
-
 	} else if (btb_flush_enabled) {
 		seq_buf_printf(&s, "Mitigation: Branch predictor state flush");
 	} else {
 		seq_buf_printf(&s, "Vulnerable");
 	}
 
+	if (bcs || ccd || count_cache_flush_type != BRANCH_CACHE_FLUSH_NONE) {
+		if (link_stack_flush_type != BRANCH_CACHE_FLUSH_NONE)
+			seq_buf_printf(&s, ", Software link stack flush");
+		if (link_stack_flush_type == BRANCH_CACHE_FLUSH_HW)
+			seq_buf_printf(&s, " (hardware accelerated)");
+	}
+
 	seq_buf_printf(&s, "\n");
 
 	return s.len;
@@ -435,6 +436,7 @@ static void update_branch_cache_flush(void)
 		patch_instruction_site(&patch__call_kvm_flush_link_stack,
 				       ppc_inst(PPC_INST_NOP));
 	} else {
+		// Could use HW flush, but that could also flush count cache
 		patch_branch_site(&patch__call_kvm_flush_link_stack,
 				  (u64)&kvm_flush_link_stack, BRANCH_SET_LINK);
 	}
@@ -445,6 +447,10 @@ static void update_branch_cache_flush(void)
 	    link_stack_flush_type == BRANCH_CACHE_FLUSH_NONE) {
 		patch_instruction_site(&patch__call_flush_branch_caches,
 				       ppc_inst(PPC_INST_NOP));
+	} else if (count_cache_flush_type == BRANCH_CACHE_FLUSH_HW &&
+		   link_stack_flush_type == BRANCH_CACHE_FLUSH_HW) {
+		patch_instruction_site(&patch__call_flush_branch_caches,
+				       ppc_inst(PPC_INST_BCCTR_FLUSH));
 	} else {
 		patch_branch_site(&patch__call_flush_branch_caches,
 				  (u64)&flush_branch_caches, BRANCH_SET_LINK);
@@ -485,8 +491,13 @@ static void toggle_branch_cache_flush(bool enable)
 			pr_info("link-stack-flush: flush disabled.\n");
 		}
 	} else {
-		link_stack_flush_type = BRANCH_CACHE_FLUSH_SW;
-		pr_info("link-stack-flush: software flush enabled.\n");
+		if (security_ftr_enabled(SEC_FTR_BCCTR_LINK_FLUSH_ASSIST)) {
+			link_stack_flush_type = BRANCH_CACHE_FLUSH_HW;
+			pr_info("link-stack-flush: hardware flush enabled.\n");
+		} else {
+			link_stack_flush_type = BRANCH_CACHE_FLUSH_SW;
+			pr_info("link-stack-flush: software flush enabled.\n");
+		}
 	}
 
 	update_branch_cache_flush();
-- 
2.23.0

