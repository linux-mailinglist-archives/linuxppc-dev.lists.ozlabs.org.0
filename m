Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDB6BE980
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 13:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdNz70xjrz3fT2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 23:41:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mjFfOlZ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mjFfOlZ8;
	dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdNtF2Rwsz3c38
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 23:36:53 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id k2so5133527pll.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679056611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AACUrmAMGo0o1wCmGEVGbVl+4mMC8WBmeWeWuWQJ0Y=;
        b=mjFfOlZ8F96WpI3hvzMSdK12GHigb25umCbjPjzvfP9aFho4vWtGzUTLajEtXv5mwq
         yYCQRQHwr9TsxEMboiy9jv8SEsK+t7kRIZRfNX+qLDJP7AmjarKLC9AsknNFKVI3yFZb
         FbEjI7XgwZWSsnHqQkEZaKmvS4S7mwJNmQf3lmnDt7ccorG7PDyg7820+spFZs7sEcWO
         dUsgHOWTMDNuSiXIWQR3dSeTctH23E2B+BKdMOVqJRvGMVVHUeXBZ8wugma8/dE0bL80
         z4XoaE58R2UXdeHrTd6XdO9SZQ3xEHQeta3aULQux26cKJoB5+vl59txr6rxVFgB9Pqq
         3XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AACUrmAMGo0o1wCmGEVGbVl+4mMC8WBmeWeWuWQJ0Y=;
        b=ig2eod1Sff4+DEs6xjAf+E3yIX8vn2CaQXjEkqpB5A0RRq1KQDiZB/oMLMDIWvZkhR
         Hf0GbueldW1BfEke5GcPAgbe3WgMApvR1yvcj8lbkSXd46wFOKHn8Go8wJiRx6Ee89Qf
         kwmkSMEQEU7MzHrDmjhBpwajsj3Ovc9ZsQ+vuuyEuTgbawiSwlMNNf+NUk4WGgZxdiBm
         roiDjTEiWuyaeJUC8N9FtCIVQxCb911DYjsbpdJV2MYA43Lodn4RWilTb9TWhEIFYugq
         GbyXDhOFK9MZjTayX0RLt1/VdWzeGhrU6McLjo5z3ZIbsRKvXiCQb59AjDSgl0L1/I7e
         kKyg==
X-Gm-Message-State: AO0yUKVXgZC7Xtn48qz/saxAeKr9nuuLendFw+eDwNRbhAuCM0gt3sFE
	NE9TakL14ESlQfYCefbKD4U=
X-Google-Smtp-Source: AK7set+sRU0UVPfRE2oFtxnsyr487NYkwsRVS7PImembOt069bz92S4sX2mu13ois20T94SlQ5ZbRw==
X-Received: by 2002:a17:903:186:b0:19e:6d83:8277 with SMTP id z6-20020a170903018600b0019e6d838277mr8450576plg.51.1679056611528;
        Fri, 17 Mar 2023 05:36:51 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902b28400b001a19d4592e1sm1430990plr.282.2023.03.17.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 05:36:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH 5/7] powerpc: Indirect SPR accessor functions
Date: Fri, 17 Mar 2023 22:36:12 +1000
Message-Id: <20230317123614.3687163-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317123614.3687163-1-npiggin@gmail.com>
References: <20230317123614.3687163-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make overly-clever SPR accessor functions that allow a non-constant
SPR number to be specified. This will be used to restructure test
in the next change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/sprs.c | 63 ++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 45f77a5..b633ea8 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -28,21 +28,66 @@
 #include <asm/processor.h>
 #include <asm/barrier.h>
 
-#define mfspr(nr) ({ \
-	uint64_t ret; \
-	asm volatile("mfspr %0,%1" : "=r"(ret) : "i"(nr)); \
-	ret; \
-})
+/* "Indirect" mfspr/mtspr which accept a non-constant spr number */
+static uint64_t mfspr(unsigned spr)
+{
+	uint64_t tmp;
+	uint64_t ret;
+
+	asm volatile(
+"	bcl	20, 31, 1f		\n"
+"1:	mflr	%0			\n"
+"	addi	%0, %0, (2f-1b)		\n"
+"	add	%0, %0, %2		\n"
+"	mtctr	%0			\n"
+"	bctr				\n"
+"2:					\n"
+".LSPR=0				\n"
+".rept 1024				\n"
+"	mfspr	%1, .LSPR		\n"
+"	b	3f			\n"
+"	.LSPR=.LSPR+1			\n"
+".endr					\n"
+"3:					\n"
+	: "=&r"(tmp),
+	  "=r"(ret)
+	: "r"(spr*8) /* 8 bytes per 'mfspr ; b' block */
+	: "lr", "ctr");
+
+	return ret;
+}
 
-#define mtspr(nr, val) \
-	asm volatile("mtspr %0,%1" : : "i"(nr), "r"(val))
+static void mtspr(unsigned spr, uint64_t val)
+{
+	uint64_t tmp;
+
+	asm volatile(
+"	bcl	20, 31, 1f		\n"
+"1:	mflr	%0			\n"
+"	addi	%0, %0, (2f-1b)		\n"
+"	add	%0, %0, %2		\n"
+"	mtctr	%0			\n"
+"	bctr				\n"
+"2:					\n"
+".LSPR=0				\n"
+".rept 1024				\n"
+"	mtspr	.LSPR, %1		\n"
+"	b	3f			\n"
+"	.LSPR=.LSPR+1			\n"
+".endr					\n"
+"3:					\n"
+	: "=&r"(tmp)
+	: "r"(val),
+	  "r"(spr*8) /* 8 bytes per 'mfspr ; b' block */
+	: "lr", "ctr", "xer");
+}
 
 uint64_t before[1024], after[1024];
 
 /* Common SPRs for all PowerPC CPUs */
 static void set_sprs_common(uint64_t val)
 {
-	mtspr(9, val);		/* CTR */
+	// mtspr(9, val);	/* CTR */ /* Used by mfspr/mtspr */
 	// mtspr(273, val);	/* SPRG1 */  /* Used by our exception handler */
 	mtspr(274, val);	/* SPRG2 */
 	mtspr(275, val);	/* SPRG3 */
@@ -156,7 +201,7 @@ static void set_sprs(uint64_t val)
 
 static void get_sprs_common(uint64_t *v)
 {
-	v[9] = mfspr(9);	/* CTR */
+	v[9] = mfspr(9);	/* CTR */ /* Used by mfspr/mtspr */
 	// v[273] = mfspr(273);	/* SPRG1 */ /* Used by our exception handler */
 	v[274] = mfspr(274);	/* SPRG2 */
 	v[275] = mfspr(275);	/* SPRG3 */
-- 
2.37.2

