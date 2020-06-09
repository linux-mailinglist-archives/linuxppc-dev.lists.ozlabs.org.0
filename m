Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B3B1F34E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:33:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h2155Dj2zDqS3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:33:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BRRAHfIN; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1Pg4Bb3zDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:06:31 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y18so7673520plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 00:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8Oa+WR6zHDc4KFducblu1u/8O5kXvk2yTl9b+EY3rFY=;
 b=BRRAHfINpyLS2krPS1uo9YsiSzFjF+ThARs+M9KWRHEH8r/dK1AQOxQXCgMBiIfT3I
 IyQyg1xfhhW15DDz7nfoxymdGKBpn1flaravWlQw+ClZNxoy+JfcNoTqpigHllgVTnzF
 63P/Do+zwQ1hvCQEn5PhAwy/BIUrHmflO3AHsxChwgolYbtvFiTQ+TbVvKj6IZjvJe2o
 na06SYnrPXgaAzD/m3Gs1qMBp6RQNSZ2/VPZMGaWhkeEyVQvK1U6jatV7q8gaGow3NTB
 I22ko34inFEGIqTfRu5z+D1KsG660MauWDIiJZRvlMuv4QiGp3KMYdUFWIm0jgE1eSDt
 ZnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Oa+WR6zHDc4KFducblu1u/8O5kXvk2yTl9b+EY3rFY=;
 b=lq2pzrobih+coGMFA4WgMYXDkhXCqUgEx2rd/0ODxXbtZA2RII792y6BRYn9MKRZtt
 JOk9MAyrKK5SXUw6f207fsIbfWh9fG8dmyP9INkXfXcJDpgFjxm6PrGkssxZ0ktZfnhG
 McUVWz8B6KfiAM5wyWN0weYlxEfKkImmmx/hX3OPHdmzFI/AoqMqZo8fouPCmvXlAjU7
 +p0r5G5lq4nlpGKuweEg4Mu1hkImH5/fPGzPGmW+8BjvySe4slz21W4jayejHfcWaAXH
 THReNyTCw/OPF3CLO9o6cIBsOSJIFoZt3jyXzPC/XfpQXzQxyIRewud6v5mRvHZ0O2ml
 uoHA==
X-Gm-Message-State: AOAM533tuoLRle0XfSWiEpEbohedZ/7SSfqxLtpbxyqyrnhcxeenFpDW
 LnmROdhKGwXCuMv+0V6a4/LR/Kl8y7o=
X-Google-Smtp-Source: ABdhPJyhLjYTbqBcSd8CoUgPWKfN64YeVBeGWyL4MVQ19UUFU6xZrRTxfErGZN3SfmYVROJBqm4+jA==
X-Received: by 2002:a17:90a:c7cb:: with SMTP id
 gf11mr3248572pjb.98.1591686388895; 
 Tue, 09 Jun 2020 00:06:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id 9sm1545615pju.1.2020.06.09.00.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 00:06:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/7] powerpc/security: make display of branch cache flush more
 consistent
Date: Tue,  9 Jun 2020 17:06:06 +1000
Message-Id: <20200609070610.846703-4-npiggin@gmail.com>
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

