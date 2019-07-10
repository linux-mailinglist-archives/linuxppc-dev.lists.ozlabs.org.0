Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA464A4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 17:59:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kP4z6c06zDqcg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 01:59:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="epPp7Crw"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNHV2hjYzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:23:18 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 19so1268406pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aH9Od/uGcopCsR+aSiuxuN3b+LlKfbwQOdrrN08mV8E=;
 b=epPp7CrwBMnl6npV6+IRq5kEV+2GupHeXG4gCYS7yaWVlJK+yxjSV2jooNWYkkLJpl
 3w6EdWQTRaxrJDnreOVC6vZTLNmY7WIO+a9xaa4BAMB0kOXbTUIA1tdURa9IvBw+uc7q
 Nf0MAc+7i4imuFgSyboQwQv03bAHfyg96AmZ8PRnwctpCK1RsUnUjTUF/l/NV/YzcKvU
 l0HCcgT2tbNhpZeZgRuis0Kppcy/YyqtsgQNOBxhI3AaG064B8E3ge8nmEknoxQvfu5p
 VazRmJNkj4QM6QZM2OLxuEXVvuFsGcTbis+RQrwFZ0/ZE2nuJcF/z6dR9E5Whc0IvD84
 +5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aH9Od/uGcopCsR+aSiuxuN3b+LlKfbwQOdrrN08mV8E=;
 b=W4eBbndnK3jecfCSBkhbe9GFEpbgcKUFaeB4KW56UQuT1y49vWSKtnOtPIaCmTlGWW
 EfYK2XygOBrsthaEELNFGt+pnjwZh6ywks/gpZhMFw/8bvbRPFzsWFXmRJinlnpPp93K
 BYSqV5aQb5r0q5srHxNTu0ypdbnp5xCBQxgYcZTG6VJ483mNOhR6fvjYTDuxdoPUMUAH
 G1EqNVit1+HdF8midMcbkEv7KK54pcKBsWj2htRQHCI612PwKzbwOmYIthLE1asuBtnh
 iYOLUzhhiCFe7nxV/I4uNeZAiFDszCMv8Dq4m4WxT+a7eXCd7MUIeiFpwnfgKCRmx1j8
 dFZg==
X-Gm-Message-State: APjAAAVCegVTUfbngTzXRA3TryIETErW6crSEws9Vu+ntxF7b1dE+t+N
 FOfXDOfT/cMjM3j4wtXiWPKRsuZO6j8=
X-Google-Smtp-Source: APXvYqwb0+oV8Y8tcQynSvqcEgfC2MZLk+EfE3U/Ne8c7miM0deIQ3CtRNDwdnaumOkYzr5G7b7p3Q==
X-Received: by 2002:a17:90a:26a1:: with SMTP id
 m30mr7768847pje.59.1562772194835; 
 Wed, 10 Jul 2019 08:23:14 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.23.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:23:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 12/16] powerpc/64s/exception: machine check move tramp code
Date: Thu, 11 Jul 2019 01:19:46 +1000
Message-Id: <20190710151950.31906-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
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
index 3cc5ee6e4b56..9bb8c89e9e77 100644
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
2.20.1

