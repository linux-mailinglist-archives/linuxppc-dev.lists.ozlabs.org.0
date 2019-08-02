Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A0A7F5FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:29:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Q0W1Y0vzDqvt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:28:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eQMvHzmY"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PMK34qGzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 21:00:13 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n9so29674373pgc.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 04:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4VhLjw0LbltcdeWbfj/8QsGus8EnYQ5qUAM+qFkOwQ=;
 b=eQMvHzmYipWuUlRUqvVwc0X9HAPEIQYk7HyWP9Cf7M2oR+CdNCiHEcRPCJSqYGwzTf
 A7YHYHBXhl2Ma/isNELsunpMXB7680YrJODy086n4/mRrgZq1ZuoOEZ3vgqjZ9y1agIJ
 1isNo48IWMl6Y9Uu0Q3nhbhGMi5OLDq+8k8OL9M/NkSe7VWRZLcZ12tPhkVOX2/kktUF
 nIt786eYslQlDaMD/NT60VyIxPN5KRirUJDFu04lmkWgURnad/5LWW7+LxdateiQn5Tf
 uzGX+BWMDz+Pn1402f41Lxb8aRvfBwj45OgZKBGZGE8bA7JDkCk/pRJtknxl0+uhggtS
 v6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4VhLjw0LbltcdeWbfj/8QsGus8EnYQ5qUAM+qFkOwQ=;
 b=fUk/7bGYxKUJQO21bA+JGxTk4fEE6WmpepU6aLqD7LYNJIbpG0tLzFP/O07f4UiN9a
 CXHebCUt4iVMlD89Lppeko966udbJdmSJ4rCdqaPYu3+/Cc3Zxt2BF6F1G0Y8UFxPxVD
 Cm+zWGQ4ZrgxFrKLDWhmsymff8uXtLqQAzzruR2UVD8CJdJYvXbiWS6cmbDoLo1fXOeq
 hwv2Sx6q/CwOdVaF6/4j9DJFxyJ5k1Yxb56jHH1d0Cd9rr5bMLe8DMwigcVVvrT25ftq
 8tcUeKWI/aDUtuKP6r5D+cZDdV1wYMCskWtuuo6JodGdx47leDIec7mL2/kbocs7SQGF
 judw==
X-Gm-Message-State: APjAAAWqcqpqWlYJ+lG9JJSr5dL8JJ8vl2+XXeKvtSUOL2m5o/+jDmWR
 DQgarGMbzOXgXZURsd6SW1+rJIULw3g=
X-Google-Smtp-Source: APXvYqx4SeAkVPVD7Z/nPUtdqO2wD8RHCLVA+YZSVaUy285kUnLqfMoha4iwYj3Hfeob0h/Xl/2ZYQ==
X-Received: by 2002:a17:90a:f491:: with SMTP id
 bx17mr3871320pjb.118.1564743609270; 
 Fri, 02 Aug 2019 04:00:09 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.04.00.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 04:00:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/44] powerpc/64s/exception: machine check move tramp code
Date: Fri,  2 Aug 2019 20:56:37 +1000
Message-Id: <20190802105709.27696-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802105709.27696-1-npiggin@gmail.com>
References: <20190802105709.27696-1-npiggin@gmail.com>
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

Following convention, move the tramp code (unrelocated) above the
common handlers (relocated).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 527a76aa0832..20fcc17832b5 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -945,6 +945,17 @@ EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
 
+#ifdef CONFIG_PPC_PSERIES
+TRAMP_REAL_BEGIN(machine_check_fwnmi)
+	/* See comment at machine_check exception, don't turn on RI */
+	EXCEPTION_PROLOG_0 PACA_EXMC
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
+	mfctr	r10		/* save ctr */
+	BRANCH_TO_C000(r11, machine_check_early_common)
+#endif
+
+TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
+
 EXC_COMMON_BEGIN(machine_check_early_common)
 	mtctr	r10			/* Restore ctr */
 	mfspr	r11,SPRN_SRR0
@@ -1018,17 +1029,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	b	1b
 	b	.	/* prevent speculative execution */
 
-#ifdef CONFIG_PPC_PSERIES
-TRAMP_REAL_BEGIN(machine_check_fwnmi)
-	/* See comment at machine_check exception, don't turn on RI */
-	EXCEPTION_PROLOG_0 PACA_EXMC
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
-	mfctr	r10		/* save ctr */
-	BRANCH_TO_C000(r11, machine_check_early_common)
-#endif
-
-TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
-
 EXC_COMMON_BEGIN(machine_check_common)
 	/*
 	 * Machine check is different because we use a different
-- 
2.22.0

