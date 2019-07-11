Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F3965024
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 04:28:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kg385GTczDqgS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 12:28:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PQTJMwXf"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kg1P2gt7zDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 12:27:05 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id f25so2128120pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 19:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gJuAUoOdyToKgMwqSNbHlMjfwEjXvPhYqQpbrzkQAkc=;
 b=PQTJMwXfOp4jtr1CY5d0F0VI87zTQyJPPYJnbySk9G17ykXHqks8BoBEEV9sxuj1Li
 y6lTJfzJOsiOSSZ2iaEgVcgGw8Gx+0Gn6u/xirUIBLvUygj3eQ7/xMtTB8Z/ZlcZ3W+z
 +lf0vcSdUuenwAZCaxNUn/c8JrFt3NeNKpAi9FxOPurVI69QxB8O8DDWGN7WJcTS6dB5
 dK94jtJHXb/5K8z2ceN/bk3GQiz4ZDjhM7EZv50kwPhYqWOopwX/7sVCqAQu37hyHqFr
 bGOkmC935bQp+nB+A7oOUkekprqo4LzOfpZdJtxGlWV7YZDgoqY/bWfUJRd3fMQwLYG7
 8OaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gJuAUoOdyToKgMwqSNbHlMjfwEjXvPhYqQpbrzkQAkc=;
 b=qMW4pCZo5LqM1i08GGxQyGgzHrGGpMCJsS8fQyi4y2b8UGoTy6Gbbj9hF9akS4+kae
 dxZ423x0RgNPWNts9biKtAsCSRTg54GLPl5J78rC3O6CM5oaJhwRay/0j21MQz6OEo0+
 H7CxYA1e7SBSfqLElIpqY6qAkTZYFhq9BZ/v3Cvh3s5f7j0XpA1w42NGFhtz5uiGTJZw
 2oHCumOycPrnxRancI12fe/fnnU/AqnP8vZo/75UdhAoinlKEcTtq9RajkzikXh1gQD+
 0Cv/O637pJ8o3JWtjC0a7o3CIU9exP11r/TD34Wfa9CaOYp5ya0i9XKf9e513SPycUKX
 HE/A==
X-Gm-Message-State: APjAAAV1KuunlJqw/esoIqoZJyFp+S9mwLkkJj23CNhtrgfTx8AhHpyk
 GTJkdBo4fNcRwogtOwW92EgjJM9G
X-Google-Smtp-Source: APXvYqz+tbKJRdvp4/48Xw0Z1zUKf95IA9mS8Jo6lctauxZsgwIhwyXK4q/docLABNO1/oe2TAiW2w==
X-Received: by 2002:a17:90a:214e:: with SMTP id
 a72mr1960265pje.0.1562812023231; 
 Wed, 10 Jul 2019 19:27:03 -0700 (PDT)
Received: from bobo.local0.net (203-213-47-85.tpgi.com.au. [203.213.47.85])
 by smtp.gmail.com with ESMTPSA id t26sm2820205pgu.43.2019.07.10.19.27.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 19:27:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64s: Remove idle workaround code from
 restore_cpu_cpufeatures
Date: Thu, 11 Jul 2019 12:24:04 +1000
Message-Id: <20190711022404.18132-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190711022404.18132-1-npiggin@gmail.com>
References: <20190711022404.18132-1-npiggin@gmail.com>
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

Idle code no longer uses the .cpu_restore CPU operation to restore
SPRs, so this workaround is no longer required.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/dt_cpu_ftrs.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index c66fd3ce6478..78db3e6eb45e 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -71,7 +71,6 @@ static int hv_mode;
 
 static struct {
 	u64	lpcr;
-	u64	lpcr_clear;
 	u64	hfscr;
 	u64	fscr;
 } system_registers;
@@ -80,24 +79,7 @@ static void (*init_pmu_registers)(void);
 
 static void __restore_cpu_cpufeatures(void)
 {
-	u64 lpcr;
-
-	/*
-	 * LPCR is restored by the power on engine already. It can be changed
-	 * after early init e.g., by radix enable, and we have no unified API
-	 * for saving and restoring such SPRs.
-	 *
-	 * This ->restore hook should really be removed from idle and register
-	 * restore moved directly into the idle restore code, because this code
-	 * doesn't know how idle is implemented or what it needs restored here.
-	 *
-	 * The best we can do to accommodate secondary boot and idle restore
-	 * for now is "or" LPCR with existing.
-	 */
-	lpcr = mfspr(SPRN_LPCR);
-	lpcr |= system_registers.lpcr;
-	lpcr &= ~system_registers.lpcr_clear;
-	mtspr(SPRN_LPCR, lpcr);
+	mtspr(SPRN_LPCR, system_registers.lpcr);
 	if (hv_mode) {
 		mtspr(SPRN_LPID, 0);
 		mtspr(SPRN_HFSCR, system_registers.hfscr);
@@ -318,7 +300,6 @@ static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 {
 	u64 lpcr;
 
-	system_registers.lpcr_clear |= (LPCR_ISL | LPCR_UPRT | LPCR_HR);
 	lpcr = mfspr(SPRN_LPCR);
 	lpcr &= ~(LPCR_ISL | LPCR_UPRT | LPCR_HR);
 	mtspr(SPRN_LPCR, lpcr);
-- 
2.20.1

