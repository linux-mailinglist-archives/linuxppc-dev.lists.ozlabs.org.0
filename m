Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA024DA8F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 04:33:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJG8522JJz30Jm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 14:33:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Wm53QL7G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Wm53QL7G; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJG7R5PCMz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 14:32:49 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id g19so2082334pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 20:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NhNRsu7r2HQ8JFzb+3R879whPoIjGGcDOPzwv3S/pjc=;
 b=Wm53QL7GX8kbaknCkt4ibMCpsQvufCJ5TK8J+rrZZkE9fXL+Gw3pTknr+nFNw6js8F
 eFXyJCvgZICwKfOBHKj0JHJW8XPQQi8szcxUATdO/gU+HHCqXmFu8aJck6B+hQJtQ4fK
 fqcpoW2RAJ7v6/EpNODIj6lS7cmJHa658cq/ssq6z8bjJrNstG5qdzPVf6kB04MIQmgp
 8EWjeDEPdfN1kILbNaRMXeuuWpPYvF/g1eTlwHF6Z/XWGQb2PjDDKZ4f/wyU6Z0+ZxhH
 t2GV2FFVMITWgQ7597iCBS2AxBSB8+xrN1svNJeb+2YtgrPl6/vdsdFHVteNiWEnprEm
 9e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NhNRsu7r2HQ8JFzb+3R879whPoIjGGcDOPzwv3S/pjc=;
 b=jXQ1hGDbdy5MVGIOaBRYm8I9tOn9es3ruhzHR71l6pIRhrzQ263agZcxk1ZQ6AIyYm
 rFSNzN8zj3iH70mzzb9ljSOKKh8Dn8SUVFeFzq0vRh8Hjn5KYmEVIS0PKh3Y3RIhqTNi
 aowWCrqQrtpgkQsDcf7cGO05fF4UVEGMwN4gM/A3UzVq5IGhb6ExKqG+TAgdA4k7597U
 YFBBRxYtMteMmA4MQ5hmGPHEOh0fmt0wecjJJlg1f4aMmtuChOGaOlhxaPDR9UYwD5dy
 0zuyl8/aBI+UmRynUPwbhn2zNWVVahmI7LoGA+8uT0xhmmr56MZMhqgHqCPN8HRiI1xX
 lE3Q==
X-Gm-Message-State: AOAM533pnB9ostL1+zFwRVyY66QnTQbehs4V+APkulLlDvXu7b2HEhnu
 Egv/nwirfO0+nPPqiur25Ljt7lyMW4g=
X-Google-Smtp-Source: ABdhPJzZbz+MrhFUV7PNLNE0fxaDxnmH1zlAuXSFF6nlsBM0TycS1AL5CbyBooti43BdIPqeZj6fIA==
X-Received: by 2002:a63:8441:0:b0:380:625b:bbb5 with SMTP id
 k62-20020a638441000000b00380625bbbb5mr26949134pgd.472.1647401566463; 
 Tue, 15 Mar 2022 20:32:46 -0700 (PDT)
Received: from bobo.ibm.com (110-175-148-108.static.tpgi.com.au.
 [110.175.148.108]) by smtp.gmail.com with ESMTPSA id
 nr22-20020a17090b241600b001bef1964ec7sm4407731pjb.21.2022.03.15.20.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 20:32:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/64/interrupt: Temporarily save PPR on stack to
 fix register corruption due to SLB miss
Date: Wed, 16 Mar 2022 13:32:35 +1000
Message-Id: <20220316033235.903657-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Michael Neuling <mikey@neuling.org>, Michal Suchanek <msuchanek@suse.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a minimal stable kernel fix for the problem solved by
4c2de74cc869 ("powerpc/64: Interrupts save PPR on stack rather than
thread_struct"). Instead of changing the interrupt stack frame (which
causes a lot of churn), it moves the PPR value from the PACA save area
to an unused slot in the stack frame temporarily, and defers saving it
to thread_struct to later on when it is safe to take SLB misses.

Upstream kernels between 4.17-4.20 have this bug, so I propose this
patch for 4.19 stable.

Fixes: f384796c4 ("powerpc/mm: Add support for handling > 512TB address in SLB miss")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 35fb5b11955a..f0424c6fdeca 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -243,10 +243,22 @@
  * PPR save/restore macros used in exceptions_64s.S  
  * Used for P7 or later processors
  */
-#define SAVE_PPR(area, ra, rb)						\
+#define SAVE_PPR(area, ra)						\
+BEGIN_FTR_SECTION_NESTED(940)						\
+	ld	ra,area+EX_PPR(r13);	/* Read PPR from paca */	\
+	std	ra,RESULT(r1);		/* Store PPR in RESULT for now */ \
+END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
+
+/*
+ * This is called after we are finished accessing 'area', so we can now take
+ * SLB faults accessing the thread struct, which will use PACA_EXSLB area.
+ * This is required because the large_addr_slb handler uses EXSLB and it also
+ * uses the common exception macros including this PPR saving.
+ */
+#define MOVE_PPR_TO_THREAD(ra, rb)					\
 BEGIN_FTR_SECTION_NESTED(940)						\
 	ld	ra,PACACURRENT(r13);					\
-	ld	rb,area+EX_PPR(r13);	/* Read PPR from paca */	\
+	ld	rb,RESULT(r1);		/* Read PPR from stack */	\
 	std	rb,TASKTHREADPPR(ra);					\
 END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
 
@@ -515,9 +527,11 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
 3:	EXCEPTION_PROLOG_COMMON_1();					   \
 	beq	4f;			/* if from kernel mode		*/ \
 	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
-	SAVE_PPR(area, r9, r10);					   \
+	SAVE_PPR(area, r9);						   \
 4:	EXCEPTION_PROLOG_COMMON_2(area)					   \
-	EXCEPTION_PROLOG_COMMON_3(n)					   \
+	beq	5f;			/* if from kernel mode		*/ \
+	MOVE_PPR_TO_THREAD(r9, r10);					   \
+5:	EXCEPTION_PROLOG_COMMON_3(n)					   \
 	ACCOUNT_STOLEN_TIME
 
 /* Save original regs values from save area to stack frame. */
-- 
2.23.0

