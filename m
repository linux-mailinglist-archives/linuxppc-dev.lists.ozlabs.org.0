Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8CB87F8EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:09:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yf3B0+J/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPWM5F3yz3w4q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:09:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Yf3B0+J/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPKL1W5gz3vXr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:21 +1100 (AEDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2226572ccf8so3179434fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835219; x=1711440019; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izEPUDLrTWux3hhd+DYadQTbCcRPUPa7uPofKkjLRfw=;
        b=Yf3B0+J/LQzxv6Y28mJBn9z1jF5BYznLXolmDq2IqGiUsz07x1KRL/ACnvjT0hb6P2
         6hyZWJ/MVeOA35PME2260LMnKOITrhoY5WRtCd/AKkqRPJtlmEDwzJ0fJs/uRYAwaMc1
         p3hzp9P+02zXdDMNQQe8mZwgcQRaYSHPhA/wcpVlKy5GnmEj+A7zq62Qg3S9pJSC2Lw1
         IWoLoPqY5RaZE9+nWbS4HHpar7EO4qE4RFw4Q54EifdB9Cz6oSof3Dygne1axx6viBCb
         fSYU045+CWrKQE4Wm7yTsqqP9fvvHLdYMEon9ysuNbhspDlPkatt453EtO5tfPEwvTpx
         NGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835219; x=1711440019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izEPUDLrTWux3hhd+DYadQTbCcRPUPa7uPofKkjLRfw=;
        b=GnKmFFp6YM24Yb1+VEttqZACqlFcZDBztPONVE9vfyJqD+jUWzPOjc8iTkXDj6s+pk
         6lLPeIA4VShN3qwn0otSVSEldzhhdrWQ++7OoAjUZuImFnat++7vfg9+u8NosmU426G9
         12UQt18URNZMwL2W6eved2C1Lg+eLknJ37XsYO56cD7uTaH8ugZMMkjsnGiJDGaQB4xC
         fMXhsguieftXFKUoV/63iEsJW4BwGDzfCi3IS+0N0U09UA5pFIx2gkXFtJdJHUnEwx/D
         ZY4yMxF7QKMsCjvK3yOLA9aLBfsS70QgyzySfXw1BjwsasLjAVZgfbaLS80P0KFopwEC
         9bhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Tfa2CwZM65mxzAUjz8i+ypTMpHTlneWJovPicN8NbJEDmjQdmDttUr5SrW3Hfygo3ntzoFY4RbsqJYpEr+98no+YUaxvm1YoDTKDHg==
X-Gm-Message-State: AOJu0Yy0V5WRDLB1RaYtdNEzkQkdVWPlW19OxIbplTqfLI2hI8iKTD2e
	WdoGMzy+jlq1mdrf0EYm7cL4eKzFwZBWjRHDyxF7fLwR3N5hqt9S
X-Google-Smtp-Source: AGHT+IG6AoUV4kxb29g3tkOeDbXZj/QPCcaJ2eebh/M0r60HpuDQrZKe9HHIFG91jyt9Gi9dH8DNRQ==
X-Received: by 2002:a05:6871:554:b0:221:14d4:6ab9 with SMTP id t20-20020a056871055400b0022114d46ab9mr16702195oal.2.1710835219241;
        Tue, 19 Mar 2024 01:00:19 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 12/35] powerpc/sprs: Avoid taking PMU interrupts caused by register fuzzing
Date: Tue, 19 Mar 2024 17:59:03 +1000
Message-ID: <20240319075926.2422707-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Storing certain values in MMCR0 can cause PMU interrupts when msleep
enables MSR[EE], and this crashes the test. Freeze the PMU counters
and clear any PMU exception before calling msleep.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/reg.h |  4 ++++
 powerpc/sprs.c        | 17 +++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index 1f991288e..c80b32059 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -24,6 +24,10 @@
 #define   PVR_VER_POWER10	UL(0x00800000)
 #define SPR_HSRR0	0x13a
 #define SPR_HSRR1	0x13b
+#define SPR_MMCR0	0x31b
+#define   MMCR0_FC		UL(0x80000000)
+#define   MMCR0_PMAE		UL(0x04000000)
+#define   MMCR0_PMAO		UL(0x00000080)
 
 /* Machine State Register definitions: */
 #define MSR_EE_BIT	15			/* External Interrupts Enable */
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 44edd0d7b..cb1d6c980 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -476,12 +476,7 @@ static void set_sprs(uint64_t val)
 			continue;
 		if (sprs[i].type & SPR_HARNESS)
 			continue;
-		if (!strcmp(sprs[i].name, "MMCR0")) {
-			/* XXX: could use a comment or better abstraction! */
-			__mtspr(i, (val & 0xfffffffffbab3fffULL) | 0xfa0b2070);
-		} else {
-			__mtspr(i, val);
-		}
+		__mtspr(i, val);
 	}
 }
 
@@ -538,6 +533,16 @@ int main(int argc, char **argv)
 		if (sprs[895].name)
 			before[895] = mfspr(895);
 	} else {
+		/*
+		 * msleep will enable MSR[EE] and take a decrementer
+		 * interrupt. Must account for changed registers and
+		 * prevent taking unhandled interrupts.
+		 */
+		/* Prevent PMU interrupt */
+		mtspr(SPR_MMCR0, (mfspr(SPR_MMCR0) | MMCR0_FC) &
+					~(MMCR0_PMAO | MMCR0_PMAE));
+		before[SPR_MMCR0] = mfspr(SPR_MMCR0);
+		before[779] = mfspr(SPR_MMCR0);
 		msleep(2000);
 
 		/* Reload regs changed by dec interrupt */
-- 
2.42.0

