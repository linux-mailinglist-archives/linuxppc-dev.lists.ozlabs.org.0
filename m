Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C031F34AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:15:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1bb0JX1zDqTy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:15:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dLt+OcvG; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h0JN0cPNzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 16:16:52 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id p21so9819791pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jun 2020 23:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Oa+WR6zHDc4KFducblu1u/8O5kXvk2yTl9b+EY3rFY=;
 b=dLt+OcvG0BsesaJEI9fkNJW8KCYq46o4MtUkeTGOQQDV80LiV/w+K0cJpy4KSD/pmM
 n7kozvB0kFLhPymFTQruXAzX/t79MMIfBKz2fkFW4p1+C/jQTwoKxZG5EPs2+zbnlB9K
 25DmVawhfKEzYhHBk8CFF48oUqTuerDJFAYCp43+9pull805H0UWYF6X+t/oXvSDV/k2
 v/D+7FO4Uco8YW7Oes0jOCqUjnkZShcDGhHSyi9tUkWXzP3S21mxbLl4TL93niCEAnIS
 YVvrVRFQGCmUoIYdgsTIdfCmEcesGXtM5BsNDNRxJNm9iLKe++iFzsHULxdl0oIZ6g0K
 7Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Oa+WR6zHDc4KFducblu1u/8O5kXvk2yTl9b+EY3rFY=;
 b=t3YDfn+OpS7of2CZm1a0z+/unRM1K3N59uFB0puCuxKpadQuxRvYUREbDkR3HONSdY
 J0iC1DZ5+u0wtuzp+8kKayy0PeHzJGY8ctB5pUE84D9ityWGV5Nyj4+YBeYFbJNFOiXE
 eWl8o3H/uKE2nxkQZGilRaNjqiwD3anuEKie5OkwIlFyq0mWvjFbFVaP5VBAxE1U0MqH
 /Qe2nkrOPiqLE8MRDymP1MpdxogHTigGM49kqoC2KibW380IDTAn7Hp0OL3X10vbR0mX
 pEdSKuil347sIbVkN64HLX3cJ5CGMj+8a23bq8bWLRqW13PSUzmO802l7ektcp3FHFvm
 4+uw==
X-Gm-Message-State: AOAM531AtaiMV4zpu3A+MvckQnU4YRfCg7dVrVW0Zh4pgqhLCCZSjXFA
 2CJOVcTWnV7+sueVjgj0WKk=
X-Google-Smtp-Source: ABdhPJweoG11SKkF27ifmX9RRnl9Hy38TVjKFzQ1+X0+VV7SAA0CAzWbhK3u+0fsI97+ebnT3/Pp0g==
X-Received: by 2002:a63:e550:: with SMTP id z16mr22299297pgj.92.1591683410082; 
 Mon, 08 Jun 2020 23:16:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id k12sm7567981pgm.11.2020.06.08.23.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 23:16:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [PATCH 3/7] powerpc/security: make display of branch cache flush more
 consistent
Date: Tue,  9 Jun 2020 16:16:27 +1000
Message-Id: <20200609061631.844390-4-npiggin@gmail.com>
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

Make the count-cache and link-stack messages look the same

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/security.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 28f4cb062f69..659ef6a92bb9 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -430,7 +430,7 @@ device_initcall(stf_barrier_debugfs_init);
 static void no_count_cache_flush(void)
 {
 	count_cache_flush_type = BRANCH_CACHE_FLUSH_NONE;
-	pr_info("count-cache-flush: software flush disabled.\n");
+	pr_info("count-cache-flush: flush disabled.\n");
 }
 
 static void toggle_branch_cache_flush(bool enable)
@@ -446,7 +446,7 @@ static void toggle_branch_cache_flush(bool enable)
 		patch_instruction_site(&patch__call_kvm_flush_link_stack,
 				       ppc_inst(PPC_INST_NOP));
 #endif
-		pr_info("link-stack-flush: software flush disabled.\n");
+		pr_info("link-stack-flush: flush disabled.\n");
 		link_stack_flush_type = BRANCH_CACHE_FLUSH_NONE;
 		no_count_cache_flush();
 		return;
@@ -475,13 +475,13 @@ static void toggle_branch_cache_flush(bool enable)
 
 	if (!security_ftr_enabled(SEC_FTR_BCCTR_FLUSH_ASSIST)) {
 		count_cache_flush_type = BRANCH_CACHE_FLUSH_SW;
-		pr_info("count-cache-flush: full software flush sequence enabled.\n");
+		pr_info("count-cache-flush: software flush enabled.\n");
 		return;
 	}
 
 	patch_instruction_site(&patch__flush_count_cache_return, ppc_inst(PPC_INST_BLR));
 	count_cache_flush_type = BRANCH_CACHE_FLUSH_HW;
-	pr_info("count-cache-flush: hardware assisted flush sequence enabled\n");
+	pr_info("count-cache-flush: hardware flush enabled.\n");
 }
 
 void setup_count_cache_flush(void)
-- 
2.23.0

