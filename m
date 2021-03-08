Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6C330AAC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 10:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvDJ734SPz3dM1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 20:56:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sFZls88O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sFZls88O; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvDF11WNpz3cK0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 20:53:41 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 lr10-20020a17090b4b8ab02900dd61b95c5eso416986pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 01:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KF4+4mitD9+dAiXNDr97R1/cshWbGHkEApltIv8ApV4=;
 b=sFZls88OPmw12zolqk5OY0Bn/nQvIh/ryTBJtPD74j2FEyY/u7OKTnWnnelITt1TKg
 mD+aZgXBx12lH63xFw1S/3frk4/UMtXqveXvB9fK6Sk4haeyABZtLtzZrxyy8yCFpUsE
 2fllhiK/UP+YfZEJJd1TmBw6BbWptZm1A02oHPsvB0ZUWbE5BYqYKbQz2o9PuQrvvyij
 6NwxKVvgsdxWWahzsrOjRyJnKY4M57xxwJ4DHkw2XzwbfoWn4loSv9Fz7vHAQ/hD2SF9
 8yWtS2XTIAXy13rIxfJOzzEZo8SClYNRFsHnOnOour8QWf6JuxlsyAPssw2FnS0xQJ5W
 +LaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KF4+4mitD9+dAiXNDr97R1/cshWbGHkEApltIv8ApV4=;
 b=rpWt+5DwllNi3F//p/8jhnRi2nRxnvVYkGf5q9IXRmxBiqDicfLpH6cmv9X/z7sgS3
 BnyQCLQ+gl58OB3RCXg9WjmBnPElquHUY2mDFbryGrJaSN9QBZrWzZDiimTnUfmZZFAd
 AALn5c1HH2u0TY1h2KmRAXroUPEwxn5l096GZD8MWIWvvCz4WP0UAhWWP8kjWj3nTxzy
 uH+YVqQycUzCucQlACDZrnFV6+cjlkkC4ZGDJ8qK9sWB1kVH4rPfe3wu0myXXITZruhX
 YDzBqrPNffnoiTfLdkREASTOZoF+C9T+EsfToAQXBCYkjM6mCKmvHSPFJ4Yy63gZtnTk
 ijBQ==
X-Gm-Message-State: AOAM530daqEKWD49kAPnW+wHMSOnLL8oLP/F+oDaVqCVCUIFlqkwVWgt
 aEueDNs8IFyCAnEVYgzowl/7HUyxF7U=
X-Google-Smtp-Source: ABdhPJwSHw7S4w9HXHqOLQbxLZIWpq4PCWciKQCgvQaI+CwVcwEPfL0o3I/n2kp6q1HLdI7/OjlJ5A==
X-Received: by 2002:a17:90a:16d6:: with SMTP id
 y22mr24771220pje.55.1615197218415; 
 Mon, 08 Mar 2021 01:53:38 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 e63sm1326850pfe.208.2021.03.08.01.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:53:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 6/7] powerpc/64e/interrupt: handle bad_page_fault in C
Date: Mon,  8 Mar 2021 19:52:43 +1000
Message-Id: <20210308095244.3195782-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210308095244.3195782-1-npiggin@gmail.com>
References: <20210308095244.3195782-1-npiggin@gmail.com>
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

With non-volatile registers saved on interrupt, bad_page_fault
can now be called by do_page_fault.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64e.S | 6 ------
 arch/powerpc/mm/fault.c              | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index eef8b5bc3cc8..d9151f3ae35d 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -962,12 +962,6 @@ storage_fault_common:
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
 	bl	do_page_fault
-	cmpdi	r3,0
-	bne-	1f
-	b	interrupt_return
-	mr	r4,r3
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	__bad_page_fault
 	b	interrupt_return
 
 /*
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index bb368257b55c..f271715a1c0a 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -552,11 +552,11 @@ static long __do_page_fault(struct pt_regs *regs)
 	if (likely(entry)) {
 		instruction_pointer_set(regs, extable_fixup(entry));
 		return 0;
-	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
+	} else if (IS_ENABLED(CONFIG_PPC64)) {
 		__bad_page_fault(regs, err);
 		return 0;
 	} else {
-		/* 32 and 64e handle the bad page fault in asm */
+		/* 32-bit handles the bad page fault in asm */
 		return err;
 	}
 }
-- 
2.23.0

