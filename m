Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF13715A0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 15:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYjpw6WKCz2yxS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 23:04:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hFDF+G5q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hFDF+G5q; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYjnY0y19z2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 23:02:56 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id p12so3513669pgj.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 06:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JEFoaHpYo4S5tQ+mk5otYjO32aWJH7KCFvgal9BUlRQ=;
 b=hFDF+G5q0COO5fEPjestQI4jRbqHOD0OfGCOLNMWsJAF4gNTusiEPQV0icWZApvesm
 1zLdvl/nadXgYUkjOaLSK/aOtFN5sXXpGjB/9JAiCpZdFeF14XQgtYpV2ueL1MOpX8e/
 8l02Wy1BEAHwFQyW2aElIMcM7Fqf+FKdY1Bla6LvdcXbnIxxHEvcbhTtG2/M+wUzeuyV
 anuNTzGwHqEmU/CL1+Bt10ddYHSMvr7xJoqfXoMUix+kQZ5S5X34NjgwtKfOaLgystxK
 NOjgSCJclHejPEgaU6b/g0p/4oww52NsAKmKW1sBWd2ANr80Vg6y7GdUrqNn6D3/G8PZ
 YX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JEFoaHpYo4S5tQ+mk5otYjO32aWJH7KCFvgal9BUlRQ=;
 b=pMb0Q/K5IUKxZfnHp3kN9EE5Q0gxLg+wj+pjbpuUYUYBAGBUVoTFWm8BqKH5E18QbY
 x4KK/0Xlt8gh90Cqt+5BctPAOTHRiTDV1iqHDTlruQh03s7DGZvKVG+4h7/95hxqlvGw
 zBx3oRamdn6FkIQgzM7Mu25LiBo0QPsR4dSQapMbCNMnJp1P1DXwOmK8sW53O0HWTUu4
 W+zxueyfbuP9JlERJtMwKi73QhG0oZsSgMIuvH/o6uG0B3yF0arJzMRa4bpeGMHpz0Uc
 LTY5ERfem5YlHLzJ4g8BdgebgL0qGIC6P70vJFDlSxiOPw+xo+F3QbE/5ZWSGXnLAaZy
 GH1Q==
X-Gm-Message-State: AOAM532s3+7xJImT8BjJYuxGGCzgGgHEcJjrMcnId7sDPZBZbPy7hD3J
 fNYAaUMlJKDCIxbRZnm6pe/HxCiRsAg=
X-Google-Smtp-Source: ABdhPJx7BD8ndviaIXTpDIXHhWOLPgThVsegW2NQ+vSa4j4AVIO9sSxz36l5gp5+Fb9CU4Nj9Vw0TA==
X-Received: by 2002:aa7:9190:0:b029:22d:6789:cc83 with SMTP id
 x16-20020aa791900000b029022d6789cc83mr19193653pfa.9.1620046974376; 
 Mon, 03 May 2021 06:02:54 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id f1sm18069053pjt.50.2021.05.03.06.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 06:02:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/security: Add a security feature for STF barrier
Date: Mon,  3 May 2021 23:02:41 +1000
Message-Id: <20210503130243.891868-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210503130243.891868-1-npiggin@gmail.com>
References: <20210503130243.891868-1-npiggin@gmail.com>
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

Rather than tying this mitigation to RFI L1D flush requirement, add a
new bit for it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/security_features.h | 4 ++++
 arch/powerpc/kernel/security.c               | 7 ++-----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/security_features.h b/arch/powerpc/include/asm/security_features.h
index b774a4477d5f..792eefaf230b 100644
--- a/arch/powerpc/include/asm/security_features.h
+++ b/arch/powerpc/include/asm/security_features.h
@@ -92,6 +92,9 @@ static inline bool security_ftr_enabled(u64 feature)
 // The L1-D cache should be flushed after user accesses from the kernel
 #define SEC_FTR_L1D_FLUSH_UACCESS	0x0000000000008000ull
 
+// The STF flush should be executed on privilege state switch
+#define SEC_FTR_STF_BARRIER		0x0000000000010000ull
+
 // Features enabled by default
 #define SEC_FTR_DEFAULT \
 	(SEC_FTR_L1D_FLUSH_HV | \
@@ -99,6 +102,7 @@ static inline bool security_ftr_enabled(u64 feature)
 	 SEC_FTR_BNDS_CHK_SPEC_BAR | \
 	 SEC_FTR_L1D_FLUSH_ENTRY | \
 	 SEC_FTR_L1D_FLUSH_UACCESS | \
+	 SEC_FTR_STF_BARRIER | \
 	 SEC_FTR_FAVOUR_SECURITY)
 
 #endif /* _ASM_POWERPC_SECURITY_FEATURES_H */
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 0fdfcdd9d880..2eb257b759c6 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -300,9 +300,7 @@ static void stf_barrier_enable(bool enable)
 void setup_stf_barrier(void)
 {
 	enum stf_barrier_type type;
-	bool enable, hv;
-
-	hv = cpu_has_feature(CPU_FTR_HVMODE);
+	bool enable;
 
 	/* Default to fallback in case fw-features are not available */
 	if (cpu_has_feature(CPU_FTR_ARCH_300))
@@ -315,8 +313,7 @@ void setup_stf_barrier(void)
 		type = STF_BARRIER_NONE;
 
 	enable = security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
-		(security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR) ||
-		 (security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV) && hv));
+		 security_ftr_enabled(SEC_FTR_STF_BARRIER);
 
 	if (type == STF_BARRIER_FALLBACK) {
 		pr_info("stf-barrier: fallback barrier available\n");
-- 
2.23.0

