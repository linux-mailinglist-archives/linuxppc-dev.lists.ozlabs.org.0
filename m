Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E82056CA494
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:51:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXkn5tYvz3fjV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:51:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JRwi0cQM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JRwi0cQM;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXc16SG6z3c6P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:45:53 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id iw3so8304295plb.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSWF70XC53IehgoGdTjHjvwQLhBxkQYax50EhzSCdko=;
        b=JRwi0cQMarSyPJi9mejflbePMO/Krhq5N4+ek+e6MtsfpTJDh25Eruag961c+tHjoT
         UF1lhyJFtL+INAnU4wMAMc+N8BzhVqjOXR11Ucc0DOu6Fb9RhmON7jlkmcEtzQ1Ct/80
         QFBeVD/i2dHpbMdj1w6fIObTO4MsDP+kD5FdzveGfXX3yp8sS3qnDh0OOfl6e8H/C8ET
         eRr+TkMKYyFZX/vqi9lsUpHX0Hr3v+U5/L7cTWAnwMaFlCZ19+xgapVS/9F9JWO4B5jw
         23ojyzE7fJyyx/E+8WiqTCRPDqhR1JOIbE+kOEzE87NEtM/FJks3JtIt1coaEt1zGSU3
         InNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSWF70XC53IehgoGdTjHjvwQLhBxkQYax50EhzSCdko=;
        b=VA589O7Q4DCav0Bd/Yd3AZNP16wZds40B/gjB+fvcgsCDBLnigPvTYuq/74ED7cyYO
         qBs+qljbFIwt8mi0HmaNTcbIk8hdztHkUs639XfkgLDHc+fkp3FTuG6Uu2oeJVnLji2k
         wVq9b1nG4A8/iekhE+n0+xnm0s5OaXF6FWCYfSOLfT3r4ZbFHRv3hrSvbNFb/gPQq2g8
         a70rXxwBhV9CGgaJMRiwkUAnQ8Mo4tM5F5YmYAxb9IYq1b52obOhTCgwW6GhFGgFLGtJ
         7rJ2TzLckXX4O5+9kmBsEO/GmJUa62dg29ITWTQ72IVlFYKjNbz9XtjdrwNNZFqtz3pm
         0IZA==
X-Gm-Message-State: AAQBX9fj+7WH2++r9yHiTTyo4A/SijVnSolS06AyQXzKaPaxxo39K/8y
	7S6MA04wsVRn+iv2kTBUj54=
X-Google-Smtp-Source: AKy350bVnJu+x98KMTOh6IPe/LcqsRr+huz0uw2drNFOaxTWY/PpctDKw2oaSuKxynu4FxdAZjXEwg==
X-Received: by 2002:a17:902:cf4e:b0:1a2:1922:985b with SMTP id e14-20020a170902cf4e00b001a21922985bmr9224512plg.59.1679921151914;
        Mon, 27 Mar 2023 05:45:51 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:45:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 06/13] powerpc: Extract some common helpers and defines to headers
Date: Mon, 27 Mar 2023 22:45:13 +1000
Message-Id: <20230327124520.2707537-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327124520.2707537-1-npiggin@gmail.com>
References: <20230327124520.2707537-1-npiggin@gmail.com>
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

Move some common helpers and defines to processor.h.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2:
- New patch

 lib/powerpc/asm/processor.h | 38 +++++++++++++++++++++++++++++++++----
 powerpc/spapr_hcall.c       |  9 +--------
 powerpc/sprs.c              |  9 ---------
 3 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index ebfeff2..4ad6612 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -9,13 +9,43 @@ void handle_exception(int trap, void (*func)(struct pt_regs *, void *), void *);
 void do_handle_exception(struct pt_regs *regs);
 #endif /* __ASSEMBLY__ */
 
-static inline uint64_t get_tb(void)
+#define SPR_TB		0x10c
+#define SPR_SPRG0	0x110
+#define SPR_SPRG1	0x111
+#define SPR_SPRG2	0x112
+#define SPR_SPRG3	0x113
+
+static inline uint64_t mfspr(int nr)
 {
-	uint64_t tb;
+	uint64_t ret;
+
+	asm volatile("mfspr %0,%1" : "=r"(ret) : "i"(nr) : "memory");
+
+	return ret;
+}
 
-	asm volatile ("mfspr %[tb],268" : [tb] "=r" (tb));
+static inline void mtspr(int nr, uint64_t val)
+{
+	asm volatile("mtspr %0,%1" : : "i"(nr), "r"(val) : "memory");
+}
+
+static inline uint64_t mfmsr(void)
+{
+	uint64_t msr;
 
-	return tb;
+	asm volatile ("mfmsr %[msr]" : [msr] "=r" (msr) :: "memory");
+
+	return msr;
+}
+
+static inline void mtmsr(uint64_t msr)
+{
+	asm volatile ("mtmsrd %[msr]" :: [msr] "r" (msr) : "memory");
+}
+
+static inline uint64_t get_tb(void)
+{
+	return mfspr(SPR_TB);
 }
 
 extern void delay(uint64_t cycles);
diff --git a/powerpc/spapr_hcall.c b/powerpc/spapr_hcall.c
index 823a574..0d0f25a 100644
--- a/powerpc/spapr_hcall.c
+++ b/powerpc/spapr_hcall.c
@@ -9,20 +9,13 @@
 #include <util.h>
 #include <alloc.h>
 #include <asm/hcall.h>
+#include <asm/processor.h>
 
 #define PAGE_SIZE 4096
 
 #define H_ZERO_PAGE	(1UL << (63-48))
 #define H_COPY_PAGE	(1UL << (63-49))
 
-#define mfspr(nr) ({ \
-	uint64_t ret; \
-	asm volatile("mfspr %0,%1" : "=r"(ret) : "i"(nr)); \
-	ret; \
-})
-
-#define SPR_SPRG0	0x110
-
 /**
  * Test the H_SET_SPRG0 h-call by setting some values and checking whether
  * the SPRG0 register contains the correct values afterwards
diff --git a/powerpc/sprs.c b/powerpc/sprs.c
index 6ee6dba..57e487c 100644
--- a/powerpc/sprs.c
+++ b/powerpc/sprs.c
@@ -28,15 +28,6 @@
 #include <asm/processor.h>
 #include <asm/barrier.h>
 
-#define mfspr(nr) ({ \
-	uint64_t ret; \
-	asm volatile("mfspr %0,%1" : "=r"(ret) : "i"(nr)); \
-	ret; \
-})
-
-#define mtspr(nr, val) \
-	asm volatile("mtspr %0,%1" : : "i"(nr), "r"(val))
-
 uint64_t before[1024], after[1024];
 
 /* Common SPRs for all PowerPC CPUs */
-- 
2.37.2

