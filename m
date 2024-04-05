Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC28899850
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:45:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HLP0GOSY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sWH21Mcz3w6T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:45:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HLP0GOSY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sKL0XT9z3vc3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:37 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ecf1bb7f38so1201672b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306195; x=1712910995; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyFvGHfzzKi7gHDZhJlEbH1l1spuiAuHSEsVjsjNP4U=;
        b=HLP0GOSYqR/TV3WL4HJUD4DxYSC0SgTBawLmyxLLBeDOsUvnELZGtzORsdSz24rsKd
         qY5f+TWtT18fmDNBirlDJHwVGtmDesf8fDDkA+5/O4FTx3eV+DhtcKKxi4W/laXiZLb6
         YffaN5IR67XFOZIZkO9nS8k7XyZgYCO0MIoVyr/XRcRwahLxtCbDTP7e1Y2l7pDK9tNM
         WZoeOzu6xepjMVTE/1YcpeBR9y02pi0b6ChD5zHkU3QheP3lPHo/uWtI+cwvIlkfsvOB
         MCJHRqkqYnD5W4lwUs+FdfzbNAAE/0DQMXkLTNKUujHhSINk4UuAeZzug7p6hOaPjjgp
         6Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306195; x=1712910995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyFvGHfzzKi7gHDZhJlEbH1l1spuiAuHSEsVjsjNP4U=;
        b=THIIbWdtGp+s1XY1pnR5fY9s9lKdbdjtKKtKJaLzm4zpSThQpKHHIv2HJPT5+/90Em
         9KUIRixk2xSx3KRiUP1T2hRx6WU7EWT95Wzc6JWGhqiWOZQjyeGzJMVvbYqOuZF7dqpN
         nwxdV2pT0rJ/ITdoCZrY9VFj79wdmUG5FvyKr/2Jt29sFQQSTZpWfmURJMsH81vlwP/X
         79sAngCYxrQMeaOWW3t3Gs5VZXic0JiVpwGE4hSaahsrNEgSiLwQp6L7iBUWKWLYzmbc
         u3PQ5IqxDbGicL/JTfuhjNEgTnIrtXhqTevQgJ6UxceauJAuvmqBRYOufvEzeKPuEj/l
         E5Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXdU9IrZDzVVTY/pr884T5zToR8EnhGTfGzyR3ZsUqwcdwe93GAqTsftTSMhNwobFkW5zQokmrTF6XaA7T/t3DS3U7KCxYV3h41ju0rJw==
X-Gm-Message-State: AOJu0Yw8PETF9hLBx9LsZiQMBODNoKgAgrzSZNC5YbwPwAJZrwEyuGrb
	oi5b5QLuNIdnXwh0etEKhENlZXEkAg7/JJ88G8SmBDqVP8tyeF7z38ERYye+
X-Google-Smtp-Source: AGHT+IFDpih/tQljzRLV4rSNKceTY2XTqFpquzGXL5bAu3A/HOyOAwY9rjNgfnrzZrOv2inOMXRlFw==
X-Received: by 2002:a05:6a00:2d2a:b0:6ea:baed:a15c with SMTP id fa42-20020a056a002d2a00b006eabaeda15cmr848558pfb.4.1712306195405;
        Fri, 05 Apr 2024 01:36:35 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 12/35] powerpc/sprs: Avoid taking PMU interrupts caused by register fuzzing
Date: Fri,  5 Apr 2024 18:35:13 +1000
Message-ID: <20240405083539.374995-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
2.43.0

