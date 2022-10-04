Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597515F3C64
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 07:13:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhQnm31Whz3bjw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 16:13:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UnTwA1o7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UnTwA1o7;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhQmp16kqz2xfV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 16:12:08 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id n7so11739556plp.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 22:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=2mojTruAIAmsoVEsmXiWqXJVl//EbEHS8Fxgvp8PXyc=;
        b=UnTwA1o7juHQZyw8gk12K5wvoRDS1kTfPxZwTjakNR8Kt+FHzurH9hXbo687dQUfOb
         g3j9hayJSGdrJgpN+PopuqpR4gWLU7mjbZrBFN1lHK86x8fMjl6d8nItV6eQ68npjcp0
         wZNIqtb5xtzh3WfwyH5T2f2RggYnjGKSXPo3dLcjaTQCCjCyRvv/4mtmr2H/IbMXLUf/
         qov+J7TFW+PqaRWu2cCf2e/K0vz18UVtQph5V0WQnhVZAwk2RdSxEWc4BZf1u/T160ep
         37U01z+TGvsDWgazXn6lC55rapKhvJ2GZBoZvYCQIgbE43OCxBT9BnADUcb6Hzcg3tG9
         4yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=2mojTruAIAmsoVEsmXiWqXJVl//EbEHS8Fxgvp8PXyc=;
        b=YKrc2xx3Rwp7hNqMXK+0Zz/4ePOo6KyoEY9M9UmnfNG4klZTfb08bbiD4cITwlYCZa
         9eHPYGC4oZhGOLB/lhSGFZw+8WKeb+SON5eS08A4HTEk5hJ+AdDUSeck6a0hFBwFkEhE
         BJ9DtkxeJM8pAG5ksD9VSe4bmf5VwwBzxboE//f7eiSsEd+zNJDxSeqxNIr456KhpRID
         8E9Bke+Q9rZm+7WMU5DakHWw3nzmEWeyhGlhFxNVrgb96pw9dwwpfv5jUeSoqWd3iR1/
         rlBV6Q2/Uz4whbyLYZt4biNpFMdco99di7gSc1ZgBUmoRKC4n4FTGJhRg8KQ8jVsHQnZ
         l6Rg==
X-Gm-Message-State: ACrzQf2wxjfmzbVHfz8938/VNjQ0/WzDlOeBe7X9nahVMfN4hT+kBM5N
	qMdPgrlfTfv/BhaexQouquhE/MyEyT6NAg==
X-Google-Smtp-Source: AMsMyM5heBArK73zXUcpQgxt/b+liCYUw31JLc63rmEcRdC2GXR3xgHEKM9kUwgLwzI3bNxdMFueiQ==
X-Received: by 2002:a17:902:d717:b0:17f:6155:e578 with SMTP id w23-20020a170902d71700b0017f6155e578mr6835536ply.31.1664860324262;
        Mon, 03 Oct 2022 22:12:04 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (123-243-1-173.tpgi.com.au. [123.243.1.173])
        by smtp.gmail.com with ESMTPSA id e3-20020a17090301c300b001782f94f8ebsm8166534plh.3.2022.10.03.22.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 22:12:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s/interrupt: Change must-hard-mask interrupt check from BUG to WARN
Date: Tue,  4 Oct 2022 15:11:56 +1000
Message-Id: <20221004051157.308999-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Sachin Sant <sachinp@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This new assertion added is generally harmless and gets fixed up
naturally, but it does indicate a problem with MSR manipulation
somewhere.

Fixes: c39fb71a54f0 ("powerpc/64s/interrupt: masked handler debug check for previous hard disable")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index dafa275f18bc..d5d35f3a824e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2797,12 +2797,16 @@ masked_interrupt:
 #ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
 	/*
 	 * Ensure there was no previous MUST_HARD_MASK interrupt or
-	 * HARD_DIS setting.
+	 * HARD_DIS setting. If this does fire, the interrupt is still
+	 * masked and MSR[EE] will be cleared on return, so no need to
+	 * panic, but somebody probably enabled MSR[EE] under
+	 * PACA_IRQ_HARD_DIS, mtmsr(mfmsr() | MSR_x) being a common
+	 * cause.
 	 */
 	lbz	r9,PACAIRQHAPPENED(r13)
 	andi.	r9,r9,(PACA_IRQ_MUST_HARD_MASK|PACA_IRQ_HARD_DIS)
 0:	tdnei	r9,0
-	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__,0
+	EMIT_WARN_ENTRY 0b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 #endif
 	lbz	r9,PACAIRQHAPPENED(r13)
 	or	r9,r9,r10
-- 
2.37.2

