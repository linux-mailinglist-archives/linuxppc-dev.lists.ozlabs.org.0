Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C98BBB5F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:34:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CCw0Ljne;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnD255M0z3cFw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:34:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CCw0Ljne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn6N67QSz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:16 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ed9fc77bbfso424742b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825754; x=1715430554; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLJ4F+YKrXLreQDqYuCgCaOGHgxIONW/HHGxnZQi+UY=;
        b=CCw0LjneX0jMniZP/7g0paTjkJZUptye+W8gnd/Ce30aHdxAn77wgaFyRxJ6RzfxJB
         DUc5jyaLovBANbf/aCVxtiu9/+kRRIDiRWCtJIlEI4aX0of6PVCaSbgYZauCq/TniNiI
         rmQyLqVSKmAjLknLY9ebv47eWy8C81iyvCJZML6ZY3IIc8bb7p+qjHXtaXP6VTZi99EP
         1/XvZdvuVzgM9oDgRwftLn2mxJBojiOe/NssRARQ8fFwV54ssZZt/Ruq4UqLBFlcNWup
         xfh8ZFXcLHUcHyJXW6VapQW4IlypeTLwxW8X75n4ml5A891RhlYkf57q9gebzLFOQydo
         CMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825754; x=1715430554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLJ4F+YKrXLreQDqYuCgCaOGHgxIONW/HHGxnZQi+UY=;
        b=ouC1N23id3hjliwqv7Tf4/TIEtPutm40i3o1P1eAw49mKFv9HSPh615jjdonDlBKHB
         Z1V0oepVyMgLoXjcm2U9308yoljvl97lonYv1BqiNChC7Hl2sI99HtAm5uk0MxqE0tgP
         FVSOkheVf6KCkbbVJplUf7r15Sr8WUqVuTAl/6F8nUYTsP2sie5invCwfEfVEfo57wA3
         RmvzS2kU7f4cVIxzp0UAn1C0ZUpARTTVEgfkx3r1SA9Qx4nADhwrpqRU1qorG7QXxW6g
         330YlmmSRItrIBgNGHVvH9a4hgvl8dMtF9BGxrWSDcBucTcwYqs/4qKypcsQD1jWNkfi
         JQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCUpbv6AVRQ70vBGvqLS5usPXvWvoGsXfqr5dqmu/iIS7zsKGlxSxu3ZZSeqshQCMdHFRLUZ/aExvEZkz4GQYTQVnqsZ26J3PlIqWfQTrA==
X-Gm-Message-State: AOJu0Yxsnl9svqm558xrnNS5pEBy5A7DAbJ6y7/LXpbRtl8GSSjPGEHu
	OavgTVIempmEOQrmeGZCQE+rgctGrATz9cilrmT5GnnPT4m2dBFv
X-Google-Smtp-Source: AGHT+IHLAKw3BD6hW5ivGm/rKmAEyFICvMjClcsYl5pfoB1uSKJ1pCOvw+uWJkH4jaFuzAcKq99lJQ==
X-Received: by 2002:a05:6a00:1903:b0:6f0:b81f:af5b with SMTP id y3-20020a056a00190300b006f0b81faf5bmr6119136pfi.34.1714825754399;
        Sat, 04 May 2024 05:29:14 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:29:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 06/31] powerpc/sprs: Avoid taking PMU interrupts caused by register fuzzing
Date: Sat,  4 May 2024 22:28:12 +1000
Message-ID: <20240504122841.1177683-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
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
index a6588ca63..c25dac1f6 100644
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
2.43.0

