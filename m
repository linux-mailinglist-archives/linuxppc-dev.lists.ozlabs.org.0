Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A462F1F34DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:32:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1z60W49zDqRt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:32:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kUILemYH; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1Pd0x80zDqgd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:06:28 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 185so9886553pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 00:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4IXEINXdNzTPGUhU9F4Y8RAOkt5tBRqM+udEagmeaI=;
 b=kUILemYH1BjQAx48mrwjciCRJPiq/QoDPwKXtimDoxpQ0SYwJ7mVsKQg4gYNzU9vDG
 GGcEaJLfz+XWPtgJ8nGz1+DDImXgFeda+7BzgwNrXF2Zb/nRgZQl/jZAhu57IVnOtNbr
 N8f8dE4IFvTxrFoCeoREgna/FURziWdy1QXFfRPRVUSp662gmF53teE8ay0ViB59+F5E
 PBI4q9yuIsX9MnuYMWmI1MVMcWDr/b2D8yYcuW8hmqA47oSxIpZjGVuomkdrO9HKrYst
 glStNARoHaCxagsRH0o0JYcY96rIyvHXekcLy7oEafVq+o/H0biZjWPqKaD8oMyy1qpR
 yLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4IXEINXdNzTPGUhU9F4Y8RAOkt5tBRqM+udEagmeaI=;
 b=qtlkf4FHl4OhNVXKilpFrRX/dVDA+N8kXZZUaax3tIJ3SBLfbi28AoPkl0jtk1ayZh
 TNiFbQksim3PzeJQ/+QCgaMJvpSIDuN+TmCJ23BQ32bzuzOIaVE67MjTJ9WmBVusQS2a
 Lu4dIXAIwrKnf1ORqZcLaoQdnfppU0sxB9S7CcPQTif5Rb5/S0vITF8BtA3wsHDJNP9/
 IBk26JWA061HLV8h6sCEfr9+WHY3orQWKdANl1q1Xy8DPQjMjWJl2mSdYVjz2hDfRKYe
 BC5/pGGNqtbUNOKDdxh9vmUQYIGOWMGflprklMm4oPhAegZQ5HhYA15Rr6gg0jluUxOQ
 xVJw==
X-Gm-Message-State: AOAM532Hmp9SaJWtUKNyb6CT8mUCdljJqrw36hEj7GfguRvo9agM2zpS
 0fhD1Tnzf5BrDorLfRJEpD/aH4ljeKI=
X-Google-Smtp-Source: ABdhPJzZe6rYzefJUDk6YUVZr2m923Wjce/0+VT5XTVRI5RHQpl/yiYtjp5EzXCc3k+wVArGoIGmtA==
X-Received: by 2002:a63:fd57:: with SMTP id m23mr24748296pgj.325.1591686386340; 
 Tue, 09 Jun 2020 00:06:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id 9sm1545615pju.1.2020.06.09.00.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 00:06:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/7] powerpc/security: change link stack flush state to the
 flush type enum
Date: Tue,  9 Jun 2020 17:06:05 +1000
Message-Id: <20200609070610.846703-3-npiggin@gmail.com>
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

Prepare to allow for hardware link stack flushing by using the
none/sw/hw type, same as the count cache state.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/security.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index df2a3eff950b..28f4cb062f69 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -27,7 +27,7 @@ enum branch_cache_flush_type {
 	BRANCH_CACHE_FLUSH_HW	= 0x4,
 };
 static enum branch_cache_flush_type count_cache_flush_type = BRANCH_CACHE_FLUSH_NONE;
-static bool link_stack_flush_enabled;
+static enum branch_cache_flush_type link_stack_flush_type = BRANCH_CACHE_FLUSH_NONE;
 
 bool barrier_nospec_enabled;
 static bool no_nospec;
@@ -219,7 +219,7 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr, c
 		if (ccd)
 			seq_buf_printf(&s, "Indirect branch cache disabled");
 
-		if (link_stack_flush_enabled)
+		if (link_stack_flush_type == BRANCH_CACHE_FLUSH_SW)
 			seq_buf_printf(&s, ", Software link stack flush");
 
 	} else if (count_cache_flush_type != BRANCH_CACHE_FLUSH_NONE) {
@@ -228,7 +228,7 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr, c
 		if (count_cache_flush_type == BRANCH_CACHE_FLUSH_HW)
 			seq_buf_printf(&s, " (hardware accelerated)");
 
-		if (link_stack_flush_enabled)
+		if (link_stack_flush_type == BRANCH_CACHE_FLUSH_SW)
 			seq_buf_printf(&s, ", Software link stack flush");
 
 	} else if (btb_flush_enabled) {
@@ -447,7 +447,7 @@ static void toggle_branch_cache_flush(bool enable)
 				       ppc_inst(PPC_INST_NOP));
 #endif
 		pr_info("link-stack-flush: software flush disabled.\n");
-		link_stack_flush_enabled = false;
+		link_stack_flush_type = BRANCH_CACHE_FLUSH_NONE;
 		no_count_cache_flush();
 		return;
 	}
@@ -463,7 +463,7 @@ static void toggle_branch_cache_flush(bool enable)
 #endif
 
 	pr_info("link-stack-flush: software flush enabled.\n");
-	link_stack_flush_enabled = true;
+	link_stack_flush_type = BRANCH_CACHE_FLUSH_SW;
 
 	// If we just need to flush the link stack, patch an early return
 	if (!security_ftr_enabled(SEC_FTR_FLUSH_COUNT_CACHE)) {
-- 
2.23.0

