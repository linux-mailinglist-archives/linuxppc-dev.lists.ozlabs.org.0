Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F962727982
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 10:03:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGtf05y1z3fgW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 18:03:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OZ4NWay5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OZ4NWay5;
	dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGnG1fqzz3bTG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:58:58 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6b166023d47so206776a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211135; x=1688803135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVxObp0zmyu3ssFErjXY9Z5Q7INa146bcXIjtH2cVKQ=;
        b=OZ4NWay5hQG0dD6Z07qscHOwNT8tDgOt5plB8HxBeowkPQexlqPsyC2D8BQTKLw6JS
         TAYdOv4M1sWInpQkcO74NYZEw7UnbzjgFmqeej6x2fK8/srNgultVD+PgdgAzNis+J5L
         JLWREvYMhAQLLV/CUokuusVPsLhJxAGvxCdUCu1EMdlplfmrOOVEqHAQ/nmjc1sM772u
         IkTdjRsR9BOf1Fm4wRFzihc/Y5BTclbcXl/I+SbDvZxWF+dOmy4J1xuH2iVwy2dFh3NC
         NoeZgvVE2R9VOBQds3JWzCzWBaFKJcxoxu3zsXhDQeWM6lztLSzzRDt6q6AbmipKa5ET
         QtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211135; x=1688803135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVxObp0zmyu3ssFErjXY9Z5Q7INa146bcXIjtH2cVKQ=;
        b=jqTrKGUmRkjh1S8uEOWdHHCv304/yhxZ+25/ox0EsS5btDEhKVytuHm/0q+wq8EXgl
         X4vcHH3SbLLsyp/YpoUGeZ6HX7ZVhVIzAiuuP38K1VWIPBsj95l3ecH3DclIqGGukAsO
         3Ct1IOvEbFKH+fzaC7hc/4InimAecwsI2RBrJAeORaXq4oh4TVDNWbZH4HZCl94Wl3AL
         c1Ejecqc41ip8nKS79TTXqhNu3HBnsi7o4w2ihSdC4MAqBn1GUcE8JQpThlR8Nz3XcXR
         YqS+bK196EgrJcAAxIKTE2Bz6NfQSj1tZ4/RlrFVBE6AIoUvDgXITMyWBPd+XNDJpbSf
         C4dQ==
X-Gm-Message-State: AC+VfDwKw9U+yONnfMyqjrsM96Eia1D8Nyzmu1HdDCmgPjTN6jZS0Hlx
	AEBzMHF80Aw2Fs/V2/3RXy8=
X-Google-Smtp-Source: ACHHUZ70nNbp10LOImOn6G69MXJk5Q7oJsNMbOBFBAsZ1ykU4/Xuk6Iiu1vra8opQV+j3AEGl1U9pg==
X-Received: by 2002:a05:6358:9f91:b0:125:506d:36db with SMTP id fy17-20020a0563589f9100b00125506d36dbmr5668272rwb.14.1686211135442;
        Thu, 08 Jun 2023 00:58:55 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:58:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 05/12] powerpc: Extract some common helpers and defines to headers
Date: Thu,  8 Jun 2023 17:58:19 +1000
Message-Id: <20230608075826.86217-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
References: <20230608075826.86217-1-npiggin@gmail.com>
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
 lib/powerpc/asm/processor.h | 38 +++++++++++++++++++++++++++++++++----
 powerpc/spapr_hcall.c       |  9 +--------
 powerpc/sprs.c              |  9 ---------
 3 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index ebfeff2b..4ad6612b 100644
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
index 823a574a..0d0f25af 100644
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
index 6ee6dba6..57e487ce 100644
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
2.40.1

