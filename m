Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EEE1F350D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:39:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h27Q735rzDqHq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:39:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LzUvWhso; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1Pq6nddzDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:06:39 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id i12so995681pju.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 00:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGbSgTT6emfk+yKkoSS1OONFZ6zUUnEJvZ4/CyZkamM=;
 b=LzUvWhso9EPXgzBvRtmpjRviHG9utMvg+SIJ5NMMlAIbAGKXCBmkpMjSH+iDSlsKlX
 LdM7fN7Fn/AsTV3vAQIltV7avX4Q4oCj11Y3fe8mC3kOIvA81LAwezPU4WFqlazQQInO
 U+NqOATVdOjLl/x0ykz/n//beoqlZPGy3P4znH+3b4Xw1BecJsIwC4+f97uaEnfpZIVN
 tnbQB/CuDT4MnogigvHy7TDDGqo+Vhb6aM2wFm4yy9LSji2a8aiSYDInVPra4uqRb0kT
 p0WOHi9pd0evAqQiVjw2ua8Gefa/9DCfdpfAU8Q/3OR6MoHOxGX3NxRQxwjOSSTSJ91w
 NcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGbSgTT6emfk+yKkoSS1OONFZ6zUUnEJvZ4/CyZkamM=;
 b=uPzz0cQ8ptydiWPG8h3D/GzMVK/yxr/L3ooKi5WADMzK/LA2wwgV9s+q6M8rPLbAwq
 fUMBUA2G/ImdhGhmyFFEM3eV/t5WLZlUKSAAri8A1pI4x8+AtAME3vIPkSmOZ1vHLLMW
 uN28rKjerFPisR6jtO4dxaaBHsqM4Jk6s5FQ/bvVPfw1yBSr1U3mhzz9bFpJoIFePu+p
 yDb3bbU4ORVLPhdLR1KdhrS1UpdyvtqZEHFblTHvL8A8iL/2V9mi0ecnzCUyjcg0QNIe
 I0vLkYf1n6ZPYCpwHrfMt2fiou02VaIxQhu2DYRgi+FE2Xu9o+E2EB0pz0mCroP18TZj
 +42Q==
X-Gm-Message-State: AOAM530yIDbEf9/PUs+zmtBiUsj5Dr2WY9pcxmybfiC4vrEK0Yujeeb3
 94yGN80/wIYXeDn7puwcnxvufh91lqg=
X-Google-Smtp-Source: ABdhPJy60gHyljKDVOC5QFB3AwSphhaKfqniD0xXt/jt+yS/sUEM7FoU05kvhQavLhH7CPomwTK29Q==
X-Received: by 2002:a17:90b:e8f:: with SMTP id
 fv15mr3417141pjb.47.1591686396553; 
 Tue, 09 Jun 2020 00:06:36 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id 9sm1545615pju.1.2020.06.09.00.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 00:06:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/7] powerpc/security: Allow for processors that flush the
 link stack using the special bcctr
Date: Tue,  9 Jun 2020 17:06:09 +1000
Message-Id: <20200609070610.846703-7-npiggin@gmail.com>
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

