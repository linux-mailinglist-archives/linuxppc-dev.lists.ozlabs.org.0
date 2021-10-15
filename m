Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0042F73A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW9cl615Bz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:47:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qgKc/ham;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qgKc/ham; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW9cC5c1tz3bmn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 02:46:35 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id oa4so7480017pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=qgKc/hamRxnk9EAExHx9lM2P2mpfBGk69um1hXpwOp5qfSElmepiEksTdyqFQW2Fv7
 IewRiBhPmMHZHP8Vp0Io9DtkdxMvOf5SHNwkbkxdHDnkGyU61xpyoqpaqYdB/Pus5UeX
 hVQN/ax8TeQL9NRpnKbwRqf1jv4XQXzxuot+zS7cYjru2qneikfKGstE7fa6dAfHMbA5
 8CMPZW0su6C/k5TSLwZdW4doLgt4jTbEg9b4yBbWPYzBDYnek2F23A+kaFW5dNgtPwT0
 bJgPP5Fld+J/2QO6lZOC7fKwiRTESdn9Jy0B4F0f8ljvr9CXG3g2RpNrNRkNey3XYj4W
 A/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUx1zrTY0Ka69PwK0HuQcXj89HkMpPrH2ks6HQYuL00=;
 b=mYRNd706e2JlKGE0uFukyXT/RPy9K7DAbkl6F1D07fEWkl/X5vWle3fXDBfbK0BV74
 PCmnE6cBQiz43s4O4KGQL/oX+/neLGSWHmfgxzSKHj4YKTK8OzGNzLF3WP3maSUww0bS
 bfh5Wcz+IAjeeuIKMpj054+by1USc+tzCycuhkxi+koFBk952oHf55raiO3GsEZtaJhx
 4WOkXXuP8FZmxXJyI1djXbsyLbyNCcSqGLLXf/K+BxfXNytw9lgMoBrk1HA476rSF7cp
 382hwc8bsULRs7u1zVJHZTmUS/urh2tkDzvbz4BI/keYi/DeSJIAfEBy2DFIHomC7COT
 rghw==
X-Gm-Message-State: AOAM533kH7e6O+KAMQw109E0/cF/4Py6O80XIfu0om/ZKSFCFsDiQqlF
 2hZk0upLD7Ya1eKVW/09caefzpA/LUQ=
X-Google-Smtp-Source: ABdhPJwMz1YCjyr/7C5cPQyyLhDS+xP3qgrCkF9LfJea2/DZI3kzTCXZ9g7r+UjbKMrgorXUgQD3wA==
X-Received: by 2002:a17:90a:de0b:: with SMTP id
 m11mr28533730pjv.39.1634312793485; 
 Fri, 15 Oct 2021 08:46:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id y1sm5392092pfo.104.2021.10.15.08.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:46:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 01/11] powerpc: Remove unused FW_FEATURE_NATIVE references
Date: Sat, 16 Oct 2021 01:46:14 +1000
Message-Id: <20211015154624.922960-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211015154624.922960-1-npiggin@gmail.com>
References: <20211015154624.922960-1-npiggin@gmail.com>
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

FW_FEATURE_NATIVE_ALWAYS and FW_FEATURE_NATIVE_POSSIBLE are always
zero and never do anything. Remove them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/firmware.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 97a3bd9ffeb9..9b702d2b80fb 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -80,8 +80,6 @@ enum {
 	FW_FEATURE_POWERNV_ALWAYS = 0,
 	FW_FEATURE_PS3_POSSIBLE = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
 	FW_FEATURE_PS3_ALWAYS = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
-	FW_FEATURE_NATIVE_POSSIBLE = 0,
-	FW_FEATURE_NATIVE_ALWAYS = 0,
 	FW_FEATURE_POSSIBLE =
 #ifdef CONFIG_PPC_PSERIES
 		FW_FEATURE_PSERIES_POSSIBLE |
@@ -91,9 +89,6 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_POSSIBLE |
-#endif
-#ifdef CONFIG_PPC_NATIVE
-		FW_FEATURE_NATIVE_ALWAYS |
 #endif
 		0,
 	FW_FEATURE_ALWAYS =
@@ -105,9 +100,6 @@ enum {
 #endif
 #ifdef CONFIG_PPC_PS3
 		FW_FEATURE_PS3_ALWAYS &
-#endif
-#ifdef CONFIG_PPC_NATIVE
-		FW_FEATURE_NATIVE_ALWAYS &
 #endif
 		FW_FEATURE_POSSIBLE,
 
-- 
2.23.0

